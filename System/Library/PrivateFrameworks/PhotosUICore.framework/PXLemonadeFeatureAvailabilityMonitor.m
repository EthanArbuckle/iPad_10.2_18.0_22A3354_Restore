@implementation PXLemonadeFeatureAvailabilityMonitor

+ (unint64_t)stateChangedChangeDescriptor
{
  return 1;
}

- (PXObservable)observable
{
  return (PXObservable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor_observable));
}

- (int64_t)state
{
  PXLemonadeFeatureAvailabilityMonitor *v3;
  int64_t v4;

  swift_getKeyPath();
  sub_1A6847A44(&qword_1EE8D5E78, (uint64_t (*)(uint64_t))type metadata accessor for LemonadeFeatureAvailabilityMonitor, (uint64_t)&protocol conformance descriptor for LemonadeFeatureAvailabilityMonitor);
  v3 = self;
  sub_1A7ADCCB4();
  swift_release();
  v4 = *(int64_t *)((char *)&v3->super.isa + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor___state);

  return v4;
}

- (void)setState:(int64_t)a3
{
  PXLemonadeFeatureAvailabilityMonitor *v4;

  v4 = self;
  sub_1A70FA398(a3);

}

- (PXLemonadeFeatureAvailabilityMonitor)init
{
  PXLemonadeFeatureAvailabilityMonitor *result;

  result = (PXLemonadeFeatureAvailabilityMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor_highlightAnalysisStatus));
  swift_unknownObjectRelease();

  sub_1A67EC0EC((uint64_t)self + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor____lazy_storage___updateInterval, &qword_1EE8D8870, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4A8]);
  v3 = (char *)self + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
