@implementation PLDayPhotosHighlightTitleGenerator

+ (id)titleForHighlight:(id)a3 filter:(unsigned __int16)a4 dateRangeTitleGenerator:(id)a5 options:(unint64_t)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[3];

  v7 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v26 = a5;
  v9 = a3;
  +[PLDayPhotosHighlightTitleGenerator assetsToUseForDayHighlight:withFilter:](PLDayPhotosHighlightTitleGenerator, "assetsToUseForDayHighlight:withFilter:", v9, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dateCreated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v9, "startTimeZoneOffset"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "dateCreated");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v9, "endTimeZoneOffset"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
    a6 |= 8uLL;
  v19 = objc_msgSend(v9, "category");
  v20 = objc_msgSend(v9, "kind");
  v21 = objc_msgSend(v9, "type");

  objc_msgSend(v26, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", v16, v18, v19, v20, v21, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)assetsToUseForDayHighlight:(id)a3 withFilter:(unsigned __int16)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4 == 2)
  {
    objc_msgSend(v5, "extendedAssetsShared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "assetsShared");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (v4 == 1)
  {
    objc_msgSend(v5, "extendedAssetsPrivate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "assetsPrivate");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    if (v4)
    {
      v7 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v5, "extendedAssets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "assets");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (void *)v8;

      v7 = v9;
    }
  }
LABEL_12:

  return v7;
}

@end
