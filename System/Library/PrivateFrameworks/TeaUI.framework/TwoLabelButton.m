@implementation TwoLabelButton

- (_TtC5TeaUI14TwoLabelButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI14TwoLabelButton *)TwoLabelButton.init(frame:)();
}

- (_TtC5TeaUI14TwoLabelButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  TwoLabelButton.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC5TeaUI14TwoLabelButton *v2;

  v2 = self;
  TwoLabelButton.layoutSubviews()();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B1692BD8(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))TwoLabelButton.touchesBegan(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1B1692BD8(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))TwoLabelButton.touchesCancelled(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1B1692BD8(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))TwoLabelButton.touchesEnded(_:with:));
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_titleLabelNormal);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_titleLabelHighlighted);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_labelNormal);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_labelHighlighted);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_borderColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_backgroundColorNormal);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_backgroundColorHighlighted);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_onTap);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_currentBorderColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI14TwoLabelButton_currentBackgroundColorNormal);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_currentBackgroundColorHighlighted));
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  Swift::Bool v6;
  Class isa;
  CAAnimation v8;

  v5 = a3;
  v8.super.isa = (Class)self;
  isa = v8.super.isa;
  v8._attr = 0;
  TwoLabelButton.animationDidStop(_:finished:)(v8, v6);

}

@end
