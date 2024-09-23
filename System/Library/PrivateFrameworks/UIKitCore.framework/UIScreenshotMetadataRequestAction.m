@implementation UIScreenshotMetadataRequestAction

- (int64_t)UIActionType
{
  return 31;
}

- (void)fulfillRequest
{
  void *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v3 = (void *)_MergedGlobals_1051;
  v9 = _MergedGlobals_1051;
  if (!_MergedGlobals_1051)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getSSScreenshotMetadataHarvesterClass_block_invoke;
    v5[3] = &unk_1E16B14C0;
    v5[4] = &v6;
    __getSSScreenshotMetadataHarvesterClass_block_invoke((uint64_t)v5);
    v3 = (void *)v7[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v4, "harvestScreenshotMetadataAndRespondToAction:", self);
}

@end
