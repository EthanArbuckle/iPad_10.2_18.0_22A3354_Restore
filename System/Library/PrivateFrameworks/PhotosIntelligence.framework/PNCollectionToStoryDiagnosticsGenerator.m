@implementation PNCollectionToStoryDiagnosticsGenerator

- (PNCollectionToStoryDiagnosticsGenerator)initWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  CollectionToStoryDiagnosticsGenerator.init(photoLibrary:)();
  return self;
}

+ (void)clearAllFilesWithPhotoLibrary:(PHPhotoLibrary *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  PHPhotoLibrary *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  sub_243D30DAC((uint64_t)&unk_2572FCF00, (uint64_t)v7);
}

@end
