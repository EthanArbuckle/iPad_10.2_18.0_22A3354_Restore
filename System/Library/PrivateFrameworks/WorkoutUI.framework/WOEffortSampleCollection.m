@implementation WOEffortSampleCollection

- (HKQuantitySample)effortSample
{
  return (HKQuantitySample *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___WOEffortSampleCollection_effortSample));
}

- (HKQuantitySample)estimatedEffortSample
{
  return (HKQuantitySample *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample));
}

- (WOEffortSampleCollection)initWithEffortSample:(id)a3 estimatedEffortSample:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EffortSampleCollection();
  v6 = a3;
  v7 = a4;
  return -[WOEffortSampleCollection init](&v9, sel_init);
}

- (HKQuantitySample)preferredSample
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample);
  v3 = v2;
  if (!v2)
  {
    v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample);
    if (v3)
      v4 = v3;
  }
  v5 = v2;
  return (HKQuantitySample *)v3;
}

- (HKQuantity)preferredQuantity
{
  void *v3;
  id v4;
  void *v5;
  WOEffortSampleCollection *v6;
  id v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample);
  if (v3)
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample);
  }
  else
  {
    v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample);
    if (!v5)
    {
      v8 = 0;
      return (HKQuantity *)v8;
    }
    v4 = v5;
    v3 = 0;
  }
  v6 = self;
  v7 = v3;
  v8 = objc_msgSend(v4, sel_quantity);

  return (HKQuantity *)v8;
}

- (WOEffortSampleCollection)init
{
  WOEffortSampleCollection *result;

  result = (WOEffortSampleCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
