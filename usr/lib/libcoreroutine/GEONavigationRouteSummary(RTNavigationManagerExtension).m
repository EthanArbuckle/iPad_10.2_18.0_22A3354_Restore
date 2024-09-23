@implementation GEONavigationRouteSummary(RTNavigationManagerExtension)

- (uint64_t)isEqualToRouteSummary:()RTNavigationManagerExtension
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  _BOOL4 v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(a1, "destinationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v5, "destinationName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "destinationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "destinationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (v6)
        goto LABEL_9;
    }
    else
    {
      v9 = 1;
    }

LABEL_9:
    objc_msgSend(a1, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latLng");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v5, "destination");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "latLng");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v29 = 0;
        v27 = 1;
LABEL_18:

LABEL_19:
        v10 = v9 & v27;
        goto LABEL_20;
      }
      v29 = (void *)v13;
    }
    objc_msgSend(a1, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "latLng");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lat");
    v17 = v16;
    objc_msgSend(v5, "destination");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "latLng");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lat");
    if (vabdd_f64(v17, v20) >= 2.22044605e-16)
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(a1, "destination");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "latLng");
      v32 = v14;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lng");
      v23 = v22;
      objc_msgSend(v5, "destination");
      v33 = v9;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "latLng");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lng");
      v27 = vabdd_f64(v23, v26) < 2.22044605e-16;

      v9 = v33;
      v14 = v32;

    }
    if (v12)
      goto LABEL_19;
    goto LABEL_18;
  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (uint64_t)isEqual:()RTNavigationManagerExtension
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (a1 == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(a1, "isEqualToRouteSummary:", v4);
    else
      v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latLng");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lat");
  v6 = v5;
  objc_msgSend(a1, "origin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latLng");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lng");
  v10 = v9;
  objc_msgSend(a1, "destinationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latLng");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lat");
  v15 = v14;
  objc_msgSend(a1, "destination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "latLng");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lng");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("origin location, <%f, %f>, destination name, %@, destination location, <%f, %f>"), v6, v10, v11, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
