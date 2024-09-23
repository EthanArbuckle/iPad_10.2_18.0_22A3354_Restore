@implementation UIPromptSuggestionContainerView

- (_TtC5UIKit31UIPromptSuggestionContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit31UIPromptSuggestionContainerView *)sub_1856C455C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5UIKit31UIPromptSuggestionContainerView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5UIKit31UIPromptSuggestionContainerView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5UIKit31UIPromptSuggestionContainerView_suggestionViews) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = OBJC_IVAR____TtC5UIKit31UIPromptSuggestionContainerView_contentView;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC5UIKit31UIPromptSuggestionContainerView *)sub_186507E04();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC5UIKit31UIPromptSuggestionContainerView *v2;

  v2 = self;
  sub_1856C4E20();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC5UIKit31UIPromptSuggestionContainerView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1856C5100((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit31UIPromptSuggestionContainerView_contentView));
}

@end
