@implementation HomeScreenConfigurationControl

- (UIView)previewContentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_previewContentView));
}

- (void)setPreviewContentView:(id)a3
{
  id v4;
  _TtC11PosterBoard30HomeScreenConfigurationControl *v5;

  v4 = a3;
  v5 = self;
  sub_1CBAFFD04(v4);

}

- (_TtC11PosterBoard30HomeScreenConfigurationControl)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC11PosterBoard30HomeScreenConfigurationControl *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_title);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_showsSymbolWhenSelected) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_maximumHorizontalTitleOutset) = 0;
  v5 = a3;

  result = (_TtC11PosterBoard30HomeScreenConfigurationControl *)sub_1CBB82ACC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11PosterBoard30HomeScreenConfigurationControl *v2;

  v2 = self;
  sub_1CBB00358();

}

- (BOOL)isSelected
{
  return sub_1CBB00C28(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC11PosterBoard30HomeScreenConfigurationControl *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for HomeScreenConfigurationControl();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[HomeScreenConfigurationControl isSelected](&v9, sel_isSelected);
  v8.receiver = v6;
  v8.super_class = v5;
  -[HomeScreenConfigurationControl setSelected:](&v8, sel_setSelected_, v3);
  sub_1CBB0072C(v7);

}

- (BOOL)isHighlighted
{
  return sub_1CBB00C28(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC11PosterBoard30HomeScreenConfigurationControl *v4;

  v4 = self;
  sub_1CBB00AEC(a3);

}

- (BOOL)isEnabled
{
  return sub_1CBB00C28(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC11PosterBoard30HomeScreenConfigurationControl *v4;

  v4 = self;
  sub_1CBB00CA4(a3);

}

- (_TtC11PosterBoard30HomeScreenConfigurationControl)initWithFrame:(CGRect)a3
{
  sub_1CBB0168C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_previewContentView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_symbolImageView));
}

@end
