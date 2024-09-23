@implementation PLProjectAlbumJournalEntryPayload

+ (id)modelPropertiesDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PLProjectAlbumJournalEntryPayload;
  objc_msgSendSuper2(&v12, sel_modelPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v13[0] = CFSTR("projectDocumentType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("documentType"), 700, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v13[1] = CFSTR("projectData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("data"), 1000, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("projectExtensionIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("extensionIdentifier"), 700, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = CFSTR("projectRenderUuid");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("renderUuid"), 700, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v10);

  return v5;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PLProjectAlbumJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_31768 != -1)
    dispatch_once(&modelProperties_onceToken_31768, block);
  return (id)modelProperties_modelProperties_31769;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PLProjectAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_31766 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_31766, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_31767;
}

+ (id)payloadClassID
{
  return +[PLProjectAlbum entityName](PLProjectAlbum, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PLProjectAlbum validKindsForPersistence](PLProjectAlbum, "validKindsForPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

void __73__PLProjectAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_31767;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_31767 = v1;

}

uint64_t __52__PLProjectAlbumJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_31769;
  modelProperties_modelProperties_31769 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_31769, 0);
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableDictionary *payloadAttributes;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLProjectAlbumJournalEntryPayload;
  -[PLAlbumJournalEntryPayload updateAlbum:includePendingChanges:](&v13, sel_updateAlbum_includePendingChanges_, v6, v4);
  payloadAttributes = self->super.super.super._payloadAttributes;
  v8 = v6;
  -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", CFSTR("documentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProjectDocumentType:", v9);

  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super.super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProjectData:", v10);

  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super.super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("extensionIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProjectExtensionIdentifier:", v11);

  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super.super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("renderUuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProjectRenderUuid:", v12);

}

@end
