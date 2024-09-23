@implementation SymbolButton

- (_TtC11MusicCoreUI12SymbolButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11MusicCoreUI12SymbolButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  _TtC11MusicCoreUI12SymbolButton *v2;

  v2 = self;
  SymbolButton.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC11MusicCoreUI12SymbolButton *v5;
  id v6;
  UITraitCollection_optional v7;

  v6 = a3;
  v5 = self;
  v7.value.super.isa = (Class)a3;
  SymbolButton.traitCollectionDidChange(_:)(v7);

}

- (CGSize)intrinsicContentSize
{
  _TtC11MusicCoreUI12SymbolButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = SymbolButton.intrinsicContentSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)tintColorDidChange
{
  uint64_t v3;
  char *v4;
  objc_class *v5;
  _TtC11MusicCoreUI12SymbolButton *v6;
  uint64_t v7;
  _BYTE v9[24];
  objc_super v10;

  type metadata accessor for SymbolButton.Configuration(0);
  __chkstk_darwin();
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = (objc_class *)type metadata accessor for SymbolButton(0);
  v10.receiver = self;
  v10.super_class = v5;
  v6 = self;
  -[SymbolButton tintColorDidChange](&v10, "tintColorDidChange");
  v7 = (uint64_t)v6 + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton__configuration;
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton__configuration, v9, 0, 0);
  sub_1000A2258(v7, (uint64_t)v4, type metadata accessor for SymbolButton.Configuration);
  sub_10037885C((uint64_t)v4);
  sub_100034960((uint64_t)v4, type metadata accessor for SymbolButton.Configuration);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SymbolButton intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)hitRect
{
  _TtC11MusicCoreUI12SymbolButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = SymbolButton.hitRect()();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC11MusicCoreUI12SymbolButton *v8;
  unsigned __int8 v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (UIViewIgnoresTouchEvents(v8))
  {

LABEL_4:
    v8 = 0;
    return v8;
  }
  v9 = -[SymbolButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y);

  if ((v9 & 1) == 0)
    goto LABEL_4;
  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC11MusicCoreUI12SymbolButton *v8;
  BOOL v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[SymbolButton hitRect](v8, "hitRect");
  v11.x = x;
  v11.y = y;
  v9 = CGRectContainsPoint(v12, v11);

  return v9;
}

- (BOOL)isHighlighted
{
  return sub_1003771BC(self, (uint64_t)a2, type metadata accessor for SymbolButton, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC11MusicCoreUI12SymbolButton *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for SymbolButton(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SymbolButton isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[SymbolButton setHighlighted:](&v8, "setHighlighted:", v3);
  sub_100376D1C(v7);

}

- (BOOL)isSelected
{
  return sub_1003771BC(self, (uint64_t)a2, type metadata accessor for SymbolButton, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC11MusicCoreUI12SymbolButton *v4;

  v4 = self;
  SymbolButton.isSelected.setter(a3);

}

- (BOOL)isEnabled
{
  return sub_1003771BC(self, (uint64_t)a2, type metadata accessor for SymbolButton, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC11MusicCoreUI12SymbolButton *v4;

  v4 = self;
  SymbolButton.isEnabled.setter(a3);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC11MusicCoreUI12SymbolButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = _s11MusicCoreUI12SymbolButtonC22contextMenuInteraction_016configurationForG10AtLocationSo09UIContextG13ConfigurationCSgSo0mgH0C_So7CGPointVtF_0();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (UIImageView)accessibilityImageView
{
  _TtC11MusicCoreUI12SymbolButton *v2;
  id v3;

  v2 = self;
  v3 = sub_100377664();

  return (UIImageView *)v3;
}

- (UILabel)accessibilityTitleLabel
{
  _TtC11MusicCoreUI12SymbolButton *v2;
  id v3;

  v2 = self;
  v3 = sub_1003777C8();

  return (UILabel *)v3;
}

- (UIView)accessibilityCustomView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_customView));
}

- (_TtC11MusicCoreUI12SymbolButton)initWithFrame:(CGRect)a3
{
  sub_100229C24((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicCoreUI.SymbolButton", 24);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_configurationProvider), *(_QWORD *)&self->debugLabel[OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_configurationProvider]);
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_handler), *(_QWORD *)&self->debugLabel[OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_handler]);
  sub_100034960((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton__configuration, type metadata accessor for SymbolButton.Configuration);
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_buildMenu), *(_QWORD *)&self->debugLabel[OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_buildMenu]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_customView));

  sub_10000FE2C((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton____lazy_storage___metrics, &qword_1004CD9C0);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC11MusicCoreUI12SymbolButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s11MusicCoreUI12SymbolButtonC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0jG0C_So0J6RegionCtF_0(v6);

  return v9;
}

@end
