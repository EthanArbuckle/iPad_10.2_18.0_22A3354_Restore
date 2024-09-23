@implementation FindingViewController

- (_TtC10TVRemoteUI21FindingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  specialized FindingViewController.init(nibName:bundle:)();
}

- (_TtC10TVRemoteUI21FindingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized FindingViewController.init(nibName:bundle:)();
}

- (void)dealloc
{
  _TtC10TVRemoteUI21FindingViewController *v2;

  v2 = self;
  FindingViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[9];
  uint64_t v8;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_discoveryToken));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_remoteInfo));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed FMR1HapticPattern?, @in_guaranteed Any?) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_dismissedHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController____lazy_storage___findingView));
  v3 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[6] = *(_OWORD *)((char *)&self->super._nibBundle + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[7] = v3;
  v7[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                    + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v8 = *(uint64_t *)((char *)&self->super._dimmingView + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v4 = *(_OWORD *)((char *)&self->super._tab + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[2] = *(_OWORD *)((char *)&self->super._view + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[3] = v4;
  v5 = *(_OWORD *)((char *)&self->super._title + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[4] = *(_OWORD *)((char *)&self->super._navigationItem + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[5] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_style);
  v7[1] = v6;
  outlined release of FMFindingViewStyle((uint64_t)v7);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_pulseTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_niSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_hapticsController));
  outlined consume of FMFindingState(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_state), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_state), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_state), *(void **)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_state));
  outlined consume of FMFindingState(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_prevState), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_prevState), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_prevState), *(void **)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_prevState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_distanceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_instructionsTopLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_instructionsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_instructionsLabelsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_trendTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_sessionRestartDelayResetTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FindingViewController_analyticsSessionData));
  swift_release();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC10TVRemoteUI21FindingViewController *v2;

  v2 = self;
  FindingViewController.viewDidLoad()();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC10TVRemoteUI21FindingViewController *v4;

  v4 = self;
  FindingViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC10TVRemoteUI21FindingViewController *v4;

  v4 = self;
  FindingViewController.viewDidDisappear(_:)(a3);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC10TVRemoteUI21FindingViewController *v6;

  v5 = a4;
  v6 = self;
  FMFindingSleepPreventer.disableSleepingForAWhileWhileFinding()();

}

- (void)sessionDidStartRunning:(id)a3
{
  id v4;
  _TtC10TVRemoteUI21FindingViewController *v5;

  v4 = a3;
  v5 = self;
  specialized FindingViewController.sessionDidStartRunning(_:)();

}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10TVRemoteUI21FindingViewController *v8;

  type metadata accessor for SKConstraint(0, (unint64_t *)&lazy cache variable for type metadata for NINearbyObject);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  specialized FindingViewController.session(_:didUpdate:)(v6);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC10TVRemoteUI21FindingViewController *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  specialized FindingViewController.session(_:object:didUpdateRegion:previousRegion:)((objc_class *)a5, (objc_class *)a6);

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC10TVRemoteUI21FindingViewController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  specialized FindingViewController.session(_:didInvalidateWith:)(v8, "NISession was invalidated (%@)");

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC10TVRemoteUI21FindingViewController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  specialized FindingViewController.session(_:didInvalidateWith:)(v8, "NISession failed with error (%@)");

}

- (void)sessionWasSuspended:(id)a3
{
  uint64_t v4;
  _TtC10TVRemoteUI21FindingViewController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = one-time initialization token for findingExperience;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.findingExperience);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v7, v8, "NISession suspended", v9, 2u);
    MEMORY[0x22075D4E4](v9, -1, -1);
  }

}

- (void)sessionSuspensionEnded:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _TtC10TVRemoteUI21FindingViewController *v10;

  v4 = one-time initialization token for findingExperience;
  v5 = a3;
  v10 = self;
  if (v4 != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.findingExperience);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v7, v8, "NISession suspension ended", v9, 2u);
    MEMORY[0x22075D4E4](v9, -1, -1);
  }

  FindingViewController.restartSessionOnError()();
}

- (void)closeActionWithSender:(id)a3
{
  -[FindingViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
