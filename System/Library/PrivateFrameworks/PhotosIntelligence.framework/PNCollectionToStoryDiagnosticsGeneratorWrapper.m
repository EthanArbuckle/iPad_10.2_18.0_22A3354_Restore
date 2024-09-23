@implementation PNCollectionToStoryDiagnosticsGeneratorWrapper

+ (void)deleteDiagnosticFilesWith:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __94__PNCollectionToStoryDiagnosticsGeneratorWrapper_deleteDiagnosticFilesWith_completionHandler___block_invoke;
  v7[3] = &unk_2514805B0;
  v8 = v5;
  v6 = v5;
  +[PNCollectionToStoryDiagnosticsGenerator clearAllFilesWithPhotoLibrary:completionHandler:](PNCollectionToStoryDiagnosticsGenerator, "clearAllFilesWithPhotoLibrary:completionHandler:", a3, v7);

}

uint64_t __94__PNCollectionToStoryDiagnosticsGeneratorWrapper_deleteDiagnosticFilesWith_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
