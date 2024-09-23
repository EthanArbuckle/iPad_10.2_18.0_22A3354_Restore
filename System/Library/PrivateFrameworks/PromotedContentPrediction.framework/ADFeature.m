@implementation ADFeature

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)ADFeature;
  -[ADFeature dealloc](&v3, sel_dealloc);
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (unint64_t)doubleValuesCount
{
  return self->_doubleValues.count;
}

- (double)doubleValues
{
  return self->_doubleValues.list;
}

- (void)clearDoubleValues
{
  PBRepeatedDoubleClear();
}

- (void)addDoubleValue:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)doubleValueAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_doubleValues;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  p_doubleValues = &self->_doubleValues;
  count = self->_doubleValues.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v10, v11, v12);

  }
  return p_doubleValues->list[a3];
}

- (void)setDoubleValues:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (void)clearStringValues
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_stringValues, a2, v2);
}

- (void)addStringValue:(id)a3
{
  const char *v4;
  NSMutableArray *stringValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  stringValues = self->_stringValues;
  v8 = (char *)v4;
  if (!stringValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stringValues;
    self->_stringValues = v6;

    v4 = v8;
    stringValues = self->_stringValues;
  }
  objc_msgSend_addObject_(stringValues, v4, (uint64_t)v4);

}

- (unint64_t)stringValuesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_stringValues, a2, v2);
}

- (id)stringValueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_stringValues, a2, a3);
}

+ (Class)stringValueType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)ADFeature;
  -[ADFeature description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSString *version;
  void *v8;
  const char *v9;
  const char *v10;
  NSMutableArray *stringValues;
  NSString *name;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  version = self->_version;
  if (version)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)version, CFSTR("version"));
  PBRepeatedDoubleNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("doubleValue"));

  stringValues = self->_stringValues;
  if (stringValues)
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)stringValues, CFSTR("stringValue"));
  name = self->_name;
  if (name)
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)name, CFSTR("name"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return ADFeatureReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_version)
    PBDataWriterWriteStringField();
  if (self->_doubleValues.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v5;
    }
    while (v5 < self->_doubleValues.count);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_stringValues;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  if (self->_name)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  NSString *version;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  const char *v23;
  NSString *name;
  id v25;

  v25 = a3;
  version = self->_version;
  if (version)
    objc_msgSend_setVersion_(v25, v4, (uint64_t)version);
  if (objc_msgSend_doubleValuesCount(self, v4, (uint64_t)version))
  {
    objc_msgSend_clearDoubleValues(v25, v6, v7);
    v10 = objc_msgSend_doubleValuesCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_doubleValueAtIndex_(self, v6, i);
        objc_msgSend_addDoubleValue_(v25, v13, v14);
      }
    }
  }
  if (objc_msgSend_stringValuesCount(self, v6, v7))
  {
    objc_msgSend_clearStringValues(v25, v15, v16);
    v19 = objc_msgSend_stringValuesCount(self, v17, v18);
    if (v19)
    {
      v20 = v19;
      for (j = 0; j != v20; ++j)
      {
        objc_msgSend_stringValueAtIndex_(self, v15, j);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addStringValue_(v25, v23, (uint64_t)v22);

      }
    }
  }
  name = self->_name;
  if (name)
    objc_msgSend_setName_(v25, v15, (uint64_t)name);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_version, v11, (uint64_t)a3);
  v13 = (void *)v10[6];
  v10[6] = v12;

  PBRepeatedDoubleCopy();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_stringValues;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v20), v17, (uint64_t)a3, (_QWORD)v27);
        objc_msgSend_addStringValue_(v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  v24 = objc_msgSend_copyWithZone_(self->_name, v23, (uint64_t)a3);
  v25 = (void *)v10[4];
  v10[4] = v24;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *version;
  uint64_t v9;
  const char *v10;
  NSMutableArray *stringValues;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((version = self->_version, v9 = v4[6], !((unint64_t)version | v9))
     || objc_msgSend_isEqual_(version, v7, v9))
    && PBRepeatedDoubleIsEqual()
    && ((stringValues = self->_stringValues, v12 = v4[5], !((unint64_t)stringValues | v12))
     || objc_msgSend_isEqual_(stringValues, v10, v12)))
  {
    name = self->_name;
    v14 = v4[4];
    if ((unint64_t)name | v14)
      isEqual = objc_msgSend_isEqual_(name, v10, v14);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v4 = objc_msgSend_hash(self->_version, a2, v2);
  v5 = PBRepeatedDoubleHash() ^ v4;
  v8 = objc_msgSend_hash(self->_stringValues, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_name, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  const char *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 6);
  if (v6)
    objc_msgSend_setVersion_(self, v4, v6);
  v7 = objc_msgSend_doubleValuesCount(v5, v4, v6);
  if (v7)
  {
    v9 = v7;
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend_doubleValueAtIndex_(v5, v8, i);
      objc_msgSend_addDoubleValue_(self, v11, v12);
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = *((id *)v5 + 5);
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v22, v26, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v13);
        objc_msgSend_addStringValue_(self, v16, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v22, v26, 16);
    }
    while (v17);
  }

  v21 = *((_QWORD *)v5 + 4);
  if (v21)
    objc_msgSend_setName_(self, v20, v21);

}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSMutableArray)stringValues
{
  return self->_stringValues;
}

- (void)setStringValues:(id)a3
{
  objc_storeStrong((id *)&self->_stringValues, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_stringValues, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
