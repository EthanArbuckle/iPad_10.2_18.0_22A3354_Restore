@implementation PhoneSessionPortraitSummaryViewController

- (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7DF3C4();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *v2;

  v2 = self;
  sub_22B7DB5E0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  v5 = sub_22BA79CF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for PhoneSessionPortraitSummaryViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  -[PhoneSessionPortraitSummaryViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
  v11[1] = v10;
  sub_22B94A714((uint64_t)v8);
  sub_22B0F3C60(&qword_255BADAB0, (uint64_t (*)(uint64_t))type metadata accessor for PhoneSessionPortraitSummaryViewController, (uint64_t)&unk_22BAB7988);
  sub_22BA7DC94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *v4;

  v4 = self;
  sub_22B7DB89C(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *v2;

  v2 = self;
  sub_22B7DC8C8();

}

- (void)updateViewConstraints
{
  _TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *v2;
  objc_super v3;

  v2 = self;
  sub_22B7DD7C0();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PhoneSessionPortraitSummaryViewController();
  -[PhoneSessionPortraitSummaryViewController updateViewConstraints](&v3, sel_updateViewConstraints);

}

- (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_contentSummaryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_mediaTagStringBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_cooldownButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_ttrButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_activityRingsToScrollViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_contentSummaryViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridViewHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridViewWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridViewTopSpacing));
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_summary, &qword_255B8CB58);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22B7DE1C0(a3);

}

@end
