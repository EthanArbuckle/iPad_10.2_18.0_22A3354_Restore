@implementation DOCSourceListInterface_Default

- (UIImage)iconForRecents
{
  return (UIImage *)sub_10046753C((uint64_t)self, (uint64_t)a2, 0x6B636F6C63, 0xE500000000000000);
}

- (UIImage)iconForShared
{
  return (UIImage *)sub_10046753C((uint64_t)self, (uint64_t)a2, 0xD000000000000018, 0x800000010050BC50);
}

- (UIImage)iconForSyncError
{
  return (UIImage *)sub_10046753C((uint64_t)self, (uint64_t)a2, 0xD00000000000002BLL, 0x80000001005376C0);
}

- (UIImage)iconForCompletedSync
{
  return (UIImage *)sub_10046753C((uint64_t)self, (uint64_t)a2, 0xD000000000000010, 0x8000000100524350);
}

- (id)ejectIconFor:(int64_t)a3 iconColor:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v6 = (void *)objc_opt_self(UIImageSymbolConfiguration);
  v7 = a4;
  v8 = objc_msgSend(v6, "configurationWithTextStyle:scale:", UIFontTextStyleBody, 2, swift_retain().n128_f64[0]);
  v9 = sub_1004687C0(0x69632E7463656A65, 0xEC000000656C6372, 0, 1);
  v10 = objc_msgSend(v9, "imageWithConfiguration:", v8);

  v11 = objc_msgSend(v10, "imageWithTintColor:renderingMode:", v7, 1);
  swift_release(self);

  return v11;
}

- (id)iconForSource:(id)a3
{
  return objc_msgSend(a3, "iconPreferingSymbolImages");
}

- (BOOL)iconForSourceRequireHierarchicalColors:(id)a3
{
  return objc_msgSend(a3, "iconPreferingSymbolImagesRequiresHierarchicalColors");
}

- (id)nonThumbnailedIconForItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  swift_retain();
  v5 = sub_1004685D0(v4);

  swift_release(self);
  return v5;
}

@end
