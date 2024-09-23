@implementation AceObject(CommandUserInfo)

- (void)_siriui_applyUserInfoDictionary:()CommandUserInfo
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_254F58830))
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("CRKMapCardSectionPlacemarkData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3CF58], "mapItemStorageForSerializedPlaceData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBFAC8], "placemarkWithGEOMapItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformToLocation();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x24BE81380]);
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setData:", v9);

    objc_msgSend(a1, "setLocation:", v8);
  }

}

@end
