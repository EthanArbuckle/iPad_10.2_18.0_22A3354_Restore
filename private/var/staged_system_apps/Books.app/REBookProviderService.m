@implementation REBookProviderService

- (REBookProviderService)init
{
  REBookProviderService *result;

  result = (REBookProviderService *)_swift_stdlib_reportUnimplementedInitializer("Books.BookProviderService", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR___REBookProviderService_bookEntity));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR___REBookProviderService_storeController));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR___REBookProviderService_epubParser));
  v3 = (char *)self + OBJC_IVAR___REBookProviderService_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
