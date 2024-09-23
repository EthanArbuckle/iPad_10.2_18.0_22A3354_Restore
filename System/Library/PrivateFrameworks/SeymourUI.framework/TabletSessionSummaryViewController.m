@implementation TabletSessionSummaryViewController

- (_TtC9SeymourUI34TabletSessionSummaryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2B8158();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC9SeymourUI34TabletSessionSummaryViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  v5 = sub_22BA79CF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TabletSessionSummaryViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  -[TabletSessionSummaryViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
  v11[1] = v10;
  sub_22B94A714((uint64_t)v8);
  sub_22B2B9940();
  sub_22BA7DC94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI34TabletSessionSummaryViewController *v4;

  v4 = self;
  sub_22B2B3148(a3);

}

- (void)shareButtonTapped
{
  _TtC9SeymourUI34TabletSessionSummaryViewController *v2;

  v2 = self;
  sub_22B59FEDC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TabletSessionSummaryViewController();
  v4 = v8.receiver;
  v5 = a3;
  -[TabletSessionSummaryViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v5);
  v6 = objc_msgSend(v4, sel_view, v8.receiver, v8.super_class);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_setNeedsUpdateConstraints);

  }
  else
  {
    __break(1u);
  }
}

- (void)updateViewConstraints
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TabletSessionSummaryViewController();
  v2 = v3.receiver;
  -[TabletSessionSummaryViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  sub_22B2B53C0();
  sub_22B2B581C();

}

- (_TtC9SeymourUI34TabletSessionSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI34TabletSessionSummaryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI34TabletSessionSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_contentSummaryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_upNextSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_queueCompleteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_cooldownButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_stateOfMindLoggingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_ttrBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_shareBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_activityRingsBottomPinningConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarToContentSummaryLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarToActivityRingsTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarToGridViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarBottomPinningConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_contentSummaryTrailingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridViewHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridViewWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridViewTopSpacing));
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_summary, &qword_255B8CB58);
  swift_bridgeObjectRelease();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC9SeymourUI34TabletSessionSummaryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22B2B7AB8(v4);

}

- (uint64_t)ttrButtonTapped
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83400);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22BA797C4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FeedbackHandler();
  sub_22B9EEE5C((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
    return sub_22B0FB1DC((uint64_t)v2, (uint64_t *)&unk_255B83400);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)sub_22BA79740();
    objc_msgSend(v9, sel_openURL_configuration_completionHandler_, v10, 0, 0);

  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
