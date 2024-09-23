@implementation RTMapItem(RTExtensions)

- (id)appendSource:()RTExtensions
{
  uint64_t v5;

  v5 = objc_msgSend(a1, "source");
  if (a3 && (v5 & a3) != a3)
    objc_msgSend(a1, "setSource:", (objc_msgSend(a1, "source") | a3) & 0xFFFFFFFFFFFFFFFELL);
  return a1;
}

- (id)removeSource:()RTExtensions
{
  if ((objc_msgSend(a1, "source") & a3) != 0)
    objc_msgSend(a1, "setSource:", objc_msgSend(a1, "source") & ~a3);
  return a1;
}

- (id)mergeWithMapItem:()RTExtensions preservingProperties:
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  objc_property_t *v10;
  unint64_t i;
  const char *Name;
  void *v13;
  void *v14;
  unsigned int outCount;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(a1, "copy");
    outCount = 0;
    v9 = (objc_class *)objc_opt_class();
    v10 = class_copyPropertyList(v9, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        Name = property_getName(v10[i]);
        if (Name)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(&unk_1E932C778, "containsObject:", v13) & 1) == 0
            && (objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
          {
            objc_msgSend(v6, "valueForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setValue:forKey:", v14, v13);

          }
        }
      }
    }
    free(v10);
  }
  else
  {
    v8 = (void *)objc_msgSend(v6, "copy");
  }

  return v8;
}

+ (id)heaviestMapItemFrom:()RTExtensions closestToLocation:distanceCalculator:error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  double v33;
  uint64_t j;
  void *v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  id v40;
  _QWORD *v42;
  void *v43;
  void *v44;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") > 1)
  {
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("@max.self"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "weight");
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("weight = %lf"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "count");
    if (v10 && v18 > 1)
    {
      v42 = a6;
      v43 = v17;
      v44 = v11;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v52 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v24, "geoMapItemHandle");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              objc_msgSend(v24, "extendedAttributes");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "wifiFingerprintLabelType");

              if (v28 == 2)
              {
                v12 = v24;

                v17 = v43;
                v11 = v44;
                goto LABEL_33;
              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          if (v21)
            continue;
          break;
        }
      }

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v19;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v48;
        v33 = INFINITY;
        v11 = v44;
        while (2)
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v48 != v32)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            objc_msgSend(v35, "location");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 0;
            objc_msgSend(v44, "distanceFromLocation:toLocation:error:", v10, v36, &v46);
            v38 = v37;
            v39 = v46;

            if (v39)
            {
              if (v42)
                *v42 = objc_retainAutorelease(v39);

              v12 = 0;
              goto LABEL_32;
            }
            if (v38 < v33)
            {
              v40 = v35;

              v33 = v38;
              v31 = v40;
            }
          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v30)
            continue;
          break;
        }
      }
      else
      {
        v31 = 0;
        v11 = v44;
      }

      v31 = v31;
      v12 = v31;
LABEL_32:
      v17 = v43;

    }
    else
    {
      objc_msgSend(v17, "firstObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_33:

  }
  else
  {
    objc_msgSend(v9, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
