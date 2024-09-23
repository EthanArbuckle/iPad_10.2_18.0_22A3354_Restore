@implementation SignatureStrokeWidthControl

- (int64_t)width
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_width);
}

- (NSString)unit
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_unit);
  v3 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_unit);
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x1DF0E41AC](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC8PaperKit27SignatureStrokeWidthControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized SignatureStrokeWidthControl.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC8PaperKit27SignatureStrokeWidthControl *v2;

  v2 = self;
  SignatureStrokeWidthControl.layoutSubviews()();

}

- (BOOL)isSelected
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  @objc SignatureStrokeWidthControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (BOOL)isHighlighted
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  @objc SignatureStrokeWidthControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isEnabled
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  @objc SignatureStrokeWidthControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setEnabled_);
}

- (_TtC8PaperKit27SignatureStrokeWidthControl)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit27SignatureStrokeWidthControl *result;

  result = (_TtC8PaperKit27SignatureStrokeWidthControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl____lazy_storage___strokeWidthPreview));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_contentButton));
  swift_bridgeObjectRelease();
}

@end
