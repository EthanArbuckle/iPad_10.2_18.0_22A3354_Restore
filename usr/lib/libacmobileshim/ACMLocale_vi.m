@implementation ACMLocale_vi

- (ACMLocale_vi)init
{
  ACMLocale_vi *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_vi;
  v2 = -[ACMLocale_vi init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Password field is empty"), CFSTR("Cancel"), CFSTR("Sign In"), CFSTR("Send"), CFSTR("OK"), CFSTR("Improper call of the method. AppleConnect SignIn dialog cannot be hidden."), CFSTR("Invalid Parameters. Some of input parameters are set incorrectly."), CFSTR("Apple ID password"), CFSTR("You appear to be offline. Please connect to the Internet and try again."), CFSTR("Your Apple ID or password was entered incorrectly."), CFSTR("Two-step verification required, but user interaction is not allowed."), CFSTR("TRUSTED DEVICES"), CFSTR("To manage your trusted devices visit %@ from a Mac or PC."), CFSTR("Failed to create valid service ticket"), CFSTR("Two-step verification response is empty."), CFSTR("SMS to Phone Number"), CFSTR("The device you select below will be sent a temporary code that you can use to verify your identity."),
           CFSTR("Out of Memory"),
           CFSTR("john.appleseed"),
           CFSTR("Send code to %@"),
           CFSTR("Unexpected method invocation"),
           CFSTR("You failed to verify the code too many times. Please send a new code to a different device or try again later."),
           CFSTR("Invalid Data Token. Data Token for verify is not valid."),
           CFSTR("Authentication was canceled by application"),
           CFSTR("Invalid passcode length"),
           CFSTR("Verification Code"),
           CFSTR("This account name has been disabled for security reasons. You can reset your password at %@."),
           CFSTR("Unable to receive messages at any of your devices?"),
           CFSTR("Send a new code"),
           CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."),
           CFSTR("Required"),
           CFSTR("Cannot find this person."),
           CFSTR("Enter verification code"),
           CFSTR("Device is not found."),
           CFSTR("Apple ID"),
           CFSTR("Two-step verification is enabled for this Apple ID."),
           CFSTR("Can not verify token."),
           CFSTR("Password"),
           CFSTR("To protect your security, it’s time to reset your password. It’s easy, just go to %@."),
           CFSTR("The current time on this device seems to be incorrect. You can fix it by going to Settings > General > Date & Time, then try again."),
           CFSTR("Failed to create valid SSO token"),
           CFSTR("The verification code you entered is not valid."),
           CFSTR("Continue"),
           CFSTR("Verify Identity"),
           CFSTR("Authentication was canceled by system"),
           CFSTR("Generate code with %@"),
           CFSTR("Device list is empty."),
           CFSTR("Invalid Session."),
           CFSTR("Response from server is malformed"),
           CFSTR("You have sent too many codes to verify your phone number. Please try again later."),
           CFSTR("phone ending in %@"),
           CFSTR("Your account name or password was entered incorrectly."),
           CFSTR("Apple ID field is empty"),
           CFSTR("iForgot…"),
           CFSTR("Sorry, but you have made too many unsuccessful attempts to verify your identity. For security reasons, you will not be able to make changes to your account for the next eight hours without your Recovery Key."),
           CFSTR("No Device information available."),
           CFSTR("Forgot your ID or Password?"),
           CFSTR("This Apple ID has been disabled for security reasons. You can reset your password at %@."),
           CFSTR("Authenticate as %@ with Touch ID"),
           CFSTR("Authentication was canceled by user"),
           CFSTR("Number ending in %@"));
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Ô mật khẩu đang trống"), CFSTR("Hủy bỏ"), CFSTR("Đăng nhập"), CFSTR("Gửi"), CFSTR("OK"), CFSTR("Phương thức gọi không hợp lệ. Không thể ẩn cuộc đối thoại AppleConnect SignIn."), CFSTR("Thông số Không hợp lệ. Vài thông số đã nhập không được cài đặt chính xác."), CFSTR("Mật khẩu của ID Apple"), CFSTR("Bạn đang ngoại tuyến. Vui lòng kết nối Internet và thử lại."), CFSTR("Bạn đã nhập ID Apple hoặc mật khẩu không chính xác. "), CFSTR("Yêu cầu xác minh hai bước nhưng không cho phép người dùng tương tác."), CFSTR("THIẾT BỊ TIN CẬY"), CFSTR("Để quản lý thiết bị tin cậy của bạn, hãy truy cập %@ từ máy Mac hoặc máy vi tính."), CFSTR("Không tạo được phiếu dịch vụ hợp lệ"), CFSTR("Phản hồi xác minh hai bước đang trống."), CFSTR("Gửi tin nhắn SMS đến Số Điện Thoại"), CFSTR("Mã tạm thời sẽ được gửi đến thiết bị được chọn dưới đây, bạn có thể sử dụng mã để xác minh nhận dạng của mình."),
           CFSTR("Hết bộ nhớ"),
           CFSTR("trần.thủy"),
           CFSTR("Gửi mã đến %@"),
           CFSTR("Phương pháp yêu cầu hỗ trợ ngoài dự kiến"),
           CFSTR("Bạn đã xác minh mã quá nhiều lần không thành công. Vui lòng gửi mã mới đến một thiết bị khác hoặc thử lại sau."),
           CFSTR("Mã thông báo Dữ liệu Không hợp lệ. Mã thông báo Dữ Liệu để xác minh không hợp lệ."),
           CFSTR("Xác thực đã bị hủy bởi ứng dụng"),
           CFSTR("Độ dài mật khẩu không hợp lệ"),
           CFSTR("Mã Xác Minh"),
           CFSTR("ID Apple này đã bị tắt vì lý do bảo mật. Bạn có thể cài đặt lại mật khẩu tại %@."),
           CFSTR("Bạn không nhận được thông điệp trên mọi thiết bị của mình?"),
           CFSTR("Gửi mã mới"),
           CFSTR("Đã xảy ra lỗi. Cám ơn bạn đã kiên nhẫn chờ đợi, vui lòng thử lại sau."),
           CFSTR("Yêu cầu"),
           CFSTR("Không thể tìm người này."),
           CFSTR("Nhập mã xác minh"),
           CFSTR("Không tìm thấy thiết bị."),
           CFSTR("ID Apple"),
           CFSTR("Xác minh hai bước đã được kích hoạt cho ID Apple này."),
           CFSTR("Không thể xác minh mã thông báo."),
           CFSTR("Mật khẩu"),
           CFSTR("Để tăng cường bảo mật, bạn nên đặt lại mật khẩu. Hãy vào %@."),
           CFSTR("Giờ hiện tại trên thiết bị này có thể không đúng. Bạn có thể đổi giờ bằng cách vào Cài Đặt > Cài đặt Chung > Ngày & Giờ, sau đó thử lại."),
           CFSTR("Không tạo được mã thông báo SSO hợp lệ"),
           CFSTR("Mã xác minh bạn đã nhập không hợp lệ."),
           CFSTR("Tiếp tục"),
           CFSTR("Xác Minh Nhận Dạng"),
           CFSTR("Xác thực đã bị hủy bởi hệ thống"),
           CFSTR("Tạo mã với %@"),
           CFSTR("Danh sách thiết bị đang trống."),
           CFSTR("Phiên Không Hợp Lệ."),
           CFSTR("Phản hồi từ máy chủ không đúng dạng"),
           CFSTR("Bạn đã gửi quá nhiều mã để xác minh số điện thoại của bạn. Vui lòng thử lại sau."),
           CFSTR("số điện thoại tận cùng bằng %@"),
           CFSTR("Tên tài khoản hoặc mật khẩu của bạn đã nhập không đúng."),
           CFSTR("Ô ID Apple đang trống"),
           CFSTR("iForgot…"),
           CFSTR("Rất tiếc là bạn đã thử xác minh nhận dạng quá nhiều lần không thành công. Vì lý do bảo mật, bạn sẽ không thể tạo thay đổi trên tài khoản trong vòng tám giờ tới nếu bạn không có Mã Khôi Phục."),
           CFSTR("Thông tin Thiết Bị không khả dụng."),
           CFSTR("Quên ID hoặc Mật khẩu?"),
           CFSTR("ID Apple này đã bị tắt vì lý do bảo mật. Bạn có thể cài đặt lại mật khẩu tại %@."),
           CFSTR("Xác nhận là %@ Với Touch ID"),
           CFSTR("Xác thực đã bị hủy bởi người dùng"),
           CFSTR("Số tận cùng bằng %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_vi;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
