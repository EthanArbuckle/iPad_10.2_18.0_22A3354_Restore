@implementation WFActivityProgressController

- (unint64_t)state
{
  return sub_2201938C4();
}

- (void)setState:(unint64_t)a3
{
  WFActivityProgressController *v4;

  v4 = self;
  sub_220193920(a3);

}

- (WFActivityProgressController)initWithTitle:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  WFActivityProgressController *result;

  if (a3)
  {
    v3 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  ActivityProgressController.init(title:)(v3, v4);
  return result;
}

- (void)presentFrom:(id)a3 cancellationHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  WFActivityProgressController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_2201951F4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_220193AD8(v8, (uint64_t)v6, v7);
  sub_220096AA0((uint64_t)v6);

}

- (void)dismissWithCompletion:(id)a3
{
  void *v4;
  WFActivityProgressController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_220193FE8((uint64_t)v5, (void (**)(_QWORD))v4);
  _Block_release(v4);

}

- (WFActivityProgressController)init
{
  ActivityProgressController.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_6_14(*(id *)((char *)&self->super.isa + OBJC_IVAR___WFActivityProgressController_alertController));
}

@end
