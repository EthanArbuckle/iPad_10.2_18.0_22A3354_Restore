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
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14DD040);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__displayName, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__featuredItems;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_15139C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__buttonTitle, v4);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__isModalInPresentation;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14B7070);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  sub_F04368(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext), *(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext], *(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext+ 8], *(_QWORD *)&self->super.super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext], *(void **)&self->super.playActivityFeatureName[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext]);
}

@end
