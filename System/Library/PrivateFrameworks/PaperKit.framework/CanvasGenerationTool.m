@implementation CanvasGenerationTool

- (void)magicPaperViewController:(id)a3 didGenerateImage:(id)a4
{
  PPKGPInProcessMagicPaperViewController *v6;
  id v7;
  _TtC8PaperKit20CanvasGenerationTool *v8;

  v6 = (PPKGPInProcessMagicPaperViewController *)a3;
  v7 = a4;
  v8 = self;
  CanvasGenerationTool.magicPaperViewController(_:didGenerate:)(v6, (UIImage)v7);

}

- (void)magicPaperViewControllerDidCancel:(id)a3
{
  id v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = a3;
  v5 = self;
  specialized CanvasGenerationTool.magicPaperViewControllerDidCancel(_:)();

}

- (void)generationTool:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  CanvasGenerationTool.generationTool(_:)(v4);

}

- (void)gestureRecognizerBegan:(id)a3
{
  id v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerBegan(_:)((uint64_t)v4);

}

- (void)gestureRecognizerChanged:(id)a3
{
  id v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerChanged(_:)(v4);

}

- (void)gestureRecognizerEnded:(id)a3
{
  id v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerEnded(_:)(v4);

}

- (void)gestureRecognizerCanceledOrFailed:(id)a3
{
  id v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerCanceledOrFailed(_:)(v4);

}

- (void)disableGestureRecognizer
{
  _TtC8PaperKit20CanvasGenerationTool *v2;

  v2 = self;
  CanvasGenerationTool.disableGestureRecognizer()();

}

- (void)beginWandPathFromGesture:(id)a3
{
  id v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = a3;
  v5 = self;
  CanvasGenerationTool.beginWandPathFromGesture(_:)(v4);

}

- (void)keyboardWillHideNotification:(id)a3
{
  id v4;
  _TtC8PaperKit20CanvasGenerationTool *v5;

  v4 = a3;
  v5 = self;
  CanvasGenerationTool.adjustScrollViewForKeyboardNotification(_:)(v4);

}

- (UIView)magicGenerativeViewForHitTesting
{
  id v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_magicGenerativeVC);
  if (v2)
    v2 = objc_msgSend(v2, sel_viewIfLoaded);
  return (UIView *)v2;
}

- (_TtC8PaperKit20CanvasGenerationTool)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized CanvasGenerationTool.init(coder:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CanvasGenerationTool();
  v7 = v11.receiver;
  v8 = a4;
  v9 = -[CanvasGenerationTool hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v8, x, y);

  if (v9 && v9 == v7)
  {

    v9 = 0;
  }

  return v9;
}

- (_TtC8PaperKit20CanvasGenerationTool)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit20CanvasGenerationTool *result;

  result = (_TtC8PaperKit20CanvasGenerationTool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_gestureToTrack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_magicGenerativeBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_magicGenerativeVC));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_continuation, (uint64_t *)&demangling cache variable for type metadata for CheckedContinuation<ImageWithEncodedRecipe, Error>?);
}

- (void)authenticateWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC8PaperKit20CanvasGenerationTool *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &async function pointer to partial apply for @objc closure #1 in CanvasGenerationTool.authenticate();
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &_sIeghH_IeAgH_TRTATu;
  v13[5] = v12;
  v14 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v8, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v13);
  swift_release();
}

@end
