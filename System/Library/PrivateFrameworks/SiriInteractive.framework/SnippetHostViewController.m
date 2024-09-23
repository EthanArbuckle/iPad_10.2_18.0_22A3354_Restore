@implementation SnippetHostViewController

- (_TtP15SiriInteractive33SnippetHostViewControllerDelegate_)delegate
{
  id v2;

  sub_24647382C();
  return (_TtP15SiriInteractive33SnippetHostViewControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  _TtC15SiriInteractive25SnippetHostViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2464738B0();

}

- (unsigned)presentationMode
{
  return sub_246473B28();
}

- (void)setPresentationMode:(unsigned int)a3
{
  _TtC15SiriInteractive25SnippetHostViewController *v4;

  v4 = self;
  sub_246473B78(a3);

}

- (_TtC15SiriInteractive12SceneMetrics)resolvedMetrics
{
  id v2;

  sub_246473C10();
  return (_TtC15SiriInteractive12SceneMetrics *)v2;
}

- (void)setResolvedMetrics:(id)a3
{
  id v5;
  _TtC15SiriInteractive25SnippetHostViewController *v6;

  v5 = a3;
  v6 = self;
  sub_246473C94(a3);

}

- (NSArray)activityTouchRestrictedRects
{
  void *v2;

  sub_246473D64();
  type metadata accessor for CGRect(0);
  v2 = (void *)sub_246482434();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivityTouchRestrictedRects:(id)a3
{
  uint64_t v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  type metadata accessor for CGRect(0);
  v4 = sub_246482440();
  v5 = self;
  sub_246473DF8(v4);

}

- (_TtC15SiriInteractive19SceneMetricsRequest)systemProvidedMetrics
{
  return (_TtC15SiriInteractive19SceneMetricsRequest *)sub_246473E84();
}

- (void)setSystemProvidedMetrics:(id)a3
{
  id v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  v4 = a3;
  v5 = self;
  sub_246473F08(v4);

}

- (_TtC15SiriInteractive25SnippetHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_246474B4C();
}

- (void)dealloc
{
  _TtC15SiriInteractive25SnippetHostViewController *v2;

  v2 = self;
  SnippetHostViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_2464806A8((uint64_t)self + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_delegate);
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics);
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector);
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView);
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue);
  swift_release();
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer);
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController);
  OUTLINED_FUNCTION_17_3(OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel);
}

- (void)viewDidLoad
{
  _TtC15SiriInteractive25SnippetHostViewController *v2;

  v2 = self;
  sub_24647503C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15SiriInteractive25SnippetHostViewController *v4;

  v4 = self;
  sub_246475168(a3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC15SiriInteractive25SnippetHostViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_2464752EC((uint64_t)v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC15SiriInteractive25SnippetHostViewController *v8;

  v7 = a3;
  v8 = self;
  sub_24647544C((uint64_t)a3, a4);

}

- (void)viewDidLayoutSubviews
{
  _TtC15SiriInteractive25SnippetHostViewController *v2;

  v2 = self;
  sub_246475530();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15SiriInteractive25SnippetHostViewController *v6;

  v5 = a3;
  v6 = self;
  sub_246475654((uint64_t)a3);

}

- (void)ensureContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  id v10;
  _TtC15SiriInteractive25SnippetHostViewController *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v10 = a4;
  v11 = self;
  sub_2464757EC((uint64_t)v10, (uint64_t)sub_2464806A0, v9, a3);

  swift_release();
}

- (void)invalidate
{
  _TtC15SiriInteractive25SnippetHostViewController *v2;

  v2 = self;
  sub_2464767A0();

}

- (NSString)description
{
  _TtC15SiriInteractive25SnippetHostViewController *v2;
  void *v3;

  v2 = self;
  sub_246476A10();

  v3 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)shouldShareTouchesWithHost
{
  return sub_24647702C() & 1;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  _TtC15SiriInteractive25SnippetHostViewController *v4;

  v4 = self;
  sub_2464770A8(a3);

}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  _TtC15SiriInteractive25SnippetHostViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_2464771B4();
  v4 = v3;

  return v4;
}

- (_TtC15SiriInteractive25SnippetHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_2464823EC();
  v5 = a4;
  SnippetHostViewController.init(nibName:bundle:)();
}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  v4 = a3;
  v5 = self;
  SnippetHostViewController.sceneDidActivate(_:)();

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  v4 = a3;
  v5 = self;
  SnippetHostViewController.sceneDidInvalidate(_:)();

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  _TtC15SiriInteractive25SnippetHostViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  SnippetHostViewController.sceneDidDeactivate(_:withError:)(v6, a4);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC15SiriInteractive25SnippetHostViewController *v8;

  sub_246468CA8(0, &qword_25757AB88);
  sub_246480034();
  v6 = sub_2464824B8();
  v7 = a3;
  v8 = self;
  SnippetHostViewController.scene(_:didReceive:)((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC15SiriInteractive25SnippetHostViewController *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  SnippetHostViewController.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)();

}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  id v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  v4 = a3;
  v5 = self;
  SnippetHostViewController.sceneLayerManagerDidUpdateLayers(_:)();

}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  id v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  v4 = a3;
  v5 = self;
  SnippetHostViewController.sceneLayerManagerDidStopTrackingLayers(_:)();

}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
  id v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  v4 = a3;
  v5 = self;
  SnippetHostViewController.sceneLayerManagerDidStartTrackingLayers(_:)();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC15SiriInteractive25SnippetHostViewController *v5;

  v4 = a3;
  v5 = self;
  SnippetHostViewController.presentationControllerDidDismiss(_:)((UIPresentationController)v5);

}

@end
