@implementation DragObserver_iOS.InternalDragObserver

- (void)dragMonitor:(id)a3 didBeginDragSession:(id)a4
{
  id v6;
  id v7;
  _TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_249893EC0((int)v6, v7);

}

- (void)dragMonitor:(id)a3 didEndDragSessionWithIdentifier:(unsigned int)a4
{
  id v6;
  _TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver *v7;

  v6 = a3;
  v7 = self;
  sub_249893FB0((uint64_t)v6, a4);

}

- (void)dragMonitorSession:(id)a3 didConnectWithItems:(id)a4
{
  uint64_t v5;

  sub_249860BD4(0, &qword_257891910);
  v5 = sub_2498ACC70();
  nullsub_1(a3, v5);
  swift_bridgeObjectRelease();
}

- (void)dragMonitorSession:(id)a3 didUpdateDragPresentation:(id)a4
{
  id v6;
  id v7;
  _TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_24989417C(v6, v7);

}

- (_TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver)init
{
  return (_TtCC13UniversalDrag16DragObserver_iOSP33_46F4F7DBF7EBE5237C36EDB049F4D13E20InternalDragObserver *)sub_249894468();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
}

@end
