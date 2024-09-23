@implementation PFAssetAdjustments

- (PFAssetAdjustments)initWithURL:(id)a3
{
  void *v4;
  PFAssetAdjustments *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[PFAssetAdjustments initWithPropertyListDictionary:](self, "initWithPropertyListDictionary:", v4);
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (PFAssetAdjustments)initWithPropertyListDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PFAssetAdjustments *v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentFormatIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentFormatVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentBaseVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentRenderTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v13.receiver = self;
    v13.super_class = (Class)PFAssetAdjustments;
    v9 = -[PFAssetAdjustments init](&v13, sel_init);
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v4, "copy");

        v4 = (id)v10;
      }
      -[PFAssetAdjustments setPropertyListDictionary:](v9, "setPropertyListDictionary:", v4);
      v11 = -[PFAssetAdjustments adjustmentTimestamp](v9, "adjustmentTimestamp");
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPropertyListDictionary:", v4);

  return v5;
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSDate *adjustmentTimestamp;
  char v10;

  v4 = a4;
  v6 = a3;
  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  adjustmentTimestamp = self->_adjustmentTimestamp;
  if (adjustmentTimestamp)
    objc_msgSend(v8, "setValue:forKey:", adjustmentTimestamp, CFSTR("adjustmentTimestamp"));
  v10 = objc_msgSend(v8, "writeToURL:atomically:", v6, v4);

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[PFAssetAdjustments adjustmentData](self, "adjustmentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v10.receiver = self;
  v10.super_class = (Class)PFAssetAdjustments;
  -[PFAssetAdjustments description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAssetAdjustments adjustmentFormatIdentifier](self, "adjustmentFormatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAssetAdjustments adjustmentFormatVersion](self, "adjustmentFormatVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@, %@ (%lu bytes), %@"), v6, v7, v4, self->_adjustmentTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PFAssetAdjustments deserializedAdjustmentDataWithError:](self, "deserializedAdjustmentDataWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("adjustmentData"));
  v9.receiver = self;
  v9.super_class = (Class)PFAssetAdjustments;
  -[PFAssetAdjustments description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)propertyListDictionary
{
  return self->_propertyListDictionary;
}

- (void)setPropertyListDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_propertyListDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyListDictionary, 0);
  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
}

- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6
{
  return -[PFAssetAdjustments initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:](self, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:", a3, a4, a5, a6, 0);
}

- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6 editorBundleID:(id)a7
{
  return -[PFAssetAdjustments initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:](self, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", a3, a4, a5, a6, a7, 0);
}

- (PFAssetAdjustments)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 data:(id)a5 baseVersion:(int64_t)a6 editorBundleID:(id)a7 renderTypes:(unsigned int)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PFAssetAdjustments *v22;

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v14)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("adjustmentFormatIdentifier"));
  if (v15)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("adjustmentFormatVersion"));
  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("adjustmentData"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("adjustmentBaseVersion"));

  if (v17)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("adjustmentEditorBundleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("adjustmentRenderTypes"));

  v22 = -[PFAssetAdjustments initWithPropertyListDictionary:](self, "initWithPropertyListDictionary:", v19);
  return v22;
}

- (NSString)adjustmentFormatIdentifier
{
  void *v2;
  void *v3;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("adjustmentFormatIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)adjustmentFormatVersion
{
  void *v2;
  void *v3;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("adjustmentFormatVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)adjustmentData
{
  void *v2;
  void *v3;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("adjustmentData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (int64_t)adjustmentBaseVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("adjustmentBaseVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (NSString)editorBundleID
{
  void *v2;
  void *v3;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("adjustmentEditorBundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)adjustmentRenderTypes
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("adjustmentRenderTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (NSDate)adjustmentTimestamp
{
  NSDate *adjustmentTimestamp;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  adjustmentTimestamp = self->_adjustmentTimestamp;
  if (!adjustmentTimestamp)
  {
    -[PFAssetAdjustments propertyListDictionary](self, "propertyListDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentTimestamp"));
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_adjustmentTimestamp;
    self->_adjustmentTimestamp = v5;

    adjustmentTimestamp = self->_adjustmentTimestamp;
  }
  return adjustmentTimestamp;
}

- (void)setAdjustmentTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentTimestamp, a3);
}

- (id)deserializedAdjustmentDataWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[PFAssetAdjustments adjustmentData](self, "adjustmentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D68];
    v32[0] = CFSTR("No adjustment data to deserialize");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500200, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adjustment data is an invalid type: %@"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500201, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a3)
      *a3 = objc_retainAutorelease(v14);

LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  -[PFAssetAdjustments adjustmentFormatIdentifier](self, "adjustmentFormatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.photo"));

  if (v7)
  {
    -[PFAssetAdjustments _deserializedPhotosAdjustmentDataWithError:](self, "_deserializedPhotosAdjustmentDataWithError:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v8 = v17;
    }
    else
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v26);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v26;
      v20 = v19;
      if (v8)
      {
        v21 = v8;
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        if (v19)
        {
          v27 = *MEMORY[0x1E0CB3388];
          v28 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500203, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (a3)
          *a3 = objc_retainAutorelease(v24);

        if (v20)
      }

    }
  }
LABEL_11:

  return v8;
}

- (id)_deserializedPhotosAdjustmentDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[PFAssetAdjustments adjustmentData](self, "adjustmentData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  +[PFZlibDataCompression decompressData:options:error:](PFZlibDataCompression, "decompressData:options:error:", v4, 0, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  v7 = v6;
  if (v5)
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;

    if (v8)
    {
      v10 = v8;
      v7 = v9;
      v11 = v10;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      if (v9)
      {
        v22 = *MEMORY[0x1E0CB3388];
        v23 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500203, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a3)
        *a3 = objc_retainAutorelease(v17);

      if (v9)
      {

        v10 = 0;
        v11 = 0;
        v7 = v9;
      }
      else
      {
        v10 = 0;
        v7 = 0;
        v11 = 0;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  if (v6)
  {
    v24 = *MEMORY[0x1E0CB3388];
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500202, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a3)
    *a3 = objc_retainAutorelease(v15);

  v11 = 0;
  if (v7)
    goto LABEL_19;
LABEL_20:

  return v11;
}

+ (BOOL)adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:(id)a3 predictedSize:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Adjustments.data"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "fileExistsAtPath:", v10) & 1) != 0)
  {
    objc_msgSend(v6, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "fileExistsAtPath:", v11);

    if (a4 && v12)
    {
      v16 = 0;
      objc_msgSend(a1, "dataForOverflowDataReassembledAdjustmentsPropertyListAtURL:error:", v6, &v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        *a4 = objc_msgSend(v13, "length");

      LOBYTE(v12) = 1;
    }
  }
  else
  {

    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (id)dataForOverflowDataReassembledAdjustmentsPropertyListAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 0, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (v7)
  {
    v23 = 0;
    v24 = 100;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, &v24, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;

    if (v9)
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Adjustments.data"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v10;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v11, 0, &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v22;

      if (v12)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("adjustmentData"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v14 || (objc_msgSend(v14, "isEqual:", v12) & 1) == 0)
        {
          v16 = (void *)objc_msgSend(v9, "mutableCopy");
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("adjustmentData"));

          v9 = v16;
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_15:
          v21 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, v24, 0, &v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v21;

          if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v10;
            _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize adjustment dictionary: %@", buf, 0xCu);
          }

          goto LABEL_19;
        }
        objc_msgSend(v11, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v15;
        v28 = 2112;
        v29 = v13;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to read adjustment overflow data file %@: %@", buf, 0x16u);
      }

      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v10;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to deserialize adjustment property list at %@: %@", buf, 0x16u);

      if (a4)
        goto LABEL_13;
    }
    else if (a4)
    {
LABEL_13:
      v10 = objc_retainAutorelease(v10);
      v17 = 0;
      *a4 = v10;
LABEL_19:
      v8 = v10;
      goto LABEL_20;
    }
    v17 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v19;
    v28 = 2112;
    v29 = v8;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to read adjustment property list at %@: %@", buf, 0x16u);

    if (a4)
      goto LABEL_10;
LABEL_22:
    v17 = 0;
    goto LABEL_20;
  }
  if (!a4)
    goto LABEL_22;
LABEL_10:
  v8 = objc_retainAutorelease(v8);
  v17 = 0;
  *a4 = v8;
LABEL_20:

  return v17;
}

+ (BOOL)writeReassembleAdjustmentsPropertyListAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18 = 0;
  objc_msgSend(a1, "dataForOverflowDataReassembledAdjustmentsPropertyListAtURL:error:", v8, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v12;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to reassemble adjustment property list %@: %@", buf, 0x16u);
    }
    v14 = v12;
    if (a5)
      goto LABEL_10;
    goto LABEL_12;
  }
  v17 = v11;
  v13 = objc_msgSend(v10, "writeToURL:options:error:", v9, 0, &v17);
  v14 = v17;

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v9;
      v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to write reassembled adjustment property list data %@: %@", buf, 0x16u);
      if (a5)
        goto LABEL_10;
    }
    else if (a5)
    {
LABEL_10:
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a5 = v14;
      goto LABEL_13;
    }
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v15 = 1;
LABEL_13:

  return v15;
}

+ (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v4 = a3;
    v5 = MMCSSignatureGeneratorCreate();
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");

    MEMORY[0x1A1B0C6F8](v5, v7, v8, 1);
    v9 = MMCSSignatureGeneratorFinish();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v9, MEMORY[0x1A1B0C6C8](v9), 1);
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)fingerPrintForFileDescriptor:(int)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  v4 = (void *)MMCSSignatureCreateFromFileDescriptor();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, MEMORY[0x1A1B0C6C8](v4), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)fingerprintWithAssetAdjustmentFingerprintData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;

  v4 = a3;
  if (!v4)
  {
    v20 = 0;
    goto LABEL_27;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v4, "adjustmentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "adjustmentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v8);

  }
  objc_msgSend(v4, "adjustmentCompoundVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "adjustmentCompoundVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v11);

  }
  objc_msgSend(v4, "adjustmentCreatorCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "adjustmentCreatorCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v14);

  }
  objc_msgSend(v4, "simpleAdjustmentData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "simpleAdjustmentData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v16);

  }
  if (objc_msgSend(v4, "adjustmentSourceType") != 1)
  {
    v19 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "baseImageFingerprint");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = 0;
  }
  else
  {
    objc_msgSend(v4, "baseImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(a1, "fingerPrintForData:error:", v21, &v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v37;

    if (!v18)
      goto LABEL_17;
  }
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v22);

LABEL_17:
  objc_msgSend(v4, "largeAdjustmentDataFingerprint");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    v25 = v19;
LABEL_20:
    objc_msgSend(v24, "dataUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v27);

    goto LABEL_21;
  }
  objc_msgSend(v4, "largeAdjustmentData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v19;
  objc_msgSend(a1, "fingerPrintForData:error:", v26, &v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v36;

  if (v24)
    goto LABEL_20;
LABEL_21:
  objc_msgSend(v4, "secondaryAdjustmentData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v25;
  objc_msgSend(a1, "fingerPrintForData:error:", v28, &v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v35;

  if (v29)
  {
    objc_msgSend(v29, "dataUsingEncoding:", 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v31);

  }
  if (objc_msgSend(v5, "length"))
  {
    v34 = v30;
    objc_msgSend(a1, "fingerPrintForData:error:", v5, &v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v34;

    v30 = v32;
  }
  else
  {
    v20 = 0;
  }

LABEL_27:
  return v20;
}

@end
