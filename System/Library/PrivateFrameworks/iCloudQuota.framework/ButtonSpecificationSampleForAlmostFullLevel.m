@implementation ButtonSpecificationSampleForAlmostFullLevel

void ___ButtonSpecificationSampleForAlmostFullLevel_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  v7[0] = CFSTR("com.apple.mobilemail");
  v1 = MEMORY[0x1E0C9AA70];
  +[ICQLink linkWithText:options:action:parameters:](ICQLink, "linkWithText:options:action:parameters:", CFSTR("iCloud Storage is Almost Full – Upgrade Storage [ENG]"), 1, 3, MEMORY[0x1E0C9AA70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("com.apple.iCloudDriveApp");
  +[ICQLink linkWithText:options:action:parameters:](ICQLink, "linkWithText:options:action:parameters:", CFSTR("iCloud Storage is Almost Full – Upgrade Storage [ENG]"), 1, 3, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("com.apple.icloud.quota.ICQ-Adopt");
  +[ICQLink linkWithText:options:action:parameters:](ICQLink, "linkWithText:options:action:parameters:", CFSTR("iCloud Storage is Almost Full – Upgrade Storage [ENG]"), 1, 3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLinkForBundleIdentifier:", v5);

  v6 = (void *)_ButtonSpecificationSampleForAlmostFullLevel_sButtonSpecification;
  _ButtonSpecificationSampleForAlmostFullLevel_sButtonSpecification = (uint64_t)v0;

}

@end
