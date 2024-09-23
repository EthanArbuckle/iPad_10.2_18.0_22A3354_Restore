@implementation LibraryCell

- (_TtC9Shortcuts11LibraryCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Shortcuts11LibraryCell *)sub_10000C254();
}

- (BOOL)isSelected
{
  _TtC9Shortcuts11LibraryCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10008AC94();

  return v3 & 1;
}

- (void)layoutSubviews
{
  _TtC9Shortcuts11LibraryCell *v2;

  v2 = self;
  sub_10008A8C4();

}

- (WFWorkflowReference)workflowReference
{
  id v2;

  sub_100089EC4();
  return (WFWorkflowReference *)v2;
}

- (void)setWorkflowReference:(id)a3
{
  id v5;
  _TtC9Shortcuts11LibraryCell *v6;

  v5 = a3;
  v6 = self;
  sub_100089F34((uint64_t)a3);

}

- (WFExecutableAppShortcut)autoShortcut
{
  id v2;

  sub_100089F60();
  return (WFExecutableAppShortcut *)v2;
}

- (void)setAutoShortcut:(id)a3
{
  id v5;
  _TtC9Shortcuts11LibraryCell *v6;

  v5 = a3;
  v6 = self;
  sub_100089FD0((uint64_t)a3);

}

- (_TtC9Shortcuts11LibraryCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10008A5A4();
}

- (void)prepareForReuse
{
  _TtC9Shortcuts11LibraryCell *v2;

  v2 = self;
  sub_10008A784();

}

- (void)setSelected:(BOOL)a3
{
  _TtC9Shortcuts11LibraryCell *v4;

  v4 = self;
  sub_10008AD04(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts11LibraryCell_hostingView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC9Shortcuts11LibraryCell_model));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC9Shortcuts11LibraryCell_progress));
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts11LibraryCell_observation);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut);
  swift_bridgeObjectRelease();
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics);
  sub_100014CFC((uint64_t)self + OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate);
  sub_10008C530(OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___run);
  sub_10008C530(OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___stop);
  sub_10000A798(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___accessibilitySelect), *(_QWORD *)&self->hostingView[OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___accessibilitySelect]);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC9Shortcuts11LibraryCell *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10008AF1C();
  v10 = v9;

  return v10;
}

@end
