@implementation BiomeSiriUIProcessor

- (void)main
{
  _TtC13SiriInference20BiomeSiriUIProcessor *v2;

  v2 = self;
  BiomeSiriUIProcessor.main()();

}

- (_TtC13SiriInference20BiomeSiriUIProcessor)init
{
  BiomeSiriUIProcessor.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC13SiriInference20BiomeSiriUIProcessor_siriTasksEvaluator);

  v3 = (char *)self + OBJC_IVAR____TtC13SiriInference20BiomeSiriUIProcessor_intentEventStore;
  v4 = sub_1C0303778();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
