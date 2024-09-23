@implementation WFEntityPickerHostingControllerFactory

+ (id)makeHostingController:(id)a3 maxRows:(int64_t)a4 tapHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = sub_2202611A0((uint64_t)v9, a4, (uint64_t)sub_220261674, v8);

  swift_release();
  return v10;
}

- (WFEntityPickerHostingControllerFactory)init
{
  return (WFEntityPickerHostingControllerFactory *)sub_2202615A4();
}

@end
