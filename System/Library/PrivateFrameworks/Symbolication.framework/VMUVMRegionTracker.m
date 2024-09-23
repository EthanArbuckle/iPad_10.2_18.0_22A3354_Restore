@implementation VMUVMRegionTracker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUVMRegionTracker)init
{
  VMUVMRegionTracker *v2;
  NSMutableArray *v3;
  NSMutableArray *regionInfoArray;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMUVMRegionTracker;
  v2 = -[VMUVMRegionTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    regionInfoArray = v2->_regionInfoArray;
    v2->_regionInfoArray = v3;

  }
  return v2;
}

- (VMUVMRegionTracker)initWithStackLogReader:(id)a3
{
  id v4;
  VMUVMRegionTracker *v5;
  VMUVMRegionTracker *v6;
  id v7;
  _QWORD v9[4];
  VMUVMRegionTracker *v10;

  v4 = a3;
  v5 = -[VMUVMRegionTracker init](self, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_stackLogReader, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__VMUVMRegionTracker_initWithStackLogReader___block_invoke;
    v9[3] = &unk_1E4E01458;
    v10 = v6;
    objc_msgSend(v4, "enumerateMSLRecordsAndPayloads:", v9);

  }
  return v6;
}

uint64_t __45__VMUVMRegionTracker_initWithStackLogReader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStackLogType:address:size:stackID:", a2, a3, a4, msl_payload_get_uniquing_table_index());
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("classVersion"));

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "serialize32:", -[VMUVMRegionTracker regionCount](self, "regionCount"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_regionInfoArray;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "serialize64:", objc_msgSend(v12, "address", (_QWORD)v14));
        objc_msgSend(v6, "serialize64:", objc_msgSend(v12, "size"));
        objc_msgSend(v6, "serialize32:", objc_msgSend(v12, "stackIdentifier"));
        objc_msgSend(v6, "serialize32:", objc_msgSend(v12, "userTag"));
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copyContiguousData");
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("simpleSerializerData"));

}

- (VMUVMRegionTracker)initWithCoder:(id)a3
{
  id v4;
  VMUVMRegionTracker *v5;
  void *v6;
  int v7;
  void *v8;
  VMUSimpleDeserializer *v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  NSMutableArray *regionInfoArray;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  VMUVMRegionTracker *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VMUVMRegionTracker;
  v5 = -[VMUVMRegionTracker init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

    if (v7 != 1)
    {
LABEL_14:
      v19 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simpleSerializerData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VMUSimpleDeserializer initWithData:]([VMUSimpleDeserializer alloc], "initWithData:", v8);
    v25 = 0;
    v10 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v25);
    v11 = v25;
    if (v11)
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    regionInfoArray = v5->_regionInfoArray;
    v5->_regionInfoArray = (NSMutableArray *)v12;

    if (v10)
    {
      while (1)
      {
        v14 = (void *)objc_opt_new();
        v24 = 0;
        v15 = -[VMUSimpleDeserializer deserialize64WithError:](v9, "deserialize64WithError:", &v24);
        v11 = v24;
        objc_msgSend(v14, "setAddress:", v15);
        if (v11)
          break;
        v23 = 0;
        v16 = -[VMUSimpleDeserializer deserialize64WithError:](v9, "deserialize64WithError:", &v23);
        v11 = v23;
        objc_msgSend(v14, "setSize:", v16);
        if (v11)
          break;
        v22 = 0;
        v17 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v22);
        v11 = v22;
        objc_msgSend(v14, "setStackIdentifier:", v17);
        if (v11)
          break;
        v21 = 0;
        v18 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v21);
        v11 = v21;
        objc_msgSend(v14, "setUserTag:", v18);
        if (v11)
          break;
        -[NSMutableArray addObject:](v5->_regionInfoArray, "addObject:", v14);

        if (!--v10)
          goto LABEL_10;
      }

      goto LABEL_13;
    }
LABEL_10:

  }
  v19 = v5;
LABEL_15:

  return v19;
}

- (int64_t)regionCount
{
  return -[NSMutableArray count](self->_regionInfoArray, "count");
}

- (unint64_t)_regionIndexForAddress:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;

  v5 = -[NSMutableArray count](self->_regionInfoArray, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    v9 = v7;
    -[NSMutableArray objectAtIndexedSubscript:](self->_regionInfoArray, "objectAtIndexedSubscript:", v8 + (v6 >> 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "range");
    if (a3 - v10 < v11)
      break;
    if (a3 < v10)
    {
      v6 >>= 1;
    }
    else
    {
      v8 += (v6 >> 1) + 1;
      v6 += ~(v6 >> 1);
    }
    if (!v6)
      goto LABEL_11;
  }
  v8 += v6 >> 1;
LABEL_11:

  return v8;
}

- (unint64_t)handleStackLogType:(unsigned int)a3 address:(unint64_t)a4 size:(unint64_t)a5 stackID:(unint64_t)a6
{
  unint64_t v7;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  uint64_t v19;
  VMUVMRegionRangeInfo *v20;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  VMUVMRegionRangeInfo *v28;
  uint64_t v29;
  uint64_t v30;

  if ((a3 & 0x30) == 0)
    return 0;
  v7 = a5;
  if (a5 % *MEMORY[0x1E0C85AD8])
    v7 = ~*MEMORY[0x1E0C85AC0] & (*MEMORY[0x1E0C85AC0] + a5);
  v11 = -[VMUVMRegionTracker _regionIndexForAddress:](self, "_regionIndexForAddress:", a4);
  if (v11 >= -[NSMutableArray count](self->_regionInfoArray, "count"))
  {
    v14 = 0;
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = v7 + a4;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_regionInfoArray, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "range");
      v17 = VMURangeContainsRange(a4, v7, v15, v16);
      v18 = objc_msgSend(v14, "range");
      if (!v17)
        break;
      v12 -= v19;

      -[NSMutableArray removeObjectAtIndex:](self->_regionInfoArray, "removeObjectAtIndex:", v11);
      if (v11 >= -[NSMutableArray count](self->_regionInfoArray, "count"))
      {
        v14 = 0;
        goto LABEL_11;
      }
    }
    if (VMURangeIntersectsRange(a4, v7, v18, v19))
    {
      v22 = objc_msgSend(v14, "range") - a4;
      v23 = objc_msgSend(v14, "range");
      if (v22 >= v7)
      {
        if (v24 + ~a4 + v23 >= v7)
        {
          v28 = objc_alloc_init(VMUVMRegionRangeInfo);
          -[VMUVMRegionRangeInfo setAddress:](v28, "setAddress:", v7 + a4);
          v29 = objc_msgSend(v14, "range");
          -[VMUVMRegionRangeInfo setSize:](v28, "setSize:", v30 - v13 + v29);
          -[VMUVMRegionRangeInfo setStackIdentifier:](v28, "setStackIdentifier:", objc_msgSend(v14, "stackIdentifier"));
          -[VMUVMRegionRangeInfo setUserTag:](v28, "setUserTag:", objc_msgSend(v14, "userTag"));
          -[NSMutableArray insertObject:atIndex:](self->_regionInfoArray, "insertObject:atIndex:", v28, ++v11);
          objc_msgSend(v14, "setSize:", objc_msgSend(v14, "range") - a4 + objc_msgSend(v14, "size"));

          v25 = v7;
        }
        else
        {
          v26 = objc_msgSend(v14, "range");
          v25 = v27 - a4 + v26;
          objc_msgSend(v14, "setSize:", objc_msgSend(v14, "size") - v25);
          ++v11;
        }
      }
      else
      {
        v25 = v13 - v23;
        objc_msgSend(v14, "setAddress:", v25 + objc_msgSend(v14, "address"));
        objc_msgSend(v14, "setSize:", objc_msgSend(v14, "size") - v25);
      }
      v12 -= v25;
    }
  }
LABEL_11:
  if ((a3 & 0x10) != 0)
  {
    v20 = objc_alloc_init(VMUVMRegionRangeInfo);

    -[VMUVMRegionRangeInfo setAddress:](v20, "setAddress:", a4);
    -[VMUVMRegionRangeInfo setSize:](v20, "setSize:", v7);
    -[VMUVMRegionRangeInfo setStackIdentifier:](v20, "setStackIdentifier:", a6);
    -[VMUVMRegionRangeInfo setUserTag:](v20, "setUserTag:", HIBYTE(a3));
    -[NSMutableArray insertObject:atIndex:](self->_regionInfoArray, "insertObject:atIndex:", v20, v11);
    v12 += v7;
    v14 = v20;
  }

  return v12;
}

- (void)convertStackIDs:(id)a3
{
  uint64_t (**v4)(id, uint64_t);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, uint64_t))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_regionInfoArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "setStackIdentifier:", v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "stackIdentifier", (_QWORD)v10)));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)vmRegionRangeInfoForRange:(_VMURange)a3
{
  unint64_t length;
  unint64_t location;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;

  length = a3.length;
  location = a3.location;
  v6 = -[VMUVMRegionTracker _regionIndexForAddress:](self, "_regionIndexForAddress:");
  if (v6 >= -[NSMutableArray count](self->_regionInfoArray, "count"))
  {
    v12 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_regionInfoArray, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "range");
    if (VMURangeContainsRange(v8, v9, location, length)
      || (v10 = objc_msgSend(v7, "range"), VMURangeIntersectsRange(v10, v11, location, length)))
    {
      v12 = v7;
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionInfoArray, 0);
  objc_destroyWeak((id *)&self->_stackLogReader);
}

@end
