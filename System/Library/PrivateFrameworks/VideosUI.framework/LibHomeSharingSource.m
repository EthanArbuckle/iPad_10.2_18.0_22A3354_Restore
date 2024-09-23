@implementation LibHomeSharingSource

- (void)dealloc
{
  _TtC8VideosUI20LibHomeSharingSource *v2;

  v2 = self;
  sub_1D9CC1DFC();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_79_9();
  OUTLINED_FUNCTION_79_9();
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI20LibHomeSharingSource__menuItems;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAC5B68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20LibHomeSharingSource_libraryConnectionQueue));
  OUTLINED_FUNCTION_5_17();
}

- (void)mpMediaLibraryStatusChanged
{
  _TtC8VideosUI20LibHomeSharingSource *v2;

  v2 = self;
  sub_1D9CC3308();

}

@end
