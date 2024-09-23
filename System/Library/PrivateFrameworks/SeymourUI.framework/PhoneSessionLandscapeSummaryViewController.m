@implementation PhoneSessionLandscapeSummaryViewController

- (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B93E684();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  v5 = sub_22BA79CF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for PhoneSessionLandscapeSummaryViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  -[PhoneSessionLandscapeSummaryViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
  v11[1] = v10;
  sub_22B94A714((uint64_t)v8);
  sub_22B93E63C();
  sub_22BA7DC94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController *v4;

  v4 = self;
  sub_22B938D28(a3);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhoneSessionLandscapeSummaryViewController();
  v2 = v3.receiver;
  -[PhoneSessionLandscapeSummaryViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_22B93AE3C();

}

- (void)updateViewConstraints
{
  _TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController *v2;
  objc_super v3;

  v2 = self;
  sub_22B93A888();
  sub_22B93AE3C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PhoneSessionLandscapeSummaryViewController();
  -[PhoneSessionLandscapeSummaryViewController updateViewConstraints](&v3, sel_updateViewConstraints);

}

- (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_contentSummaryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_scrollViewSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_leadingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_upNextSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_queueCompleteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_trailingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_cooldownButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_stateOfMindLoggingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_ttrButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_activityRingsToScrollViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToContentSummaryLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToActivityRingsTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToGridViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToScrollViewBottomConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_trailingStackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridViewHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridViewWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridViewTopSpacing));
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_summary, &qword_255B8CB58);
  swift_bridgeObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22B93CA18(a3);

}

@end
