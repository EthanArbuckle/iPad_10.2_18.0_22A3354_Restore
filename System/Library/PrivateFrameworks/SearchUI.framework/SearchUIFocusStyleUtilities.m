@implementation SearchUIFocusStyleUtilities

+ (unint64_t)secondaryHaloProminence
{
  return 2;
}

+ (int64_t)bestFocusStyleForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  int64_t v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;

  v4 = a3;
  objc_msgSend(v4, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "rowModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "useAppIconMetrics") & 1) != 0)
    {
      objc_msgSend(v9, "command");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

LABEL_19:
        v18 = 7;
        goto LABEL_20;
      }
      objc_msgSend(v9, "command");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v26 = objc_opt_isKindOfClass();

      if ((v26 & 1) != 0)
        goto LABEL_19;
    }
    else
    {

    }
  }
  objc_msgSend(v4, "rowModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v4, "rowModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cardSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
LABEL_9:
    objc_msgSend(v4, "rowModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fillsBackgroundWithContent");

    if ((v17 & 1) != 0)
      goto LABEL_10;
  }
  objc_msgSend(v4, "rowModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cardSection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();

  if ((v21 & 1) != 0)
  {
    v18 = 1;
    goto LABEL_20;
  }
  if ((objc_msgSend(v4, "needsInternalFocus") & 1) != 0)
  {
    v18 = 6;
    goto LABEL_20;
  }
  objc_msgSend(v4, "highlightReferenceView");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22 || (v23 = (void *)v22, v24 = objc_msgSend(v4, "sectionBackgroundStyle"), v23, !v24))
  {
    v18 = objc_msgSend(a1, "bestFocusStyleForBackgroundStyle:", objc_msgSend(v4, "sectionBackgroundStyle"));
    goto LABEL_20;
  }
LABEL_10:
  v18 = 3;
LABEL_20:

  return v18;
}

+ (int64_t)bestFocusStyleForBackgroundStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 1;
  else
    return 3;
}

@end
