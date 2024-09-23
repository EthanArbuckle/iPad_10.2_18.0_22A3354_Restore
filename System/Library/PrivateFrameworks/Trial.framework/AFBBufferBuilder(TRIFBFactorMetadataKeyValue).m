@implementation AFBBufferBuilder(TRIFBFactorMetadataKeyValue)

- (id)trifbCreateFactorMetadataKeyValueUsingBlock:()TRIFBFactorMetadataKeyValue
{
  void (**v5)(id, TRIFBFactorMetadataKeyValueBuilder *);
  void *v6;
  TRIFBFactorMetadataKeyValueBuilder *v7;
  id v8;
  TRIFBFactorMetadataKeyValueBuilder *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v16;
  uint64_t v17;
  int *v18;
  unsigned __int16 *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  objc_super v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2857, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  v7 = [TRIFBFactorMetadataKeyValueBuilder alloc];
  v8 = a1;
  if (v7)
  {
    v30.receiver = v7;
    v30.super_class = (Class)TRIFBFactorMetadataKeyValueBuilder;
    v9 = (TRIFBFactorMetadataKeyValueBuilder *)objc_msgSendSuper2(&v30, sel_init);
    v7 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_owner, a1);
      objc_msgSend(v8, "firstError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (v11)
      {
        v12 = operator new();
        v13 = objc_msgSend(v8, "fbb");
        *(_QWORD *)v12 = v13;
        apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(v13);
        *(_BYTE *)(v13 + 70) = 1;
        *(_DWORD *)(v12 + 8) = *(_DWORD *)(v13 + 32) - *(_DWORD *)(v13 + 48) + *(_DWORD *)(v13 + 40);
        v7->_bldr = (FactorMetadataKeyValueBuilder *)v12;
      }
    }
  }

  v5[2](v5, v7);
  if (!v7)
  {
    v21 = 0;
    goto LABEL_18;
  }
  -[AFBBufferBuilder firstError](v7->_owner, "firstError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
    goto LABEL_17;
  v16 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)-[AFBBufferBuilder fbb](v7->_owner, "fbb");
  v17 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v16, v7->_bldr->var1);
  v18 = (int *)(*((_QWORD *)v16 + 5) + *((_QWORD *)v16 + 4) - v17);
  v19 = (unsigned __int16 *)((char *)v18 - *v18);
  v20 = *v19;
  if (v20 < 5 || !v19[2])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__finish, v7, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2803, CFSTR("%@"), CFSTR("Failed to set required field \"key\" on a table of type: TRIFBFactorMetadataKeyValueBuilder"));

    v31[0] = *MEMORY[0x1E0CB2D50];
    v30.receiver = CFSTR("Failed to set required field \"key\" on a table of type: TRIFBFactorMetadataKeyValueBuilder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, v31, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 4, v23);
    -[AFBBufferBuilder setError:](v7->_owner, "setError:", v25);
LABEL_16:

LABEL_17:
    v21 = &unk_1E3C194F0;
    goto LABEL_18;
  }
  if (v20 < 7 || !v19[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__finish, v7, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2814, CFSTR("%@"), CFSTR("Failed to set required field \"val\" on a table of type: TRIFBFactorMetadataKeyValueBuilder"));

    v31[0] = *MEMORY[0x1E0CB2D50];
    v30.receiver = CFSTR("Failed to set required field \"val\" on a table of type: TRIFBFactorMetadataKeyValueBuilder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, v31, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 4, v23);
    -[AFBBufferBuilder setError:](v7->_owner, "setError:", v25);
    goto LABEL_16;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v17);
LABEL_18:

  objc_autoreleasePoolPop(v6);
  return v21;
}

- (id)trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets:()TRIFBFactorMetadataKeyValue
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _BYTE *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t v19;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  void *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  __n128 (*v36)(__n128 *, __n128 *);
  void (*v37)(uint64_t);
  void *v38;
  void *__p;
  char *v40;
  char *v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2866, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsets"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  objc_msgSend(a1, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_1E3C194F0;
  }
  else
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x4812000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    v38 = &unk_19B92CED3;
    __p = 0;
    v40 = 0;
    v41 = 0;
    v8 = objc_msgSend(v5, "count");
    v9 = __p;
    if (v8 > (v41 - (_BYTE *)__p) >> 2)
    {
      if (v8 >> 62)
        std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]();
      v10 = v40;
      v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>>(v8);
      v12 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFFCLL];
      v14 = &v11[4 * v13];
      v15 = (char *)__p;
      v16 = v40;
      v17 = v12;
      if (v40 != __p)
      {
        v17 = v12;
        do
        {
          v18 = *((_DWORD *)v16 - 1);
          v16 -= 4;
          *((_DWORD *)v17 - 1) = v18;
          v17 -= 4;
        }
        while (v16 != v15);
      }
      __p = v17;
      v40 = v12;
      v41 = v14;
      if (v15)
        operator delete(v15);
    }
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __108__AFBBufferBuilder_TRIFBFactorMetadataKeyValue__trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets___block_invoke;
    v32[3] = &unk_1E3BFED80;
    v32[4] = &v33;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v32);
    v19 = objc_msgSend(a1, "fbb");
    v20 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)v19;
    v21 = v34[6];
    v22 = v34[7];
    v23 = (v22 - v21) >> 2;
    v24 = 126 - 2 * __clz(v23);
    if (v22 == v21)
      v25 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>,std::allocator<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>>(std::vector<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>> &)::t;
    else
      v25 = (char *)v34[6];
    v42[0] = v19;
    if (v22 == v21)
      v26 = 0;
    else
      v26 = v24;
    std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorMetadataKeyValue> &,apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue> *,false>((uint64_t)v25, (unsigned int *)&v25[v22 - v21], (uint64_t)v42, v26, 1);
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(v20, (v22 - v21) >> 2, 4uLL);
    if (v21 != v22)
    {
      v27 = v25 - 4;
      v28 = (v22 - v21) >> 2;
      do
      {
        v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v20, *(_DWORD *)&v27[4 * v28]);
        apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v20, v29);
        --v28;
      }
      while (v28);
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v20, v23));
    _Block_object_dispose(&v33, 8);
    if (__p)
    {
      v40 = (char *)__p;
      operator delete(__p);
    }
  }

  return v7;
}

- (id)trifbFinishedBufferWithRootFactorMetadataKeyValueOfs:()TRIFBFactorMetadataKeyValue error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  unsigned int v15;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v16;
  const char *v17;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2883, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  objc_msgSend(a1, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (a4)
    {
      objc_msgSend(a1, "firstError");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_16;
  }
  v10 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(a1, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v26 = 0;
    v12 = objc_msgSend(a1, "trifbFinishBufferWithRootFactorMetadataKeyValueOfs:error:", v7, &v26);
    v13 = v26;
    if (!v12)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v25 = v13;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v11, 8, &v25);
    v14 = v25;
  }
  else
  {
    v13 = v7;
    v15 = objc_msgSend(v13, "unsignedIntValue");
    v16 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb");
    apple::aiml::flatbuffers2::FlatBufferBuilder::Finish(v16, v15, v17);
    objc_msgSend(a1, "finalizeWithSelector:", a2);
    v18 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
    apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v18, objc_msgSend(a1, "fbb"));
    v19 = objc_alloc(MEMORY[0x1E0C99D50]);
    v20 = *((_QWORD *)v18 + 4);
    v21 = *((_QWORD *)v18 + 5);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __108__AFBBufferBuilder_TRIFBFactorMetadataKeyValue__trifbFinishedBufferWithRootFactorMetadataKeyValueOfs_error___block_invoke;
    v24[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v24[4] = v18;
    v9 = (void *)objc_msgSend(v19, "initWithBytesNoCopy:length:deallocator:", v20, v21, v24);
    v14 = 0;
  }

  v13 = v14;
LABEL_13:

  objc_autoreleasePoolPop(v10);
  if (a4)
    *a4 = objc_retainAutorelease(v13);

LABEL_16:
  return v9;
}

- (uint64_t)trifbFinishBufferWithRootFactorMetadataKeyValueOfs:()TRIFBFactorMetadataKeyValue error:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  unsigned int v12;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v13;
  const char *v14;
  uint64_t BufferPointer;
  _DWORD *v16;
  int v17;
  int v18;
  int v19;
  id v20;
  void *v22;
  id v23;
  _BYTE v24[48];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2917, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  objc_msgSend(a1, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (a4)
    {
      objc_msgSend(a1, "firstError");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC6B8C]();
    v11 = v7;
    v12 = objc_msgSend(v11, "unsignedIntValue");
    v13 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb");
    apple::aiml::flatbuffers2::FlatBufferBuilder::Finish(v13, v12, v14);
    BufferPointer = apple::aiml::flatbuffers2::FlatBufferBuilder::GetBufferPointer((apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb"));
    v16 = (_DWORD *)objc_msgSend(a1, "fbb");
    v17 = v16[8];
    v18 = v16[12];
    v19 = v16[10];
    apple::aiml::flatbuffers2::FlatBufferBuilder::Release((apple::aiml::flatbuffers2::FlatBufferBuilder *)v24, objc_msgSend(a1, "fbb"));
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer((apple::aiml::flatbuffers2::DetachedBuffer *)v24);
    v23 = 0;
    v9 = objc_msgSend(a1, "finalizeWithSelector:allocatorBufferAddr:size:error:", a2, BufferPointer, (v17 - v18 + v19), &v23);
    v20 = v23;

    objc_autoreleasePoolPop(v10);
    if (a4)
      *a4 = objc_retainAutorelease(v20);

  }
  return v9;
}

@end
