@implementation IMASticker

+ (double)screenScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BE15A60], "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerScreenScale");
  v4 = v3;

  return v4;
}

- (IMASticker)initWithFileURL:(id)a3 stickerName:(id)a4 accessibilityLabel:(id)a5 representations:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IMASticker *v14;
  uint64_t v15;
  NSURL *fileURL;
  uint64_t v17;
  NSString *stickerName;
  uint64_t v19;
  NSString *accessibilityLabel;
  uint64_t v21;
  NSArray *representations;
  NSString *externalURI;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IMASticker;
  v14 = -[IMASticker init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    fileURL = v14->_fileURL;
    v14->_fileURL = (NSURL *)v15;

    v17 = objc_msgSend(v11, "copy");
    stickerName = v14->_stickerName;
    v14->_stickerName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    accessibilityLabel = v14->_accessibilityLabel;
    v14->_accessibilityLabel = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    representations = v14->_representations;
    v14->_representations = (NSArray *)v21;

    externalURI = v14->_externalURI;
    v14->_externalURI = 0;

  }
  return v14;
}

- (IMASticker)initWithStickerIdentifier:(id)a3 fileURL:(id)a4 representations:(id)a5 effectType:(id)a6 externalURI:(id)a7 stickerName:(id)a8 accessibilityLabel:(id)a9 metadata:(id)a10 ckAttributionInfo:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  IMASticker *v26;
  uint64_t v27;
  NSString *stickerIdentifier;
  uint64_t v29;
  NSURL *fileURL;
  uint64_t v31;
  NSArray *representations;
  uint64_t v33;
  NSNumber *stickerEffectType;
  uint64_t v35;
  NSString *stickerName;
  uint64_t v37;
  NSString *externalURI;
  uint64_t v39;
  NSString *accessibilityLabel;
  uint64_t v41;
  NSData *metadata;
  uint64_t v43;
  NSDictionary *ckAttributionInfo;
  objc_super v46;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v46.receiver = self;
  v46.super_class = (Class)IMASticker;
  v26 = -[IMASticker init](&v46, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v17, "copy");
    stickerIdentifier = v26->_stickerIdentifier;
    v26->_stickerIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    fileURL = v26->_fileURL;
    v26->_fileURL = (NSURL *)v29;

    v31 = objc_msgSend(v19, "copy");
    representations = v26->_representations;
    v26->_representations = (NSArray *)v31;

    v33 = objc_msgSend(v20, "copy");
    stickerEffectType = v26->_stickerEffectType;
    v26->_stickerEffectType = (NSNumber *)v33;

    v35 = objc_msgSend(v22, "copy");
    stickerName = v26->_stickerName;
    v26->_stickerName = (NSString *)v35;

    v37 = objc_msgSend(v21, "copy");
    externalURI = v26->_externalURI;
    v26->_externalURI = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    accessibilityLabel = v26->_accessibilityLabel;
    v26->_accessibilityLabel = (NSString *)v39;

    v41 = objc_msgSend(v24, "copy");
    metadata = v26->_metadata;
    v26->_metadata = (NSData *)v41;

    v43 = objc_msgSend(v25, "copy");
    ckAttributionInfo = v26->_ckAttributionInfo;
    v26->_ckAttributionInfo = (NSDictionary *)v43;

  }
  return v26;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (NSString)stickerIdentifier
{
  return self->_stickerIdentifier;
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (NSNumber)stickerEffectType
{
  return self->_stickerEffectType;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (NSDictionary)ckAttributionInfo
{
  return self->_ckAttributionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAttributionInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_stickerEffectType, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
