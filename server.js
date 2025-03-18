// Khi bắt đầu dự án thì file này sẽ chạy đầu tiên
// console.log('Hello World!');
// Khi chạy lệnh node server.js thì
// Kết quả trả về là Hello World!

// Để chạy server thì cần phải cài đặt thư viện express
import express from 'express';

// Khởi tạo server
const app = express();

//Tạo api
app.get( `/`, (request, response, next) => {
    // response: giúp trả về dữ liệu cho client
    // request: giúp lấy dữ liệu từ client gửi lên
    response.send('Hello World!');
}
);

// Lắng nghe các request tới server
app.listen(3069, () => {
    console.log(`Server online at http://localhost:3069`);
}
);