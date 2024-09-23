@implementation VUISidebandSeriesMediaCollection

- (VUISidebandSeriesMediaCollection)initWithMediaLibrary:(id)a3 seriesManagedObject:(id)a4 requestedProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUISidebandMediaEntityIdentifier *v11;
  void *v12;
  void *v13;
  VUISidebandMediaEntityIdentifier *v14;
  void *v15;
  VUISidebandSeriesMediaCollection *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("seriesManagedObject"));
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
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUISidebandMediaEntityIdentifier initWithManagedObjectID:mediaEntityType:](v11, "initWithManagedObjectID:mediaEntityType:", v12, v13);

  VUISidebandSeriesMediaCollectionKind();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)VUISidebandSeriesMediaCollection;
  v16 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v18, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v8, v14, v10, v15);

  if (v16)
    objc_storeStrong((id *)&v16->_seriesManagedObject, a4);

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

  -[VUISidebandSeriesMediaCollection seriesManagedObject](self, "seriesManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__VUISidebandSeriesMediaCollection_canonicalID__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __47__VUISidebandSeriesMediaCollection_canonicalID__block_invoke(uint64_t a1)
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
  return &unk_1EA0BAA98;
}

- (id)HLSColorCapability
{
  return &unk_1EA0BAA98;
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

  -[VUISidebandSeriesMediaCollection seriesManagedObject](self, "seriesManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  v15 = (id)MEMORY[0x1E0C9AAA0];
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__VUISidebandSeriesMediaCollection_isLocal__block_invoke;
  v7[3] = &unk_1E9F99348;
  v4 = v2;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUISidebandSeriesMediaCollection_isLocal__block_invoke(uint64_t a1)
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
  v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  v15 = 0;
  -[VUISidebandSeriesMediaCollection seriesManagedObject](self, "seriesManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__VUISidebandSeriesMediaCollection_showIdentifier__block_invoke;
  v7[3] = &unk_1E9F99348;
  v4 = v2;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __50__VUISidebandSeriesMediaCollection_showIdentifier__block_invoke(uint64_t a1)
{
  VUISidebandMediaEntityIdentifier *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v2 = [VUISidebandMediaEntityIdentifier alloc];
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[VUISidebandMediaEntityIdentifier initWithManagedObjectID:mediaEntityType:](v2, "initWithManagedObjectID:mediaEntityType:", v7, v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
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

  -[VUISidebandSeriesMediaCollection seriesManagedObject](self, "seriesManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  v15 = 0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__VUISidebandSeriesMediaCollection_title__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __41__VUISidebandSeriesMediaCollection_title__block_invoke(uint64_t a1)
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

- (id)seasonCount
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

  -[VUISidebandSeriesMediaCollection seriesManagedObject](self, "seriesManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  v15 = &unk_1EA0BAAB0;
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__VUISidebandSeriesMediaCollection_seasonCount__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __47__VUISidebandSeriesMediaCollection_seasonCount__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "seasons");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (VUITVSeriesManagedObject)seriesManagedObject
{
  return self->_seriesManagedObject;
}

- (void)setSeriesManagedObject:(id)a3
{
  objc_storeStrong((id *)&self->_seriesManagedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesManagedObject, 0);
}

@end
