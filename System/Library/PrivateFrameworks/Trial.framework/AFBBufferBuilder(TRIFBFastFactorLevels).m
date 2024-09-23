@implementation AFBBufferBuilder(TRIFBFastFactorLevels)

- (id)trifbCreateFastFactorLevelsUsingBlock:()TRIFBFastFactorLevels
{
  void (**v5)(id, TRIFBFastFactorLevelsBuilder *);
  void *v6;
  TRIFBFastFactorLevelsBuilder *v7;
  id v8;
  TRIFBFastFactorLevelsBuilder *v9;
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
  void *v28;
  id v29;
  void *v31;
  objc_super v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4683, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  v7 = [TRIFBFastFactorLevelsBuilder alloc];
  v8 = a1;
  if (v7)
  {
    v32.receiver = v7;
    v32.super_class = (Class)TRIFBFastFactorLevelsBuilder;
    v9 = (TRIFBFastFactorLevelsBuilder *)objc_msgSendSuper2(&v32, sel_init);
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
        v7->_bldr = (FastFactorLevelsBuilder *)v12;
      }
    }
  }

  v5[2](v5, v7);
  if (!v7)
  {
    v21 = 0;
    goto LABEL_21;
  }
  -[AFBBufferBuilder firstError](v7->_owner, "firstError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
    goto LABEL_20;
  v16 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)-[AFBBufferBuilder fbb](v7->_owner, "fbb");
  v17 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v16, v7->_bldr->var1);
  v18 = (int *)(*((_QWORD *)v16 + 5) + *((_QWORD *)v16 + 4) - v17);
  v19 = (unsigned __int16 *)((char *)v18 - *v18);
  v20 = *v19;
  if (v20 < 5 || !v19[2])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__finish, v7, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4588, CFSTR("%@"), CFSTR("Failed to set required field \"levels\" on a table of type: TRIFBFastFactorLevelsBuilder"));

    v33[0] = *MEMORY[0x1E0CB2D50];
    v32.receiver = CFSTR("Failed to set required field \"levels\" on a table of type: TRIFBFastFactorLevelsBuilder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, v33, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 4, v23);
    -[AFBBufferBuilder setError:](v7->_owner, "setError:", v25);
LABEL_19:

LABEL_20:
    v21 = &unk_1E3C194F0;
    goto LABEL_21;
  }
  if (v20 < 9 || !v19[4])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__finish, v7, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4599, CFSTR("%@"), CFSTR("Failed to set required field \"source\" on a table of type: TRIFBFastFactorLevelsBuilder"));

    v33[0] = *MEMORY[0x1E0CB2D50];
    v32.receiver = CFSTR("Failed to set required field \"source\" on a table of type: TRIFBFastFactorLevelsBuilder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, v33, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 4, v23);
    -[AFBBufferBuilder setError:](v7->_owner, "setError:", v25);
    goto LABEL_19;
  }
  if (v20 < 0xB || !v19[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__finish, v7, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4610, CFSTR("%@"), CFSTR("Failed to set required field \"namespaceName\" on a table of type: TRIFBFastFactorLevelsBuilder"));

    v33[0] = *MEMORY[0x1E0CB2D50];
    v32.receiver = CFSTR("Failed to set required field \"namespaceName\" on a table of type: TRIFBFastFactorLevelsBuilder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, v33, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFCEB0], 4, v23);
    -[AFBBufferBuilder setError:](v7->_owner, "setError:", v25);
    goto LABEL_19;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v17);
LABEL_21:

  objc_autoreleasePoolPop(v6);
  return v21;
}

- (id)trifbCreateVectorOfFastFactorLevelsWithOffsets:()TRIFBFastFactorLevels
{
  id result;

  *a2 = &off_1E3BFE1B0;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbFinishedBufferWithRootFastFactorLevelsOfs:()TRIFBFastFactorLevels error:
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
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4705, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

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
    v12 = objc_msgSend(a1, "trifbFinishBufferWithRootFastFactorLevelsOfs:error:", v7, &v26);
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
    v24[2] = __96__AFBBufferBuilder_TRIFBFastFactorLevels__trifbFinishedBufferWithRootFastFactorLevelsOfs_error___block_invoke;
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

- (uint64_t)trifbFinishBufferWithRootFastFactorLevelsOfs:()TRIFBFastFactorLevels error:
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
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4739, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

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

- (uint64_t)trifbCreateVectorOfFastFactorLevelsWithOffsets:()TRIFBFastFactorLevels
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z90-[AFBBufferBuilder(TRIFBFastFactorLevels) trifbCreateVectorOfFastFactorLevelsWithOffsets:]E3$_4"
    || ((v3 & (unint64_t)"Z90-[AFBBufferBuilder(TRIFBFastFactorLevels) trifbCreateVectorOfFastFactorLevelsWithOffsets:]E3$_4" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z90-[AFBBufferBuilder(TRIFBFastFactorLevels) trifbCreateVectorOfFastFactorLevelsWithOffsets:]E3$_4")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z90-[AFBBufferBuilder(TRIFBFastFactorLevels) trifbCreateVectorOfFastFactorLevelsWithOffsets:]E3$_4" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfFastFactorLevelsWithOffsets:()TRIFBFastFactorLevels
{
}

- (_QWORD)trifbCreateVectorOfFastFactorLevelsWithOffsets:()TRIFBFastFactorLevels
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3BFE1B0;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

@end
