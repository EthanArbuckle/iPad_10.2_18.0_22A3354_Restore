@implementation HomeListCompositionalLayout

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC4Maps27HomeListCompositionalLayout *v9;
  id v10;
  uint64_t v12;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = sub_10003CA58();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC4Maps27HomeListCompositionalLayout *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = self;
  v14 = sub_10003CBFC();

  swift_bridgeObjectRelease(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithSection:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  return -[HomeListCompositionalLayout initWithSection:](&v5, "initWithSection:", a3);
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  return -[HomeListCompositionalLayout initWithSection:configuration:](&v7, "initWithSection:configuration:", a3, a4);
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC4Maps27HomeListCompositionalLayout *v8;
  objc_super v10;
  _QWORD aBlock[5];
  uint64_t v12;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10119D478, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  aBlock[4] = sub_10003D160;
  v12 = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001C50E4;
  aBlock[3] = &unk_10119D490;
  v6 = _Block_copy(aBlock);
  v7 = v12;
  swift_retain(v5);
  swift_release(v7);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  v8 = -[HomeListCompositionalLayout initWithSectionProvider:](&v10, "initWithSectionProvider:", v6);
  swift_release(v5);
  _Block_release(v6);
  return v8;
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC4Maps27HomeListCompositionalLayout *v11;
  objc_super v13;
  _QWORD aBlock[5];
  uint64_t v15;

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_10119D428, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  aBlock[4] = sub_10003D114;
  v15 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001C50E4;
  aBlock[3] = &unk_10119D440;
  v8 = _Block_copy(aBlock);
  v9 = v15;
  v10 = a4;
  swift_retain(v7);
  swift_release(v9);
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  v11 = -[HomeListCompositionalLayout initWithSectionProvider:configuration:](&v13, "initWithSectionProvider:configuration:", v8, v10);
  swift_release(v7);

  _Block_release(v8);
  return v11;
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  return -[HomeListCompositionalLayout initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
