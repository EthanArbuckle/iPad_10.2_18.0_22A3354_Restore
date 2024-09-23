@implementation ICThumbnailConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
  objc_storeStrong((id *)&self->_uniqueKey, 0);
  objc_storeStrong((id *)&self->_associatedObjectTitle, 0);
  objc_storeStrong((id *)&self->_associatedObjectIdentifier, 0);
  objc_storeStrong(&self->_associatedObject, 0);
}

- (id)initForNoteListWithNote:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ICThumbnailConfiguration *v17;
  uint64_t v19;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 2, 0, v13, v14, v16, 1, width, height, a5, v11, 0, v19);

  return v17;
}

- (int64_t)thumbnailType
{
  return self->_thumbnailType;
}

- (NSString)associatedObjectIdentifier
{
  return self->_associatedObjectIdentifier;
}

- (ICThumbnailKey)uniqueKey
{
  return (ICThumbnailKey *)objc_getProperty(self, a2, 48, 1);
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (ICAppearanceInfo)appearanceInfo
{
  return self->_appearanceInfo;
}

- (id)initForAttachment:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICThumbnailConfiguration *v18;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  v18 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 0, 0, v13, v14, v17, 1, width, height, a5, v11, 0, v20);

  return v18;
}

- (BOOL)hasBorder
{
  return self->_hasBorder;
}

- (id)associatedObject
{
  return self->_associatedObject;
}

- (id)initForAvatarWithParticipants:(id)a3 preferredSize:(CGSize)a4 hasBorder:(BOOL)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  ICThumbnailConfiguration *v16;
  uint64_t v18;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  objc_msgSend(v9, "ic_map:", &__block_literal_global_21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("-"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = a5;
  v16 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 8, v10, v12, 0, 0, 1, width, height, v14, v15, 0, v18);

  return v16;
}

- (ICThumbnailConfiguration)initWithThumbnailType:(int64_t)a3 associatedObject:(id)a4 associatedObjectIdentifier:(id)a5 associatedObjectTitle:(id)a6 accountIdentifier:(id)a7 cacheLevel:(int64_t)a8 preferredSize:(CGSize)a9 scale:(double)a10 appearanceInfo:(id)a11 backgroundColor:(id)a12 hasBorder:(BOOL)a13
{
  double height;
  double width;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  ICThumbnailKey *v28;
  ICThumbnailConfiguration *v29;
  uint64_t v31;

  height = a9.height;
  width = a9.width;
  v22 = a12;
  v23 = a11;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a4;
  v28 = -[ICThumbnailKey initWithType:accountId:objectId:preferredSize:scale:appearance:]([ICThumbnailKey alloc], "initWithType:accountId:objectId:preferredSize:scale:appearance:", a3, v24, v26, objc_msgSend(v23, "type"), width, height, a10);
  LOBYTE(v31) = a13;
  v29 = -[ICThumbnailConfiguration initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", a3, v28, v27, v26, v25, v24, width, height, a10, a8, v23, v22, v31);

  return v29;
}

- (int64_t)cacheLevel
{
  return self->_cacheLevel;
}

- (ICThumbnailConfiguration)initWithThumbnailType:(int64_t)a3 uniqueKey:(id)a4 associatedObject:(id)a5 associatedObjectIdentifier:(id)a6 associatedObjectTitle:(id)a7 accountIdentifier:(id)a8 cacheLevel:(int64_t)a9 preferredSize:(CGSize)a10 scale:(double)a11 appearanceInfo:(id)a12 backgroundColor:(id)a13 hasBorder:(BOOL)a14
{
  CGFloat height;
  CGFloat width;
  id v23;
  id v24;
  ICThumbnailConfiguration *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  height = a10.height;
  width = a10.width;
  v23 = a4;
  v31 = a5;
  v30 = a6;
  v29 = a7;
  v28 = a12;
  v24 = a13;
  v32.receiver = self;
  v32.super_class = (Class)ICThumbnailConfiguration;
  v25 = -[ICThumbnailConfiguration init](&v32, sel_init);
  if (v25)
  {
    if (a11 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "scale > 0.0", "-[ICThumbnailConfiguration initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:]", 1, 0, CFSTR("Passing invalid scale to ICThumbnailConfiguration"));
      a11 = 1.0;
    }
    v25->_thumbnailType = a3;
    objc_storeStrong((id *)&v25->_uniqueKey, a4);
    objc_storeStrong(&v25->_associatedObject, a5);
    objc_storeStrong((id *)&v25->_associatedObjectIdentifier, a6);
    objc_storeStrong((id *)&v25->_associatedObjectTitle, a7);
    v25->_cacheLevel = a9;
    v25->_preferredSize.width = width;
    v25->_preferredSize.height = height;
    v25->_scale = a11;
    objc_storeStrong((id *)&v25->_appearanceInfo, a12);
    objc_storeStrong((id *)&v25->_backgroundColor, a13);
    v25->_hasBorder = a14;
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICThumbnailConfiguration setTraitCollection:](v25, "setTraitCollection:", v26);

  }
  return v25;
}

- (double)scale
{
  return self->_scale;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (id)initForNoteListWithFoundAttachment:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICThumbnailConfiguration *v18;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  v18 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 3, 0, v13, v14, v17, 1, width, height, a5, v11, 0, v20);

  return v18;
}

- (id)initForNoteGalleryWithNote:(id)a3 preferredSize:(CGSize)a4 traitCollection:(id)a5 scale:(double)a6 appearanceInfo:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ICThumbnailConfiguration *v20;
  uint64_t v22;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = 0;
  v20 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v16, v17, v19, 1, width, height, a6, v13, 0, v22);

  -[ICThumbnailConfiguration setTraitCollection:](v20, "setTraitCollection:", v14);
  return v20;
}

- (id)initForShortcutsWithNote:(id)a3 preferredSize:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  ICThumbnailConfiguration *v20;
  uint64_t v22;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3658];
  v18 = objc_msgSend(v12, "ic_hasLightBackground");

  objc_msgSend(v17, "ic_notePreviewBackgroundLightContent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = 0;
  v20 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v13, v14, v16, 1, width, height, a5, v11, v19, v22);

  return v20;
}

- (id)initForShareThumbnailWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  ICThumbnailConfiguration *v10;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__16;
  v34 = __Block_byref_object_dispose__16;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16;
  v28 = __Block_byref_object_dispose__16;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__ICThumbnailConfiguration_initForShareThumbnailWithNote_appearanceInfo___block_invoke;
  v13[3] = &unk_1E5C1EDA8;
  v15 = &v30;
  v9 = v6;
  v14 = v9;
  v16 = &v24;
  v17 = &v18;
  objc_msgSend(v8, "performBlockAndWait:", v13);

  LOBYTE(v12) = 0;
  v10 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 2, 0, v31[5], v25[5], v19[5], 1, 128.0, 128.0, 2.0, v7, 0, v12);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v10;
}

void __73__ICThumbnailConfiguration_initForShareThumbnailWithNote_appearanceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)initForSharePreviewThumbnailWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ICThumbnailConfiguration *v15;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3658];
  v13 = objc_msgSend(v7, "ic_hasLightBackground");

  objc_msgSend(v12, "ic_notePreviewBackgroundLightContent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = 0;
  v15 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v8, v9, v11, 1, 512.0, 512.0, 2.0, v6, v14, v17);

  return v15;
}

- (id)initForNoteNavigationBarIconWithNote:(id)a3 preferredSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  ICThumbnailConfiguration *v17;
  uint64_t v19;

  height = a4.height;
  width = a4.width;
  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = a3;
  objc_msgSend(v7, "ic_noteEditorBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0D639E8], "currentInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 1, 0, v10, v11, v13, 1, width, height, v15, v16, v9, v19);

  return v17;
}

- (id)initForSystemPaperChromeWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ICThumbnailConfiguration *v17;
  uint64_t v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0DC3658];
  v15 = objc_msgSend(v7, "ic_hasLightBackground");

  objc_msgSend(v14, "ic_notePreviewBackgroundLightContent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 4, 0, v8, v9, v11, 2, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v13, v6, v16, v19);

  return v17;
}

- (id)initForSystemPaperChromeLayerWithThumbnailType:(int64_t)a3 traitCollection:(id)a4
{
  id v6;
  ICThumbnailKey *v7;
  double v8;
  double v9;
  ICThumbnailKey *v10;
  _BOOL8 v11;
  double v12;
  double v13;
  void *v14;
  ICThumbnailConfiguration *v15;
  uint64_t v17;

  v6 = a4;
  v7 = [ICThumbnailKey alloc];
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v10 = -[ICThumbnailKey initWithType:accountId:objectId:preferredSize:traitCollection:](v7, "initWithType:accountId:objectId:preferredSize:traitCollection:", a3, 0, 0, v6, *MEMORY[0x1E0C9D820], v9);
  v11 = objc_msgSend(v6, "userInterfaceStyle") == 2;
  objc_msgSend(v6, "displayScale");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = 0;
  v15 = -[ICThumbnailConfiguration initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:uniqueKey:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", a3, v10, 0, 0, 0, 0, v8, v9, v13, 0, v14, 0, v17);

  -[ICThumbnailConfiguration setTraitCollection:](v15, "setTraitCollection:", v6);
  return v15;
}

- (id)initForLargeQuickNoteWidgetWithNote:(id)a3 appearanceInfo:(id)a4 traitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  ICThumbnailConfiguration *v16;
  uint64_t v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
  LOBYTE(v18) = 0;
  v16 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 10, 0, v11, v12, v14, 2, 350.0, 380.0, v15, v9, 0, v18);

  -[ICThumbnailConfiguration setTraitCollection:](v16, "setTraitCollection:", v8);
  return v16;
}

- (id)initForSmallQuickNoteWidgetWithNote:(id)a3 appearanceInfo:(id)a4 traitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  ICThumbnailConfiguration *v16;
  uint64_t v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
  LOBYTE(v18) = 0;
  v16 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 11, 0, v11, v12, v14, 2, 150.0, 162.0, v15, v9, 0, v18);

  -[ICThumbnailConfiguration setTraitCollection:](v16, "setTraitCollection:", v8);
  return v16;
}

- (id)initForSystemPaperPreviewWithNote:(id)a3 appearanceInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ICThumbnailConfiguration *v17;
  uint64_t v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0DC3658];
  v15 = objc_msgSend(v7, "ic_hasLightBackground");

  objc_msgSend(v14, "ic_notePreviewBackgroundLightContent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  v17 = -[ICThumbnailConfiguration initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:](self, "initWithThumbnailType:associatedObject:associatedObjectIdentifier:associatedObjectTitle:accountIdentifier:cacheLevel:preferredSize:scale:appearanceInfo:backgroundColor:hasBorder:", 7, 0, v8, v9, v11, 2, 110.0, 121.0, v13, v6, v16, v19);

  return v17;
}

uint64_t __82__ICThumbnailConfiguration_initForAvatarWithParticipants_preferredSize_hasBorder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C97200], "ic_contactFromParticipant:", a2);
}

id __82__ICThumbnailConfiguration_initForAvatarWithParticipants_preferredSize_hasBorder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v4;
  UITraitCollection *traitCollection;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ICThumbnailConfiguration_setTraitCollection___block_invoke;
  v6[3] = &unk_1E5C1EE50;
  v6[4] = self;
  objc_msgSend(a3, "traitCollectionByModifyingTraits:", v6);
  v4 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v4;

}

void __47__ICThumbnailConfiguration_setTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scale");
  objc_msgSend(v4, "setDisplayScale:");
  objc_msgSend(*(id *)(a1 + 32), "appearanceInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

}

- (void)performAsCurrentAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICThumbnailConfiguration traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAsCurrentTraitCollection:", v4);

}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[ICThumbnailConfiguration uniqueKey](self, "uniqueKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAssociatedObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)associatedObjectTitle
{
  return self->_associatedObjectTitle;
}

- (void)setAssociatedObjectTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setFallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
