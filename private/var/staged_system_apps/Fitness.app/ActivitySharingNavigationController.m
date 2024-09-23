@implementation ActivitySharingNavigationController

- (void)scrollToTop
{
  char *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _TtC10FitnessApp35ActivitySharingNavigationController *v13;
  _OWORD v14[13];
  uint64_t v15;

  v2 = *(char **)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp35ActivitySharingNavigationController_viewController)
     + qword_100823FF8;
  v3 = *((_OWORD *)v2 + 1);
  v14[0] = *(_OWORD *)v2;
  v14[1] = v3;
  v4 = *((_OWORD *)v2 + 5);
  v6 = *((_OWORD *)v2 + 2);
  v5 = *((_OWORD *)v2 + 3);
  v14[4] = *((_OWORD *)v2 + 4);
  v14[5] = v4;
  v14[2] = v6;
  v14[3] = v5;
  v7 = *((_OWORD *)v2 + 9);
  v9 = *((_OWORD *)v2 + 6);
  v8 = *((_OWORD *)v2 + 7);
  v14[8] = *((_OWORD *)v2 + 8);
  v14[9] = v7;
  v14[6] = v9;
  v14[7] = v8;
  v11 = *((_OWORD *)v2 + 11);
  v10 = *((_OWORD *)v2 + 12);
  v12 = *((_OWORD *)v2 + 10);
  v15 = *((_QWORD *)v2 + 26);
  v14[11] = v11;
  v14[12] = v10;
  v14[10] = v12;
  v13 = self;
  sub_100021D04((uint64_t)v14);
  sub_1000DF208();
  sub_100011450((uint64_t)v14);

}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithCoder:(id)a3
{
  _TtC10FitnessApp35ActivitySharingNavigationController *result;

  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivitySharingNavigationController.swift", 52, 2, 23, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC10FitnessApp35ActivitySharingNavigationController *result;

  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingNavigationController", 46, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC10FitnessApp35ActivitySharingNavigationController *result;

  v3 = a3;
  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingNavigationController", 46, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp35ActivitySharingNavigationController *result;

  v4 = a4;
  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingNavigationController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35ActivitySharingNavigationController_viewController));
}

- (void)handleActivitySharingURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _TtC10FitnessApp35ActivitySharingNavigationController *v20;
  _OWORD v21[13];
  uint64_t v22;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = ((char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(char **)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp35ActivitySharingNavigationController_viewController)
     + qword_100823FF8;
  v10 = *((_OWORD *)v9 + 1);
  v21[0] = *(_OWORD *)v9;
  v21[1] = v10;
  v11 = *((_OWORD *)v9 + 5);
  v13 = *((_OWORD *)v9 + 2);
  v12 = *((_OWORD *)v9 + 3);
  v21[4] = *((_OWORD *)v9 + 4);
  v21[5] = v11;
  v21[2] = v13;
  v21[3] = v12;
  v14 = *((_OWORD *)v9 + 9);
  v16 = *((_OWORD *)v9 + 6);
  v15 = *((_OWORD *)v9 + 7);
  v21[8] = *((_OWORD *)v9 + 8);
  v21[9] = v14;
  v21[6] = v16;
  v21[7] = v15;
  v18 = *((_OWORD *)v9 + 11);
  v17 = *((_OWORD *)v9 + 12);
  v19 = *((_OWORD *)v9 + 10);
  v22 = *((_QWORD *)v9 + 26);
  v21[11] = v18;
  v21[12] = v17;
  v21[10] = v19;
  v20 = self;
  sub_100021D04((uint64_t)v21);
  sub_1000DF33C(v8);
  sub_100011450((uint64_t)v21);

  (*(void (**)(NSObject *, uint64_t))(v6 + 8))(v8, v5);
}

@end
