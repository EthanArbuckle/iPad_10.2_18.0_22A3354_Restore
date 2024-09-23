@implementation CompactSignatureStrokeWidthControl

- (int64_t)width
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_width);
}

- (NSString)unit
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_unit);
  v3 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_unit);
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x1DF0E41AC](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC8PaperKit34CompactSignatureStrokeWidthControl)initWithCoder:(id)a3
{
  id v4;
  _TtC8PaperKit34CompactSignatureStrokeWidthControl *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_strokePreviewWidth) = (Class)0x4036000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_strokePreviewRotationAngle) = (Class)0xBFE921FB54442D18;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl____lazy_storage___strokeWidthPreview) = 0;
  v4 = a3;

  result = (_TtC8PaperKit34CompactSignatureStrokeWidthControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double Width;
  double Height;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[CompactSignatureStrokeWidthControl layoutSubviews](&v6, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v2, sel_bounds);
  Width = CGRectGetWidth(v7);
  objc_msgSend(v2, sel_bounds);
  Height = CGRectGetHeight(v8);
  if (Height >= Width)
    Height = Width;
  objc_msgSend(v3, sel_setCornerRadius_, Height * 0.5);

}

- (BOOL)isSelected
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  @objc CompactSignatureStrokeWidthControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (BOOL)isHighlighted
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  @objc CompactSignatureStrokeWidthControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isEnabled
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  @objc CompactSignatureStrokeWidthControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setEnabled_);
}

- (_TtC8PaperKit34CompactSignatureStrokeWidthControl)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit34CompactSignatureStrokeWidthControl *result;

  result = (_TtC8PaperKit34CompactSignatureStrokeWidthControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl____lazy_storage___strokeWidthPreview));
}

@end
