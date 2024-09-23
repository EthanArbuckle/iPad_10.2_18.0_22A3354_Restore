@implementation VUISidebandMediaItem

- (VUISidebandMediaItem)initWithMediaLibrary:(id)a3 videoManagedObject:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  VUISidebandMediaEntityIdentifier *v14;
  void *v15;
  VUISidebandMediaEntityIdentifier *v16;
  void *v17;
  VUISidebandMediaItem *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("videoManagedObject"));
  if (!v10)
LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requestedProperties"));
LABEL_5:
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  v11 = v13;
LABEL_10:
  v14 = [VUISidebandMediaEntityIdentifier alloc];
  objc_msgSend(v9, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VUISidebandMediaEntityIdentifier initWithManagedObjectID:mediaEntityType:](v14, "initWithManagedObjectID:mediaEntityType:", v15, v11);

  VUISidebandMediaItemKind();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)VUISidebandMediaItem;
  v18 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v22, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v8, v16, v10, v17);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_videoManagedObject, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideoManagedObject objectID](v18->_videoManagedObject, "objectID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v18, sel__videoManagedObjectPlaybackExpirationWillChange_, CFSTR("VUIVideoManagedObjectPlaybackExpirationWillChangeNotification"), v20);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUISidebandMediaItem;
  -[VUISidebandMediaItem dealloc](&v4, sel_dealloc);
}

- (id)assetType
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__29;
  v19 = __Block_byref_object_dispose__29;
  v20 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __33__VUISidebandMediaItem_assetType__block_invoke;
  v12 = &unk_1E9F99D88;
  v14 = &v15;
  v4 = v2;
  v13 = v4;
  objc_msgSend(v3, "performBlockAndWait:", &v9);

  v5 = (void *)v16[5];
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToNumber:", &unk_1EA0BA138, v9, v10, v11, v12))
      v6 = 8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __33__VUISidebandMediaItem_assetType__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entitlementType");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isFamilySharingContent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__29;
  v18 = __Block_byref_object_dispose__29;
  v19 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __46__VUISidebandMediaItem_isFamilySharingContent__block_invoke;
  v11 = &unk_1E9F99D88;
  v13 = &v14;
  v4 = v2;
  v12 = v4;
  objc_msgSend(v3, "performBlockAndWait:", &v8);

  v5 = (void *)v15[5];
  if (v5)
    v6 = objc_msgSend(v5, "isEqualToNumber:", &unk_1EA0BA138, v8, v9, v10, v11);
  else
    v6 = 0;

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __46__VUISidebandMediaItem_isFamilySharingContent__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entitlementType");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)canonicalID
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__VUISidebandMediaItem_canonicalID__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __35__VUISidebandMediaItem_canonicalID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "canonicalID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)markedAsDeleted
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__VUISidebandMediaItem_markedAsDeleted__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v8 = &v9;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  LOBYTE(v3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v3;
}

uint64_t __39__VUISidebandMediaItem_markedAsDeleted__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "markedAsDeleted");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)title
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  v16 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__VUISidebandMediaItem_title__block_invoke;
  v8[3] = &unk_1E9F99D88;
  v10 = &v11;
  v4 = v2;
  v9 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v8);

  v5 = (void *)v12[5];
  if (!v5)
  {
    v12[5] = (uint64_t)&stru_1E9FF3598;

    v5 = (void *)v12[5];
  }
  v6 = v5;

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __29__VUISidebandMediaItem_title__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)duration
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__VUISidebandMediaItem_duration__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __32__VUISidebandMediaItem_duration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "duration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)genreTitle
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  __CFString *v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = &stru_1E9FF3598;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__VUISidebandMediaItem_genreTitle__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __34__VUISidebandMediaItem_genreTitle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "genreName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)addedDate
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__VUISidebandMediaItem_addedDate__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __33__VUISidebandMediaItem_addedDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dateAdded");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)releaseDate
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__VUISidebandMediaItem_releaseDate__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __35__VUISidebandMediaItem_releaseDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "releaseDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)storeID
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__VUISidebandMediaItem_storeID__block_invoke;
  v7[3] = &unk_1E9F99348;
  v4 = v2;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __31__VUISidebandMediaItem_storeID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "adamID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)colorCapability
{
  return &unk_1EA0BA150;
}

- (id)HLSColorCapability
{
  return &unk_1EA0BA150;
}

- (id)isLocal
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = (id)MEMORY[0x1E0C9AAA0];
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__VUISidebandMediaItem_isLocal__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __31__VUISidebandMediaItem_isLocal__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "downloadState") == 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)isPlayable
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (id)showTitle
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__29;
  v18 = __Block_byref_object_dispose__29;
  v19 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__VUISidebandMediaItem_showTitle__block_invoke;
    v11[3] = &unk_1E9F99D88;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v11);

  }
  v8 = (void *)v15[5];
  if (!v8)
  {
    v15[5] = (uint64_t)&stru_1E9FF3598;

    v8 = (void *)v15[5];
  }
  v9 = v8;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __33__VUISidebandMediaItem_showTitle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "series");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)showIdentifier
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__VUISidebandMediaItem_showIdentifier__block_invoke;
    v10[3] = &unk_1E9F99348;
    v7 = v5;
    v11 = v7;
    v12 = &v13;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__VUISidebandMediaItem_showIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  VUISidebandMediaEntityIdentifier *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "series");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v3 = [VUISidebandMediaEntityIdentifier alloc];
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VUISidebandMediaEntityIdentifier initWithManagedObjectID:mediaEntityType:](v3, "initWithManagedObjectID:mediaEntityType:", v8, v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)seasonNumber
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__VUISidebandMediaItem_seasonNumber__block_invoke;
    v10[3] = &unk_1E9F99D88;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __36__VUISidebandMediaItem_seasonNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "season");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seasonNumber");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)seasonTitle
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35__VUISidebandMediaItem_seasonTitle__block_invoke;
    v10[3] = &unk_1E9F99D88;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __35__VUISidebandMediaItem_seasonTitle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "season");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)seasonIdentifier
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__VUISidebandMediaItem_seasonIdentifier__block_invoke;
    v10[3] = &unk_1E9F99348;
    v7 = v5;
    v11 = v7;
    v12 = &v13;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __40__VUISidebandMediaItem_seasonIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  VUISidebandMediaEntityIdentifier *v5;
  void *v6;
  VUISidebandMediaEntityIdentifier *v7;
  id v8;
  VUISidebandMediaEntityIdentifier *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "season");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "series");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v5 = [VUISidebandMediaEntityIdentifier alloc];
    +[VUIMediaEntityType season](VUIMediaEntityType, "season");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v13;
LABEL_5:
    v10 = -[VUISidebandMediaEntityIdentifier initWithManagedObjectID:mediaEntityType:](v7, "initWithManagedObjectID:mediaEntityType:", v8, v6);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    goto LABEL_6;
  }
  if (v4)
  {
    v9 = [VUISidebandMediaEntityIdentifier alloc];
    +[VUIMediaEntityType season](VUIMediaEntityType, "season");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v8 = v4;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)seasonCanonicalID
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__VUISidebandMediaItem_seasonCanonicalID__block_invoke;
    v10[3] = &unk_1E9F99D88;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__VUISidebandMediaItem_seasonCanonicalID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "season");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)showCanonicalID
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__VUISidebandMediaItem_showCanonicalID__block_invoke;
    v10[3] = &unk_1E9F99D88;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __39__VUISidebandMediaItem_showCanonicalID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "series");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)episodeNumber
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__VUISidebandMediaItem_episodeNumber__block_invoke;
    v10[3] = &unk_1E9F99D88;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __37__VUISidebandMediaItem_episodeNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "episodeNumberInSeason");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)fractionalEpisodeNumber
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__VUISidebandMediaItem_fractionalEpisodeNumber__block_invoke;
    v10[3] = &unk_1E9F99D88;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__VUISidebandMediaItem_fractionalEpisodeNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fractionalEpisodeNumberInSeason");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)episodeIndexInSeries
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__VUISidebandMediaItem_episodeIndexInSeries__block_invoke;
    v10[3] = &unk_1E9F99D88;
    v12 = &v13;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __44__VUISidebandMediaItem_episodeIndexInSeries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "episodeNumberInSeries");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)downloadExpirationDate
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__VUISidebandMediaItem_downloadExpirationDate__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __46__VUISidebandMediaItem_downloadExpirationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "expirationDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)availabilityEndDate
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__VUISidebandMediaItem_availabilityEndDate__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUISidebandMediaItem_availabilityEndDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "availabilityEndDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)allowsManualDownloadRenewal
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VUISidebandMediaItem_allowsManualDownloadRenewal__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v8 = &v9;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  LOBYTE(v3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v3;
}

uint64_t __51__VUISidebandMediaItem_allowsManualDownloadRenewal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allowsManualRenewal");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)renewsOfflineKeysAutomatically
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__VUISidebandMediaItem_renewsOfflineKeysAutomatically__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v8 = &v9;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  LOBYTE(v3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v3;
}

void __54__VUISidebandMediaItem_renewsOfflineKeysAutomatically__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "offlineKeyRenewalPolicy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "integerValue") == 1;

}

- (id)brandID
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__VUISidebandMediaItem_brandID__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __31__VUISidebandMediaItem_brandID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "brandID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)brandName
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__VUISidebandMediaItem_brandName__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __33__VUISidebandMediaItem_brandName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "brandName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (VUIMediaEntityAssetController)assetController
{
  VUIMediaEntityAssetController *assetController;
  VUIUniversalAssetController *v4;
  void *v5;
  VUIMediaEntityAssetController *v6;
  VUIMediaEntityAssetController *v7;

  assetController = self->_assetController;
  if (!assetController)
  {
    v4 = [VUIUniversalAssetController alloc];
    -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIUniversalAssetController initWithVideoManagedObject:](v4, "initWithVideoManagedObject:", v5);
    v7 = self->_assetController;
    self->_assetController = v6;

    assetController = self->_assetController;
  }
  return assetController;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  VUISidebandMediaEntityImageLoadParams *v5;
  void *v6;
  VUISidebandMediaEntityImageLoadParams *v7;

  v5 = [VUISidebandMediaEntityImageLoadParams alloc];
  -[VUISidebandMediaItem videoManagedObject](self, "videoManagedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUISidebandMediaEntityImageLoadParams initWithVideoManagedObject:imageType:](v5, "initWithVideoManagedObject:imageType:", v6, a3);

  return v7;
}

- (void)_videoManagedObjectPlaybackExpirationWillChange:(id)a3
{
  -[VUIMediaEntity setLocalChanges:](self, "setLocalChanges:", 1);
}

- (VUIVideoManagedObject)videoManagedObject
{
  return self->_videoManagedObject;
}

- (void)setVideoManagedObject:(id)a3
{
  objc_storeStrong((id *)&self->_videoManagedObject, a3);
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
}

@end
