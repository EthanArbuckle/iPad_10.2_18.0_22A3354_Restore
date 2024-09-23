@implementation PPLocationClusterID

- (PPLocationClusterID)initWithName:(id)a3 subThoroughfare:(id)a4 thoroughfare:(id)a5 subLocality:(id)a6 locality:(id)a7 administrativeArea:(id)a8
{
  id v15;
  id v16;
  id v17;
  PPLocationClusterID *v18;
  PPLocationClusterID *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PPLocationClusterID;
  v18 = -[PPLocationClusterID init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_subThoroughfare, a4);
    objc_storeStrong((id *)&v19->_thoroughfare, a5);
    objc_storeStrong((id *)&v19->_subLocality, a6);
    objc_storeStrong((id *)&v19->_locality, a7);
    objc_storeStrong((id *)&v19->_administrativeArea, a8);
  }

  return v19;
}

- (PPLocationClusterID)initWithPlacemark:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  PPLocationClusterID *v21;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subThoroughfare");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v4, "subThoroughfare");
      v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &stru_1E7E221D0;
    }

    v7 = (void *)v8;
  }
  objc_msgSend(v4, "thoroughfare");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v4, "thoroughfare");
      v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_1E7E221D0;
    }

    v10 = (void *)v11;
  }
  objc_msgSend(v4, "subLocality");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v10)
  {
    if (v12)
    {
      objc_msgSend(v4, "subLocality");
      v14 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = &stru_1E7E221D0;
    }

    v13 = (void *)v14;
  }
  objc_msgSend(v4, "locality");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v13)
  {
    if (v15)
    {
      objc_msgSend(v4, "locality");
      v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E7E221D0;
    }

    v16 = (void *)v17;
  }
  objc_msgSend(v4, "administrativeArea");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v16)
  {
    if (v18)
    {
      objc_msgSend(v4, "administrativeArea");
      v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = &stru_1E7E221D0;
    }

    v19 = (void *)v20;
  }
  v21 = -[PPLocationClusterID initWithName:subThoroughfare:thoroughfare:subLocality:locality:administrativeArea:](self, "initWithName:subThoroughfare:thoroughfare:subLocality:locality:administrativeArea:", v5, v7, v10, v13, v16, v19);

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PPLocationClusterID *v5;
  PPLocationClusterID *v6;
  unint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  CFComparisonResult v17;
  CFComparisonResult v18;
  CFComparisonResult v19;
  CFComparisonResult v20;
  CFComparisonResult v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (PPLocationClusterID *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v16 = 1;
LABEL_38:

      goto LABEL_39;
    }
    if (v5)
    {
      v7 = -[PPLocationClusterID hash](self, "hash");
      if (v7 == -[PPLocationClusterID hash](v6, "hash"))
      {
        v8 = self->_name;
        -[PPLocationClusterID name](v6, "name");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!((unint64_t)v8 | v9))
          goto LABEL_6;
        v15 = (void *)v9;
        v16 = 0;
        if (!v8 || !v9)
          goto LABEL_37;
        v17 = CFStringCompare(v8, (CFStringRef)v9, 1uLL);

        if (v17 == kCFCompareEqualTo)
        {
LABEL_6:
          v8 = self->_subThoroughfare;
          -[PPLocationClusterID subThoroughfare](v6, "subThoroughfare");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!((unint64_t)v8 | v10))
            goto LABEL_7;
          v15 = (void *)v10;
          v16 = 0;
          if (!v8 || !v10)
            goto LABEL_37;
          v18 = CFStringCompare(v8, (CFStringRef)v10, 1uLL);

          if (v18 == kCFCompareEqualTo)
          {
LABEL_7:
            v8 = self->_thoroughfare;
            -[PPLocationClusterID thoroughfare](v6, "thoroughfare");
            v11 = objc_claimAutoreleasedReturnValue();
            if (!((unint64_t)v8 | v11))
              goto LABEL_8;
            v15 = (void *)v11;
            v16 = 0;
            if (!v8 || !v11)
              goto LABEL_37;
            v19 = CFStringCompare(v8, (CFStringRef)v11, 1uLL);

            if (v19 == kCFCompareEqualTo)
            {
LABEL_8:
              v8 = self->_subLocality;
              -[PPLocationClusterID subLocality](v6, "subLocality");
              v12 = objc_claimAutoreleasedReturnValue();
              if (!((unint64_t)v8 | v12))
                goto LABEL_9;
              v15 = (void *)v12;
              v16 = 0;
              if (!v8 || !v12)
                goto LABEL_37;
              v20 = CFStringCompare(v8, (CFStringRef)v12, 1uLL);

              if (v20 == kCFCompareEqualTo)
              {
LABEL_9:
                v8 = self->_locality;
                -[PPLocationClusterID locality](v6, "locality");
                v13 = objc_claimAutoreleasedReturnValue();
                if (!((unint64_t)v8 | v13))
                  goto LABEL_10;
                v15 = (void *)v13;
                v16 = 0;
                if (v8 && v13)
                {
                  v21 = CFStringCompare(v8, (CFStringRef)v13, 1uLL);

                  if (v21 == kCFCompareEqualTo)
                  {
LABEL_10:
                    v8 = self->_administrativeArea;
                    -[PPLocationClusterID administrativeArea](v6, "administrativeArea");
                    v14 = objc_claimAutoreleasedReturnValue();
                    if ((unint64_t)v8 | v14)
                    {
                      v15 = (void *)v14;
                      v16 = 0;
                      if (v8 && v14)
                        v16 = CFStringCompare(v8, (CFStringRef)v14, 1uLL) == kCFCompareEqualTo;
                    }
                    else
                    {
                      v15 = 0;
                      v8 = 0;
                      v16 = 1;
                    }
                    goto LABEL_37;
                  }
                  goto LABEL_33;
                }
LABEL_37:

                goto LABEL_38;
              }
            }
          }
        }
      }
    }
LABEL_33:
    v16 = 0;
    goto LABEL_38;
  }
  v16 = 0;
LABEL_39:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x1C3BD6630](self, a2);
  -[NSString lowercaseString](self->_name, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[NSString lowercaseString](self->_thoroughfare, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@:%@:%@:%@:%@"), self->_name, self->_subThoroughfare, self->_thoroughfare, self->_subLocality, self->_locality, self->_administrativeArea);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setSubThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_subThoroughfare, a3);
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_thoroughfare, a3);
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setSubLocality:(id)a3
{
  objc_storeStrong((id *)&self->_subLocality, a3);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)broadenClusterId:(id)a3
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;

  v3 = a3;
  objc_opt_self();
  objc_msgSend(v3, "locality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "administrativeArea");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAdministrativeArea:", v5);

    objc_msgSend(v3, "subLocality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "locality");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLocality:", v7);

      objc_msgSend(v3, "thoroughfare");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v3, "subLocality");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSubLocality:", v9);

        objc_msgSend(v3, "subThoroughfare");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v3, "thoroughfare");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setThoroughfare:", v11);

          objc_msgSend(v3, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v3, "subThoroughfare");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setSubThoroughfare:", v13);

          }
        }
      }
    }
  }

  objc_msgSend(v4, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
    goto LABEL_13;
  objc_msgSend(v4, "setName:", 0);
  objc_msgSend(v4, "subThoroughfare");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
    goto LABEL_13;
  objc_msgSend(v4, "setSubThoroughfare:", 0);
  objc_msgSend(v4, "thoroughfare");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
    goto LABEL_13;
  objc_msgSend(v4, "setThoroughfare:", 0);
  objc_msgSend(v4, "subLocality");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
    goto LABEL_13;
  objc_msgSend(v4, "setSubLocality:", 0);
  objc_msgSend(v4, "locality");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23
    || (objc_msgSend(v4, "setLocality:", 0),
        objc_msgSend(v4, "administrativeArea"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "length"),
        v24,
        v25))
  {
LABEL_13:
    v26 = v4;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (BOOL)asClusterIDPlacemark:(id)a3 isEqualToPlacemark:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlacemark:", v7);

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlacemark:", v6);
  LOBYTE(a1) = objc_msgSend(v8, "isEqual:", v9);

  return (char)a1;
}

+ (id)clustersWithRecords:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[PPLocationClusterID aggregateRecords:toClusters:withLookupTable:]((uint64_t)a1, v4, v5, 0);

  return v5;
}

+ (id)lookupTableWithRecords:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[PPLocationClusterID aggregateRecords:toClusters:withLookupTable:]((uint64_t)a1, v4, 0, v5);

  return v5;
}

+ (id)latLongTableWithClusters:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PPLocationClusterID_latLongTableWithClusters___block_invoke;
  v7[3] = &unk_1E7E1BA00;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __48__PPLocationClusterID_latLongTableWithClusters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CLLocationCoordinate2D v36;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  obj = v6;
  if (v7)
  {
    v8 = v7;
    v27 = a1;
    v28 = v5;
    v6 = 0;
    v9 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v11, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "placemark");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "location");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "placemark");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "location");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v15, "coordinate");
          v20 = CLLocationCoordinate2DIsValid(v36);

          if (v20)
          {
            if (v6)
            {
              objc_msgSend(v6, "coordinate");
              v22 = v21;
              objc_msgSend(v15, "coordinate");
              if (v22 != v23
                || (objc_msgSend(v6, "coordinate"), v25 = v24, objc_msgSend(v15, "coordinate"), v25 != v26))
              {

                objc_autoreleasePoolPop(v12);
                v5 = v28;
                v6 = obj;
                goto LABEL_19;
              }
            }
            else
            {
              v6 = v15;
            }
          }
        }
        else
        {

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v8)
        continue;
      break;
    }

    v5 = v28;
    if (v6)
    {
      objc_msgSend(*(id *)(v27 + 32), "setObject:forKeyedSubscript:", v6, v28);
      goto LABEL_19;
    }
  }
  else
  {
LABEL_19:

  }
}

+ (void)aggregateRecords:(void *)a3 toClusters:(void *)a4 withLookupTable:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  PPLocationClusterID *v11;
  void *v12;
  void *v13;
  PPLocationClusterID *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  PPLocationClusterID *v35;
  void *v36;
  void *v37;
  PPLocationClusterID *v38;
  void *v39;
  PPLocationClusterID *v40;
  PPLocationClusterID *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  id obja;
  void *v54;
  uint64_t v55;
  void *v56;
  void *context;
  PPLocationClusterID *contexta;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v51 = a3;
  v7 = a4;
  objc_opt_self();
  if (!v7)
    v7 = (id)objc_opt_new();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v8 = v6;
  v54 = v8;
  v55 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v55)
  {
    obj = *(id *)v66;
    do
    {
      v9 = 0;
      do
      {
        if (*(id *)v66 != obj)
          objc_enumerationMutation(v8);
        v59 = v9;
        v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v9);
        context = (void *)MEMORY[0x1C3BD6630]();
        v11 = [PPLocationClusterID alloc];
        objc_msgSend(v10, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "placemark");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[PPLocationClusterID initWithPlacemark:](v11, "initWithPlacemark:", v13);

        do
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14, v51);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isAmbiguous") & 1) == 0)
          {
            objc_msgSend(v10, "location");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "placemark");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "location");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "placemark");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = +[PPLocationClusterID asClusterIDPlacemark:isEqualToPlacemark:](PPLocationClusterID, "asClusterIDPlacemark:isEqualToPlacemark:", v17, v19);

            if (!v20)
            {
              objc_msgSend(v10, "location");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "placemark");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "location");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "placemark");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v22, "pp_specificityCompare:", v24);

              if (v25)
              {
                if (v25 == 1)
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v14);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0D70B90], "sharedAmbiguousRecord");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, v14);

              }
            }
          }
          +[PPLocationClusterID broadenClusterId:](PPLocationClusterID, "broadenClusterId:", v14);
          v27 = objc_claimAutoreleasedReturnValue();

          v14 = (PPLocationClusterID *)v27;
        }
        while (v27);
        objc_autoreleasePoolPop(context);
        v9 = v59 + 1;
        v8 = v54;
      }
      while (v59 + 1 != v55);
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v55);
  }

  v28 = v51;
  if (v51)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obja = v8;
    v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v62 != v31)
            objc_enumerationMutation(obja);
          v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x1C3BD6630]();
          v35 = [PPLocationClusterID alloc];
          v60 = v33;
          objc_msgSend(v33, "location");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "placemark");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[PPLocationClusterID initWithPlacemark:](v35, "initWithPlacemark:", v37);

          objc_msgSend(v7, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v39;
          contexta = v38;
          if (objc_msgSend(v39, "isAmbiguous"))
          {
            v40 = v38;
          }
          else
          {
            v41 = [PPLocationClusterID alloc];
            objc_msgSend(v39, "location");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "placemark");
            v43 = v34;
            v44 = v30;
            v45 = v31;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[PPLocationClusterID initWithPlacemark:](v41, "initWithPlacemark:", v46);

            v31 = v45;
            v30 = v44;
            v34 = v43;

          }
          v47 = v51;
          objc_msgSend(v51, "objectForKeyedSubscript:", v40, v51);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v48)
          {
            v49 = (void *)objc_opt_new();
            objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, v40);

          }
          objc_msgSend(v47, "objectForKeyedSubscript:", v40);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v60);

          objc_autoreleasePoolPop(v34);
        }
        v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v30);
    }

    v28 = v51;
    v8 = v54;
  }

}

@end
