@implementation Pyramid

unsigned __int8 *__Pyramid_loadImage_block_invoke(unsigned __int8 *result, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  unsigned __int8 *v10;
  unsigned __int16 *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v10 = result;
  v11 = (unsigned __int16 *)*((_QWORD *)result + 4);
  v12 = *v11;
  if (*v11)
  {
    result = filterSubsampling1channel((unsigned __int8 *)(*(_QWORD *)&v11[4 * v12 + 8] + *(_QWORD *)(a3 + 8 * v12)), *(_QWORD *)&v11[4 * v12 + 168], *(_QWORD *)(a2 + 8 * v12), *(_QWORD *)&v11[4 * v12 + 88], a4, a5, *((_QWORD *)result + 5) + *(_QWORD *)(a3 + 8 * (v12 - 1)), *((_QWORD *)result + 6), *((_DWORD *)result + 14), *((_DWORD *)result + 15), a6);
    a6 = 0;
    v11 = (unsigned __int16 *)*((_QWORD *)v10 + 4);
  }
  if (v12 < v11[1])
  {
    v13 = v12 + 1;
    v14 = 8 * v12;
    v15 = &v11[(unint64_t)v14 / 2];
    result = filterSubsampling1channel((unsigned __int8 *)(*((_QWORD *)v15 + 3) + *(_QWORD *)(a3 + v14 + 8)), *((_QWORD *)v15 + 43), *(_QWORD *)(a2 + v14 + 8), *((_QWORD *)v15 + 23), a4, a5, *((_QWORD *)v15 + 2) + *(_QWORD *)(a3 + v14), *((_QWORD *)v15 + 22), a4, a5, a6);
    v16 = *((_QWORD *)v10 + 4);
    if (v13 < *(unsigned __int16 *)(v16 + 2))
    {
      v17 = a3 + 8;
      v18 = a2 + 16;
      v19 = v14 + 184;
      do
      {
        ++v13;
        v20 = v16 + v19;
        result = filterSubsampling1channel((unsigned __int8 *)(*(_QWORD *)(v20 - 152) + *(_QWORD *)(v17 + v19 - 176)), *(_QWORD *)(v20 + 168), *(_QWORD *)(v18 + v19 - 184), *(_QWORD *)(v20 + 8), a4, a5, *(_QWORD *)(v20 - 160) + *(_QWORD *)(v17 + v19 - 184), *(_QWORD *)v20, a4, a5, 0);
        v16 = *((_QWORD *)v10 + 4);
        v19 += 8;
      }
      while (v13 < *(unsigned __int16 *)(v16 + 2));
    }
  }
  return result;
}

uint64_t __Pyramid_loadImage_block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5] + 496, a1[5] + 656, *(unsigned __int16 *)(a1[5] + 8), *(unsigned __int16 *)(a1[5] + 8), a1[6]);
}

uint64_t __Pyramid_loadImage_block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5] + 576, a1[5] + 736, *(unsigned __int16 *)(a1[5] + 8), 0, a1[6]);
}

@end
