@implementation _TFTextFormattingContentViewController

- (_TFTextFormattingContentViewController)init
{
  return (_TFTextFormattingContentViewController *)sub_247F418A0();
}

- (_TFTextFormattingContentViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TFTextFormattingContentViewController *result;

  v5 = OBJC_IVAR____TFTextFormattingContentViewController_viewState;
  type metadata accessor for TextFormattingState();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_247F46CB0();
  v7 = OBJC_IVAR____TFTextFormattingContentViewController_configuration;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA60]), sel_init);

  result = (_TFTextFormattingContentViewController *)sub_247F8F678();
  __break(1u);
  return result;
}

- (void)loadView
{
  _TFTextFormattingContentViewController *v2;

  v2 = self;
  sub_247F41EC0();

}

- (void)viewWillLayoutSubviews
{
  _TFTextFormattingContentViewController *v2;

  v2 = self;
  sub_247F41FEC();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TFTextFormattingContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TFTextFormattingContentViewController *result;

  v4 = a4;
  result = (_TFTextFormattingContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TFTextFormattingContentViewController_configuration));
}

- (void)_setConfiguration:(id)a3
{
  id v4;
  _TFTextFormattingContentViewController *v5;

  v4 = a3;
  v5 = self;
  _TFTextFormattingContentViewController._setConfiguration(_:)(v4);

}

- (void)_setFormattingDescriptor:(id)a3
{
  id v4;
  _TFTextFormattingContentViewController *v5;

  v4 = a3;
  v5 = self;
  _TFTextFormattingContentViewController._setFormattingDescriptor(_:)();

}

- (void)_setDisabledComponents:(id)a3
{
  type metadata accessor for ComponentKey(0);
  sub_247F38108(&qword_25772B928, (uint64_t (*)(uint64_t))type metadata accessor for ComponentKey, (uint64_t)&unk_247F901F0);
  sub_247F8F3E4();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247F8E7CC();
}

- (void)_textFormattingDidChangeValue:(id)a3 textAttributesData:(id)a4
{
  id v7;
  _TFTextFormattingContentViewController *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  _TFTextFormattingContentViewController *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  if (a4)
  {
    v7 = a3;
    v8 = self;
    v9 = a4;
    v10 = sub_247F8E724();
    v12 = v11;

  }
  else
  {
    v13 = a3;
    v14 = self;
    v10 = 0;
    v12 = 0xF000000000000000;
  }
  v15 = -[_TFTextFormattingContentViewController parentViewController](self, sel_parentViewController);
  if (v15)
  {
    v16 = v15;
    v17 = swift_dynamicCastObjCProtocolConditional();
    if (v17)
    {
      v18 = (void *)v17;
      if (v12 >> 60 == 15)
        v19 = 0;
      else
        v19 = (void *)sub_247F8E718();
      objc_msgSend(v18, sel__textFormattingDidChangeValue_textAttributesData_, a3, v19);

    }
  }
  sub_247F43F88(v10, v12);

}

- (void)_textFormattingDidFinish
{
  id v2;
  void *v3;
  void *v4;
  _TFTextFormattingContentViewController *v5;

  v5 = self;
  v2 = -[_TFTextFormattingContentViewController parentViewController](v5, sel_parentViewController);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v4)
      objc_msgSend(v4, sel__textFormattingDidFinish);

  }
  else
  {

  }
}

- (void)_presentColorPicker:(CGRect)a3 selectedColor:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _TFTextFormattingContentViewController *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13 = self;
  v10 = -[_TFTextFormattingContentViewController parentViewController](v13, sel_parentViewController);
  if (v10)
  {
    v11 = v10;
    v12 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v12)
      objc_msgSend(v12, sel__presentColorPicker_selectedColor_, v9, x, y, width, height);

  }
  else
  {

  }
}

- (void)_presentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  id v6;
  _TFTextFormattingContentViewController *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  sub_247F3ED18(0, &qword_25772BF30);
  sub_247F8F348();
  v6 = a3;
  v7 = self;
  v8 = -[_TFTextFormattingContentViewController parentViewController](v7, sel_parentViewController);
  if (v8)
  {
    v9 = v8;
    v10 = swift_dynamicCastObjCProtocolConditional();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)sub_247F8F330();
      objc_msgSend(v11, sel__presentFontPickerWithConfiguration_selectedFonts_, v6, v12);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
    }

  }
  else
  {

    swift_bridgeObjectRelease();
  }

}

- (void)_presentTypographySettingsForFont:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _TFTextFormattingContentViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = -[_TFTextFormattingContentViewController parentViewController](v8, sel_parentViewController);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v7)
      objc_msgSend(v7, sel__presentTypographySettingsForFont_, v4);

  }
  else
  {

  }
}

@end
