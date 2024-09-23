@implementation DefaultOneUpBadgeContentProvider

- (_TtC15PhotosUIPrivate32DefaultOneUpBadgeContentProvider)init
{
  sub_1AAC3E804();
}

- (void).cxx_destruct
{
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate32DefaultOneUpBadgeContentProvider_delegate);
  swift_unknownObjectRelease();
}

- (id)undoManagerForActionPerformer:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate32DefaultOneUpBadgeContentProvider *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1AAC3E954();

  return v6;
}

@end
