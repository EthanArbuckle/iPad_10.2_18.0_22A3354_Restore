@implementation VUIMediaAPIRequestFactory

+ (id)familyMembersRequest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  objc_msgSend(v2, "appendString:", CFSTR("me/purchases/shared/members"));
  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_URLRequestWithURLString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)recentPurchasesRequestWithOwnerIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  objc_msgSend(v4, "appendString:", CFSTR("me/purchases"));
  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  v23[0] = CFSTR("movies");
  v23[1] = CFSTR("tv-episodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  +[VUIMediaAPIRequestFactory _URLParameterForSort:](VUIMediaAPIRequestFactory, "_URLParameterForSort:", CFSTR("mostRecent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v9);

  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForLimit:](VUIMediaAPIRequestFactory, "_URLParameterForLimit:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v14);

  if (v3)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v16);

  }
  v22[0] = CFSTR("personalizedOffers");
  v22[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v19);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)moviesPurchasesRequestWithOwnerIdentifier:(id)a3 sortType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  objc_msgSend(v6, "appendString:", CFSTR("me/purchases"));
  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  v29[0] = CFSTR("movies");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v9);

  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v11);

  v12 = CFSTR("name");
  if (a4 == 3)
    v12 = CFSTR("mostRecent");
  if (a4 == 1)
    v13 = CFSTR("artistName");
  else
    v13 = v12;
  +[VUIMediaAPIRequestFactory _URLParameterForSort:](VUIMediaAPIRequestFactory, "_URLParameterForSort:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForLimit:](VUIMediaAPIRequestFactory, "_URLParameterForLimit:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v18);

  if (v5)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v20);

  }
  +[VUIMediaAPIRequestFactory _URLParameterForIncludeType:includeRelationship:](VUIMediaAPIRequestFactory, "_URLParameterForIncludeType:includeRelationship:", CFSTR("include[movies]"), CFSTR("playback-position"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v22);

  v28[0] = CFSTR("personalizedOffers");
  v28[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v25);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)seasonsRequestWithShowIdentifier:(id)a3 withOwnerIdentifier:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB37A0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  +[VUIMediaAPIRequestFactory _purchasesEpisodesEndpoint](VUIMediaAPIRequestFactory, "_purchasesEpisodesEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v10);

  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v11);

  +[VUIMediaAPIRequestFactory _URLParameterFilterWithShowIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterFilterWithShowIdentifier:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForLimit:](VUIMediaAPIRequestFactory, "_URLParameterForLimit:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v16);

  if (v5)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v18);

  }
  +[VUIMediaAPIRequestFactory _URLParameterForInclude:](VUIMediaAPIRequestFactory, "_URLParameterForInclude:", CFSTR("seasons"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v20);

  v26[0] = CFSTR("personalizedOffers");
  v26[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v23);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)episodesRequestWithShowIdentifier:(id)a3 withOwnerIdentifier:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB37A0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  +[VUIMediaAPIRequestFactory _purchasesEpisodesEndpoint](VUIMediaAPIRequestFactory, "_purchasesEpisodesEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v10);

  v32[0] = CFSTR("tv-episodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v12);

  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v14);

  +[VUIMediaAPIRequestFactory _URLParameterFilterWithShowIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterFilterWithShowIdentifier:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForLimit:](VUIMediaAPIRequestFactory, "_URLParameterForLimit:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v19);

  if (v5)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v21);

  }
  +[VUIMediaAPIRequestFactory _URLParameterForInclude:](VUIMediaAPIRequestFactory, "_URLParameterForInclude:", CFSTR("seasons"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v23);

  +[VUIMediaAPIRequestFactory _URLParameterForIncludeType:includeRelationship:](VUIMediaAPIRequestFactory, "_URLParameterForIncludeType:includeRelationship:", CFSTR("include[tv-episodes]"), CFSTR("playback-position"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v25);

  v31[0] = CFSTR("personalizedOffers");
  v31[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v28);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)showsPurchasesRequestWithOwnerIdentifier:(id)a3 sortType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  objc_msgSend(v6, "appendString:", CFSTR("me/purchases"));
  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  v27[0] = CFSTR("tv-episodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v9);

  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v11);

  v12 = CFSTR("artistName");
  if (a4 == 3)
    v12 = CFSTR("mostRecent");
  if (a4 == 2)
    v13 = CFSTR("name");
  else
    v13 = v12;
  +[VUIMediaAPIRequestFactory _URLParameterForSort:](VUIMediaAPIRequestFactory, "_URLParameterForSort:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForLimit:](VUIMediaAPIRequestFactory, "_URLParameterForLimit:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v18);

  if (v5)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v20);

  }
  v26[0] = CFSTR("personalizedOffers");
  v26[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v23);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)genresRequestForVUIFamilySharingGenre:(id)a3 withOwnerIdentifier:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB37A0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  objc_msgSend(v8, "appendString:", CFSTR("me/purchases"));
  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  v27[0] = CFSTR("movies");
  v27[1] = CFSTR("tv-episodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v11);

  +[VUIMediaAPIRequestFactory _URLParameterWithGenreFilter:](VUIMediaAPIRequestFactory, "_URLParameterWithGenreFilter:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v13);

  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForLimit:](VUIMediaAPIRequestFactory, "_URLParameterForLimit:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v18);

  if (v5)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v20);

  }
  v26[0] = CFSTR("personalizedOffers");
  v26[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v23);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)genresRequestForVUIFamilySharingGenreIDsFilter:(id)a3 withOwnerIdentifier:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB37A0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  objc_msgSend(v8, "appendString:", CFSTR("me/purchases"));
  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  v27[0] = CFSTR("movies");
  v27[1] = CFSTR("tv-episodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v11);

  +[VUIMediaAPIRequestFactory _URLParameterWithGenreIDsFilter:](VUIMediaAPIRequestFactory, "_URLParameterWithGenreIDsFilter:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v13);

  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForLimit:](VUIMediaAPIRequestFactory, "_URLParameterForLimit:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v18);

  if (v5)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v20);

  }
  v26[0] = CFSTR("personalizedOffers");
  v26[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v23);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)genresRequestWithOwnerIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("https://amp-api.videos.apple.com/v1/"));
  objc_msgSend(v4, "appendString:", CFSTR("me/purchases/genres"));
  +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters](VUIMediaAPIRequestFactory, "_URLParameterForAdditionalParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  v20[0] = CFSTR("movies");
  v20[1] = CFSTR("tv-episodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  +[VUIMediaAPIRequestFactory _URLParameterForSort:](VUIMediaAPIRequestFactory, "_URLParameterForSort:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v9);

  if (v3)
  {
    +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "_URLParameterWithOwnerIdentifier:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v11);

  }
  +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases](VUIMediaAPIRequestFactory, "_URLParameterWithSharedPurchases");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v13);

  v19[0] = CFSTR("personalizedOffers");
  v19[1] = CFSTR("iTunesExtrasUrl");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLParameterForExtend:](VUIMediaAPIRequestFactory, "_URLParameterForExtend:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:](VUIMediaAPIRequestFactory, "_URLAddAdditionalParameter:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v16);

  +[VUIMediaAPIRequestFactory _URLRequestWithURLString:](VUIMediaAPIRequestFactory, "_URLRequestWithURLString:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)_addTypeFilterToURL:(id *)a3 forRequest:(id)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  id *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v20 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v4;
  objc_msgSend(v4, "mediaEntityTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        +[VUIMediaEntityType movie](VUIMediaEntityType, "movie", v20);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v12)
        {

LABEL_12:
          v17 = CFSTR("movies");
          goto LABEL_13;
        }
        v13 = (void *)v12;
        +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v14)
          goto LABEL_12;
        +[VUIMediaEntityType season](VUIMediaEntityType, "season");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v15)
        {
          v17 = CFSTR("tv-seasons");
        }
        else
        {
          +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != v16)
            goto LABEL_14;
          v17 = CFSTR("tv-episodes");
        }
LABEL_13:
        objc_msgSend(v5, "addObject:", v17);
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v8 = v18;
    }
    while (v18);
  }

  +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:](VUIMediaAPIRequestFactory, "_URLParameterTypeFilterWithTypes:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v20, "appendString:", v19);

}

+ (id)_URLParameterTypeFilterWithTypes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("movies")))
        {
          v11 = CFSTR("movies");
          if (objc_msgSend(v4, "length"))
            goto LABEL_8;
          goto LABEL_9;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("tv-seasons")))
        {
          v11 = CFSTR("tv-seasons");
          if (objc_msgSend(v4, "length"))
            goto LABEL_8;
          goto LABEL_9;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("tv-episodes")))
        {
          v11 = CFSTR("tv-episodes");
          if (!objc_msgSend(v4, "length"))
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v4, "appendString:", CFSTR(","));
LABEL_9:
          objc_msgSend(v4, "appendString:", v11);
        }
        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v7 = v12;
    }
    while (v12);
  }

  v13 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("types"), v4, (_QWORD)v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

  v16 = (void *)objc_msgSend(v15, "copy");
  return v16;
}

+ (id)_URLParameterWithOwnerIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("filter[owner]"), a3);
}

+ (id)_URLParameterFilterWithShowIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("filter[tvShowId]"), a3);
}

+ (id)_URLParameterWithGenreFilter:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "genreIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_msgSend(v4, "isEqualToString:", &stru_1E9FF3598) & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(","));
        objc_msgSend(v4, "appendString:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  +[VUIMediaAPIRequestFactory _URLParameterWithGenreIDsFilter:](VUIMediaAPIRequestFactory, "_URLParameterWithGenreIDsFilter:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_URLParameterWithGenreIDsFilter:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("filter[genres]"), a3);
}

+ (id)_URLParameterWithSharedPurchases
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("with"), CFSTR("sharedPurchases"));
}

+ (id)_URLParameterForSort:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sort"), a3);
}

+ (id)_URLParameterForLimit:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%d"), CFSTR("limit"), objc_msgSend(a3, "intValue"));
}

+ (id)_URLParameterForInclude:(id)a3
{
  return +[VUIMediaAPIRequestFactory _URLParameterForIncludeType:includeRelationship:](VUIMediaAPIRequestFactory, "_URLParameterForIncludeType:includeRelationship:", CFSTR("include"), a3);
}

+ (id)_URLParameterForIncludeType:(id)a3 includeRelationship:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), a3, a4);
}

+ (id)_URLParameterForExtend:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("extend"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_URLParameterForAdditionalParameters
{
  return CFSTR("?");
}

+ (id)_URLAddAdditionalParameter:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&%@"), a3);
}

+ (id)_purchasesEpisodesEndpoint
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("me/purchases"), CFSTR("tv-episodes"));
}

@end
