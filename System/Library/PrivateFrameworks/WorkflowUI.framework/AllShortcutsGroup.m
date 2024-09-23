@implementation AllShortcutsGroup

- (void)databaseResultDidChange:(id)a3
{
  id v4;
  _TtC10WorkflowUI17AllShortcutsGroup *v5;

  v4 = a3;
  v5 = self;
  sub_2200C3D14();

}

- (_TtC10WorkflowUI17AllShortcutsGroup)init
{
  AllShortcutsGroup.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_268((uint64_t)self, OBJC_IVAR____TtC10WorkflowUI17AllShortcutsGroup_delegate);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI17AllShortcutsGroup_database);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI17AllShortcutsGroup_collectionsResult);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI17AllShortcutsGroup_autoShortcutsDataSource);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
}

@end
