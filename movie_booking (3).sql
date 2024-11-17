-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2024 at 04:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `movie_id` int(11) UNSIGNED NOT NULL,
  `seats` varchar(50) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cinemas`
--

CREATE TABLE `cinemas` (
  `cinema_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`cinema_id`, `name`, `address`) VALUES
(1, 'BabyNoodle Cinema', '69 Trần Phú, P. An Phú, An Khê, Gia Lai'),
(2, 'GoldFish Cinema', '52A Tăng Bạt Hổ, P. Lê lợi, Quy Nhơn, Bình Định'),
(3, 'CapriCorn Cinema', 'Hùng Vương, I, TP. Phan Thiết, Bình Thuận'),
(4, 'TheZoo Cinema', '1 Đ. Phú Lợi, Phú Hòa, Thủ Dầu Một, Bình Dương'),
(5, 'Horizon Cinema', '512A Nguyễn An Ninh, Vũng Tàu, Bà Rịa - Vũng Tàu');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movies_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `showtimes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`showtimes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movies_id`, `title`, `image`, `link`, `year`, `genre`, `rating`, `description`, `releaseDate`, `duration`, `showtimes`) VALUES
(1, 'Nhà Bà Nữ ', 'https://boxofficevietnam.com/wp-content/uploads/2023/01/NBN_MAIN-POSTER_compress.jpg', 'https://youtu.be/BS8aVvVTAh8?si=PhQLxcsdLWd7CcA5', '2023', 'Comedy', 8.5, 'Câu chuyện xoay quanh gia đình bà Nữ gồm ba thế hệ sống cùng nhau trong một ngôi nhà. Bà Nữ một tay cáng đáng mọi sự, nổi tiếng với quán bánh canh cua và cũng khét tiếng với việc kiểm soát cuộc sống của tất cả mọi người, từ con gái đến con rể. Mọi chuyện diễn ra bình thường cho đến khi cô con gái út si mê anh chàng điển trai xuất thân từ một gia đình giàu có. Truyện phim khắc họa mối quan hệ phức tạp, đa chiều xảy ra với các thành viên trong gia đình.', '2023-01-15', '120 min', '[\"11:00\", \"14:00\", \"17:00\"]'),
(2, 'Em Và Trịnh', 'https://vinalab.org.vn/Upload/news/em-va-trinh-hien-tuong.jpg\r\n', 'https://youtu.be/zzik4JB9D1Q?si=M-kq5C_6Cs4A5n-7', '2023', 'Biography/Music', 8.7, 'Cuộc gặp gỡ định mệnh giữa Trịnh Công Sơn và Michiko mở ra chuyến hành trình ngược về thanh xuân, khám phá mối tình với các \"nàng thơ\" trong sáng tác của nhạc sĩ tài hoa.', '2023-02-10', '130 min', '[\"12:00\", \"15:00\", \"18:00\"]'),
(3, 'Chị Chị Em Em', 'https://m.media-amazon.com/images/M/MV5BNzZmNDA0ZWEtNTNmNS00MjczLWFiYjEtNDZhNzBlYjY2MTI2XkEyXkFqcGc@._V1_.jpg\r\n', 'https://youtu.be/0lA5BJuiVGU?si=oUe5OjFzO4g-yQal', '2023', 'Drama', 7.5, 'Đây là bộ phim tâm lý, khám phá câu chuyện tình yêu xoay quanh hai người phụ nữ xinh đẹp - Thiên Kim và Bảo Nhi. Đối mặt trong một cuộc chơi mà chỉ có một người chiến thắng, khi hạnh phúc của tổ ấm nhỏ sắp bị bão cuốn đi, ai sẽ quyết liệt đấu tranh cho những gì mình muốn và ai sẽ cam chịu để giữ bình yên?', '2023-03-05', '115 min', '[\"13:00\", \"16:00\", \"19:00\", \"22:00\"]'),
(4, 'Con Nhót Mót Chồng', 'https://rapchieuphim.com/photos/movie/chuyen-xom-tui-con-nhot-mong-chong-poster.jpg\r\n', 'https://youtu.be/zi1V9sEblCM?si=sdZI9FEEFljyOUU-', '2023', 'Romance', 8.0, 'Bộ phim là câu chuyện của Nhót - người phụ nữ “chưa kịp già” đã sắp bị mãn kinh, vội vàng đi tìm chồng. Nhưng sâu thẳm trong cô, là khao khát muốn có một đứa con và luôn muốn hàn gắn với người cha suốt ngày say xỉn của mình..', '2023-04-20', '110 min', '[\"10:00\", \"13:30\", \"16:30\"]'),
(5, ' Bố GIà', 'https://image.baophapluat.vn/w840/Uploaded/2024/dwkoudxkedwwyqdw/2021_12_07/262987760-461351915352699-2808380870956161548-n-410e39ff-5163.jpg\r\n', 'https://youtu.be/jluSu8Rw6YE?si=eEPClUcMRw8Dz9K0', '2021', 'Comedy/Drama', 9.0, 'Chiếc trailer hội tụ đủ mọi cung bậc cảm xúc, bà con đã chuẩn bị cho một cái Tết bao xôm, bao dzui, bao hoan hỉ cùng xóm Bố Già tụi tui chưa? Hài thì hài banh nóc mà bật kênh \"đíp\" là cũng thấm dữ lắm nghen.\r\n', '2021-01-01', '140 min', '[\"11:30\", \"14:30\", \"17:30\", \"20:30\"]'),
(7, 'Đôi Bạn Học Yêu', 'https://image.voh.com.vn/voh/image/2024/11/08/review-phim-doi-ban-hoc-yeu-kim-go-eun-noh-sang-hyun20241108-182247-007-182542.jpg?t=o', 'https://youtu.be/EIARKqcXILM?si=FgEXOxdeSAMskBcC', '2024', 'Comedy, romance', 8.6, '\r\nBộ phim xoay quanh đôi bạn ngỗ nghịch Jae-hee và Heung-soo cùng những khoảnh khắc “dở khóc dở cười” khi cùng chung sống trong một ngôi nhà. \r\nJae-hee là một cô gái “cờ xanh” với tâm hồn tự do, sống hết mình với tình yêu. Ngược lại, Heung-soo lại là một “cờ đỏ” chính hiệu khi cho rằng tình yêu là sự lãng phí cảm xúc không cần thiết. \r\nBỏ qua những tin đồn lan tràn do người khác tạo ra, Jae-hee và Heung-soo chọn sống và yêu theo cách riêng của họ. Hai quan điểm tình yêu trái ngược sẽ đẩy cả hai sang những ngã rẽ và kết cục cuộc sống khác nhau. Sau cùng, Jae-hee hay Heung-soo sẽ về đích trong hành trình “học yêu” này?', '2024-11-08', '118 min', '[\"11:30\", \"14:30\", \"17:30\", \"20:30\"]'),
(8, 'OZI: PHI VỤ RỪNG XANH', 'https://www.venuscinema.vn/uploaded/phim/phi%20vu%20rung%20xanh.jpg', 'https://youtu.be/tyHPFFnDuZY?si=BM3-BDOVDIkrnNxH', '2024', 'Animation', 9.0, 'Câu chuyện xoay quanh Ozi, một cô đười ươi mồ côi có tầm ảnh hưởng, sử dụng những kỹ năng học được để bảo vệ khu rừng và ngôi nhà của mình khỏi sự tàn phá của nạn phá rừng. Đây là một bộ phim đầy hy vọng, truyền cảm hứng cho thế hệ trẻ mạnh dạn cất tiếng nói và hành động để bảo vệ ngôi nhà chung quý giá.', '2024-11-15', '87 min', '[\"10:00\", \"13:30\", \"16:30\"]');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cinema_id` bigint(20) UNSIGNED NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `seat_type` varchar(50) NOT NULL,
  `is_booked` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `hoten` varchar(225) NOT NULL,
  `ngaysinh` date NOT NULL,
  `sdt` int(11) NOT NULL,
  `matkhau` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `hoten`, `ngaysinh`, `sdt`, `matkhau`) VALUES
(6, 'Lê Ny Na', '2004-08-30', 348999999, 'Na22824@'),
(7, 'Tiêu Thị Phương Nhung', '2004-01-09', 348999945, 'Nhung2004@'),
(8, 'Lê Thị Thu Hảo', '2004-09-28', 344444324, 'Hao2004@'),
(9, 'Lương Quang Dũng', '2004-04-14', 567822334, 'Dung2004@'),
(10, 'Nguyễn Quốc Thanh', '2004-06-02', 97665223, 'Thanh2004@'),
(22, 'aaaaa', '1999-02-03', 344444444, 'AAA'),
(24, 'A', '2003-11-17', 455555643, '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`cinema_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movies_id`) ON DELETE CASCADE;

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`cinema_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
