@implementation PGContextualRuleUtils

+ (id)onThisDayLocalDateForYearHighlight:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "localDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localTodayComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v8, "setYear:", objc_msgSend(v6, "year"));
  objc_msgSend(v8, "setMonth:", objc_msgSend(v7, "month"));
  objc_msgSend(v8, "setDay:", objc_msgSend(v7, "day"));
  objc_msgSend(v8, "setHour:", 12);
  objc_msgSend(v8, "setMinute:", 0);
  objc_msgSend(v8, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)returnContextualKeyAssetForHighlightNode:(id)a3 yearHighlight:(id)a4 sharingFilter:(unsigned __int16)a5 score:(double)a6 inPhotoLibrary:(id)a7 loggingConnection:(id)a8 usingBlock:(id)a9
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void (**v19)(_QWORD, void *, void *, void *, uint8_t *, double);
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
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  NSObject *oslog;
  id v38;
  void (**v39)(_QWORD, void *, void *, void *, uint8_t *, double);
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v13 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(_QWORD, void *, void *, void *, uint8_t *, double))a9;
  objc_msgSend(v15, "fetchAssetCollectionInPhotoLibrary:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v38 = v15;
    v39 = v19;
    oslog = v18;
    objc_msgSend(v17, "librarySpecificFetchOptions");
    v21 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFetchLimit:", 1);
    objc_msgSend(v22, "setSharingFilter:", v13);
    objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentDayGroupHighlightForHighlight:options:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      v25 = v24;
    else
      v25 = v20;
    objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentHighlightForHighlight:options:", v25, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentHighlightForHighlight:options:", v27, v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v21;
    objc_msgSend(v21, "uuid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqualToString:", v31);

    if ((v32 & 1) != 0)
    {
      objc_msgSend(v17, "librarySpecificFetchOptions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setSharingFilter:", v13);
      objc_msgSend(v33, "setIncludeGuestAssets:", 1);
      objc_msgSend(v33, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v20, 0, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35 && v27)
      {
        buf[0] = 0;
        v18 = oslog;
        v15 = v38;
        if (a6 == 0.0)
        {
          objc_msgSend(v20, "promotionScore");
          a6 = v36;
        }
        v39[2](v39, v35, v20, v27, buf, a6);
      }
      else
      {
        v18 = oslog;
        v15 = v38;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v42 = v38;
          v43 = 2112;
          v44 = v20;
          v45 = 2112;
          v46 = v27;
          v47 = 2112;
          v48 = v35;
          _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "Did not return contextual key asset for highlight node %@:\n\tHighlight: %@\n\tMonth highlight: %@\n\tKey asset: %@", buf, 0x2Au);
        }
      }

    }
    else
    {
      v18 = oslog;
      v15 = v38;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v42 = v38;
        v43 = 2112;
        v44 = v20;
        v45 = 2112;
        v46 = v29;
        v47 = 2112;
        v48 = v40;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "Contextual year highlight do not match year highlight for highlight node %@:\n\tContexutal Highlight: %@\n\tContextual Year Highlight: %@\n\tYear highlight: %@\n", buf, 0x2Au);
      }
    }

    v19 = v39;
    v16 = v40;
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v15;
    _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Cannot find highlight for highlight node %@: graph might be out of date", buf, 0xCu);
  }

}

+ (id)dayHighlightContainingAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v3, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "predicateWithFormat:", CFSTR("assets CONTAINS %@ and kind = %d"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v8);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
