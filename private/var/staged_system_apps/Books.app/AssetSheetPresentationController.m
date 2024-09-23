@implementation AssetSheetPresentationController

- (_TtC5Books32AssetSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  _TtC5Books32AssetSheetPresentationController *result;

  result = (_TtC5Books32AssetSheetPresentationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002BLL, 0x80000001007DBA20, "Books/AssetSheetPresentationController.swift", 44, 2, 21, 0);
  __break(1u);
  return result;
}

- (void)presentationTransitionWillBegin
{
  id v2;
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AssetSheetPresentationController();
  v2 = v5.receiver;
  -[AssetSheetPresentationController presentationTransitionWillBegin](&v5, "presentationTransitionWillBegin");
  v3 = objc_msgSend(v2, "presentedViewController", v5.receiver, v5.super_class);
  v4 = objc_opt_self(BKBasePresentingViewController);
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v3, v4, 0, 0, 0), "setStateShouldOpen:", 1);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC5Books32AssetSheetPresentationController *v4;

  v4 = self;
  sub_1006756B8(a3);

}

- (void)dismissalTransitionWillBegin
{
  id v2;
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AssetSheetPresentationController();
  v2 = v5.receiver;
  -[AssetSheetPresentationController dismissalTransitionWillBegin](&v5, "dismissalTransitionWillBegin");
  v3 = objc_msgSend(v2, "presentedViewController", v5.receiver, v5.super_class);
  v4 = objc_opt_self(BKBasePresentingViewController);
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v3, v4, 0, 0, 0), "assetPresenterPrepareForDismissal");

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _TtC5Books32AssetSheetPresentationController *v4;

  v4 = self;
  sub_1006758EC(a3);

}

@end
