@implementation PageActionButton

- (_TtC9SeymourUI16PageActionButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 3;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16PageActionButton_style) = 0;
  __asm { FMOV            V0.2D, #14.0 }
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC9SeymourUI16PageActionButton_styleProvider) = _Q0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI16PageActionButton_minimumHeightConstraint) = 0;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for PageActionButton();
  return -[PageActionButton initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI16PageActionButton)initWithCoder:(id)a3
{
  return (_TtC9SeymourUI16PageActionButton *)sub_22B45682C(a3);
}

- (void).cxx_destruct
{
  sub_22B2A2494(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *((_BYTE *)&self->super.super.super._cachedTraitCollection + OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16PageActionButton_minimumHeightConstraint));
}

@end
