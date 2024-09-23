@implementation DOCCardPopoverAdaptablePresenter

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  _TtC5Files32DOCCardPopoverAdaptablePresenter *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_activePresentationController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_activePresentationController) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_1002BF000(v4);

}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  void *v6;
  id v7;
  _TtC5Files32DOCCardPopoverAdaptablePresenter *v8;
  id v9;

  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_activePresentationController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_activePresentationController) = (Class)a4;
  v9 = a4;
  v7 = a3;
  v8 = self;
  sub_1002BF000(v6);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC5Files32DOCCardPopoverAdaptablePresenter *v8;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_isActivelyPresentingPopover) = 0;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_presentationSource, a2);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, "setIsActivePopoverSource:", 0);

    swift_unknownObjectRelease(v6);
  }
}

- (_TtC5Files32DOCCardPopoverAdaptablePresenter)init
{
  return (_TtC5Files32DOCCardPopoverAdaptablePresenter *)sub_1002BF374();
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_presentationSource);
  sub_100087534(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_willPresentPopoverHandler), *(_QWORD *)&self->presentationSource[OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_willPresentPopoverHandler]);
  sub_100087534(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_willPresentCardHandler), *(_QWORD *)&self->presentationSource[OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_willPresentCardHandler]);
  sub_10007EB54((uint64_t)self + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_ppcDismissObserance);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_activePresentationController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files32DOCCardPopoverAdaptablePresenter_presented);
}

@end
