@implementation MoveModeSettingsViewControllerDiffableDataSource

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  id v7;
  _TtC10FitnessApp48MoveModeSettingsViewControllerDiffableDataSource *v8;
  id v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;

  v6 = (void *)objc_opt_self(NSBundle);
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, "mainBundle");
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v9, "localizedStringForKey:value:table:", v10, 0, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v13 = v12;

  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  return v14;
}

- (_TtC10FitnessApp48MoveModeSettingsViewControllerDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC10FitnessApp48MoveModeSettingsViewControllerDiffableDataSource *v11;
  objc_super v13;
  _QWORD aBlock[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100799BC0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  aBlock[4] = sub_10038E2A0;
  v15 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1002C4250;
  aBlock[3] = &unk_100799BD8;
  v8 = _Block_copy(aBlock);
  v9 = v15;
  v10 = a3;
  swift_retain(v7);
  swift_release(v9);
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MoveModeSettingsViewControllerDiffableDataSource();
  v11 = -[MoveModeSettingsViewControllerDiffableDataSource initWithTableView:cellProvider:](&v13, "initWithTableView:cellProvider:", v10, v8);

  swift_release(v7);
  _Block_release(v8);
  return v11;
}

@end
