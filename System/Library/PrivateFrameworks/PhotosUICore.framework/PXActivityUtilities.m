@implementation PXActivityUtilities

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken != -1)
    dispatch_once(&sharedWorkQueue_onceToken, &__block_literal_global_45288);
  return (id)sharedWorkQueue_sharedWorkQueue;
}

+ (void)requestMeContactWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C967C0];
  v10[0] = *MEMORY[0x1E0C966A8];
  v10[1] = v7;
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestMeContactForKeys:completionHandler:", v8, v5);

}

+ (void)requestMeContactForKeys:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(a1, "sharedWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke;
  block[3] = &unk_1E5148CE0;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

+ (void)_requestContactMatchingEmail:(id)a3 orPhone:(id)a4 withFirstName:(id)a5 lastName:(id)a6 keysToFetch:(id)a7 withCompletion:(id)a8
{
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void (**v18)(id, void *, id, void *);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  unint64_t v55;
  unint64_t v56;
  void (**v57)(id, void *, id, void *);
  void (**v58)(id, void *, id, void *);
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  char v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  id v85;
  __int16 v86;
  id v87;
  _QWORD v88[5];

  v88[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = (unint64_t)a5;
  v16 = (unint64_t)a6;
  v17 = a7;
  v18 = (void (**)(id, void *, id, void *))a8;
  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)*MEMORY[0x1E0C966A8];
  v22 = (void *)*MEMORY[0x1E0C967C0];
  v88[0] = *MEMORY[0x1E0C966A8];
  v88[1] = v22;
  v59 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v23);

  if (v15 | v16 && (v24 = objc_alloc_init(MEMORY[0x1E0C97218])) != 0)
  {
    v70 = v24;
    objc_msgSend(v24, "setStyle:", 0);
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v25);

    v69 = 0;
  }
  else
  {
    v70 = 0;
    v69 = 1;
  }
  v71 = v20;
  if (!objc_msgSend(v13, "length"))
  {
    v29 = 0;
    v31 = 0;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v13);
  v81 = 0;
  v65 = v19;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unifiedContactsMatchingPredicate:keysToFetch:error:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  if (!v26 && v67)
  {
    PLUIGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v13;
      v86 = 2112;
      v87 = v67;
      _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Error attempting to fetch all unified contacts matching predicate [email=%@] : %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v26, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v26, v15, v16, v70);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v53 = v17;
      v55 = v15;
      v29 = v21;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend(v28, "emailAddresses");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
      if (v31)
      {
        v49 = v16;
        v51 = v29;
        v57 = v18;
        v63 = v14;
        v32 = *(_QWORD *)v78;
        while (2)
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v78 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v34, "value");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", v13);

            if (v36)
            {
              objc_msgSend(v34, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
          }
          v31 = (void *)objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
          if (v31)
            continue;
          break;
        }
LABEL_25:
        v14 = v63;
        v16 = v49;
        v29 = v51;
        v18 = v57;
      }

      v17 = v53;
      v15 = v55;
    }
    else
    {
      v31 = 0;
      v29 = 0;
    }
  }
  else
  {
    v31 = 0;
    v29 = 0;
    v28 = 0;
  }

  v19 = v65;
  if (!v28)
  {
LABEL_29:
    if (!objc_msgSend(v14, "length"))
    {
      v28 = 0;
      goto LABEL_53;
    }
    v58 = v18;
    v64 = v14;
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v14);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v37);
    v76 = 0;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unifiedContactsMatchingPredicate:keysToFetch:error:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    if (!v38 && v68)
    {
      PLUIGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v85 = v64;
        v86 = 2112;
        v87 = v68;
        _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_ERROR, "Error attempting to fetch all unified contacts matching predicate [phone=%@] : %@", buf, 0x16u);
      }

    }
    v52 = v38;
    if (objc_msgSend(v38, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v38, v15, v16, v70);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v54 = v17;
        v56 = v15;
        v40 = v59;

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        objc_msgSend(v28, "phoneNumbers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        v14 = v64;
        if (v42)
        {
          v43 = v42;
          v60 = v40;
          v66 = v19;
          v50 = v16;
          v44 = *(_QWORD *)v73;
          while (2)
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v73 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
              objc_msgSend(v46, "value");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v47, "isLikePhoneNumber:", v37))
              {
                objc_msgSend(v46, "identifier");
                v48 = objc_claimAutoreleasedReturnValue();

                v31 = (void *)v48;
                goto LABEL_50;
              }

            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
            if (v43)
              continue;
            break;
          }
LABEL_50:
          v14 = v64;
          v19 = v66;
          v16 = v50;
          v40 = v60;
        }

        v29 = v40;
        v17 = v54;
        v15 = v56;
        goto LABEL_52;
      }
    }
    else
    {
      v28 = 0;
    }
    v14 = v64;
LABEL_52:

    v18 = v58;
  }
LABEL_53:
  if ((v69 & 1) == 0)

  if (v18)
    v18[2](v18, v28, v29, v31);

}

+ (void)requestImageFromPeopleAlbumForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 highQualityFormat:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  double height;
  double width;
  id v14;
  id v15;
  void *v16;
  PXPeopleFaceCropFetchOptions *v17;
  PXPeopleFaceCropFetchOptions *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  v16 = v15;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v14, width, height, a5);
  v18 = v17;
  if (v8)
    -[PXPeopleFaceCropFetchOptions setDeliveryMode:](v17, "setDeliveryMode:", 1);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __113__PXActivityUtilities_requestImageFromPeopleAlbumForPerson_targetSize_displayScale_highQualityFormat_completion___block_invoke;
  v23[3] = &unk_1E5147AB8;
  v24 = v16;
  v20 = v16;
  objc_msgSend(v19, "requestFaceCropForOptions:resultHandler:", v18, v23);

}

+ (void)_requestImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 deliverOnce:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  double height;
  double width;
  NSObject *v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  void (**v41)(_QWORD, _QWORD, _QWORD);
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  NSObject *v49;
  NSObject *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  NSObject *v54;
  void *v55;
  _QWORD v56[2];

  v9 = a7;
  v10 = a6;
  height = a4.height;
  width = a4.width;
  v56[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a8;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))v17;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v19 = *MEMORY[0x1E0C96890];
  if ((-[NSObject isKeyAvailable:](v16, "isKeyAvailable:", *MEMORY[0x1E0C96890]) & 1) == 0)
  {
    -[NSObject identifier](v16, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0C97210]);
    v56[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithKeysToFetch:", v22);

    v24 = (void *)MEMORY[0x1E0C97200];
    v55 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateForContactsWithIdentifiers:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPredicate:", v26);

    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__45275;
    v47 = __Block_byref_object_dispose__45276;
    v48 = 0;
    +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke;
    v42[3] = &unk_1E5138440;
    v42[4] = &v43;
    objc_msgSend(v27, "enumerateContactsWithFetchRequest:error:usingBlock:", v23, 0, v42);
    v28 = (void *)v44[5];
    if (v28)
    {
      v29 = v16;
      v16 = v28;
    }
    else
    {
      PLUIGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v52 = v20;
        v53 = 2112;
        v54 = v16;
        _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_ERROR, "Contact %{public}@ was missing thumbnail image data key, and refetching contact by identifier for that key returned nil. Attempting with original contact: %@", buf, 0x16u);
      }
    }

    _Block_object_dispose(&v43, 8);
  }
  v30 = objc_alloc(MEMORY[0x1E0C97450]);
  objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithSettings:", v31);

  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v10, 0, width, height, a5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v50 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "avatarImageForContacts:scope:", v34, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, _QWORD))v18)[2](v18, v35, MEMORY[0x1E0C9AAA0]);
  }
  else
  {
    v49 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_153;
    v40[3] = &unk_1E511CD48;
    v41 = v18;
    v37 = (id)objc_msgSend(v32, "renderAvatarsForContacts:scope:imageHandler:", v36, v33, v40);

    v35 = v41;
  }

}

+ (void)requestImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 deliverOnce:(BOOL)a7 completion:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  BOOL v31;
  BOOL v32;

  height = a4.height;
  width = a4.width;
  v16 = a3;
  v17 = a8;
  v18 = v17;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v18)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v17)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "sharedWorkQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke;
  block[3] = &unk_1E511CD70;
  v26 = v18;
  v27 = a1;
  v28 = width;
  v29 = height;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v25 = v16;
  v20 = v18;
  v21 = v16;
  dispatch_async(v19, block);

}

+ (void)requestMonogramForEmailAddress:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v14 = a7;
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress.length > 0"));

    if (v14)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_5;
LABEL_3:
  +[PXActivityUtilities requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:", v17, 0, v8, v14, width, height, a5);

}

+ (void)requestMonogramForGivenName:(id)a3 familyName:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6 isRTL:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD aBlock[4];
  id v30;

  v9 = a7;
  height = a5.height;
  width = a5.width;
  v16 = a4;
  v17 = a8;
  v18 = a3;
  if (!objc_msgSend(v18, "length") && !objc_msgSend(v16, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("givenName.length || familyName.length"));

    if (v17)
      goto LABEL_4;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_4;
  }
  if (!v17)
    goto LABEL_6;
LABEL_4:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXActivityUtilities_requestMonogramForGivenName_familyName_targetSize_displayScale_isRTL_completion___block_invoke;
  aBlock[3] = &unk_1E511CD48;
  v30 = v17;
  v19 = v17;
  v20 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v9, 0, width, height, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0C97450]);
  objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithSettings:", v23);

  objc_msgSend(a1, "_initialsFromGivenName:familyName:", v18, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (id)objc_msgSend(v24, "renderMonogramForString:scope:imageHandler:", v25, v21, v20);
}

+ (void)_requestPlaceholderMonogramWithTargetSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height;
  double width;
  objc_class *v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a3.height;
  width = a3.width;
  v8 = (objc_class *)MEMORY[0x1E0C97450];
  v9 = (void (**)(id, void *))a5;
  v10 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v10, "initWithSettings:", v11);

  objc_msgSend(v14, "placeholderImageProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageForSize:scale:style:", 0, width, height, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v13);
}

+ (void)requestPersonImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 matchingEmail:(id)a6 orPhone:(id)a7 withFirstName:(id)a8 lastName:(id)a9 prefersPhotosImage:(BOOL)a10 withCompletion:(id)a11
{
  CGFloat height;
  CGFloat width;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  BOOL v43;
  BOOL v44;

  height = a3.height;
  width = a3.width;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a11;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXActivityUtilities.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(a1, "sharedWorkQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke;
  block[3] = &unk_1E511CDC0;
  v34 = v21;
  v35 = v22;
  v36 = v23;
  v37 = v24;
  v43 = a10;
  v40 = width;
  v41 = height;
  v42 = a4;
  v38 = v25;
  v39 = a1;
  v44 = a5;
  v27 = v25;
  v28 = v24;
  v29 = v23;
  v30 = v22;
  v31 = v21;
  dispatch_async(v26, block);

}

+ (id)textForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PXFeedDateFormatter defaultFeedSectionDateFormatter](PXFeedDateFormatter, "defaultFeedSectionDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_initialsFromGivenName:(id)a3 familyName:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  v5 = _initialsFromGivenName_familyName__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&_initialsFromGivenName_familyName__onceToken, &__block_literal_global_164_45244);
  v8 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v8, "setGivenName:", v7);

  objc_msgSend(v8, "setFamilyName:", v6);
  objc_msgSend((id)_initialsFromGivenName_familyName__formatter, "stringFromPersonNameComponents:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v9, "length"))
    v10 = v9;
  else
    v10 = &stru_1E5149688;
  v11 = v10;

  return v11;
}

uint64_t __57__PXActivityUtilities__initialsFromGivenName_familyName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  v1 = (void *)_initialsFromGivenName_familyName__formatter;
  _initialsFromGivenName_familyName__formatter = (uint64_t)v0;

  return objc_msgSend((id)_initialsFromGivenName_familyName__formatter, "setStyle:", 4);
}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  char v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C972A8], "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v18[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v9 = *(_OWORD *)(a1 + 64);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = *(_QWORD *)(a1 + 96);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_2;
  v10[3] = &unk_1E511CD98;
  v16 = *(_BYTE *)(a1 + 104);
  v8 = (id)v9;
  v13 = v9;
  v17 = *(_BYTE *)(a1 + 105);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  +[PXActivityUtilities _requestContactMatchingEmail:orPhone:withFirstName:lastName:keysToFetch:withCompletion:](PXActivityUtilities, "_requestContactMatchingEmail:orPhone:withFirstName:lastName:keysToFetch:withCompletion:", v3, v4, v5, v6, v7, v10);

}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities personWithPersonUri:](PXPeopleUtilities, "personWithPersonUri:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && *(_BYTE *)(a1 + 88))
    {
      objc_msgSend(*(id *)(a1 + 56), "requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:", v6, 1, *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    }
    else
    {
      v7 = *(double *)(a1 + 80);
      v8 = *(unsigned __int8 *)(a1 + 89);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_3;
      v21[3] = &unk_1E5147A90;
      v9 = *(void **)(a1 + 56);
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v9, "_requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v4, v8, 0, v21, *(double *)(a1 + 64), *(double *)(a1 + 72), v7);

    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "length") || objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(double *)(a1 + 80);
    v13 = *(unsigned __int8 *)(a1 + 89);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_5;
    v19[3] = &unk_1E5147A90;
    v14 = *(void **)(a1 + 56);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v14, "requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:", v10, v11, v13, v19, *(double *)(a1 + 64), *(double *)(a1 + 72), v12);
    v6 = v20;
  }
  else
  {
    v15 = *(double *)(a1 + 80);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_6;
    v17[3] = &unk_1E511CD48;
    v16 = *(void **)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v16, "_requestPlaceholderMonogramWithTargetSize:displayScale:completion:", v17, *(double *)(a1 + 64), *(double *)(a1 + 72), v15);
    v6 = v18;
  }

}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v6 = v8;
  v7 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AAB0], 0, *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
}

uint64_t __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))(a1[6] + 16))(a1[6], a1[4], a1[5], 0, *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
}

void __103__PXActivityUtilities_requestMonogramForGivenName_familyName_targetSize_displayScale_isRTL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __103__PXActivityUtilities_requestMonogramForGivenName_familyName_targetSize_displayScale_isRTL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(double *)(a1 + 72);
  v3 = *(unsigned __int8 *)(a1 + 80);
  v4 = *(unsigned __int8 *)(a1 + 81);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_2;
  v7[3] = &unk_1E5147A90;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "_requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v5, v3, v4, v7, *(double *)(a1 + 56), *(double *)(a1 + 64), v2);

}

void __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_3;
  block[3] = &unk_1E5145688;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__PXActivityUtilities_requestImageFromPeopleAlbumForPerson_targetSize_displayScale_highQualityFormat_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  v7 = v8;
  px_dispatch_on_main_queue();

}

void __113__PXActivityUtilities_requestImageFromPeopleAlbumForPerson_targetSize_displayScale_highQualityFormat_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v14, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8440);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, void *, double, double, double, double))(v2 + 16))(v2, v3, v12, v13, v5, v7, v9, v11);

}

void __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5145688;
  v6 = *(id *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v10 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __38__PXActivityUtilities_sharedWorkQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.activityUtilities.work", attr);
  v2 = (void *)sharedWorkQueue_sharedWorkQueue;
  sharedWorkQueue_sharedWorkQueue = (uint64_t)v1;

}

@end
