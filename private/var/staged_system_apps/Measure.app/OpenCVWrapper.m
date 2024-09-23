@implementation OpenCVWrapper

+ (id)blurredImage:(id)a3 blurSize:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;
  _DWORD v17[16];
  _DWORD *v18;
  void *v19;
  _QWORD v20[2];

  v5 = a3;
  v6 = v5;
  if (a4 > 1)
  {
    v17[0] = 1124007936;
    memset(&v17[1], 0, 60);
    v18 = &v17[2];
    v19 = v20;
    v20[0] = 0;
    v20[1] = 0;
    v15 = objc_msgSend(v5, "image");
    v16 = 0;
    v14 = 16842752;
    HIDWORD(v10) = a4;
    v11 = 33619968;
    v12 = v17;
    v13 = 0;
    LODWORD(v10) = a4;
    v9 = -1;
    sub_100346470((uint64_t)&v14, (uint64_t)&v11, &v10, &v9, 4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clone"));

  return v7;
}

+ (id)findCannyEdgesInImage:(id)a3 threshold1:(double)a4 threshold2:(double)a5
{
  int v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;
  _DWORD v14[16];
  _DWORD *v15;
  void *v16;
  _QWORD v17[2];

  v14[0] = 1124007936;
  memset(&v14[1], 0, 60);
  v15 = &v14[2];
  v16 = v17;
  v17[0] = 0;
  v17[1] = 0;
  v12 = objc_msgSend(a3, "image");
  v13 = 0;
  v11 = 16842752;
  v8 = 33619968;
  v9 = v14;
  v10 = 0;
  sub_1002B2420((uint64_t)&v11, (uint64_t)&v8, 3, 0, a4, a5);
}

+ (id)LSDInImage:(id)a3
{
  id v3;
  int v5;
  _BYTE v6[60];
  _BYTE *v7;
  void *v8;
  _QWORD v9[2];

  v3 = a3;
  v5 = 1124007936;
  memset(v6, 0, sizeof(v6));
  v7 = &v6[4];
  v8 = v9;
  v9[0] = 0;
  v9[1] = 0;
  sub_100316E90();
}

+ (id)findHoughLines:(id)a3 rho:(double)a4 theta:(double)a5 threshold:(double)a6 minLineLength:(double)a7 maxLineGap:(double)a8
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  int32x4_t *v13;
  char *v14;
  uint64_t v15;
  OpenCVWrapperContours *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  _BYTE *v21;
  float32x4_t v23;
  _BYTE __p[64];
  _BYTE *v25;
  void *v26;
  _QWORD v27[2];
  uint64_t v28;
  char *v29;
  unint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void **v34;
  uint64_t __src[3];

  v10 = a3;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  *(_QWORD *)&__p[8] = objc_msgSend(v10, "image");
  *(_QWORD *)&__p[16] = 0;
  *(_DWORD *)__p = 16842752;
  LODWORD(v28) = -2113732579;
  v29 = (char *)&v31;
  v30 = 0;
  sub_100315AD4((uint64_t)__p, (uint64_t)&v28, 30, a4, a5, 10.0, 15.0);
  v28 = 0;
  v29 = 0;
  v30 = 0;
  if ((int)((unint64_t)(v32 - v31) >> 4) >= 1)
  {
    v11 = 0;
    v12 = (v32 - v31) & 0xFFFFFFFF0;
    do
    {
      v23 = *(float32x4_t *)&v31[v11];
      v13 = (int32x4_t *)operator new(0x10uLL);
      *(_QWORD *)__p = v13;
      *v13 = vcvtq_s32_f32(v23);
      *(_QWORD *)&__p[8] = v13 + 1;
      *(_QWORD *)&__p[16] = v13 + 1;
      v14 = v29;
      if ((unint64_t)v29 >= v30)
      {
        v15 = sub_100009020(&v28, (uint64_t **)__p);
      }
      else
      {
        *(_QWORD *)v29 = 0;
        *((_QWORD *)v14 + 1) = 0;
        *((_QWORD *)v14 + 2) = 0;
        sub_100009134(v14, *(uint64_t **)__p, *(uint64_t **)&__p[8], (uint64_t)(*(_QWORD *)&__p[8] - *(_QWORD *)__p) >> 3);
        v15 = (uint64_t)(v14 + 24);
      }
      v29 = (char *)v15;
      if (*(_QWORD *)__p)
      {
        *(_QWORD *)&__p[8] = *(_QWORD *)__p;
        operator delete(*(void **)__p);
      }
      v11 += 16;
    }
    while (v12 != v11);
  }
  *(_DWORD *)__p = 1124007936;
  memset(&__p[4], 0, 60);
  v25 = &__p[8];
  v26 = v27;
  v27[0] = 0;
  v27[1] = 0;
  __src[0] = 0xF000000140;
  sub_100255F30(__p, 2, __src, 0);
  memset(__src, 0, sizeof(__src));
  v16 = -[OpenCVWrapperContours initWithContours:originalImageSize:]([OpenCVWrapperContours alloc], "initWithContours:originalImageSize:", &v28, &v25);
  v34 = (void **)__src;
  sub_100008E68(&v34);
  if (*(_QWORD *)&__p[56])
  {
    v17 = (unsigned int *)(*(_QWORD *)&__p[56] + 20);
    do
    {
      v18 = __ldaxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
      sub_100256C90((uint64_t)__p);
  }
  *(_QWORD *)&__p[56] = 0;
  memset(&__p[16], 0, 32);
  if (*(int *)&__p[4] >= 1)
  {
    v20 = 0;
    v21 = v25;
    do
      *(_DWORD *)&v21[4 * v20++] = 0;
    while (v20 < *(int *)&__p[4]);
  }
  if (v26 != v27)
    j__free(v26);
  *(_QWORD *)__p = &v28;
  sub_100008E68((void ***)__p);
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }

  return v16;
}

+ (id)getMinAreaRectEnclosingPoints:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  id v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  int v39;
  void **p_p;
  uint64_t v41;
  _DWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *__p;
  char *v48;
  char *v49;
  _BYTE v50[128];

  __p = 0;
  v48 = 0;
  v49 = 0;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v8, "floatValue");
        v10 = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        v14 = v48;
        if (v48 >= v49)
        {
          v16 = (v48 - (_BYTE *)__p) >> 3;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 61)
            sub_100008F3C();
          v18 = v49 - (_BYTE *)__p;
          if ((v49 - (_BYTE *)__p) >> 2 > v17)
            v17 = v18 >> 2;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
            v19 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v19 = v17;
          v21 = (char *)sub_100008F50((uint64_t)&v49, v19);
          v22 = &v21[8 * v16];
          *(_DWORD *)v22 = v10;
          *((_DWORD *)v22 + 1) = v13;
          v23 = (char *)__p;
          v24 = v48;
          v25 = v22;
          while (v24 != v23)
          {
            v26 = *((_QWORD *)v24 - 1);
            v24 -= 8;
            *((_QWORD *)v25 - 1) = v26;
            v25 -= 8;
          }
          v15 = v22 + 8;
          __p = v25;
          v48 = v22 + 8;
          v49 = &v21[8 * v20];
          if (v23)
            operator delete(v23);
        }
        else
        {
          *(_DWORD *)v48 = v10;
          *((_DWORD *)v14 + 1) = v13;
          v15 = v14 + 8;
        }
        v48 = v15;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v4);
  }

  v39 = -2130509811;
  p_p = &__p;
  v41 = 0;
  sub_10034297C((uint64_t)&v39, (uint64_t)v42);
  v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  LODWORD(v28) = v42[0];
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28));
  objc_msgSend(v27, "addObject:", v29);

  LODWORD(v30) = v42[1];
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30));
  objc_msgSend(v27, "addObject:", v31);

  LODWORD(v32) = v42[2];
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32));
  objc_msgSend(v27, "addObject:", v33);

  LODWORD(v34) = v42[3];
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34));
  objc_msgSend(v27, "addObject:", v35);

  LODWORD(v36) = v42[4];
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36));
  objc_msgSend(v27, "addObject:", v37);

  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }

  return v27;
}

+ (int)calcHistogramMedianForImage:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  _OWORD *v7;
  __int128 v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  float *v18;
  float *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  _DWORD *v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  _DWORD *v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  char *v34;
  int v36;
  _OWORD *v37;
  uint64_t v38;
  int v39;
  _DWORD *v40;
  uint64_t v41;
  _OWORD v42[4];
  _DWORD *v43;
  void *v44;
  _QWORD v45[2];
  _DWORD v46[17];
  _DWORD *v47;
  void *v48;
  _QWORD v49[2];
  int v50;
  float *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  _QWORD *v59;
  _QWORD v60[3];

  v3 = a3;
  v4 = *((_DWORD *)objc_msgSend(v3, "image") + 2);
  v5 = *((_DWORD *)objc_msgSend(v3, "image") + 3) * v4;
  if (v5 >= 0)
    v6 = v5;
  else
    v6 = v5 + 1;
  v7 = objc_msgSend(v3, "image");
  v8 = v7[1];
  v53 = *v7;
  v54 = v8;
  v55 = v7[2];
  v9 = *((_QWORD *)v7 + 7);
  v56 = *((_QWORD *)v7 + 6);
  v57 = v9;
  v58 = (char *)&v53 + 8;
  v59 = v60;
  v60[0] = 0;
  v60[1] = 0;
  if (v9)
  {
    v10 = (unsigned int *)(v9 + 20);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 + 1, v10));
  }
  if (*((int *)v7 + 1) > 2)
  {
    DWORD1(v53) = 0;
    sub_100256B48((uint64_t)&v53, (uint64_t)v7);
  }
  else
  {
    v12 = (_QWORD *)*((_QWORD *)v7 + 9);
    v13 = v59;
    *v59 = *v12;
    v13[1] = v12[1];
  }
  v50 = 0;
  memset(&v46[2], 0, 60);
  v47 = &v46[3];
  v48 = v49;
  v49[0] = 0;
  v49[1] = 0;
  *(_QWORD *)v46 = 0x42FF000000000100;
  v51 = (float *)&v52;
  v52 = 0x4380000000000000;
  LODWORD(v42[0]) = 1124007936;
  memset((char *)v42 + 4, 0, 48);
  v42[3] = 0u;
  v43 = (_DWORD *)v42 + 2;
  v44 = v45;
  v45[0] = 0;
  v45[1] = 0;
  v40 = &v46[1];
  v41 = 0;
  v39 = 16842752;
  v36 = 33619968;
  v37 = v42;
  v38 = 0;
  sub_100310BA0((int32x2_t **)&v53, 1, (uint64_t)&v50, (uint64_t)&v39, (uint64_t)&v36, 1u, (uint64_t *)v46, &v51, 1u, 0);
  if (v46[0] < 1)
  {
    v17 = -1;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = v6 >> 1;
    v17 = -1;
    v18 = *(float **)&v42[1];
    do
    {
      v19 = v18;
      if ((v42[0] & 0x4000) == 0)
      {
        v19 = v18;
        if (*v43 != 1)
        {
          if (v43[1] == 1)
            v19 = (float *)(*(_QWORD *)&v42[1] + *(_QWORD *)v44 * v14);
          else
            v19 = (float *)(*(_QWORD *)&v42[1]
                          + *(_QWORD *)v44 * ((int)v14 / SHIDWORD(v42[0]))
                          + 4 * ((int)v14 + -HIDWORD(v42[0]) * ((int)v14 / SHIDWORD(v42[0]))));
        }
      }
      v15 += (uint64_t)rintf(*v19);
      if (v15 > v16)
        v17 = v14;
      if (++v14 >= (unint64_t)v46[0])
        break;
      ++v18;
    }
    while (v17 < 0);
  }
  if (*((_QWORD *)&v42[3] + 1))
  {
    v20 = (unsigned int *)(*((_QWORD *)&v42[3] + 1) + 20);
    do
    {
      v21 = __ldaxr(v20);
      v22 = v21 - 1;
    }
    while (__stlxr(v22, v20));
    if (!v22)
      sub_100256C90((uint64_t)v42);
  }
  *((_QWORD *)&v42[3] + 1) = 0;
  memset(&v42[1], 0, 32);
  if (SDWORD1(v42[0]) >= 1)
  {
    v23 = 0;
    v24 = v43;
    do
      v24[v23++] = 0;
    while (v23 < SDWORD1(v42[0]));
  }
  if (v44 != v45)
    j__free(v44);
  if (*(_QWORD *)&v46[15])
  {
    v25 = (unsigned int *)(*(_QWORD *)&v46[15] + 20);
    do
    {
      v26 = __ldaxr(v25);
      v27 = v26 - 1;
    }
    while (__stlxr(v27, v25));
    if (!v27)
      sub_100256C90((uint64_t)&v46[1]);
  }
  *(_QWORD *)&v46[15] = 0;
  memset(&v46[5], 0, 32);
  if (v46[2] >= 1)
  {
    v28 = 0;
    v29 = v47;
    do
      v29[v28++] = 0;
    while (v28 < v46[2]);
  }
  if (v48 != v49)
    j__free(v48);
  if (v57)
  {
    v30 = (unsigned int *)(v57 + 20);
    do
    {
      v31 = __ldaxr(v30);
      v32 = v31 - 1;
    }
    while (__stlxr(v32, v30));
    if (!v32)
      sub_100256C90((uint64_t)&v53);
  }
  v57 = 0;
  v54 = 0u;
  v55 = 0u;
  if (SDWORD1(v53) >= 1)
  {
    v33 = 0;
    v34 = v58;
    do
      *(_DWORD *)&v34[4 * v33++] = 0;
    while (v33 < SDWORD1(v53));
  }
  if (v59 != v60)
    j__free(v59);

  return v17;
}

+ (id)makeUIImageFromCVImage:(id)a3
{
  id v3;
  UIImage *v4;
  void *v5;

  v3 = a3;
  v4 = sub_1002AB6C4((uint64_t)objc_msgSend(v3, "image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

+ (id)findContoursInImage:(id)a3
{
  id v3;
  OpenCVWrapperContours *v4;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  void **v10[3];
  _QWORD v11[3];

  v3 = a3;
  memset(v11, 0, sizeof(v11));
  LODWORD(v10[0]) = 50397184;
  v10[1] = (void **)objc_msgSend(v3, "image");
  v10[2] = 0;
  v7 = -2113667060;
  v8 = v11;
  v9 = 0;
  v6 = 0;
  sub_1002D8AD4((uint64_t)v10, &v7, 0, 1, &v6);
  v4 = -[OpenCVWrapperContours initWithContours:originalImageSize:]([OpenCVWrapperContours alloc], "initWithContours:originalImageSize:", v11, (char *)objc_msgSend(v3, "image") + 64);
  v10[0] = (void **)v11;
  sub_100008E68(v10);

  return v4;
}

+ (void)filterContours:(id)a3 forMinEdgeLength:(int)a4
{
  id v5;

  v5 = a3;
  sub_100007BF0((uint64_t)objc_msgSend(v5, "contours"), a4);

}

+ (id)makeCVImageFromContours:(id)a3 lineThickness:(int)a4 color:(id)a5
{
  id v7;
  id v8;
  OpenCVWrapperImage *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD *v14;
  int v16;
  id v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  double v23[44];
  _QWORD v24[8];
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[2];
  uint64_t v28;
  double v29;
  double v30;
  double v31;

  v7 = a3;
  v8 = a5;
  v22 = *(_QWORD *)objc_msgSend(v7, "originalImageSize");
  sub_100254168(&v22, 0x10u, (uint64_t)v23);
  LODWORD(v24[0]) = 1124007936;
  memset((char *)v24 + 4, 0, 32);
  memset((char *)&v24[4] + 4, 0, 28);
  v25 = &v24[1];
  v26 = v27;
  v27[0] = 0;
  v27[1] = 0;
  (*(void (**)(_QWORD, double *, _QWORD *, uint64_t))(**(_QWORD **)&v23[0] + 24))(*(_QWORD *)&v23[0], v23, v24, 0xFFFFFFFFLL);
  sub_100008C98((uint64_t)v23);
  v19 = 50397184;
  v20 = v24;
  v21 = 0;
  v17 = objc_msgSend(v7, "contours");
  v18 = 0;
  v16 = -2130444276;
  v30 = 0.0;
  v31 = 0.0;
  v28 = 0;
  v29 = 0.0;
  objc_msgSend(v8, "getRed:green:blue:alpha:", &v31, &v30, &v29, &v28);
  v23[0] = v31 * 255.0;
  v23[1] = v30 * 255.0;
  v23[2] = v29 * 255.0;
  v23[3] = 0.0;
  sub_1002E86F8((uint64_t)&v19, (uint64_t)&v16, 0, v23, a4, 8, 0);
  v9 = -[OpenCVWrapperImage initWithImage:]([OpenCVWrapperImage alloc], "initWithImage:", v24);
  if (v24[7])
  {
    v10 = (unsigned int *)(v24[7] + 20);
    do
    {
      v11 = __ldaxr(v10);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, v10));
    if (!v12)
      sub_100256C90((uint64_t)v24);
  }
  v24[7] = 0;
  memset(&v24[2], 0, 32);
  if (SHIDWORD(v24[0]) >= 1)
  {
    v13 = 0;
    v14 = v25;
    do
      *((_DWORD *)v14 + v13++) = 0;
    while (v13 < SHIDWORD(v24[0]));
  }
  if (v26 != v27)
    j__free(v26);

  return v9;
}

+ (id)makeCVImageFromUniqueContours:(id)a3 lineThickness:(int)a4
{
  id v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t *v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  OpenCVWrapperImage *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  uint64_t v21;
  double v22[44];
  _QWORD v23[8];
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[3];

  v5 = a3;
  v21 = *(_QWORD *)objc_msgSend(v5, "originalImageSize");
  sub_100254168(&v21, 0x10u, (uint64_t)v22);
  LODWORD(v23[0]) = 1124007936;
  memset((char *)v23 + 4, 0, 32);
  memset((char *)&v23[4] + 4, 0, 28);
  v24 = &v23[1];
  v25 = v26;
  v26[0] = 0;
  v26[1] = 0;
  (*(void (**)(_QWORD, double *, _QWORD *, uint64_t))(**(_QWORD **)&v22[0] + 24))(*(_QWORD *)&v22[0], v22, v23, 0xFFFFFFFFLL);
  sub_100008C98((uint64_t)v22);
  v6 = (uint64_t **)objc_msgSend(v5, "contours");
  v7 = *v6;
  v8 = v6[1];
  if (*v6 != v8)
  {
    v9 = 0xFFFFFFFFLL;
    do
    {
      v10 = (double)((HIDWORD(v9) - 130063606 * (int)v9) % 0xFFu);
      v11 = ((unint64_t)(HIDWORD(v9) + 4164903690 * v9) >> 32)
          + 4164903690 * (HIDWORD(v9) - 130063606 * v9);
      v9 = HIDWORD(v11) + 4164903690 * v11;
      v22[0] = v10;
      v22[1] = (double)(v11 % 0xFF);
      v22[2] = (double)((HIDWORD(v11) - 130063606 * (int)v11) % 0xFFu);
      v22[3] = 0.0;
      v20 = *v7;
      v19 = 0;
      if ((unint64_t)(v7[1] - v20) >= 0x3FFFFFFF1)
        __assert_rtn("safeSignedCast", "OpenCVWrapperInternal.h", 67, "value < INT_MAX && \"size_t outside of valid range to cast to int\");
      sub_1002E83C4((unsigned int *)v23, (uint64_t)&v20, (uint64_t)&v19, 1, 0, v22, a4, 8, 0);
      v7 += 3;
    }
    while (v7 != v8);
  }
  v12 = -[OpenCVWrapperImage initWithImage:]([OpenCVWrapperImage alloc], "initWithImage:", v23);
  if (v23[7])
  {
    v13 = (unsigned int *)(v23[7] + 20);
    do
    {
      v14 = __ldaxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
      sub_100256C90((uint64_t)v23);
  }
  v23[7] = 0;
  memset(&v23[2], 0, 32);
  if (SHIDWORD(v23[0]) >= 1)
  {
    v16 = 0;
    v17 = v24;
    do
      *((_DWORD *)v17 + v16++) = 0;
    while (v16 < SHIDWORD(v23[0]));
  }
  if (v25 != v26)
    j__free(v25);

  return v12;
}

+ (id)findCornersAndFilterContours:(id)a3 forMaxEdgeTurns:(int)a4 forTurningPointMargin:(int)a5
{
  id v7;
  __n128 **v8;
  OpenCVWrapperCorners *v9;
  __n128 *v10;
  __n128 *v11;
  unint64_t v12;
  uint64_t v13;
  __n128 *v15;
  void *__p;
  char *v17;
  uint64_t v18;

  v7 = a3;
  v8 = (__n128 **)objc_msgSend(v7, "contours");
  v9 = objc_alloc_init(OpenCVWrapperCorners);
  v17 = 0;
  v18 = 0;
  __p = 0;
  if (a4 < 0)
    __assert_rtn("safeUnsignedCast", "OpenCVWrapperInternal.h", 73, "value >= 0 && \"int outside of valid range to cast to size_t\");
  v10 = *v8;
  v11 = v8[1];
  if (*v8 == v11)
  {
LABEL_6:
    v13 = (uint64_t)v11;
  }
  else
  {
    v12 = a4;
    while (1)
    {
      v17 = (char *)__p;
      sub_100008790((uint64_t)&__p, v10, objc_msgSend(v7, "originalImageSize"), a5);
      if (0xAAAAAAAAAAAAAAABLL * ((v17 - (_BYTE *)__p) >> 3) > a4)
        break;
      sub_100009400((__int128 *)__p, (__int128 *)v17, (void **)-[OpenCVWrapperCorners corners](v9, "corners"));
      v10 = (__n128 *)((char *)v10 + 24);
      if (v10 == v11)
        goto LABEL_6;
    }
    v13 = (uint64_t)v11;
    if (v10 != v11)
    {
      v15 = (__n128 *)((char *)v10 + 24);
      v13 = (uint64_t)v10;
      while (v15 != v11)
      {
        v17 = (char *)__p;
        sub_100008790((uint64_t)&__p, v15, objc_msgSend(v7, "originalImageSize"), a5);
        if (0xAAAAAAAAAAAAAAABLL * ((v17 - (_BYTE *)__p) >> 3) <= v12)
        {
          sub_100009400((__int128 *)__p, (__int128 *)v17, (void **)-[OpenCVWrapperCorners corners](v9, "corners"));
          sub_100009590(v13, v15);
          v13 += 24;
        }
        v15 = (__n128 *)((char *)v15 + 24);
      }
    }
  }
  sub_100008400((uint64_t)v8, v13, v8[1]);
  if (__p)
  {
    v17 = (char *)__p;
    operator delete(__p);
  }

  return v9;
}

+ (id)samplePointsInContour:()vector<cv:(std:(int)a4 :allocator<cv::Point_<int>>> *)a3 :Point_<int> numberOfPoints:
{
  void *v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  float v18[2];
  int v19;
  vector<cv::Point_<int>, std::allocator<cv::Point_<int>>> *v20;
  uint64_t v21;
  _DWORD v22[2];
  int v23;
  int v24;

  v6 = (void *)objc_opt_new(NSMutableArray, a2);
  v20 = a3;
  v21 = 0;
  v19 = -2130509812;
  sub_100343280((uint64_t)&v19, (unint64_t)v22);
  v7 = sqrt((double)(v24 * v23 / a4));
  v8 = (double)v23 / v7;
  if (v8 > 0.0)
  {
    v9 = 0;
    v10 = (double)v24 / v7;
    v11 = 0.0;
    do
    {
      if (v10 > 0.0)
      {
        v12 = 0.0;
        v13 = 1;
        do
        {
          v14 = (int)((double)v22[0] + v11 * v7);
          v15 = (int)((double)v22[1] + v12 * v7);
          v20 = a3;
          v21 = 0;
          v19 = -2130509812;
          v18[0] = (float)v14;
          v18[1] = (float)v15;
          if (sub_100310540((uint64_t)&v19, v18, 0) >= 0.0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", (double)v14, (double)v15));
            objc_msgSend(v6, "addObject:", v16);

          }
          v12 = (double)v13++;
        }
        while (v10 > v12);
      }
      v11 = (double)++v9;
    }
    while (v8 > (double)v9);
  }
  return v6;
}

+ (CGImage)createCgImageFromCVMat:(Mat *)a3
{
  char *data;
  uint64_t dims;
  unint64_t v6;
  int *p;
  uint64_t v8;
  uint64_t v9;
  const __CFData *v10;
  int v11;
  BOOL v12;
  int v13;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v15;
  CGDataProvider *v16;
  size_t cols;
  size_t rows;
  int v19;
  unint64_t *v20;
  int v21;
  size_t v22;
  CGImage *v23;

  data = a3->data;
  dims = a3->dims;
  if ((int)dims < 1)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v6 = a3->step.p[(dims - 1)];
  if (dims < 3)
  {
LABEL_7:
    v8 = a3->cols * (uint64_t)a3->rows;
    goto LABEL_8;
  }
  p = a3->size.p;
  v8 = 1;
  do
  {
    v9 = *p++;
    v8 *= v9;
    --dims;
  }
  while (dims);
LABEL_8:
  v10 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, v8 * v6));
  v11 = a3->dims;
  v12 = __OFSUB__(v11, 1);
  v13 = v11 - 1;
  if (v13 < 0 != v12 || a3->step.p[v13] != 1)
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  else
    DeviceRGB = CGColorSpaceCreateDeviceGray();
  v15 = DeviceRGB;
  v16 = CGDataProviderCreateWithCFData(v10);
  cols = a3->cols;
  if ((cols & 0x80000000) != 0 || (rows = a3->rows, (rows & 0x80000000) != 0))
    __assert_rtn("safeUnsignedCast", "OpenCVWrapperInternal.h", 73, "value >= 0 && \"int outside of valid range to cast to size_t\");
  v19 = a3->dims;
  v20 = a3->step.p;
  v12 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v21 < 0 != v12)
    v22 = 0;
  else
    v22 = 8 * v20[v21];
  v23 = CGImageCreate(cols, rows, 8uLL, v22, *v20, v15, 0, v16, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v16);
  CGColorSpaceRelease(v15);

  return v23;
}

@end
