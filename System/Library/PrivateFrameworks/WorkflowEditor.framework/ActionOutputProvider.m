@implementation ActionOutputProvider

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  void *v6;
  _TtC14WorkflowEditorP33_23FAE8DFB59B376283EF5C63F037C7FD20ActionOutputProvider *v7;

  v6 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  swift_unknownObjectRetain();
  v7 = self;
  sub_2266E39B8();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  void *v8;
  void *v9;
  void *v10;

  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  *(_QWORD *)(swift_allocObject() + 16) = v9;
  if (v10)
    *(_QWORD *)(swift_allocObject() + 16) = v10;
  sub_2266E3AAC();
}

- (_TtC14WorkflowEditorP33_23FAE8DFB59B376283EF5C63F037C7FD20ActionOutputProvider)init
{
  sub_2266E3C28();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_23FAE8DFB59B376283EF5C63F037C7FD20ActionOutputProvider_editorOptions));
}

@end
