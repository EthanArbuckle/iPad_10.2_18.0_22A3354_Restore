@implementation ACMLocale_ko

- (ACMLocale_ko)init
{
  ACMLocale_ko *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_ko;
  v2 = -[ACMLocale_ko init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("암호 필드가 비어있음"), CFSTR("취소"), CFSTR("로그인"), CFSTR("보내기"), CFSTR("승인"), CFSTR("부적절한 방법이 요청되었습니다. AppleConnect 로그인 대화상자는 숨길 수 없습니다."), CFSTR("매개변수가 유효하지 않습니다. 입력 매개변수 중 일부가 잘못 설정되었습니다."), CFSTR("Apple ID 암호"), CFSTR("오프라인인 것으로 보입니다. 인터넷에 연결하고 다시 시도하십시오."), CFSTR("입력한 Apple ID 또는 암호가 올바르지 않습니다."), CFSTR("2단계 확인이 필요하지만 사용자 상호작용은 허용되지 않습니다."), CFSTR("신뢰하는 기기"), CFSTR("신뢰하는 기기를 관리하려면 Mac 또는 PC에서 %@ 페이지를 방문하십시오."), CFSTR("유효한 서비스 티켓 생성 실패"), CFSTR("2단계 확인 응답이 비어 있습니다."), CFSTR("전화 번호로 SMS 보내기"), CFSTR("신원 확인에 사용할 수 있는 임시 코드를 아래의 선택한 기기로 보냅니다."),
           CFSTR("메모리 부족"),
           CFSTR("john.appleseed"),
           CFSTR("%@(으)로 코드 보내기"),
           CFSTR("예기치 않은 메소드 호출"),
           CFSTR("코드 확인에 너무 많이 실패했습니다. 다른 기기로 새 코드를 보내거나 나중에 다시 시도하십시오."),
           CFSTR("확인용 데이터 토큰이 유효하지 않습니다."),
           CFSTR("응용 프로그램에 의해 인증이 취소됨"),
           CFSTR("유효하지 않은 암호 길이"),
           CFSTR("확인 코드"),
           CFSTR("이 계정은 보안상의 이유로 비활성화되었습니다. %@ 에서 암호를 재설정할 수 있습니다."),
           CFSTR("메시지를 받을 수 있는 기기가 없습니까?"),
           CFSTR("새 코드 보내기"),
           CFSTR("오류가 발생했습니다. 나중에 다시 시도하십시오."),
           CFSTR("필수사항"),
           CFSTR("해당 사용자를 찾을 수 없습니다."),
           CFSTR("확인 코드 입력"),
           CFSTR("기기를 찾을 수 없습니다."),
           CFSTR("Apple ID"),
           CFSTR("이 Apple ID에 대한 2단계 확인이 활성화되었습니다."),
           CFSTR("토큰을 확인할 수 없습니다."),
           CFSTR("암호"),
           CFSTR("보안 유지를 위해 암호를 재설정할 시기가 되었습니다. %@ 에서 쉽게 재설정할 수 있습니다."),
           CFSTR("이 기기의 현재 시간이 잘못된 것 같습니다. 설정 > 일반 > 날짜와 시간에서 시간을 수정한 다음 다시 시도하십시오."),
           CFSTR("유효한 SSO 토큰 생성 실패"),
           CFSTR("입력한 확인 코드가 유효하지 않습니다."),
           CFSTR("계속"),
           CFSTR("신원 확인"),
           CFSTR("시스템에 의해 인증이 취소됨"),
           CFSTR("%@(으)로 코드 생성"),
           CFSTR("기기 목록이 비어 있습니다."),
           CFSTR("세션이 유효하지 않습니다."),
           CFSTR("서버 응답이 정상적이지 않습니다."),
           CFSTR("전화번호를 확인하기 위해 너무 많은 코드를 보냈습니다. 나중에 다시 시도하십시오."),
           CFSTR("끝자리가 %@인 전화 번호"),
           CFSTR("계정 이름 또는 암호를 잘못 입력했습니다."),
           CFSTR("Apple ID를 입력하지 않음"),
           CFSTR("iForgot…"),
           CFSTR("죄송합니다. 신원 확인에 너무 많이 실패했습니다. 보안상의 이유로 복구 키가 없으면 앞으로 8시간 동안 계정 정보를 변경할 수 없습니다."),
           CFSTR("기기 정보가 없습니다."),
           CFSTR("ID 또는 암호를 잊으셨습니까?"),
           CFSTR("이 Apple ID는 보안상의 이유로 비활성화되었습니다. %@ 에서 암호를 재설정할 수 있습니다."),
           CFSTR("Touch ID를 사용하여 %@(으)로 인증"),
           CFSTR("사용자에 의해 인증이 취소됨"),
           CFSTR("%@(으)로 끝나는 번호"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_ko;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
