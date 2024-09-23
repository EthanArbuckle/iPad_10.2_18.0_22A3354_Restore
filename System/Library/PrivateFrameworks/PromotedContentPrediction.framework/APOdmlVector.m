@implementation APOdmlVector

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  APOdmlVector *v4;
  APOdmlVector *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int isEqualToString;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char isEqualToData;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  BOOL v27;
  BOOL v28;

  v4 = (APOdmlVector *)a3;
  if (v4 == self)
  {
    v28 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_version(self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v8, v12, (uint64_t)v11);

      objc_msgSend_data(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v5, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v16, v20, (uint64_t)v19);

      v24 = objc_msgSend_length(self, v22, v23);
      if (v24 == objc_msgSend_length(v5, v25, v26))
        v27 = isEqualToData;
      else
        v27 = 0;
      if (isEqualToString)
        v28 = v27;
      else
        v28 = 0;

    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;

  objc_msgSend_version(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  v10 = objc_msgSend_length(self, v8, v9);
  objc_msgSend_data(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7 ^ objc_msgSend_hash(v13, v14, v15) ^ v10;

  return v16;
}

- (APOdmlVector)initWithVersion:(id)a3 length:(unsigned int)a4 floats:(float *)a5
{
  id v9;
  APOdmlVector *v10;
  float *v11;
  APOdmlVector *v12;
  NSObject *v13;
  void *v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APOdmlVector;
  v10 = -[APOdmlVector init](&v17, sel_init);
  if (!v10)
    goto LABEL_4;
  v11 = (float *)malloc_type_malloc(4 * a4, 0x6F2D36FBuLL);
  v10->_dataPtr = v11;
  if (v11)
  {
    memcpy(v11, a5, 4 * a4);
    v10->_length = a4;
    objc_storeStrong((id *)&v10->_version, a3);
LABEL_4:
    v12 = v10;
    goto LABEL_8;
  }
  OdmlLogForCategory(2uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    v20 = 1024;
    v21 = 4 * a4;
    v15 = v14;
    _os_log_impl(&dword_1B69D6000, v13, OS_LOG_TYPE_ERROR, "[%@] ERROR: Could not alloc space of %ul", buf, 0x12u);

  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (APOdmlVector)initWithVersion:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  unsigned int v12;
  void *v13;
  const char *v14;
  APOdmlVector *v15;
  NSObject *v16;
  void *v17;
  id v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)APOdmlVector;
  v11 = -[APOdmlVector init](&v20, sel_init);
  if (!v11)
    goto LABEL_4;
  v12 = objc_msgSend_length(v8, v9, v10);
  v13 = malloc_type_malloc(v12, 0xEB7B0FE3uLL);
  *((_QWORD *)v11 + 1) = v13;
  if (v13)
  {
    *((_DWORD *)v11 + 4) = v12 >> 2;
    objc_storeStrong((id *)v11 + 3, a3);
    objc_msgSend_getBytes_range_(v8, v14, *((_QWORD *)v11 + 1), 0, v12);
LABEL_4:
    v15 = (APOdmlVector *)v11;
    goto LABEL_8;
  }
  OdmlLogForCategory(2uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v22 = v17;
    v23 = 1024;
    v24 = v12;
    v18 = v17;
    _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_ERROR, "[%@] ERROR: Could not alloc space of %ul", buf, 0x12u);

  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (APOdmlVector)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  APOdmlVector *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_objectForKey_ofKindOfClass_(v4, v6, (uint64_t)CFSTR("vector"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend_objectForKey_ofKindOfClass_(v4, v9, (uint64_t)CFSTR("version"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_copy(v10, v11, v12);

  if (v7)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (v15)
  {
    OdmlLogForCategory(2uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 138413058;
      v21 = (id)objc_opt_class();
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v7;
      v26 = 2112;
      v27 = v4;
      v17 = v21;
      _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_ERROR, "[%@] ERROR: Invalid dictionary\nVersion:\t%@\nVector:\t%@\nDict:\t%@", (uint8_t *)&v20, 0x2Au);

    }
    v18 = 0;
  }
  else
  {
    self = (APOdmlVector *)(id)objc_msgSend_initWithVersion_andArray_(self, v14, (uint64_t)v13, v7);
    v18 = self;
  }

  return v18;
}

- (APOdmlVector)initWithVersion:(id)a3 andArray:(id)a4
{
  id v6;
  id v7;
  APOdmlVector *v8;
  const char *v9;
  APOdmlVector *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  APOdmlVector *v17;
  NSObject *v18;
  void *v19;
  NSString *version;
  id v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)APOdmlVector;
  v8 = -[APOdmlVector init](&v23, sel_init);
  v10 = v8;
  if (v8
    && (v8->_dataPtr = (float *)objc_msgSend__createDataPtrFromArray_(v8, v9, (uint64_t)v7),
        v10->_length = objc_msgSend_count(v7, v11, v12),
        v15 = objc_msgSend_copy(v6, v13, v14),
        v16 = v10->_version,
        v10->_version = (NSString *)v15,
        v16,
        !v10->_version))
  {
    OdmlLogForCategory(2uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      version = v10->_version;
      *(_DWORD *)buf = 138412802;
      v25 = v19;
      v26 = 2112;
      v27 = version;
      v28 = 2112;
      v29 = v7;
      v21 = v19;
      _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_ERROR, "[%@] ERROR: Invalid initializer\nVersion:\t%@\nVector:\t%@", buf, 0x20u);

    }
    v17 = 0;
  }
  else
  {
    v17 = v10;
  }

  return v17;
}

- (APOdmlVector)initWithCoder:(id)a3
{
  id v4;
  APOdmlVector *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APOdmlVector;
  v5 = -[APOdmlVector init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, CFSTR("vector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataPtr = (float *)objc_msgSend__createDataPtrFromArray_(v5, v9, (uint64_t)v8);
    v5->_length = objc_msgSend_count(v8, v10, v11);
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, CFSTR("version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVersion_(v5, v15, (uint64_t)v14);

  }
  return v5;
}

- (id)_initWithVersion:(id)a3 length:(unsigned int)a4 rawMallocedFloats:(float *)a5
{
  id v9;
  APOdmlVector *v10;
  APOdmlVector *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APOdmlVector;
  v10 = -[APOdmlVector init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_dataPtr = a5;
    v10->_length = a4;
    objc_storeStrong((id *)&v10->_version, a3);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v4 = a3;
  objc_msgSend_arrayOfNumbers(self, v5, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)v12, CFSTR("vector"));
  objc_msgSend_version(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v10, CFSTR("version"));

}

- (void)dealloc
{
  float *dataPtr;
  objc_super v4;

  dataPtr = self->_dataPtr;
  if (dataPtr)
    free(dataPtr);
  v4.receiver = self;
  v4.super_class = (Class)APOdmlVector;
  -[APOdmlVector dealloc](&v4, sel_dealloc);
}

- (void)setDataPtr:(float *)a3
{
  float *dataPtr;

  dataPtr = self->_dataPtr;
  if (dataPtr)
    free(dataPtr);
  self->_dataPtr = a3;
}

- (float)_createDataPtrFromArray:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  size_t v7;
  const char *v8;
  uint64_t v9;
  float *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  uint64_t v19;
  float *v20;
  uint64_t v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v6 = v3;
  if (v3 && (v7 = 4 * objc_msgSend_count(v3, v4, v5)) != 0)
  {
    v10 = (float *)malloc_type_malloc(v7, 0x1F4B7942uLL);
    if (v10)
    {
      v11 = objc_msgSend_count(v6, v8, v9);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v6;
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, v28, 16);
      if (v14)
      {
        v17 = v14;
        v18 = &v10[v11];
        v19 = *(_QWORD *)v25;
        v20 = v10;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v12);
            if (v20 < v18)
            {
              objc_msgSend_floatValue(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v21), v15, v16, (_QWORD)v24);
              *(_DWORD *)v20++ = v22;
            }
            ++v21;
          }
          while (v17 != v21);
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, v28, 16);
        }
        while (v17);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)arrayOfNumbers
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend_initWithCapacity_(v3, v4, self->_length);
  if (self->_length)
  {
    v9 = 0;
    do
    {
      *(float *)&v8 = self->_dataPtr[v9];
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v5, v6, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v11, (uint64_t)v10);

      ++v9;
    }
    while (v9 < self->_length);
  }
  v12 = (void *)objc_msgSend_copy(v7, v5, v6);

  return v12;
}

- (void)setArrayOfNumber:(id)a3
{
  id v4;
  const char *v5;
  uint64_t DataPtrFromArray;
  const char *v7;
  const char *v8;
  uint64_t v9;
  unsigned int v10;

  v4 = a3;
  DataPtrFromArray = objc_msgSend__createDataPtrFromArray_(self, v5, (uint64_t)v4);
  objc_msgSend_setDataPtr_(self, v7, DataPtrFromArray);
  v10 = objc_msgSend_count(v4, v8, v9);

  self->_length = v10;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  NSString *version;
  void *v10;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dataPtr)
  {
    objc_msgSend_arrayOfNumbers(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, CFSTR("vector"));

  }
  version = self->_version;
  if (version)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)version, CFSTR("version"));
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v4, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSData)data
{
  uint64_t v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  float *dataPtr;
  void *v9;
  void *v10;

  v3 = 4 * self->_length;
  v4 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v6 = (void *)objc_msgSend_initWithCapacity_(v4, v5, 4 * v3);
  v9 = v6;
  if ((_DWORD)v3)
  {
    dataPtr = self->_dataPtr;
    if (dataPtr)
      objc_msgSend_appendBytes_length_(v6, v7, (uint64_t)dataPtr, v3);
  }
  v10 = (void *)objc_msgSend_copy(v9, v7, (uint64_t)dataPtr);

  return (NSData *)v10;
}

- (id)scalarMultiply:(float)a3
{
  float *v4;
  float *v5;
  APOdmlVector *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  float __B;

  __B = a3;
  v4 = (float *)malloc_type_malloc(4 * self->_length, 0x5E1537BFuLL);
  if (!v4)
    return 0;
  v5 = v4;
  vDSP_vsmul(self->_dataPtr, 1, &__B, v4, 1, self->_length);
  v6 = [APOdmlVector alloc];
  objc_msgSend_version(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend__initWithVersion_length_rawMallocedFloats_(v6, v10, (uint64_t)v9, self->_length, v5);

  return v11;
}

- (float)dotProduct:(id)a3
{
  const float **v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  float v15;
  int v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (const float **)a3;
  objc_msgSend_version(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  v15 = 0.0;
  if (!v12)
  {
    v16 = objc_msgSend_length(self, v13, v14);
    if (v16 == objc_msgSend_length(v4, v17, v18))
    {
      v27 = 0;
      vDSP_dotpr(self->_dataPtr, 1, v4[1], 1, (float *)&v27, self->_length);
      v15 = *(float *)&v27;
    }
    else
    {
      OdmlLogForCategory(2uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_opt_class();
        v21 = v20;
        v27 = 138412802;
        v28 = v20;
        v29 = 2048;
        v30 = objc_msgSend_length(self, v22, v23);
        v31 = 2048;
        v32 = objc_msgSend_length(v4, v24, v25);
        _os_log_impl(&dword_1B69D6000, v19, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Dot Product) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v27, 0x20u);

      }
    }
  }

  return v15;
}

- (id)vectorAdd:(id)a3
{
  const float **v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unsigned int length;
  float *v16;
  float *v17;
  APOdmlVector *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  APOdmlVector *v23;
  NSObject *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (const float **)a3;
  objc_msgSend_version(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  if (v12)
  {
LABEL_8:
    v23 = self;
    goto LABEL_9;
  }
  length = self->_length;
  if (length != objc_msgSend_length(v4, v13, v14))
  {
    OdmlLogForCategory(2uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_opt_class();
      v26 = v25;
      v32 = 138412802;
      v33 = v25;
      v34 = 2048;
      v35 = objc_msgSend_length(self, v27, v28);
      v36 = 2048;
      v37 = objc_msgSend_length(v4, v29, v30);
      _os_log_impl(&dword_1B69D6000, v24, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Vector Add) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v32, 0x20u);

    }
    goto LABEL_8;
  }
  v16 = (float *)malloc_type_malloc(4 * self->_length, 0xD77119D0uLL);
  if (v16)
  {
    v17 = v16;
    vDSP_vadd(self->_dataPtr, 1, v4[1], 1, v16, 1, self->_length);
    v18 = [APOdmlVector alloc];
    objc_msgSend_version(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (APOdmlVector *)objc_msgSend__initWithVersion_length_rawMallocedFloats_(v18, v22, (uint64_t)v21, self->_length, v17);

  }
  else
  {
    v23 = 0;
  }
LABEL_9:

  return v23;
}

- (id)vectorSubtract:(id)a3
{
  const float **v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  float *v18;
  float *v19;
  APOdmlVector *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  APOdmlVector *v25;
  NSObject *v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  int v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (const float **)a3;
  objc_msgSend_version(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  if (v12)
  {
LABEL_8:
    v25 = self;
    goto LABEL_9;
  }
  v15 = objc_msgSend_length(self, v13, v14);
  if (v15 != objc_msgSend_length(v4, v16, v17))
  {
    OdmlLogForCategory(2uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_opt_class();
      v28 = v27;
      v34 = 138412802;
      v35 = v27;
      v36 = 2048;
      v37 = objc_msgSend_length(self, v29, v30);
      v38 = 2048;
      v39 = objc_msgSend_length(v4, v31, v32);
      _os_log_impl(&dword_1B69D6000, v26, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Vector Subtract) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v34, 0x20u);

    }
    goto LABEL_8;
  }
  v18 = (float *)malloc_type_malloc(4 * self->_length, 0xC9564264uLL);
  if (v18)
  {
    v19 = v18;
    vDSP_vsub(v4[1], 1, self->_dataPtr, 1, v18, 1, self->_length);
    v20 = [APOdmlVector alloc];
    objc_msgSend_version(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (APOdmlVector *)objc_msgSend__initWithVersion_length_rawMallocedFloats_(v20, v24, (uint64_t)v23, self->_length, v19);

  }
  else
  {
    v25 = 0;
  }
LABEL_9:

  return v25;
}

- (float)magnitude
{
  uint64_t v2;
  float *dataPtr;
  unsigned int v4;
  float __C;

  __C = 0.0;
  dataPtr = self->_dataPtr;
  v4 = objc_msgSend_length(self, a2, v2);
  vDSP_svesq(dataPtr, 1, &__C, v4);
  return sqrtf(__C);
}

- (id)cosineSimilarity:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  float v20;
  float v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  float v25;
  float v26;
  const char *v27;
  uint64_t v28;
  double v29;
  float v30;
  NSObject *v32;
  id v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  int v45;
  id v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_version(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  if (v12)
    goto LABEL_17;
  v15 = objc_msgSend_length(self, v13, v14);
  if (v15 != objc_msgSend_length(v4, v16, v17))
  {
    OdmlLogForCategory(2uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_opt_class();
      v38 = v37;
      v45 = 138412802;
      v46 = v37;
      v47 = 2048;
      *(_QWORD *)&v48 = objc_msgSend_length(self, v39, v40);
      v49 = 2048;
      *(_QWORD *)&v50 = objc_msgSend_length(v4, v41, v42);
      _os_log_impl(&dword_1B69D6000, v32, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Cosine Similarity) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v45, 0x20u);

    }
    goto LABEL_16;
  }
  objc_msgSend_magnitude(self, v18, v19);
  v21 = v20;
  objc_msgSend_magnitude(v4, v22, v23);
  v26 = v25;
  if (v21 != 0.0 && v25 != 0.0)
  {
    objc_msgSend_dotProduct_(self, v24, (uint64_t)v4);
    v30 = *(float *)&v29 / (float)(v21 * v26);
    if (v30 >= -1.0 && v30 <= 1.0)
    {
      *(float *)&v29 = v30;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v27, v28, v29);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    OdmlLogForCategory(2uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v45 = 138412546;
    v46 = (id)objc_opt_class();
    v47 = 2048;
    v48 = v30;
    v33 = v46;
    v34 = "[%@] ERROR: Cosine Similarity is out of bounds: %f";
    v35 = v32;
    v36 = 22;
    goto LABEL_15;
  }
  OdmlLogForCategory(2uLL);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v45 = 138412802;
    v46 = (id)objc_opt_class();
    v47 = 2048;
    v48 = v21;
    v49 = 2048;
    v50 = v26;
    v33 = v46;
    v34 = "[%@] ERROR: We are going to divide by zero:\nOur Magnitude:\t%f\nVec Magnitude:\t%f";
    v35 = v32;
    v36 = 32;
LABEL_15:
    _os_log_impl(&dword_1B69D6000, v35, OS_LOG_TYPE_ERROR, v34, (uint8_t *)&v45, v36);

  }
LABEL_16:

LABEL_17:
  v43 = 0;
LABEL_18:

  return v43;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (unsigned)length
{
  return self->_length;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

@end
