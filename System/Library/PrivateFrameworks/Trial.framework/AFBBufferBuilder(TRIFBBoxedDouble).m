@implementation AFBBufferBuilder(TRIFBBoxedDouble)

- (id)trifbCreateBoxedDoubleFromBoxedDouble:()TRIFBBoxedDouble
{
  id v5;
  void *v6;
  void *v7;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 5545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BoxedDouble"));

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
    v9 = (_QWORD *)objc_msgSend(v5, "cppPointer");
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v8);
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align(v8, 8uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v8, 8uLL);
    v10 = *((_QWORD *)v8 + 6);
    *(_QWORD *)(v10 - 8) = *v9;
    v10 -= 8;
    *((_QWORD *)v8 + 6) = v10;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((_QWORD *)v8 + 4) - (_DWORD)v10 + *((_QWORD *)v8 + 5));
  }

  return v7;
}

- (id)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble
{
  id result;

  *a2 = &off_1E3BFE050;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFBFastFactorLevels_generated.mm"), 5572, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  objc_msgSend(a1, "throwIfFinalizedWithSelector:", a2);
  objc_msgSend(a1, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v10 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)objc_msgSend(a1, "fbb");
    v16[0] = &off_1E3BFE158;
    v16[1] = MEMORY[0x1A1AC6D30](v7);
    v17 = v16;
    VectorOf = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVectorOfStructs<BoxedInt64>(v10, a3, (uint64_t)v16);
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

- (uint64_t)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9"
    || ((v3 & (unint64_t)"Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z78-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleFromArray:]E3$_9" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble
{
}

- (_QWORD)trifbCreateVectorOfBoxedDoubleFromArray:()TRIFBBoxedDouble
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3BFE050;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (uint64_t)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10"
    || ((v3 & (unint64_t)"Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z84-[AFBBufferBuilder(TRIFBBoxedDouble) trifbCreateVectorOfBoxedDoubleWithCount:block:]E4$_10" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:
{
}

- (_QWORD)trifbCreateVectorOfBoxedDoubleWithCount:()TRIFBBoxedDouble block:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3BFE158;
  v2[1] = MEMORY[0x1A1AC6D30](*(_QWORD *)(a1 + 8));
  return v2;
}

@end
