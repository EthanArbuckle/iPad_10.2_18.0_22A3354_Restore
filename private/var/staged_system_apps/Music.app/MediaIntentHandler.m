@implementation MediaIntentHandler

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  sub_1005596A0(self, (int)a2, a3, a4, (void (*)(id, void *))sub_1005597A4);
}

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  sub_1005596A0(self, (int)a2, a3, a4, (void (*)(id, void *))sub_100559EB0);
}

- (_TtC5Music18MediaIntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaIntentHandler();
  return -[MediaIntentHandler init](&v3, "init");
}

@end
