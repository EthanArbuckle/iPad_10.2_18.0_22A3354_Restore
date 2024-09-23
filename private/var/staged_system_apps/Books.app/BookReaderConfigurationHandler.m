@implementation BookReaderConfigurationHandler

- (_TtC5Books30BookReaderConfigurationHandler)init
{
  char *v3;
  objc_super v5;

  v3 = (char *)self + OBJC_IVAR____TtC5Books30BookReaderConfigurationHandler_delegate;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BookReaderConfigurationHandler();
  return -[BookReaderConfigurationHandler init](&v5, "init");
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books30BookReaderConfigurationHandler_delegate);
}

@end
