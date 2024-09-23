@implementation ToolbarButton

- (_TtC5Books13ToolbarButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s5Books13ToolbarButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)sendActionsForControlEvents:(unint64_t)a3
{
  _TtC5Books13ToolbarButton *v4;

  v4 = self;
  ToolbarButton.sendActions(for:)(a3);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Books13ToolbarButton *v11;

  v7 = sub_100009E04(0, (unint64_t *)&qword_1009DF0D8, UITouch_ptr);
  v8 = sub_1004AF1C8();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  ToolbarButton.touchesEnded(_:with:)(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)accessibilityContrastChanged
{
  _TtC5Books13ToolbarButton *v2;

  v2 = self;
  sub_1004ADAB4();

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC5Books13ToolbarButton *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_1004ADCAC(a4);

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (BOOL)isEnabled
{
  return sub_1004AE8AC(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ToolbarButton();
  v4 = v7.receiver;
  -[ToolbarButton setEnabled:](&v7, "setEnabled:", v3);
  if (objc_msgSend(v4, "isEnabled", v7.receiver, v7.super_class))
    v5 = sub_1004AE6DC();
  else
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "tertiaryLabelColor");
  v6 = v5;
  objc_msgSend(v4, "setTitleColor:forStates:", v5, 0);

}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  char v4;
  id v7;
  _TtC5Books13ToolbarButton *v8;
  UIImage_optional v9;

  v4 = a4;
  v7 = a3;
  v8 = self;
  v9.value.super.isa = (Class)a3;
  v9.is_nil = v4;
  ToolbarButton.setImage(_:for:)(v9, (UIControlState)v8);

}

- (void)didHover:(id)a3
{
  id v4;
  _TtC5Books13ToolbarButton *v5;

  v4 = a3;
  v5 = self;
  sub_1004AE418(v4);

}

- (BOOL)isSelected
{
  return sub_1004AE8AC(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC5Books13ToolbarButton *v4;

  v4 = self;
  ToolbarButton.isSelected.setter(a3);

}

- (BOOL)isHighlighted
{
  return sub_1004AE8AC(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC5Books13ToolbarButton *v4;

  v4 = self;
  ToolbarButton.isHighlighted.setter(a3);

}

- (CGSize)intrinsicContentSize
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  char *v7;
  double v8;
  double v9;
  char v10[24];
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ToolbarButton();
  v2 = (char *)v11.receiver;
  -[ToolbarButton intrinsicContentSize](&v11, "intrinsicContentSize");
  v5 = v4;
  if (v3 > 28.0)
    v6 = v3;
  else
    v6 = 28.0;
  v7 = &v2[OBJC_IVAR____TtC5Books13ToolbarButton_size];
  swift_beginAccess(&v2[OBJC_IVAR____TtC5Books13ToolbarButton_size], v10, 0, 0);
  LODWORD(v7) = *v7;

  v8 = 32.0;
  if (!(_DWORD)v7)
    v8 = 28.0;
  if (v5 > v8)
    v8 = v5;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC5Books13ToolbarButton)initWithFrame:(CGRect)a3
{
  _TtC5Books13ToolbarButton *result;

  result = (_TtC5Books13ToolbarButton *)_swift_stdlib_reportUnimplementedInitializer("Books.ToolbarButton", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books13ToolbarButton_hoverRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books13ToolbarButton_symbolTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books13ToolbarButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books13ToolbarButton_highlightView));
}

@end
