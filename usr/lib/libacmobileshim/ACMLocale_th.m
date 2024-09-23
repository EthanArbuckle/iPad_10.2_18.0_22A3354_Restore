@implementation ACMLocale_th

- (ACMLocale_th)init
{
  ACMLocale_th *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_th;
  v2 = -[ACMLocale_th init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("ช่องรหัสผ่านว่างอยู่"), CFSTR("ยกเลิก"), CFSTR("เข้าสู่ระบบ"), CFSTR("ส่ง"), CFSTR("ตกลง"), CFSTR("มีการเรียกใช้วิธีดำเนินการอย่างไม่ถูกต้อง ไม่สามารถซ่อนกล่องโต้ตอบการลงชื่อเข้าใช้ AppleConnect ได้"), CFSTR("พารามิเตอร์ไม่ถูกต้อง มีการตั้งค่าพารามิเตอร์อินพุทบางรายการไม่ถูกต้อง"), CFSTR("รหัสผ่าน Apple ID"), CFSTR("คุณมีสถานะออฟไลน์อยู่ โปรดเชื่อมต่อเข้าอินเทอร์เน็ต และลองอีกครั้ง"), CFSTR("Apple ID หรือรหัสผ่านของคุณที่คุณป้อนไม่ถูกต้อง"), CFSTR("ต้องใช้การตรวจสอบยืนยันสองขั้นตอน แต่ไม่อนุญาตให้ผู้ใช้มีการโต้ตอบ"), CFSTR("อุปกรณ์ที่เชื่อถือได้"), CFSTR("ในการจัดการอุปกรณ์ที่เชื่อถือได้ โปรดไปที่ %@ จากเครื่อง Mac หรือ PC"), CFSTR("ล้มเหลวในการสร้างบัตรผ่านของการบริการที่ถูกต้อง"), CFSTR("ผลการตอบสนองต่อการตรวจสอบยืนยันสองขั้นตอนว่างเปล่า"), CFSTR("ส่ง SMS ถึงหมายเลขโทรศัพท์"), CFSTR("จะมีการส่งรหัสชั่วคราวไปยังอุปกรณ์ที่คุณเลือกด้านล่าง ซึ่งคุณสามารถใช้ยืนยันตัวตนของคุณ"),
           CFSTR("หน่วยความจำไม่เพียงพอ"),
           CFSTR("john.appleseed"),
           CFSTR("ส่งรหัสไปยัง \"%@\"),
           CFSTR("การเรียกวิธีการ (Method Invocation) ที่ไม่คาดคิดเกิดขึ้น"),
           CFSTR("คุณยืนยันรหัสไม่สำเร็จหลายครั้ง โปรดส่งรหัสใหม่ไปยังอุปกรณ์อื่นหรือลองอีกครั้งในภายหลัง"),
           CFSTR("โทเค็นข้อมูลไม่ถูกต้อง โทเค็นข้อมูลสำหรับตรวจสอบยืนยันไม่ถูกต้อง"),
           CFSTR("การรับรองความถูกต้องถูกยกเลิกโดยแอปพลิเคชัน"),
           CFSTR("ความยาวของรหัสผ่านไม่ถูกต้อง"),
           CFSTR("รหัสการตรวจสอบยืนยัน"),
           CFSTR("บัญชีนี้ถูกปิดใช้งานด้วยเหตุผลด้านความปลอดภัย คุณสามารถรีเซ็ตรหัสผ่านของคุณได้ที่ %@"),
           CFSTR("ไม่สามารถรับข้อความบนอุปกรณ์ใดๆ ของคุณเลยใช่หรือไม่?"),
           CFSTR("ส่งรหัสใหม่"),
           CFSTR("ขออภัยสำหรับข้อผิดพลาดที่เกิดขึ้น ขอบคุณสำหรับความอดทนของคุณ โปรดลองอีกครั้งในภายหลัง"),
           CFSTR("ต้องระบุ"),
           CFSTR("ค้นหาไม่พบบุคคลนี้"),
           CFSTR("ป้อนรหัสการตรวจสอบยืนยัน"),
           CFSTR("ไม่พบอุปกรณ์"),
           CFSTR("Apple ID"),
           CFSTR("การตรวจสอบยืนยันสองขั้นตอนได้ถูกเปิดใช้งานแล้วสำหรับ Apple ID นี้"),
           CFSTR("ไม่สามารถตรวจสอบยืนยันโทเค็น"),
           CFSTR("รหัสผ่าน"),
           CFSTR("เพื่อรักษาความปลอดภัยของคุณ ถึงเวลาแล้วสำหรับการรีเซ็ตรหัสผ่านของคุณ ซึ่งทำได้ง่ายมาก เพียงไปที่ %@"),
           CFSTR("เวลาปัจจุบันบนอุปกรณ์นี้ไม่ถูกต้อง คุณสามารถแก้ไขได้โดยไปที่ การตั้งค่า > ทั่วไป > วันที่และเวลา จากนั้นลองอีกครั้ง"),
           CFSTR("ล้มเหลวในการสร้างโทเค็น SSO ที่ถูกต้อง"),
           CFSTR("รหัสการตรวจสอบยืนยันที่คุณป้อนไม่ถูกต้อง"),
           CFSTR("ดำเนินการต่อ"),
           CFSTR("ยืนยันตัวตนของคุณ"),
           CFSTR("การรับรองความถูกต้องถูกยกเลิกโดยระบบ"),
           CFSTR("สร้างรหัสด้วย \"%@\"),
           CFSTR("รายการอุปกรณ์ว่างเปล่า"),
           CFSTR("เซสชันไม่ถูกต้อง"),
           CFSTR("รูปแบบการตอบรับจากเซิร์ฟเวอร์ไม่ถูกต้อง"),
           CFSTR("คุณได้ส่งรหัสจำนวนมากเกินไปในการยืนยันหมายเลขโทรศัพท์ของคุณ โปรดลองอีกครั้งในภายหลัง"),
           CFSTR("โทรศัพท์ที่ลงท้ายด้วย %@"),
           CFSTR("มีการป้อนชื่อบัญชีหรือรหัสผ่านของคุณไม่ถูกต้อง"),
           CFSTR("ช่อง Apple ID ว่างอยู่"),
           CFSTR("iForgot…"),
           CFSTR("ขออภัย แต่คุณได้พยายามยืนยันตัวตนของคุณที่ผิดหลายครั้งมากเกินไป เพื่อเหตุผลด้านความปลอดภัย คุณจะไม่สามารถทำการเปลี่ยนแปลงกับบัญชีผู้ใช้ของคุณเป็นเวลา 8 ชั่วโมงต่อจากนี้ หากคุณไม่มีรหัสการกู้คืน"),
           CFSTR("ไม่มีข้อมูลอุปกรณ์"),
           CFSTR("ลืม ID หรือรหัสผ่านของคุณใช่หรือไม่?"),
           CFSTR("Apple ID นี้ถูกปิดใช้งานด้วยเหตุผลด้านความปลอดภัย คุณสามารถรีเซ็ตรหัสผ่านของคุณได้ที่ %@"),
           CFSTR("รับรองความถูกต้องว่าเป็น %@ ด้วย Touch ID"),
           CFSTR("การรับรองความถูกต้องถูกยกเลิกโดยผู้ใช้"),
           CFSTR("หมายเลขที่ลงท้ายด้วย %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_th;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
