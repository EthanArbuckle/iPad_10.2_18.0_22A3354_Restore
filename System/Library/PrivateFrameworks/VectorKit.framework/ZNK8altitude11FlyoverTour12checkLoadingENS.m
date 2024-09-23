@implementation ZNK8altitude11FlyoverTour12checkLoadingENS

_QWORD *___ZNK8altitude11FlyoverTour12checkLoadingENS_7TileKeyENSt3__18functionIFvPK12GEOPDFlyoverEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  _OWORD v10[2];
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 88);
  v10[0] = *(_OWORD *)(a1 + 72);
  v10[1] = v3;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
  {
    if (v4 == a1 + 40)
    {
      v12 = v11;
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v4 + 24))(v4, v11);
    }
    else
    {
      v12 = (_BYTE *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
    }
  }
  else
  {
    v12 = 0;
  }
  altitude::FlyoverTour::checkLoading(v2, v10, v11);
  result = v12;
  if (v12 == v11)
  {
    v9 = 4;
    result = v11;
  }
  else
  {
    if (!v12)
      return result;
    v9 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*result + 8 * v9))(result, v5, v6, v7);
}

@end
