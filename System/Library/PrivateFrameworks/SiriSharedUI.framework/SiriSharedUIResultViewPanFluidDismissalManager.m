@implementation SiriSharedUIResultViewPanFluidDismissalManager

- (_TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager)init
{
  return (_TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager *)sub_1DE107404();
}

- (void)_hyperInteractorApplyPresentationPoint:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager *v9;

  v5 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_delegate;
  if (MEMORY[0x1DF0E8588]((char *)self + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 16);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_fluidDismissalGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_resultViewStablePoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_interactiveRegion));
  sub_1DE0F92C8((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_delegate);
}

@end
