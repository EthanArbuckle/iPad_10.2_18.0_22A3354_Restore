@implementation LemonadeCuratedLibraryView_ContainerViewController

- (LemonadeCuratedLibraryView_ContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A697516C();
}

- (void)viewDidLoad
{
  LemonadeCuratedLibraryView_ContainerViewController *v2;

  v2 = self;
  sub_1A6971B74();

}

- (void)viewIsAppearing:(BOOL)a3
{
  LemonadeCuratedLibraryView_ContainerViewController *v4;

  v4 = self;
  sub_1A6971C78(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  char v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LemonadeCuratedLibraryView.ContainerViewController();
  v4 = v6.receiver;
  -[LemonadeCuratedLibraryView_ContainerViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  v5 = v4[OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_hasAppearedOnce];
  v4[OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_hasAppearedOnce] = 1;
  if ((v5 & 1) == 0)
    sub_1A6973C38();

}

- (void)viewWillLayoutSubviews
{
  LemonadeCuratedLibraryView_ContainerViewController *v2;

  v2 = self;
  sub_1A6972290();

}

- (UINavigationItem)navigationItem
{
  uint64_t (*v2)(void);
  LemonadeCuratedLibraryView_ContainerViewController *v3;
  void *v4;
  id v5;

  v2 = *(uint64_t (**)(void))(**(_QWORD **)((char *)&self->super.super.super.isa
                                         + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_viewModel)
                           + 1336);
  v3 = self;
  v4 = (void *)v2();
  objc_opt_self();
  v5 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_navigationItem);

  return (UINavigationItem *)v5;
}

- (void)setNeedsUpdate
{
  LemonadeCuratedLibraryView_ContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = -[LemonadeCuratedLibraryView_ContainerViewController viewIfLoaded](v2, sel_viewIfLoaded);
  objc_msgSend(v3, sel_setNeedsLayout);

}

- (void)updateScrollView
{
  LemonadeCuratedLibraryView_ContainerViewController *v2;

  v2 = self;
  sub_1A6973440();

}

- (void)updateBarItems
{
  uint64_t (*v2)(void);
  LemonadeCuratedLibraryView_ContainerViewController *v3;
  void *v4;
  id v5;

  v2 = *(uint64_t (**)(void))(**(_QWORD **)((char *)&self->super.super.super.isa
                                         + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_viewModel)
                           + 1336);
  v3 = self;
  v4 = (void *)v2();
  objc_opt_self();
  v5 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_toolbarItems);

  -[LemonadeCuratedLibraryView_ContainerViewController setToolbarItems:](v3, sel_setToolbarItems_, v5);
}

- (void)updateResetCuratedLibraryView
{
  LemonadeCuratedLibraryView_ContainerViewController *v2;

  v2 = self;
  sub_1A69736F0();

}

- (void)updateNavigationSubtitle
{
  LemonadeCuratedLibraryView_ContainerViewController *v2;

  v2 = self;
  sub_1A6973DF4();

}

- (void)updateCuratedLibraryViewModel
{
  LemonadeCuratedLibraryView_ContainerViewController *v2;

  v2 = self;
  sub_1A69741A0();

}

- (void)curatedLibraryViewDidUpdateBars:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_updater);
  if (v3)
    objc_msgSend(v3, sel_setNeedsUpdateOf_, sel_updateBarItems);
  else
    __break(1u);
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4;
  LemonadeCuratedLibraryView_ContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A6974388();

}

- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4
{
  char v4;
  id v6;
  LemonadeCuratedLibraryView_ContainerViewController *v7;

  v4 = *((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isAnimatingScroll);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isAnimatingScroll) = 1;
  if ((v4 & 1) == 0)
  {
    v6 = a3;
    v7 = self;
    sub_1A6973C38();

  }
}

- (void)scrollViewControllerDidEndScrollingAnimation:(id)a3
{
  int v3;
  id v5;
  LemonadeCuratedLibraryView_ContainerViewController *v6;

  v3 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isAnimatingScroll);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isAnimatingScroll) = 0;
  if (v3 == 1)
  {
    v5 = a3;
    v6 = self;
    sub_1A6973C38();

  }
}

- (LemonadeCuratedLibraryView_ContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  LemonadeCuratedLibraryView_ContainerViewController *result;

  v4 = a4;
  result = (LemonadeCuratedLibraryView_ContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_updater));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_curatedLibraryViewModel));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_zoomableViewModel));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_miniModeAnimator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_librarySummaryPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_clippingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_additionalBackgroundView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController____lazy_storage___cplStatusProvider));
}

@end
