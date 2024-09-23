@implementation JSAProcessEnvironment

+ (JSAProcessEnvironment)currentEnvironment
{
  if (qword_B8118 != -1)
    swift_once(&qword_B8118, sub_508AC);
  return (JSAProcessEnvironment *)(id)qword_B8EF0;
}

- (int64_t)variant
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___JSAProcessEnvironment__variant);
}

- (JSAProcessEnvironment)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAProcessEnvironment__variant) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProcessEnvironment();
  return -[JSAProcessEnvironment init](&v3, "init");
}

- (void)setup
{
  JSAProcessEnvironment *v2;

  v2 = self;
  sub_509DC();

}

@end
