@implementation REMClockElementList

- (REMClockElementList)initWithCRVectorTimestampElements:(id)a3
{
  id v4;
  REMClockElementList *v5;
  uint64_t v6;
  NSArray *elements;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMClockElementList;
  v5 = -[REMClockElementList init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    elements = v5->_elements;
    v5->_elements = (NSArray *)v6;

  }
  return v5;
}

- (REMClockElementList)initWithTTVectorTimestampElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CRVectorTimestampElement *v11;
  REMClockElementList *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc_init(CRVectorTimestampElement);
        -[CRVectorTimestampElement setClock:](v11, "setClock:", objc_msgSend(v10, "clock", (_QWORD)v14));
        -[CRVectorTimestampElement setSubclock:](v11, "setSubclock:", objc_msgSend(v10, "subclock"));
        objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = -[REMClockElementList initWithCRVectorTimestampElements:](self, "initWithCRVectorTimestampElements:", v5);
  return v12;
}

+ (BOOL)list:(id)a3 isCompatibleToList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 1;
  if (v5 && v6)
  {
    objc_msgSend(v5, "elements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v7, "elements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 == objc_msgSend(v11, "count");

  }
  return v8;
}

+ (int64_t)compareList:(id)a3 toList:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v8 = 0;
    goto LABEL_6;
  }
  if (!v5 && v6)
  {
    v8 = 1;
    goto LABEL_6;
  }
  if (v5 && !v6)
  {
    v8 = 2;
    goto LABEL_6;
  }
  objc_msgSend((id)v5, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "count");

  objc_msgSend(v7, "elements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v8 == v12)
  {
    if (!v8)
      goto LABEL_6;
    goto LABEL_12;
  }
  +[REMLog crdt](REMLog, "crdt");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    +[REMClockElementList compareList:toList:].cold.1(v8, v12, v19);

  if (v8)
  {
LABEL_12:
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend((id)v5, "elements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "elements");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v15, "rem_compareToVectorTimestampElement:", v17);
    }
    if (v18 == -1)
      v8 = 1;
    else
      v8 = 2 * (v18 == 1);
  }
LABEL_6:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  REMClockElementList *v4;
  REMClockElementList *v5;
  REMClockElementList *v6;
  BOOL v7;

  v4 = (REMClockElementList *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && +[REMClockElementList list:isCompatibleToList:](REMClockElementList, "list:isCompatibleToList:", self, v6)&& +[REMClockElementList compareList:toList:](REMClockElementList, "compareList:toList:", self, v6) == 0;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[REMClockElementList elements](self, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[REMClockElementList elements](self, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu.%llu"), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "clock"), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "subclock"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@]"), v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)encodeIntoEntryArchive:(void *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  replica_manager::VectorTimestampElement *v12;
  uint64_t v13;
  int32x2_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[REMClockElementList elements](self, "elements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = *((_DWORD *)a3 + 15);
        v10 = *((int *)a3 + 14);
        if ((int)v10 >= v9)
        {
          if (v9 == *((_DWORD *)a3 + 16))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 12, v9 + 1);
          v12 = google::protobuf::internal::GenericTypeHandler<replica_manager::VectorTimestampElement>::New();
          v13 = *((_QWORD *)a3 + 6);
          v14 = *(int32x2_t *)((char *)a3 + 56);
          *((int32x2_t *)a3 + 7) = vadd_s32(v14, (int32x2_t)0x100000001);
          *(_QWORD *)(v13 + 8 * v14.i32[0]) = v12;
        }
        else
        {
          v11 = *((_QWORD *)a3 + 6);
          *((_DWORD *)a3 + 14) = v10 + 1;
          v12 = *(replica_manager::VectorTimestampElement **)(v11 + 8 * v10);
        }
        v15 = objc_msgSend(v8, "clock");
        *((_DWORD *)v12 + 8) |= 1u;
        *((_QWORD *)v12 + 5) = v15;
        v16 = objc_msgSend(v8, "subclock");
        *((_DWORD *)v12 + 8) |= 2u;
        *((_QWORD *)v12 + 6) = v16;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

- (REMClockElementList)initWithEntryArchive:(const void *)a3
{
  int v4;
  void *v6;
  int v7;
  char *v8;
  const replica_manager::VectorTimestampElement *v9;
  CRVectorTimestampElement *v10;
  REMClockElementList *v11;
  _BYTE v13[40];
  uint64_t v14;
  uint64_t v15;

  v4 = *((_DWORD *)a3 + 14);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *((unsigned int *)a3 + 14));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = (char *)a3 + 48;
    do
    {
      v9 = (const replica_manager::VectorTimestampElement *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<replica_manager::VectorTimestampElement>::TypeHandler>((uint64_t)v8, v7);
      replica_manager::VectorTimestampElement::VectorTimestampElement((replica_manager::VectorTimestampElement *)v13, v9);
      v10 = objc_alloc_init(CRVectorTimestampElement);
      -[CRVectorTimestampElement setClock:](v10, "setClock:", v14);
      -[CRVectorTimestampElement setSubclock:](v10, "setSubclock:", v15);
      objc_msgSend(v6, "addObject:", v10);

      replica_manager::VectorTimestampElement::~VectorTimestampElement((replica_manager::VectorTimestampElement *)v13);
      ++v7;
    }
    while (v4 != v7);
    self = -[REMClockElementList initWithCRVectorTimestampElements:](self, "initWithCRVectorTimestampElements:", v6);

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

+ (void)compareList:(NSObject *)a3 toList:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, a3, (uint64_t)a3, "rem_log_fault_if (aCount != bCount) -- clock elements should have the same count {aCount: %ld, bCount: %ld}", (uint8_t *)&v3);
}

@end
