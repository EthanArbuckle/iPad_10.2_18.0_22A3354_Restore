@implementation VisualTranslationViewBridge

- (void)setPresentationAnchorWithRect:(CGRect)a3 contentRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _TtC13TranslationUI27VisualTranslationViewBridge *v12;
  __C::CGRect v13;
  __C::CGRect v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v12 = self;
  v13.origin.x = v11;
  v13.origin.y = v10;
  v13.size.width = v9;
  v13.size.height = v8;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  VisualTranslationViewBridge.setPresentationAnchor(rect:contentRect:)(v13, v14);

}

- (void)dismissErrorUI
{
  _TtC13TranslationUI27VisualTranslationViewBridge *v2;

  v2 = self;
  VisualTranslationViewBridge.dismissErrorUI()();

}

- (id)dismissHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_dismissHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D2D32468;
  aBlock[3] = &block_descriptor_95;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1D2D9BC9C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_dismissHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1D2CCCF1C(v7);
}

- (_TtC13TranslationUI27VisualTranslationViewBridge)init
{
  return (_TtC13TranslationUI27VisualTranslationViewBridge *)VisualTranslationViewBridge.init()();
}

- (UIView)view
{
  _TtC13TranslationUI27VisualTranslationViewBridge *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_1D2D905F4();
  v4 = objc_msgSend(v3, sel_view);

  return (UIView *)v4;
}

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a4);
  sub_1D2CC63E8(0, &qword_1ED587860);
  v5 = sub_1D2D9DE60();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  type metadata accessor for VisualTranslationService();
  static VisualTranslationService.isTranslatable(_:completion:)(v5, (uint64_t)sub_1D2D83710, v6);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _TtC13TranslationUI27VisualTranslationViewBridge *v23;
  uint64_t v24;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED587850);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - v14;
  v16 = _Block_copy(a6);
  sub_1D2CC63E8(0, &qword_1ED587860);
  v17 = sub_1D2D9DE60();
  if (a4)
  {
    sub_1D2D9C75C();
    v18 = sub_1D2D9C7EC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 0, 1, v18);
  }
  else
  {
    v19 = sub_1D2D9C7EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v15, 1, 1, v19);
  }
  if (a5)
  {
    sub_1D2D9C75C();
    v20 = sub_1D2D9C7EC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v12, 0, 1, v20);
  }
  else
  {
    v21 = sub_1D2D9C7EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v12, 1, 1, v21);
  }
  if (v16)
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v16;
    v16 = sub_1D2D9BC94;
  }
  else
  {
    v22 = 0;
  }
  v23 = self;
  VisualTranslationViewBridge.translate(_:sourceLocale:targetLocale:completion:)(v17, (uint64_t)v15, (uint64_t)v12, (uint64_t)v16, v22);
  sub_1D2CCCF1C((uint64_t)v16);
  swift_bridgeObjectRelease();

  sub_1D2CCADA4((uint64_t)v12, &qword_1ED587850);
  sub_1D2CCADA4((uint64_t)v15, &qword_1ED587850);
}

- (void)showDebugMenu
{
  _TtC13TranslationUI27VisualTranslationViewBridge *v2;

  v2 = self;
  if (_LTIsInternalInstall())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1D2D9C9C0();
  }

}

- (void)setZoomScale:(double)a3
{
  uint64_t v5;
  _TtC13TranslationUI27VisualTranslationViewBridge *v6;
  double *v7;

  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_observable);
  type metadata accessor for VisualTranslationObservable(0);
  sub_1D2CC66E4(&qword_1EFCA9320, type metadata accessor for VisualTranslationObservable, (uint64_t)&protocol conformance descriptor for VisualTranslationErrorViewModel);
  v6 = self;
  sub_1D2D9C96C();
  sub_1D2D9C978();
  swift_release();
  if (a3 <= 0.0)
    a3 = COERCE_DOUBLE(1);
  v7 = (double *)(v5 + OBJC_IVAR____TtC13TranslationUI27VisualTranslationObservable_zoomScale);
  swift_beginAccess();
  *v7 = a3;

}

- (void).cxx_destruct
{
  swift_release();
  sub_1D2CCCF1C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_dismissHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge____lazy_storage___hostingController));
}

@end
