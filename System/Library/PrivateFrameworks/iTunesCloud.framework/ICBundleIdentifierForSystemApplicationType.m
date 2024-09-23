@implementation ICBundleIdentifierForSystemApplicationType

void __ICBundleIdentifierForSystemApplicationType_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E08];
  v8[0] = &unk_1E43E6820;
  v8[1] = &unk_1E43E6838;
  v9[0] = CFSTR("com.apple.Music");
  v9[1] = CFSTR("com.apple.tv");
  v8[2] = &unk_1E43E6850;
  v8[3] = &unk_1E43E6868;
  v9[2] = CFSTR("com.apple.iBooks");
  v9[3] = CFSTR("com.apple.podcasts");
  v8[4] = &unk_1E43E6880;
  v9[4] = CFSTR("com.apple.AppStore");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithDictionary:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap;
  ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap = v2;

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWatch"))
  {
    objc_msgSend((id)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap, "setObject:forKeyedSubscript:", CFSTR("com.apple.NanoMusic"), &unk_1E43E6820);
    v5 = (void *)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap;
    v6 = CFSTR("com.apple.NanoBooks");
    v7 = &unk_1E43E6850;
LABEL_5:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v7);
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isAppleTV"))
  {
    objc_msgSend((id)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap, "setObject:forKeyedSubscript:", CFSTR("com.apple.TVMusic"), &unk_1E43E6820);
    v5 = (void *)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap;
    v6 = CFSTR("com.apple.TVWatchList");
    v7 = &unk_1E43E6838;
    goto LABEL_5;
  }
LABEL_6:

}

@end
