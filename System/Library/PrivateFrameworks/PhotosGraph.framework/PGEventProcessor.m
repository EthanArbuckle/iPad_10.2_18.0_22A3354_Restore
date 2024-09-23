@implementation PGEventProcessor

+ (BOOL)processPGGraphForMomentNodes:(id)a3 graphBuilder:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_1CA3936D4(v8, v9);

  return 1;
}

- (PGEventProcessor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGEventProcessor init](&v3, sel_init);
}

@end
