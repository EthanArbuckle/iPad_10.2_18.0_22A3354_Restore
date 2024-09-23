@implementation WFToastManager

- (WFToastManagerDelegate)delegate
{
  return (WFToastManagerDelegate *)(id)sub_1C1473C48();
}

- (void)setDelegate:(id)a3
{
  WFToastManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1C1473CD8();

}

- (WFSessionKitAssertion)toastedSession
{
  WFToastManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1C1473E5C();
  v4 = v3;

  return (WFSessionKitAssertion *)v4;
}

- (WFToastManager)initWithDelegate:(id)a3
{
  WFToastManager *result;

  swift_unknownObjectRetain();
  ToastManager.init(with:)();
  return result;
}

- (BOOL)toastSessionWithIdentifier:(id)a3 forDuration:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WFToastManager *v9;

  v6 = sub_1C1546BD0();
  v8 = v7;
  v9 = self;
  LOBYTE(v6) = sub_1C1474158(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)eatTheToastWithReason:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  WFToastManager *v7;

  v4 = sub_1C1546BD0();
  v6 = v5;
  v7 = self;
  sub_1C14751A0(v4, v6);

  swift_bridgeObjectRelease();
}

- (WFToastManager)init
{
  return (WFToastManager *)ToastManager.init()();
}

- (void).cxx_destruct
{
  sub_1C1475F3C((uint64_t)self + OBJC_IVAR___WFToastManager_delegate);
  swift_release();

  swift_unknownObjectRelease();
}

@end
