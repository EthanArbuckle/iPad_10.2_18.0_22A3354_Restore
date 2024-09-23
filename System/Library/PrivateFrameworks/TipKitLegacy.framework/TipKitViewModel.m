@implementation TipKitViewModel

- (void)contentController:(id)a3 contentDidBecomeAvailable:(id)a4 animated:(BOOL)a5
{
  id v8;
  _TtC12TipKitLegacy15TipKitViewModel *v9;
  id v10;
  _TtC12TipKitLegacy15TipKitViewModel *v11;
  id v12;

  swift_getKeyPath();
  swift_getKeyPath();
  v8 = a4;
  v9 = self;
  v10 = v8;
  v11 = v9;
  v12 = a3;
  sub_248A9C010();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C010();

}

- (id)contentController:(id)a3 contentView:(id)a4 iconForCustomizationID:(int64_t)a5
{
  void (**v9)(int64_t);
  void (*v10)(int64_t);
  id v11;
  id v12;
  _TtC12TipKitLegacy15TipKitViewModel *v13;
  id v14;
  id v15;
  _TtC12TipKitLegacy15TipKitViewModel *v16;
  id *v17;
  id v18;

  v9 = (void (**)(int64_t))((char *)self
                                            + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler);
  swift_beginAccess();
  v10 = *v9;
  if (*v9)
  {
    v11 = a3;
    v12 = a4;
    v13 = self;
    sub_248A729F8((uint64_t)v10);
    v10(a5);
    sub_248A72A78((uint64_t)v10);
  }
  else
  {
    v14 = a3;
    v15 = a4;
    v16 = self;
  }
  v17 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewIcon);
  swift_beginAccess();
  v18 = *v17;

  return v18;
}

- (void)contentController:(id)a3 didFinishWithContent:(id)a4 animated:(BOOL)a5
{
  _TtC12TipKitLegacy15TipKitViewModel *v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v6 = self;
  sub_248A9C010();
}

- (void)contentController:(id)a3 eventOccurred:(int64_t)a4 content:(id)a5 context:(id)a6
{
  uint64_t v10;
  char *v11;
  void (*v12)(id, int64_t, uint64_t);
  id v13;
  id v14;
  _TtC12TipKitLegacy15TipKitViewModel *v15;
  id v16;
  id v17;

  if (a6)
    v10 = sub_248A9C58C();
  else
    v10 = 0;
  v11 = (char *)self + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler;
  swift_beginAccess();
  v12 = *(void (**)(id, int64_t, uint64_t))v11;
  if (*(_QWORD *)v11)
  {
    v13 = a3;
    v14 = a5;
    v15 = self;
    sub_248A729F8((uint64_t)v12);
    v12(v14, a4, v10);
    sub_248A72A78((uint64_t)v12);

  }
  else
  {
    v16 = a3;
    v17 = a5;
  }
  swift_bridgeObjectRelease();

}

- (id)contentController:(id)a3 personalizedStringForID:(int64_t)a4 content:(id)a5
{
  char *v9;
  void (*v10)(id, int64_t);
  id v11;
  id v12;
  _TtC12TipKitLegacy15TipKitViewModel *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v9 = (char *)self + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler;
  swift_beginAccess();
  v10 = *(void (**)(id, int64_t))v9;
  if (!*(_QWORD *)v9)
    return 0;
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_248A729F8((uint64_t)v10);
  v10(v12, a4);
  v15 = v14;
  sub_248A72A78((uint64_t)v10);

  if (!v15)
    return 0;
  v16 = (void *)sub_248A9C5A4();
  swift_bridgeObjectRelease();
  return v16;
}

- (id)contentController:(id)a3 clientContextMapForKeys:(id)a4
{
  uint64_t v6;
  uint64_t (**v7)(uint64_t);
  uint64_t (*v8)(uint64_t);
  id v9;
  _TtC12TipKitLegacy15TipKitViewModel *v10;
  uint64_t v11;
  void *v12;

  type metadata accessor for TPKClientContextKey(0);
  v6 = sub_248A9C688();
  v7 = (uint64_t (**)(uint64_t))((char *)self
                                        + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler);
  swift_beginAccess();
  v8 = *v7;
  if (*v7)
  {
    v9 = a3;
    v10 = self;
    sub_248A729F8((uint64_t)v8);
    v11 = v8(v6);
    sub_248A72A78((uint64_t)v8);

    swift_bridgeObjectRelease();
    if (v11)
    {
      sub_248A74E70();
      v12 = (void *)sub_248A9C574();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return 0;
}

- (_TtC12TipKitLegacy15TipKitViewModel)init
{
  _TtC12TipKitLegacy15TipKitViewModel *result;

  result = (_TtC12TipKitLegacy15TipKitViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__hasContent;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFD8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();

  sub_248A72A78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler));
  sub_248A72A78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler));
  sub_248A72A78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler));
  sub_248A72A78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler));
  v5 = (char *)self + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__tipContent;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
