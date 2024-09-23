@implementation FMAddFriendViewController

- (void)cancelActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy25FMAddFriendViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10038B728();

}

- (void)actionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy25FMAddFriendViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10038B910();

}

- (_TtC6FindMy25FMAddFriendViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAddFriendViewController(0);
  return -[FMRecipientsViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
