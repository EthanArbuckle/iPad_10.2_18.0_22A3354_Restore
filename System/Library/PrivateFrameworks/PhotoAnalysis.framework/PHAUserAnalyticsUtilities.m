@implementation PHAUserAnalyticsUtilities

- (PHAUserAnalyticsUtilities)initWithPhotoLibrary:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHAUserAnalyticsUtilities_photoLibrary) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UserAnalyticsUtilities();
  v4 = a3;
  return -[PHAUserAnalyticsUtilities init](&v6, sel_init);
}

- (BOOL)updateUserAnalyticsStreamWithProgressReporter:(id)a3 error:(id *)a4
{
  id v5;
  PHAUserAnalyticsUtilities *v6;

  v5 = a3;
  v6 = self;
  sub_1CAD07328();

  return 1;
}

- (PHAUserAnalyticsUtilities)init
{
  PHAUserAnalyticsUtilities *result;

  result = (PHAUserAnalyticsUtilities *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
