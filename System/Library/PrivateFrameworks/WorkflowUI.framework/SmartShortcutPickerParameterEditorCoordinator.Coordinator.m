@implementation SmartShortcutPickerParameterEditorCoordinator.Coordinator

- (void)moduleSummaryPresenter:(id)a3 didStageParameterState:(id)a4
{
  CGPointMake(a3);
}

- (void)moduleSummaryPresenter:(id)a3 didCommitParameterState:(id)a4
{
  id v5;
  _TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_2201B5180();

  swift_unknownObjectRelease();
}

- (void)moduleSummaryPresenterDidFinish:(id)a3
{
  id v4;
  _TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2201B5328(v4);

}

- (_TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator)init
{
  sub_22012DD88();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator_presenter));
  sub_2201B6594((uint64_t)self+ OBJC_IVAR____TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator_options);
  sub_220096AA0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC10WorkflowUI45SmartShortcutPickerParameterEditorCoordinatorP33_144DB5BEFA04CF045390510CC999A4A811Coordinator_dismissHandler));
}

@end
