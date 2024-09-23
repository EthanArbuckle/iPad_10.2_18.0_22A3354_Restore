@implementation JSWhatsNewViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__title;
  v4 = sub_100007E8C((uint64_t *)&unk_1011A3370);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__displayName, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__featuredItems;
  v7 = sub_100007E8C(&qword_1011EB7D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__buttonTitle, v4);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__isModalInPresentation;
  v9 = sub_100007E8C((uint64_t *)&unk_1011A3380);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  sub_100CF33C8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext), *(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext], *(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext+ 8], *(_QWORD *)&self->super.super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext], *(void **)&self->super.playActivityFeatureName[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext]);
}

@end
