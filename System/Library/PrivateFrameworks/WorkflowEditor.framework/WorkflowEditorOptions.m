@implementation WorkflowEditorOptions

- (_TtC14WorkflowEditor21WorkflowEditorOptions)init
{
  return (_TtC14WorkflowEditor21WorkflowEditorOptions *)sub_226699E38();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__canShowEmptyState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558734E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_40_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__canShowInputAction);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255873508);
  OUTLINED_FUNCTION_9_5(v5);
  OUTLINED_FUNCTION_40_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__isExplicitlyReadOnly);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255873530);
  OUTLINED_FUNCTION_9_5(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255873548);
  OUTLINED_FUNCTION_9_5(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255873560);
  OUTLINED_FUNCTION_9_5(v8);
  OUTLINED_FUNCTION_67_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_editorDelegate);
  OUTLINED_FUNCTION_67_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_auxiliaryViewPresenter);
  OUTLINED_FUNCTION_67_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_coordinateSpaceDelegate);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255873578);
  OUTLINED_FUNCTION_9_5(v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25587A670);
  OUTLINED_FUNCTION_9_5(v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558735A0);
  OUTLINED_FUNCTION_9_5(v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558735B8);
  OUTLINED_FUNCTION_9_5(v12);
  OUTLINED_FUNCTION_40_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__isEditingVariable);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_pendingScrollParameters));
  swift_release();
  OUTLINED_FUNCTION_14_2();
}

- (void)appendAction:(id)a3
{
  WFAction *v4;
  _TtC14WorkflowEditor21WorkflowEditorOptions *v5;

  v4 = (WFAction *)a3;
  v5 = self;
  WorkflowEditorOptions.appendAction(_:)(v4);

}

- (double)actionCanvasWidth
{
  double result;

  WorkflowEditorOptions.actionCanvasWidth()();
  return result;
}

- (void)presentDrawerViewController:(id)a3 inPopover:(BOOL)a4 withSourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIViewController *v11;
  _TtC14WorkflowEditor21WorkflowEditorOptions *v12;
  __C::CGRect v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (UIViewController *)a3;
  v12 = self;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  WorkflowEditorOptions.presentDrawerViewController(_:inPopover:withSourceRect:)(v11, a4, v13);

}

@end
