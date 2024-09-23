@implementation SleepScheduleDayPickerDay

- (_TtC13SleepHealthUI25SleepScheduleDayPickerDay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9BEC8B8();
}

- (void)layoutSubviews
{
  _TtC13SleepHealthUI25SleepScheduleDayPickerDay *v2;

  v2 = self;
  sub_1A9BEB8C4();

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SleepScheduleDayPickerDay();
  v2 = v3.receiver;
  -[SleepScheduleDayPickerDay tintColorDidChange](&v3, sel_tintColorDidChange);
  sub_1A9BEBD24();

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SleepScheduleDayPickerDay();
  return -[SleepScheduleDayPickerDay isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SleepScheduleDayPickerDay();
  v4 = v5.receiver;
  -[SleepScheduleDayPickerDay setSelected:](&v5, sel_setSelected_, v3);
  sub_1A9BEBD24();

}

- (id)accessibilityWeekday
{
  _TtC13SleepHealthUI25SleepScheduleDayPickerDay *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = -[SleepScheduleDayPickerDay largeContentTitle](v2, sel_largeContentTitle);
  if (v3
    || (v3 = objc_msgSend(*(id *)((char *)&v2->super.super.super.super.isa+ OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_dayLabel), sel_text)) != 0)
  {
    sub_1A9CE82E0();

    v4 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v4 = 0;
  }
  return v4;
}

- (_TtC13SleepHealthUI25SleepScheduleDayPickerDay)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI25SleepScheduleDayPickerDay *result;

  result = (_TtC13SleepHealthUI25SleepScheduleDayPickerDay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  v4 = *(NSMutableArray **)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  v5 = *(UITraitCollection **)((char *)&self->super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  v6 = *(UIViewAnimationInfo **)((char *)&self->super.super._animationInfo
                               + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  v7 = *(id *)((char *)&self->super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration);
  objc_release(*(id *)((char *)&self->super.super._layerRetained
                     + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_configuration));

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_elsewhereIndicator));
}

@end
