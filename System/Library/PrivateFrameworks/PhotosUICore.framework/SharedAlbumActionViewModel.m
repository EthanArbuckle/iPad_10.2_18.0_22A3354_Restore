@implementation SharedAlbumActionViewModel

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC12PhotosUICore26SharedAlbumActionViewModel *v8;

  sub_1A6856488(0, (unint64_t *)&unk_1EE8D9890);
  v6 = sub_1A7AE3A10();
  v7 = a3;
  v8 = self;
  sub_1A6868DE0(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)photoRecipientViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC12PhotosUICore26SharedAlbumActionViewModel)init
{
  _TtC12PhotosUICore26SharedAlbumActionViewModel *result;

  result = (_TtC12PhotosUICore26SharedAlbumActionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel__extensionContext));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel__updateCallback));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel__doneCallback));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
