@implementation PICurvesLUTFilter

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *__p;
  void *v14;
  void *v15;
  void *v16;

  -[PICurvesLUTFilter inputPointsR](self, "inputPointsR");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICurvesLUTFilter curvePointsFromDictionaries:](PICurvesLUTFilter, "curvePointsFromDictionaries:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PICurvesLUTFilter inputPointsG](self, "inputPointsG");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICurvesLUTFilter curvePointsFromDictionaries:](PICurvesLUTFilter, "curvePointsFromDictionaries:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PICurvesLUTFilter inputPointsB](self, "inputPointsB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICurvesLUTFilter curvePointsFromDictionaries:](PICurvesLUTFilter, "curvePointsFromDictionaries:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PICurvesLUTFilter inputPointsL](self, "inputPointsL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICurvesLUTFilter curvePointsFromDictionaries:](PICurvesLUTFilter, "curvePointsFromDictionaries:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PICurvesLUTFilter calculateCurveTable:](PICurvesLUTFilter, "calculateCurveTable:", v4);
  +[PICurvesLUTFilter calculateCurveTable:](PICurvesLUTFilter, "calculateCurveTable:", v6);
  +[PICurvesLUTFilter calculateCurveTable:](PICurvesLUTFilter, "calculateCurveTable:", v8);
  +[PICurvesLUTFilter calculateCurveTable:](PICurvesLUTFilter, "calculateCurveTable:", v10);
  +[PICurvesLUTFilter tableImageFromRed:green:blue:luminance:](PICurvesLUTFilter, "tableImageFromRed:green:blue:luminance:", v16, v15, v14, __p);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
    operator delete(__p);
  if (v14)
    operator delete(v14);
  if (v15)
    operator delete(v15);
  if (v16)
    operator delete(v16);

  return v11;
}

- (NSArray)inputPointsR
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputPointsR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)inputPointsG
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPointsG:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)inputPointsB
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputPointsB:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)inputPointsL
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputPointsL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPointsL, 0);
  objc_storeStrong((id *)&self->_inputPointsB, 0);
  objc_storeStrong((id *)&self->_inputPointsG, 0);
  objc_storeStrong((id *)&self->_inputPointsR, 0);
}

+ (vector<float,)calculateCurveTable:(id)a2
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  float *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  float v18;
  _DWORD *v19;
  unint64_t v20;
  char *v21;
  _DWORD *v22;
  uint64_t v23;
  int *v24;
  int v25;
  char *v26;
  float *v27;
  unint64_t v28;
  float *v29;
  char *v30;
  float *v31;
  unint64_t v32;
  float *v33;
  float *v34;
  unint64_t v35;
  float *v36;
  float v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  float *v42;
  char *v43;
  float v44;
  uint64_t v45;
  int *v46;
  int *v47;
  int *v48;
  int *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  unint64_t v57;
  float v58;
  float v59;
  _DWORD *v60;
  float *v61;
  unint64_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  float v68;
  float v69;
  float *v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float *v75;
  float *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  int8x16_t v80;
  uint64_t v81;
  float v82;
  float *v83;
  float v84;
  int8x16_t v86;
  int8x16_t v87;
  vector<float, std::allocator<float>> *result;
  int8x16_t v89;
  int v90;
  void *__p[3];
  void *v92[3];
  void *v93;
  _DWORD *v94;
  void *v95[3];
  void *v96[3];
  void *v97[3];
  void *v98[3];
  void *v99[3];
  void *v100[4];

  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - 2;
  if (v6 == 2)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  else
  {
    if (v7 >> 61)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v8 = 8 * v7;
    v9 = (float *)operator new(8 * v7);
    bzero(v9, v8);
    v10 = 0;
    v11 = v8 >> 3;
    v12 = 1;
    do
    {
      v13 = v12;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "x");
      *(float *)&v15 = v15;
      v9[2 * v10] = *(float *)&v15;
      objc_msgSend(v14, "y");
      *(float *)&v16 = v16;
      v9[2 * v10 + 1] = *(float *)&v16;

      v12 = v13 + 1;
      v10 = v13;
    }
    while (v11 > v13);
    if ((unint64_t)v8 > 0xF)
    {
      v17 = *v9;
      v18 = v9[(unint64_t)v8 / 4 - 2];
      v19 = operator new(20 * v11);
      bzero(v19, 20 * ((20 * v11 - 20) / 0x14) + 20);
      LODWORD(v99[0]) = 0;
      std::vector<float>::vector(v100, v11, v99);
      LODWORD(v98[0]) = 0;
      std::vector<float>::vector(v99, v11, v98);
      LODWORD(v97[0]) = 0;
      std::vector<float>::vector(v98, v11, v97);
      LODWORD(v96[0]) = 0;
      std::vector<float>::vector(v97, v11, v96);
      v20 = v11 - 1;
      LODWORD(v95[0]) = 0;
      std::vector<float>::vector(v96, v11 - 1, v95);
      LODWORD(v93) = 0;
      std::vector<float>::vector(v95, v11 - 1, &v93);
      LODWORD(v92[0]) = 0;
      std::vector<float>::vector(&v93, v11, v92);
      LODWORD(__p[0]) = 0;
      std::vector<float>::vector(v92, v11, __p);
      v90 = 0;
      std::vector<float>::vector(__p, v11, &v90);
      *(v94 - 1) = 1065353216;
      v21 = (char *)v93;
      *(_DWORD *)v93 = 1065353216;
      v22 = v100[0];
      if (v11 <= 1)
        v23 = 1;
      else
        v23 = v11;
      v24 = (int *)(v9 + 1);
      do
      {
        v25 = *v24;
        v24 += 2;
        *v22++ = v25;
        --v23;
      }
      while (v23);
      if (v11 == 1)
      {
        v45 = -1;
        v40 = (char *)__p[0];
      }
      else
      {
        v26 = (char *)v96[0];
        v27 = v9 + 2;
        v28 = v11 - 1;
        v29 = (float *)v96[0];
        do
        {
          *v29++ = *v27 - *(v27 - 2);
          v27 += 2;
          --v28;
        }
        while (v28);
        if (v20 <= 1)
        {
          v40 = (char *)__p[0];
        }
        else
        {
          v30 = (char *)v95[0];
          v31 = (float *)((char *)v95[0] + 4);
          v32 = v11 - 2;
          v33 = (float *)(v26 + 4);
          v34 = (float *)((char *)v100[0] + 4);
          v35 = v11 - 2;
          v36 = (float *)((char *)v100[0] + 4);
          do
          {
            v37 = v36[1];
            ++v36;
            *v31++ = (float)((float)(-3.0 / *(v33 - 1)) * (float)(*v34 - *(v34 - 1)))
                   + (float)((float)(3.0 / *v33) * (float)(v37 - *v34));
            ++v33;
            v34 = v36;
            --v35;
          }
          while (v35);
          v38 = 0;
          v39 = (char *)v92[0];
          v40 = (char *)__p[0];
          v41 = v30 + 4;
          v42 = v9 + 4;
          v43 = v21 + 4;
          do
          {
            v44 = (float)((float)(*v42 - *(v42 - 4)) * 2.0) - (float)(*(float *)&v26[v38] * *(float *)&v39[v38]);
            *(float *)&v43[v38] = v44;
            *(float *)&v39[v38 + 4] = *(float *)&v26[v38 + 4] / v44;
            *(float *)&v40[v38 + 4] = (float)(*(float *)&v41[v38] - (float)(*(float *)&v26[v38] * *(float *)&v40[v38]))
                                    / *(float *)&v43[v38];
            v38 += 4;
            v42 += 2;
            --v32;
          }
          while (v32);
        }
        v45 = v11 - 2;
        v46 = (int *)v98[0];
        v47 = (int *)v100[0];
        v48 = (int *)v99[0];
        v49 = (int *)v97[0];
        v50 = (char *)v97[0] - 8;
        v51 = (char *)v99[0] - 8;
        v52 = v26 - 8;
        v53 = v40 - 8;
        v54 = (char *)v100[0] - 4;
        v55 = (char *)v98[0] - 4;
        v56 = (char *)v92[0] - 8;
        v57 = v11 - 1;
        do
        {
          v58 = *(float *)&v55[4 * v11];
          v59 = *(float *)&v53[4 * v11] - (float)(*(float *)&v56[4 * v11] * v58);
          *(float *)&v55[4 * v11 - 4] = v59;
          *(float *)&v51[4 * v11] = (float)((float)(*(float *)&v54[4 * v11] - *(float *)&v54[4 * v11 - 4])
                                          / *(float *)&v52[4 * v11])
                                  + (float)((float)((float)(v58 + (float)(v59 * 2.0)) * *(float *)&v52[4 * v11])
                                          * -0.33333);
          *(float *)&v50[4 * v11] = (float)(*(float *)&v55[4 * v11] - *(float *)&v55[4 * v11 - 4])
                                  / (float)(*(float *)&v52[4 * v11] * 3.0);
          v50 -= 4;
          v51 -= 4;
          v52 -= 4;
          v53 -= 4;
          v54 -= 4;
          v55 -= 4;
          v56 -= 4;
          --v57;
        }
        while (v57);
        v60 = v19 + 2;
        v61 = v9;
        v62 = v11 - 1;
        do
        {
          v63 = *(_DWORD *)v61;
          v61 += 2;
          *(v60 - 2) = v63;
          v64 = *v47++;
          *(v60 - 1) = v64;
          v65 = *v48++;
          *v60 = v65;
          v66 = *v46++;
          v60[1] = v66;
          v67 = *v49++;
          v60[2] = v67;
          v60 += 5;
          --v62;
        }
        while (v62);
      }
      v68 = v9[2 * v20];
      v69 = v68 - v9[2 * v45];
      v70 = (float *)&v19[5 * v45];
      v71 = v70[2];
      v72 = v69 * v70[3];
      v73 = (float)(v70[1] + (float)(v71 * v69)) + (float)(v72 * v69);
      v74 = v69 * (float)(v69 * v70[4]);
      v75 = (float *)&v19[5 * v20];
      *v75 = v68;
      v75[1] = v73 + (float)(v74 * v69);
      v75[2] = (float)(v71 + (float)(v72 * 2.0)) + (float)(v74 * 3.0);
      v75[3] = 0.0;
      v75[4] = 0.0;
      if (v40)
      {
        __p[1] = v40;
        operator delete(v40);
      }
      if (v92[0])
      {
        v92[1] = v92[0];
        operator delete(v92[0]);
      }
      if (v93)
      {
        v94 = v93;
        operator delete(v93);
      }
      if (v95[0])
      {
        v95[1] = v95[0];
        operator delete(v95[0]);
      }
      if (v96[0])
      {
        v96[1] = v96[0];
        operator delete(v96[0]);
      }
      if (v97[0])
      {
        v97[1] = v97[0];
        operator delete(v97[0]);
      }
      if (v98[0])
      {
        v98[1] = v98[0];
        operator delete(v98[0]);
      }
      if (v99[0])
      {
        v99[1] = v99[0];
        operator delete(v99[0]);
      }
      if (v100[0])
      {
        v100[1] = v100[0];
        operator delete(v100[0]);
      }
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2.var0 = 0;
      v76 = (float *)operator new(0x800uLL);
      retstr->var0 = v76;
      retstr->var2.var0 = v76 + 512;
      bzero(v76, 0x800uLL);
      v77 = 0;
      v78 = 0;
      retstr->var1 = v76 + 512;
      do
      {
        v79 = v78;
        *(float *)v80.i32 = powf((float)((float)v77 + (float)v77) / 511.0, 0.45455);
        if (v78 <= v20)
          v78 = v20;
        v81 = 20 * v79 + 20;
        while (v78 != v79)
        {
          ++v79;
          v82 = *(float *)((char *)v19 + v81);
          v81 += 20;
          if (*(float *)v80.i32 <= v82)
          {
            v78 = v79 - 1;
            break;
          }
        }
        v83 = (float *)&v19[5 * v78];
        v84 = *(float *)v80.i32 - *v83;
        *(float *)v80.i32 = v83[1] + (float)(v83[2] * v84);
        if (v84 > 0.0)
          *(float *)v80.i32 = *(float *)v80.i32
                            + (float)((float)(v84 * (float)(v84 * (float)(v84 * *(float *)&v19[5 * v78 + 4])))
                                    + (float)((float)(v84 * *(float *)&v19[5 * v78 + 3]) * v84));
        if (v17 > 0.0 && !v78 && v84 < 0.0)
          v80.i32[0] = v19[1];
        if (v78 == v20 && v18 < 1.0)
          v80.i32[0] = (__int32)v83[1];
        if (*(float *)v80.i32 < 0.0)
          *(float *)v80.i32 = 0.0;
        if (*(float *)v80.i32 > 2.0)
          *(float *)v80.i32 = 2.0;
        v89 = v80;
        *(float *)v86.i32 = powf(fabsf(*(float *)v80.i32), 2.2);
        v87.i64[0] = 0x8000000080000000;
        v87.i64[1] = 0x8000000080000000;
        LODWORD(v76[v77++]) = vbslq_s8(v87, v86, v89).u32[0];
      }
      while (v77 != 512);
      operator delete(v19);
    }
    else
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2.var0 = 0;
    }
    operator delete(v9);
  }

  return result;
}

+ (id)curvePointsFromDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PICurveControlPoint *v10;
  PICurveControlPoint *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [PICurveControlPoint alloc];
        v11 = -[PICurveControlPoint initWithDictionary:](v10, "initWithDictionary:", v9, (_QWORD)v13);
        objc_msgSend(v4, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)tableImageFromRed:(const float *)a3 green:(const float *)a4 blue:(const float *)a5 luminance:(const float *)a6
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v14;
  void *v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  const void **v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  const void **v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  const void **v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  vImage_Buffer dest;
  vImage_Buffer srcB;
  vImage_Buffer srcG;
  vImage_Buffer srcR;
  _QWORD v55[4];
  _QWORD v56[4];
  vImage_Buffer srcA;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tableR != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v37 = dispatch_get_specific(*v16);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(srcA.data) = 138543618;
        *(void **)((char *)&srcA.data + 4) = v37;
        WORD2(srcA.height) = 2114;
        *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v39;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);

      }
      goto LABEL_37;
    }
    if (!v19)
      goto LABEL_37;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(srcA.data) = 138543362;
    *(void **)((char *)&srcA.data + 4) = v36;
    _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&srcA, 0xCu);

    goto LABEL_37;
  }
  if (!a4)
  {
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tableG != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    v23 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v24)
      {
        v40 = dispatch_get_specific(*v22);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(srcA.data) = 138543618;
        *(void **)((char *)&srcA.data + 4) = v40;
        WORD2(srcA.height) = 2114;
        *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v42;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);

      }
      goto LABEL_37;
    }
    if (!v24)
      goto LABEL_37;
    goto LABEL_25;
  }
  if (!a5)
  {
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tableB != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    v28 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v29)
      {
        v43 = dispatch_get_specific(*v27);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(srcA.data) = 138543618;
        *(void **)((char *)&srcA.data + 4) = v43;
        WORD2(srcA.height) = 2114;
        *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v45;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);

      }
      goto LABEL_37;
    }
    if (!v29)
      goto LABEL_37;
    goto LABEL_25;
  }
  if (!a6)
  {
    NUAssertLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tableL != nil");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (!v34)
        goto LABEL_37;
      goto LABEL_25;
    }
    if (v34)
    {
      v46 = dispatch_get_specific(*v32);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(srcA.data) = 138543618;
      *(void **)((char *)&srcA.data + 4) = v46;
      WORD2(srcA.height) = 2114;
      *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v48;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);

    }
LABEL_37:

    _NUAssertFailHandler();
    __break(1u);
  }
  *(_OWORD *)&srcA.height = xmmword_1A64DDEA0;
  srcA.data = (void *)a3;
  srcA.rowBytes = 2048;
  *(_OWORD *)&srcR.height = xmmword_1A64DDEA0;
  srcG.rowBytes = 2048;
  srcR.data = (void *)a4;
  srcR.rowBytes = 2048;
  srcB.rowBytes = 2048;
  srcG.data = (void *)a5;
  *(_OWORD *)&srcG.height = xmmword_1A64DDEA0;
  srcB.data = (void *)a6;
  *(_OWORD *)&srcB.height = xmmword_1A64DDEA0;
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 0x2000));
  dest.data = (void *)objc_msgSend(v6, "mutableBytes");
  *(_OWORD *)&dest.height = xmmword_1A64DDEA0;
  dest.rowBytes = objc_msgSend(v6, "length");
  vImageConvert_PlanarFtoARGBFFFF(&srcA, &srcR, &srcG, &srcB, &dest, 0);
  v7 = *MEMORY[0x1E0C9E120];
  v55[0] = *MEMORY[0x1E0C9E148];
  v55[1] = v7;
  v56[0] = v6;
  v56[1] = MEMORY[0x1E0C9AAA0];
  v8 = *MEMORY[0x1E0C9E0F8];
  v55[2] = *MEMORY[0x1E0C9E108];
  v55[3] = v8;
  v56[2] = MEMORY[0x1E0C9AAB0];
  v56[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __60__PICurvesLUTFilter_tableImageFromRed_green_blue_luminance___block_invoke;
  v49[3] = &unk_1E5018140;
  v11 = v6;
  v50 = v11;
  v12 = (void *)objc_msgSend(v10, "initWithImageProvider:width:height:format:colorSpace:options:", v49, 512, 1, *MEMORY[0x1E0C9E080], 0, v9);

  return v12;
}

vImage_Error __60__PICurvesLUTFilter_tableImageFromRed_green_blue_luminance___block_invoke(uint64_t a1, void *a2, size_t a3)
{
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = (void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  *(_OWORD *)&src.height = xmmword_1A64DDEB0;
  src.rowBytes = objc_msgSend(*(id *)(a1 + 32), "length");
  dest.data = a2;
  *(_OWORD *)&dest.height = xmmword_1A64DDEB0;
  dest.rowBytes = a3;
  return vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
}

@end
