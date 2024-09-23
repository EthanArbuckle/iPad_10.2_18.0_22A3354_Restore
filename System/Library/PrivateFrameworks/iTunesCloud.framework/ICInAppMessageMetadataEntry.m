@implementation ICInAppMessageMetadataEntry

- (ICInAppMessageMetadataEntry)init
{
  ICInAppMessageMetadataEntry *v2;
  uint64_t v3;
  NSMutableDictionary *metadataValues;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICInAppMessageMetadataEntry;
  v2 = -[ICInAppMessageMetadataEntry init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    metadataValues = v2->_metadataValues;
    v2->_metadataValues = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageMetadataEntry.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICInAppMessageMetadataEntry_setMetadataValue_forKey___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(accessQueue, block);

}

- (id)metadataValueForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12759;
  v16 = __Block_byref_object_dispose__12760;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ICInAppMessageMetadataEntry_metadataValueForKey___block_invoke;
  block[3] = &unk_1E43907D8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allMetadataValues
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12759;
  v10 = __Block_byref_object_dispose__12760;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ICInAppMessageMetadataEntry_allMetadataValues__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (ICInAppMessageMetadataEntry)initWithCoder:(id)a3
{
  id v4;
  ICInAppMessageMetadataEntry *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *metadataValues;

  v4 = a3;
  v5 = -[ICInAppMessageMetadataEntry init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("metadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      v11 = objc_msgSend(v10, "mutableCopy");
      metadataValues = v5->_metadataValues;
      v5->_metadataValues = (NSMutableDictionary *)v11;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_metadataValues, CFSTR("metadata"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICInAppMessageMetadataEntry *v5;
  NSObject *accessQueue;
  _QWORD block[7];

  v5 = -[ICInAppMessageMetadataEntry init](+[ICInAppMessageMetadataEntry allocWithZone:](ICInAppMessageMetadataEntry, "allocWithZone:"), "init");
  if (v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__ICInAppMessageMetadataEntry_copyWithZone___block_invoke;
    block[3] = &unk_1E438C1C8;
    block[4] = v5;
    block[5] = self;
    block[6] = a3;
    dispatch_sync(accessQueue, block);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
}

void __44__ICInAppMessageMetadataEntry_copyWithZone___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1[5] + 8), "copyWithZone:", a1[6]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

void __48__ICInAppMessageMetadataEntry_allMetadataValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__ICInAppMessageMetadataEntry_metadataValueForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__ICInAppMessageMetadataEntry_setMetadataValue_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
