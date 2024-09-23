@implementation _UIIntelligenceButton

- (_TtC5UIKit21_UIIntelligenceButton)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit21_UIIntelligenceButton *)sub_185722828(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_allowsSymbolAnimations
{
  return 0;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIIntelligenceButton();
  return -[UIControl isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC5UIKit21_UIIntelligenceButton *v4;

  v4 = self;
  sub_185722BC8(a3);

}

- (void)layoutSubviews
{
  _TtC5UIKit21_UIIntelligenceButton *v2;

  v2 = self;
  sub_185722EA4();

}

- (void)updateConfiguration
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIIntelligenceButton();
  v2 = (char *)v5.receiver;
  -[UIButton updateConfiguration](&v5, sel_updateConfiguration);
  v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_imagePortal];
  v4 = objc_msgSend(v2, sel__imageEffectContainerView, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setSourceView_, v4);

  sub_185723078();
}

- (_TtC5UIKit21_UIIntelligenceButton)initWithCoder:(id)a3
{
  id v4;
  _TtC5UIKit21_UIIntelligenceButton *result;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_isExpanded) = 0;
  v4 = a3;

  result = (_TtC5UIKit21_UIIntelligenceButton *)sub_186507E04();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_imagePortal));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_highlightTransformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_colorView));
}

@end
