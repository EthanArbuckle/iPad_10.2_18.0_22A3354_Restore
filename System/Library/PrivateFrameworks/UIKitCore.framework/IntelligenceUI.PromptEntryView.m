@implementation IntelligenceUI.PromptEntryView

- (void)dictationAvailabilityDidChange
{
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v2;

  v2 = self;
  sub_18574037C();

}

- (_TtCO5UIKit14IntelligenceUI15PromptEntryView)initWithFrame:(CGRect)a3
{
  return (_TtCO5UIKit14IntelligenceUI15PromptEntryView *)IntelligenceUI.PromptEntryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO5UIKit14IntelligenceUI15PromptEntryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s5UIKit14IntelligenceUIO15PromptEntryViewC5coderAESgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_bridgeObjectRelease();
  sub_18563E558((uint64_t)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_accessoryView));
  if (*(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_visibleLineLimit))
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_visibleLineLimit);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_leadingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView____lazy_storage___backgroundView));
  v3 = (char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_styleAttributesForAmbiguity;
  v4 = sub_1865069AC();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_styleAttributesForResolvedAmbiguity, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView__privatePressGestureRecognizerDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_placeholderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_accessorySeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_containerScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_buttonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_placeholderEffectView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_modifierKeyRecognizer));
}

- (void)promptBackgroundViewDidUpdateConfiguration:(id)a3
{
  id v4;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v5;

  v4 = a3;
  v5 = self;
  sub_1857439BC((uint64_t)v4);

}

- (CGSize)intrinsicContentSize
{
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  -[UIView bounds](v2, sel_bounds);
  -[IntelligenceUI.PromptEntryView sizeThatFits:](v2, sel_sizeThatFits_, v3, v4);
  v6 = v5;

  v7 = -1.0;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_185742DC0();
  sub_185746ACC(v6, v8, v7 & 1, width, height);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[IntelligenceUI.PromptEntryView sizeThatFits:](self, sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v2;

  v2 = self;
  IntelligenceUI.PromptEntryView.layoutSubviews()();

}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  UITextView *v4;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v5;

  v4 = (UITextView *)a3;
  v5 = self;
  IntelligenceUI.PromptEntryView.textViewShouldBeginEditing(_:)(v4);

  return 1;
}

- (void)textViewDidChange:(id)a3
{
  UITextView *v4;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v5;

  v4 = (UITextView *)a3;
  v5 = self;
  IntelligenceUI.PromptEntryView.textViewDidChange(_:)(v4);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v9;
  void *v10;
  void *v11;
  UITextView *v12;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v13;
  __C::_NSRange v14;
  Swift::String v15;

  length = a4.length;
  location = a4.location;
  v9 = sub_1865074F8();
  v11 = v10;
  v12 = (UITextView *)a3;
  v13 = self;
  v14.location = location;
  v14.length = length;
  v15._countAndFlagsBits = v9;
  v15._object = v11;
  LOBYTE(length) = IntelligenceUI.PromptEntryView.textView(_:shouldChangeTextIn:replacementText:)(v12, v14, v15);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v5;

  v4 = a3;
  v5 = self;
  _s5UIKit14IntelligenceUIO15PromptEntryViewC04textF18DidChangeSelectionyySo06UITextF0CF_0();

}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  _s5UIKit14IntelligenceUIO15PromptEntryViewC04textF0_20menuConfigurationFor11defaultMenuSo010UITextItemlI0CSgSo0mF0C_So0mN0CSo6UIMenuCtF_0(v8, v9);
  v13 = v12;

  return v13;
}

- (void)_textView:(id)a3 insertTextSuggestion:(id)a4
{
  char *v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  id v11;
  _TtCO5UIKit14IntelligenceUI15PromptEntryView *v12;

  v7 = (char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_delegate;
  swift_beginAccess();
  if (MEMORY[0x186DCA138](v7))
  {
    v8 = *((_QWORD *)v7 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 56);
    v10 = a3;
    v11 = a4;
    v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

@end
