@implementation FMDeviceEditableMessageViewController

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy37FMDeviceEditableMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10007AA58();

}

- (void)updateViewConstraints
{
  char *v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMDeviceEditableMessageViewController(0);
  v2 = (char *)v7.receiver;
  -[FMDeviceEditableMessageViewController updateViewConstraints](&v7, "updateViewConstraints");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy37FMDeviceEditableMessageViewController_tableViewheightConstraint];
  if (v3)
  {
    v4 = *(void **)&v2[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_tableView];
    v5 = v3;
    objc_msgSend(v4, "intrinsicContentSize", v7.receiver, v7.super_class);
    objc_msgSend(v5, "setConstant:", v6);

  }
  else
  {
    __break(1u);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy37FMDeviceEditableMessageViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000787B4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)completeActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy37FMDeviceEditableMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10007AC54();

}

- (void).cxx_destruct
{
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy37FMDeviceEditableMessageViewController_device, &qword_1005D6710);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy37FMDeviceEditableMessageViewController_primaryItemPart, (uint64_t *)&unk_1005D3AA0);

}

@end
