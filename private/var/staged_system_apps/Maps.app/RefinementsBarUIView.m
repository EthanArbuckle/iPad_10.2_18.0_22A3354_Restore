@implementation RefinementsBarUIView

- (UIView)hostingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView));
}

- (void)setHostingView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView) = (Class)a3;
  v3 = a3;

}

- (_TtP4Maps26RefinementsBarViewDelegate_)delegate
{
  return (_TtP4Maps26RefinementsBarViewDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps20RefinementsBarUIView_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_delegate, a3);
}

- (_TtC4Maps20RefinementsBarUIView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps20RefinementsBarUIView *)sub_10011CDF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps20RefinementsBarUIView)initWithCoder:(id)a3
{
  _OWORD *v5;
  id v6;
  _TtC4Maps20RefinementsBarUIView *result;

  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar);
  *v5 = 0u;
  v5[1] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_delegate, 0);
  v6 = a3;

  result = (_TtC4Maps20RefinementsBarUIView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/RefinementsBarUIView.swift", 31, 2, 32, 0);
  __break(1u);
  return result;
}

- (_TtC4Maps23RefinementsBarViewModel)viewModel
{
  uint64_t *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC4Maps20RefinementsBarUIView *v8;
  id v9;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar);
  v3 = *(void **)&self->refinementBar[OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar];
  if (v3)
  {
    v6 = v2[2];
    v5 = v2[3];
    v7 = *v2;
    sub_10011D998(*v2, v3, v6, v5);
    sub_10011D998(v7, v3, v6, v5);
    v8 = self;
    swift_release();

    v9 = v3;
    sub_10011D9C4(v7, v3, v6, v5);

  }
  else
  {
    v9 = 0;
  }
  return (_TtC4Maps23RefinementsBarViewModel *)v9;
}

- (void)setViewModel:(id)a3
{
  id v5;
  _TtC4Maps20RefinementsBarUIView *v6;

  v5 = a3;
  v6 = self;
  sub_10011D24C(a3);

}

- (void).cxx_destruct
{
  sub_10011D9C4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar), *(void **)&self->refinementBar[OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar], *(_QWORD *)&self->refinementBar[OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar + 8], *(_QWORD *)&self->refinementBar[OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar + 16]);

  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_delegate);
}

@end
