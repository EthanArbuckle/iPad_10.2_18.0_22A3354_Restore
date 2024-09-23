@implementation SignatureStyleEditingController

- (void)didTapStrokeWidthControlWithSender:(id)a3
{
  void *v5;
  _TtC8PaperKit31SignatureStyleEditingController *v6;

  v5 = (void *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit31SignatureStyleEditingController_controller, a2);
  swift_unknownObjectRetain();
  v6 = self;
  if (v5)
  {
    CanvasElementController.changeSelectedStrokeWidth(_:)((double)(uint64_t)objc_msgSend(a3, sel_width));

  }
  SignatureStyleEditingController.updateUI()();
  swift_unknownObjectRelease();

}

- (void)didTapColorSwatchWithSender:(id)a3
{
  id v4;
  _TtC8PaperKit31SignatureStyleEditingController *v5;

  v4 = a3;
  v5 = self;
  SignatureStyleEditingController.didTapColorSwatch(sender:)((uint64_t)v4);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4;
  _TtC8PaperKit31SignatureStyleEditingController *v5;
  id v6;
  uint64_t v7;
  int64_t v8;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_presentedViewController);
  objc_opt_self();
  v7 = swift_dynamicCastObjCClass();

  if (v7)
    v8 = -2;
  else
    v8 = -1;

  return v8;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC8PaperKit31SignatureStyleEditingController *v8;
  id v9;
  uint64_t v10;
  int64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v6, sel_presentedViewController);
  objc_opt_self();
  v10 = swift_dynamicCastObjCClass();

  if (v10)
    v11 = -2;
  else
    v11 = -1;

  return v11;
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v8;
  id v9;
  _TtC8PaperKit31SignatureStyleEditingController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  specialized SignatureStyleEditingController.colorPickerViewController(_:didSelect:continuously:)((uint64_t)v9, a5);

}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id v4;
  _TtC8PaperKit31SignatureStyleEditingController *v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8PaperKit31SignatureStyleEditingController_isColorPickerPresented) = 0;
  v4 = a3;
  v5 = self;
  SignatureStyleEditingController.updateUI()();

}

- (_TtC8PaperKit31SignatureStyleEditingController)init
{
  _TtC8PaperKit31SignatureStyleEditingController *result;

  result = (_TtC8PaperKit31SignatureStyleEditingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureStyleEditingController_signatureStyleEditingView));
}

@end
