@implementation DOCContainerFittingView

- (double)contentOffsetFromTop
{
  double *v2;
  _BYTE v4[24];

  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_contentOffsetFromTop);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_contentOffsetFromTop, v4, 0, 0);
  return *v2;
}

- (void)setContentOffsetFromTop:(double)a3
{
  double *v4;
  _BYTE v5[24];

  v4 = (double *)((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_contentOffsetFromTop);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_contentOffsetFromTop, v5, 1, 0);
  *v4 = a3;
}

- (void)layoutSubviews
{
  _TtC5Files23DOCContainerFittingView *v2;

  v2 = self;
  DOCContainerFittingView.layoutSubviews()();

}

- (_TtC5Files23DOCContainerFittingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC5Files23DOCContainerFittingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files23DOCContainerFittingView_fittingSize);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files23DOCContainerFittingView_preventContentOffsetUpdates) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files23DOCContainerFittingView_contentOffsetFromTop) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files23DOCContainerFittingView_observationContext) = 0;
  v5 = a3;

  result = (_TtC5Files23DOCContainerFittingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Files/DOCContainerFittingView.swift", 35, 2, 383, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double *v2;
  double v3;
  double v4;
  _BYTE v5[24];
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_fittingSize);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_fittingSize, v5, 0, 0);
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double *v3;
  double v4;
  double v5;
  _BYTE v6[24];
  CGSize result;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_fittingSize);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files23DOCContainerFittingView_fittingSize, v6, 0, 0);
  v4 = *v3;
  v5 = v3[1];
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC5Files23DOCContainerFittingView)initWithFrame:(CGRect)a3
{
  _TtC5Files23DOCContainerFittingView *result;

  result = (_TtC5Files23DOCContainerFittingView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCContainerFittingView", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCContainerFittingView_containedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCContainerFittingView_observationContext));
}

@end
