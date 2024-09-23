@implementation MenuPickerButton

- (_TtC9SeymourUI16MenuPickerButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16MenuPickerButton *)sub_22B31E2A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI16MenuPickerButton)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC9SeymourUI16MenuPickerButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textForegroundColor) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(_OWORD *)(v4 + 40) = xmmword_22BA9A430;
  v5 = a3;

  result = (_TtC9SeymourUI16MenuPickerButton *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  _TtC9SeymourUI16MenuPickerButton *v2;

  v2 = self;
  sub_22B31E588();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textForegroundColor));
  sub_22B31ECAC(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor), *(void **)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor), *(void **)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor), *(void **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor), *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor), *(uint64_t *)((char *)&self->super.super.super._animationInfo+ OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor));
}

@end
