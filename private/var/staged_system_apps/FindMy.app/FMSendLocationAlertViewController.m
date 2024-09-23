@implementation FMSendLocationAlertViewController

- (void)actionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy33FMSendLocationAlertViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10046D194();

}

- (_TtC6FindMy33FMSendLocationAlertViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMSendLocationAlertViewController(0);
  return -[FMRecipientsViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
