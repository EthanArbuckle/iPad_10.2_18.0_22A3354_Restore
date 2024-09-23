@implementation ReadingLoupeOverlayView

- (_TtC8BookEPUB23ReadingLoupeOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8BookEPUB23ReadingLoupeOverlayView *)ReadingLoupeOverlayView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8BookEPUB23ReadingLoupeOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_15C724();
}

- (void)dealloc
{
  _TtC8BookEPUB23ReadingLoupeOverlayView *v2;

  v2 = self;
  ReadingLoupeOverlayView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_readingLoupeView);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_readingSettingsProvider);
  swift_release();
  swift_release();
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_bookLayoutModeProvider);
  swift_release();
  sub_15C888(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_currentTheme), *(_QWORD *)&self->readingLoupeView[OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_currentTheme]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_topGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_bottomGradientLayer));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t Strong;
  void *v9;
  id v10;
  _TtC8BookEPUB23ReadingLoupeOverlayView *v11;
  _BOOL4 v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_readingLoupeView);
  if (!Strong)
    goto LABEL_4;
  v9 = (void *)Strong;
  v10 = a4;
  v11 = self;
  objc_msgSend(v9, "frame");
  v14.x = x;
  v14.y = y;
  v12 = CGRectContainsPoint(v15, v14);

  if (v12)
  {

LABEL_4:
    v11 = 0;
  }
  return v11;
}

@end
