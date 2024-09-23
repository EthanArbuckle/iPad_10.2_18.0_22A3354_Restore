@implementation TungstenFirstFrameObserver

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  sub_1A6856488(0, (unint64_t *)&qword_1EE8D9430);
  return (OS_dispatch_queue *)(id)sub_1A7AE40AC();
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_1A7ADBF34();
  sub_1A6970F6C(v5);

  swift_release();
}

@end
