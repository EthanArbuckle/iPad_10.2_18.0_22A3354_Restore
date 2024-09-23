@implementation DiscoverySheetViewController

- (void)viewDidLoad
{
  _TtC10FitnessApp28DiscoverySheetViewController *v2;

  v2 = self;
  sub_10052CD04();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DiscoverySheetViewController(0);
  v4 = v7.receiver;
  -[DiscoverySheetViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  sub_10052D390();
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_delegate]);
  if (Strong)
  {
    v6 = Strong;
    sub_1002AB198(v4[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_dataModel]);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)didTapXButton
{
  _TtC10FitnessApp28DiscoverySheetViewController *v2;

  v2 = self;
  sub_10052D848();
  -[DiscoverySheetViewController dismissViewControllerAnimated:completion:](v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)didTapContinueButton
{
  uint64_t Strong;
  uint64_t v3;
  _TtC10FitnessApp28DiscoverySheetViewController *v4;

  v4 = self;
  sub_10052D828();
  Strong = swift_unknownObjectWeakLoadStrong(&v4->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_delegate]);
  if (Strong)
  {
    v3 = Strong;
    sub_1002AB5C4(v4);

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

- (_TtC10FitnessApp28DiscoverySheetViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC10FitnessApp28DiscoverySheetViewController *result;

  result = (_TtC10FitnessApp28DiscoverySheetViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.DiscoverySheetViewController", 39, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp28DiscoverySheetViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC10FitnessApp28DiscoverySheetViewController *result;

  v6 = a5;
  result = (_TtC10FitnessApp28DiscoverySheetViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.DiscoverySheetViewController", 39, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  CHWorkoutDetailHeartRateTableViewCell *v3;
  SEL v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SEL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 *v18;
  uint64_t v19;

  sub_1000F61B4((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_delegate]);
  v3 = *(CHWorkoutDetailHeartRateTableViewCell **)&self->delegate[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_dataModel
                                                                + 8];
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->dataModel[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_dataModel], v4, v5, v6, v7, v8, v9, v10);
  swift_bridgeObjectRelease(v3, v11, v12, v13, v14, v15, v16, v17);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_eventHub]);
  v18 = &self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_metricPage];
  v19 = type metadata accessor for MetricPage(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
}

@end
