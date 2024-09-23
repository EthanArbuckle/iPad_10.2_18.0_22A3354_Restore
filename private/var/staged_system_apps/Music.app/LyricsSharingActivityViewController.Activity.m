@implementation LyricsSharingActivityViewController.Activity

- (NSString)activityTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->title[OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSString)activityType
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity__activityType));
}

- (UIImage)activityImage
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_image));
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtCC5Music35LyricsSharingActivityViewController8Activity *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_performBlock);
  v3 = *(_QWORD *)&self->title[OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_performBlock];
  v5 = self;
  v4 = swift_retain(v3);
  v2(v4);
  swift_release(v3);
  -[LyricsSharingActivityViewController.Activity activityDidFinish:](v5, "activityDidFinish:", 1);

}

- (_TtCC5Music35LyricsSharingActivityViewController8Activity)init
{
  _TtCC5Music35LyricsSharingActivityViewController8Activity *result;

  result = (_TtCC5Music35LyricsSharingActivityViewController8Activity *)_swift_stdlib_reportUnimplementedInitializer("Music.Activity", 14, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_title]);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_image));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity__activityType));
  swift_release(*(_QWORD *)&self->title[OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_performBlock]);
}

@end
