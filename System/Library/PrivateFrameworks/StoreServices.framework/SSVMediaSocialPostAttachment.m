@implementation SSVMediaSocialPostAttachment

- (int64_t)attachmentType
{
  return SSVMediaSocialAttachmentTypeForTypeIdentifier(self->_uti);
}

- (id)childAttachmentForRelationship:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_childAttachments, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)enumerateChildAttachmentsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *childAttachments;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[4];

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  childAttachments = self->_childAttachments;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SSVMediaSocialPostAttachment_enumerateChildAttachmentsUsingBlock___block_invoke;
  v7[3] = &unk_1E47BF478;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](childAttachments, "enumerateKeysAndObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

void __68__SSVMediaSocialPostAttachment_enumerateChildAttachmentsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)setChildAttachment:(id)a3 forRelationship:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSMutableDictionary *childAttachments;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  childAttachments = self->_childAttachments;
  if (v13)
  {
    if (!childAttachments)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_childAttachments;
      self->_childAttachments = v10;

      v7 = v13;
    }
    v12 = (void *)objc_msgSend(v7, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_childAttachments, "setObject:forKey:", v12, v8);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](childAttachments, "removeObjectForKey:", v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAlbumIdentifier:", self->_albumIdentifier);
  objc_msgSend(v5, "setArtists:", self->_artists);
  objc_msgSend(v5, "setAssetData:", self->_assetData);
  objc_msgSend(v5, "setAssetURL:", self->_assetURL);
  objc_msgSend(v5, "setAttachmentDescription:", self->_attachmentDescription);
  objc_msgSend(v5, "setCategoryName:", self->_categoryName);
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_childAttachments, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  objc_msgSend(v5, "setDeletesAssetWhenFinished:", self->_deletesAssetWhenFinished);
  objc_msgSend(v5, "setExplicitContent:", self->_explicitContent);
  objc_msgSend(v5, "setPreviewFrameTimestamp:", self->_previewFrameTimestamp);
  objc_msgSend(v5, "setSubtitle:", self->_subtitle);
  objc_msgSend(v5, "setTitle:", self->_title);
  objc_msgSend(v5, "setUTI:", self->_uti);
  return v5;
}

- (SSVMediaSocialPostAttachment)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  SSVMediaSocialPostAttachment *v8;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *artists;
  uint64_t v14;
  uint64_t v15;
  NSData *assetData;
  uint64_t v17;
  uint64_t v18;
  NSURL *assetURL;
  uint64_t v20;
  uint64_t v21;
  NSString *albumIdentifier;
  uint64_t v23;
  uint64_t v24;
  NSString *attachmentDescription;
  uint64_t v26;
  uint64_t v27;
  NSString *categoryName;
  uint64_t v29;
  uint64_t v30;
  NSString *subtitle;
  uint64_t v32;
  uint64_t v33;
  NSString *title;
  uint64_t v35;
  uint64_t v36;
  NSString *uti;
  uint64_t v38;
  void *v39;
  NSMutableDictionary *v40;
  NSMutableDictionary *childAttachments;
  _QWORD applier[4];
  SSVMediaSocialPostAttachment *v43;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = MEMORY[0x1A85863E4](v4), v7 = MEMORY[0x1E0C812F8], v6 == MEMORY[0x1E0C812F8]))
  {
    v8 = -[SSVMediaSocialPostAttachment init](self, "init");
    if (!v8)
      goto LABEL_5;
    xpc_dictionary_get_value(v5, "0");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = (NSArray *)SSXPCCreateNSArrayFromXPCEncodedArray(v10, v11);
    artists = v8->_artists;
    v8->_artists = v12;

    v14 = objc_opt_class();
    v15 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v14);
    assetData = v8->_assetData;
    v8->_assetData = (NSData *)v15;

    v17 = objc_opt_class();
    self = (SSVMediaSocialPostAttachment *)SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
    if (self)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", self);
      assetURL = v8->_assetURL;
      v8->_assetURL = (NSURL *)v18;

    }
    v20 = objc_opt_class();
    v21 = SSXPCDictionaryCopyObjectWithClass(v5, "C", v20);
    albumIdentifier = v8->_albumIdentifier;
    v8->_albumIdentifier = (NSString *)v21;

    v23 = objc_opt_class();
    v24 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v23);
    attachmentDescription = v8->_attachmentDescription;
    v8->_attachmentDescription = (NSString *)v24;

    v26 = objc_opt_class();
    v27 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v26);
    categoryName = v8->_categoryName;
    v8->_categoryName = (NSString *)v27;

    v8->_deletesAssetWhenFinished = xpc_dictionary_get_BOOL(v5, "9");
    v8->_explicitContent = xpc_dictionary_get_BOOL(v5, "5");
    v8->_previewFrameTimestamp = xpc_dictionary_get_double(v5, "B");
    v29 = objc_opt_class();
    v30 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v29);
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v30;

    v32 = objc_opt_class();
    v33 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v32);
    title = v8->_title;
    v8->_title = (NSString *)v33;

    v35 = objc_opt_class();
    v36 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v35);
    uti = v8->_uti;
    v8->_uti = (NSString *)v36;

    xpc_dictionary_get_value(v5, "A");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v38 && MEMORY[0x1A85863E4](v38) == v7)
    {
      v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      childAttachments = v8->_childAttachments;
      v8->_childAttachments = v40;

      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __52__SSVMediaSocialPostAttachment_initWithXPCEncoding___block_invoke;
      applier[3] = &unk_1E47BC440;
      v43 = v8;
      xpc_dictionary_apply(v39, applier);

    }
  }
  else
  {
    v8 = 0;
  }

LABEL_5:
  return v8;
}

uint64_t __52__SSVMediaSocialPostAttachment_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  SSVMediaSocialPostAttachment *v6;
  void *v7;

  v5 = a3;
  v6 = -[SSVMediaSocialPostAttachment initWithXPCEncoding:]([SSVMediaSocialPostAttachment alloc], "initWithXPCEncoding:", v5);

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v6, v7);

  }
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  NSMutableDictionary *childAttachments;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "C", self->_albumIdentifier);
  SSXPCDictionarySetObject(v3, "0", self->_artists);
  SSXPCDictionarySetObject(v3, "1", self->_assetData);
  -[NSURL absoluteString](self->_assetURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "2", v4);

  SSXPCDictionarySetObject(v3, "4", self->_attachmentDescription);
  SSXPCDictionarySetObject(v3, "3", self->_categoryName);
  xpc_dictionary_set_BOOL(v3, "9", self->_deletesAssetWhenFinished);
  xpc_dictionary_set_BOOL(v3, "5", self->_explicitContent);
  xpc_dictionary_set_double(v3, "B", self->_previewFrameTimestamp);
  SSXPCDictionarySetObject(v3, "6", self->_subtitle);
  SSXPCDictionarySetObject(v3, "7", self->_title);
  SSXPCDictionarySetObject(v3, "8", self->_uti);
  if (self->_childAttachments)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    childAttachments = self->_childAttachments;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__SSVMediaSocialPostAttachment_copyXPCEncoding__block_invoke;
    v9[3] = &unk_1E47BF4A0;
    v10 = v5;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](childAttachments, "enumerateKeysAndObjectsUsingBlock:", v9);
    xpc_dictionary_set_value(v3, "A", v7);

  }
  return v3;
}

void __47__SSVMediaSocialPostAttachment_copyXPCEncoding__block_invoke(uint64_t a1, id a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_retainAutorelease(a2);
  v6 = a3;
  SSXPCDictionarySetObject(v4, objc_msgSend(v5, "UTF8String"), v6);

}

- (NSString)albumIdentifier
{
  return self->_albumIdentifier;
}

- (void)setAlbumIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)artists
{
  return self->_artists;
}

- (void)setArtists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)assetData
{
  return self->_assetData;
}

- (void)setAssetData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)attachmentDescription
{
  return self->_attachmentDescription;
}

- (void)setAttachmentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (double)previewFrameTimestamp
{
  return self->_previewFrameTimestamp;
}

- (void)setPreviewFrameTimestamp:(double)a3
{
  self->_previewFrameTimestamp = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)UTI
{
  return self->_uti;
}

- (void)setUTI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)deletesAssetWhenFinished
{
  return self->_deletesAssetWhenFinished;
}

- (void)setDeletesAssetWhenFinished:(BOOL)a3
{
  self->_deletesAssetWhenFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_childAttachments, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_attachmentDescription, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_artists, 0);
  objc_storeStrong((id *)&self->_albumIdentifier, 0);
}

@end
