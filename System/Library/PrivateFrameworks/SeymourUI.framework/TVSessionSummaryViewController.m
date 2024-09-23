@implementation TVSessionSummaryViewController

- (NSArray)preferredFocusEnvironments
{
  _TtC9SeymourUI30TVSessionSummaryViewController *v2;
  void *v3;

  v2 = self;
  sub_22B8DE8C8();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v3 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC9SeymourUI30TVSessionSummaryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B8E2F58();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC9SeymourUI30TVSessionSummaryViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  v5 = sub_22BA79CF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TVSessionSummaryViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  -[TVSessionSummaryViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
  v11[1] = v10;
  sub_22B94A714((uint64_t)v8);
  sub_22B8E2F10();
  sub_22BA7DC94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI30TVSessionSummaryViewController *v4;

  v4 = self;
  sub_22B8DF96C(a3);

}

- (void)menuButtonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC9SeymourUI30TVSessionSummaryViewController *v4;

  v2 = (void (*)(uint64_t))(*(_QWORD **)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_presenter))[4];
  if (v2)
  {
    v4 = self;
    v3 = sub_22B0FAA58((uint64_t)v2);
    v2(v3);
    sub_22B0FAA68((uint64_t)v2);

  }
}

- (_TtC9SeymourUI30TVSessionSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI30TVSessionSummaryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI30TVSessionSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_storefrontLocalizer);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_metricGridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_upNextSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_queueCompleteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_topPaddingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_bottomPaddingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_gridViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_gridViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_gridViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsTopPinningConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsBottomPinningConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsTrailingConstraint));
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_summary, &qword_255B8CB58);
  swift_bridgeObjectRelease();
}

@end
