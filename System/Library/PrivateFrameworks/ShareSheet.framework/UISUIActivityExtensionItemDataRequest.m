@implementation UISUIActivityExtensionItemDataRequest

+ (id)requestForActivity:(id)a3 activityType:(id)a4
{
  return (id)objc_msgSend(a1, "requestForActivity:activityType:activitySpecificMetadata:", a3, a4, 0);
}

+ (id)requestForActivity:(id)a3 activityType:(id)a4 sourceAppIsManaged:(BOOL)a5
{
  _BOOL8 v5;
  void *v6;

  v5 = a5;
  objc_msgSend(a1, "requestForActivity:activityType:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceAppIsManaged:", v5);
  return v6;
}

+ (id)requestForActivity:(id)a3 activityType:(id)a4 activitySpecificMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "activityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithClassForPreparingExtensionItemData:", objc_msgSend((id)objc_opt_class(), "classForPreparingExtensionItemData"));
  objc_msgSend(v10, "activityUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActivityUUID:", v14);

  objc_msgSend(v13, "setActivityCategory:", objc_msgSend((id)objc_opt_class(), "activityCategory"));
  objc_msgSend(v10, "applicationExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExtensionIdentifier:", v16);

  objc_msgSend(v13, "setIsAirDropActivity:", v12);
  objc_msgSend(v10, "_thumbnailSize");
  objc_msgSend(v13, "setThumbnailSize:");
  objc_msgSend(v13, "setWantsThumbnailItemData:", objc_msgSend(v10, "_wantsThumbnailItemData"));
  objc_msgSend(v13, "setWantsAttachmentURLItemData:", objc_msgSend(v10, "_wantsAttachmentURLItemData"));
  objc_msgSend(v13, "setActivitySupportsPromiseURLs:", objc_msgSend(v10, "_activitySupportsPromiseURLs"));
  objc_msgSend(v13, "setActivityType:", v9);

  objc_msgSend(v13, "setActivitySpecificMetadata:", v8);
  v17 = objc_msgSend(v10, "maxPreviews");

  objc_msgSend(v13, "setMaxPreviews:", v17);
  return v13;
}

- (id)_initWithClassForPreparingExtensionItemData:(Class)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISUIActivityExtensionItemDataRequest;
  result = -[UISUIActivityExtensionItemDataRequest init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 2) = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityExtensionItemDataRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  UISUIActivityExtensionItemDataRequest *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_classNameForPreparingExtensionItemData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  v8 = -[UISUIActivityExtensionItemDataRequest _initWithClassForPreparingExtensionItemData:](self, "_initWithClassForPreparingExtensionItemData:", NSClassFromString(v7));
  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_activityUUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setActivityUUID:](v8, "setActivityUUID:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_activityType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setActivityType:](v8, "setActivityType:", v14);

    NSStringFromSelector(sel_activityCategory);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setActivityCategory:](v8, "setActivityCategory:", objc_msgSend(v4, "decodeIntegerForKey:", v15));

    v16 = objc_opt_class();
    NSStringFromSelector(sel_extensionIdentifier);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setExtensionIdentifier:](v8, "setExtensionIdentifier:", v18);

    NSStringFromSelector(sel_isAirDropActivity);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setIsAirDropActivity:](v8, "setIsAirDropActivity:", objc_msgSend(v4, "decodeBoolForKey:", v19));

    NSStringFromSelector(sel_thumbnailSize);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setThumbnailSize:](v8, "setThumbnailSize:", _UISecureDecodeCGSizeWithKeyAndDefaultSize(v4, v20, *MEMORY[0x1E0C9D820]));

    NSStringFromSelector(sel_wantsThumbnailItemData);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setWantsThumbnailItemData:](v8, "setWantsThumbnailItemData:", objc_msgSend(v4, "decodeBoolForKey:", v21));

    NSStringFromSelector(sel_wantsAttachmentURLItemData);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setWantsAttachmentURLItemData:](v8, "setWantsAttachmentURLItemData:", objc_msgSend(v4, "decodeBoolForKey:", v22));

    NSStringFromSelector(sel_activitySupportsPromiseURLs);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setActivitySupportsPromiseURLs:](v8, "setActivitySupportsPromiseURLs:", objc_msgSend(v4, "decodeBoolForKey:", v23));

    _UISecureStandardPropertyListClasses();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activitySpecificMetadata);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setActivitySpecificMetadata:](v8, "setActivitySpecificMetadata:", v26);

    NSStringFromSelector(sel_maxPreviews);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setMaxPreviews:](v8, "setMaxPreviews:", objc_msgSend(v4, "decodeIntegerForKey:", v27));

    NSStringFromSelector(sel_sourceAppIsManaged);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemDataRequest setSourceAppIsManaged:](v8, "setSourceAppIsManaged:", objc_msgSend(v4, "decodeBoolForKey:", v28));

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  id v33;

  v4 = a3;
  NSStringFromClass(-[UISUIActivityExtensionItemDataRequest classForPreparingExtensionItemData](self, "classForPreparingExtensionItemData"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_classNameForPreparingExtensionItemData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, v5);

  -[UISUIActivityExtensionItemDataRequest activityType](self, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v7);

  -[UISUIActivityExtensionItemDataRequest activityUUID](self, "activityUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityUUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v9);

  v10 = -[UISUIActivityExtensionItemDataRequest activityCategory](self, "activityCategory");
  NSStringFromSelector(sel_activityCategory);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v10, v11);

  -[UISUIActivityExtensionItemDataRequest extensionIdentifier](self, "extensionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isPhotoServiceAccessGranted);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v13);

  v14 = -[UISUIActivityExtensionItemDataRequest isAirDropActivity](self, "isAirDropActivity");
  NSStringFromSelector(sel_isAirDropActivity);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v14, v15);

  -[UISUIActivityExtensionItemDataRequest thumbnailSize](self, "thumbnailSize");
  v17 = v16;
  v19 = v18;
  NSStringFromSelector(sel_thumbnailSize);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _UISecureEncodeCGSizeWithKey(v4, v20, v17, v19);

  v21 = -[UISUIActivityExtensionItemDataRequest wantsThumbnailItemData](self, "wantsThumbnailItemData");
  NSStringFromSelector(sel_wantsThumbnailItemData);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[UISUIActivityExtensionItemDataRequest wantsAttachmentURLItemData](self, "wantsAttachmentURLItemData");
  NSStringFromSelector(sel_wantsAttachmentURLItemData);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

  v25 = -[UISUIActivityExtensionItemDataRequest activitySupportsPromiseURLs](self, "activitySupportsPromiseURLs");
  NSStringFromSelector(sel_activitySupportsPromiseURLs);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v25, v26);

  -[UISUIActivityExtensionItemDataRequest activitySpecificMetadata](self, "activitySpecificMetadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activitySpecificMetadata);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  v29 = -[UISUIActivityExtensionItemDataRequest maxPreviews](self, "maxPreviews");
  NSStringFromSelector(sel_maxPreviews);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v29, v30);

  v31 = -[UISUIActivityExtensionItemDataRequest sourceAppIsManaged](self, "sourceAppIsManaged");
  NSStringFromSelector(sel_sourceAppIsManaged);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v31, v32);

}

- (Class)classForPreparingExtensionItemData
{
  return self->_classForPreparingExtensionItemData;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activityUUID, a3);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategory = a3;
}

- (BOOL)wantsThumbnailItemData
{
  return self->_wantsThumbnailItemData;
}

- (void)setWantsThumbnailItemData:(BOOL)a3
{
  self->_wantsThumbnailItemData = a3;
}

- (BOOL)wantsAttachmentURLItemData
{
  return self->_wantsAttachmentURLItemData;
}

- (void)setWantsAttachmentURLItemData:(BOOL)a3
{
  self->_wantsAttachmentURLItemData = a3;
}

- (int64_t)maxPreviews
{
  return self->_maxPreviews;
}

- (void)setMaxPreviews:(int64_t)a3
{
  self->_maxPreviews = a3;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  self->_extensionIdentifier = (NSString *)a3;
}

- (BOOL)isAirDropActivity
{
  return self->_isAirDropActivity;
}

- (void)setIsAirDropActivity:(BOOL)a3
{
  self->_isAirDropActivity = a3;
}

- (BOOL)activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (void)setActivitySupportsPromiseURLs:(BOOL)a3
{
  self->_activitySupportsPromiseURLs = a3;
}

- (NSDictionary)activitySpecificMetadata
{
  return self->_activitySpecificMetadata;
}

- (void)setActivitySpecificMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_activitySpecificMetadata, a3);
}

- (BOOL)sourceAppIsManaged
{
  return self->_sourceAppIsManaged;
}

- (void)setSourceAppIsManaged:(BOOL)a3
{
  self->_sourceAppIsManaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySpecificMetadata, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end
