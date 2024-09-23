@implementation CRLiOSMiniFormatterPresenter

- (_TtC8Freeform28CRLiOSMiniFormatterPresenter)initWithEditorController:(id)a3 canvasLayerHosting:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain(a4);
  return (_TtC8Freeform28CRLiOSMiniFormatterPresenter *)sub_1005BA294(v5, a4);
}

- (id)crlaxMiniFormatterViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC));
}

- (BOOL)isPresentingInFixedPosition
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v2;
  char v3;

  v2 = self;
  v3 = sub_1005BA4A0();

  return v3 & 1;
}

- (void)handleSingleTapOnRep:(id)a3 withSelectionPath:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1005BA53C(v6, v7);

}

- (void)presentMiniFormatterForSelectionPath:(id)a3
{
  id v4;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v5;

  v4 = a3;
  v5 = self;
  sub_1005BA998(v4, 1);

}

- (void)dismissMiniFormatter
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v2;

  v2 = self;
  sub_1005BB634(1, 1, 0);

}

- (void)dismissMiniFormatterWithAnimated:(BOOL)a3
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v4;

  v4 = self;
  sub_1005BB634(1, a3, 0);

}

- (void)dismissMiniFormatterForRep:(id)a3
{
  uint64_t v3;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v4;
  id v5;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v6;

  v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_repsForCurrentSelectionPath);
  if (v3)
  {
    v4 = self;
    v5 = a3;
    v6 = v4;
    swift_bridgeObjectRetain(v3);
    LOBYTE(v4) = sub_100623088(v5, v3);
    swift_bridgeObjectRelease(v3);
    if ((v4 & 1) != 0)
      sub_1005BB634(1, 1, 0);

  }
}

- (void)dismissPresentedMenus
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v2;

  v2 = self;
  sub_1005BBAE4();

}

- (void)updateMiniFormatter
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v2;

  v2 = self;
  sub_1005BC30C();

}

- (BOOL)isPresentingMiniFormatter
{
  return *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC) != 0;
}

- (BOOL)isPresentingSecondLayerPopover
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1005BC430();

  return v3;
}

- (BOOL)isPinnedToTopOfRep
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v2;
  char v3;

  v2 = self;
  v3 = sub_1005BC500();

  return v3 & 1;
}

- (void)forceMiniFormatterVCToReposition
{
  void *v2;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    sub_1008058B4();

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_canvasViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_miniFormatterVC));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_ellipsisBuilder));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_ellipsisBaseButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_inspectorElementsBuilders));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_inspectorElementsBaseButtons));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_generalElementsBuilders));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_generalElementsBaseButtons));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_canvasElementsBuilders));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_presentedNavigationController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_presentedAuxiliaryViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_auxiliaryPresentedBuilder));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_presentedWrappedNavigationController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_selectionPath));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_repsForCurrentSelectionPath));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_flattenedBoardItemsForCurrentSelectionPath));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLiOSMiniFormatterPresenter_secondLayerPresentedBuilder));
}

- (void)dismissSecondLayerPopover
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v2;

  v2 = self;
  sub_1005C1434();

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1005C5E90(v7, v8);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1005C33B0(v6, v7);

  return v9;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v5;

  v4 = a3;
  v5 = self;
  sub_1005C34F0(v4);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform28CRLMiniFormatterStateManager_canvasLayerHosting);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, "interactiveCanvasController");
  objc_msgSend(v7, "unobscuredFrameDidChange");

}

@end
