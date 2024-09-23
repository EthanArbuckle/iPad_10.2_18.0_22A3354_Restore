@implementation ICActivityStreamNavigationController

- (void)setSelection:(id)a3
{
  ICActivityStreamNavigationController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10001694C(a3);

}

- (void)setObject:(id)a3
{
  void *v4;
  ICActivityStreamNavigationController *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICActivityStreamNavigationController_object);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICActivityStreamNavigationController_object) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_100016A64();
}

- (void)viewDidLoad
{
  ICActivityStreamNavigationController *v2;

  v2 = self;
  sub_10000E0AC();

}

- (ICActivityStreamNavigationController)initWithCoordinator:(id)a3 hasInteractiveSizing:(BOOL)a4
{
  swift_unknownObjectRetain(a3);
  return (ICActivityStreamNavigationController *)sub_10000797C((uint64_t)a3, a4);
}

- (ICActivityStreamCoordinating)coordinator
{
  return (ICActivityStreamCoordinating *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICActivityStreamNavigationController_coordinator));
}

- (BOOL)hasInteractiveSizing
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR___ICActivityStreamNavigationController_hasInteractiveSizing);
}

- (ICActivityStreamViewController)activityStreamViewController
{
  return (ICActivityStreamViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                   + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController));
}

- (void)setActivityStreamViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController) = (Class)a3;
  v3 = a3;

}

- (UISheetPresentationController)sheetController
{
  return (UISheetPresentationController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                  + OBJC_IVAR___ICActivityStreamNavigationController_sheetController));
}

- (void)setSheetController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICActivityStreamNavigationController_sheetController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICActivityStreamNavigationController_sheetController) = (Class)a3;
  v3 = a3;

}

- (ICActivityStreamNavigationController)initWithCoder:(id)a3
{
  sub_10035C774(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  ICActivityStreamNavigationController *v4;

  v4 = self;
  sub_10035C8E0(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v4 = v6.receiver;
  -[ICActivityStreamNavigationController viewDidAppear:](&v6, "viewDidAppear:", v3);
  sub_10035D2D0();
  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  v5 = objc_msgSend(v4, "view", v6.receiver, v6.super_class);
  UIAccessibilityPostNotification(v3, v5);

}

- (void)viewDidLayoutSubviews
{
  ICActivityStreamNavigationController *v2;

  v2 = self;
  sub_10035CCE0();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v4 = v5.receiver;
  -[ICActivityStreamNavigationController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  sub_10035D510();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  char *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v7.receiver;
  -[ICActivityStreamNavigationController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController];
  if (v5)
  {
    v6 = v5;
    sub_10013C038(0);

    v4 = v6;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  ICActivityStreamNavigationController *v9;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v9 = self;
  sub_10035D800(a4, width, height);
  swift_unknownObjectRelease(a4, v8);

}

- (void)willEnterForeground
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  ICActivityStreamNavigationController *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[24];

  v3 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = self;
  Date.init()(v6);
  v7 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 0, 1, v7);
  v8 = (uint64_t)v6 + OBJC_IVAR___ICActivityStreamNavigationController_timeOfLastViewModeChange;
  swift_beginAccess((char *)v6 + OBJC_IVAR___ICActivityStreamNavigationController_timeOfLastViewModeChange, v10, 33, 0);
  sub_1001CE964((uint64_t)v5, v8);
  swift_endAccess(v10);

}

- (void)analyticsSessionWillEnd
{
  ICActivityStreamNavigationController *v2;

  v2 = self;
  sub_10035D510();

}

- (void)handleTap:(id)a3
{
  id v4;
  ICActivityStreamNavigationController *v5;

  v4 = a3;
  v5 = self;
  sub_10035E034(v4);

}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + OBJC_IVAR___ICActivityStreamNavigationController_object));
}

- (ICActivityStreamSelection)selection
{
  return (ICActivityStreamSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                              + OBJC_IVAR___ICActivityStreamNavigationController_selection));
}

- (int64_t)viewMode
{
  ICActivityStreamNavigationController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_10035E814();

  return v3;
}

- (void)moveToViewMode:(int64_t)a3
{
  ICActivityStreamNavigationController *v4;

  v4 = self;
  sub_10035EADC(a3);

}

- (double)viewModeDurationFor:(int64_t)a3
{
  ICActivityStreamNavigationController *v4;
  double v5;

  v4 = self;
  v5 = sub_10035DFB4(a3);

  return v5;
}

- (ICActivityStreamNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  ICActivityStreamNavigationController *result;

  result = (ICActivityStreamNavigationController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ActivityStreamNavigationController", 46, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (ICActivityStreamNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  ICActivityStreamNavigationController *result;

  v3 = a3;
  result = (ICActivityStreamNavigationController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ActivityStreamNavigationController", 46, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (ICActivityStreamNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICActivityStreamNavigationController *result;

  v4 = a4;
  result = (ICActivityStreamNavigationController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ActivityStreamNavigationController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICActivityStreamNavigationController_coordinator), a2);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_sheetController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_object));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_selection));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___ICActivityStreamNavigationController_viewModeDurations));
  sub_1002BC9C8((uint64_t)self + OBJC_IVAR___ICActivityStreamNavigationController_timeOfLastViewModeChange);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___unfilteredHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___filteredHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___dockedDetent));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___halfHeightDetent));
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6;
  id v7;
  ICActivityStreamNavigationController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10035F81C(a4);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (*((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR___ICActivityStreamNavigationController_hasInteractiveSizing) == 1)
    return (int64_t)objc_msgSend(a3, "presentationStyle");
  else
    return 2;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return (*((_BYTE *)&self->super.super.super.super.isa
          + OBJC_IVAR___ICActivityStreamNavigationController_hasInteractiveSizing) & 1) == 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  ICActivityStreamNavigationController *v5;

  v4 = a3;
  v5 = self;
  sub_10035FA68();

}

- (void)_sheetPresentationController:(id)a3 didChangeIndexOfCurrentDetent:(int64_t)a4
{
  id v6;
  ICActivityStreamNavigationController *v7;

  v6 = a3;
  v7 = self;
  sub_10035F458(v6, a4);

}

@end
