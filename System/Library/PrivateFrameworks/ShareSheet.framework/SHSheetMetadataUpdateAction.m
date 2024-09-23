@implementation SHSheetMetadataUpdateAction

- (SHSheetMetadataUpdateAction)initWithSerializedMetadata:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  SHSheetMetadataUpdateAction *v7;

  v4 = (objc_class *)MEMORY[0x1E0D22FF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v7 = -[SHSheetMetadataUpdateAction initWithInfo:responder:](self, "initWithInfo:responder:", v6, 0);
  return v7;
}

- (NSData)serializedMetadata
{
  void *v2;
  void *v3;

  -[SHSheetMetadataUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (LPLinkMetadata)metadata
{
  Class LPLinkMetadataClass_0;
  void *v4;
  void *v5;

  LPLinkMetadataClass_0 = getLPLinkMetadataClass_0();
  -[SHSheetMetadataUpdateAction serializedMetadata](self, "serializedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class metadataWithDataRepresentationForLocalUseOnly:](LPLinkMetadataClass_0, "metadataWithDataRepresentationForLocalUseOnly:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v5;
}

@end
