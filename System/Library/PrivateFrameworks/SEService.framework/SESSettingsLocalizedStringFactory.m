@implementation SESSettingsLocalizedStringFactory

+ (NSString)touchIDAlertMessagePrefix
{
  return (NSString *)sub_20A09653C((uint64_t)a1, (uint64_t)a2, &qword_2545C8E28);
}

+ (NSString)nonTouchIDAlertMessagePrefix
{
  return (NSString *)sub_20A09653C((uint64_t)a1, (uint64_t)a2, &qword_2545C8E30);
}

+ (NSString)passbookDefaultAlertMessage
{
  return (NSString *)sub_20A09653C((uint64_t)a1, (uint64_t)a2, &qword_2545C8E38);
}

+ (NSString)thirdPartyDefaultAlertMessage
{
  return (NSString *)sub_20A09653C((uint64_t)a1, (uint64_t)a2, &qword_2545C8E40);
}

+ (NSString)expressModeDefaultAlertMessagePostfix
{
  return (NSString *)sub_20A09653C((uint64_t)a1, (uint64_t)a2, &qword_2545C8E48);
}

- (_TtC9SEService33SESSettingsLocalizedStringFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SESSettingsLocalizedStringFactory init](&v3, sel_init);
}

@end
