@implementation PGSharedLibrarySimulation

+ (BOOL)runSharedLibrarySimulationUsingCameraMetadataDirectoryPath:(id)a3 withProgressReporter:(id)a4 error:(id *)a5
{
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v6 = sub_1CA85B534();
  v8 = v7;
  v9 = a4;
  sub_1CA4C76F0(v6, v8);
  swift_bridgeObjectRelease();

  return 1;
}

- (PGSharedLibrarySimulation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PGSharedLibrarySimulation();
  return -[PGSharedLibrarySimulation init](&v3, sel_init);
}

@end
