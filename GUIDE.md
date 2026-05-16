# 📚 Hướng dẫn sử dụng OpenProject cho Team IT

Chào mừng bạn đến với hệ thống quản lý dự án **OpenProject**. Đây là một công cụ mạnh mẽ, cung cấp nhiều tính năng hơn Trello, từ theo dõi tiến độ (Agile Boards), quản lý thời gian, đến biểu đồ Gantt.

Tài liệu này sẽ hướng dẫn bạn các khái niệm cơ bản và cách tùy biến OpenProject để phù hợp với nhu cầu công việc của team IT.

---

## 1. Các Khái Niệm Cơ Bản (So sánh với Trello)

Để dễ hình dung khi chuyển từ Trello sang OpenProject, hãy xem bảng quy đổi sau:

| Trello | OpenProject | Giải thích |
|---|---|---|
| **Board** | **Project** (hoặc Board view) | Mỗi dự án lớn sẽ là một Project. Bạn có thể tạo nhiều "Boards" (bảng) nhỏ bên trong một Project. |
| **List (Cột)** | **Status** (Trạng thái) | Các cột "To Do", "Doing", "Done" trong Trello tương ứng với Status của công việc. |
| **Card (Thẻ)** | **Work Package** (Gói công việc) | Đơn vị công việc cơ bản. Một Work Package có thể là: Task (Nhiệm vụ), Bug (Lỗi), Feature (Tính năng mới), Milestone (Cột mốc)... |
| **Checklist** | **Subtasks** | Bạn có thể tạo các Work Package con bên trong một Work Package cha. |

---

## 2. Thiết Lập Hệ Thống Lần Đầu (Dành cho Admin)

### 2.1 Thay Đổi Giao Diện và Logo (Branding)
Bạn có thể biến OpenProject mang đậm màu sắc của công ty bạn:
1. Đăng nhập bằng tài khoản `admin`.
2. Bấm vào biểu tượng Avatar ở góc trên cùng bên phải -> Chọn **Administration** (Quản trị).
3. Tìm đến phần **Design** (hoặc **System settings** -> **Display**).
4. Tại đây bạn có thể: Tải lên Logo công ty, Đổi màu chủ đạo (Primary color), màu Header để phù hợp với bộ nhận diện thương hiệu.

### 2.2 Quản Lý Người Dùng và Phân Quyền (Roles)
1. Vào **Administration** -> **Users & Permissions** -> **Roles and permissions**.
2. Tại đây có các role mặc định như: `Project admin`, `Member`, `Reader`. Bạn có thể chỉnh sửa quyền cho từng role (ví dụ: Ai được phép tạo Task mới, ai chỉ được xem...).
3. Để mời thành viên IT vào: Vào **Users** -> bấm **+ User** để tạo tài khoản cho đồng nghiệp.

---

## 3. Tùy Chỉnh Template Công Việc (Work Packages)

Một trong những điểm mạnh nhất của OpenProject là khả năng tạo các "Template" (Mẫu công việc) rất chi tiết.

### 3.1 Custom Fields (Thêm Trường Dữ Liệu Riêng)
Nếu mặc định của OpenProject không đủ, bạn có thể tự tạo các trường dữ liệu riêng (Ví dụ: Thêm ô "Môi trường lỗi" để team QA điền vào: Prod/Staging/Dev).
1. Vào **Administration** -> **Custom actions & fields** -> **Custom fields**.
2. Chọn loại field là **Work packages**. Bấm **+ New custom field**.
3. Đặt tên (VD: Môi trường lỗi), chọn định dạng (List - danh sách xổ xuống).
4. Lưu lại.

### 3.2 Tùy Chỉnh Form Hiển Thị (Form Configuration)
Bạn có thể sắp xếp form tạo Task trông gọn gàng hơn:
1. Vào **Administration** -> **Work packages** -> **Types**.
2. Bấm vào loại công việc (Ví dụ: `Task` hoặc `Bug`).
3. Chuyển sang tab **Form configuration**.
4. Kéo thả để sắp xếp các trường thông tin (thêm Custom field bạn vừa tạo ở trên vào nhóm phù hợp).

---

## 4. Cách Sử Dụng Bảng Kéo Thả (Agile Boards)

Team IT thường quen dùng Agile (Scrum/Kanban). Để bật tính năng này:
1. Vào dự án của bạn (Ví dụ: "Dự án Nâng cấp Hệ thống").
2. Chọn mục **Boards** trên menu bên trái (Nếu không thấy, vào Project settings -> Modules -> Bật `Boards` lên).
3. Bấm **+ Board**. Bạn sẽ có 2 lựa chọn chính:
   - **Basic board**: Bạn tự tạo các cột (lists) theo ý muốn (Giống y hệt Trello).
   - **Action board (Status board)**: Các cột được tự động nhóm theo trạng thái (Mới, Đang xử lý, Hoàn thành). Kéo thẻ sang cột khác sẽ tự động thay đổi trạng thái của Task đó.

---

## 5. Mẹo Tối Ưu Cho Team IT
- **Liên kết Github/GitLab**: OpenProject có thể tích hợp với Git để tự động link các commit vào Work Package (Ví dụ commit message: `Fixes #1234` sẽ tự động đóng Work Package ID 1234).
- **Time Tracking**: Yêu cầu team "Log time" (ghi nhận thời gian) trên mỗi task để quản lý được thời gian bỏ ra cho dự án.
- **Gantt Chart**: Mở tab **Gantt charts** để lên lịch và xem Timeline cho các dự án lớn của toàn công ty.

Hãy thử tạo một Dự Án Nháp (Demo Project), tạo thử vài Work Package và Board để làm quen nhé!
