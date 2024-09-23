@implementation AVPlayerMediaSelectionCriteria(TVPAdditions)

- (uint64_t)tvp_isEqualToCriteria:()TVPAdditions
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  if (a1 != v6)
  {
    objc_msgSend(a1, "preferredLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      objc_msgSend(a1, "preferredLanguages");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredLanguages");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        v9 = 0;
        goto LABEL_16;
      }
    }
    objc_msgSend(a1, "preferredMediaCharacteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredMediaCharacteristics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      objc_msgSend(a1, "preferredMediaCharacteristics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredMediaCharacteristics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v13))
      {
        v9 = 0;
        goto LABEL_14;
      }
      v25 = v13;
      v26 = v12;
    }
    objc_msgSend(a1, "principalMediaCharacteristics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "principalMediaCharacteristics");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

      v9 = 1;
    }
    else
    {
      v16 = (void *)v15;
      objc_msgSend(a1, "principalMediaCharacteristics");
      v24 = v3;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "principalMediaCharacteristics");
      v23 = v10;
      v18 = v8;
      v19 = v7;
      v20 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v17, "isEqual:", v21);

      v4 = v20;
      v7 = v19;
      v8 = v18;
      v10 = v23;

      v3 = v24;
    }
    v13 = v25;
    v12 = v26;
    if (v10 == v11)
    {
LABEL_15:

      if (v7 == v8)
      {
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:

      goto LABEL_17;
    }
LABEL_14:

    goto LABEL_15;
  }
  v9 = 1;
LABEL_18:

  return v9;
}

@end
