@implementation TextStyleEditingController

- (void)didTapFontButton
{
  _TtC8PaperKit26TextStyleEditingController *v2;

  v2 = self;
  TextStyleEditingController.didTapFontButton()();

}

- (void)didTapFontSizeButton
{
  _TtC8PaperKit26TextStyleEditingController *v2;

  v2 = self;
  TextStyleEditingController.didTapFontSizeButton()();

}

- (void)textAlignmentControlValueChanged
{
  _TtC8PaperKit26TextStyleEditingController *v2;

  v2 = self;
  TextStyleEditingController.textAlignmentControlValueChanged()();

}

- (void)didTapBoldTextStyle
{
  _TtC8PaperKit26TextStyleEditingController *v2;

  v2 = self;
  TextStyleEditingController.didTapBoldTextStyle()();

}

- (void)didTapItalicTextStyle
{
  _TtC8PaperKit26TextStyleEditingController *v2;

  v2 = self;
  TextStyleEditingController.didTapItalicTextStyle()();

}

- (void)didTapUnderlineTextStyle
{
  _TtC8PaperKit26TextStyleEditingController *v2;

  v2 = self;
  TextStyleEditingController.didTapUnderlineTextStyle()();

}

- (void)didTapStrikethroughTextStyle
{
  _TtC8PaperKit26TextStyleEditingController *v2;

  v2 = self;
  TextStyleEditingController.didTapStrikethroughTextStyle()();

}

- (void)didTapColorSwatchWithSender:(id)a3
{
  id v4;
  _TtC8PaperKit26TextStyleEditingController *v5;

  v4 = a3;
  v5 = self;
  TextStyleEditingController.didTapColorSwatch(sender:)((uint64_t)v4);

}

- (void)valueEditingViewController:(id)a3 didStartChangingValue:(int64_t)a4
{
  @objc TextStyleEditingController.valueEditingViewController(_:didStartChangingValue:)((char *)self, (uint64_t)a2, a3, a4, CanvasElementController.startLiveEditingSelectedElements());
}

- (void)valueEditingViewController:(id)a3 didFinishChangingValue:(int64_t)a4
{
  @objc TextStyleEditingController.valueEditingViewController(_:didStartChangingValue:)((char *)self, (uint64_t)a2, a3, a4, CanvasElementController.commitLiveEditingSelectedElements());
}

- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4
{
  void *v7;
  id v8;
  _TtC8PaperKit26TextStyleEditingController *v9;

  type metadata accessor for FontSizeViewController();
  if (swift_dynamicCastClass())
  {
    v7 = (void *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_controller);
    v8 = a3;
    v9 = self;
    if (v7)
    {
      CanvasElementController.setSelectionFontSize(_:)(a4);

    }
    TextStyleEditingController.updateUI()();

  }
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  UIFontPickerViewController *v4;
  _TtC8PaperKit26TextStyleEditingController *v5;

  v4 = (UIFontPickerViewController *)a3;
  v5 = self;
  TextStyleEditingController.fontPickerViewControllerDidPickFont(_:)(v4);

}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  UIColorPickerViewController *v8;
  id v9;
  _TtC8PaperKit26TextStyleEditingController *v10;

  v8 = (UIColorPickerViewController *)a3;
  v9 = a4;
  v10 = self;
  TextStyleEditingController.colorPickerViewController(_:didSelect:continuously:)(v8, (UIColor)v9, a5);

}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id v4;
  _TtC8PaperKit26TextStyleEditingController *v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_isColorPickerPresented) = 0;
  v4 = a3;
  v5 = self;
  TextStyleEditingController.updateUI()();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4;
  _TtC8PaperKit26TextStyleEditingController *v5;
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
  _TtC8PaperKit26TextStyleEditingController *v8;
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

- (void)presentationControllerDidDismiss:(id)a3
{
  _TtC8PaperKit26TextStyleEditingController *v4;
  _TtC8PaperKit26TextStyleEditingController *v5;
  _TtC8PaperKit26TextStyleEditingController *v6;

  v4 = (_TtC8PaperKit26TextStyleEditingController *)a3;
  v6 = self;
  v5 = (_TtC8PaperKit26TextStyleEditingController *)-[TextStyleEditingController presentedViewController](v4, sel_presentedViewController);
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {

    *((_BYTE *)&v6->super.isa + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_isColorPickerPresented) = 0;
    TextStyleEditingController.updateUI()();
  }
  else
  {

    v4 = v6;
    v6 = v5;
  }

}

- (_TtC8PaperKit26TextStyleEditingController)init
{
  _TtC8PaperKit26TextStyleEditingController *result;

  result = (_TtC8PaperKit26TextStyleEditingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3;

  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_textStyleEditingView));
  v3 = *(id *)&self->displayAttributes[OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_displayAttributes + 8];
  objc_release(*(id *)&self->displayAttributes[OBJC_IVAR____TtC8PaperKit26TextStyleEditingController_displayAttributes
                                             + 48]);
  swift_bridgeObjectRelease();

}

@end
