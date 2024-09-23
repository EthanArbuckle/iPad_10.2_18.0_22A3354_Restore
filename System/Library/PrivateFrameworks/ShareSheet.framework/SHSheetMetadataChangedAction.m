@implementation SHSheetMetadataChangedAction

- (SHSheetMetadataChangedAction)initWithSerializedMetadata:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  SHSheetMetadataChangedAction *v7;

  v4 = (objc_class *)MEMORY[0x1E0D22FF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 0);

  v7 = -[SHSheetMetadataChangedAction initWithInfo:responder:](self, "initWithInfo:responder:", v6, 0);
  return v7;
}

- (NSData)serializedMetadata
{
  void *v2;
  void *v3;

  -[SHSheetMetadataChangedAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (LPLinkMetadata)metadata
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getLPLinkMetadataClass_softClass_0;
  v12 = getLPLinkMetadataClass_softClass_0;
  if (!getLPLinkMetadataClass_softClass_0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getLPLinkMetadataClass_block_invoke_0;
    v8[3] = &unk_1E4001370;
    v8[4] = &v9;
    __getLPLinkMetadataClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  -[SHSheetMetadataChangedAction serializedMetadata](self, "serializedMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataWithDataRepresentationForLocalUseOnly:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v6;
}

@end
