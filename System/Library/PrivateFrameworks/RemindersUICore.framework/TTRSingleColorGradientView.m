@implementation TTRSingleColorGradientView

- (_TtC15RemindersUICore26TTRSingleColorGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore26TTRSingleColorGradientView *)TTRSingleColorGradientView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore26TTRSingleColorGradientView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore26TTRSingleColorGradientView *)TTRSingleColorGradientView.init(coder:)(a3);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *v3;
  CGContext *v4;
  void *v5;
  _TtC15RemindersUICore26TTRSingleColorGradientView *v6;

  v6 = self;
  v3 = UIGraphicsGetCurrentContext();
  if (v3)
  {
    v4 = v3;
    -[TTRSingleColorGradientView bounds](v6, sel_bounds);
    sub_1B44F6BCC(v4);

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRSingleColorGradientView_color));
  sub_1B4224758(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore26TTRSingleColorGradientView_lighteningGradient), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore26TTRSingleColorGradientView_lighteningGradient));
  sub_1B4224758(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore26TTRSingleColorGradientView_darkeningGradient), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore26TTRSingleColorGradientView_darkeningGradient));
}

@end
