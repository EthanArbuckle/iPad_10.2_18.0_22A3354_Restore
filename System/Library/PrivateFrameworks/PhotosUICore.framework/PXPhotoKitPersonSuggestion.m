@implementation PXPhotoKitPersonSuggestion

- (PXPhotoKitPersonSuggestion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonSuggestion.m"), 45, CFSTR("%s is not available as initializer"), "-[PXPhotoKitPersonSuggestion init]");

  abort();
}

- (PXPhotoKitPersonSuggestion)initWithPerson:(id)a3 keyFaceFetchResult:(id)a4 keyAssetFetchResult:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXPhotoKitPersonSuggestion *v13;
  PXPhotoKitPersonSuggestion *v14;
  void *v15;
  uint64_t v16;
  NSString *localizedName;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonSuggestion.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitPersonSuggestion;
  v13 = -[PXPhotoKitPersonSuggestion init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_person, a3);
    objc_msgSend(v10, "px_localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    localizedName = v14->_localizedName;
    v14->_localizedName = (NSString *)v16;

    objc_storeStrong((id *)&v14->_keyFaceFetchResult, a4);
    objc_storeStrong((id *)&v14->_keyAssetFetchResult, a5);
    -[PXPhotoKitPersonSuggestion _prefetchLinkedContactInBackgroundForPerson:](v14, "_prefetchLinkedContactInBackgroundForPerson:", v10);
  }

  return v14;
}

- (id)personSuggestionUpdatedKeyFaceFetchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotoKitPersonSuggestion *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchAssetsForFaces:options:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = -[PXPhotoKitPersonSuggestion initWithPerson:keyFaceFetchResult:keyAssetFetchResult:]([PXPhotoKitPersonSuggestion alloc], "initWithPerson:keyFaceFetchResult:keyAssetFetchResult:", self->_person, v4, v8);

  return v9;
}

- (id)personSuggestionUpdatedKeyAssetFetchResult:(id)a3
{
  id v4;
  PXPhotoKitPersonSuggestion *v5;

  v4 = a3;
  v5 = -[PXPhotoKitPersonSuggestion initWithPerson:keyFaceFetchResult:keyAssetFetchResult:]([PXPhotoKitPersonSuggestion alloc], "initWithPerson:keyFaceFetchResult:keyAssetFetchResult:", self->_person, self->_keyFaceFetchResult, v4);

  return v5;
}

- (id)personSuggestionUpdatedPerson:(id)a3
{
  id v4;
  PXPhotoKitPersonSuggestion *v5;

  v4 = a3;
  v5 = -[PXPhotoKitPersonSuggestion initWithPerson:keyFaceFetchResult:keyAssetFetchResult:]([PXPhotoKitPersonSuggestion alloc], "initWithPerson:keyFaceFetchResult:keyAssetFetchResult:", v4, self->_keyFaceFetchResult, self->_keyAssetFetchResult);

  return v5;
}

- (void)setPrefetchedContact:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  _ContactFetchQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXPhotoKitPersonSuggestion_setPrefetchedContact___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)fetchContactAndBestTransport:(id)a3
{
  void (**v5)(id, uint64_t, uint64_t);
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = (void (**)(id, uint64_t, uint64_t))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonSuggestion.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__122018;
  v24 = __Block_byref_object_dispose__122019;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__122018;
  v18 = __Block_byref_object_dispose__122019;
  v19 = 0;
  -[PXPhotoKitPersonSuggestion person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ContactFetchQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PXPhotoKitPersonSuggestion_fetchContactAndBestTransport___block_invoke;
  block[3] = &unk_1E5129A88;
  block[4] = self;
  v8 = v6;
  v11 = v8;
  v12 = &v20;
  v13 = &v14;
  dispatch_sync(v7, block);

  v5[2](v5, v21[5], v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)matchesRecipientInRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotoKitPersonSuggestion person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "contact", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD16C0], "px_localizedNameFromContact:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v6, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_linkedContactForPerson:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C967C0];
  v10 = *MEMORY[0x1E0C966A8];
  v11 = v3;
  v4 = (void *)MEMORY[0x1E0C974D8];
  v5 = a3;
  objc_msgSend(v4, "descriptorForRequiredKeys", v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "linkedContactWithKeysToFetch:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_fetchQueue_fetchLinkedContactForPerson:(id)a3
{
  NSObject *v4;
  CNContact *fetchQueue_prefetchedContact;
  CNContact *v6;
  CNContact *fetchQueue_linkedContact;
  PXRecipientTransport *v8;
  PXRecipientTransport *fetchQueue_bestTransport;
  id v10;

  v10 = a3;
  _ContactFetchQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  fetchQueue_prefetchedContact = self->_fetchQueue_prefetchedContact;
  if (self->_fetchQueue_checkedForLinkedContact)
  {
    if (!fetchQueue_prefetchedContact)
      goto LABEL_8;
    self->_fetchQueue_checkedForLinkedContact = 1;
    goto LABEL_5;
  }
  self->_fetchQueue_checkedForLinkedContact = 1;
  if (fetchQueue_prefetchedContact)
  {
LABEL_5:
    v6 = fetchQueue_prefetchedContact;
    goto LABEL_6;
  }
  -[PXPhotoKitPersonSuggestion _linkedContactForPerson:](self, "_linkedContactForPerson:", v10);
  v6 = (CNContact *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  fetchQueue_linkedContact = self->_fetchQueue_linkedContact;
  self->_fetchQueue_linkedContact = v6;

  if (self->_fetchQueue_linkedContact)
  {
    +[PXRecipientTransportUtilities px_bestMessagingTransportForContact:](PXRecipientTransportUtilities, "px_bestMessagingTransportForContact:");
    v8 = (PXRecipientTransport *)objc_claimAutoreleasedReturnValue();
    fetchQueue_bestTransport = self->_fetchQueue_bestTransport;
    self->_fetchQueue_bestTransport = v8;

  }
LABEL_8:

}

- (void)_prefetchLinkedContactInBackgroundForPerson:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _ContactFetchQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PXPhotoKitPersonSuggestion__prefetchLinkedContactInBackgroundForPerson___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXPhotoKitPersonSuggestion person](self, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "person");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXPhotoKitPersonSuggestion person](self, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPhotoKitPersonSuggestion;
  -[PXPhotoKitPersonSuggestion description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" localized name: %@ person: %@, key face: %@, key asset: %@>"), self->_localizedName, self->_person, self->_keyFaceFetchResult, self->_keyAssetFetchResult);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (PHPerson)person
{
  return self->_person;
}

- (PHFetchResult)keyFaceFetchResult
{
  return self->_keyFaceFetchResult;
}

- (PHFetchResult)keyAssetFetchResult
{
  return self->_keyAssetFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_keyFaceFetchResult, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_fetchQueue_bestTransport, 0);
  objc_storeStrong((id *)&self->_fetchQueue_prefetchedContact, 0);
  objc_storeStrong((id *)&self->_fetchQueue_linkedContact, 0);
}

uint64_t __74__PXPhotoKitPersonSuggestion__prefetchLinkedContactInBackgroundForPerson___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchQueue_fetchLinkedContactForPerson:", *(_QWORD *)(a1 + 40));
}

void __59__PXPhotoKitPersonSuggestion_fetchContactAndBestTransport___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchQueue_fetchLinkedContactForPerson:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void __51__PXPhotoKitPersonSuggestion_setPrefetchedContact___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

+ (id)personSuggestionWithPerson:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CD1528];
  v4 = a3;
  objc_msgSend(v3, "fetchKeyFaceForPerson:options:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:keyFaceFetchResult:](PXPhotoKitPersonSuggestion, "personSuggestionWithPerson:keyFaceFetchResult:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)personSuggestionWithPerson:(id)a3 keyFaceFetchResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetsForFaces:options:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:keyFaceFetchResult:keyAssetFetchResult:](PXPhotoKitPersonSuggestion, "personSuggestionWithPerson:keyFaceFetchResult:keyAssetFetchResult:", v5, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)personSuggestionWithPerson:(id)a3 keyFaceFetchResult:(id)a4 keyAssetFetchResult:(id)a5
{
  id v7;
  id v8;
  id v9;
  PXPhotoKitPersonSuggestion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PXPhotoKitPersonSuggestion initWithPerson:keyFaceFetchResult:keyAssetFetchResult:]([PXPhotoKitPersonSuggestion alloc], "initWithPerson:keyFaceFetchResult:keyAssetFetchResult:", v9, v8, v7);

  return v10;
}

@end
