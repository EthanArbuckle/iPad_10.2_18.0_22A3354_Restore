@implementation SDAppleIDMutableURLRequest

- (SDAppleIDMutableURLRequest)initWithURL:(id)a3 gsToken:(id)a4
{
  id v6;
  SDAppleIDMutableURLRequest *v7;
  SDAppleIDMutableURLRequest *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SDAppleIDMutableURLRequest;
  v7 = -[SDAppleIDMutableURLRequest initWithURL:](&v10, "initWithURL:", a3);
  v8 = v7;
  if (v7)
  {
    -[SDAppleIDMutableURLRequest setHTTPShouldHandleCookies:](v7, "setHTTPShouldHandleCookies:", 0);
    -[SDAppleIDMutableURLRequest setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    if (qword_1007C6A90 != -1)
      dispatch_once(&qword_1007C6A90, &stru_100719010);
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", qword_1007C6A88, CFSTR("X-Mme-Client-Info"));
    if (qword_1007C6AA0 != -1)
      dispatch_once(&qword_1007C6AA0, &stru_100719030);
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", qword_1007C6A98, CFSTR("X-Mme-Device-ID"));
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-GS-Token"));
  }

  return v8;
}

@end
