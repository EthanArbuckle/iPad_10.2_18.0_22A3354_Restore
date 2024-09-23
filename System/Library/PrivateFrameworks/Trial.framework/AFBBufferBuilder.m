@implementation AFBBufferBuilder

apple::aiml::flatbuffers2::DetachedBuffer *__120__AFBBufferBuilder_TRIFBCloudKitTreatmentRecordAsset__trifbFinishedBufferWithRootCloudKitTreatmentRecordAssetOfs_error___block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1A1AC6820);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__112__AFBBufferBuilder_TRIFBCloudKitAssetRecordAsset__trifbFinishedBufferWithRootCloudKitAssetRecordAssetOfs_error___block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1A1AC6820);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__98__AFBBufferBuilder_TRIFBTrialManagedAsset__trifbFinishedBufferWithRootTrialManagedAssetOfs_error___block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1A1AC6820);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__104__AFBBufferBuilder_TRIFBMobileAssetReference__trifbFinishedBufferWithRootMobileAssetReferenceOfs_error___block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1A1AC6820);
  }
  return result;
}

void __108__AFBBufferBuilder_TRIFBFactorMetadataKeyValue__trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  char *v7;
  _DWORD *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  unint64_t v17;
  int v18;
  id v19;

  v19 = a2;
  v3 = objc_msgSend(v19, "unsignedIntValue");
  v4 = v3;
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = (char *)v5[7];
  v6 = v5[8];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (char *)v5[6];
    v10 = (v7 - v9) >> 2;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 62)
      std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]();
    v12 = v6 - (_QWORD)v9;
    if (v12 >> 1 > v11)
      v11 = v12 >> 1;
    v13 = (unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL;
    v14 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v13)
      v14 = v11;
    if (v14)
    {
      v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>>(v14);
      v9 = (char *)v5[6];
      v7 = (char *)v5[7];
    }
    else
    {
      v15 = 0;
    }
    v16 = (_DWORD *)(v14 + 4 * v10);
    v17 = v14 + 4 * v15;
    *v16 = v4;
    v8 = v16 + 1;
    while (v7 != v9)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *--v16 = v18;
    }
    v5[6] = v16;
    v5[7] = v8;
    v5[8] = v17;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *(_DWORD *)v7 = v3;
    v8 = v7 + 4;
  }
  v5[7] = v8;

}

apple::aiml::flatbuffers2::DetachedBuffer *__108__AFBBufferBuilder_TRIFBFactorMetadataKeyValue__trifbFinishedBufferWithRootFactorMetadataKeyValueOfs_error___block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1A1AC6820);
  }
  return result;
}

void __86__AFBBufferBuilder_TRIFBFactorLevel__trifbCreateSortedVectorOfFactorLevelWithOffsets___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  char *v7;
  _DWORD *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  unint64_t v17;
  int v18;
  id v19;

  v19 = a2;
  v3 = objc_msgSend(v19, "unsignedIntValue");
  v4 = v3;
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = (char *)v5[7];
  v6 = v5[8];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (char *)v5[6];
    v10 = (v7 - v9) >> 2;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 62)
      std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]();
    v12 = v6 - (_QWORD)v9;
    if (v12 >> 1 > v11)
      v11 = v12 >> 1;
    v13 = (unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL;
    v14 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v13)
      v14 = v11;
    if (v14)
    {
      v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>>(v14);
      v9 = (char *)v5[6];
      v7 = (char *)v5[7];
    }
    else
    {
      v15 = 0;
    }
    v16 = (_DWORD *)(v14 + 4 * v10);
    v17 = v14 + 4 * v15;
    *v16 = v4;
    v8 = v16 + 1;
    while (v7 != v9)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *--v16 = v18;
    }
    v5[6] = v16;
    v5[7] = v8;
    v5[8] = v17;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *(_DWORD *)v7 = v3;
    v8 = v7 + 4;
  }
  v5[7] = v8;

}

apple::aiml::flatbuffers2::DetachedBuffer *__86__AFBBufferBuilder_TRIFBFactorLevel__trifbFinishedBufferWithRootFactorLevelOfs_error___block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1A1AC6820);
  }
  return result;
}

apple::aiml::flatbuffers2::DetachedBuffer *__96__AFBBufferBuilder_TRIFBFastFactorLevels__trifbFinishedBufferWithRootFastFactorLevelsOfs_error___block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1A1AC6820);
  }
  return result;
}

@end
