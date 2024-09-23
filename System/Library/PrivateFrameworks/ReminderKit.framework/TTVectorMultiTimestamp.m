@implementation TTVectorMultiTimestamp

- (TTVectorMultiTimestamp)initWithCapacity:(unint64_t)a3
{
  TTVectorMultiTimestamp *v4;
  uint64_t v5;
  NSArray *timestamps;
  uint64_t v7;
  TTVectorTimestamp *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TTVectorMultiTimestamp;
  v4 = -[TTVectorMultiTimestamp init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    timestamps = v4->_timestamps;
    v4->_timestamps = (NSArray *)v5;

    if (a3)
    {
      v7 = 0;
      do
      {
        v8 = objc_alloc_init(TTVectorTimestamp);
        -[NSArray setObject:atIndexedSubscript:](v4->_timestamps, "setObject:atIndexedSubscript:", v8, v7);

        ++v7;
      }
      while (a3 != v7);
    }
  }
  return v4;
}

- (TTVectorMultiTimestamp)initWithTimestamps:(id)a3
{
  id v4;
  TTVectorMultiTimestamp *v5;
  uint64_t v6;
  NSArray *timestamps;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTVectorMultiTimestamp;
  v5 = -[TTVectorMultiTimestamp init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TTVectorMultiTimestamp *v4;

  v4 = -[TTVectorMultiTimestamp initWithCapacity:]([TTVectorMultiTimestamp alloc], "initWithCapacity:", -[NSArray count](self->_timestamps, "count"));
  -[TTVectorMultiTimestamp mergeWithTimestamp:](v4, "mergeWithTimestamp:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TTVectorMultiTimestamp compareTo:](self, "compareTo:", v4) == 0;

  return v5;
}

- (BOOL)isDocumentShared
{
  return 0;
}

- (id)clockElementForUUID:(id)a3 atIndex:(unint64_t)a4
{
  NSArray *timestamps;
  id v6;
  void *v7;
  void *v8;

  timestamps = self->_timestamps;
  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clockElementForUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)clockForUUID:(id)a3 atIndex:(unint64_t)a4
{
  NSArray *timestamps;
  id v6;
  void *v7;
  unint64_t v8;

  timestamps = self->_timestamps;
  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clockForUUID:", v6);

  return v8;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4 atIndex:(unint64_t)a5
{
  NSArray *timestamps;
  id v8;
  id v9;

  timestamps = self->_timestamps;
  v8 = a4;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClock:forUUID:", a3, v8);

}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5 atIndex:(unint64_t)a6
{
  NSArray *timestamps;
  id v10;
  id v11;

  timestamps = self->_timestamps;
  v10 = a5;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClock:subclock:forUUID:", a3, a4, v10);

}

- (id)sortedUUIDs
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = -[NSArray count](self->_timestamps, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_timestamps, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

    }
  }
  objc_msgSend(v3, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_TTCompare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)compareTo:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[NSArray count](self->_timestamps, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_timestamps, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 |= objc_msgSend(v9, "compareTo:", v11);

      if (v8 == 5)
        break;
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)mergeWithTimestamp:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[NSArray count](self->_timestamps, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_timestamps, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timestamps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mergeWithTimestamp:", v9);

    }
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>(\n%@\n)"), v5, self, self->_timestamps);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_timestamps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
}

- (TTVectorMultiTimestamp)initWithData:(id)a3 andCapacity:(unint64_t)a4
{
  id v6;
  id v7;
  char *v8;
  int v9;
  TTVectorMultiTimestamp *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[64];

  v6 = a3;
  topotext::VectorTimestamp::VectorTimestamp((topotext::VectorTimestamp *)v20);
  v7 = objc_retainAutorelease(v6);
  v8 = (char *)objc_msgSend(v7, "bytes");
  v9 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v7, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v20, v8, v9))
  {
    self = -[TTVectorMultiTimestamp initWithArchive:andCapacity:](self, "initWithArchive:andCapacity:", v20, a4);
    v10 = self;
  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions) initWithData:andCapacity:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }
  topotext::VectorTimestamp::~VectorTimestamp((topotext::VectorTimestamp *)v20);

  return v10;
}

- (TTVectorMultiTimestamp)initWithArchive:(const void *)a3 andCapacity:(unint64_t)a4
{
  TTVectorMultiTimestamp *v6;
  TTVectorMultiTimestamp *v7;
  int v8;
  TTVectorMultiTimestamp *v9;
  int v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  TTVectorMultiTimestamp *v32;

  v6 = -[TTVectorMultiTimestamp initWithCapacity:](self, "initWithCapacity:", a4);
  v7 = v6;
  if (!v6)
  {
LABEL_29:
    v9 = 0;
    goto LABEL_30;
  }
  v8 = *((_DWORD *)a3 + 12);
  v9 = v6;
  if (v8)
  {
    v10 = 0;
    v11 = (char *)a3 + 40;
    while (1)
    {
      v12 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock>::TypeHandler>((uint64_t)v11, v10);
      v13 = v12;
      if ((*(_BYTE *)(v12 + 32) & 1) == 0)
        break;
      v14 = *(_QWORD *)(v12 + 40);
      v15 = *(char *)(v14 + 23) < 0 ? *(_QWORD *)(v14 + 8) : *(unsigned __int8 *)(v14 + 23);
      if (v15 != 16)
        break;
      v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v17 = *(uint64_t **)(v13 + 40);
      if (*((char *)v17 + 23) < 0)
        v17 = (uint64_t *)*v17;
      v18 = objc_msgSend(v16, "initWithUUIDBytes:", v17);
      v19 = *(unsigned int *)(v13 + 56);
      if (v19 != a4)
      {
        +[REMLog crdt](REMLog, "crdt");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions) initWithArchive:andCapacity:].cold.2(v19, a4, v31);

        goto LABEL_28;
      }
      if ((_DWORD)v19)
      {
        v20 = 0;
        v21 = v13 + 48;
        do
        {
          if ((*(_BYTE *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 32) & 1) != 0)v22 = *(unsigned int *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 40);
          else
            v22 = 0;
          if ((*(_BYTE *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 32) & 2) != 0)v23 = *(unsigned int *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 44);
          else
            v23 = 0;
          -[TTVectorMultiTimestamp setClock:subclock:forUUID:atIndex:](v7, "setClock:subclock:forUUID:atIndex:", v22, v23, v18, v20++);
        }
        while (a4 != v20);
      }

      if (++v10 == v8)
      {
        v9 = v7;
        goto LABEL_30;
      }
    }
    +[REMLog crdt](REMLog, "crdt");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions) initWithArchive:andCapacity:].cold.1(v18, v24, v25, v26, v27, v28, v29, v30);
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:
  v32 = v9;

  return v32;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  topotext::VectorTimestamp_Clock *v11;
  uint64_t v12;
  int32x2_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  topotext::VectorTimestamp_Clock_ReplicaClock *v22;
  uint64_t v23;
  int32x2_t v24;
  int v25;
  int v26;
  int *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[TTVectorMultiTimestamp sortedUUIDs](self, "sortedUUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v29 = *(_QWORD *)v32;
    v27 = (int *)((char *)a3 + 40);
    do
    {
      v30 = v5;
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v8 = *((_DWORD *)a3 + 13);
        v9 = *((int *)a3 + 12);
        if ((int)v9 >= v8)
        {
          if (v8 == *((_DWORD *)a3 + 14))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v27, v8 + 1);
          v11 = google::protobuf::internal::GenericTypeHandler<topotext::VectorTimestamp_Clock>::New();
          v12 = *((_QWORD *)a3 + 5);
          v13 = *(int32x2_t *)((char *)a3 + 48);
          *((int32x2_t *)a3 + 6) = vadd_s32(v13, (int32x2_t)0x100000001);
          *(_QWORD *)(v12 + 8 * v13.i32[0]) = v11;
        }
        else
        {
          v10 = *((_QWORD *)a3 + 5);
          *((_DWORD *)a3 + 12) = v9 + 1;
          v11 = *(topotext::VectorTimestamp_Clock **)(v10 + 8 * v9);
        }
        v35[0] = 0;
        v35[1] = 0;
        objc_msgSend(v7, "getUUIDBytes:", v35, v27);
        *((_DWORD *)v11 + 8) |= 1u;
        if (!google::protobuf::internal::empty_string_)
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        if (*((_QWORD *)v11 + 5) == google::protobuf::internal::empty_string_)
        {
          v14 = (_QWORD *)operator new();
          *v14 = 0;
          v14[1] = 0;
          v14[2] = 0;
          *((_QWORD *)v11 + 5) = v14;
        }
        MEMORY[0x1B5E3DB34]();
        -[TTVectorMultiTimestamp timestamps](self, "timestamps");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          for (j = 0; j != v16; ++j)
          {
            -[TTVectorMultiTimestamp clockElementForUUID:atIndex:](self, "clockElementForUUID:atIndex:", v7, j);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = *((_DWORD *)v11 + 15);
            v20 = *((int *)v11 + 14);
            if ((int)v20 >= v19)
            {
              if (v19 == *((_DWORD *)v11 + 16))
                google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)v11 + 12, v19 + 1);
              v22 = google::protobuf::internal::GenericTypeHandler<topotext::VectorTimestamp_Clock_ReplicaClock>::New();
              v23 = *((_QWORD *)v11 + 6);
              v24 = *(int32x2_t *)((char *)v11 + 56);
              *((int32x2_t *)v11 + 7) = vadd_s32(v24, (int32x2_t)0x100000001);
              *(_QWORD *)(v23 + 8 * v24.i32[0]) = v22;
            }
            else
            {
              v21 = *((_QWORD *)v11 + 6);
              *((_DWORD *)v11 + 14) = v20 + 1;
              v22 = *(topotext::VectorTimestamp_Clock_ReplicaClock **)(v21 + 8 * v20);
            }
            if (objc_msgSend(v18, "clock"))
            {
              v25 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v18, "clock"));
              *((_DWORD *)v22 + 8) |= 1u;
              *((_DWORD *)v22 + 10) = v25;
            }
            if (objc_msgSend(v18, "subclock"))
            {
              v26 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v18, "subclock"));
              *((_DWORD *)v22 + 8) |= 2u;
              *((_DWORD *)v22 + 11) = v26;
            }

          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v5);
  }

}

- (id)serialize
{
  id v2;
  void *v3;
  int v4;
  _BYTE v6[64];

  -[TTVectorMultiTimestamp saveToArchive:](self, "saveToArchive:", v6, topotext::VectorTimestamp::VectorTimestamp((topotext::VectorTimestamp *)v6));
  v2 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::VectorTimestamp::ByteSize((topotext::VectorTimestamp *)v6)));
  v3 = (void *)objc_msgSend(v2, "mutableBytes");
  v4 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v2, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v6, v3, v4);
  topotext::VectorTimestamp::~VectorTimestamp((topotext::VectorTimestamp *)v6);
  return v2;
}

@end
