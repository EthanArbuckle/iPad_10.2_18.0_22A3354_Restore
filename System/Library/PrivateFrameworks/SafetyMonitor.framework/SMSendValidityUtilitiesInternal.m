@implementation SMSendValidityUtilitiesInternal

+ (id)sendMessageFailureAlertCannotSendTitle
{
  return sub_24552E904((uint64_t)a1, (uint64_t)a2, &qword_2574846A8);
}

+ (id)sendMessageFailureAlertOKButtonText
{
  return sub_24552E904((uint64_t)a1, (uint64_t)a2, &qword_2574846B0);
}

+ (id)sendValidityAlertMessageFor:(int64_t)a3
{
  uint64_t v3;
  char v4;
  void *v5;

  v3 = sub_2455322B0(a3);
  SendValidity.alertErrorMessage.getter(v3, v4 & 1);
  v5 = (void *)sub_24558F7AC();
  swift_bridgeObjectRelease();
  return v5;
}

- (SMSendValidityUtilitiesInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SendValidityUtilities();
  return -[SMSendValidityUtilitiesInternal init](&v3, sel_init);
}

@end
