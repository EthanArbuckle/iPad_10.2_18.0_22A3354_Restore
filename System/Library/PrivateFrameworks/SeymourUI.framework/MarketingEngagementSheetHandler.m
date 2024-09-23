@implementation MarketingEngagementSheetHandler

- (_TtC9SeymourUI31MarketingEngagementSheetHandler)init
{
  _TtC9SeymourUI31MarketingEngagementSheetHandler *result;

  result = (_TtC9SeymourUI31MarketingEngagementSheetHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)engagementViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC9SeymourUI31MarketingEngagementSheetHandler *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_22B1B6C84(v11);

}

- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC9SeymourUI31MarketingEngagementSheetHandler *v11;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  LOBYTE(self) = sub_22B1B6F34();
  _Block_release(v8);

  return self & 1;
}

@end
