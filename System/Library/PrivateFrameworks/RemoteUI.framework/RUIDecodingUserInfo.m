@implementation RUIDecodingUserInfo

- (RUIDecodingUserInfo)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RUIDecodingUserInfo_values) = (Class)MEMORY[0x24BEE4B00];
  v3.receiver = self;
  v3.super_class = (Class)RUIDecodingUserInfo;
  return -[RUIDecodingUserInfo init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
