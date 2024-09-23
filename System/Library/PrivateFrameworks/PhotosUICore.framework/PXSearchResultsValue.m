@implementation PXSearchResultsValue

- (PXSearchResultsValue)init
{
  PXSearchResultsValue *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSearchResultsValue;
  v2 = -[PXSearchResultsValue init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_setCollectionType:(unint64_t)a3 uuid:(id)a4 title:(id)a5 subtitle:(id)a6
{
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *collectionUUID;
  NSString *collectionTitle;
  NSString *v15;
  NSString *collectionSubtitle;
  NSString *v17;

  v10 = (NSString *)a4;
  v11 = (NSString *)a5;
  v12 = (NSString *)a6;
  collectionUUID = self->_collectionUUID;
  self->_collectionType = a3;
  self->_collectionUUID = v10;
  v17 = v10;

  collectionTitle = self->_collectionTitle;
  self->_collectionTitle = v11;
  v15 = v11;

  collectionSubtitle = self->_collectionSubtitle;
  self->_collectionSubtitle = v12;

}

- (NSString)searchString
{
  void *v2;
  void *v3;

  -[PLSearchResult contentStrings](self->_searchResult, "contentStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)searchTokens
{
  return (NSArray *)-[PLSearchResult searchTokens](self->_searchResult, "searchTokens");
}

- (double)score
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PXSearchResultsValue_score__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isFinished
{
  PXSearchResultsValue *v2;
  void *v3;

  v2 = self;
  -[PXSearchResultsValue delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "searchIsFinished:", v2);

  return (char)v2;
}

- (id)displayTitleWithDefaultAttributes:(id)a3 dimmedAttributes:(id)a4 selectedDisplayTitle:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSAttributedString *attributedDisplayTitle;
  void *v13;
  _BOOL4 v14;
  NSAttributedString *v15;
  NSAttributedString *v16;
  NSAttributedString *v17;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id WeakRetained;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSAttributedString *v56;
  NSAttributedString *v57;
  NSString *selectedDisplayTitle;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id *v68;
  id v69;
  void *v70;
  void *v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  SEL v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;

  v9 = a3;
  v10 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsValue.m"), 89, CFSTR("expect main thread"));

  }
  PXLocalizedStringFromTable(CFSTR("SEARCH_CATEGORY_DELIMITER"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  attributedDisplayTitle = self->_attributedDisplayTitle;
  if (!attributedDisplayTitle)
  {
    v68 = a5;
    v19 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v69 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[PLSearchResult contentStrings](self->_searchResult, "contentStrings");
    v20 = objc_claimAutoreleasedReturnValue();
    -[PLSearchResult matchRanges](self->_searchResult, "matchRanges");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchTitlesSpec searchItalicTitleAttributes](PXSearchTitlesSpec, "searchItalicTitleAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v10;
    if (objc_msgSend(v21, "count"))
      v23 = v10;
    else
      v23 = v9;
    v24 = v23;
    v96 = 0;
    v97 = &v96;
    v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__68338;
    v100 = __Block_byref_object_dispose__68339;
    v101 = 0;
    v71 = v11;
    v90 = 0;
    v91 = &v90;
    v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__68338;
    v94 = __Block_byref_object_dispose__68339;
    v95 = 0;
    v84 = 0;
    v85 = &v84;
    v86 = 0x3032000000;
    v87 = __Block_byref_object_copy__68338;
    v88 = __Block_byref_object_dispose__68339;
    v89 = 0;
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke;
    v72[3] = &unk_1E511FE18;
    v72[4] = self;
    v80 = &v84;
    v65 = v22;
    v73 = v65;
    v74 = v24;
    v64 = v21;
    v75 = v64;
    v83 = a2;
    v66 = v9;
    v25 = v9;
    v76 = v25;
    v81 = &v90;
    v82 = &v96;
    v26 = v19;
    v77 = v26;
    v63 = v11;
    v78 = v63;
    v27 = v69;
    v79 = v27;
    v70 = (void *)v20;
    v28 = (void *)v20;
    v29 = v74;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v72);
    v30 = (void *)v85[5];
    v85[5] = 0;

    v31 = (void *)v97[5];
    if (v91[5])
    {
      if (v31)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "dateFormatter");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v97[5], "string");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v91[5], "string");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v33, "newLocalizedStringFromYear:month:", v34, v35);

        objc_msgSend((id)v97[5], "string");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "rangeOfString:", v37);
        v62 = v39;
        v40 = v38;

        objc_msgSend((id)v91[5], "string");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v36, "rangeOfString:", v41);
        v61 = v43;
        v44 = v42;

        if (!v36 || v40 == 0x7FFFFFFFFFFFFFFFLL || v44 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v45 = (void *)objc_msgSend((id)v91[5], "mutableCopy");
          objc_msgSend(v45, "mutableString");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "appendString:", v63);

          objc_msgSend(v45, "appendAttributedString:", v97[5]);
        }
        else
        {
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v36, 0);
          objc_msgSend(v45, "addAttributes:range:", v25, v44, v61);
          objc_msgSend(v45, "addAttributes:range:", v25, v40, v62);
        }
        v49 = (void *)v85[5];
        v85[5] = (uint64_t)v45;

        goto LABEL_24;
      }
      v31 = (void *)v91[5];
    }
    else if (!v31)
    {
LABEL_25:
      if (v85[5])
      {
        if (objc_msgSend(v26, "length"))
        {
          objc_msgSend(v26, "mutableString");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "appendString:", v63);

        }
        objc_msgSend(v26, "appendAttributedString:", v85[5]);
        if (objc_msgSend(v27, "length"))
          objc_msgSend(v27, "appendString:", v63);
        objc_msgSend((id)v85[5], "string");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "appendString:", v51);

      }
      if (self->_transientToken)
      {
        v52 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" from %@"), self->_transientToken);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v52, "initWithString:attributes:", v53, v29);
        objc_msgSend(v26, "appendAttributedString:", v54);

      }
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "px_attributedStringByDeletingCharactersInSet:", v55);
      v56 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      v57 = self->_attributedDisplayTitle;
      self->_attributedDisplayTitle = v56;

      selectedDisplayTitle = self->_selectedDisplayTitle;
      self->_selectedDisplayTitle = (NSString *)v27;
      v59 = v27;

      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v90, 8);

      _Block_object_dispose(&v96, 8);
      v10 = v67;
      a5 = v68;
      v9 = v66;
      if (v68)
        goto LABEL_7;
      goto LABEL_8;
    }
    v46 = v85;
    v47 = v31;
    v33 = (void *)v46[5];
    v46[5] = (uint64_t)v47;
LABEL_24:

    v11 = v71;
    goto LABEL_25;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[PXSearchDisplayUtility attributedStringFontNeedsUpdate:currentFont:](PXSearchDisplayUtility, "attributedStringFontNeedsUpdate:currentFont:", attributedDisplayTitle, v13);

  if (v14)
  {
    v15 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", self->_attributedDisplayTitle);
    -[NSAttributedString addAttributes:range:](v15, "addAttributes:range:", v9, 0, -[NSAttributedString length](v15, "length"));
    v16 = self->_attributedDisplayTitle;
    self->_attributedDisplayTitle = v15;

  }
  if (a5)
LABEL_7:
    *a5 = objc_retainAutorelease(self->_selectedDisplayTitle);
LABEL_8:
  v17 = self->_attributedDisplayTitle;

  return v17;
}

- (NSString)displayTitle
{
  return -[NSAttributedString string](self->_attributedDisplayTitle, "string");
}

- (NSString)displaySubtitle
{
  NSString *displaySubtitle;
  PLSearchResult *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  NSString *v12;
  void *v14;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsValue.m"), 232, CFSTR("expect main thread"));

  }
  displaySubtitle = self->_displaySubtitle;
  if (!displaySubtitle)
  {
    v5 = self->_searchResult;
    if (!-[PLSearchResult groupCount](v5, "groupCount"))
    {
      v7 = 0;
      goto LABEL_61;
    }
    v6 = -[PXSearchResultsValue _plCategoryForPlSearchResult:](self, "_plCategoryForPlSearchResult:", v5);
    v7 = 0;
    if (v6 > 1499)
    {
      if (v6 > 1899)
      {
        if (v6 > 1999)
        {
          switch(v6)
          {
            case 2000:
              v8 = CFSTR("SEARCH_RESULT_SECTION_HEADER_ALBUMS");
              goto LABEL_59;
            case 2100:
              v8 = CFSTR("SEARCH_CATEGORY_FILENAME");
              goto LABEL_59;
            case 2200:
              v8 = CFSTR("SEARCH_CATEGORY_SAVED_FROM_APP");
              goto LABEL_59;
          }
        }
        else if ((unint64_t)(v6 - 1900) < 0x14)
        {
          v8 = CFSTR("SEARCH_CATEGORY_MEDIA_TYPE");
LABEL_59:
          PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_60;
        }
        goto LABEL_61;
      }
      if (v6 <= 1599)
      {
        if ((unint64_t)(v6 - 1500) > 0x29 || ((1 << (v6 + 36)) & 0x300C0300C03) == 0)
          goto LABEL_61;
        v8 = CFSTR("SEARCH_CATEGORY_SCENE");
        goto LABEL_59;
      }
      if (v6 <= 1700)
      {
        if ((unint64_t)(v6 - 1600) <= 0xB && ((1 << (v6 - 64)) & 0xC03) != 0)
        {
          v8 = CFSTR("SEARCH_CATEGORY_MEANING");
          goto LABEL_59;
        }
        if (v6 == 1700)
        {
          v8 = CFSTR("SEARCH_CATEGORY_BUSINESS_NAME");
          goto LABEL_59;
        }
LABEL_61:
        if (-[NSString length](self->_dateFilterString, "length"))
        {
          objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(", %@"), self->_dateFilterString);
          v11 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v11;
        }
        v12 = self->_displaySubtitle;
        self->_displaySubtitle = (NSString *)v7;

        displaySubtitle = self->_displaySubtitle;
        return displaySubtitle;
      }
      if ((unint64_t)(v6 - 1800) >= 4)
      {
        if (v6 == 1701)
        {
          v8 = CFSTR("SEARCH_CATEGORY_BUSINESS_CATEGORY");
          goto LABEL_59;
        }
        goto LABEL_61;
      }
LABEL_36:
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SearchResultsSubtitle_InSharedLibrary"));
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_60:
      v7 = (void *)v9;
      goto LABEL_61;
    }
    if (v6 <= 1099)
    {
      if ((unint64_t)(v6 - 1) >= 0xE)
      {
        switch(v6)
        {
          case 1000:
            v8 = CFSTR("SEARCH_CATEGORY_HOME");
            goto LABEL_59;
          case 1001:
            v8 = CFSTR("SEARCH_CATEGORY_WORK");
            goto LABEL_59;
          case 1002:
            goto LABEL_13;
          case 1003:
          case 1004:
            v8 = CFSTR("SEARCH_CATEGORY_POI");
            goto LABEL_59;
          case 1005:
          case 1006:
            v8 = CFSTR("SEARCH_CATEGORY_ROI");
            goto LABEL_59;
          default:
            goto LABEL_61;
        }
        goto LABEL_61;
      }
LABEL_13:
      -[PLSearchResult owningContentString](v5, "owningContentString");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_60;
    }
    if (v6 <= 1299)
    {
      if ((unint64_t)(v6 - 1100) > 5)
      {
        switch(v6)
        {
          case 1200:
            v8 = CFSTR("SEARCH_CATEGORY_KEYWORD");
            goto LABEL_59;
          case 1201:
            v8 = CFSTR("SEARCH_CATEGORY_TITLE");
            goto LABEL_59;
          case 1202:
            v8 = CFSTR("SEARCH_CATEGORY_DESCRIPTION");
            goto LABEL_59;
          case 1203:
          case 1204:
          case 1205:
            v8 = CFSTR("SEARCH_CATEGORY_OCR_TEXT");
            goto LABEL_59;
          default:
            goto LABEL_61;
        }
        goto LABEL_61;
      }
      if (v6 == 1103)
        v8 = CFSTR("SEARCH_CATEGORY_HOLIDAY");
      else
        v8 = CFSTR("SEARCH_CATEGORY_DATE");
      goto LABEL_59;
    }
    v10 = v6 - 20;
    if ((unint64_t)(v6 - 1300) <= 0x1F)
    {
      if (((1 << v10) & 0x300400) != 0)
        goto LABEL_36;
      if (((1 << v10) & 3) != 0)
      {
        v8 = CFSTR("SEARCH_UNNAMED_RESULTS_PERSON_TITLE");
        goto LABEL_59;
      }
      if (((1 << v10) & 0xC0000000) != 0)
      {
        v8 = CFSTR("SEARCH_UNNAMED_RESULTS_PETS_TITLE");
        goto LABEL_59;
      }
    }
    if (v6 == 1400)
    {
      v8 = CFSTR("SEARCH_CATEGORY_ALBUM_TITLE");
      goto LABEL_59;
    }
    if (v6 == 1401)
    {
      v8 = CFSTR("SEARCH_CATEGORY_MEMORY_TITLE");
      goto LABEL_59;
    }
    goto LABEL_61;
  }
  return displaySubtitle;
}

- (BOOL)isAssetResult
{
  void *v2;
  BOOL v3;

  -[PXSearchResultsValue collectionUUID](self, "collectionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)isSingletonPersonResult
{
  void *v2;
  char v3;

  -[PXSearchResultsValue searchResult](self, "searchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSinglePersonOrPetResult");

  return v3;
}

- (void)fetchRemainingUUIDs:(id)a3
{
  void (**v5)(_QWORD);
  PLSearchResult *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  void (**v12)(_QWORD);

  v5 = (void (**)(_QWORD))a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsValue.m"), 375, CFSTR("expect main thread"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = self->_searchResult;
    -[PLSearchResult assetUUIDs](v6, "assetUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PXSearchResultsValue_fetchRemainingUUIDs___block_invoke;
    block[3] = &unk_1E5145688;
    block[4] = self;
    v11 = v7;
    v12 = v5;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else if (v5)
  {
    v5[2](v5);
  }

}

- (void)fetchAllUUIDs:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsValue.m"), 394, CFSTR("expect main thread"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLSearchResult assetUUIDs](self->_searchResult, "assetUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXSearchResultsValue isAssetResult](self, "isAssetResult"))
      -[PXSearchResultsValue _setAssetUUIDs:](self, "_setAssetUUIDs:", v5);

  }
  v6 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v6 = v8;
  }

}

- (BOOL)isOCRStringMatchedResult
{
  void *v3;
  unint64_t v4;

  -[PXSearchResultsValue searchResult](self, "searchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXSearchResultsValue _plCategoryForPlSearchResult:](self, "_plCategoryForPlSearchResult:", v3);

  return v4 - 1203 < 2;
}

- (unint64_t)_plCategoryForPlSearchResult:(id)a3
{
  return objc_msgSend(a3, "categoryAtIndex:", 0);
}

- (void)_computeScoreWithMaxGroupedResultsCount:(unint64_t)a3
{
  double v4;

  v4 = fmax((double)-[PXSearchResultsValue approximateCount](self, "approximateCount") / (double)a3, 0.0);
  if (v4 > 1.0)
    v4 = 1.0;
  self->_score = v4;
}

- (NSDate)date
{
  NSDate *date;
  NSDate *v4;
  NSDate *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDate *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSDate *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  _BYTE v34[128];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  date = self->_date;
  if (!date)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_date;
    self->_date = v4;

    v6 = CFSTR("LOL");
    switch(-[PXSearchResultsValue collectionType](self, "collectionType"))
    {
      case 0uLL:
      case 4uLL:
        goto LABEL_6;
      case 2uLL:
        v7 = (void *)MEMORY[0x1E0CD1630];
        goto LABEL_5;
      case 3uLL:
        v7 = (void *)MEMORY[0x1E0CD13B8];
LABEL_5:
        -[PXSearchResultsValue collectionUUID](self, "collectionUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localIdentifierWithUUID:", v8);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v6)
          goto LABEL_9;
LABEL_6:
        objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "librarySpecificFetchOptions");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setFetchLimit:", 1);
        v11 = (void *)MEMORY[0x1E0CD13B8];
        v35[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchAssetCollectionsWithLocalIdentifiers:options:", v12, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_24;
        objc_msgSend(v14, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v15;
          v17 = v16;
        }
        else
        {
          -[PXSearchResultsValue _startDateForAssetCollection:](self, "_startDateForAssetCollection:", v14);
          v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
        }
        goto LABEL_22;
      default:
LABEL_9:
        -[PXSearchResultsValue assetUUIDs](self, "assetUUIDs");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!-[__CFString count](v6, "count"))
          goto LABEL_25;
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v6 = v6;
        v18 = -[__CFString countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v30 != v20)
                objc_enumerationMutation(v6);
              objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21), (_QWORD)v29);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
                objc_msgSend(v10, "addObject:", v22);

              ++v21;
            }
            while (v19 != v21);
            v19 = -[__CFString countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v19);
        }

        objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "librarySpecificFetchOptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSortDescriptors:", v25);

        objc_msgSend(v14, "setFetchLimit:", 1);
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v10, v14);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_23;
        objc_msgSend(v17, "creationDate");
        v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        v27 = self->_date;
        self->_date = v16;

LABEL_23:
LABEL_24:

LABEL_25:
        date = self->_date;
        break;
    }
  }
  return date;
}

- (id)_startDateForAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)compare:(id)a3
{
  double score;
  double v4;

  score = self->_score;
  v4 = *((double *)a3 + 2);
  if (score > v4)
    return -1;
  else
    return score < v4;
}

- (id)assetLocalIdentifiersForPreview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0C99D20];
  -[PXSearchResultsValue searchResult](self, "searchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyAssetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObjects:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v3, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v3;
}

- (void)_setAsset:(id)a3 forUUID:(id)a4
{
  id v6;
  NSMutableDictionary *uuidToAssetMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  uuidToAssetMap = self->_uuidToAssetMap;
  if (!uuidToAssetMap)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_uuidToAssetMap;
    self->_uuidToAssetMap = v8;

    uuidToAssetMap = self->_uuidToAssetMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](uuidToAssetMap, "setObject:forKeyedSubscript:", v10, v6);

}

- (NSArray)assets
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_assetUUIDs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToAssetMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)searchCategories
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PXSearchResultsValue_searchCategories__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)categoryAtIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  -[PXSearchResultsValue searchResult](self, "searchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "categoryAtIndex:", a3);

  return v5;
}

- (id)groupsMatchRanges
{
  void *v2;
  void *v3;

  -[PXSearchResultsValue searchResult](self, "searchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateSearchIndexCategoriesUsingBlock:(id)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void (**v13)(id, uint64_t);

  v13 = (void (**)(id, uint64_t))a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultsValue.m"), 569, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  -[PXSearchResultsValue searchResult](self, "searchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "groupCount");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[PXSearchResultsValue searchResult](self, "searchResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "categoryAtIndex:", v7);

      v13[2](v13, v9);
      ++v7;
      -[PXSearchResultsValue searchResult](self, "searchResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "groupCount");

    }
    while (v7 < v11);
  }

}

- (NSDictionary)debugDictionary
{
  void *v3;
  void *v4;
  objc_class *v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%p"), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("self"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXSearchResultsValue itemType](self, "itemType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("itemType"));

  -[PXSearchResultsValue displayTitle](self, "displayTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("title"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displaySubtitle, CFSTR("subtitle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_approximateCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_collectionType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("collectionType"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionUUID, CFSTR("collectionUUID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionTitle, CFSTR("collectionTitle"));
  -[PXSearchResultsValue collectionSubtitle](self, "collectionSubtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("collectionSubtitle"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_assetUUIDs, CFSTR("assetUUIDs"));
  -[PXSearchResultsValue groupsMatchRanges](self, "groupsMatchRanges");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("description"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("groupsMatchRanges"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXSearchResultsValue categoryAtIndex:](self, "categoryAtIndex:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mainCategory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_searchCategories);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("searchCategoriesMask"));

  return (NSDictionary *)v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[PXSearchResultsValue debugDictionary](self, "debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)collectionSubtitle
{
  NSString *collectionSubtitle;
  id WeakRetained;
  NSString *v5;
  NSString *v6;

  collectionSubtitle = self->_collectionSubtitle;
  if (!collectionSubtitle)
  {
    if (self->_startDate)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "stringWithStartDate:endDate:", self->_startDate, self->_endDate);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_collectionSubtitle;
      self->_collectionSubtitle = v5;

      collectionSubtitle = self->_collectionSubtitle;
    }
    else
    {
      collectionSubtitle = 0;
    }
  }
  return collectionSubtitle;
}

- (void)setStartDate:(id)a3 endDate:(id)a4
{
  PSIDate *v6;
  PSIDate *v7;
  PSIDate *startDate;
  PSIDate *endDate;
  PSIDate *v10;

  v6 = (PSIDate *)a3;
  v7 = (PSIDate *)a4;
  startDate = self->_startDate;
  self->_startDate = v6;
  v10 = v6;

  endDate = self->_endDate;
  self->_endDate = v7;

}

- (unint64_t)itemType
{
  return 1;
}

- (NSString)transientToken
{
  return self->_transientToken;
}

- (void)setTransientToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)assetUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)_setAssetUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (NSString)collectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)collectionTitle
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (unint64_t)approximateCount
{
  return self->_approximateCount;
}

- (void)_setApproximateCount:(unint64_t)a3
{
  self->_approximateCount = a3;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)_setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (NSString)selectedDisplayTitle
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)_setSelectedDisplayTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableDictionary)uuidToAssetMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (PXSearchResultsValueDelegate)delegate
{
  return (PXSearchResultsValueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PLSearchResult)searchResult
{
  return (PLSearchResult *)objc_getProperty(self, a2, 152, 1);
}

- (void)_setSearchResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)_setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)dateFilterString
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)_setDateFilterString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFilterString, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuidToAssetMap, 0);
  objc_storeStrong((id *)&self->_selectedDisplayTitle, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionUUID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_transientToken, 0);
  objc_storeStrong((id *)&self->_collectionSubtitle, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_attributedDisplayTitle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__PXSearchResultsValue_searchCategories__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
  {
    objc_msgSend(v2, "searchResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "groupCount");

    if (v4)
    {
      v5 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "searchResult");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "categoryAtIndex:", v5);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) |= PLSearchIndexCategoryMaskForCategory();

        ++v5;
        objc_msgSend(*(id *)(a1 + 32), "searchResult");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "groupCount");

      }
      while (v5 < v8);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __44__PXSearchResultsValue_fetchRemainingUUIDs___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isAssetResult"))
    objc_msgSend(*(id *)(a1 + 32), "_setAssetUUIDs:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  int IsPerson;
  int IsPet;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  NSRange v50;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "categoryAtIndex:", a3);
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v5, "length") || (PLSearchIndexCategoryIsPet() & 1) == 0)
    {
LABEL_16:
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v5, *(_QWORD *)(a1 + 48));
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "beginEditing");
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke_2;
      v40 = &unk_1E511FDF0;
      v19 = *(_QWORD *)(a1 + 120);
      v43 = *(_QWORD *)(a1 + 96);
      v44 = v19;
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(id *)(a1 + 64);
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v37);
      if (((PLSearchIndexCategoryIsPerson() & 1) != 0 || PLSearchIndexCategoryIsPet())
        && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "isMatchedByIdentifierAtIndex:", a3, v37, v38, v39, v40, v41))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "string");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "rangeOfString:", v5);
        v23 = v22;

        if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "px_rangeExists:", v21, v23) & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setAttributes:range:", *(_QWORD *)(a1 + 64), v21, v23);
        }
        else
        {
          PXAssertGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v50.location = v21;
            v50.length = v23;
            NSStringFromRange(v50);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
            *(_DWORD *)buf = 138412546;
            v46 = v35;
            v47 = 2112;
            v48 = v36;
            _os_log_error_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "Search UI: Failed to find highlight range (%@) in substring (%@)", buf, 0x16u);

          }
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "endEditing", v37, v38, v39, v40, v41);

      goto LABEL_27;
    }
LABEL_15:
    v11 = objc_alloc(MEMORY[0x1E0CB3778]);
    PXLocalizedStringFromTable(CFSTR("SEARCH_UNNAMED_RESULTS_PET_TITLE"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithString:attributes:", v12, *(_QWORD *)(a1 + 40));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    goto LABEL_28;
  }
  IsPerson = PLSearchIndexCategoryIsPerson();
  if (objc_msgSend(v5, "length"))
  {
    if (!IsPerson)
      goto LABEL_16;
  }
  else
  {
    IsPet = PLSearchIndexCategoryIsPet();
    if ((IsPerson & 1) == 0)
    {
      if (!IsPet)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  if ((PLSearchIndexCategoryIsPerson() & 1) != 0)
  {
    v9 = CFSTR("SEARCH_UNNAMED_RESULTS_PERSON_TITLE");
  }
  else
  {
    if (v6 != 1310)
    {
      v10 = 0;
      goto LABEL_26;
    }
    v9 = CFSTR("SEARCH_SOCIAL_GROUP_TITLE");
  }
  PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v10, *(_QWORD *)(a1 + 40));
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

LABEL_27:
LABEL_28:
  if (v6 == 1101)
  {
    v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v28 = *(_QWORD *)(a1 + 112);
    goto LABEL_32;
  }
  if (v6 == 1100)
  {
    v28 = *(_QWORD *)(a1 + 104);
    v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
LABEL_32:
    v30 = *(_QWORD *)(v28 + 8);
    v31 = v29;
    v32 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v31;
    goto LABEL_38;
  }
  if (objc_msgSend(*(id *)(a1 + 72), "length"))
  {
    objc_msgSend(*(id *)(a1 + 72), "mutableString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendString:", *(_QWORD *)(a1 + 80));

  }
  objc_msgSend(*(id *)(a1 + 72), "appendAttributedString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
  if (objc_msgSend(*(id *)(a1 + 88), "length"))
    objc_msgSend(*(id *)(a1 + 88), "appendString:", *(_QWORD *)(a1 + 80));
  v34 = *(void **)(a1 + 88);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "string");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "appendString:", v32);
LABEL_38:

}

void __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke_2(uint64_t a1, void *a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  NSRange v14;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "rangeValue");
  v5 = v4;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "px_rangeExists:", v3, v4) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttributes:range:", *(_QWORD *)(a1 + 40), v3, v5);
  }
  else
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v14.location = v3;
      v14.length = v5;
      NSStringFromRange(v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Search UI: Failed to find highlight range (%@) in substring (%@)", (uint8_t *)&v9, 0x16u);

    }
  }
}

double __29__PXSearchResultsValue_score__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 16);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
