@implementation APPCPromotedContentUIModule

+ (void)start
{
  if (qword_1ED3899B8 != -1)
    swift_once();
}

+ (void)startWithStartupType:(int64_t)a3
{
  qword_1ED389778 = a3;
  if (qword_1ED3899B8 != -1)
    swift_once();
}

- (APPCPromotedContentUIModule)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PromotedContentUIModule();
  return -[APPCPromotedContentUIModule init](&v3, sel_init);
}

@end
