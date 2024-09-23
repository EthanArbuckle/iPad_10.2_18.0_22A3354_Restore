@implementation CRCoderArchiver

+ (void)initialize
{
  +[CRCoder registerCRClasses](CRCoder, "registerCRClasses");
}

+ (id)encodedDataWithDocument:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "encodeDocument:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)encodeDocument:(id)a3
{
  id v4;
  CRDT::Document *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CRDT::VectorTimestamp *v11;
  void *v12;
  void *v13;
  void *v14;
  CRDT::VectorTimestamp *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  topotext::VectorTimestamp *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int *v26;
  int32x2_t *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  CRDT::Document_DocObject *v31;
  int32x2_t v32;
  int32x2_t v33;
  vector<CRDT::Document_DocObject *, std::allocator<CRDT::Document_DocObject *>> *p_currentDocObjectEncodingStack;
  Document_DocObject **value;
  Document_DocObject **end;
  Document_DocObject **v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  Document_DocObject **v43;
  Document_DocObject **v44;
  Document_DocObject **v45;
  Document_DocObject **begin;
  Document_DocObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  int *v54;
  int32x2_t *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void **v59;
  int32x2_t v60;
  int32x2_t v61;
  __int128 v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  int *v67;
  int32x2_t *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  void **v72;
  int32x2_t v73;
  int32x2_t v74;
  __int128 v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  int *v81;
  int32x2_t *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  int32x2_t v87;
  int32x2_t v88;
  id v89;
  void *v90;
  void *v91;
  google::protobuf::MessageLite *v92;
  id v93;
  void *v94;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  __int128 v110;
  void *v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (CRDT::Document *)operator new();
  CRDT::Document::Document(v5);
  -[CRCoderArchiver setCurrentDocument:](self, "setCurrentDocument:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[CRCoderArchiver setKeySet:](self, "setKeySet:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[CRCoderArchiver setUuidSet:](self, "setUuidSet:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[CRCoderArchiver setEncodedObjects:](self, "setEncodedObjects:", v8);

  objc_msgSend(v4, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRCoderArchiver currentDocument](self, "currentDocument");
  *((_DWORD *)v10 + 8) |= 1u;
  v11 = (CRDT::VectorTimestamp *)*((_QWORD *)v10 + 5);
  if (!v11)
  {
    v11 = (CRDT::VectorTimestamp *)operator new();
    CRDT::VectorTimestamp::VectorTimestamp(v11);
    *((_QWORD *)v10 + 5) = v11;
  }
  objc_msgSend(v9, "encodeIntoProtobufTimestamp:coder:", v11, self);

  objc_msgSend(v4, "startVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "startVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CRCoderArchiver currentDocument](self, "currentDocument");
    *((_DWORD *)v14 + 8) |= 2u;
    v15 = (CRDT::VectorTimestamp *)*((_QWORD *)v14 + 6);
    if (!v15)
    {
      v15 = (CRDT::VectorTimestamp *)operator new();
      CRDT::VectorTimestamp::VectorTimestamp(v15);
      *((_QWORD *)v14 + 6) = v15;
    }
    objc_msgSend(v13, "encodeIntoProtobufTimestamp:coder:", v15, self);

  }
  v16 = objc_opt_class();
  REMDynamicCast(v16, (uint64_t)v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "sharedTopotextTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CRCoderArchiver currentDocument](self, "currentDocument");
    *((_DWORD *)v20 + 8) |= 0x40u;
    v21 = (topotext::VectorTimestamp *)*((_QWORD *)v20 + 19);
    if (!v21)
    {
      v21 = (topotext::VectorTimestamp *)operator new();
      topotext::VectorTimestamp::VectorTimestamp(v21);
      *((_QWORD *)v20 + 19) = v21;
    }
    objc_msgSend(v19, "saveToArchive:", v21);

  }
  -[CRCoderArchiver encodedObjects](self, "encodedObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v4, "rootObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueWithNonretainedObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v25);

  v26 = -[CRCoderArchiver currentDocument](self, "currentDocument");
  v27 = (int32x2_t *)v26;
  v28 = v26[17];
  v29 = v26[16];
  if ((int)v29 >= v28)
  {
    if (v28 == v26[18])
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v26 + 14, v28 + 1);
    v31 = google::protobuf::internal::GenericTypeHandler<CRDT::Document_DocObject>::New();
    v32 = v27[7];
    v33 = v27[8];
    v27[8] = vadd_s32(v33, (int32x2_t)0x100000001);
    *(_QWORD *)(*(_QWORD *)&v32 + 8 * v33.i32[0]) = v31;
  }
  else
  {
    v30 = *((_QWORD *)v26 + 7);
    v26[16] = v29 + 1;
    v31 = *(CRDT::Document_DocObject **)(v30 + 8 * v29);
  }
  p_currentDocObjectEncodingStack = &self->currentDocObjectEncodingStack;
  value = self->currentDocObjectEncodingStack.__end_cap_.__value_;
  end = self->currentDocObjectEncodingStack.__end_;
  if (end >= value)
  {
    v38 = end - p_currentDocObjectEncodingStack->__begin_;
    if ((unint64_t)(v38 + 1) >> 61)
      std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
    v39 = (char *)value - (char *)p_currentDocObjectEncodingStack->__begin_;
    v40 = v39 >> 2;
    if (v39 >> 2 <= (unint64_t)(v38 + 1))
      v40 = v38 + 1;
    if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
      v41 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v41 = v40;
    if (v41)
      v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)&self->currentDocObjectEncodingStack.__end_cap_, v41);
    else
      v42 = 0;
    v43 = (Document_DocObject **)&v42[8 * v38];
    v44 = (Document_DocObject **)&v42[8 * v41];
    *v43 = (Document_DocObject *)v31;
    v37 = v43 + 1;
    begin = p_currentDocObjectEncodingStack->__begin_;
    v45 = self->currentDocObjectEncodingStack.__end_;
    if (v45 != p_currentDocObjectEncodingStack->__begin_)
    {
      do
      {
        v47 = *--v45;
        *--v43 = v47;
      }
      while (v45 != begin);
      v45 = p_currentDocObjectEncodingStack->__begin_;
    }
    p_currentDocObjectEncodingStack->__begin_ = v43;
    self->currentDocObjectEncodingStack.__end_ = v37;
    self->currentDocObjectEncodingStack.__end_cap_.__value_ = v44;
    if (v45)
      operator delete(v45);
  }
  else
  {
    *end = (Document_DocObject *)v31;
    v37 = end + 1;
  }
  self->currentDocObjectEncodingStack.__end_ = v37;
  objc_msgSend(v4, "rootObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "encodeWithCRCoder:", self);

  objc_msgSend(v4, "rootObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCoderArchiver setTypeIndexForCurrentCustomObjectIfNecessary:](self, "setTypeIndexForCurrentCustomObjectIfNecessary:", v49);

  self->currentDocObjectEncodingStack.__end_ = self->currentDocObjectEncodingStack.__begin_;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  -[CRCoderArchiver keySet](self, "keySet");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v105 != v52)
          objc_enumerationMutation(v50);
        std::string::basic_string[abi:ne180100]<0>(&v110, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i)), "UTF8String"));
        v54 = -[CRCoderArchiver currentDocument](self, "currentDocument");
        v55 = (int32x2_t *)v54;
        v56 = v54[23];
        v57 = v54[22];
        if ((int)v57 >= v56)
        {
          if (v56 == v54[24])
            v54 = google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v54 + 20, v56 + 1);
          v59 = (void **)google::protobuf::internal::StringTypeHandlerBase::New((google::protobuf::internal::StringTypeHandlerBase *)v54);
          v60 = v55[10];
          v61 = v55[11];
          v55[11] = vadd_s32(v61, (int32x2_t)0x100000001);
          *(_QWORD *)(*(_QWORD *)&v60 + 8 * v61.i32[0]) = v59;
        }
        else
        {
          v58 = *((_QWORD *)v54 + 10);
          v54[22] = v57 + 1;
          v59 = *(void ***)(v58 + 8 * v57);
        }
        if (*((char *)v59 + 23) < 0)
          operator delete(*v59);
        v62 = v110;
        v59[2] = v111;
        *(_OWORD *)v59 = v62;
      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
    }
    while (v51);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[CRCoder typeSet](self, "typeSet");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v64; ++j)
      {
        if (*(_QWORD *)v101 != v65)
          objc_enumerationMutation(v63);
        std::string::basic_string[abi:ne180100]<0>(&v110, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v100 + 1) + 8 * j)), "UTF8String"));
        v67 = -[CRCoderArchiver currentDocument](self, "currentDocument");
        v68 = (int32x2_t *)v67;
        v69 = v67[29];
        v70 = v67[28];
        if ((int)v70 >= v69)
        {
          if (v69 == v67[30])
            v67 = google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v67 + 26, v69 + 1);
          v72 = (void **)google::protobuf::internal::StringTypeHandlerBase::New((google::protobuf::internal::StringTypeHandlerBase *)v67);
          v73 = v68[13];
          v74 = v68[14];
          v68[14] = vadd_s32(v74, (int32x2_t)0x100000001);
          *(_QWORD *)(*(_QWORD *)&v73 + 8 * v74.i32[0]) = v72;
        }
        else
        {
          v71 = *((_QWORD *)v67 + 13);
          v67[28] = v70 + 1;
          v72 = *(void ***)(v71 + 8 * v70);
        }
        if (*((char *)v72 + 23) < 0)
          operator delete(*v72);
        v75 = v110;
        v72[2] = v111;
        *(_OWORD *)v72 = v75;
      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
    }
    while (v64);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[CRCoderArchiver uuidSet](self, "uuidSet", 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v77; ++k)
      {
        if (*(_QWORD *)v97 != v78)
          objc_enumerationMutation(v76);
        v80 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * k);
        v110 = 0uLL;
        objc_msgSend(v80, "getUUIDBytes:", &v110);
        v81 = -[CRCoderArchiver currentDocument](self, "currentDocument");
        v82 = (int32x2_t *)v81;
        v83 = v81[35];
        v84 = v81[34];
        if ((int)v84 >= v83)
        {
          if (v83 == v81[36])
            v81 = google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v81 + 32, v83 + 1);
          v86 = google::protobuf::internal::StringTypeHandlerBase::New((google::protobuf::internal::StringTypeHandlerBase *)v81);
          v87 = v82[16];
          v88 = v82[17];
          v82[17] = vadd_s32(v88, (int32x2_t)0x100000001);
          *(_QWORD *)(*(_QWORD *)&v87 + 8 * v88.i32[0]) = v86;
        }
        else
        {
          v85 = *((_QWORD *)v81 + 16);
          v81[34] = v84 + 1;
          v86 = *(_QWORD **)(v85 + 8 * v84);
        }
        MEMORY[0x1B5E3DB34](v86, &v110, 16);
      }
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
    }
    while (v77);
  }

  -[CRCoderArchiver setUuidSet:](self, "setUuidSet:", 0);
  -[CRCoderArchiver setKeySet:](self, "setKeySet:", 0);
  -[CRCoderArchiver setEncodedObjects:](self, "setEncodedObjects:", 0);
  v89 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v90 = -[CRCoderArchiver currentDocument](self, "currentDocument");
  v91 = (void *)objc_msgSend(v89, "initWithLength:", (*(int (**)(void *))(*(_QWORD *)v90 + 72))(v90));
  v92 = -[CRCoderArchiver currentDocument](self, "currentDocument");
  v93 = objc_retainAutorelease(v91);
  google::protobuf::MessageLite::SerializeToArray(v92, (void *)objc_msgSend(v93, "mutableBytes"), objc_msgSend(v93, "length"));
  v94 = -[CRCoderArchiver currentDocument](self, "currentDocument");
  if (v94)
    (*(void (**)(void *))(*(_QWORD *)v94 + 8))(v94);
  -[CRCoderArchiver setCurrentDocument:](self, "setCurrentDocument:", 0);

  return v93;
}

- (void)setTypeIndexForCurrentCustomObjectIfNecessary:(id)a3
{
  unint64_t v4;
  int v5;
  _DWORD *v6;
  id v7;

  v7 = a3;
  v4 = -[CRCoder typeIndexForClass:](self, "typeIndexForClass:", objc_opt_class());
  v5 = v4;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[CRCoderArchiver currentCustomObjectForEncoding](self, "currentCustomObjectForEncoding");
    v6[8] |= 1u;
    v6[16] = v5;
  }

}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    -[CRCoderArchiver encodeObject:forObjectID:](self, "encodeObject:forObjectID:", v7, -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:", v6));

}

- (void)encodeObject:(id)a3 forObjectID:(void *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  int *v10;
  int32x2_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  CRDT::Document_DocObject *v15;
  int32x2_t v16;
  int32x2_t v17;
  vector<CRDT::Document_DocObject *, std::allocator<CRDT::Document_DocObject *>> *p_currentDocObjectEncodingStack;
  Document_DocObject **value;
  Document_DocObject **end;
  Document_DocObject **v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  Document_DocObject **v27;
  Document_DocObject **v28;
  Document_DocObject **v29;
  Document_DocObject **begin;
  Document_DocObject *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  -[CRCoderArchiver encodedObjects](self, "encodedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = *(_DWORD *)(-[CRCoderArchiver currentDocument](self, "currentDocument") + 64);
    if (*((_DWORD *)a4 + 12) != 6)
    {
      CRDT::ObjectID::clear_contents((uint64_t)a4);
      *((_DWORD *)a4 + 12) = 6;
    }
    *((_DWORD *)a4 + 10) = v9;
    v10 = -[CRCoderArchiver currentDocument](self, "currentDocument");
    v11 = (int32x2_t *)v10;
    v12 = v10[17];
    v13 = v10[16];
    if ((int)v13 >= v12)
    {
      if (v12 == v10[18])
        google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v10 + 14, v12 + 1);
      v15 = google::protobuf::internal::GenericTypeHandler<CRDT::Document_DocObject>::New();
      v16 = v11[7];
      v17 = v11[8];
      v11[8] = vadd_s32(v17, (int32x2_t)0x100000001);
      *(_QWORD *)(*(_QWORD *)&v16 + 8 * v17.i32[0]) = v15;
    }
    else
    {
      v14 = *((_QWORD *)v10 + 7);
      v10[16] = v13 + 1;
      v15 = *(CRDT::Document_DocObject **)(v14 + 8 * v13);
    }
    p_currentDocObjectEncodingStack = &self->currentDocObjectEncodingStack;
    value = self->currentDocObjectEncodingStack.__end_cap_.__value_;
    end = self->currentDocObjectEncodingStack.__end_;
    if (end >= value)
    {
      v22 = end - p_currentDocObjectEncodingStack->__begin_;
      if ((unint64_t)(v22 + 1) >> 61)
        std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
      v23 = (char *)value - (char *)p_currentDocObjectEncodingStack->__begin_;
      v24 = v23 >> 2;
      if (v23 >> 2 <= (unint64_t)(v22 + 1))
        v24 = v22 + 1;
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
        v25 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v25 = v24;
      if (v25)
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)&self->currentDocObjectEncodingStack.__end_cap_, v25);
      else
        v26 = 0;
      v27 = (Document_DocObject **)&v26[8 * v22];
      v28 = (Document_DocObject **)&v26[8 * v25];
      *v27 = (Document_DocObject *)v15;
      v21 = v27 + 1;
      begin = p_currentDocObjectEncodingStack->__begin_;
      v29 = self->currentDocObjectEncodingStack.__end_;
      if (v29 != p_currentDocObjectEncodingStack->__begin_)
      {
        do
        {
          v31 = *--v29;
          *--v27 = v31;
        }
        while (v29 != begin);
        v29 = p_currentDocObjectEncodingStack->__begin_;
      }
      p_currentDocObjectEncodingStack->__begin_ = v27;
      self->currentDocObjectEncodingStack.__end_ = v21;
      self->currentDocObjectEncodingStack.__end_cap_.__value_ = v28;
      if (v29)
        operator delete(v29);
    }
    else
    {
      *end = (Document_DocObject *)v15;
      v21 = end + 1;
    }
    self->currentDocObjectEncodingStack.__end_ = v21;
    -[CRCoderArchiver encodedObjects](self, "encodedObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v33);

    -[CRCoderArchiver setTypeIndexForCurrentCustomObjectIfNecessary:](self, "setTypeIndexForCurrentCustomObjectIfNecessary:", v34);
    objc_msgSend(v34, "encodeWithCRCoder:", self);
    --self->currentDocObjectEncodingStack.__end_;
  }
  else
  {
    if (*((_DWORD *)a4 + 12) != 6)
    {
      CRDT::ObjectID::clear_contents((uint64_t)a4);
      *((_DWORD *)a4 + 12) = 6;
    }
    *((_DWORD *)a4 + 10) = v8;
  }

}

- (void)encodeString:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  std::string *v9;
  std::string __str;

  v6 = a3;
  v7 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:", a4);
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v8, "UTF8String"));
  if (*((_DWORD *)v7 + 12) == 4)
  {
    v9 = (std::string *)*((_QWORD *)v7 + 5);
  }
  else
  {
    CRDT::ObjectID::clear_contents((uint64_t)v7);
    *((_DWORD *)v7 + 12) = 4;
    v9 = (std::string *)operator new();
    v9->__r_.__value_.__r.__words[0] = 0;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    *((_QWORD *)v7 + 5) = v9;
  }
  std::string::operator=(v9, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

}

- (void)encodeUUID:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCoderArchiver encodeString:forKey:](self, "encodeString:forKey:", v6, v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  _DWORD *v6;
  double *v7;
  id v8;

  v8 = a4;
  v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  v7 = (double *)v6;
  if (v6[12] != 3)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    *((_DWORD *)v7 + 12) = 3;
  }
  v7[5] = a3;

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  _DWORD *v6;
  _DWORD *v7;
  id v8;

  v8 = a4;
  v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  v7 = v6;
  if (v6[12] != 1)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 1;
  }
  *((_QWORD *)v7 + 5) = a3;

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  _DWORD *v6;
  _DWORD *v7;
  id v8;

  v8 = a4;
  v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  v7 = v6;
  if (v6[12] != 1)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 1;
  }
  *((_QWORD *)v7 + 5) = a3;

}

- (void)encodeUInt32:(unsigned int)a3 forKey:(id)a4
{
  _DWORD *v6;
  _DWORD *v7;
  id v8;

  v8 = a4;
  v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  v7 = v6;
  if (v6[12] != 2)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 2;
  }
  *((_QWORD *)v7 + 5) = a3;

}

- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4
{
  _DWORD *v6;
  _DWORD *v7;
  id v8;

  v8 = a4;
  v6 = -[CRCoderArchiver mutableObjectIDForKey:](self, "mutableObjectIDForKey:");
  v7 = v6;
  if (v6[12] != 2)
  {
    CRDT::ObjectID::clear_contents((uint64_t)v6);
    v7[12] = 2;
  }
  *((_QWORD *)v7 + 5) = a3;

}

- (unint64_t)encodeUUIDIndexFromUUID:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRCoderArchiver uuidSet](self, "uuidSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CRCoderArchiver uuidSet](self, "uuidSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count");

    -[CRCoderArchiver uuidSet](self, "uuidSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
  return v6;
}

- (void)mutableObjectIDForKey:(id)a3
{
  id v4;
  int *v5;
  int32x2_t *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  CRDT::Document_CustomObject_MapEntry *v10;
  int32x2_t v11;
  int32x2_t v12;
  int v13;
  int v14;
  CRDT::ObjectID *v15;

  v4 = a3;
  v5 = -[CRCoderArchiver currentCustomObjectForEncoding](self, "currentCustomObjectForEncoding");
  v6 = (int32x2_t *)v5;
  v7 = v5[13];
  v8 = v5[12];
  if ((int)v8 >= v7)
  {
    if (v7 == v5[14])
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v5 + 10, v7 + 1);
    v10 = google::protobuf::internal::GenericTypeHandler<CRDT::Document_CustomObject_MapEntry>::New();
    v11 = v6[5];
    v12 = v6[6];
    v6[6] = vadd_s32(v12, (int32x2_t)0x100000001);
    *(_QWORD *)(*(_QWORD *)&v11 + 8 * v12.i32[0]) = v10;
  }
  else
  {
    v9 = *((_QWORD *)v5 + 5);
    v5[12] = v8 + 1;
    v10 = *(CRDT::Document_CustomObject_MapEntry **)(v9 + 8 * v8);
  }
  v13 = -[CRCoderArchiver indexForKey:](self, "indexForKey:", v4);
  v14 = *((_DWORD *)v10 + 8);
  *((_DWORD *)v10 + 12) = v13;
  *((_DWORD *)v10 + 8) = v14 | 3;
  v15 = (CRDT::ObjectID *)*((_QWORD *)v10 + 5);
  if (!v15)
  {
    v15 = (CRDT::ObjectID *)operator new();
    CRDT::ObjectID::ObjectID(v15);
    *((_QWORD *)v10 + 5) = v15;
  }

  return v15;
}

- (void)currentCustomObjectForEncoding
{
  void **v2;
  void **v3;
  CRDT::Document_CustomObject *v4;

  v2 = -[CRCoderArchiver currentDocumentObjectForEncoding](self, "currentDocumentObjectForEncoding");
  v3 = v2;
  if (*((_DWORD *)v2 + 12) == 13)
    return v2[5];
  CRDT::Document_DocObject::clear_contents((uint64_t)v2);
  *((_DWORD *)v3 + 12) = 13;
  v4 = (CRDT::Document_CustomObject *)operator new();
  CRDT::Document_CustomObject::Document_CustomObject(v4);
  v3[5] = v4;
  return v4;
}

- (void)currentDocumentObjectForEncoding
{
  return (void *)*((_QWORD *)self->currentDocObjectEncodingStack.__end_ - 1);
}

- (int)indexForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRCoderArchiver keySet](self, "keySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CRCoderArchiver keySet](self, "keySet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "count");

    -[CRCoderArchiver keySet](self, "keySet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
  return v6;
}

- (NSMutableOrderedSet)uuidSet
{
  return self->_uuidSet;
}

- (void)setUuidSet:(id)a3
{
  objc_storeStrong((id *)&self->_uuidSet, a3);
}

- (NSMutableOrderedSet)keySet
{
  return self->_keySet;
}

- (void)setKeySet:(id)a3
{
  objc_storeStrong((id *)&self->_keySet, a3);
}

- (NSMutableOrderedSet)encodedObjects
{
  return self->_encodedObjects;
}

- (void)setEncodedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_encodedObjects, a3);
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (void).cxx_destruct
{
  Document_DocObject **begin;

  objc_storeStrong((id *)&self->_encodedObjects, 0);
  objc_storeStrong((id *)&self->_keySet, 0);
  objc_storeStrong((id *)&self->_uuidSet, 0);
  begin = self->currentDocObjectEncodingStack.__begin_;
  if (begin)
  {
    self->currentDocObjectEncodingStack.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
