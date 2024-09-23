@implementation BookContentHostView

- (_TtC8BookEPUB19BookContentHostView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AA978();
}

- (_TtC8BookEPUB19BookContentHostView)initWithFrame:(CGRect)a3
{
  _TtC8BookEPUB19BookContentHostView *result;

  result = (_TtC8BookEPUB19BookContentHostView *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.BookContentHostView", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_15C888(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_theme), *(_QWORD *)&self->theme[OBJC_IVAR____TtC8BookEPUB19BookContentHostView_theme]);
  sub_1AA8F0((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19BookContentHostView____lazy_storage___logger);
  swift_bridgeObjectRelease(*(_QWORD *)&self->theme[OBJC_IVAR____TtC8BookEPUB19BookContentHostView_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->theme[OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerText]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageLabels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageLabelBackgroundViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerLabels));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_contentViewLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageLabelContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageLabelHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerLabelContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerLabelContainerLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerLabelContainerTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_contentTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_contentBottomConstraint));
}

@end
