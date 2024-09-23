@implementation SessionViewController

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _TtC9SeymourUI21SessionViewController *v13;
  _QWORD v14[6];

  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = swift_allocObject();
  *(_BYTE *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = v9;
  v14[4] = sub_22B369358;
  v14[5] = v10;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_22B0F2EEC;
  v14[3] = &block_descriptor_11;
  v11 = _Block_copy(v14);
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  swift_release();
  objc_msgSend(a5, sel_addCoordinatedAnimations_completion_, v11, 0);
  _Block_release(v11);

  swift_unknownObjectRelease();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_mediaPlayerDisplay));
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC9SeymourUI21SessionViewController *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;

  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SessionViewController_platform) == 1)
    return 30;
  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SessionViewController_platform))
    return 24;
  v2 = self;
  v3 = sub_22BA7A94C();
  v5 = v3;
  if ((v6 & 1) == 0)
  {
    sub_22B119E68(v3, v4, 0);

    return 24;
  }

  if ((v5 & 0xFE) != 0)
    return 24;
  else
    return 2;
}

- (NSArray)keyCommands
{
  void *v2;

  if (_s9SeymourUI21SessionViewControllerC11keyCommandsSaySo12UIKeyCommandCGSgvg_0())
  {
    sub_22B0F1718(0, &qword_255BB64C0);
    v2 = (void *)sub_22BA808A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)handleEscapeKeyCommand
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9SeymourUI21SessionViewController *v7;
  uint64_t v8;

  v3 = sub_22BA7FE00();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_22BA7FA40();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_22B617C7C();

}

- (void)handleSpacebarCommand
{
  _TtC9SeymourUI21SessionViewController *v2;

  v2 = self;
  sub_22B62FA90();

}

- (void)dealloc
{
  _TtC9SeymourUI21SessionViewController *v2;

  v2 = self;
  SessionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21SessionViewController_miniPlayerHost);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21SessionViewController_pictureInPictureSurrogate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_mediaPlayerDisplay));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_sessionContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_castingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_instructionsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_watchDiscoveryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_continueOnWatchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_ongoingWorkoutDetectedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_introSequenceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_bufferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_displayPreferencesViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_summaryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_menuGestureRecognizer));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21SessionViewController_activityTypeBehavior;
  v4 = sub_22BA7CA28();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

- (_TtC9SeymourUI21SessionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B976A78();
}

- (NSArray)preferredFocusEnvironments
{
  _TtC9SeymourUI21SessionViewController *v2;
  void *v3;

  v2 = self;
  SessionViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v3 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI21SessionViewController *v2;

  v2 = self;
  SessionViewController.viewDidLoad()();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9SeymourUI21SessionViewController *v4;

  v4 = self;
  SessionViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC9SeymourUI21SessionViewController *v2;

  v2 = self;
  SessionViewController.viewWillLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC9SeymourUI21SessionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  SessionViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)menuButtonTapped
{
  _TtC9SeymourUI21SessionViewController *v2;

  v2 = self;
  sub_22B617C7C();

}

- (_TtC9SeymourUI21SessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI21SessionViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI21SessionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SessionViewController_introSequenceCompleted) == 1)
    return (UIViewController *)objc_autoreleaseReturnValue(objc_retain(*(id *)((char *)&self->super.super.super.isa
                                                                             + OBJC_IVAR____TtC9SeymourUI21SessionViewController_mediaPlayerDisplay)));
  else
    return (UIViewController *)0;
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  return 0;
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  id v4;
  _TtC9SeymourUI21SessionViewController *v5;

  v4 = a3;
  v5 = self;
  _s9SeymourUI21SessionViewControllerC06playerde18WillStartPictureInI0yySo08AVPlayerdE0CF_0();

}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  id v6;
  _TtC9SeymourUI21SessionViewController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_22B976CD8(v8);

}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4;
  _TtC9SeymourUI21SessionViewController *v5;

  v4 = a3;
  v5 = self;
  _s9SeymourUI21SessionViewControllerC06playerde17WillStopPictureInI0yySo08AVPlayerdE0CF_0();

}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  id v4;
  _TtC9SeymourUI21SessionViewController *v5;

  v4 = a3;
  v5 = self;
  _s9SeymourUI21SessionViewControllerC06playerde16DidStopPictureInI0yySo08AVPlayerdE0CF_0();

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  void *v9;
  id v10;
  id v11;
  id v12;
  _TtC9SeymourUI21SessionViewController *v13;
  id v14;
  id v15;

  v9 = (void *)objc_opt_self();
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = objc_msgSend(v9, sel_sheetPresentationControllerForPresentedController_presentingController_, v10, v11);
  objc_msgSend(v14, sel_setPrefersPageSizing_, 1);
  v15 = objc_msgSend((id)objc_opt_self(), sel_smu_effectWithBlurRadius_, 5.0);
  objc_msgSend(v14, sel_setBackgroundBlurEffect_, v15);

  return v14;
}

@end
