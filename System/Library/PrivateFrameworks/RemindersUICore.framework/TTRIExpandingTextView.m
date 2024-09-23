@implementation TTRIExpandingTextView

- (BOOL)isScrollEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
  return -[TTRIExpandingTextView isScrollEnabled](&v3, sel_isScrollEnabled);
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC15RemindersUICore21TTRIExpandingTextView *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for TTRIExpandingTextView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[TTRIExpandingTextView isScrollEnabled](&v9, sel_isScrollEnabled);
  v8.receiver = v6;
  v8.super_class = v5;
  -[TTRIExpandingTextView setScrollEnabled:](&v8, sel_setScrollEnabled_, v3);
  if (v7 != -[TTRIExpandingTextView isScrollEnabled](v6, sel_isScrollEnabled))
    TTRIExpandingTextView.updateTextStorageObserver()();

}

- (_TtC15RemindersUICore21TTRIExpandingTextView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore21TTRIExpandingTextView *)TTRIExpandingTextView.init(coder:)(a3);
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double height;
  double width;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
  -[TTRIExpandingTextView _layoutSizeThatFits:fixedAxes:](&v9, sel__layoutSizeThatFits_fixedAxes_, a4, width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  _TtC15RemindersUICore21TTRIExpandingTextView *v2;
  double BaselineOffsetFrom;

  v2 = self;
  BaselineOffsetFrom = TTRIExpandingTextView.effectiveFirstBaselineOffsetFromTop()();

  return BaselineOffsetFrom;
}

- (double)effectiveBaselineOffsetFromBottom
{
  _TtC15RemindersUICore21TTRIExpandingTextView *v2;
  double v3;

  v2 = self;
  v3 = TTRIExpandingTextView.effectiveBaselineOffsetFromBottom()();

  return v3;
}

- (_TtC15RemindersUICore21TTRIExpandingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC15RemindersUICore21TTRIExpandingTextView *result;

  v4 = a4;
  result = (_TtC15RemindersUICore21TTRIExpandingTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  sub_1B4806198(self, (uint64_t)a2, (SEL *)&selRef_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  _TtC15RemindersUICore21TTRIExpandingTextView *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  TTRIExpandingTextView.contentSize.setter(width, height);

}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  sub_1B4806198(self, (uint64_t)a2, (SEL *)&selRef_contentOffset);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  _TtC15RemindersUICore21TTRIExpandingTextView *v5;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  if (-[TTRIExpandingTextView isScrollEnabled](v5, sel_isScrollEnabled))
  {
    v6.receiver = v5;
    v6.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
    -[TTRIExpandingTextView setContentOffset:](&v6, sel_setContentOffset_, x, y);

  }
  else
  {

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15RemindersUICore21TTRIExpandingTextView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = TTRIExpandingTextView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_shouldScrollEnclosingScrollView
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  _TtC15RemindersUICore21TTRIExpandingTextView *v2;
  unsigned int v3;

  v2 = self;
  v3 = -[TTRIExpandingTextView canBecomeFirstResponder](v2, sel_canBecomeFirstResponder);
  if (v3)
    -[TTRIExpandingTextView becomeFirstResponder](v2, sel_becomeFirstResponder);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIExpandingTextView();
  v2 = v7.receiver;
  v3 = -[TTRIExpandingTextView accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = (unint64_t)objc_msgSend((id)objc_opt_self(), sel_textArea, v7.receiver, v7.super_class);

  v5 = -1;
  if ((v4 & v3) != 0)
    v5 = ~v4;
  return v5 & v3;
}

@end
