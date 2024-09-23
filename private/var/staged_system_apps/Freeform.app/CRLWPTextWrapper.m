@implementation CRLWPTextWrapper

+ (void)splitLine:(CGRect)a3 lineSegmentRects:(id)a4 wrapSegments:(id)a5 type:(int64_t)a6 skipHint:(double *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  id v26;
  char *v27;
  __n128 v28;
  char *v29;
  __int8 *v30;
  void *i;
  double *v32;
  double v33;
  double v34;
  double v36;
  int v37;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  __n128 *v45;
  __n128 *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  __n128 *v52;
  __n128 *v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  __n128 *v57;
  int64_t v58;
  BOOL v59;
  BOOL v60;
  double v61;
  id v62;
  uint64_t v63;
  double v64;
  double v65;
  id v66;
  double *v67;
  int64_t v68;
  void *v69;
  double v70;
  void *__p;
  __n128 *v72;
  unint64_t v73;
  char v74[9];
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v16 = a5;
  v17 = v16;
  if (a7)
    *a7 = 1.0;
  objc_msgSend(v16, "bounds");
  v81.origin.x = v18;
  v81.origin.y = v19;
  v81.size.width = v20;
  v81.size.height = v21;
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v75.size.height = height;
  if (CGRectIntersectsRect(v75, v81))
  {
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    v69 = v15;
    MinX = CGRectGetMinX(v76);
    v77.origin.x = x;
    v77.origin.y = y;
    v77.size.width = width;
    v77.size.height = height;
    MaxX = CGRectGetMaxX(v77);
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = width;
    v78.size.height = height;
    MinY = CGRectGetMinY(v78);
    v79.origin.x = x;
    v79.origin.y = y;
    v79.size.width = width;
    v79.size.height = height;
    MaxY = CGRectGetMaxY(v79);
    v80.origin.x = x;
    v80.origin.y = y;
    v64 = width;
    v65 = height;
    v80.size.width = width;
    v80.size.height = height;
    v70 = CGRectGetHeight(v80);
    __p = 0;
    v72 = 0;
    v73 = 0;
    sub_1000CA6DC(&__p, 0x40uLL);
    v66 = a1;
    v67 = a7;
    v26 = objc_msgSend(v17, "segmentCount");
    v68 = a6;
    v27 = (char *)objc_msgSend(v17, "segments");
    if (v26)
    {
      v29 = v27;
      v30 = 0;
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        v32 = (double *)&v29[32 * (_QWORD)i];
        v33 = v32[1];
        v34 = v32[3];
        if (v34 > MinY && v33 < MaxY)
        {
          v28.n128_f64[0] = *v32;
          v36 = v32[2];
          if (v33 <= MinY)
          {
            v28.n128_f64[0] = v28.n128_f64[0] + (MinY - v33) / (v34 - v33) * (v36 - v28.n128_f64[0]);
            v37 = 1;
            v33 = MinY;
          }
          else
          {
            v37 = 0;
          }
          if (v34 >= MaxY && v33 < MaxY)
          {
            v36 = v28.n128_f64[0] + (MaxY - v33) / (v34 - v33) * (v36 - v28.n128_f64[0]);
            v39 = 1;
          }
          else
          {
            v39 = 0;
          }
          if (v36 >= v28.n128_f64[0])
            v40 = v28.n128_f64[0];
          else
            v40 = v36;
          if (v28.n128_f64[0] >= v36)
            v41 = v28.n128_f64[0];
          else
            v41 = v36;
          if (v30
            && ((v42 = *(double *)v30, v28.n128_u64[0] = *((_QWORD *)v30 + 1), v41 >= v28.n128_f64[0])
              ? (v43 = *((double *)v30 + 1))
              : (v43 = v41),
                v42 >= v40 ? (v44 = *(double *)v30) : (v44 = v40),
                v44 <= v43))
          {
            if (v40 < v42)
              v42 = v40;
            if (v28.n128_f64[0] < v41)
              v28.n128_f64[0] = v41;
            *(double *)v30 = v42;
            *((_QWORD *)v30 + 1) = v28.n128_u64[0];
            v30[16] = v30[16] != v37;
            v30[17] = v30[17] != v39;
          }
          else
          {
            v45 = v72;
            if ((unint64_t)v72 >= v73)
            {
              v47 = 0xAAAAAAAAAAAAAAABLL * (((char *)v72 - (_BYTE *)__p) >> 3);
              v48 = v47 + 1;
              if (v47 + 1 > 0xAAAAAAAAAAAAAAALL)
                sub_100007810();
              if (0x5555555555555556 * ((uint64_t)(v73 - (_QWORD)__p) >> 3) > v48)
                v48 = 0x5555555555555556 * ((uint64_t)(v73 - (_QWORD)__p) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v73 - (_QWORD)__p) >> 3) >= 0x555555555555555)
                v49 = 0xAAAAAAAAAAAAAAALL;
              else
                v49 = v48;
              if (v49)
                v50 = (char *)sub_100045008((uint64_t)&v73, v49);
              else
                v50 = 0;
              v51 = &v50[24 * v47];
              *(double *)v51 = v40;
              *((double *)v51 + 1) = v41;
              v51[16] = v37;
              v51[17] = v39;
              *(_DWORD *)(v51 + 18) = 0;
              *((_WORD *)v51 + 11) = 0;
              v53 = (__n128 *)__p;
              v52 = v72;
              v54 = v51;
              if (v72 != __p)
              {
                do
                {
                  v28 = *(__n128 *)((char *)v52 - 24);
                  *((_QWORD *)v54 - 1) = v52[-1].n128_u64[1];
                  *(__n128 *)(v54 - 24) = v28;
                  v54 -= 24;
                  v52 = (__n128 *)((char *)v52 - 24);
                }
                while (v52 != v53);
                v52 = (__n128 *)__p;
              }
              v46 = (__n128 *)(v51 + 24);
              __p = v54;
              v72 = (__n128 *)(v51 + 24);
              v73 = (unint64_t)&v50[24 * v49];
              if (v52)
                operator delete(v52);
            }
            else
            {
              v72->n128_f64[0] = v40;
              v45->n128_f64[1] = v41;
              v45[1].n128_u8[0] = v37;
              v45[1].n128_u8[1] = v39;
              *(unsigned __int32 *)((char *)v45[1].n128_u32 + 2) = 0;
              v46 = (__n128 *)((char *)v45 + 24);
              v45[1].n128_u16[3] = 0;
            }
            v72 = v46;
            v30 = &v46[-2].n128_i8[8];
          }
        }
      }
    }
    v55 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v72 - (_BYTE *)__p) >> 3));
    if (v72 == __p)
      v56 = 0;
    else
      v56 = v55;
    sub_1000CB080((uint64_t)__p, v72, (uint64_t)v74, v56, 1, v28);
    v57 = (__n128 *)__p;
    v58 = a6;
    v15 = v69;
    if (__p != v72)
    {
      v59 = a6 != 1;
      v60 = a6 != 1;
      do
      {
        if (!v60 && !v59 && MinX < v57->n128_f64[0])
        {
          if (MaxX - MinX >= v57->n128_f64[0] - MinX)
            v61 = v57->n128_f64[0] - MinX;
          else
            v61 = MaxX - MinX;
          objc_msgSend(v69, "addRect:", MinX, MinY, v61, v70);
        }
        if (MinX < v57->n128_f64[1])
          MinX = v57->n128_f64[1];
        if (MinX >= MaxX)
          break;
        v59 = v57[1].n128_u8[1] != v59;
        v60 = v57[1].n128_u8[0] != v60;
        v57 = (__n128 *)((char *)v57 + 24);
      }
      while (v57 != v72);
    }
    if (v68 == 1 && MinX < MaxX)
      objc_msgSend(v69, "addRect:", MinX, MinY, MaxX - MinX, v70);
    if (v67)
    {
      v62 = objc_msgSend(v69, "count");
      if (v58 == 1 && !v62)
      {
        objc_msgSend(v66, "p_skipHintForRect:wrapSegments:type:", v17, 1, x, y, v64, v65);
        *(_QWORD *)v67 = v63;
      }
    }
    if (__p)
    {
      v72 = (__n128 *)__p;
      operator delete(__p);
    }
  }
  else if (a6 == 1)
  {
    objc_msgSend(v15, "addRect:", x, y, width, height);
  }

}

+ (double)unobstructedSpanForWrapSegments:(id)a3 startingSpan:(CGRect)a4 columnBounds:(CGRect)a5
{
  CGFloat width;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  double MinX;
  double MaxX;
  id v13;
  char *v14;
  __n128 v15;
  char *v16;
  __int8 *v17;
  void *v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v32;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __n128 *v40;
  __n128 *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  __n128 *v47;
  __n128 *v48;
  __n128 *v49;
  unint64_t v50;
  uint64_t v51;
  double MinY;
  __n128 *v53;
  BOOL v54;
  BOOL v55;
  int v57;
  int v58;
  double v59;
  double MaxY;
  CGFloat v62;
  CGFloat height;
  double v64;
  CGFloat x;
  CGFloat y;
  __n128 *v67;
  __n128 *v68;
  unint64_t v69;
  char v70[9];
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  height = a5.size.height;
  width = a5.size.width;
  x = a5.origin.x;
  y = a5.origin.y;
  v6 = a4.size.height;
  v7 = a4.size.width;
  v8 = a4.origin.y;
  v9 = a4.origin.x;
  v10 = a3;
  v71.origin.x = v9;
  v71.origin.y = v8;
  v71.size.width = v7;
  v71.size.height = v6;
  MinX = CGRectGetMinX(v71);
  v72.origin.x = v9;
  v72.origin.y = v8;
  v72.size.width = v7;
  v72.size.height = v6;
  MaxX = CGRectGetMaxX(v72);
  v73.origin.x = v9;
  v73.origin.y = v8;
  v73.size.width = v7;
  v73.size.height = v6;
  v64 = CGRectGetHeight(v73);
  v67 = 0;
  v68 = 0;
  v69 = 0;
  sub_1000CA6DC((void **)&v67, 0x40uLL);
  v13 = objc_msgSend(v10, "segmentCount");
  v62 = width;
  v14 = (char *)objc_msgSend(v10, "segments");
  if (v13)
  {
    v16 = v14;
    v17 = 0;
    v18 = 0;
    v19 = v6;
    v20 = v7;
    do
    {
      v21 = (double *)&v16[32 * (_QWORD)v18];
      v15.n128_f64[0] = *v21;
      v22 = v21[2];
      if ((*v21 > MinX || v22 > MinX) && (v15.n128_f64[0] < MaxX || v22 < MaxX))
      {
        v25 = v21[1];
        v26 = v21[3];
        if (v15.n128_f64[0] >= v22)
          v27 = v21[2];
        else
          v27 = *v21;
        if (v15.n128_f64[0] >= v22)
          v28 = v21[3];
        else
          v28 = v21[1];
        if (v15.n128_f64[0] >= v22)
          v29 = *v21;
        else
          v29 = v21[2];
        if (v15.n128_f64[0] >= v22)
          v30 = v21[1];
        else
          v30 = v21[3];
        if (v27 > MinX || v29 <= MinX)
        {
          v32 = 0;
        }
        else
        {
          v28 = v25 + (MinX - v15.n128_f64[0]) / (v22 - v15.n128_f64[0]) * (v26 - v25);
          v32 = 1;
          v27 = MinX;
        }
        if (v29 >= MaxX && v27 < MaxX)
        {
          v15.n128_f64[0] = (MaxX - v15.n128_f64[0]) / (v22 - v15.n128_f64[0]);
          v30 = v25 + v15.n128_f64[0] * (v26 - v25);
          v34 = 1;
        }
        else
        {
          v34 = 0;
        }
        if (v30 >= v28)
          v35 = v28;
        else
          v35 = v30;
        if (v28 >= v30)
          v36 = v28;
        else
          v36 = v30;
        if (v17
          && ((v37 = *(double *)v17, v15.n128_u64[0] = *((_QWORD *)v17 + 1), v36 >= v15.n128_f64[0])
            ? (v38 = *((double *)v17 + 1))
            : (v38 = v36),
              v37 >= v35 ? (v39 = *(double *)v17) : (v39 = v35),
              v39 <= v38))
        {
          if (v35 < v37)
            v37 = v35;
          if (v15.n128_f64[0] < v36)
            v15.n128_f64[0] = v36;
          *(double *)v17 = v37;
          *((_QWORD *)v17 + 1) = v15.n128_u64[0];
          v17[16] = v17[16] != v32;
          v17[17] = v17[17] != v34;
          v6 = v19;
          v7 = v20;
        }
        else
        {
          v40 = v68;
          if ((unint64_t)v68 >= v69)
          {
            v42 = 0xAAAAAAAAAAAAAAABLL * (((char *)v68 - (char *)v67) >> 3);
            v43 = v42 + 1;
            if (v42 + 1 > 0xAAAAAAAAAAAAAAALL)
              sub_100007810();
            if (0x5555555555555556 * ((uint64_t)(v69 - (_QWORD)v67) >> 3) > v43)
              v43 = 0x5555555555555556 * ((uint64_t)(v69 - (_QWORD)v67) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v69 - (_QWORD)v67) >> 3) >= 0x555555555555555)
              v44 = 0xAAAAAAAAAAAAAAALL;
            else
              v44 = v43;
            if (v44)
              v45 = (char *)sub_100045008((uint64_t)&v69, v44);
            else
              v45 = 0;
            v46 = &v45[24 * v42];
            *(double *)v46 = v35;
            *((double *)v46 + 1) = v36;
            v46[16] = v32;
            v46[17] = v34;
            *(_DWORD *)(v46 + 18) = 0;
            *((_WORD *)v46 + 11) = 0;
            v48 = v67;
            v47 = v68;
            v49 = (__n128 *)v46;
            v6 = v19;
            v7 = v20;
            if (v68 != v67)
            {
              do
              {
                v15 = *(__n128 *)((char *)v47 - 24);
                v49[-1].n128_u64[1] = v47[-1].n128_u64[1];
                *(__n128 *)((char *)v49 - 24) = v15;
                v49 = (__n128 *)((char *)v49 - 24);
                v47 = (__n128 *)((char *)v47 - 24);
              }
              while (v47 != v48);
              v47 = v67;
            }
            v41 = (__n128 *)(v46 + 24);
            v67 = v49;
            v68 = (__n128 *)(v46 + 24);
            v69 = (unint64_t)&v45[24 * v44];
            if (v47)
              operator delete(v47);
          }
          else
          {
            v68->n128_f64[0] = v35;
            v40->n128_f64[1] = v36;
            v40[1].n128_u8[0] = v32;
            v40[1].n128_u8[1] = v34;
            *(unsigned __int32 *)((char *)v40[1].n128_u32 + 2) = 0;
            v41 = (__n128 *)((char *)v40 + 24);
            v40[1].n128_u16[3] = 0;
            v6 = v19;
            v7 = v20;
          }
          v68 = v41;
          v17 = &v41[-2].n128_i8[8];
        }
      }
      v18 = (char *)v18 + 1;
    }
    while (v18 != v13);
  }
  v50 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v68 - (char *)v67) >> 3));
  if (v68 == v67)
    v51 = 0;
  else
    v51 = v50;
  sub_1000CB080((uint64_t)v67, v68, (uint64_t)v70, v51, 1, v15);
  v74.origin.x = v9;
  v74.origin.y = v8;
  v74.size.width = v7;
  v74.size.height = v6;
  MinY = CGRectGetMinY(v74);
  v53 = v67;
  if (v67 != v68)
  {
    v54 = 0;
    v55 = 0;
    do
    {
      if (!v55 && !v54 && MinY < v53->n128_f64[0] && v53->n128_f64[0] - MinY >= v64)
        break;
      v57 = v53[1].n128_u8[0];
      v58 = v53[1].n128_u8[1];
      v59 = v53->n128_f64[1];
      v75.origin.x = x;
      v75.origin.y = y;
      v75.size.width = v62;
      v75.size.height = height;
      MaxY = CGRectGetMaxY(v75);
      if (MinY < v59 + 1.0)
        MinY = v59 + 1.0;
      if (MinY >= MaxY)
        break;
      v54 = v58 != v54;
      v55 = v57 != v55;
      v53 = (__n128 *)((char *)v53 + 24);
    }
    while (v53 != v68);
    v53 = v67;
  }
  if (v53)
  {
    v68 = v53;
    operator delete(v53);
  }

  return MinY;
}

+ (id)horizontalIntersectionsOfRectList:(id)a3 withRectList:(id)a4 minWidth:(double)a5
{
  id v6;
  id v7;
  CRLMutableRectList *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double x;
  double y;
  double width;
  double height;
  double v31;
  double v33;
  double MaxX;
  CGFloat rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(CRLMutableRectList);
  v9 = 0;
  v10 = 0;
  v33 = 0.000000999999997;
  while (v10 < (unint64_t)objc_msgSend(v6, "count", *(_QWORD *)&v33)
       && v9 < (unint64_t)objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "rectAtIndex:", v10);
    rect = v11;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v7, "rectAtIndex:", v9);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v37.origin.x = rect;
    v37.origin.y = v13;
    v37.size.width = v15;
    v37.size.height = v17;
    MaxX = CGRectGetMaxX(v37);
    v38.origin.x = v19;
    v38.origin.y = v21;
    v38.size.width = v23;
    v38.size.height = v25;
    v26 = CGRectGetMaxX(v38);
    v39.origin.x = v19;
    v39.origin.y = v21;
    v39.size.width = v23;
    v39.size.height = v25;
    if (MaxX <= CGRectGetMinX(v39))
      goto LABEL_10;
    v40.origin.x = rect;
    v40.origin.y = v13;
    v40.size.width = v15;
    v40.size.height = v17;
    if (v26 <= CGRectGetMinX(v40))
      goto LABEL_11;
    v41.origin.x = rect;
    v41.origin.y = v13;
    v41.size.width = v15;
    v41.size.height = v17;
    v44.origin.x = v19;
    v44.origin.y = v21;
    v44.size.width = v23;
    v44.size.height = v25;
    v42 = CGRectIntersection(v41, v44);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    if (CGRectGetWidth(v42) >= a5)
      -[CRLMutableRectList addRect:](v8, "addRect:", x, y, width, height);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v31 = CGRectGetMaxX(v43);
    if (v31 == MaxX || vabdd_f64(v31, MaxX) < fabs(MaxX * v33))
LABEL_10:
      ++v10;
    else
LABEL_11:
      ++v9;
  }

  return v8;
}

+ (double)p_skipHintForRect:(CGRect)a3 wrapSegments:(id)a4 type:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double MinX;
  double MaxX;
  double MinY;
  char *v13;
  char *v14;
  double v15;
  float v16;
  double v17;
  char *v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if ((uint64_t)objc_msgSend(v9, "segmentCount") < 1)
  {
    v15 = 1.0;
  }
  else
  {
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    MinX = CGRectGetMinX(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    MaxX = CGRectGetMaxX(v39);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    MinY = CGRectGetMinY(v40);
    v13 = (char *)objc_msgSend(v9, "segmentCount");
    v14 = (char *)objc_msgSend(v9, "segments");
    v15 = 1.0;
    if (v13)
    {
      v16 = MinY + 1.0;
      v17 = ceilf(v16);
      v18 = v13 - 1;
      v19 = (double *)(v14 + 16);
      v20 = 1.79769313e308;
      do
      {
        v21 = *(v19 - 1);
        v22 = v19[1];
        if (v22 > v17 && v21 < v20)
        {
          v24 = *(v19 - 2);
          v25 = *v19;
          if ((v24 > MinX || v25 > MinX) && (v24 < MaxX || v25 < MaxX))
          {
            if (v24 >= v25)
              v28 = *v19;
            else
              v28 = *(v19 - 2);
            if (v24 >= v25)
              v29 = v19[1];
            else
              v29 = *(v19 - 1);
            if (v24 >= v25)
              v30 = *(v19 - 2);
            else
              v30 = *v19;
            if (v24 >= v25)
              v31 = *(v19 - 1);
            else
              v31 = v19[1];
            v32 = v25 - v24;
            v33 = v22 - v21;
            if (v28 < MinX)
              v29 = v21 + (MinX - v24) / v32 * v33;
            if (v30 > MaxX)
              v31 = v21 + (MaxX - v24) / v32 * v33;
            if (v31 >= v29)
              v34 = v29;
            else
              v34 = v31;
            if (v34 < v20)
              v20 = v34;
          }
        }
        v35 = v20 <= v17 || v18-- == 0;
        v19 += 4;
      }
      while (!v35);
      if (v20 < 1.79769313e308 && v20 > v17)
      {
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        v15 = v20 - CGRectGetMinY(v41);
      }
    }
  }

  return v15;
}

@end
