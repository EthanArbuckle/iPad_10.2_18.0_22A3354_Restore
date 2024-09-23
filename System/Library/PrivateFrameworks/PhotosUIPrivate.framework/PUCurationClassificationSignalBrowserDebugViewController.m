@implementation PUCurationClassificationSignalBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  PUCurationClassificationSignalAssetBrowserDebugViewController *v4;
  void *v5;
  PUCurationClassificationSignalAssetBrowserDebugViewController *v6;
  PUCurationClassificationSignalAssetBrowserDebugViewController *assetCollectionViewController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUCurationClassificationSignalBrowserDebugViewController;
  -[PUCurationClassificationSignalBrowserDebugViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PUCurationClassificationSignalBrowserDebugViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUCurationClassificationSignalAssetBrowserDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  v6 = -[PUPhotosAlbumViewController initWithSpec:](v4, "initWithSpec:", v5);
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  -[PUCurationClassificationSignalBrowserDebugViewController _fetchSignals](self, "_fetchSignals");
}

- (void)_fetchSignals
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSArray *v11;
  NSArray *sectionNames;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  PUCurationClassificationSignalBrowserDebugViewController *v50;
  id v51;
  void *v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  void *context;
  uint64_t v57;
  NSDictionary **p_signalInfoBySignalIdentifier;
  void (**v59)(void *, void *, void *);
  void *v60;
  id v61;
  id v62;
  _QWORD block[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD aBlock[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _QWORD v80[4];

  v80[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoAnalysisClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v4, "requestSignalModelInfosWithError:", &v77);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v77;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke;
  v74[3] = &unk_1E58A26B0;
  v9 = v6;
  v75 = v9;
  v48 = v7;
  v76 = v48;
  v52 = v5;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v74);
  v49 = v9;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sectionNames = self->_sectionNames;
  self->_sectionNames = v11;

  objc_storeStrong((id *)&self->_signalIdentifiersBySectionName, v6);
  p_signalInfoBySignalIdentifier = &self->_signalInfoBySignalIdentifier;
  objc_storeStrong((id *)&self->_signalInfoBySignalIdentifier, v7);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = *MEMORY[0x1E0CD1A50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchPropertySets:", v15);

  objc_msgSend(v14, "setShouldPrefetchCount:", 1);
  objc_msgSend(v14, "setChunkSizeForFetch:", 500);
  v47 = v14;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = self;
  self->_numberOfAssets = objc_msgSend(v16, "count");
  v44 = (void *)MEMORY[0x1AF42B2C0]();
  aBlock[0] = v8;
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_2;
  aBlock[3] = &unk_1E58A26D8;
  v46 = v13;
  v45 = v13;
  v73 = v45;
  v59 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v16;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v69;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v69 != v54)
          objc_enumerationMutation(obj);
        v57 = v17;
        v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v17);
        context = (void *)MEMORY[0x1AF42B2C0]();
        objc_msgSend(v18, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sceneClassifications");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v61 = v19;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v65 != v22)
                objc_enumerationMutation(v61);
              v24 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              v25 = objc_msgSend(v24, "extendedSceneIdentifier");
              if ((v25 & 0xFF000000) == 0x7F000000)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "confidence");
                v28 = v27;
                v59[2](v59, v60, v26);
                objc_msgSend(v62, "objectForKeyedSubscript:", v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v29)
                {
                  v29 = (void *)objc_msgSend(&unk_1E59BA150, "mutableCopy");
                  objc_msgSend(v62, "setObject:forKeyedSubscript:", v29, v26);
                }
                -[NSDictionary objectForKeyedSubscript:](*p_signalInfoBySignalIdentifier, "objectForKeyedSubscript:", v26);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("highPrecisionOperatingPoint"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "doubleValue");
                v33 = v32;

                if (v28 >= v33)
                {
                  v40 = 0;
                }
                else
                {
                  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("operatingPoint"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "doubleValue");
                  v36 = v35;

                  if (v28 >= v36)
                  {
                    v40 = 1;
                  }
                  else
                  {
                    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("highRecallOperatingPoint"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "doubleValue");
                    v39 = v38;

                    if (v28 >= v39)
                      v40 = 2;
                    else
                      v40 = 3;
                  }
                }
                v41 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v29, "objectAtIndexedSubscript:", v40);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsignedIntegerValue") + 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setObject:atIndexedSubscript:", v43, v40);

              }
            }
            v21 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
          }
          while (v21);
        }

        objc_autoreleasePoolPop(context);
        v17 = v57 + 1;
      }
      while (v57 + 1 != v55);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    }
    while (v55);
  }

  objc_storeStrong((id *)&v50->_countsBySignalIdentifier, v62);
  objc_storeStrong((id *)&v50->_signalConfidenceByAssetUUIDBySignalIdentifier, v46);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_157;
  block[3] = &unk_1E58ABD10;
  block[4] = v50;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_autoreleasePoolPop(v44);
}

- (id)signalNameForUnknownSignalIdentifier:(int)a3
{
  if ((a3 & 0x7FFFFF00u) <= 0x7FFFFAFF)
    return CFSTR("Really Unknown");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E58A26F8[((a3 & 0x7FFFFF00u) - 2147482368) >> 8], *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)signalIdentifiersForSection:(int64_t)a3
{
  NSDictionary *signalIdentifiersBySectionName;
  void *v4;
  void *v5;

  signalIdentifiersBySectionName = self->_signalIdentifiersBySectionName;
  -[NSArray objectAtIndexedSubscript:](self->_sectionNames, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](signalIdentifiersBySectionName, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v5 = a4;
  -[PUCurationClassificationSignalBrowserDebugViewController signalIdentifiersForSection:](self, "signalIdentifiersForSection:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_signalConfidenceByAssetUUIDBySignalIdentifier, "objectForKeyedSubscript:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_signalInfoBySignalIdentifier, "objectForKeyedSubscript:", v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[PUCurationClassificationSignalBrowserDebugViewController signalNameForUnknownSignalIdentifier:](self, "signalNameForUnknownSignalIdentifier:", objc_msgSend(v25, "intValue"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[NSDictionary objectForKeyedSubscript:](self->_signalInfoBySignalIdentifier, "objectForKeyedSubscript:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("operatingPoint"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("highPrecisionOperatingPoint"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  if (v20 == v17)
    v20 = 1.0;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("highRecallOperatingPoint"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  -[PUCurationClassificationSignalAssetBrowserDebugViewController setSignalConfidenceByAssetUUID:withSignalName:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:](self->_assetCollectionViewController, "setSignalConfidenceByAssetUUID:withSignalName:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", v8, v13, v17, v20, v23);
  -[PUCurationClassificationSignalBrowserDebugViewController navigationController](self, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pushViewController:animated:", self->_assetCollectionViewController, 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 40.0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionNames, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_sectionNames, "objectAtIndexedSubscript:", a4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUCurationClassificationSignalBrowserDebugViewController signalIdentifiersForSection:](self, "signalIdentifiersForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PUCurationClassificationSignalBrowserDebugViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  unint64_t numberOfAssets;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v84;
  uint64_t v85;
  void *v86;
  PUCurationClassificationSignalBrowserDebugViewController *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ClassificationSignalBrowserDebugTableViewCellIdentifier"));
  v92 = (id)objc_claimAutoreleasedReturnValue();
  if (!v92)
  {
    v7 = -[PUCurationClassificationSignalBrowserDebugViewCell initWithStyle:reuseIdentifier:]([PUCurationClassificationSignalBrowserDebugViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("ClassificationSignalBrowserDebugTableViewCellIdentifier"));
    -[PUCurationClassificationSignalBrowserDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 1);

    v92 = v7;
    -[PUCurationClassificationSignalBrowserDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  -[PUCurationClassificationSignalBrowserDebugViewController signalIdentifiersForSection:](self, "signalIdentifiersForSection:", objc_msgSend(v6, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "item");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_signalInfoBySignalIdentifier, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    -[PUCurationClassificationSignalBrowserDebugViewController signalNameForUnknownSignalIdentifier:](self, "signalNameForUnknownSignalIdentifier:", objc_msgSend(v12, "intValue"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(v92, "setSignalName:", v17);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("operatingPoint"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("highPrecisionOperatingPoint"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("highRecallOperatingPoint"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  -[NSDictionary objectForKeyedSubscript:](self->_countsBySignalIdentifier, "objectForKeyedSubscript:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ("), v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithString:", v29);

  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" / "));
  v89 = v13;
  v90 = v12;
  v88 = v17;
  v91 = v27;
  if (v20 == v23 && v20 == v26)
  {
    v86 = (void *)v31;
    v32 = objc_alloc(MEMORY[0x1E0CB3498]);
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v34, "unsignedLongValue"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0DC1140];
    if (v20 == 0.0)
    {
      v37 = 0x1E0CB3000uLL;
      v97 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v32, "initWithString:attributes:", v35, v39);
      objc_msgSend(v30, "appendAttributedString:", v40);
      v41 = v86;
    }
    else
    {
      v95 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v73;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = (void *)objc_msgSend(v32, "initWithString:attributes:", v35, v74);
      objc_msgSend(v30, "appendAttributedString:", v75);

      objc_msgSend(v30, "appendAttributedString:", v86);
      v76 = objc_alloc(MEMORY[0x1E0CB3498]);
      v77 = (void *)MEMORY[0x1E0CB3940];
      numberOfAssets = self->_numberOfAssets;
      objc_msgSend(v91, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = numberOfAssets - objc_msgSend(v34, "unsignedLongValue");
      v79 = v77;
      v41 = v86;
      objc_msgSend(v79, "stringWithFormat:", CFSTR("%lu"), v84);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v36;
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v76;
      v37 = 0x1E0CB3000uLL;
      v40 = (void *)objc_msgSend(v80, "initWithString:attributes:", v35, v39);
      objc_msgSend(v30, "appendAttributedString:", v40);
    }
  }
  else
  {
    v42 = (void *)v31;
    v43 = objc_alloc(MEMORY[0x1E0CB3498]);
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v45, "unsignedLongValue"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = *MEMORY[0x1E0DC1140];
    v47 = v105;
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v87 = self;
    v48 = v27;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v43, "initWithString:attributes:", v46, v50);
    objc_msgSend(v30, "appendAttributedString:", v51);

    objc_msgSend(v30, "appendAttributedString:", v42);
    v52 = objc_alloc(MEMORY[0x1E0CB3498]);
    v53 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v48, "objectAtIndexedSubscript:", 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v54, "unsignedLongValue"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v47;
    v103 = v47;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v52, "initWithString:attributes:", v55, v57);
    objc_msgSend(v30, "appendAttributedString:", v58);

    objc_msgSend(v30, "appendAttributedString:", v42);
    v59 = objc_alloc(MEMORY[0x1E0CB3498]);
    v60 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v48, "objectAtIndexedSubscript:", 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v61, "unsignedLongValue"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v47;
    objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v63;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v59, "initWithString:attributes:", v62, v64);
    objc_msgSend(v30, "appendAttributedString:", v65);

    objc_msgSend(v30, "appendAttributedString:", v42);
    v66 = objc_alloc(MEMORY[0x1E0CB3498]);
    v67 = (void *)MEMORY[0x1E0CB3940];
    v68 = v87->_numberOfAssets;
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v34, "unsignedLongValue");
    objc_msgSend(v48, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v35, "unsignedLongValue");
    objc_msgSend(v48, "objectAtIndexedSubscript:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "stringWithFormat:", CFSTR("%lu"), v68 - objc_msgSend(v38, "unsignedLongValue") - (v69 + v70));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v85;
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)objc_msgSend(v66, "initWithString:attributes:", v39, v71);
    objc_msgSend(v30, "appendAttributedString:", v72);

    v41 = v42;
    v37 = 0x1E0CB3000;
  }

  v81 = (void *)objc_msgSend(objc_alloc(*(Class *)(v37 + 1176)), "initWithString:", CFSTR(")"));
  objc_msgSend(v30, "appendAttributedString:", v81);

  objc_msgSend(v92, "textLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setAttributedText:", v30);

  return v92;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_signalConfidenceByAssetUUIDBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_countsBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalInfoBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalIdentifiersBySectionName, 0);
  objc_storeStrong((id *)&self->_sectionNames, 0);
}

void __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isHierarchical"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");
        v14 = CFSTR("Leaf");
        if (v13)
          v14 = CFSTR("Hierarchical");
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v15);
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

void __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_2(uint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v11);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v8);

}

void __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_157(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

@end
