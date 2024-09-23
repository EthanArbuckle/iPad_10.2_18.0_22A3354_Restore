@implementation CRLatinLowConfidenceTextFeatureFilterV2

- (BOOL)shouldFilterRegion:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v16;
  unint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "activationProbability");
  v5 = v4;
  objc_msgSend(v3, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7 == 1 && v5 < 0.65)
    goto LABEL_9;
  objc_msgSend(v3, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9 == 2 && v5 < 0.5)
    goto LABEL_9;
  objc_msgSend(v3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11 == 3 && v5 < 0.35)
    goto LABEL_9;
  objc_msgSend(v3, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13 == 4 && v5 < 0.2)
  {
LABEL_9:
    v14 = 1;
  }
  else
  {
    objc_msgSend(v3, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");
    v14 = v5 < 0.1 && v17 > 4;

  }
  return v14;
}

- (BOOL)shouldFilterRegionBasedOnGeometry:(id)a3 closestDistance:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  BOOL v11;

  v5 = a3;
  if (!objc_msgSend(v5, "isIsolatedClosestRegionDistance:", a4))
    goto LABEL_10;
  objc_msgSend(v5, "firstTextRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "activationProbability");
    v8 = v9;
  }
  if (objc_msgSend(v7, "length") != 1 || v8 >= 0.75)
  {
    v10 = objc_msgSend(v7, "length");

    if (v10 == 2 && v8 < 0.5)
      goto LABEL_9;
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }

LABEL_9:
  v11 = 1;
LABEL_11:

  return v11;
}

@end
