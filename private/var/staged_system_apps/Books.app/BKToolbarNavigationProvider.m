@implementation BKToolbarNavigationProvider

- (BKToolbarNavigationProvider)init
{
  return (BKToolbarNavigationProvider *)ToolbarNavigationProvider.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___BKToolbarNavigationProvider__currentTopViewController;
  v4 = sub_10004CFD4(&qword_1009D8C08);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___BKToolbarNavigationProvider__toolbarItems;
  v6 = sub_10004CFD4(&qword_1009D8C00);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKToolbarNavigationProvider_navigationBarStyle));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKToolbarNavigationProvider_scrollOffsetInsetPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___BKToolbarNavigationProvider_dockingViewControllerPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___BKToolbarNavigationProvider_undockingViewControllerPublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKToolbarNavigationProvider_hasLargeTitlePublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKToolbarNavigationProvider_isPresentingCardsPublisher));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKToolbarNavigationProvider_observers));
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4
{
  id v6;
  id v7;
  BKToolbarNavigationProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s5Books25ToolbarNavigationProviderC20navigationController_8willShowySo012UINavigationF0C_So06UIViewF0CtF_0(v6, v7);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  BKToolbarNavigationProvider *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  _s5Books25ToolbarNavigationProviderC20navigationController_8willShowySo012UINavigationF0C_So06UIViewF0CtF_0(v7, v8);

}

- (void)mainFlowControllerDock:(id)a3
{
  sub_1002EADA0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___BKToolbarNavigationProvider_dockingViewControllerPublisher);
}

- (void)mainFlowControllerUndock:(id)a3
{
  sub_1002EADA0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___BKToolbarNavigationProvider_undockingViewControllerPublisher);
}

- (void)bsuiFeedViewControllerNavigationBarStyle:(unint64_t)a3
{
  BKToolbarNavigationProvider *v4;

  v4 = self;
  ToolbarNavigationProvider.bsuiFeedViewControllerNavigationBarStyle(_:)(a3);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  uint64_t v4;
  id v5;
  BKToolbarNavigationProvider *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKToolbarNavigationProvider_scrollOffsetInsetPublisher);
  v5 = a3;
  v6 = self;
  swift_retain(v4);
  objc_msgSend(v5, "contentOffset");
  v8 = v7;
  objc_msgSend(v5, "adjustedContentInset");
  v10[0] = v8;
  v10[1] = v9;
  PassthroughSubject.send(_:)(v10);

  swift_release(v4);
}

@end
