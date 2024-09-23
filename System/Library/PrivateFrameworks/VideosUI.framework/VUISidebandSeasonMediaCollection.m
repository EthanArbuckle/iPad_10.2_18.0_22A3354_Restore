@implementation VUISidebandSeasonMediaCollection

- (VUISidebandSeasonMediaCollection)initWithMediaLibrary:(id)a3 seasonManagedObject:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUISidebandMediaEntityIdentifier *v11;
  void *v12;
  void *v13;
  VUISidebandMediaEntityIdentifier *v14;
  void *v15;
  VUISidebandSeasonMediaCollection *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("seasonManagedObject"));
    if (v10)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requestedProperties"));
LABEL_4:
  v11 = [VUISidebandMediaEntityIdentifier alloc];
  objc_msgSend(v9, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUISidebandMediaEntityIdentifier initWithManagedObjectID:mediaEntityType:](v11, "initWithManagedObjectID:mediaEntityType:", v12, v13);

  VUISidebandSeasonMediaCollectionKind();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)VUISidebandSeasonMediaCollection;
  v16 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v18, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v8, v14, v10, v15);

  if (v16)
    objc_storeStrong((id *)&v16->_seasonManagedObject, a4);

  return v16;
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

  -[VUISidebandSeasonMediaCollection seasonManagedObject](self, "seasonManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__VUISidebandSeasonMediaCollection_canonicalID__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __47__VUISidebandSeasonMediaCollection_canonicalID__block_invoke(uint64_t a1)
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

- (id)colorCapability
{
  return &unk_1EA0B9340;
}

- (id)HLSColorCapability
{
  return &unk_1EA0B9340;
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

  -[VUISidebandSeasonMediaCollection seasonManagedObject](self, "seasonManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = (id)MEMORY[0x1E0C9AAA0];
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__VUISidebandSeasonMediaCollection_isLocal__block_invoke;
  v7[3] = &unk_1E9F99348;
  v4 = v2;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUISidebandSeasonMediaCollection_isLocal__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "episodes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "downloadState") == 2)
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v8 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AAB0];

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)showIdentifier
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

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  -[VUISidebandSeasonMediaCollection seasonManagedObject](self, "seasonManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__VUISidebandSeasonMediaCollection_showIdentifier__block_invoke;
  v7[3] = &unk_1E9F99348;
  v4 = v2;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __50__VUISidebandSeasonMediaCollection_showIdentifier__block_invoke(uint64_t a1)
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

  -[VUISidebandSeasonMediaCollection seasonManagedObject](self, "seasonManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__VUISidebandSeasonMediaCollection_seasonNumber__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __48__VUISidebandSeasonMediaCollection_seasonNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "seasonNumber");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)title
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

  -[VUISidebandSeasonMediaCollection seasonManagedObject](self, "seasonManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__VUISidebandSeasonMediaCollection_title__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __41__VUISidebandSeasonMediaCollection_title__block_invoke(uint64_t a1)
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

- (VUITVSeasonManagedObject)seasonManagedObject
{
  return self->_seasonManagedObject;
}

- (void)setSeasonManagedObject:(id)a3
{
  objc_storeStrong((id *)&self->_seasonManagedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seasonManagedObject, 0);
}

@end
