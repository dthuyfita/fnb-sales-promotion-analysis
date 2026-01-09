# F&B Sales & Promotion Analysis
## Tổng quan dự án
Dự án này phân tích dữ liệu bán hàng giả lập của một doanh nghiệp F&B nhằm đánh giá hiệu quả hoạt động của các cửa hàng và tác động của chương trình khuyến mại tới:
- Số đơn hàng
- Doanh thu
- Giá trị đơn hàng trung bình (AOV)
Mục tiêu là đưa ra insight và đề xuất hỗ trợ quyết định kinh doanh.
## Mô tả dữ liệu
Dữ liệu gồm 4 bảng chính:
1. sales_transactions
order_id: Mã đơn hàng
store_id: Mã cửa hàng
product_id: Mã sản phẩm
quantity: Số lượng bán
unit_price: Giá bán
promo_id: Mã khuyến mại (NULL nếu không áp dụng)
order_date: Ngày đặt hàng
2. stores
store_id: Mã cửa hàng
store_name: Tên cửa hàng
location: Khu vực
3. products
product_id: Mã sản phẩm
product_name: Tên sản phẩm
category: Nhóm sản phẩm
4. promotions
promo_id: Mã khuyến mại
promo_name: Tên chương trình
discount_rate: Tỷ lệ giảm giá

## Mục tiêu phân tích
- Tính doanh thu, số đơn hàng, AOV
- So sánh hiệu quả có khuyến mại / không khuyến mại
- Phân tích các chỉ số theo từng cửa hàng
- Đánh giá khuyến mại có thực sự giúp tăng doanh thu hay không

## Công cụ
- Excel: Làm sạch dữ liệu, Pivot Table, Dashboard
- SQL (SQL Server):
SELECT, JOIN, GROUP BY
COUNT(DISTINCT)
CASE WHEN
- GitHub: Lưu trữ và trình bày dự án

## Nội dung chính
- Phân tích doanh thu, số đơn hàng, AOV
- So sánh hiệu quả khuyến mại và không khuyến mại
- Phân tích chi tiết theo từng cửa hàng

## Insight chính
- Chạy khuyến mại không làm tăng số đơn hàng tại các cửa hàng.
- AOV khi chạy khuyến mại thấp hơn nhẹ so với khi không chạy.
- Một số cửa hàng doanh thu giảm khi áp dụng khuyến mại.
- AOV cao chưa chắc đã tốt nếu số lượng đơn hàng thấp.

## Đề xuất kinh doanh
- Không nên triển khai khuyến mại đại trà trên toàn bộ cửa hàng mà nên chạy khuyến mại tại một số cửa hàng nhất định và thời điểm phù hợp.
- Phân tích sâu hơn: Loại hình khuyến mại, Đối tượng khách hàng, Thời gian khách đặt hàng trong ngày, Sử dụng khuyến mại để đẩy các mặt hàng bán chậm thay vì giảm giá toàn bộ.

## Hướng phát triển tiếp theo
- Bổ sung dữ liệu khách hàng để phân tích hành vi
- Phân tích hiệu quả khuyến mại theo từng nhóm sản phẩm
- Xây dựng dashboard tương tác bằng Power BI/Tableau
