@implementation STUConcreteMobileKeyBagPrimitives

- (id)subscribeToFirstUnlockNotificationsWithHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8studentd33STUConcreteMobileKeyBagPrimitives *v6;
  id v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1000CC108, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = sub_100078954(sub_100078948, v5);

  swift_release(v5);
  return v7;
}

- (_TtC8studentd33STUConcreteMobileKeyBagPrimitives)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STUConcreteMobileKeyBagPrimitives();
  return -[STUConcreteMobileKeyBagPrimitives init](&v3, "init");
}

@end
