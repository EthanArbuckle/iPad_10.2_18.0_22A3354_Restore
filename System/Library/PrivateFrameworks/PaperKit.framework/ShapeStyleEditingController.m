@implementation ShapeStyleEditingController

- (void)didTapStrokeColorButton
{
  _TtC8PaperKit27ShapeStyleEditingController *v2;

  v2 = self;
  ShapeStyleEditingController.didTapStrokeColorButton()();

}

- (void)didTapFillColorButton
{
  _TtC8PaperKit27ShapeStyleEditingController *v2;

  v2 = self;
  ShapeStyleEditingController.didTapFillColorButton()();

}

- (void)didTapArrowColorButtonForEvent:(id)a3
{
  id v4;
  _TtC8PaperKit27ShapeStyleEditingController *v5;

  v4 = a3;
  v5 = self;
  specialized ShapeStyleEditingController.didTapArrowColorButton(forEvent:)();

}

- (void)didTapStrokeWidthButton
{
  _TtC8PaperKit27ShapeStyleEditingController *v2;

  v2 = self;
  ShapeStyleEditingController.didTapStrokeWidthButton()();

}

- (void)didTapCompactOpacityButtonForEvent:(id)a3
{
  id v4;
  _TtC8PaperKit27ShapeStyleEditingController *v5;

  v4 = a3;
  v5 = self;
  specialized ShapeStyleEditingController.didTapCompactOpacityButton(forEvent:)();

}

- (void)didStartChangingOpacitySlider
{
  _TtC8PaperKit27ShapeStyleEditingController *v2;

  v2 = self;
  ShapeStyleEditingController.didStartChangingOpacitySlider()();

}

- (void)didFinishChangingOpacitySlider
{
  _TtC8PaperKit27ShapeStyleEditingController *v2;

  v2 = self;
  ShapeStyleEditingController.didFinishChangingOpacitySlider()();

}

- (void)didChangeOpacitySlider
{
  _TtC8PaperKit27ShapeStyleEditingController *v2;

  v2 = self;
  ShapeStyleEditingController.didChangeOpacitySlider()();

}

- (void)lineTypeControlValueChanged
{
  _TtC8PaperKit27ShapeStyleEditingController *v2;

  v2 = self;
  ShapeStyleEditingController.lineTypeControlValueChanged()();

}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  int v6;
  id v8;
  id v9;
  _TtC8PaperKit27ShapeStyleEditingController *v10;
  UIColor_optional v11;
  Class isa;

  if (!a5)
  {
    v6 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_editingAttribute);
    if (v6 != 2)
    {
      v8 = a3;
      v9 = a4;
      v10 = self;
      ShapeStyleEditingController.canvasUserInterfaceStyle.getter();
      v11.value.super.isa = (Class)static PKInkingTool.convertColor(_:from:to:)();
      isa = v11.value.super.isa;
      if ((v6 & 1) != 0)
        ShapeStyleEditingController.changeFillColor(_:)(v11);
      else
        ShapeStyleEditingController.changeStrokeColor(_:)(v11);

    }
  }
}

- (void)_colorPickerViewControllerDidDeselectColor:(id)a3
{
  int v3;
  id v5;
  _TtC8PaperKit27ShapeStyleEditingController *v6;
  UIColor_optional v7;
  _TtC8PaperKit27ShapeStyleEditingController *v8;

  v3 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_editingAttribute);
  if (v3 != 2)
  {
    v5 = a3;
    v6 = self;
    v7.is_nil = (char)v6;
    v8 = v6;
    v7.value.super.isa = 0;
    if ((v3 & 1) != 0)
      ShapeStyleEditingController.changeFillColor(_:)(v7);
    else
      ShapeStyleEditingController.changeStrokeColor(_:)(v7);

  }
}

- (void)valueEditingViewController:(id)a3 didStartChangingValue:(int64_t)a4
{
  id v5;
  _TtC8PaperKit27ShapeStyleEditingController *v6;

  v5 = a3;
  v6 = self;
  ShapeStyleEditingController.didStartChangingOpacitySlider()();

}

- (void)valueEditingViewController:(id)a3 didFinishChangingValue:(int64_t)a4
{
  id v5;
  _TtC8PaperKit27ShapeStyleEditingController *v6;

  v5 = a3;
  v6 = self;
  ShapeStyleEditingController.didFinishChangingOpacitySlider()();

}

- (void)valueEditingViewController:(id)a3 didChangeValue:(int64_t)a4
{
  id v6;
  _TtC8PaperKit27ShapeStyleEditingController *v7;

  v6 = a3;
  v7 = self;
  specialized ShapeStyleEditingController.valueEditingViewController(_:didChangeValue:)(a4);

}

- (_TtC8PaperKit27ShapeStyleEditingController)init
{
  _TtC8PaperKit27ShapeStyleEditingController *result;

  result = (_TtC8PaperKit27ShapeStyleEditingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_shapeStyleEditingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit27ShapeStyleEditingController_defaultStrokeColor));

}

@end
