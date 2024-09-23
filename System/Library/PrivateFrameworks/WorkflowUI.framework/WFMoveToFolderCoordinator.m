@implementation WFMoveToFolderCoordinator

- (WFMoveToFolderCoordinator)initWithDatabase:(id)a3
{
  return (WFMoveToFolderCoordinator *)MoveToFolderCoordinator.init(database:)(a3);
}

- (void)move:(id)a3 presentingViewController:(id)a4
{
  uint64_t v6;
  id v7;
  WFMoveToFolderCoordinator *v8;

  sub_220083D98(0, &qword_2540A2EF0);
  v6 = sub_220307164();
  v7 = a4;
  v8 = self;
  sub_22024E468(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)move:(id)a3 presentingViewController:(id)a4 source:(int)a5
{
  uint64_t v8;
  id v9;
  WFMoveToFolderCoordinator *v10;

  sub_220083D98(0, &qword_2540A2EF0);
  v8 = sub_220307164();
  v9 = a4;
  v10 = self;
  sub_22024E5F8(v8, v9, a5);

  swift_bridgeObjectRelease();
}

- (WFMoveToFolderCoordinator)init
{
  MoveToFolderCoordinator.init()();
}

- (void).cxx_destruct
{

  swift_release();
  sub_2200A0118((uint64_t)self + OBJC_IVAR___WFMoveToFolderCoordinator_delegate);
  swift_unknownObjectWeakDestroy();
}

@end
