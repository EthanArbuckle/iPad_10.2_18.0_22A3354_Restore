@implementation CNVCardWritingOptions

+ (id)optionsFromPreferences
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setIncludeNotes:", +[CNVCardUserDefaults includeNotesInVCards](CNVCardUserDefaults, "includeNotesInVCards"));
  objc_msgSend(v2, "setIncludePhotos:", +[CNVCardUserDefaults includePhotosInVCards](CNVCardUserDefaults, "includePhotosInVCards"));
  objc_msgSend(v2, "setOutputVersion:", +[CNVCardUserDefaults outputFormat](CNVCardUserDefaults, "outputFormat"));
  objc_msgSend(v2, "setIncludeUserSettings:", +[CNVCardUserDefaults includeUserSettings](CNVCardUserDefaults, "includeUserSettings"));
  if (objc_msgSend(v2, "outputVersion") == 1)
  {
    +[CNVCardEncoding encodingsFromUserDefaults](CNVCardEncoding, "encodingsFromUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAvailableEncodings:", v3);

  }
  return v2;
}

- (CNVCardWritingOptions)init
{
  CNVCardWritingOptions *v2;
  CNVCardWritingOptions *v3;
  CNVCardWritingOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNVCardWritingOptions;
  v2 = -[CNVCardWritingOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_includeMeCardOnlySharingProperties = 1;
    v2->_maximumImageSize = (CGSize)*MEMORY[0x1E0CB3440];
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSSize v28;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includePrivateFields"), -[CNVCardWritingOptions includePrivateFields](self, "includePrivateFields"));
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includePrivateBundleIdentifiers"), -[CNVCardWritingOptions includePrivateBundleIdentifiers](self, "includePrivateBundleIdentifiers"));
  v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeUserSettings"), -[CNVCardWritingOptions includeUserSettings](self, "includeUserSettings"));
  v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeNotes"), -[CNVCardWritingOptions includeNotes](self, "includeNotes"));
  v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includePhotos"), -[CNVCardWritingOptions includePhotos](self, "includePhotos"));
  v9 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeWallpaper"), -[CNVCardWritingOptions includeWallpaper](self, "includeWallpaper"));
  v10 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includeMeCardOnlySharingProperties"), -[CNVCardWritingOptions includeMeCardOnlySharingProperties](self, "includeMeCardOnlySharingProperties"));
  v11 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includePronouns"), -[CNVCardWritingOptions includePronouns](self, "includePronouns"));
  v12 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("useUnencryptedPronouns"), -[CNVCardWritingOptions useUnencryptedPronouns](self, "useUnencryptedPronouns"));
  v13 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("compressPhotos"), -[CNVCardWritingOptions compressPhotos](self, "compressPhotos"));
  v14 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("prefersUncroppedPhotos"), -[CNVCardWritingOptions prefersUncroppedPhotos](self, "prefersUncroppedPhotos"));
  v15 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("usePhotoReferencesIfAvailable"), -[CNVCardWritingOptions usePhotoReferencesIfAvailable](self, "usePhotoReferencesIfAvailable"));
  v16 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("shouldSuppressRegulatoryLogging"), -[CNVCardWritingOptions shouldSuppressRegulatoryLogging](self, "shouldSuppressRegulatoryLogging"));
  v17 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("maximumEncodingLength"), -[CNVCardWritingOptions maximumEncodingLength](self, "maximumEncodingLength"));
  v18 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("maximumImageEncodingLength"), -[CNVCardWritingOptions maximumImageEncodingLength](self, "maximumImageEncodingLength"));
  -[CNVCardWritingOptions maximumImageSize](self, "maximumImageSize");
  NSStringFromSize(v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("maximumImageSize"), v19);

  -[CNVCardWritingOptions treatAsUnknownProperties](self, "treatAsUnknownProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("treatAsUnknownProperties"), v21);

  v23 = (id)objc_msgSend(v3, "appendName:vCardOutputVersionValue:", CFSTR("outputVersion"), -[CNVCardWritingOptions outputVersion](self, "outputVersion"));
  -[CNVCardWritingOptions availableEncodings](self, "availableEncodings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("availableEncodings"), v24);

  objc_msgSend(v3, "build");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)includePrivateFields
{
  return self->_includePrivateFields;
}

- (void)setIncludePrivateFields:(BOOL)a3
{
  self->_includePrivateFields = a3;
}

- (BOOL)includePrivateBundleIdentifiers
{
  return self->_includePrivateBundleIdentifiers;
}

- (void)setIncludePrivateBundleIdentifiers:(BOOL)a3
{
  self->_includePrivateBundleIdentifiers = a3;
}

- (BOOL)includeNotes
{
  return self->_includeNotes;
}

- (void)setIncludeNotes:(BOOL)a3
{
  self->_includeNotes = a3;
}

- (BOOL)includeUserSettings
{
  return self->_includeUserSettings;
}

- (void)setIncludeUserSettings:(BOOL)a3
{
  self->_includeUserSettings = a3;
}

- (BOOL)includePhotos
{
  return self->_includePhotos;
}

- (void)setIncludePhotos:(BOOL)a3
{
  self->_includePhotos = a3;
}

- (BOOL)includeWallpaper
{
  return self->_includeWallpaper;
}

- (void)setIncludeWallpaper:(BOOL)a3
{
  self->_includeWallpaper = a3;
}

- (BOOL)includeMeCardOnlySharingProperties
{
  return self->_includeMeCardOnlySharingProperties;
}

- (void)setIncludeMeCardOnlySharingProperties:(BOOL)a3
{
  self->_includeMeCardOnlySharingProperties = a3;
}

- (BOOL)includePronouns
{
  return self->_includePronouns;
}

- (void)setIncludePronouns:(BOOL)a3
{
  self->_includePronouns = a3;
}

- (BOOL)useUnencryptedPronouns
{
  return self->_useUnencryptedPronouns;
}

- (void)setUseUnencryptedPronouns:(BOOL)a3
{
  self->_useUnencryptedPronouns = a3;
}

- (BOOL)compressPhotos
{
  return self->_compressPhotos;
}

- (void)setCompressPhotos:(BOOL)a3
{
  self->_compressPhotos = a3;
}

- (BOOL)prefersUncroppedPhotos
{
  return self->_prefersUncroppedPhotos;
}

- (void)setPrefersUncroppedPhotos:(BOOL)a3
{
  self->_prefersUncroppedPhotos = a3;
}

- (BOOL)usePhotoReferencesIfAvailable
{
  return self->_usePhotoReferencesIfAvailable;
}

- (void)setUsePhotoReferencesIfAvailable:(BOOL)a3
{
  self->_usePhotoReferencesIfAvailable = a3;
}

- (BOOL)shouldSuppressRegulatoryLogging
{
  return self->_shouldSuppressRegulatoryLogging;
}

- (void)setShouldSuppressRegulatoryLogging:(BOOL)a3
{
  self->_shouldSuppressRegulatoryLogging = a3;
}

- (CGSize)maximumImageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_maximumImageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMaximumImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_maximumImageSize, &v3, 16, 1, 0);
}

- (unint64_t)maximumEncodingLength
{
  return self->_maximumEncodingLength;
}

- (void)setMaximumEncodingLength:(unint64_t)a3
{
  self->_maximumEncodingLength = a3;
}

- (unint64_t)maximumImageEncodingLength
{
  return self->_maximumImageEncodingLength;
}

- (void)setMaximumImageEncodingLength:(unint64_t)a3
{
  self->_maximumImageEncodingLength = a3;
}

- (NSArray)treatAsUnknownProperties
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTreatAsUnknownProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (unint64_t)outputVersion
{
  return self->_outputVersion;
}

- (void)setOutputVersion:(unint64_t)a3
{
  self->_outputVersion = a3;
}

- (NSArray)availableEncodings
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAvailableEncodings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableEncodings, 0);
  objc_storeStrong((id *)&self->_treatAsUnknownProperties, 0);
}

@end
