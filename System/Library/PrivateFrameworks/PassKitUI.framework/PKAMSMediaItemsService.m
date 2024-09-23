@implementation PKAMSMediaItemsService

- (PKAMSMediaItemsService)init
{
  PKAMSMediaItemsService *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  AMSBag *bag;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAMSMediaItemsService;
  v2 = -[PKAMSMediaItemsService init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CFD9E8];
    objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfileVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bagForProfile:profileVersion:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    bag = v2->_bag;
    v2->_bag = (AMSBag *)v6;

  }
  return v2;
}

- (id)fetchItemsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PKAMSPromiseWrapper *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PKAMSPromiseWrapper *v27;
  PKAMSPromiseWrapper *v28;
  id v29;
  void *v30;
  BOOL v32;
  void *v33;
  _QWORD v34[4];
  PKAMSPromiseWrapper *v35;
  id v36;
  id v37;
  unint64_t v38;
  BOOL v39;
  BOOL v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v20 = 0;
    goto LABEL_21;
  }
  v33 = v7;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v10;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Looking up item(s) from AppleMediaServices with request: %@.", buf, 0xCu);

  }
  v11 = objc_msgSend(v6, "type");
  if (v11 == 1)
    v12 = 202;
  else
    v12 = 200;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "artworkConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 != 0;
  v16 = objc_msgSend(v14, "animatedArtworkType");
  v32 = v16 != 0;
  if (v11 == 2)
    v17 = 205;
  else
    v17 = v12;
  if (v11 < 2)
    goto LABEL_13;
  if (v11 == 2)
  {
    objc_msgSend(v13, "addObject:", CFSTR("artistBio"));
LABEL_13:
    objc_msgSend(v6, "musicRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "musicIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v13, "addObject:", CFSTR("editorialVideo"));
    v15 = v14 != 0;
    goto LABEL_18;
  }
  v19 = 0;
LABEL_18:
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB48]), "initWithType:clientIdentifier:clientVersion:bag:", v17, CFSTR("com.apple.Passbook"), CFSTR("1"), self->_bag);
  v22 = v21;
  if (v19)
    objc_msgSend(v21, "setItemIdentifiers:", v19);
  v41 = CFSTR("extend");
  v23 = v13;
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAdditionalQueryParams:", v25);

  objc_msgSend(v22, "perform");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PKAMSPromiseWrapper initWithAMSPromise:]([PKAMSPromiseWrapper alloc], "initWithAMSPromise:", v26);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke;
  v34[3] = &unk_1E3E7A480;
  v28 = v27;
  v39 = v15;
  v35 = v28;
  v36 = v14;
  v40 = v32;
  v38 = v11;
  v8 = v33;
  v37 = v33;
  v29 = v14;
  objc_msgSend(v26, "addFinishBlock:", v34);
  v30 = v37;
  v20 = v28;

LABEL_21:
  return v20;
}

void __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  char v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v42 = v6;
  v43 = v5;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v65 = (uint64_t)v8;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Received error: %@.", buf, 0xCu);

    }
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "responseDataItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v65 = v10;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Received %ld results from AppleMediaServices", buf, 0xCu);
    }
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  v15 = MEMORY[0x1E0C809B0];
  v46 = v14;
  if (v14)
  {
    v45 = *(_QWORD *)v60;
    v44 = a1;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v60 != v45)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v16);
        if (v17)
        {
          v18 = v17;
          v19 = PKIsPad();
          v20 = CFSTR("ios");
          if (v19)
            v20 = CFSTR("ipados");
          v21 = v20;
          objc_msgSend(v18, "PKDictionaryForKey:", CFSTR("attributes"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_opt_class();
          objc_msgSend(v22, "PKDictionaryOfKeyClass:valueClass:ForKey:", v23, objc_opt_class(), CFSTR("platformAttributes"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v26, "mutableCopy");

            if (v27)
              goto LABEL_18;
            objc_msgSend(v25, "allValues");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "firstObject");
            v29 = v11;
            v30 = v13;
            v31 = v12;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v32, "mutableCopy");

            v12 = v31;
            v13 = v30;
            v11 = v29;
            a1 = v44;

            if (v27)
            {
LABEL_18:
              objc_msgSend(v27, "addEntriesFromDictionary:", v22);
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB00]), "initWithLookupDictionary:", v27);

            }
            else
            {
              v33 = 0;
            }
            v15 = MEMORY[0x1E0C809B0];
          }
          else if (v22)
          {
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB00]), "initWithLookupDictionary:", v22);
          }
          else
          {
            v33 = 0;
          }

        }
        else
        {
          v33 = 0;
        }
        v52[0] = v15;
        v52[1] = 3221225472;
        v52[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_91;
        v52[3] = &unk_1E3E7A430;
        v53 = v33;
        v57 = *(_BYTE *)(a1 + 64);
        v34 = *(id *)(a1 + 40);
        v58 = *(_BYTE *)(a1 + 65);
        v35 = *(_QWORD *)(a1 + 56);
        v54 = v34;
        v56 = v35;
        v55 = v11;
        v36 = v33;
        objc_msgSend(v12, "addOperation:", v52);

        ++v16;
      }
      while (v46 != v16);
      v37 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      v46 = v37;
    }
    while (v37);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    v50[0] = v15;
    v50[1] = 3221225472;
    v50[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_2;
    v50[3] = &unk_1E3E67120;
    v51 = v11;
    objc_msgSend(v12, "addOperation:", v50);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v15;
  v47[1] = 3221225472;
  v47[2] = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_4;
  v47[3] = &unk_1E3E7A458;
  v39 = *(id *)(a1 + 48);
  v48 = v11;
  v49 = v39;
  v40 = v11;
  v41 = (id)objc_msgSend(v12, "evaluateWithInput:completion:", v38, v47);

}

void __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_91(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  PKAMSMediaLookupItemMusic *v32;
  PKAMSMediaLookupItemMusic *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  PKAMSMediaLookupItemMusic *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = *(void **)(a1 + 32);
  if (v11)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v11, "artwork");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "artworkSize");
    v15 = (uint64_t)v14;
    v17 = (uint64_t)v16;
    v18 = objc_msgSend(*(id *)(a1 + 40), "cropType");
    if (v18 <= 7)
      v4 = **((id **)&unk_1E3E7A4C8 + v18);
    objc_msgSend(v13, "URLWithHeight:width:cropStyle:format:", v15, v17, v4, *MEMORY[0x1E0CFD880]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(*(id *)(a1 + 32), "itemDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("editorialVideo"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(*(id *)(a1 + 40), "animatedArtworkType") - 1;
      if (v22 > 3)
        v23 = 0;
      else
        v23 = off_1E3E7A508[v22];
      objc_msgSend(v21, "objectForKeyedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("video"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }
    if (*(_QWORD *)(a1 + 56) > 2uLL)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "itemDictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("curatorName"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "itemDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("playlistType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = v30;
      if (objc_msgSend(v30, "isEqualToString:", CFSTR("editorial")))
        v31 = objc_msgSend(v28, "containsString:", CFSTR("Apple Music"));
      else
        v31 = 0;
      v63 = v19;
      v33 = [PKAMSMediaLookupItemMusic alloc];
      v58 = *(_QWORD *)(a1 + 56);
      v59 = v33;
      objc_msgSend(*(id *)(a1 + 32), "displayName");
      v60 = v9;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(void **)(a1 + 32);
      if (v34)
      {
        v54 = v31;
        v55 = v28;
        v56 = v13;
        v57 = v8;
        v35 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v34, "itemDictionary");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD8A0]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD8A8]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
          if (v35 != 2
            || (objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("artistBio")),
                (v38 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("editorialNotes"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("short"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v40;
            if (v40)
            {
              v42 = v40;
            }
            else
            {
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("standardNote"));
              v42 = (id)objc_claimAutoreleasedReturnValue();
            }
            v38 = v42;

          }
        }
        v44 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v38, "dataUsingEncoding:", 4);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = *MEMORY[0x1E0DC1148];
        v47 = *MEMORY[0x1E0DC1110];
        v64[0] = *MEMORY[0x1E0DC1118];
        v64[1] = v47;
        v65[0] = v46;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v65[1] = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
        v49 = v36;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v44, "initWithData:options:documentAttributes:error:", v45, v50, 0, 0);
        objc_msgSend(v51, "string");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = *(void **)(a1 + 32);
        v13 = v56;
        v8 = v57;
        v28 = v55;
        v31 = v54;
      }
      else
      {
        v43 = 0;
      }
      objc_msgSend(v34, "productPageURL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v53) = v31;
      v32 = -[PKAMSMediaLookupItemMusic initWithType:artwork:animatedArtworkURL:displayName:itemDescription:musicURL:appleCurated:](v59, "initWithType:artwork:animatedArtworkURL:displayName:itemDescription:musicURL:appleCurated:", v58, 0, v24, v61, v43, v52, v53);

      v19 = v63;
      -[PKAMSMediaLookupItemMusic setArtworkURL:](v32, "setArtworkURL:", v63);

      v9 = v60;
    }
    objc_msgSend(*(id *)(a1 + 48), "safelyAddObject:", v32);

  }
  v10[2](v10, v9, 0);

}

void __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_3;
  v28 = &unk_1E3E618A0;
  v24 = v7;
  v30 = v24;
  v23 = v6;
  v29 = v23;
  v9 = v8;
  v22 = &v25;
  v10 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v16, "type", v22, v23, v24, v25, v26, v27, v28, v29, v30) > 2)
        {
          v19 = 0;
          v18 = 0;
        }
        else
        {
          objc_msgSend(v16, "musicItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "artworkURL");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "animatedArtworkURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = ___PopulateArtworkForItems_block_invoke;
            v33[3] = &unk_1E3E65A40;
            v18 = v18;
            v34 = v18;
            v35 = v16;
            objc_msgSend(v10, "addOperation:", v33);

          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = ___PopulateArtworkForItems_block_invoke_2_144;
  v31[3] = &unk_1E3E66078;
  v32 = v22;
  objc_msgSend(v10, "evaluateWithInput:completion:", v20, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

}

uint64_t __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __59__PKAMSMediaItemsService_fetchItemsWithRequest_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;

  if ((objc_msgSend(a4, "isCanceled") & 1) != 0)
    v5 = 0;
  else
    v5 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
