@implementation BookReaderDataManager

- (_TtC5Books21BookReaderDataManager)init
{
  _TtC5Books21BookReaderDataManager *result;

  result = (_TtC5Books21BookReaderDataManager *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderDataManager", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books21BookReaderDataManager_assetViewControllerDelegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books21BookReaderDataManager_bookProviderService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books21BookReaderDataManager_annotationProviderService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books21BookReaderDataManager_purchaseHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books21BookReaderDataManager_configurationHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books21BookReaderDataManager_readingSettingsManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books21BookReaderDataManager_themeAppearanceManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books21BookReaderDataManager_stateTask));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books21BookReaderDataManager_stateSubject));
}

@end
