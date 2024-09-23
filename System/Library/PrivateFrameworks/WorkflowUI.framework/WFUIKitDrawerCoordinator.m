@implementation WFUIKitDrawerCoordinator

- (WFActionDrawerCoordinatorDelegate)delegate
{
  sub_220147FE4();
}

- (void)setDelegate:(id)a3
{
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_220148040();

}

- (unint64_t)presentationMode
{
  return sub_220148094();
}

- (void)setPresentationMode:(unint64_t)a3
{
  sub_2201480C8(a3);
}

- (UIViewController)drawerViewController
{
  id v2;

  sub_220148104();
  return (UIViewController *)v2;
}

- (void)setDrawerViewController:(id)a3
{
  id v5;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_220148170((uint64_t)a3);

}

- (UIViewController)inspectorPaneContainerViewController
{
  id v2;

  sub_22014819C();
  return (UIViewController *)v2;
}

- (void)setInspectorPaneContainerViewController:(id)a3
{
  id v5;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_220148208((uint64_t)a3);

}

- (UIViewController)visibleInspectorPaneContentViewController
{
  id v2;

  sub_220148234();
  return (UIViewController *)v2;
}

- (void)setVisibleInspectorPaneContentViewController:(id)a3
{
  id v5;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_2201482A0((uint64_t)a3);

}

- (_TtC10WorkflowUI24WFUIKitDrawerCoordinator)initWithWorkflow:(id)a3 home:(id)a4 actionSuggester:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  return (_TtC10WorkflowUI24WFUIKitDrawerCoordinator *)sub_2201482D0(v7, a4, a5);
}

- (double)topInset
{
  return sub_22014848C();
}

- (void)setTopInset:(double)a3
{
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v4;

  v4 = self;
  sub_2201484E0(a3);

}

- (double)bottomInset
{
  return sub_220148580();
}

- (unint64_t)visibility
{
  return sub_220148630();
}

- (void)setVisibility:(unint64_t)a3
{
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v4;

  v4 = self;
  sub_220148680(a3);

}

- (CGRect)collapsedDrawerRect
{
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_220148968();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)presentDrawerViewController:(id)a3 inPopover:(BOOL)a4 withSourceRect:(CGRect)a5
{
  id v6;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v7;

  v6 = a3;
  v7 = self;
  sub_220148A50();

}

- (void)collapseDrawer
{
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v2;

  v2 = self;
  sub_220149158();

}

- (void)expandDrawer
{
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v2;

  v2 = self;
  sub_220149458();

}

- (void)configureAsBottomSheetInParentViewController:(id)a3 belowSubview:(id)a4
{
  id v6;
  id v7;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_220149A98(v6, a4);

}

- (void)configureAsNavigationStackInParentViewController:(id)a3
{
  id v4;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22014A210(v4);

}

- (void)setInspectorPaneViewController:(id)a3
{
  id v4;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22014A880(v4);

}

- (void)performScrollingTest:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v7;

  v4 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v6 = v5;
  v7 = self;
  sub_22014AF68(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC10WorkflowUI24WFUIKitDrawerCoordinator)init
{
  sub_22014B23C();
}

- (void).cxx_destruct
{
  sub_2200A0118((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_delegate);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_navigationController);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_drawerViewController);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_inspectorPaneContainerViewController);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_visibleInspectorPaneContentViewController);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_presentedPopover);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_drawerSheetView);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI24WFUIKitDrawerCoordinator_actionDetailsSheetView);
  swift_release();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22014B350();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end
