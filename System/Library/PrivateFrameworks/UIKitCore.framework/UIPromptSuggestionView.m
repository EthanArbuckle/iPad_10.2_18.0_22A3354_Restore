@implementation UIPromptSuggestionView

- (_TtC5UIKit22UIPromptSuggestionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s5UIKit22UIPromptSuggestionViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIPromptSuggestionView(0);
  return -[UIControl isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  unsigned int v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UIPromptSuggestionView(0);
  v4 = (char *)v8.receiver;
  -[UIControl setHighlighted:](&v8, sel_setHighlighted_, v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_label];
  v6 = objc_msgSend(v4, sel_isHighlighted, v8.receiver, v8.super_class);
  v7 = 0.65;
  if (!v6)
    v7 = 1.0;
  objc_msgSend(v5, sel_setAlpha_, v7);

}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC5UIKit22UIPromptSuggestionView *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  if (-[UIControl isTouchInside](v7, sel_isTouchInside))
    -[UIControl performPrimaryAction](v7, sel_performPrimaryAction);

}

- (_TtC5UIKit22UIPromptSuggestionView)initWithFrame:(CGRect)a3
{
  _TtC5UIKit22UIPromptSuggestionView *result;

  result = (_TtC5UIKit22UIPromptSuggestionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1855C7050((uint64_t)self + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_configuration, type metadata accessor for UIPromptSuggestionView.Configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_backdropView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_imageButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_contentView));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC5UIKit22UIPromptSuggestionView *v6;
  id v7;
  _QWORD *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_label);
  v6 = self;
  v7 = objc_msgSend(v5, sel_numberOfLines);
  v8 = (Class *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR____TtC5UIKit22UIPromptSuggestionView_configuration);
  swift_beginAccess();
  if (*v8)
    v9 = 60.0;
  else
    v9 = 34.0;
  objc_msgSend(v5, sel_textRectForBounds_limitedToNumberOfLines_, v7, 0.0, 0.0, width - v9, height);
  v11 = v10;
  v13 = v12;

  v14 = v13 + 28.0;
  v15 = v9 + v11;
  result.height = v14;
  result.width = v15;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIPromptSuggestionView sizeThatFits:](self, sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC5UIKit22UIPromptSuggestionView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  -[UIView bounds](v2, sel_bounds);
  -[UIPromptSuggestionView sizeThatFits:](v2, sel_sizeThatFits_, v3, v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC5UIKit22UIPromptSuggestionView *v2;

  v2 = self;
  UIPromptSuggestionView.layoutSubviews()();

}

@end
