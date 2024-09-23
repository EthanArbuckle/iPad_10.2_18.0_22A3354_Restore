@implementation WFEditorHostingViewController

- (WFEditorHostingViewControllerDelegate)delegate
{
  sub_22676AC10();
}

- (void)setDelegate:(id)a3
{
  WFEditorHostingViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22676AC68();

}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  sub_22676ADA8();
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
  WFEditorHostingViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22676AE00();

}

- (WFContextualActionSuggester)actionSuggester
{
  return (WFContextualActionSuggester *)sub_22676AFE4();
}

- (void)setActionSuggester:(id)a3
{
  id v4;
  WFEditorHostingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22676B06C(v4);

}

- (WFEditorHostingViewController)initWithWorkflow:(id)a3
{
  id v3;

  v3 = a3;
  return (WFEditorHostingViewController *)EditorHostingViewController.init(workflow:)();
}

- (WFEditorHostingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22676BCD0();
}

- (void)loadView
{
  WFEditorHostingViewController *v2;

  v2 = self;
  sub_22676BE48();

}

- (void)viewWillAppear:(BOOL)a3
{
  WFEditorHostingViewController *v4;

  v4 = self;
  sub_22676C09C(a3);

}

- (BOOL)isRunning
{
  WFEditorHostingViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_22676C148();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isEditable
{
  WFEditorHostingViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_22676C1B0();
  v4 = v3;

  return v4 & 1;
}

- (void)setIsEditable:(BOOL)a3
{
  WFEditorHostingViewController *v3;

  v3 = self;
  sub_22676C21C();

}

- (BOOL)canShowEmptyState
{
  WFEditorHostingViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_22676C2E4();
  v4 = v3;

  return v4 & 1;
}

- (void)setCanShowEmptyState:(BOOL)a3
{
  WFEditorHostingViewController *v3;

  v3 = self;
  sub_22676C34C();

}

- (BOOL)canShowInputAction
{
  WFEditorHostingViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_22676C400();
  v4 = v3;

  return v4 & 1;
}

- (void)setCanShowInputAction:(BOOL)a3
{
  WFEditorHostingViewController *v3;

  v3 = self;
  sub_22676C468();

}

- (Class)triggerInputType
{
  WFEditorHostingViewController *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  sub_22676C530();
  v4 = v3;

  if (v4)
    return (Class)swift_getObjCClassFromMetadata();
  else
    return 0;
}

- (void)setTriggerInputType:(Class)a3
{
  WFEditorHostingViewController *v4;

  if (a3)
    swift_getObjCClassMetadata();
  v4 = self;
  sub_22676C5AC();

}

- (HMHome)home
{
  WFEditorHostingViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_22676C658();
  v4 = v3;

  return (HMHome *)v4;
}

- (void)setHome:(id)a3
{
  id v4;
  WFEditorHostingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22676C6C4();

}

- (BOOL)isHomeWorkflow
{
  WFEditorHostingViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_22676C7CC();
  v4 = v3;

  return v4 & 1;
}

- (double)actionCanvasWidth
{
  return sub_22676C824();
}

- (void)runWithSource:(id)a3
{
  id v4;
  WFEditorHostingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22676C874(v4);

}

- (void)stop
{
  WFEditorHostingViewController *v2;

  v2 = self;
  sub_22676CC24();

}

- (void)stopPickingVariables
{
  WFEditorHostingViewController *v2;

  v2 = self;
  sub_22676CC7C();

}

- (void)startPickingParametersForImportQuestionsWithExcluding:(id)a3 onSelect:(id)a4
{
  void *v5;
  WFEditorHostingViewController *v6;

  v5 = _Block_copy(a4);
  sub_2266B0A3C(0, (unint64_t *)&qword_255875660);
  sub_22688E34C();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_22676CCD8();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)scrollToAction:(id)a3
{
  id v4;
  WFEditorHostingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22676CDD0(v4);

}

- (void)showActionError:(id)a3 for:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  WFEditorHostingViewController *v10;

  v6 = sub_22688E220();
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_22676CE64(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)performScrollingTest:(id)a3
{
  WFEditorHostingViewController *v4;

  sub_22688E220();
  v4 = self;
  sub_22676CF08();

  swift_bridgeObjectRelease();
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  WFEditorHostingViewController *v4;
  id v5;

  v4 = self;
  v5 = sub_22676CFE8(a3);

  return v5;
}

- (void)workflow:(WFWorkflow *)a3 removeAction:(WFAction *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  WFWorkflow *v10;
  WFAction *v11;
  WFEditorHostingViewController *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_226838290((uint64_t)&unk_25587A810, (uint64_t)v9);
}

- (void)workflow:(id)a3 moveActionsAtIndexes:(id)a4 toIndexes:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  WFEditorHostingViewController *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;

  v7 = sub_22688B88C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v17 - v12;
  sub_22688B82C();
  sub_22688B82C();
  v14 = a3;
  v15 = self;
  sub_22676D860();

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v16(v13, v7);
}

- (void)workflow:(id)a3 insertActions:(id)a4 atIndexes:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  WFEditorHostingViewController *v12;
  uint64_t v13;

  v7 = sub_22688B88C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2266B0A3C(0, (unint64_t *)&qword_25587BB30);
  sub_22688E34C();
  sub_22688B82C();
  v11 = a3;
  v12 = self;
  sub_22676D95C();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)appendAction:(id)a3 selectionAware:(BOOL)a4
{
  id v5;
  WFEditorHostingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22676DA58(v5);

}

- (void)insertAction:(id)a3 at:(int64_t)a4
{
  id v5;
  WFEditorHostingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22676DADC(v5);

}

- (void)insertActions:(id)a3 at:(int64_t)a4
{
  sub_22676DEB8(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_22676DBC4);
}

- (void)removeActions:(id)a3 mode:(int64_t)a4
{
  sub_22676DEB8(self, (uint64_t)a2, (uint64_t)a3, a4, sub_22676DCB0);
}

- (void)moveActionsFrom:(id)a3 to:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  WFEditorHostingViewController *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;

  v5 = sub_22688B88C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v14 - v10;
  sub_22688B82C();
  sub_22688B82C();
  v12 = self;
  sub_22676E7B8();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (WFEditorHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_22688E220();
  v5 = a4;
  EditorHostingViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_9_17(OBJC_IVAR___WFEditorHostingViewController_hostingViewController);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR___WFEditorHostingViewController_editorOptions);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR___WFEditorHostingViewController_editorResults);
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_17(OBJC_IVAR___WFEditorHostingViewController_runner);
  swift_bridgeObjectRelease();
  sub_22669DFD4((uint64_t)self + OBJC_IVAR___WFEditorHostingViewController_delegate);
  sub_22669DFD4((uint64_t)self + OBJC_IVAR___WFEditorHostingViewController_auxiliaryViewPresenter);

}

- (void)reportSuggestionSessionEnded
{
  WFEditorHostingViewController *v2;

  v2 = self;
  EditorHostingViewController.reportSuggestionSessionEnded()();

}

@end
