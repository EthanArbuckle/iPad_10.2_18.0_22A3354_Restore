@implementation PXPeopleBootstrap

+ (CGSize)preferredBootstrapSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (void)performBootstrapWithSourcePerson:(id)a3 context:(id)a4 synchronous:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  SEL v41;
  id v42;
  _QWORD aBlock[4];
  id v44;
  id v45;
  uint64_t v46;
  SEL v47;
  id v48;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v11;
  objc_msgSend(v12, "setTargetPerson:", v14);
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "enableBootstrapDemoMode") & 1) != 0
    || objc_msgSend(v15, "useBootstrapMockDataSource"))
  {
LABEL_3:
    v16 = v14;
    if (v13)
    {
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
      v16 = v14;
    }
    goto LABEL_12;
  }
  objc_msgSend(v12, "delayedPersonBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v14;
  if (v17)
  {
    objc_msgSend(v12, "delayedPersonBlock");
    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v19[2]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_3;
    objc_msgSend(v12, "setTargetPerson:", v18);

  }
  v20 = objc_msgSend(v12, "bootstrapType");
  v32 = v7;
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke;
  aBlock[3] = &unk_1E51446F0;
  v22 = v18;
  v44 = v22;
  v23 = v12;
  v45 = v23;
  v46 = v20;
  v47 = a2;
  v48 = a1;
  v31 = _Block_copy(aBlock);
  objc_msgSend(v22, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v21;
  v36[1] = 3221225472;
  v36[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2;
  v36[3] = &unk_1E51403D0;
  v37 = v23;
  v16 = v22;
  v38 = v16;
  v25 = v24;
  v39 = v25;
  v41 = a2;
  v42 = a1;
  v40 = v13;
  v26 = _Block_copy(v36);
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))v26;
  if (v32)
  {
    v35 = 0;
    v28 = v31;
    v29 = objc_msgSend(v25, "performChangesAndWait:error:", v31, &v35);
    v30 = v35;
    ((void (**)(_QWORD, uint64_t, id))v27)[2](v27, v29, v30);
  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_149;
    v33[3] = &unk_1E51417E8;
    v34 = v26;
    v28 = v31;
    objc_msgSend(v25, "performChanges:completionHandler:", v31, v33);
    v30 = v34;
  }

LABEL_12:
}

+ (void)nameAndVerifyPerson:(id)a3 toContact:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v9 = a3;
  v10 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__PXPeopleBootstrap_nameAndVerifyPerson_toContact_photoLibrary_completionHandler___block_invoke;
  v13[3] = &unk_1E5148D08;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(a5, "performChanges:completionHandler:", v13, a6);

}

+ (void)nameAndVerifyPerson:(id)a3 toName:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v9 = a3;
  v10 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PXPeopleBootstrap_nameAndVerifyPerson_toName_photoLibrary_completionHandler___block_invoke;
  v13[3] = &unk_1E5148D08;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(a5, "performChanges:completionHandler:", v13, a6);

}

+ (void)_favoritePersonWithChangeRequest:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setType:", 1);
  objc_msgSend(v3, "setManualOrder:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 1));

}

+ (void)_unfavoritePersonWithChangeRequest:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setType:", 0);
  objc_msgSend(v3, "setManualOrder:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 0));

}

+ (BOOL)_namePerson:(id)a3 toContact:(id)a4 changeRequest:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities personWithPersonUri:](PXPeopleUtilities, "personWithPersonUri:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v24 = v13;
    objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_namePerson:toContact:withChangeRequest:", v16, v11, v17);
    v18 = objc_msgSend(v16, "isEqual:", v10);
    if ((v18 & 1) != 0)
    {
      objc_msgSend(a1, "_namePerson:toContact:withChangeRequest:", v10, v11, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_namePerson:toContact:withChangeRequest:", v16, v11, v23);
      objc_msgSend(v16, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPeopleUtilities personWithLocalIdentifier:](PXPeopleUtilities, "personWithLocalIdentifier:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v13 = v24;
      objc_msgSend(a1, "_mergePerson:context:toPerson:", v10, v24, v21);

      v16 = (void *)v21;
    }
    v19 = v18 ^ 1;

  }
  else
  {
    objc_msgSend(a1, "_namePerson:toContact:withChangeRequest:", v10, v11, v12);
    v19 = 0;
  }

  return v19;
}

+ (void)_namePerson:(id)a3 context:(id)a4 withChangeRequest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "nameSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "selectionType");
    switch(v12)
    {
      case 1:
        objc_msgSend(v11, "person");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_mergePerson:context:toPerson:", v18, v8, v16);

        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.naming.personChosen"), MEMORY[0x1E0C9AA70]);
        objc_msgSend(v18, "verifiedType");
        goto LABEL_16;
      case 2:
        objc_msgSend(v11, "contact");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[PXPeopleBootstrap _namePerson:toContact:changeRequest:context:](PXPeopleBootstrap, "_namePerson:toContact:changeRequest:context:", v18, v17, v9, v8);
        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.naming.contactChosen"), MEMORY[0x1E0C9AA70]);

        break;
      case 3:
        objc_msgSend(v11, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_namePerson:toString:withChangeRequest:", v18, v13, v9);

        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.naming.stringChosen"), MEMORY[0x1E0C9AA70]);
        v14 = v18;
        v15 = 0;
LABEL_12:
        if (!objc_msgSend(v14, "verifiedType") && !v15 && objc_msgSend(v8, "bootstrapType") == 1)
          objc_msgSend(v9, "setManualOrder:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 0));
        goto LABEL_16;
      default:
        v15 = 0;
        break;
    }
    v14 = v18;
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "wantsContactUnlinkage"))
  {
    objc_msgSend(v9, "setName:", &stru_1E5149688);
    objc_msgSend(v9, "setDisplayName:", &stru_1E5149688);
    objc_msgSend(v9, "setPersonUri:", &stru_1E5149688);
    objc_msgSend(v9, "setContactMatchingDictionary:", MEMORY[0x1E0C9AA70]);
  }
LABEL_16:

}

+ (void)_namePerson:(id)a3 toString:(id)a4 withChangeRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v12, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v7) & 1) != 0)
  {
    objc_msgSend(v12, "personUri");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(v8, "setName:", v7);
  objc_msgSend(v8, "setDisplayName:", v7);
  objc_msgSend(v8, "setPersonUri:", &stru_1E5149688);
  objc_msgSend(v8, "setContactMatchingDictionary:", MEMORY[0x1E0C9AA70]);
LABEL_6:

}

+ (void)_namePerson:(id)a3 toContact:(id)a4 withChangeRequest:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a5;
  objc_msgSend(v12, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CD16C0], "fullNameFromContact:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "displayNameFromContact:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71680], "matchingDictionaryForContact:contactStore:", v12, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContactMatchingDictionary:", v11);
    objc_msgSend(v6, "setPersonUri:", v7);
    objc_msgSend(v6, "setName:", v8);
    objc_msgSend(v6, "setDisplayName:", v9);

  }
}

+ (void)_mergePerson:(id)a3 context:(id)a4 toPerson:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7
    && v9
    && (objc_msgSend(v7, "isEqual:", v9) & 1) == 0
    && objc_msgSend(v7, "px_isSameDetectionTypeAsPerson:", v10))
  {
    v11 = objc_msgSend(v10, "type");
    v12 = objc_msgSend(v7, "type");
    if (v11 >= v12)
      v13 = v10;
    else
      v13 = v7;
    if (v11 >= v12)
      v14 = v7;
    else
      v14 = v10;
    v15 = v13;
    v16 = v14;
    v17 = (void *)MEMORY[0x1E0CD16D8];
    v22[0] = v16;
    v22[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "changeRequestForMergingPersons:nominalTargetIdentifier:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "targetPerson");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTargetPerson:", v21);

  }
}

void __79__PXPeopleBootstrap_nameAndVerifyPerson_toName_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "verifiedType") != 1)
    objc_msgSend(v2, "setVerifiedType:", 1);
  objc_msgSend(v2, "setName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setDisplayName:", *(_QWORD *)(a1 + 40));

}

void __82__PXPeopleBootstrap_nameAndVerifyPerson_toContact_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "verifiedType") != 1)
    objc_msgSend(v2, "setVerifiedType:", 1);
  +[PXPeopleBootstrap _namePerson:toContact:changeRequest:context:](PXPeopleBootstrap, "_namePerson:toContact:changeRequest:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v2, 0);

}

void __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __objc2_class **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __objc2_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "verifiedType") != 1)
    objc_msgSend(v2, "setVerifiedType:", 1);
  if ((objc_msgSend(*(id *)(a1 + 40), "skipInitialAction") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 != 2)
    {
      if (!v3)
      {
        +[PXPeopleBootstrap _favoritePersonWithChangeRequest:](PXPeopleBootstrap, "_favoritePersonWithChangeRequest:", v2);
        goto LABEL_9;
      }
      if (!objc_msgSend(*(id *)(a1 + 40), "wantsToBeAddedToPeopleAlbum"))
        goto LABEL_9;
    }
    +[PXPeopleBootstrap _addToPeopleAlbumWithChangeRequest:](PXPeopleBootstrap, "_addToPeopleAlbumWithChangeRequest:", v2);
  }
LABEL_9:
  if (!objc_msgSend(*(id *)(a1 + 40), "skipInitialAction") || *(_QWORD *)(a1 + 48) != 1)
    +[PXPeopleBootstrap _namePerson:context:withChangeRequest:](PXPeopleBootstrap, "_namePerson:context:withChangeRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(*(id *)(a1 + 40), "keyAsset");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = off_1E50B3000;
    v7 = *(_QWORD *)(a1 + 32);
    v28[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities facesForPerson:inAssets:](PXPeopleUtilities, "facesForPerson:inAssets:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_17:
      objc_msgSend(v2, "setKeyFace:", v10);

      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 40), "nameSelection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "person");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_16:
        v13 = v6[352];
        v27 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class facesForPerson:inAssets:](v13, "facesForPerson:inAssets:", v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(_QWORD *)(a1 + 64);
      v19 = (void *)v22;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("PXPeopleBootstrap.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.nameSelection.person"), v21, v26);

      v6 = off_1E50B3000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 64);
      v19 = (void *)v16;
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("PXPeopleBootstrap.m"), 101, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.nameSelection.person"), v21);
    }

    goto LABEL_16;
  }
LABEL_18:

}

void __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "targetPerson");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "suggestionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commitUserResponsesToPerson:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v6;
    objc_msgSend(*(id *)(a1 + 32), "setTargetPerson:", v10);

    objc_msgSend(*(id *)(a1 + 32), "targetPerson");
    v11 = objc_claimAutoreleasedReturnValue();

    +[PXPeopleUtilities temporarilySuppressBootstrapOrSuggestionForPerson:](PXPeopleUtilities, "temporarilySuppressBootstrapOrSuggestionForPerson:", v11);
    if (v11 != *(NSObject **)(a1 + 40))
      +[PXPeopleUtilities temporarilySuppressBootstrapOrSuggestionForPerson:](PXPeopleUtilities, "temporarilySuppressBootstrapOrSuggestionForPerson:");
    objc_msgSend(*(id *)(a1 + 48), "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIncludedDetectionTypes:", v13);

    v14 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchPersonsWithLocalIdentifiers:options:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "personSuggestion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 32), "personSuggestion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_10:
        objc_msgSend(v21, "personSuggestionUpdatedPerson:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setPersonSuggestion:", v22);

LABEL_11:
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 72);
      v32 = *(_QWORD *)(a1 + 64);
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v32, v30, CFSTR("PXPeopleBootstrap.m"), 128, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.personSuggestion"), v26, v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 72);
      v31 = *(_QWORD *)(a1 + 64);
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v31, v29, CFSTR("PXPeopleBootstrap.m"), 128, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.personSuggestion"), v26);
    }

    goto LABEL_10;
  }
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v5;
    v35 = 2080;
    v36 = "+[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:]_block_invoke_2";
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "People bootstrap change request error: %@ (%s)", buf, 0x16u);
  }
LABEL_14:

  v23 = *(_QWORD *)(a1 + 56);
  if (v23)
    (*(void (**)(uint64_t, uint64_t, id))(v23 + 16))(v23, a2, v5);

}

void __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_149(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2_150;
  block[3] = &unk_1E5146308;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __85__PXPeopleBootstrap_performBootstrapWithSourcePerson_context_synchronous_completion___block_invoke_2_150(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
