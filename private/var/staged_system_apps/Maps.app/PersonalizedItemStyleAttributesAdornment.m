@implementation PersonalizedItemStyleAttributesAdornment

+ (id)defaultAdornment
{
  id v2;
  id v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init((Class)GEOFeatureStyleAttributes);
  v4 = objc_msgSend(v2, "initWithStyleAttributes:additionalAttributes:", v3, 0);

  return v4;
}

+ (PersonalizedItemStyleAttributesAdornment)adornmentWithStyleAttributes:(id)a3
{
  return (PersonalizedItemStyleAttributesAdornment *)objc_msgSend(a1, "adornmentWithStyleAttributes:additionalAttributes:", a3, 0);
}

+ (PersonalizedItemStyleAttributesAdornment)adornmentWithStyleAttributes:(id)a3 additionalAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v9 = v8;
  if (v6)
  {
    v10 = objc_msgSend(v8, "initWithStyleAttributes:additionalAttributes:", v6, v7);
  }
  else
  {
    v11 = objc_alloc_init((Class)GEOFeatureStyleAttributes);
    v10 = objc_msgSend(v9, "initWithStyleAttributes:additionalAttributes:", v11, v7);

  }
  return (PersonalizedItemStyleAttributesAdornment *)v10;
}

- (PersonalizedItemStyleAttributesAdornment)initWithStyleAttributes:(id)a3 additionalAttributes:(id)a4
{
  id v6;
  id v7;
  PersonalizedItemStyleAttributesAdornment *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PersonalizedItemStyleAttributesAdornment;
  v8 = -[PersonalizedItemStyleAttributesAdornment init](&v31, "init");
  if (v8)
  {
    v9 = objc_msgSend(v7, "count");
    if (v9)
    {
      v24 = objc_msgSend(v6, "copy");

      v23 = (uint64_t)&v23;
      v26 = (char *)&v23 - ((8 * v9 + 15) & 0xFFFFFFFF0);
      v30 = 0u;
      v29 = 0u;
      v28 = 0u;
      v27 = 0u;
      v25 = v7;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v28;
        v15 = v26 + 4;
        do
        {
          v16 = 0;
          v17 = &v15[8 * v13];
          do
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(v10);
            v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v18));
            *((_DWORD *)v17 - 1) = objc_msgSend(v18, "integerValue");
            *(_DWORD *)v17 = objc_msgSend(v19, "integerValue");
            v17 += 8;

            v16 = (char *)v16 + 1;
          }
          while (v12 != v16);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          v13 += (uint64_t)v16;
        }
        while (v12);
      }

      v20 = objc_msgSend(v10, "count");
      v21 = v24;
      objc_msgSend(v24, "replaceAttributes:count:", v26, v20);
      v6 = v21;
      v7 = v25;
    }
    else
    {
      v21 = v6;
    }
    objc_storeStrong((id *)&v8->_styleAttributes, v21);
  }

  return v8;
}

- (id)combineAdornment:(id)a3
{
  void *v4;
  signed int v5;
  uint64_t v6;
  signed int v7;
  uint64_t v8;
  GEOFeatureStyleAttributes *v9;
  GEOFeatureStyleAttributes *styleAttributes;
  GEOFeatureStyleAttributes *v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "styleAttributes"));
  v5 = -[GEOFeatureStyleAttributes poiType](self->_styleAttributes, "poiType");
  v6 = 1000001;
  switch(v5)
  {
    case 346:
      break;
    case 347:
      v6 = 1000000;
      break;
    case 348:
      v6 = 500000;
      break;
    case 349:
      v6 = 900000;
      break;
    default:
      if (v5 == 169)
        v6 = 999999;
      else
        v6 = v5;
      break;
  }
  v7 = objc_msgSend(v4, "poiType");
  v8 = 1000001;
  switch(v7)
  {
    case 346:
      break;
    case 347:
      v8 = 1000000;
      break;
    case 348:
      v8 = 500000;
      break;
    case 349:
      v8 = 900000;
      break;
    default:
      v8 = v7;
      if (v7 == 169)
        v8 = 999999;
      break;
  }
  if (v6 <= v8)
  {
    v9 = self->_styleAttributes;
    styleAttributes = (GEOFeatureStyleAttributes *)v4;
  }
  else
  {
    v9 = v4;
    styleAttributes = self->_styleAttributes;
  }
  v11 = styleAttributes;
  v12 = -[GEOFeatureStyleAttributes copy](v9, "copy");
  if (v4 && objc_msgSend(v4, "countAttrs"))
  {
    v13 = -[GEOFeatureStyleAttributes copy](v9, "copy");

    objc_msgSend(v13, "replaceAttributes:count:", -[GEOFeatureStyleAttributes v](v11, "v"), -[GEOFeatureStyleAttributes countAttrs](v11, "countAttrs"));
    v12 = v13;
  }
  v14 = objc_msgSend((id)objc_opt_class(self), "adornmentWithStyleAttributes:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
}

@end
