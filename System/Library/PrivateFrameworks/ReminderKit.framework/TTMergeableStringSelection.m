@implementation TTMergeableStringSelection

- (void)selectionRanges
{
  return &self->_selectionRanges;
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  TopoID *begin;
  TopoID *end;
  id updated;
  unsigned int v9;
  unsigned int v10;
  id var0;
  TopoID *v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  id v16;

  begin = (TopoID *)self->_selectionRanges.__begin_;
  end = (TopoID *)self->_selectionRanges.__end_;
  while (begin != end)
  {
    updated = updateTopoID(begin, a3, a4);
    v10 = v9;
    var0 = begin->var0;
    begin->var0 = updated;

    begin->var1 = v10;
    v12 = begin + 1;
    v13 = updateTopoID(v12, a3, a4);
    v15 = v14;
    v16 = v12->var0;
    v12->var0 = v13;

    v12->var1 = v15;
    begin = v12 + 1;
  }

}

- (BOOL)hasTopoIDsThatCanChange
{
  void **begin;
  void **end;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL result;

  begin = (void **)self->_selectionRanges.__begin_;
  end = (void **)self->_selectionRanges.__end_;
  if (begin == end)
    return 0;
  while (1)
  {
    v4 = *begin;
    +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v4 == (void *)v5)
      break;
    v6 = (void *)v5;
    v7 = begin[2];
    +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    result = v7 == v8;
    begin += 4;
    if (v7 == v8 || begin == end)
      return result;
  }

  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  _BYTE *end;
  _BYTE *begin;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (uint64_t *)objc_msgSend(v5, "selectionRanges");
    v7 = v6;
    v8 = (v6[1] - *v6) >> 5;
    begin = self->_selectionRanges.__begin_;
    end = self->_selectionRanges.__end_;
    if (v8 == (end - begin) >> 5)
    {
      if (end == begin)
      {
LABEL_12:
        v16 = -[TTMergeableStringSelection selectionAffinity](self, "selectionAffinity");
        v17 = v16 == objc_msgSend(v5, "selectionAffinity");
LABEL_15:

        goto LABEL_16;
      }
      v11 = 0;
      if (v8 <= 1)
        v12 = 1;
      else
        v12 = (v6[1] - *v6) >> 5;
      while (1)
      {
        v13 = *v7;
        v14 = *v7 + v11;
        v15 = (char *)self->_selectionRanges.__begin_;
        if (*(_DWORD *)(v14 + 8) != *(_DWORD *)&v15[v11 + 8]
          || !objc_msgSend(*(id *)v14, "isEqual:", *(_QWORD *)&v15[v11])
          || *(_DWORD *)(v13 + v11 + 24) != *(_DWORD *)&v15[v11 + 24]
          || (objc_msgSend(*(id *)(v13 + v11 + 16), "isEqual:", *(_QWORD *)&v15[v11 + 16]) & 1) == 0)
        {
          break;
        }
        v11 += 32;
        if (!--v12)
          goto LABEL_12;
      }
    }
    v17 = 0;
    goto LABEL_15;
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  char *begin;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;

  begin = (char *)self->_selectionRanges.__begin_;
  v3 = (char *)self->_selectionRanges.__end_ - (char *)begin;
  if (!v3)
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = v3 >> 5;
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  do
  {
    v9 = objc_msgSend(*(id *)&begin[v5], "hash");
    v10 = (id *)((char *)self->_selectionRanges.__begin_ + v5);
    v11 = *((unsigned int *)v10 + 2);
    v12 = objc_msgSend(v10[2], "hash");
    begin = (char *)self->_selectionRanges.__begin_;
    v6 ^= v9 ^ v11 ^ v12 ^ *(unsigned int *)&begin[v5 + 24];
    v5 += 32;
    --v8;
  }
  while (v8);
  return v6;
}

- (TTMergeableStringSelection)initWithData:(id)a3
{
  id v4;
  id v5;
  char *v6;
  int v7;
  TTMergeableStringSelection *v8;
  NSObject *v9;
  _BYTE v11[96];

  v4 = a3;
  topotext::Selection::Selection((topotext::Selection *)v11);
  v5 = objc_retainAutorelease(v4);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v5, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = -[TTMergeableStringSelection initWithArchive:](self, "initWithArchive:", v11);
    v8 = self;
  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TTMergeableStringSelection initWithData:].cold.1(v9);

    v8 = 0;
  }
  topotext::Selection::~Selection((topotext::Selection *)v11);

  return v8;
}

- (TTMergeableStringSelection)initWithArchive:(const void *)a3
{
  TTMergeableStringSelection *v4;
  TTMergeableStringSelection *v5;
  int v6;
  id v7;
  int v8;
  int i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t *p_selectionRanges;
  topotext::Selection_Range *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  topotext::Selection_Range *v23;
  uint64_t v24;
  id v25;
  id v26;
  TTMergeableStringSelection *v28;
  _DWORD *v29;
  id v30;
  int v31;
  id v32;
  int v33;

  v4 = -[TTMergeableStringSelection init](self, "init");
  v5 = v4;
  if (v4)
  {
    v6 = *((_DWORD *)a3 + 18);
    v28 = v4;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = a3;
    v8 = *((_DWORD *)a3 + 12);
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v11 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)(v29 + 10), i);
        if (*(char *)(v11 + 23) >= 0)
          v12 = v11;
        else
          v12 = *(_QWORD *)v11;
        v13 = (void *)objc_msgSend(v10, "initWithUUIDBytes:", v12, v28);
        objc_msgSend(v7, "addObject:", v13);

      }
    }
    if (v6)
    {
      v14 = 0;
      v15 = (uint64_t)(v29 + 16);
      p_selectionRanges = (uint64_t *)&v28->_selectionRanges;
      do
      {
        v17 = (topotext::Selection_Range *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Selection_Range>::TypeHandler>(v15, v14);
        v18 = *((_QWORD *)v17 + 5);
        if (!v18)
          v18 = *(_QWORD *)(topotext::Selection_Range::default_instance(v17) + 40);
        objc_msgSend(v7, "objectAtIndexedSubscript:", *(unsigned int *)(v18 + 40), v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_DWORD *)(v18 + 44);
        if ((*(_BYTE *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Selection_Range>::TypeHandler>(v15, v14)+ 32) & 2) != 0)
        {
          v23 = (topotext::Selection_Range *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Selection_Range>::TypeHandler>(v15, v14);
          v24 = *((_QWORD *)v23 + 6);
          if (!v24)
            v24 = *(_QWORD *)(topotext::Selection_Range::default_instance(v23) + 48);
          objc_msgSend(v7, "objectAtIndexedSubscript:", *(unsigned int *)(v24 + 40));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(_DWORD *)(v24 + 44);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
        }
        v25 = v19;
        v30 = v25;
        v31 = v20;
        v26 = v21;
        v32 = v26;
        v33 = v22;
        std::vector<std::pair<TopoID,TopoID>>::push_back[abi:ne180100](p_selectionRanges, (uint64_t *)&v30);

        ++v14;
      }
      while (v6 != v14);
    }
    v5 = v28;
    -[TTMergeableStringSelection setSelectionAffinity:](v28, "setSelectionAffinity:", v29[22] & ((int)(v29[8] << 29) >> 31), v28);

  }
  return v5;
}

- (void)saveToArchive:(void *)a3
{
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  _QWORD *begin;
  _QWORD *i;
  int v10;
  uint64_t v11;
  uint64_t v12;
  topotext::Selection_Range *v13;
  uint64_t v14;
  int32x2_t v15;
  topotext::CharID *v16;
  int v17;
  topotext::CharID *v18;
  int v19;
  uint64_t v20;
  topotext::CharID *v21;
  int v22;
  topotext::CharID *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  int32x2_t v36;
  topotext *v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[2];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __44__TTMergeableStringSelection_saveToArchive___block_invoke;
  v43[3] = &unk_1E67FAAE8;
  v6 = v5;
  v44 = v6;
  v7 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1B5E3E098](v43);
  begin = self->_selectionRanges.__begin_;
  for (i = self->_selectionRanges.__end_; begin != i; begin += 4)
  {
    v10 = *((_DWORD *)a3 + 19);
    v11 = *((int *)a3 + 18);
    if ((int)v11 >= v10)
    {
      if (v10 == *((_DWORD *)a3 + 20))
        google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 16, v10 + 1);
      v13 = google::protobuf::internal::GenericTypeHandler<topotext::Selection_Range>::New();
      v14 = *((_QWORD *)a3 + 8);
      v15 = *(int32x2_t *)((char *)a3 + 72);
      *((int32x2_t *)a3 + 9) = vadd_s32(v15, (int32x2_t)0x100000001);
      *(_QWORD *)(v14 + 8 * v15.i32[0]) = v13;
    }
    else
    {
      v12 = *((_QWORD *)a3 + 8);
      *((_DWORD *)a3 + 18) = v11 + 1;
      v13 = *(topotext::Selection_Range **)(v12 + 8 * v11);
    }
    *((_DWORD *)v13 + 8) |= 1u;
    v16 = (topotext::CharID *)*((_QWORD *)v13 + 5);
    if (!v16)
    {
      v16 = (topotext::CharID *)operator new();
      topotext::CharID::CharID(v16);
      *((_QWORD *)v13 + 5) = v16;
    }
    v17 = v7[2](v7, *begin);
    *((_DWORD *)v16 + 8) |= 1u;
    *((_DWORD *)v16 + 10) = v17;
    *((_DWORD *)v13 + 8) |= 1u;
    v18 = (topotext::CharID *)*((_QWORD *)v13 + 5);
    if (!v18)
    {
      v18 = (topotext::CharID *)operator new();
      topotext::CharID::CharID(v18);
      *((_QWORD *)v13 + 5) = v18;
    }
    v19 = *((_DWORD *)begin + 2);
    *((_DWORD *)v18 + 8) |= 2u;
    *((_DWORD *)v18 + 11) = v19;
    v20 = begin[2];
    if (v20 || *((_DWORD *)begin + 6))
    {
      *((_DWORD *)v13 + 8) |= 2u;
      v21 = (topotext::CharID *)*((_QWORD *)v13 + 6);
      if (!v21)
      {
        v21 = (topotext::CharID *)operator new();
        topotext::CharID::CharID(v21);
        *((_QWORD *)v13 + 6) = v21;
        v20 = begin[2];
      }
      v22 = v7[2](v7, v20);
      *((_DWORD *)v21 + 8) |= 1u;
      *((_DWORD *)v21 + 10) = v22;
      *((_DWORD *)v13 + 8) |= 2u;
      v23 = (topotext::CharID *)*((_QWORD *)v13 + 6);
      if (!v23)
      {
        v23 = (topotext::CharID *)operator new();
        topotext::CharID::CharID(v23);
        *((_QWORD *)v13 + 6) = v23;
      }
      v24 = *((_DWORD *)begin + 6);
      *((_DWORD *)v23 + 8) |= 2u;
      *((_DWORD *)v23 + 11) = v24;
    }
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = v6;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v40;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v28);
        v45[0] = 0;
        v45[1] = 0;
        v30 = (int *)objc_msgSend(v29, "getUUIDBytes:", v45, (_QWORD)v39);
        v31 = *((_DWORD *)a3 + 13);
        v32 = *((int *)a3 + 12);
        if ((int)v32 >= v31)
        {
          if (v31 == *((_DWORD *)a3 + 14))
            v30 = google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 10, v31 + 1);
          v34 = google::protobuf::internal::StringTypeHandlerBase::New((google::protobuf::internal::StringTypeHandlerBase *)v30);
          v35 = *((_QWORD *)a3 + 5);
          v36 = *(int32x2_t *)((char *)a3 + 48);
          *((int32x2_t *)a3 + 6) = vadd_s32(v36, (int32x2_t)0x100000001);
          *(_QWORD *)(v35 + 8 * v36.i32[0]) = v34;
        }
        else
        {
          v33 = *((_QWORD *)a3 + 5);
          *((_DWORD *)a3 + 12) = v32 + 1;
          v34 = *(_QWORD **)(v33 + 8 * v32);
        }
        MEMORY[0x1B5E3DB34](v34, v45, 16);
        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v26);
  }

  v37 = -[TTMergeableStringSelection selectionAffinity](self, "selectionAffinity");
  v38 = (int)v37;
  if (!topotext::Selection_Affinity_IsValid(v37))
    __assert_rtn("set_affinity", "topotext.pb.h", 3757, "::topotext::Selection_Affinity_IsValid(value)");
  *((_DWORD *)a3 + 8) |= 4u;
  *((_DWORD *)a3 + 22) = v38;

}

uint64_t __44__TTMergeableStringSelection_saveToArchive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
  v5 = v4;
  if (v3 && v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

  return v5;
}

- (id)serialize
{
  id v3;
  void *v4;
  int v5;
  _BYTE v7[96];

  topotext::Selection::Selection((topotext::Selection *)v7);
  -[TTMergeableStringSelection saveToArchive:](self, "saveToArchive:", v7);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::Selection::ByteSize((topotext::Selection *)v7)));
  v4 = (void *)objc_msgSend(v3, "mutableBytes");
  v5 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v3, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::Selection::~Selection((topotext::Selection *)v7);
  return v3;
}

- (NSString)description
{
  id v3;
  id *begin;
  id *i;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<TTMergeableStringSelection %p "), self);
  begin = (id *)self->_selectionRanges.__begin_;
  for (i = (id *)self->_selectionRanges.__end_; begin != i; begin += 4)
  {
    objc_msgSend(*begin, "TTShortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@:%d"), v6, *((unsigned int *)begin + 2));

    v7 = begin[2];
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = *((_DWORD *)begin + 6);

      if (!v9)
        continue;
    }
    else
    {

    }
    objc_msgSend(begin[2], "TTShortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("-%@:%d"), v10, *((unsigned int *)begin + 6));

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (unint64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(unint64_t)a3
{
  self->_selectionAffinity = a3;
}

- (void).cxx_destruct
{
  vector<std::pair<TopoID, TopoID>, std::allocator<std::pair<TopoID, TopoID>>> *p_selectionRanges;

  p_selectionRanges = &self->_selectionRanges;
  std::vector<std::pair<TopoID,TopoID>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_selectionRanges);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "TTMergeableStringSelection protobuf corrupt.", v1, 2u);
}

@end
