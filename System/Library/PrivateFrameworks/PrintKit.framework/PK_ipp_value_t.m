@implementation PK_ipp_value_t

- (PK_ipp_value_t)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PK_ipp_value_t;
  return -[PK_ipp_value_t init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->x_payload);
  return v4;
}

- (PK_ipp_value_t)initWithCoder:(id)a3
{
  id v4;
  PK_ipp_value_t *v5;
  uint64_t Class;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *x_payload;
  objc_super v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PK_ipp_value_t;
  v5 = -[PK_ipp_value_t init](&v13, sel_init);
  if (v5)
  {
    Class = (uint64_t)objc_getClass("PK_ipp_collection_t");
    if (!Class)
      Class = objc_opt_class();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v14[3] = Class;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_payload"));
    v10 = objc_claimAutoreleasedReturnValue();
    x_payload = v5->x_payload;
    v5->x_payload = v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->x_payload, CFSTR("_payload"));
}

- (int)integer
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSObject integerValue](self->x_payload, "integerValue");
  else
    return 0;
}

- (void)setInteger:(int)a3
{
  NSObject *v4;
  NSObject *x_payload;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = objc_claimAutoreleasedReturnValue();
  x_payload = self->x_payload;
  self->x_payload = v4;

}

- (BOOL)BOOLean
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSObject BOOLValue](self->x_payload, "BOOLValue");
  else
    return 0;
}

- (void)setBoolean:(BOOL)a3
{
  NSObject *v4;
  NSObject *x_payload;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  x_payload = self->x_payload;
  self->x_payload = v4;

}

- (ipp_value_date_t)date
{
  char isKindOfClass;
  int v4;
  uint64_t v5;
  _QWORD v6[3];
  ipp_value_date_t result;

  v6[2] = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, 11);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 0;
  v5 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    -[NSObject getBytes:range:](self->x_payload, "getBytes:range:", v6, 0, 11);
    v5 = v6[0];
    v4 = LOWORD(v6[1]) | (BYTE2(v6[1]) << 16);
  }
  *(_QWORD *)result.var0 = v5;
  *(_WORD *)&result.var0[8] = v4;
  result.var0[10] = BYTE2(v4);
  return result;
}

- (void)setDate:(ipp_value_date_t)a3
{
  NSObject *v4;
  NSObject *x_payload;
  ipp_value_date_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v6, 11);
  v4 = objc_claimAutoreleasedReturnValue();
  x_payload = self->x_payload;
  self->x_payload = v4;

}

- (void)setString:(ipp_value_string_t)a3
{
  id var0;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *x_payload;
  NSObject *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  var0 = a3.var0;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3.var1;
  v6 = v5;
  if (var0)
  {
    v7 = var0;
    v11[0] = v6;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    x_payload = self->x_payload;
    self->x_payload = v8;

  }
  else
  {
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v7 = self->x_payload;
    self->x_payload = v10;
  }

}

- (ipp_value_string_t)string
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  ipp_value_string_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self->x_payload;
    v4 = -[NSObject count](v3, "count");
    v5 = 0;
    if (v4 != 1)
    {
      if (v4 != 2)
      {
        v6 = &stru_24E6CFEB0;
        goto LABEL_8;
      }
      -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  v5 = 0;
  v6 = &stru_24E6CFEB0;
LABEL_9:
  v7 = (void *)v5;
  v8 = (__CFString *)v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (ipp_value_resolution_t)resolution
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  __int16 v15[8];
  ipp_value_resolution_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v11 = 0;
    v10 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  v3 = self->x_payload;
  if (-[NSObject count](v3, "count") != 3)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_impl(&dword_220F9A000, v13, OS_LOG_TYPE_ERROR, "invalid resolution object", (uint8_t *)v15, 2u);
    }

    goto LABEL_7;
  }
  -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = v7 << 32;
  v11 = v5;
  v12 = v9;
LABEL_8:
  v14 = v10 | v11;
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  result.var2 = v12;
  return result;
}

- (void)setResolution:(ipp_value_resolution_t)a3
{
  uint64_t v3;
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *x_payload;
  _QWORD v11[4];

  v3 = *(_QWORD *)&a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v11[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(v4), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  x_payload = self->x_payload;
  self->x_payload = v9;

}

- (ipp_value_range_t)range
{
  uint64_t v2;
  uint64_t v4;
  uint64_t isKindOfClass;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[16];

  v4 = v2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    *(_QWORD *)v4 = 0;
    return (ipp_value_range_t)isKindOfClass;
  }
  v11 = self->x_payload;
  if (-[NSObject count](v11, "count") != 2)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v10, OS_LOG_TYPE_ERROR, "invalid range object", buf, 2u);
    }

    goto LABEL_7;
  }
  -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  *(_DWORD *)v4 = v7;
  *(_DWORD *)(v4 + 4) = v9;

  return (ipp_value_range_t)isKindOfClass;
}

- (void)setRange:(ipp_value_range_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *x_payload;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)a3.var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)&a3 + 4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v7 = objc_claimAutoreleasedReturnValue();
  x_payload = self->x_payload;
  self->x_payload = v7;

}

- (NSData)unknown
{
  NSObject *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->x_payload;
  else
    v3 = 0;
  return (NSData *)v3;
}

- (void)setUnknown:(id)a3
{
  objc_storeStrong((id *)&self->x_payload, a3);
}

- (PK_ipp_collection_t)collection
{
  NSObject *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_getClass("PK_ipp_collection_t"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = self->x_payload;
  }
  else
  {
    v3 = 0;
  }
  return (PK_ipp_collection_t *)v3;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->x_payload, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)PK_ipp_value_t;
  -[PK_ipp_value_t description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %@ }"), v4, self->x_payload);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)loggingValue:(int)a3
{
  id result;
  _BOOL4 v5;
  __CFString *x_payload;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  time_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id obj;
  uint64_t v42;
  id v43;
  id v44;
  __CFString *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  tm v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 32)
  {
    if (!a3 || a3 == 16 || a3 == 19)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      return (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_36:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = self->x_payload;
      if (!-[NSObject count](v18, "count"))
      {

        return CFSTR("<empty array>");
      }
      -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[NSObject count](v18, "count") == 1)
        {
          v45 = v20;
LABEL_20:

          return v45;
        }
        if (-[NSObject count](v18, "count") == 2)
        {
          v39 = (void *)MEMORY[0x24BDD17C8];
          -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("%@ (%@)"), v20, v22);
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

          goto LABEL_20;
        }
      }

    }
    x_payload = (__CFString *)self->x_payload;
LABEL_46:
    v45 = x_payload;
    return v45;
  }
  switch(a3)
  {
    case '!':
    case '#':
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[PK_ipp_value_t integer](self, "integer"));
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    case '"':
      v5 = -[PK_ipp_value_t BOOLean](self, "BOOLean");
      x_payload = CFSTR("false");
      if (v5)
        x_payload = CFSTR("true");
      goto LABEL_46;
    case '0':
      v7 = self->x_payload;
      v8 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p> - %lu bytes {"), objc_opt_class(), v7, -[NSObject length](v7, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      *(_QWORD *)&v54.tm_sec = MEMORY[0x24BDAC760];
      *(_QWORD *)&v54.tm_hour = 3221225472;
      *(_QWORD *)&v54.tm_mon = ___ZL17pretty_data_linesP6NSData_block_invoke;
      *(_QWORD *)&v54.tm_wday = &unk_24E6CB590;
      v43 = v8;
      *(_QWORD *)&v54.tm_isdst = v43;
      _visitHexLines(v7, 0, &v54);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("}"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addObject:", v10);

      result = v43;
      break;
    case '1':
      v11 = -[PK_ipp_value_t date](self, "date");
      v13 = v12;
      memset(&v54.tm_wday, 0, 32);
      v54.tm_mon = BYTE2(v11) - 1;
      v54.tm_year = (bswap32(v11) >> 16) - 1900;
      v54.tm_hour = BYTE4(v11);
      v54.tm_mday = BYTE3(v11);
      *(int8x8_t *)&v54.tm_sec = vand_s8((int8x8_t)vmovn_s64((int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v11), (uint64x2_t)xmmword_220FE09F0)), (int8x8_t)0xFF000000FFLL);
      v14 = mktime(&v54);
      v15 = 3600;
      if (v13 != 45)
        v15 = -3600;
      v16 = 60;
      if (v13 != 45)
        v16 = -60;
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(v16 * BYTE2(v13) + v15 * BYTE1(v13) + v14));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "description");
      v44 = (id)objc_claimAutoreleasedReturnValue();

      result = v44;
      break;
    case '2':
      v18 = self->x_payload;
      v19 = (void *)MEMORY[0x24BDD17C8];
      -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");
      -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");
      -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("resolution<%d, %d, %d>"), v21, v23, objc_msgSend(v24, "integerValue"));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    case '3':
      v18 = self->x_payload;
      v25 = (void *)MEMORY[0x24BDD17C8];
      -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v20, "integerValue");
      -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("range<%d, %d>"), v26, objc_msgSend(v22, "integerValue"));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case '4':
      v40 = self->x_payload;
      v45 = (__CFString *)objc_opt_new();
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      -[NSObject attrs](v40, "attrs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v27;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v28)
      {
        v42 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v51 != v42)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v30, "name");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_opt_new();
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            objc_msgSend(v30, "values");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v47;
              do
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v47 != v35)
                    objc_enumerationMutation(v33);
                  objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "loggingValue:", objc_msgSend(v30, "value_tag"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "addObject:", v37);

                }
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
              }
              while (v34);
            }

            v55[0] = CFSTR("col_name");
            v55[1] = CFSTR("col_vals");
            v56[0] = v31;
            v56[1] = v32;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString addObject:](v45, "addObject:", v38);

          }
          v27 = obj;
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v28);
      }

      return v45;
    default:
      goto LABEL_36;
  }
  return result;
}

+ (id)valueWithInteger:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setInteger:", v3);
  return v4;
}

+ (id)valueWithBoolean:(int)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBoolean:", a3 != 0);
  return v4;
}

+ (id)valueWithString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v3;
  v6 = v5;
  if (v4)
    objc_msgSend(v4, "setString:", 0, v5);
  else

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->x_payload, 0);
}

@end
