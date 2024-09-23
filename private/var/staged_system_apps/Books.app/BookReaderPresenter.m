@implementation BookReaderPresenter

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC5Books19BookReaderPresenter *v4;
  objc_super v5;
  _QWORD v6[4];

  ObjectType = (objc_class *)swift_getObjectType();
  v6[3] = ObjectType;
  v6[0] = self;
  v4 = self;
  static UIAccessibility.removeAccessibilityStatusChangeObserver(_:)(v6);
  _s5Books15CurrentPageViewVwxx_0(v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[BookReaderPresenter dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_viewModel);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_externalContentLoadEventHandler);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_router);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_interactor));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books19BookReaderPresenter_contentSelectionInteractor));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_stateManager));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books19BookReaderPresenter_currentLocationProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books19BookReaderPresenter_bookReaderLayoutController));

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_annotationProviderService);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_annotationProvider);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books19BookReaderPresenter_annotationSharingAssetActivityItemProvider));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_achievementManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books19BookReaderPresenter_layoutModeProvider));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_pageCurlState));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books19BookReaderPresenter_readingSettingsProvider));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_stylesheetProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books19BookReaderPresenter_readingSettingsModuleFactory));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_tocModuleFactory));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books19BookReaderPresenter_bookmarkNotesModuleFactory));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_shareModuleFactory));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_searchModuleFactory));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books19BookReaderPresenter_subscribers));
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_searchHighlightID, &qword_1009D2A98);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books19BookReaderPresenter_presentedExpandedContentViewController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books19BookReaderPresenter_expandedContentPresentedState));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books19BookReaderPresenter____lazy_storage___expandedContentAnimator));
}

- (_TtC5Books19BookReaderPresenter)init
{
  _TtC5Books19BookReaderPresenter *result;

  result = (_TtC5Books19BookReaderPresenter *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderPresenter", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  double *v5;
  id v6;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  _TtC5Books19BookReaderPresenter *v17;
  id v18;
  id v19;

  v5 = (double *)((char *)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_expandedContentFrame);
  if ((self->router[OBJC_IVAR____TtC5Books19BookReaderPresenter_expandedContentFrame] & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v11 = v5[2];
    v10 = v5[3];
    v13 = *v5;
    v12 = v5[1];
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v17 = self;
    v18 = sub_1005DE974();
    ExpandedContentAnimator.presenting.setter(1);

    v19 = sub_1005DE974();
    ExpandedContentAnimator.rect.setter(v13, v12, v11, v10);

    v6 = sub_1005DE974();
  }
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  double *v3;
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  _TtC5Books19BookReaderPresenter *v11;
  id v12;
  id v13;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_expandedContentFrame);
  if ((self->router[OBJC_IVAR____TtC5Books19BookReaderPresenter_expandedContentFrame] & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v7 = v3[2];
    v6 = v3[3];
    v9 = *v3;
    v8 = v3[1];
    v10 = a3;
    v11 = self;
    v12 = sub_1005DE974();
    ExpandedContentAnimator.presenting.setter(0);

    v13 = sub_1005DE974();
    ExpandedContentAnimator.rect.setter(v9, v8, v7, v6);

    v4 = sub_1005DE974();
  }
  return v4;
}

- (id)interactionControllerForDismissal:(id)a3
{
  _TtC5Books19BookReaderPresenter *v5;
  id v6;
  void *v7;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_1005DE974();
  v7 = (void *)ExpandedContentAnimator.interactiveAnimator.getter();
  swift_unknownObjectRelease(a3);

  return v7;
}

@end
