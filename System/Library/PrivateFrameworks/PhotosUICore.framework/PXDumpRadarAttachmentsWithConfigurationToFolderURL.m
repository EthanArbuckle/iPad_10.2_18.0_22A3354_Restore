@implementation PXDumpRadarAttachmentsWithConfigurationToFolderURL

void __PXDumpRadarAttachmentsWithConfigurationToFolderURL_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v5 = 0;
    PXFeedbackTapToRadarUtilitiesCopyFilesToFolder(a2, v3, (uint64_t)&v5);
    v4 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

@end
