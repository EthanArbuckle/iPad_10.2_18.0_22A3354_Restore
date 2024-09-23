@implementation ICCloudServerSupportedServiceGetNamesBidirectionalDictionary

void ___ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0D4D040]);
  v4[0] = &unk_1E43E6610;
  v4[1] = &unk_1E43E6628;
  v5[0] = CFSTR("main");
  v5[1] = CFSTR("networkAvailability");
  v4[2] = &unk_1E43E6640;
  v4[3] = &unk_1E43E6658;
  v5[2] = CFSTR("cloud");
  v5[3] = CFSTR("cloudStatusMonitor");
  v4[4] = &unk_1E43E6670;
  v4[5] = &unk_1E43E6688;
  v5[4] = CFSTR("mediaUserStateCenterServer");
  v5[5] = CFSTR("playbackPosition");
  v4[6] = &unk_1E43E66A0;
  v5[6] = CFSTR("badging");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithDictionary:", v1);
  v3 = (void *)_ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_sCloudServerSupportedServiceNames;
  _ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_sCloudServerSupportedServiceNames = v2;

}

@end
