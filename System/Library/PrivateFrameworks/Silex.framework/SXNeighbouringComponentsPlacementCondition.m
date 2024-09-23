@implementation SXNeighbouringComponentsPlacementCondition

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  objc_msgSend(v5, "leadingComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "role") == 3)
  {

LABEL_4:
    objc_msgSend(v5, "leadingComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "classification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "hasAffiliationWithClassification:forDirection:", v12, 1);

    objc_msgSend(v5, "trailingComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "classification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "classification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "hasAffiliationWithClassification:forDirection:", v17, 0);

    v19 = (v13 | v18) ^ 1;
    goto LABEL_16;
  }
  objc_msgSend(v5, "trailingComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "role");

  if (v8 == 3)
    goto LABEL_4;
  objc_msgSend(v5, "leadingComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "trailingComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v19 = 1;
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "leadingComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v5, "trailingComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v5, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v25, "count") == 0;

    }
  }
  else
  {
    v19 = 0;
  }

LABEL_16:
  return v19;
}

@end
