@implementation AFBBufferBuilder(TRIFBBoxedBool)

- (id)trifbCreateBoxedBoolFromBoxedBool:()TRIFBBoxedBool
{
  id v5;
  void *v6;
  void *v7;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v8;
  _BYTE *v9;
  uint64_t v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 5065, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BoxedBool"));

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
    v8 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb");
    v9 = (_BYTE *)objc_msgSend(v5, "cppPointer");
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v8);
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align(v8, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v8, 1uLL);
    v10 = *((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = v10 - 1;
    *(_BYTE *)(v10 - 1) = *v9;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((_QWORD *)v8 + 4)- *((_QWORD *)v8 + 6)+ *((_QWORD *)v8 + 5));
  }

  return v7;
}

- (id)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool
{
  id result;

  *a2 = &off_1E3BFDFA0;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:
{
  id v7;
  void *v8;
  void *v9;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v10;
  uint64_t VectorOf;
  _QWORD *v12;
  uint64_t v13;
  void *v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 5092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  objc_msgSend(a1, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v10 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb");
    v16[0] = &off_1E3BFE0A8;
    v16[1] = MEMORY[0x1A1AC6D30](v7);
    v17 = v16;
    VectorOf = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedBool>(v10, a3, (uint64_t)v16);
    v12 = v17;
    if (v17 == v16)
    {
      v13 = 4;
      v12 = v16;
    }
    else
    {
      if (!v17)
      {
LABEL_10:
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", VectorOf);
        goto LABEL_11;
      }
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
    goto LABEL_10;
  }
  v9 = &unk_1E3C194F0;
LABEL_11:

  return v9;
}

- (uint64_t)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5"
    || ((v3 & (unint64_t)"Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z74-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolFromArray:]E3$_5" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool
{
}

- (_QWORD)trifbCreateVectorOfBoxedBoolFromArray:()TRIFBBoxedBool
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3BFDFA0;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (uint64_t)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6"
    || ((v3 & (unint64_t)"Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z80-[AFBBufferBuilder(TRIFBBoxedBool) trifbCreateVectorOfBoxedBoolWithCount:block:]E3$_6" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:
{
}

- (_QWORD)trifbCreateVectorOfBoxedBoolWithCount:()TRIFBBoxedBool block:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3BFE0A8;
  v2[1] = MEMORY[0x1A1AC6D30](*(_QWORD *)(a1 + 8));
  return v2;
}

@end
