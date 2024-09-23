@implementation PHAProcessIsPhotoAnalysisd

void __PHAProcessIsPhotoAnalysisd_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PHAProcessIsPhotoAnalysisd_processName;
  PHAProcessIsPhotoAnalysisd_processName = v0;

}

@end
