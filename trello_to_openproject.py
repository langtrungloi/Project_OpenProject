import json
import csv
import sys
import os

def convert_trello_json_to_csv(json_file_path, csv_file_path):
    if not os.path.exists(json_file_path):
        print(f"Lỗi: Không tìm thấy file {json_file_path}")
        return

    with open(json_file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # Lấy thông tin các cột (lists)
    lists_map = {}
    if 'lists' in data:
        for lst in data['lists']:
            lists_map[lst['id']] = lst['name']

    # Chuẩn bị dữ liệu để ghi ra CSV
    csv_data = []
    # Các trường cơ bản cho OpenProject: Subject (Tên task), Description, Status (Trạng thái)
    headers = ['Subject', 'Description', 'Status']

    if 'cards' in data:
        for card in data['cards']:
            if card.get('closed', False):
                continue # Bỏ qua thẻ đã lưu trữ
            
            subject = card.get('name', '')
            desc = card.get('desc', '')
            list_id = card.get('idList', '')
            status = lists_map.get(list_id, 'New')

            csv_data.append([subject, desc, status])

    # Ghi ra file CSV
    with open(csv_file_path, 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        writer.writerows(csv_data)

    print(f"✅ Đã chuyển đổi thành công {len(csv_data)} thẻ Trello!")
    print(f"📁 File CSV được lưu tại: {csv_file_path}")
    print("👉 Bây giờ bạn có thể upload file CSV này lên OpenProject (Module Work packages -> More -> Import).")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Sử dụng: python3 trello_to_openproject.py <đường_dẫn_file_trello.json>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = "openproject_import.csv"
    convert_trello_json_to_csv(input_file, output_file)
