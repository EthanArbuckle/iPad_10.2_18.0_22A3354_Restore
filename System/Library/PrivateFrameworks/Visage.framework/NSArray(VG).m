@implementation NSArray(VG)

- (id)vg_arrayByInvokingBlock:()VG
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10, (_QWORD)v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

- (id)vg_compactArrayByInvokingBlock:()VG
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        if (*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9))
        {
          v4[2](v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10, (_QWORD)v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

+ (id)vg_arrayWithNumbersFromFloatVector:()VG
{
  void *v5;
  double v6;
  _DWORD *v7;
  _DWORD *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (uint64_t)(a3[1] - *a3) >> 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_DWORD *)*a3;
  v8 = (_DWORD *)a3[1];
  if ((_DWORD *)*a3 != v8)
  {
    do
    {
      LODWORD(v6) = *v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      ++v7;
    }
    while (v7 != v8);
  }
  objc_msgSend(a1, "arrayWithArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)vg_arrayWithNumbersFromFloatSpan:()VG
{
  void *v5;
  double v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *(_QWORD *)(a3 + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a3 + 8);
  if (v7)
  {
    v8 = *(_DWORD **)a3;
    v9 = 4 * v7;
    do
    {
      LODWORD(v6) = *v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

      ++v8;
      v9 -= 4;
    }
    while (v9);
  }
  objc_msgSend(a1, "arrayWithArray:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)vg_vectorByInvokingFloatValue
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  int v9;
  unint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  std::vector<float>::reserve((void **)a2, objc_msgSend(a1, "count"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "floatValue", (_QWORD)v21);
        v9 = v8;
        v11 = *(_DWORD **)(a2 + 8);
        v10 = *(_QWORD *)(a2 + 16);
        if ((unint64_t)v11 >= v10)
        {
          v13 = *(_DWORD **)a2;
          v14 = ((uint64_t)v11 - *(_QWORD *)a2) >> 2;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
          v16 = v10 - (_QWORD)v13;
          if (v16 >> 1 > v15)
            v15 = v16 >> 1;
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v15;
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2 + 16, v17);
            v13 = *(_DWORD **)a2;
            v11 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            v18 = 0;
          }
          v19 = &v18[4 * v14];
          *(_DWORD *)v19 = v9;
          v12 = v19 + 4;
          while (v11 != v13)
          {
            v20 = *--v11;
            *((_DWORD *)v19 - 1) = v20;
            v19 -= 4;
          }
          *(_QWORD *)a2 = v19;
          *(_QWORD *)(a2 + 8) = v12;
          *(_QWORD *)(a2 + 16) = &v18[4 * v17];
          if (v13)
            operator delete(v13);
        }
        else
        {
          *v11 = v8;
          v12 = v11 + 1;
        }
        *(_QWORD *)(a2 + 8) = v12;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

}

- (void)vg_vectorFloat3ByInvokingFloatValue
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)a2, objc_msgSend(a1, "count"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "vg_float3ByInvokingFloatValue", v21, (_QWORD)v22);
        v21 = v8;
        v10 = a2[1];
        v9 = (unint64_t)a2[2];
        if ((unint64_t)v10 >= v9)
        {
          v12 = (v10 - *a2) >> 4;
          if ((unint64_t)(v12 + 1) >> 60)
            std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
          v13 = v9 - (_QWORD)*a2;
          v14 = v13 >> 3;
          if (v13 >> 3 <= (unint64_t)(v12 + 1))
            v14 = v12 + 1;
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
            v15 = 0xFFFFFFFFFFFFFFFLL;
          else
            v15 = v14;
          if (v15)
            v16 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv4_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(a2 + 2), v15);
          else
            v16 = 0;
          v17 = &v16[16 * v12];
          *(_OWORD *)v17 = v21;
          v11 = v17 + 16;
          v19 = *a2;
          v18 = a2[1];
          if (v18 != *a2)
          {
            do
            {
              v20 = *((_OWORD *)v18 - 1);
              v18 -= 16;
              *((_OWORD *)v17 - 1) = v20;
              v17 -= 16;
            }
            while (v18 != v19);
            v18 = *a2;
          }
          *a2 = v17;
          a2[1] = v11;
          a2[2] = &v16[16 * v15];
          if (v18)
            operator delete(v18);
        }
        else
        {
          *(_OWORD *)v10 = v8;
          v11 = v10 + 16;
        }
        a2[1] = v11;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

}

+ (id)vg_arrayWithNumbersFromFloat3:()VG
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v4) = a2.n128_u32[1];
  LODWORD(v4) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v3, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)vg_arrayWithNumbersFromFloat4:()VG
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v4) = a2.n128_u32[1];
  LODWORD(v4) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v3, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)vg_arrayWithRowMajorNumbersFromFloat3x3:()VG
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3.n128_f64[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a4.n128_f64[0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v21, v20, v19, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v6) = a2.n128_u32[1];
  LODWORD(v6) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v8) = a3.n128_u32[1];
  LODWORD(v8) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v10) = a4.n128_u32[1];
  LODWORD(v10) = a4.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v7, v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v5, v12, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)vg_arrayWithRowMajorNumbersFromFloat4x4:()VG
{
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3.n128_f64[0]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a4.n128_f64[0]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a5.n128_f64[0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v35, v34, v33, v32, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v7) = a2.n128_u32[1];
  LODWORD(v7) = a2.n128_u32[1];
  v31 = (void *)v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v9) = a3.n128_u32[1];
  LODWORD(v9) = a3.n128_u32[1];
  v30 = (void *)v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v11) = a4.n128_u32[1];
  LODWORD(v11) = a4.n128_u32[1];
  v29 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v13) = a5.n128_u32[1];
  LODWORD(v13) = a5.n128_u32[1];
  v28 = (void *)v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v8, v10, v12, v27, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[2])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v25, v24, v23, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[3])));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v16, v17, v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithObjects:", v31, v26, v15, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)vg_dataByInvokingFloatValue
{
  id v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4 * objc_msgSend(a1, "count"));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (_DWORD *)objc_msgSend(v2, "mutableBytes");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "floatValue", (_QWORD)v10);
        *v3++ = v8;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (__n128)vg_float3ByInvokingFloatValue
{
  void *v2;
  unsigned __int32 v3;
  void *v4;
  unsigned __int32 v5;
  void *v6;
  unsigned __int32 v7;
  __n128 result;
  unsigned __int32 v9;
  unsigned __int32 v10;
  unsigned __int32 v11;

  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v11 = v3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v10 = v5;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v9 = v7;

  result.n128_u32[0] = v11;
  result.n128_u32[1] = v10;
  result.n128_u32[2] = v9;
  return result;
}

- (__n128)vg_float4ByInvokingFloatValue
{
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  __int128 v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v15;

  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v14 = v3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v13 = v5;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v12 = v7;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  *(_QWORD *)&v9 = __PAIR64__(v13, v14);
  *((_QWORD *)&v9 + 1) = __PAIR64__(v10, v12);
  v15 = v9;

  return (__n128)v15;
}

- (__n128)vg_float3x3FromRowMajorByInvokingFloatValue
{
  unsigned __int32 v2;
  unsigned __int32 v3;
  unsigned __int32 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __n128 result;
  unsigned __int32 v16;
  unsigned __int32 v17;
  unsigned __int32 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v18 = v2;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v17 = v3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v16 = v4;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");

  result.n128_u32[0] = v18;
  result.n128_u32[1] = v17;
  result.n128_u32[2] = v16;
  return result;
}

- (__n128)vg_float3x3From1DArrayByInvokingFloatValue
{
  void *v2;
  unsigned __int32 v3;
  void *v4;
  unsigned __int32 v5;
  void *v6;
  unsigned __int32 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __n128 result;
  unsigned __int32 v15;
  unsigned __int32 v16;
  unsigned __int32 v17;

  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v17 = v3;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v16 = v5;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v15 = v7;
  objc_msgSend(a1, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(a1, "objectAtIndexedSubscript:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");

  result.n128_u32[0] = v17;
  result.n128_u32[1] = v16;
  result.n128_u32[2] = v15;
  return result;
}

@end
