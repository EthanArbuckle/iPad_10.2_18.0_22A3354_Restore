@implementation ICStoreArtworkInfo

- (CGColor)copyColorWithKind:(id)a3
{
  void *v4;
  CGColor *v5;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICStoreArtworkInfo colorFromStringRepresentation:](self, "colorFromStringRepresentation:", v4);

  return v5;
}

- (CGColor)colorFromStringRepresentation:(id)a3
{
  id v3;
  unsigned int v4;
  int8x8_t v5;
  int64x2_t v6;
  CGColorSpace *DeviceRGB;
  CGColor *v8;
  float64x2_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_NSIsNSString())
  {
    v4 = strtoul((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), 0, 16);
    v5 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v4), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
    v6.i64[0] = v5.u32[0];
    v6.i64[1] = v5.u32[1];
    v10 = vdivq_f64(vcvtq_f64_s64(v6), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
    v11 = (double)v4 / 255.0;
    v12 = 0x3FF0000000000000;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v8 = CGColorCreate(DeviceRGB, v10.f64);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)stringRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[ICStoreArtworkInfo sizeInfo](self, "sizeInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 2)
  {
    -[NSArray lastObject](self->_responseArray, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v4 == 1)
    {
      -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("url"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
      {
        v7 = 0;
        return (NSString *)v7;
      }
      -[NSURL absoluteString](self->_artworkURL, "absoluteString");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v5;
  }
  return (NSString *)v7;
}

- (id)artworkURLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5 preferP3ColorSpace:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSDictionary *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  BOOL v36;
  double v38;
  NSDictionary *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL4 v49;
  NSDictionary *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSDictionary *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v65;
  void *v66;
  id v67;
  NSDictionary *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  v74 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreArtworkInfo.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cropStyle != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreArtworkInfo.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format != nil"));

LABEL_3:
  v15 = ceil(width);
  v16 = ceil(height);
  -[ICStoreArtworkInfo sizeInfo](self, "sizeInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "type");
  if (v18 == 2)
  {
    v67 = v12;
    -[ICStoreArtworkInfo sortedResponseArray](self, "sortedResponseArray");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v68 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v70;
      v26 = 1.79769313e308;
      v27 = 1.79769313e308;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v70 != v25)
            objc_enumerationMutation(v22);
          v29 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v29, "objectForKey:", CFSTR("width"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", CFSTR("height"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v30, "doubleValue");
            v33 = v32;
            objc_msgSend(v31, "doubleValue");
            v35 = v33 >= v27 || v33 < width;
            v36 = !v35 && v34 < v26;
            if (v36 && v34 >= height)
            {
              v38 = v34;
              v39 = v29;

              v26 = v38;
              v27 = v33;
              v68 = v39;
            }
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      }
      while (v24);
    }

    v12 = v67;
    v20 = v68;
  }
  else
  {
    if (v18 != 1)
    {
      if (v18)
      {
        v20 = 0;
        v19 = 0;
      }
      else
      {
        -[ICStoreArtworkInfo artworkURL](self, "artworkURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
      }
      goto LABEL_55;
    }
    v20 = self->_responseDictionary;
    if (objc_msgSend(v17, "hasMaxSupportedSize"))
    {
      objc_msgSend(v17, "maxSupportedSize");
      if (width < v40)
        v40 = width;
      v15 = ceil(v40);
      if (height >= v41)
        v42 = v41;
      else
        v42 = height;
      v16 = ceil(v42);
    }
  }
  -[NSDictionary objectForKey:](v20, "objectForKey:", CFSTR("url"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "mutableCopy");

  v45 = objc_msgSend(v44, "rangeOfString:options:", CFSTR("{w}"), 5);
  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v47 = v46;
    if (v46)
    {
      v48 = v45;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (uint64_t)v15);
      v49 = v6;
      v50 = v20;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "replaceCharactersInRange:withString:", v48, v47, v51);

      v20 = v50;
      v6 = v49;
    }
  }
  v52 = objc_msgSend(v44, "rangeOfString:options:", CFSTR("{h}"), 5);
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v54 = v53;
    if (v53)
    {
      v55 = v52;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (uint64_t)v16);
      v56 = v20;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "replaceCharactersInRange:withString:", v55, v54, v57);

      v20 = v56;
    }
  }
  v58 = objc_msgSend(v44, "rangeOfString:options:", CFSTR("{c}"), 5);
  if (v58 != 0x7FFFFFFFFFFFFFFFLL && v59)
    objc_msgSend(v44, "replaceCharactersInRange:withString:", v58, v59, v12);
  v60 = objc_msgSend(v44, "rangeOfString:options:", CFSTR("{f}"), 5);
  if (v60 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v61)
    {
      v62 = v60;
      objc_msgSend(v44, "replaceCharactersInRange:withString:", v60, v61, v14);
      if (v6)
      {
        -[NSDictionary objectForKey:](v20, "objectForKey:", CFSTR("hasP3"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v63, "BOOLValue"))
          objc_msgSend(v44, "insertString:atIndex:", CFSTR("-P3"), v62 - 1);

      }
    }
  }
  if (objc_msgSend(v44, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

LABEL_55:
  return v19;
}

- (ICStoreArtworkSizeInfo)sizeInfo
{
  return self->_sizeInfo;
}

- (ICStoreArtworkInfo)initWithArtworkResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  ICStoreArtworkInfo *v6;
  uint64_t v7;
  NSDictionary *responseDictionary;
  ICStoreArtworkSizeInfo *v9;
  ICStoreArtworkSizeInfo *sizeInfo;
  double v11;
  double v12;
  double v13;
  double v14;
  ICStoreArtworkInfo *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v18.receiver = self;
    v18.super_class = (Class)ICStoreArtworkInfo;
    v6 = -[ICStoreArtworkInfo init](&v18, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v4, "copy");
      responseDictionary = v6->_responseDictionary;
      v6->_responseDictionary = (NSDictionary *)v7;

      v9 = objc_alloc_init(ICStoreArtworkSizeInfo);
      sizeInfo = v6->_sizeInfo;
      v6->_sizeInfo = v9;

      -[ICStoreArtworkSizeInfo setType:](v6->_sizeInfo, "setType:", 1);
      if (-[ICStoreArtworkInfo _hasOriginalSize](v6, "_hasOriginalSize"))
      {
        -[ICStoreArtworkInfo originalSize](v6, "originalSize");
        v13 = v12;
        v14 = v11;
        if (v12 != *MEMORY[0x1E0C9D820] || v11 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        {
          -[ICStoreArtworkSizeInfo setHasMaxSupportedSize:](v6->_sizeInfo, "setHasMaxSupportedSize:", 1);
          -[ICStoreArtworkSizeInfo setMaxSupportedSize:](v6->_sizeInfo, "setMaxSupportedSize:", v13, v14);
        }
      }
    }
    self = v6;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CGSize)originalSize
{
  NSDictionary *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self->_responseDictionary;
  -[NSDictionary objectForKey:](v2, "objectForKey:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](v2, "objectForKey:", CFSTR("height"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
    objc_msgSend(v4, "doubleValue");
    v8 = v7;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)_hasOriginalSize
{
  NSDictionary *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = self->_responseDictionary;
  -[NSDictionary objectForKey:](v2, "objectForKey:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](v2, "objectForKey:", CFSTR("height"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_opt_respondsToSelector();
  else
    v5 = 0;

  return v5 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_responseArray, 0);
  objc_storeStrong((id *)&self->_sortedSupportedSizesArray, 0);
  objc_storeStrong((id *)&self->_sortedResponseArray, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_sizeInfo, 0);
}

- (ICStoreArtworkInfo)initWithArtworkResponseArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  ICStoreArtworkInfo *v12;
  ICStoreArtworkInfo *v13;
  ICStoreArtworkSizeInfo *v14;
  ICStoreArtworkSizeInfo *sizeInfo;
  ICStoreArtworkInfo *v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("url"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSString())
          {
            if (!v7)
              v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "addObject:", v10);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "count"))
  {
    v18.receiver = self;
    v18.super_class = (Class)ICStoreArtworkInfo;
    v12 = -[ICStoreArtworkInfo init](&v18, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_responseArray, v7);
      -[ICStoreArtworkInfo _sortResponseArray](v13, "_sortResponseArray");
      -[ICStoreArtworkInfo _sortSupportedSizesArray](v13, "_sortSupportedSizesArray");
      v14 = objc_alloc_init(ICStoreArtworkSizeInfo);
      sizeInfo = v13->_sizeInfo;
      v13->_sizeInfo = v14;

      -[ICStoreArtworkSizeInfo setType:](v13->_sizeInfo, "setType:", 2);
      -[ICStoreArtworkSizeInfo setSupportedSizes:](v13->_sizeInfo, "setSupportedSizes:", v13->_sortedSupportedSizesArray);
    }
    self = v13;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (ICStoreArtworkInfo)initWithArtworkURL:(id)a3
{
  id v4;
  ICStoreArtworkInfo *v5;
  uint64_t v6;
  NSURL *artworkURL;
  ICStoreArtworkSizeInfo *v8;
  ICStoreArtworkSizeInfo *sizeInfo;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICStoreArtworkInfo;
  v5 = -[ICStoreArtworkInfo init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v6;

    v8 = objc_alloc_init(ICStoreArtworkSizeInfo);
    sizeInfo = v5->_sizeInfo;
    v5->_sizeInfo = v8;

    -[ICStoreArtworkSizeInfo setType:](v5->_sizeInfo, "setType:", 0);
  }

  return v5;
}

- (ICStoreArtworkInfo)initWithArtworkResponseValue:(id)a3
{
  id v4;
  ICStoreArtworkInfo *v5;
  ICStoreArtworkInfo *v6;
  void *v8;

  v4 = a3;
  if (_NSIsNSDictionary())
  {
    v5 = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:](self, "initWithArtworkResponseDictionary:", v4);
LABEL_5:
    self = v5;
    v6 = self;
    goto LABEL_6;
  }
  if (_NSIsNSArray())
  {
    v5 = -[ICStoreArtworkInfo initWithArtworkResponseArray:](self, "initWithArtworkResponseArray:", v4);
    goto LABEL_5;
  }
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      self = -[ICStoreArtworkInfo initWithArtworkURL:](self, "initWithArtworkURL:", v8);
      v6 = self;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ICStoreArtworkInfo *v4;
  ICStoreArtworkInfo *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;

  v4 = (ICStoreArtworkInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[ICStoreArtworkInfo isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[ICStoreArtworkInfo sizeInfo](self, "sizeInfo");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[ICStoreArtworkInfo sizeInfo](v5, "sizeInfo");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if ((v9 & 1) == 0)
          goto LABEL_15;
      }
      -[ICStoreArtworkInfo artworkURL](self, "artworkURL");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[ICStoreArtworkInfo artworkURL](v5, "artworkURL");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = v12;
        v14 = objc_msgSend(v11, "isEqual:", v12);

        if ((v14 & 1) == 0)
          goto LABEL_15;
      }
      -[ICStoreArtworkInfo responseDictionary](self, "responseDictionary");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[ICStoreArtworkInfo responseDictionary](v5, "responseDictionary");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
      {

      }
      else
      {
        v17 = v16;
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if ((v18 & 1) == 0)
        {
LABEL_15:
          v10 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      -[ICStoreArtworkInfo responseArray](self, "responseArray");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStoreArtworkInfo responseArray](v5, "responseArray");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 == v20)
        v10 = 1;
      else
        v10 = objc_msgSend(v19, "isEqual:", v20);

      goto LABEL_21;
    }
    v10 = 0;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ICStoreArtworkSizeInfo *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSURL *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSDictionary *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t data;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v87 = __ROR8__(v14 + v13, 32);
  v92 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v82 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_sizeInfo;
  v19 = -[ICStoreArtworkSizeInfo hash](v18, "hash");
  v20 = (v17 + v82) ^ __ROR8__(v82, 51);
  v21 = v87 + (v92 ^ v19);
  v22 = __ROR8__(v92 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v82, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v88 = __ROR8__(v25, 32);
  v93 = v24;
  v78 = v23 ^ v19;
  v83 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_artworkURL;
  data = -[NSURL hash](v26, "hash");
  v27 = (v78 + v83) ^ __ROR8__(v83, 51);
  v28 = v88 + (v93 ^ data);
  v29 = __ROR8__(v93 ^ data, 48);
  v30 = (v28 ^ v29) + __ROR8__(v78 + v83, 32);
  v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  v32 = v28 + v27;
  v89 = __ROR8__(v32, 32);
  v94 = v31;
  v79 = v30 ^ data;
  v84 = v32 ^ __ROR8__(v27, 47);

  v33 = self->_responseDictionary;
  v34 = -[NSDictionary hash](v33, "hash");
  v35 = (v79 + v84) ^ __ROR8__(v84, 51);
  v36 = v89 + (v94 ^ v34);
  v37 = __ROR8__(v94 ^ v34, 48);
  v38 = (v36 ^ v37) + __ROR8__(v79 + v84, 32);
  v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
  v40 = v36 + v35;
  v90 = __ROR8__(v40, 32);
  v95 = v39;
  v80 = v38 ^ v34;
  v85 = v40 ^ __ROR8__(v35, 47);

  v41 = self->_responseArray;
  v42 = -[NSArray hash](v41, "hash");
  v43 = (v80 + v85) ^ __ROR8__(v85, 51);
  v44 = v90 + (v95 ^ v42);
  v45 = __ROR8__(v95 ^ v42, 48);
  v46 = (v44 ^ v45) + __ROR8__(v80 + v85, 32);
  v47 = v46 ^ __ROR8__(v44 ^ v45, 43);
  v48 = v44 + v43;
  v91 = __ROR8__(v48, 32);
  v96 = v47;
  v81 = v46 ^ v42;
  v86 = v48 ^ __ROR8__(v43, 47);

  v49 = (v81 + v86) ^ __ROR8__(v86, 51);
  v50 = v91 + (v96 ^ 0x2800000000000000);
  v51 = __ROR8__(v96 ^ 0x2800000000000000, 48);
  v52 = (v50 ^ v51) + __ROR8__(v81 + v86, 32);
  v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
  v54 = v50 + v49;
  v55 = v54 ^ __ROR8__(v49, 47);
  v56 = (v52 ^ 0x2800000000000000) + v55;
  v57 = v56 ^ __ROR8__(v55, 51);
  v58 = (__ROR8__(v54, 32) ^ 0xFFLL) + v53;
  v59 = __ROR8__(v53, 48);
  v60 = __ROR8__(v56, 32) + (v58 ^ v59);
  v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
  v62 = v57 + v58;
  v63 = v62 ^ __ROR8__(v57, 47);
  v64 = v63 + v60;
  v65 = v64 ^ __ROR8__(v63, 51);
  v66 = __ROR8__(v62, 32) + v61;
  v67 = __ROR8__(v61, 48);
  v68 = __ROR8__(v64, 32) + (v66 ^ v67);
  v69 = v68 ^ __ROR8__(v66 ^ v67, 43);
  v70 = v65 + v66;
  v71 = v70 ^ __ROR8__(v65, 47);
  v72 = v71 + v68;
  v73 = v72 ^ __ROR8__(v71, 51);
  v74 = __ROR8__(v70, 32) + v69;
  v75 = __ROR8__(v69, 48);
  v76 = __ROR8__(v72, 32) + (v74 ^ v75);
  return (v73 + v74) ^ __ROR8__(v73, 47) ^ v76 ^ __ROR8__(v73 + v74, 32) ^ v76 ^ __ROR8__(v74 ^ v75, 43);
}

- (ICStoreArtworkInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICStoreArtworkInfo *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("responseArray"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[ICStoreArtworkInfo initWithArtworkResponseArray:](self, "initWithArtworkResponseArray:", v5);
    v6 = self;
  }
  else
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("responseDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      self = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:](self, "initWithArtworkResponseDictionary:", v7);
      v6 = self;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkURL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        self = -[ICStoreArtworkInfo initWithArtworkURL:](self, "initWithArtworkURL:", v8);
        v6 = self;
      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *responseArray;
  id v5;

  responseArray = self->_responseArray;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", responseArray, CFSTR("responseArray"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseDictionary, CFSTR("responseDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkURL, CFSTR("artworkURL"));

}

- (NSURL)artworkURL
{
  NSURL *artworkURL;
  uint64_t v4;
  void *v5;
  void *v7;

  artworkURL = self->_artworkURL;
  if (artworkURL)
  {
    v4 = -[NSURL copy](artworkURL, "copy");
LABEL_5:
    v5 = (void *)v4;
    return (NSURL *)v5;
  }
  if (self->_responseDictionary)
  {
    -[ICStoreArtworkInfo originalSize](self, "originalSize");
    -[ICStoreArtworkInfo artworkURLWithSize:cropStyle:format:](self, "artworkURLWithSize:cropStyle:format:", CFSTR("sr"), CFSTR("jpg"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (self->_responseArray)
  {
    -[ICStoreArtworkInfo sizeInfo](self, "sizeInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maxSupportedSize");
    -[ICStoreArtworkInfo artworkURLWithSize:cropStyle:format:](self, "artworkURLWithSize:cropStyle:format:", CFSTR("sr"), CFSTR("jpg"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSURL *)v5;
}

- (id)artworkURLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5
{
  return -[ICStoreArtworkInfo artworkURLWithSize:cropStyle:format:preferP3ColorSpace:](self, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", a4, a5, 0, a3.width, a3.height);
}

- (unint64_t)imageTraits
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("imageTraits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (_NSIsNSString()
            && objc_msgSend(v9, "isEqualToString:", CFSTR("hasTitle"), (_QWORD)v11))
          {
            v6 = 1;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)textGradient
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("textGradient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__ICStoreArtworkInfo_textGradient__block_invoke;
    v6[3] = &unk_1E438B870;
    v6[4] = self;
    objc_msgSend(v3, "msv_compactMap:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (ICStoreArtworkGradientInfo)gradientInfo
{
  void *v3;
  ICStoreArtworkGradientInfo *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("gradient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v4 = objc_alloc_init(ICStoreArtworkGradientInfo);
    objc_msgSend(v3, "objectForKey:", CFSTR("color"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      -[ICStoreArtworkGradientInfo setColor:](v4, "setColor:", -[ICStoreArtworkInfo colorFromStringRepresentation:](self, "colorFromStringRepresentation:", v5));
    objc_msgSend(v3, "objectForKey:", CFSTR("y1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[ICStoreArtworkGradientInfo setY1:](v4, "setY1:");
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("y2"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[ICStoreArtworkGradientInfo setY2:](v4, "setY2:");
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_sortResponseArray
{
  uint64_t v3;
  void *v4;
  id v5;

  -[NSArray sortedArrayUsingComparator:](self->_responseArray, "sortedArrayUsingComparator:", &__block_literal_global_10665);
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)&self->_sortedResponseArray, v4);

}

- (void)_sortSupportedSizesArray
{
  ICStoreArtworkInfo *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  float v14;
  void *v15;
  NSArray *v16;
  NSArray *sortedSupportedSizesArray;
  void *v18;
  ICStoreArtworkInfo *v19;
  NSArray *v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x1E0C80C00];
  -[ICStoreArtworkInfo sortedResponseArray](self, "sortedResponseArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v19 = v2;
    v20 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", CFSTR("width"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("height"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v21 = 0.0;
            v22 = 0.0;
            objc_msgSend(v10, "floatValue");
            v13 = v12;
            objc_msgSend(v11, "floatValue");
            v21 = v13;
            v22 = v14;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v21, "{CGSize=dd}");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v20, "addObject:", v15);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v3 = v18;
    v2 = v19;
    v16 = v20;
  }
  else
  {
    v16 = 0;
  }
  sortedSupportedSizesArray = v2->_sortedSupportedSizesArray;
  v2->_sortedSupportedSizesArray = v16;

}

- (NSArray)sortedResponseArray
{
  return self->_sortedResponseArray;
}

- (void)setSortedResponseArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)sortedSupportedSizesArray
{
  return self->_sortedSupportedSizesArray;
}

- (void)setSortedSupportedSizesArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)responseArray
{
  return self->_responseArray;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

uint64_t __40__ICStoreArtworkInfo__sortResponseArray__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("width"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v6 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("height"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v7 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("width"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v8 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("height"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v9 = 0;
  }
  objc_msgSend(v6, "doubleValue");
  v11 = v10;
  objc_msgSend(v7, "doubleValue");
  v13 = (v11 + v12) * 0.5;
  objc_msgSend(v8, "doubleValue");
  v15 = v14;
  objc_msgSend(v9, "doubleValue");
  v17 = (v15 + v16) * 0.5;
  v18 = vabdd_f64(v13, v17);
  v19 = -1;
  if (v13 >= v17)
    v19 = 1;
  if (v18 <= 0.00000011920929)
    v20 = 0;
  else
    v20 = v19;

  return v20;
}

uint64_t __34__ICStoreArtworkInfo_textGradient__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "colorFromStringRepresentation:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
