@implementation PKSubscriptionControllerFactory

+ (id)platformInstance
{
  _QWORD *v2;

  if ((sub_22FB379F8() & 1) != 0)
  {
    type metadata accessor for MediaAPISubscriptionController();
    v2 = (_QWORD *)swift_allocObject();
    sub_22FB37A4C();
    swift_allocObject();
    v2[2] = sub_22FB37A40();
  }
  else
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaRemoteSubscriptionController()), sel_init);
  }
  return v2;
}

- (PKSubscriptionControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SubscriptionControllerFactory();
  return -[PKSubscriptionControllerFactory init](&v3, sel_init);
}

@end
