@implementation CRLBezierPath

+ (id)tracedPathForImage:(CGImage *)a3 alphaThreshold:(double)a4 pointSpacing:(double)a5
{
  size_t Width;
  size_t Height;
  BOOL IsMask;
  CGImageAlphaInfo AlphaInfo;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  unsigned __int8 *v16;
  unint64_t v17;
  CGContext *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  unint64_t v25;
  int v26;
  double v27;
  int v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  double *v38;
  uint64_t v39;
  double *v40;
  double *v41;
  double *v42;
  __int128 v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGPoint v50;
  unsigned int v51;
  unsigned int v52;
  unint64_t v53;
  double v54;
  double v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  double *v61;
  double *v62;
  double *v63;
  double *v64;
  __int128 v65;
  void *v66;
  id v67;
  double v69;
  float v70;
  void *v72;
  CGAffineTransform v73;
  CGPoint v74;
  CGPoint v75;
  __int128 v76;
  __int128 v77;
  __int128 __p;
  double *v79;
  uint64_t *v80;
  _QWORD *v81;
  uint64_t v82;
  CGRect v83;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  IsMask = CGImageIsMask(a3);
  AlphaInfo = CGImageGetAlphaInfo(a3);
  if (IsMask || AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0)
  {
    v11 = fminf((float)Width, 1024.0) / (float)Width;
    v12 = fminf((float)Height, 1024.0) / (float)Height;
    if (v12 >= v11)
      v13 = v11;
    else
      v13 = v12;
    v14 = ceil((double)Width * v13) + 2.0;
    v15 = ceil((double)Height * v13) + 2.0;
    v16 = (unsigned __int8 *)malloc_type_calloc((unint64_t)(v15 * (double)(unint64_t)v14), 1uLL, 0x100004077774924uLL);
    v17 = (unint64_t)v14;
    v18 = CGBitmapContextCreate(v16, (unint64_t)v14, (unint64_t)v15, 8uLL, (unint64_t)v14, 0, 7u);
    CGContextSetBlendMode(v18, kCGBlendModeCopy);
    v83.size.width = v14 + -2.0;
    v83.size.height = v15 + -2.0;
    v83.origin.x = 1.0;
    v83.origin.y = 1.0;
    CGContextDrawImage(v18, v83, a3);
    CGContextFlush(v18);
    CGContextRelease(v18);
    v70 = v13;
    v19 = sub_1003C65EC(a4, 0.0, 1.0);
    v20 = v15 + -1.0;
    v69 = v13;
    if (v20 <= 1.0)
    {
      v81 = 0;
      v82 = 0;
      v79 = 0;
      v80 = (uint64_t *)&v81;
      __p = 0uLL;
    }
    else
    {
      v21 = v14 + -1.0;
      v22 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          v23 = 1;
          do
          {
            v16[(int)v22 * v17 + v23] = v16[(int)v22 * v17 + v23] >= (v19 * 255.0);
            ++v23;
          }
          while (v21 > (double)v23);
        }
        v22 = v22 + 1.0;
      }
      while (v22 < v20);
      v81 = 0;
      v82 = 0;
      v80 = (uint64_t *)&v81;
      v24 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          v25 = (int)v24 * v17;
          v26 = v16[v25];
          v27 = 1.0;
          do
          {
            v28 = v26;
            v26 = v16[v25 + (int)v27];
            if (v28 != 1 && v26 == 1)
            {
              *(double *)&__p = v27 + 0.5;
              *((double *)&__p + 1) = v24 + 0.5;
              sub_10004504C(&v80, (double *)&__p, &__p);
            }
            v27 = v27 + 1.0;
          }
          while (v27 < v21);
        }
        v24 = v24 + 1.0;
      }
      while (v24 < v20);
      __p = 0uLL;
      v79 = 0;
      while (v82)
      {
        v77 = *((_OWORD *)v80 + 2);
        sub_10004513C(&v80, (double *)&v77);
        v29 = __p;
        *((_QWORD *)&__p + 1) = __p;
        v76 = v77;
        v31 = sub_100061064(*(double *)&v77);
        if (v16[(int)(v30 - 1.0) * v17 + (int)(v31 - 1.0)])
          v32 = v30 + 1.0;
        else
          v32 = v30;
        v33 = v31 + -1.0;
        v34 = v32 + -1.0;
        if (v29 >= (unint64_t)v79)
        {
          v36 = 0x5555555555555556 * ((uint64_t)((uint64_t)v79 - v29) >> 3);
          if (v36 <= 1)
            v36 = 1;
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v79 - v29) >> 3) >= 0x555555555555555)
            v37 = 0xAAAAAAAAAAAAAAALL;
          else
            v37 = v36;
          v38 = (double *)sub_100045008((uint64_t)&v79, v37);
          *v38 = v33;
          v38[1] = v34;
          *((_QWORD *)v38 + 2) = 8;
          v40 = (double *)*((_QWORD *)&__p + 1);
          v41 = (double *)__p;
          v42 = v38;
          if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
          {
            do
            {
              v43 = *(_OWORD *)(v40 - 3);
              *(v42 - 1) = *(v40 - 1);
              *(_OWORD *)(v42 - 3) = v43;
              v42 -= 3;
              v40 -= 3;
            }
            while (v40 != v41);
            v40 = (double *)__p;
          }
          v35 = (char *)(v38 + 3);
          *(_QWORD *)&__p = v42;
          *((_QWORD *)&__p + 1) = v38 + 3;
          v79 = &v38[3 * v39];
          if (v40)
            operator delete(v40);
        }
        else
        {
          *(double *)v29 = v33;
          *(double *)(v29 + 8) = v34;
          v35 = (char *)(v29 + 24);
          *(_QWORD *)(v29 + 16) = 8;
        }
        *((_QWORD *)&__p + 1) = v35;
        v44 = v32;
        v45 = v31;
        do
        {
          v74 = CGPointZero;
          v75 = v74;
          sub_100043B18((__int128 *)&v75, (__int128 *)&v74, *(double *)&v76, *((double *)&v76 + 1), v45, v44);
          v46 = *(double *)&v76 + v75.x;
          v47 = *((double *)&v76 + 1) + v75.y;
          v48 = sub_100061064(*(double *)&v76 + v75.x);
          if (v16[(int)v49 * v17 + (int)v48])
          {
            *(double *)&v76 = v46;
            *((double *)&v76 + 1) = v47;
            sub_10004513C(&v80, (double *)&v76);
          }
          else
          {
            v50 = v74;
            v51 = sub_1000437C0(v74.x, v74.y);
            v52 = v51;
            v53 = *((_QWORD *)&__p + 1);
            if (*((_QWORD *)&__p + 1) != (_QWORD)__p && *(_DWORD *)(*((_QWORD *)&__p + 1) - 8) == v51)
            {
              v53 = *((_QWORD *)&__p + 1) - 24;
              *((_QWORD *)&__p + 1) -= 24;
            }
            v45 = v45 + v50.x;
            v44 = v44 + v50.y;
            v54 = v45 + -1.0;
            v55 = v44 + -1.0;
            if (v53 >= (unint64_t)v79)
            {
              v57 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - __p) >> 3);
              v58 = v57 + 1;
              if (v57 + 1 > 0xAAAAAAAAAAAAAAALL)
                sub_100007810();
              if (0x5555555555555556 * ((uint64_t)((uint64_t)v79 - __p) >> 3) > v58)
                v58 = 0x5555555555555556 * ((uint64_t)((uint64_t)v79 - __p) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v79 - __p) >> 3) >= 0x555555555555555)
                v59 = 0xAAAAAAAAAAAAAAALL;
              else
                v59 = v58;
              if (v59)
                v60 = (char *)sub_100045008((uint64_t)&v79, v59);
              else
                v60 = 0;
              v61 = (double *)&v60[24 * v57];
              *v61 = v54;
              v61[1] = v55;
              *((_DWORD *)v61 + 4) = v52;
              *((_DWORD *)v61 + 5) = 0;
              v62 = (double *)*((_QWORD *)&__p + 1);
              v63 = (double *)__p;
              v64 = v61;
              if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
              {
                do
                {
                  v65 = *(_OWORD *)(v62 - 3);
                  *(v64 - 1) = *(v62 - 1);
                  *(_OWORD *)(v64 - 3) = v65;
                  v64 -= 3;
                  v62 -= 3;
                }
                while (v62 != v63);
                v62 = (double *)__p;
              }
              v56 = (unint64_t)(v61 + 3);
              *(_QWORD *)&__p = v64;
              *((_QWORD *)&__p + 1) = v61 + 3;
              v79 = (double *)&v60[24 * v59];
              if (v62)
                operator delete(v62);
            }
            else
            {
              *(double *)v53 = v54;
              *(double *)(v53 + 8) = v55;
              v56 = v53 + 24;
              *(_QWORD *)(v53 + 16) = v51;
            }
            *((_QWORD *)&__p + 1) = v56;
          }
        }
        while (v31 != v45 || v32 != v44);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&__p + 1) - __p) >> 3) >= 2)
          sub_100043DCC(v72, (uint64_t *)&__p, a5);
      }
    }
    free(v16);
    if (v70 != 1.0)
    {
      CGAffineTransformMakeScale(&v73, 1.0 / v69, 1.0 / v69);
      objc_msgSend(v72, "transformUsingAffineTransform:", &v73);
    }
    if ((_QWORD)__p)
    {
      *((_QWORD *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
    sub_10001CE40((uint64_t)&v80, v81);
  }
  else
  {
    objc_msgSend(v72, "appendBezierPathWithRect:", sub_10005FDDC());
  }
  if ((uint64_t)objc_msgSend(v72, "elementCount", *(_QWORD *)&v69) <= 0)
    v66 = 0;
  else
    v66 = v72;
  v67 = v66;

  return v67;
}

+ (id)tracedPathForInstantAlphaBinaryBitmap:(id)a3 pointSpacing:(double)a4
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  _BOOL4 v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  double *v33;
  double *v34;
  double *v35;
  double *v36;
  __int128 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  BOOL v49;
  CGPoint v50;
  unsigned int v51;
  unsigned int v52;
  unint64_t v53;
  double v54;
  double v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  double *v61;
  double *v62;
  double *v63;
  double *v64;
  __int128 v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  char v69;
  void *v70;
  id v71;
  void *v74;
  CGPoint v75;
  CGPoint v76;
  __int128 v77;
  __int128 v78;
  __int128 __p;
  char *v80;
  uint64_t *v81;
  _QWORD *v82;
  uint64_t v83;

  v4 = a3;
  v5 = v4[1];
  v6 = v4[2];
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v82 = 0;
  v83 = 0;
  v81 = (uint64_t *)&v82;
  if ((unint64_t)(v6 + 1) <= 1)
  {
    __p = 0uLL;
    v80 = 0;
    goto LABEL_86;
  }
  v7 = v5 + 1;
  v8 = 1.0;
  do
  {
    if (v7 >= 2)
    {
      v9 = 0;
      v10 = (uint64_t)v8;
      v11 = 1.0;
      do
      {
        v12 = (uint64_t)v11;
        v13 = v4;
        if ((uint64_t)v11 >= 1 && v10 >= 1 && v13[1] >= v12 && v13[2] >= v10)
        {
          v14 = (0x80uLL >> ((v12 - 1) & 7)) & *(unsigned __int8 *)(v13[4]
                                                                  + v13[3] * ((uint64_t)v8 - 1)
                                                                  + ((unint64_t)(v12 - 1) >> 3));

          if (v14)
            v15 = 1;
          else
            v15 = v9;
          v9 = v14 == 0;
          if (!v15)
          {
            *(double *)&__p = v11 + 0.5;
            *((double *)&__p + 1) = v8 + 0.5;
            sub_10004504C(&v81, (double *)&__p, &__p);
            v9 = 1;
          }
        }
        else
        {

          v9 = 0;
        }
        v11 = v11 + 1.0;
      }
      while (v11 < (double)v7);
    }
    v8 = v8 + 1.0;
  }
  while (v8 < (double)(unint64_t)(v6 + 1));
  __p = 0uLL;
  v80 = 0;
  while (v83)
  {
    v78 = *((_OWORD *)v81 + 2);
    sub_10004513C(&v81, (double *)&v78);
    *((_QWORD *)&__p + 1) = __p;
    v77 = v78;
    v16 = sub_100061064(*(double *)&v78);
    v18 = v17;
    v19 = (uint64_t)(v16 - 1.0);
    v20 = v4;
    v21 = v20;
    v22 = v19 - 1;
    if (v19 < 1 || ((v23 = (uint64_t)(v18 - 1.0), v23 >= 1) ? (v24 = v20[1] < v19) : (v24 = 1), v24 || v20[2] < v23))
    {

    }
    else
    {
      v68 = *(unsigned __int8 *)(v20[4] + v20[3] * (v23 - 1) + (v22 >> 3));
      v69 = v22 & 7;

      if (((v68 << v69) & 0x80) == 0)
        v18 = v18 + 1.0;
    }
    v25 = *((_QWORD *)&__p + 1);
    if (*((_QWORD *)&__p + 1) != (_QWORD)__p && *(_DWORD *)(*((_QWORD *)&__p + 1) - 8) == 8)
    {
      v25 = *((_QWORD *)&__p + 1) - 24;
      *((_QWORD *)&__p + 1) -= 24;
    }
    v26 = v16 + -1.0;
    v27 = v18 + -1.0;
    if (v25 >= (unint64_t)v80)
    {
      v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25 - __p) >> 3);
      v30 = v29 + 1;
      if (v29 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_100007810();
      if (0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3) > v30)
        v30 = 0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v80[-__p] >> 3) >= 0x555555555555555)
        v31 = 0xAAAAAAAAAAAAAAALL;
      else
        v31 = v30;
      if (v31)
        v32 = (char *)sub_100045008((uint64_t)&v80, v31);
      else
        v32 = 0;
      v33 = (double *)&v32[24 * v29];
      *v33 = v26;
      v33[1] = v27;
      *((_QWORD *)v33 + 2) = 8;
      v34 = (double *)*((_QWORD *)&__p + 1);
      v35 = (double *)__p;
      v36 = v33;
      if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
      {
        do
        {
          v37 = *(_OWORD *)(v34 - 3);
          *(v36 - 1) = *(v34 - 1);
          *(_OWORD *)(v36 - 3) = v37;
          v36 -= 3;
          v34 -= 3;
        }
        while (v34 != v35);
        v34 = (double *)__p;
      }
      v28 = (unint64_t)(v33 + 3);
      *(_QWORD *)&__p = v36;
      *((_QWORD *)&__p + 1) = v33 + 3;
      v80 = &v32[24 * v31];
      if (v34)
        operator delete(v34);
    }
    else
    {
      *(double *)v25 = v26;
      *(double *)(v25 + 8) = v27;
      v28 = v25 + 24;
      *(_QWORD *)(v25 + 16) = 8;
    }
    *((_QWORD *)&__p + 1) = v28;
    v38 = v18;
    v39 = v16;
    do
    {
      v75 = CGPointZero;
      v76 = v75;
      sub_100043B18((__int128 *)&v76, (__int128 *)&v75, *(double *)&v77, *((double *)&v77 + 1), v39, v38);
      v40 = *(double *)&v77 + v76.x;
      v41 = *((double *)&v77 + 1) + v76.y;
      v42 = sub_100061064(*(double *)&v77 + v76.x);
      v44 = v43;
      v45 = (uint64_t)v42;
      v46 = v21;
      v47 = v45 - 1;
      if (v45 < 1 || ((v48 = (uint64_t)v44, (uint64_t)v44 >= 1) ? (v49 = v46[1] < v45) : (v49 = 1), v49 || v46[2] < v48))
      {

      }
      else
      {
        v66 = *(unsigned __int8 *)(v46[4] + v46[3] * (v48 - 1) + (v47 >> 3));
        v67 = v47 & 7;

        if (((v66 << v67) & 0x80) == 0)
        {
          *(double *)&v77 = v40;
          *((double *)&v77 + 1) = v41;
          sub_10004513C(&v81, (double *)&v77);
          continue;
        }
      }
      v50 = v75;
      v51 = sub_1000437C0(v75.x, v75.y);
      v52 = v51;
      v53 = *((_QWORD *)&__p + 1);
      if (*((_QWORD *)&__p + 1) != (_QWORD)__p && *(_DWORD *)(*((_QWORD *)&__p + 1) - 8) == v51)
      {
        v53 = *((_QWORD *)&__p + 1) - 24;
        *((_QWORD *)&__p + 1) -= 24;
      }
      v39 = v39 + v50.x;
      v38 = v38 + v50.y;
      v54 = v39 + -1.0;
      v55 = v38 + -1.0;
      if (v53 >= (unint64_t)v80)
      {
        v57 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - __p) >> 3);
        v58 = v57 + 1;
        if (v57 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_100007810();
        if (0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3) > v58)
          v58 = 0x5555555555555556 * ((uint64_t)&v80[-__p] >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v80[-__p] >> 3) >= 0x555555555555555)
          v59 = 0xAAAAAAAAAAAAAAALL;
        else
          v59 = v58;
        if (v59)
          v60 = (char *)sub_100045008((uint64_t)&v80, v59);
        else
          v60 = 0;
        v61 = (double *)&v60[24 * v57];
        *v61 = v54;
        v61[1] = v55;
        *((_DWORD *)v61 + 4) = v52;
        *((_DWORD *)v61 + 5) = 0;
        v62 = (double *)*((_QWORD *)&__p + 1);
        v63 = (double *)__p;
        v64 = v61;
        if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
        {
          do
          {
            v65 = *(_OWORD *)(v62 - 3);
            *(v64 - 1) = *(v62 - 1);
            *(_OWORD *)(v64 - 3) = v65;
            v64 -= 3;
            v62 -= 3;
          }
          while (v62 != v63);
          v62 = (double *)__p;
        }
        v56 = (unint64_t)(v61 + 3);
        *(_QWORD *)&__p = v64;
        *((_QWORD *)&__p + 1) = v61 + 3;
        v80 = &v60[24 * v59];
        if (v62)
          operator delete(v62);
      }
      else
      {
        *(double *)v53 = v54;
        *(double *)(v53 + 8) = v55;
        v56 = v53 + 24;
        *(_QWORD *)(v53 + 16) = v51;
      }
      *((_QWORD *)&__p + 1) = v56;
    }
    while (v16 != v39 || v18 != v38);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&__p + 1) - __p) >> 3) >= 2)
      sub_100043DCC(v74, (uint64_t *)&__p, a4);
  }
LABEL_86:
  if ((uint64_t)objc_msgSend(v74, "elementCount") <= 0)
    v70 = 0;
  else
    v70 = v74;
  v71 = v70;
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  sub_10001CE40((uint64_t)&v81, v82);

  return v71;
}

+ (void)initialize
{
  if ((id)objc_opt_class(CRLBezierPath, a2) == a1)
    +[CRLBezierPath setVersion:](CRLBezierPath, "setVersion:", 524);
}

+ (id)bezierPath
{
  return objc_alloc_init((Class)a1);
}

+ (CRLBezierPath)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  CRLBezierPath *v8;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = (CRLBezierPath *)objc_msgSend(a1, "bezierPath");
  -[CRLBezierPath moveToPoint:](v8, "moveToPoint:", v7, v6);
  -[CRLBezierPath lineToPoint:](v8, "lineToPoint:", x, y);
  return v8;
}

+ (CRLBezierPath)bezierPathWithDefaultsForErrorCases
{
  return (CRLBezierPath *)objc_msgSend(a1, "bezierPathWithStart:end:", CGPointZero.x, CGPointZero.y, 100.0, 100.0);
}

+ (CRLBezierPath)bezierPathWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CRLBezierPath *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CRLBezierPath *)objc_msgSend(a1, "bezierPath");
  -[CRLBezierPath appendBezierPathWithRect:](v7, "appendBezierPathWithRect:", x, y, width, height);
  return v7;
}

+ (CRLBezierPath)bezierPathWithOvalInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CRLBezierPath *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CRLBezierPath *)objc_msgSend(a1, "bezierPath");
  -[CRLBezierPath appendBezierPathWithOvalInRect:](v7, "appendBezierPathWithOvalInRect:", x, y, width, height);
  return v7;
}

+ (CRLBezierPath)bezierPathWithCGPath:(CGPath *)a3
{
  CRLBezierPath *v4;

  v4 = (CRLBezierPath *)objc_msgSend(a1, "bezierPath");
  CGPathApply(a3, v4, (CGPathApplierFunction)sub_1000D7E44);
  if (v4->sfr_path)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235D40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF748C();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPath bezierPathWithCGPath:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 303, 0, "expected nil value for '%{public}s'", "result->sfr_path");
  }
  v4->sfr_path = CGPathCreateCopy(a3);
  return v4;
}

+ (void)fillRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextFillRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGLineCap v8;
  CGLineJoin v9;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat v13;
  CGFloat v14;
  CGFloat MaxY;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      if (qword_101414DA8 == 2)
        v8 = kCGLineCapSquare;
      else
        v8 = qword_101414DA8 == 1;
      CGContextSetLineCap(CurrentContext, v8);
      if (qword_101414DB0 == 2)
        v9 = kCGLineJoinBevel;
      else
        v9 = qword_101414DB0 == 1;
      CGContextSetLineJoin(CurrentContext, v9);
      sub_1000D79C4(CurrentContext, *(double *)&qword_1013D94C8);
      CGContextSetMiterLimit(CurrentContext, *(CGFloat *)&qword_1013D94D0);
      CGContextBeginPath(CurrentContext);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      MinX = CGRectGetMinX(v18);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      MinY = CGRectGetMinY(v19);
      CGContextMoveToPoint(CurrentContext, MinX, MinY);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      MaxX = CGRectGetMaxX(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v13 = CGRectGetMinY(v21);
      CGContextAddLineToPoint(CurrentContext, MaxX, v13);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v14 = CGRectGetMaxX(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      MaxY = CGRectGetMaxY(v23);
      CGContextAddLineToPoint(CurrentContext, v14, MaxY);
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v16 = CGRectGetMinX(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v17 = CGRectGetMaxY(v25);
      CGContextAddLineToPoint(CurrentContext, v16, v17);
      CGContextClosePath(CurrentContext);
      CGContextStrokePath(CurrentContext);
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (void)clipRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextClipToRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGContext *CurrentContext;
  CGLineCap v9;
  CGLineJoin v10;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if (qword_101414DA8 == 2)
    v9 = kCGLineCapSquare;
  else
    v9 = qword_101414DA8 == 1;
  CGContextSetLineCap(CurrentContext, v9);
  if (qword_101414DB0 == 2)
    v10 = kCGLineJoinBevel;
  else
    v10 = qword_101414DB0 == 1;
  CGContextSetLineJoin(CurrentContext, v10);
  sub_1000D79C4(CurrentContext, *(double *)&qword_1013D94C8);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7, v6);
  CGContextAddLineToPoint(CurrentContext, x, y);
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

+ (void)setDefaultMiterLimit:(double)a3
{
  qword_1013D94D0 = *(_QWORD *)&a3;
}

+ (double)defaultMiterLimit
{
  return *(double *)&qword_1013D94D0;
}

+ (void)setDefaultFlatness:(double)a3
{
  qword_1013D94D8 = *(_QWORD *)&a3;
}

+ (double)defaultFlatness
{
  return *(double *)&qword_1013D94D8;
}

+ (void)setDefaultWindingRule:(int64_t)a3
{
  qword_101414DB8 = a3;
}

+ (int64_t)defaultWindingRule
{
  return qword_101414DB8;
}

+ (void)setDefaultLineCapStyle:(unint64_t)a3
{
  qword_101414DA8 = a3;
}

+ (unint64_t)defaultLineCapStyle
{
  return qword_101414DA8;
}

+ (void)setDefaultLineJoinStyle:(unint64_t)a3
{
  qword_101414DB0 = a3;
}

+ (unint64_t)defaultLineJoinStyle
{
  return qword_101414DB0;
}

+ (void)setDefaultLineWidth:(double)a3
{
  qword_1013D94C8 = *(_QWORD *)&a3;
}

+ (double)defaultLineWidth
{
  return *(double *)&qword_1013D94C8;
}

- (CRLBezierPath)init
{
  CRLBezierPath *result;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  $7B3C09426D5A94CD5FE07DCF037609F1 v4;
  double v5;
  CGSize size;
  CGPoint origin;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLBezierPath;
  result = -[CRLBezierPath init](&v8, "init");
  sfr_bpFlags = result->sfr_bpFlags;
  *(_OWORD *)&result->sfr_elementCount = 0u;
  *(_OWORD *)&result->sfr_head = 0u;
  result->sfr_extraSegmentCount = 0;
  result->sfr_extraSegmentMax = 0;
  result->sfr_totalLength = 0.0;
  result->sfr_lastSubpathIndex = -1;
  result->sfr_extraSegments = 0;
  v4 = ($7B3C09426D5A94CD5FE07DCF037609F1)(((8 * qword_101414DB8) | ((_BYTE)qword_101414DA8 << 6)) | *(_DWORD *)&sfr_bpFlags & 0xFFFFF800 | (16 * (qword_101414DB0 & 0xF)) | 7);
  *(_QWORD *)&result->sfr_lineWidth = qword_1013D94C8;
  v5 = *(double *)&qword_1013D94D8;
  *(_QWORD *)&result->sfr_miterLimit = qword_1013D94D0;
  result->sfr_flatness = v5;
  result->sfr_dashedLinePattern = 0;
  result->sfr_dashedLineCount = 0;
  result->sfr_dashedLinePhase = 0.0;
  result->sfr_bpFlags = v4;
  origin = CGRectZero.origin;
  size = CGRectZero.size;
  result->sfr_bounds.size = size;
  result->sfr_bounds.origin = origin;
  result->sfr_controlPointBounds.size = size;
  result->sfr_controlPointBounds.origin = origin;
  return result;
}

- (void)dealloc
{
  NSZone *v3;
  double *sfr_dashedLinePattern;
  CGPath *sfr_path;
  void *sfr_extraSegments;
  objc_super v7;

  v3 = (NSZone *)-[CRLBezierPath zone](self, "zone");
  NSZoneFree(v3, self->sfr_head);
  NSZoneFree(v3, self->sfr_elementLength);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    NSZoneFree(v3, sfr_dashedLinePattern);
  sfr_path = self->sfr_path;
  if (sfr_path)
    CFRelease(sfr_path);
  sfr_extraSegments = self->sfr_extraSegments;
  if (sfr_extraSegments)
    NSZoneFree(v3, sfr_extraSegments);
  v7.receiver = self;
  v7.super_class = (Class)CRLBezierPath;
  -[CRLBezierPath dealloc](&v7, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v14[6];
  double v15[6];

  if (self == a3)
  {
LABEL_16:
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(CRLBezierPath, v6);
    v8 = sub_1002223BC(v7, a3);
    v9 = -[CRLBezierPath elementCount](self, "elementCount");
    if ((id)v9 != objc_msgSend(v8, "elementCount"))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (v9 >= 1)
    {
      v10 = 0;
      while (1)
      {
        v11 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v10, v15);
        if (v11 != objc_msgSend(v8, "elementAtIndex:associatedPoints:", v10, v14))
          goto LABEL_17;
        if ((unint64_t)v11 >= 2)
        {
          if (v11 == (id)2)
          {
            v12 = 0;
            while (sub_10005FDF0(v15[v12], v15[v12 + 1], v14[v12], v14[v12 + 1]))
            {
              v12 += 2;
              if (v12 == 6)
                goto LABEL_14;
            }
            goto LABEL_17;
          }
        }
        else if (!sub_10005FDF0(v15[0], v15[1], v14[0], v14[1]))
        {
          goto LABEL_17;
        }
LABEL_14:
        ++v10;
        LOBYTE(v5) = 1;
        if (v10 == v9)
          return v5;
      }
    }
    goto LABEL_16;
  }
  return v5;
}

- (void)copyPathAttributesTo:(id)a3
{
  double *sfr_dashedLinePattern;

  objc_msgSend(a3, "setWindingRule:", -[CRLBezierPath windingRule](self, "windingRule"));
  objc_msgSend(a3, "setLineCapStyle:", -[CRLBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(a3, "setLineJoinStyle:", -[CRLBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[CRLBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(a3, "setLineWidth:");
  -[CRLBezierPath miterLimit](self, "miterLimit");
  objc_msgSend(a3, "setMiterLimit:");
  -[CRLBezierPath flatness](self, "flatness");
  objc_msgSend(a3, "setFlatness:");
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    objc_msgSend(a3, "setLineDash:count:phase:", sfr_dashedLinePattern, self->sfr_dashedLineCount, self->sfr_dashedLinePhase);
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v5;
  _QWORD *v6;
  CGSize size;
  CGSize v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  *((_QWORD *)v5 + 1) = self->sfr_elementCount;
  *((_QWORD *)v5 + 2) = self->sfr_elementMax;
  *((_QWORD *)v5 + 5) = *(_QWORD *)&self->sfr_totalLength;
  *((_QWORD *)v5 + 6) = self->sfr_lastSubpathIndex;
  *((_QWORD *)v5 + 8) = *(_QWORD *)&self->sfr_lineWidth;
  size = self->sfr_bounds.size;
  *(CGPoint *)(v5 + 72) = self->sfr_bounds.origin;
  *(CGSize *)(v5 + 88) = size;
  v8 = self->sfr_controlPointBounds.size;
  *(CGPoint *)(v5 + 104) = self->sfr_controlPointBounds.origin;
  *(CGSize *)(v5 + 120) = v8;
  *((_QWORD *)v5 + 17) = *(_QWORD *)&self->sfr_miterLimit;
  *((_QWORD *)v5 + 18) = *(_QWORD *)&self->sfr_flatness;
  *((_QWORD *)v5 + 23) = self->sfr_extraSegmentCount;
  *((_QWORD *)v5 + 24) = self->sfr_extraSegmentMax;
  *((_DWORD *)v5 + 50) = self->sfr_bpFlags;
  if (self->sfr_head)
  {
    if (*((_QWORD *)v5 + 3))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235D80);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF778C();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath copyWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 555, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_head");
    }
    v9 = NSZoneMalloc(a3, 24 * self->sfr_elementMax);
    v6[3] = v9;
    memcpy(v9, self->sfr_head, 24 * self->sfr_elementMax);
  }
  if (self->sfr_elementLength)
  {
    if (v6[4])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235DC0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF76CC();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath copyWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 561, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_elementLength");
    }
    v10 = NSZoneMalloc(a3, 8 * self->sfr_elementMax);
    v6[4] = v10;
    memcpy(v10, self->sfr_elementLength, 8 * self->sfr_elementMax);
  }
  if (self->sfr_extraSegments)
  {
    if (v6[7])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101235E00);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF760C();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath copyWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 567, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_extraSegments");
    }
    v11 = NSZoneMalloc(a3, 32 * self->sfr_extraSegmentMax);
    v6[7] = v11;
    memcpy(v11, self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
  }
  if (v6[22])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235E40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF754C();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath copyWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 572, 0, "expected nil value for '%{public}s'", "copiedPath->sfr_path");
  }
  v6[22] = CGPathCreateCopy(self->sfr_path);
  objc_msgSend(v6, "setLineDash:count:phase:", self->sfr_dashedLinePattern, self->sfr_dashedLineCount, self->sfr_dashedLinePhase);
  return v6;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  Swift::String v14;

  y = a3.y;
  x = a3.x;
  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235E80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF784C();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a line when there is no current point.", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CRLBezierPath lineToPoint:]");
    v13 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath lineToPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 587, 1, "Unable to add a line when there is no current point.");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v13, v14);
    abort();
  }
  -[CRLBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  Swift::String v19;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235EC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7900();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a curve when there is no current point.", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[CRLBezierPath curveToPoint:controlPoint:]");
    v18 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath curveToPoint:controlPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 593, 1, "Unable to add a curve when there is no current point.");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v18, v19);
    abort();
  }
  -[CRLBezierPath currentPoint](self, "currentPoint");
  -[CRLBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:", v7, v6, v9 * 0.333333333 + x * 0.666666667, v10 * 0.333333333 + y * 0.666666667, v7 * 0.333333333 + x * 0.666666667, v6 * 0.333333333 + y * 0.666666667, NAN);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  Swift::String v20;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235F00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF79B4();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a curve when there is no current point.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:]");
    v19 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 607, 1, "Unable to add a curve when there is no current point.");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v19, v20);
    abort();
  }
  -[CRLBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:", v10, v9, v8, v7, x, y, NAN);
}

- (void)closePath
{
  -[CRLBezierPath _deviceClosePath](self, "_deviceClosePath");
}

- (void)removeAllPoints
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  CGPath *sfr_path;

  sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF);
  self->sfr_bpFlags = sfr_bpFlags;
  self->sfr_elementCount = 0;
  self->sfr_extraSegmentCount = 0;
  self->sfr_lastSubpathIndex = -1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
    sfr_bpFlags = self->sfr_bpFlags;
  }
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 3);
}

- (void)relativeMoveToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;

  y = a3.y;
  x = a3.x;
  -[CRLBezierPath currentPoint](self, "currentPoint");
  -[CRLBezierPath moveToPoint:](self, "moveToPoint:", sub_1000603D0(x, y, v6));
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;

  y = a3.y;
  x = a3.x;
  -[CRLBezierPath currentPoint](self, "currentPoint");
  -[CRLBezierPath lineToPoint:](self, "lineToPoint:", sub_1000603D0(x, y, v6));
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[CRLBezierPath currentPoint](self, "currentPoint");
  v10 = v9;
  v11 = sub_1000603D0(v7, v6, v9);
  v13 = v12;
  v14 = sub_1000603D0(x, y, v10);
  -[CRLBezierPath curveToPoint:controlPoint:](self, "curveToPoint:controlPoint:", v11, v13, v14, v15);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  -[CRLBezierPath currentPoint](self, "currentPoint");
  v13 = v12;
  v14 = sub_1000603D0(v10, v9, v12);
  v16 = v15;
  v17 = sub_1000603D0(v8, v7, v13);
  v19 = v18;
  v20 = sub_1000603D0(x, y, v13);
  -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v14, v16, v17, v19, v20, v21);
}

- (double)lineWidth
{
  return self->sfr_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->sfr_lineWidth = a3;
}

- (unint64_t)lineCapStyle
{
  return *(_DWORD *)&self->sfr_bpFlags >> 6;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFF3F | ((a3 & 3) << 6));
}

- (unint64_t)lineJoinStyle
{
  return ((unint64_t)self->sfr_bpFlags >> 4) & 3;
}

- (void)setLineJoinStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFCF | (16 * (a3 & 0xF)));
}

- (int64_t)windingRule
{
  return ((unint64_t)self->sfr_bpFlags >> 3) & 1;
}

- (void)setWindingRule:(int64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFF7 | (8 * (a3 & 0x1F)));
}

- (double)miterLimit
{
  return self->sfr_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->sfr_miterLimit = a3;
}

- (double)flatness
{
  return self->sfr_flatness;
}

- (void)setFlatness:(double)a3
{
  self->sfr_flatness = a3;
}

- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5
{
  double **p_sfr_dashedLinePattern;
  double *sfr_dashedLinePattern;
  const double *v10;
  NSZone *v11;
  double *v12;
  uint64_t v13;

  p_sfr_dashedLinePattern = &self->sfr_dashedLinePattern;
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (a3)
  {
    v10 = a3;
    v11 = (NSZone *)-[CRLBezierPath zone](self, "zone");
    if (sfr_dashedLinePattern)
      v12 = (double *)NSZoneRealloc(v11, *p_sfr_dashedLinePattern, 8 * a4);
    else
      v12 = (double *)NSZoneMalloc(v11, 8 * a4);
    self->sfr_dashedLinePattern = v12;
    self->sfr_dashedLineCount = a4;
    self->sfr_dashedLinePhase = a5;
    if (a4 >= 1)
    {
      do
      {
        v13 = *(_QWORD *)v10++;
        *(_QWORD *)v12++ = v13;
        --a4;
      }
      while (a4);
    }
  }
  else if (sfr_dashedLinePattern)
  {
    NSZoneFree((NSZone *)-[CRLBezierPath zone](self, "zone", a5), self->sfr_dashedLinePattern);
    *p_sfr_dashedLinePattern = 0;
    p_sfr_dashedLinePattern[1] = 0;
    p_sfr_dashedLinePattern[2] = 0;
  }
}

- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5
{
  double *sfr_dashedLinePattern;
  unint64_t i;
  uint64_t v7;

  if (a4)
    *a4 = self->sfr_dashedLineCount;
  if (a5)
    *a5 = self->sfr_dashedLinePhase;
  if (a3)
  {
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      for (i = self->sfr_dashedLineCount; i; --i)
      {
        v7 = *(_QWORD *)sfr_dashedLinePattern++;
        *(_QWORD *)a3++ = v7;
      }
    }
  }
}

- (BOOL)_isValid:(double)a3
{
  double v3;

  v3 = fabs(a3);
  return v3 > INFINITY || v3 < INFINITY;
}

- (CGPoint)_checkPointForValidity:(CGPoint)a3
{
  double y;
  double x;
  unsigned int v6;
  unsigned int v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -[CRLBezierPath _isValid:](self, "_isValid:");
  v7 = -[CRLBezierPath _isValid:](self, "_isValid:", y);
  if (!-[CRLBezierPath _isValid:](self, "_isValid:", x) || !-[CRLBezierPath _isValid:](self, "_isValid:", y))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235F40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7A68();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath _checkPointForValidity:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 752, 0, "CRLBezierPath received a NaN or inf value. Please investigate");
  }
  v8 = 0.0;
  if (v7)
    v9 = y;
  else
    v9 = 0.0;
  if (v6)
    v8 = x;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_doPath
{
  CGPath *Mutable;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;

  if (!self->sfr_path && !-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
    Mutable = CGPathCreateMutable();
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      do
      {
        switch(*(_QWORD *)sfr_head & 0xFLL)
        {
          case 0:
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathMoveToPoint(Mutable, 0, v8, v9);
            break;
          case 1:
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathAddLineToPoint(Mutable, 0, v10, v11);
            break;
          case 2:
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            v13 = v12;
            v15 = v14;
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *sfr_extraSegments, sfr_extraSegments[1]);
            v17 = v16;
            v19 = v18;
            -[CRLBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", sfr_extraSegments[2], sfr_extraSegments[3]);
            CGPathAddCurveToPoint(Mutable, 0, v17, v19, v20, v21, v13, v15);
            sfr_extraSegments += 4;
            break;
          case 3:
            CGPathCloseSubpath(Mutable);
            break;
          default:
            break;
        }
        sfr_head += 6;
      }
      while (sfr_head < v6);
    }
    self->sfr_path = Mutable;
  }
}

- (void)stroke
{
  CGContext *CurrentContext;
  unint64_t v4;
  CGLineCap v5;
  unint64_t v6;
  CGLineJoin v7;
  double *sfr_dashedLinePattern;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v11;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v4 = -[CRLBezierPath lineCapStyle](self, "lineCapStyle");
  if (v4 == 2)
    v5 = kCGLineCapSquare;
  else
    v5 = v4 == 1;
  CGContextSetLineCap(CurrentContext, v5);
  v6 = -[CRLBezierPath lineJoinStyle](self, "lineJoinStyle");
  if (v6 == 2)
    v7 = kCGLineJoinBevel;
  else
    v7 = v6 == 1;
  CGContextSetLineJoin(CurrentContext, v7);
  sub_1000D79C4(CurrentContext, self->sfr_lineWidth);
  CGContextSetMiterLimit(CurrentContext, self->sfr_miterLimit);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    CGContextSetLineDash(CurrentContext, self->sfr_dashedLinePhase, sfr_dashedLinePattern, self->sfr_dashedLineCount);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v11 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v11);
  }
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)fill
{
  CGContext *CurrentContext;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if (-[CRLBezierPath windingRule](self, "windingRule"))
    CGContextEOFillPath(CurrentContext);
  else
    CGContextFillPath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)addClip
{
  CGContext *CurrentContext;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  CGContextBeginPath(CurrentContext);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if (-[CRLBezierPath windingRule](self, "windingRule"))
    CGContextEOClip(CurrentContext);
  else
    CGContextClip(CurrentContext);
  CGContextBeginPath(CurrentContext);
}

- (void)p_subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D9C8C;
  v7[3] = &unk_101235F88;
  v7[4] = self;
  +[CRLBezierPath subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:](CRLBezierPath, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:", v7, a3, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, *(_QWORD *)&a7.x, *(_QWORD *)&a7.y);
}

+ (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7 addLineBlock:(id)a8
{
  __n128 v8;
  float64x2_t v10;
  CGFloat y;
  float64x2_t v12;
  CGFloat v13;
  CGFloat v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  double v22;
  float64x2_t v23;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  uint64_t v33;
  uint64_t i;
  CGPoint v38;
  __n128 v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;

  v10 = (float64x2_t)a4;
  a4.x = a7.x;
  v8.n128_u64[0] = *(_QWORD *)&a7.y;
  y = a5.y;
  v12 = vsubq_f64((float64x2_t)a5, v10);
  v13 = a6.y;
  v38 = a4;
  v39 = v8;
  v14 = a7.y;
  v15 = vsubq_f64((float64x2_t)a6, (float64x2_t)a5);
  v16 = vsubq_f64(v15, v12);
  v17 = vsubq_f64(vsubq_f64((float64x2_t)a4, (float64x2_t)a6), v15);
  v18 = (float64x2_t)vzip2q_s64((int64x2_t)v16, (int64x2_t)v17);
  v19 = (float64x2_t)vzip1q_s64((int64x2_t)v16, (int64x2_t)v17);
  v20 = vmlaq_f64(vmulq_f64(v18, v18), v19, v19);
  if (v20.f64[0] <= v20.f64[1])
    v20.f64[0] = v20.f64[1];
  v21 = a3 * a3;
  v22 = v20.f64[0] * 9.0 * 0.0625;
  if (v22 > v21)
  {
    v23 = vsubq_f64(v17, v16);
    __asm
    {
      FMOV            V5.2D, #3.0
      FMOV            V6.2D, #6.0
    }
    v30 = vmulq_f64(v23, _Q6);
    v31 = vmlaq_f64(v23, _Q5, vaddq_f64(v12, v16));
    v32 = vmulq_f64(vaddq_f64(v16, v23), _Q6);
    v33 = 1;
    __asm
    {
      FMOV            V2.2D, #0.125
      FMOV            V3.2D, #0.25
      FMOV            V4.2D, #0.5
    }
    do
    {
      v30 = vmulq_f64(v30, _Q2);
      v32 = vsubq_f64(vmulq_f64(v32, _Q3), v30);
      v31 = vsubq_f64(vmulq_f64(v31, _Q4), vmulq_f64(v32, _Q4));
      v33 *= 2;
      v22 = v22 * 0.0625;
    }
    while (v22 > v21 && v33 <= 0x10000);
    if (v33 >= 2)
    {
      for (i = 1; i != v33; ++i)
      {
        v42 = v30;
        v43 = vaddq_f64(v10, v31);
        v40 = vaddq_f64(v30, v32);
        v41 = vaddq_f64(v31, v32);
        (*((void (**)(id, SEL, float64_t, float64_t, double))a8 + 2))(a8, a2, v43.f64[0], v43.f64[1], (double)(int)i / (double)v33);
        v32 = v40;
        v31 = v41;
        v30 = v42;
        v10 = v43;
      }
    }
  }
  (*((void (**)(id, CGPoint, __n128, double))a8 + 2))(a8, v38, v39, 1.0);
}

- (void)flattenIntoPath:(id)a3
{
  -[CRLBezierPath flattenIntoPath:flatness:](self, "flattenIntoPath:flatness:", a3, *(double *)&qword_1013D94D8);
}

- (void)flattenIntoPath:(id)a3 flatness:(double)a4
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v8;
  double *sfr_extraSegments;

  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v8 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "p_subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:", a4, *(double *)&sfr_head[-4], *(double *)&sfr_head[-2], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(_QWORD *)&sfr_head[2], *(_QWORD *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(a3, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v8);
  }
}

- (id)bezierPathByFlatteningPath
{
  return -[CRLBezierPath bezierPathByFlatteningPathWithFlatness:](self, "bezierPathByFlatteningPathWithFlatness:", *(double *)&qword_1013D94D8);
}

- (id)bezierPathByFlatteningPathWithFlatness:(double)a3
{
  uint64_t v5;
  id v6;

  if (-[CRLBezierPath isFlat](self, "isFlat"))
  {
    v6 = -[CRLBezierPath copy](self, "copy");
  }
  else
  {
    v6 = objc_alloc_init((Class)objc_opt_class(self, v5));
    -[CRLBezierPath flattenIntoPath:flatness:](self, "flattenIntoPath:flatness:", v6, a3);
  }
  return v6;
}

- (id)_copyFlattenedPath
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_class(self, a2));
  -[CRLBezierPath flattenIntoPath:](self, "flattenIntoPath:", v3);
  return v3;
}

- (id)bezierPathByReversingPath
{
  id v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  unint64_t v6;
  double *sfr_extraSegments;
  PATHSEGMENT *v8;
  PATHSEGMENT *v9;
  uint64_t v10;
  PATHSEGMENT *v12;
  unint64_t v13;
  char v14;
  double *v15;
  int v16;

  if (self->sfr_elementCount > 1)
  {
    v3 = objc_alloc_init((Class)objc_opt_class(self, a2));
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount < 2)
      return v3;
    sfr_head = self->sfr_head;
    v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    v8 = sfr_head + 6;
    while (1)
    {
      v9 = sfr_head;
      sfr_head = v8;
      v10 = *(_QWORD *)&v9[6] & 0xFLL;
      if (!v10 || (unint64_t)&v9[12] >= v6)
      {
        v12 = v10 ? sfr_head : v9;
        objc_msgSend(v3, "moveToPoint:", *(double *)&v12[2], *(double *)&v12[4]);
        v13 = *(_QWORD *)v12;
        if ((*(_QWORD *)v12 & 0xFLL) != 0)
          break;
      }
LABEL_28:
      v8 = sfr_head + 6;
      if ((unint64_t)&sfr_head[6] >= v6)
        return v3;
    }
    v14 = 0;
    v15 = (double *)&v12[-2];
    while (1)
    {
      v16 = v13 & 0xF;
      if (v16 == 3)
        break;
      if (v16 == 2)
      {
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", *(v15 - 1), *v15, sfr_extraSegments[4 * (v13 >> 4) + 2], sfr_extraSegments[4 * (v13 >> 4) + 3], sfr_extraSegments[4 * (v13 >> 4)], sfr_extraSegments[4 * (v13 >> 4) + 1]);
        if ((v14 & 1) == 0)
        {
          v14 = 0;
          goto LABEL_27;
        }
        if ((*(_BYTE *)(v15 - 2) & 0xF) == 0)
LABEL_23:
          objc_msgSend(v3, "closePath");
LABEL_25:
        v14 = 1;
        goto LABEL_27;
      }
      if (v16 == 1)
      {
        if ((v14 & 1) != 0 && (*(_BYTE *)(v15 - 2) & 0xF) == 0)
          goto LABEL_23;
        objc_msgSend(v3, "lineToPoint:", *(v15 - 1), *v15);
      }
LABEL_27:
      v13 = *((_QWORD *)v15 - 2);
      v15 -= 3;
      if ((v13 & 0xF) == 0)
        goto LABEL_28;
    }
    objc_msgSend(v3, "lineToPoint:", *(v15 - 1), *v15);
    goto LABEL_25;
  }
  v3 = -[CRLBezierPath copy](self, "copy");
  return v3;
}

- (id)bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:(double)a3
{
  return -[CRLBezierPath p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:](self, "p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:", a3 + a3);
}

- (id)bezierPathByRemovingRedundantElements
{
  return -[CRLBezierPath p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:](self, "p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:", 0.0);
}

- (id)p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:(double)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  CGFloat x;
  CGFloat y;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  float v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v5 = +[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath");
  v6 = +[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath");
  v7 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    x = CGPointZero.x;
    y = CGPointZero.y;
    v13 = CGPointZero.x;
    v14 = y;
    v15 = CGPointZero.x;
    v16 = y;
    while (2)
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, &v36, *(_QWORD *)&v33, *(_QWORD *)&v34))
      {
        case 0:
          objc_msgSend(v6, "moveToPoint:", v36, v37);
          v10 = 0;
          x = v36;
          y = v37;
          goto LABEL_13;
        case 1:
          v35 = x;
          v17 = a3;
          v18 = v36;
          v19 = v37;
          if (sub_10005FDF0(v13, v14, v36, v37))
            goto LABEL_6;
          if ((v10 & 1) != 0
            && sub_100060084(v15, v16, v13, v14, v18, v19)
            && (v24 = sub_1000603B8(v13, v14, v15),
                v33 = v25,
                v34 = v24,
                v26 = sub_1000603B8(v18, v19, v15),
                sub_1000603C4(v34, v33, v26, v27) > 0.0))
          {
            objc_msgSend(v6, "setAssociatedPoints:atIndex:", &v36, (char *)objc_msgSend(v6, "elementCount") - 1);
            v10 = 1;
LABEL_6:
            v14 = v16;
            v13 = v15;
          }
          else
          {
            objc_msgSend(v6, "lineToPoint:", v18, v19, *(_QWORD *)&v33, *(_QWORD *)&v34);
            v10 = 1;
          }
          a3 = v17;
          v16 = v14;
          v15 = v13;
          v13 = v36;
          v14 = v37;
          x = v35;
LABEL_20:
          if (v8 == ++v9)
            break;
          continue;
        case 2:
          objc_msgSend(v6, "curveToPoint:controlPoint1:controlPoint2:", v40, v41, v36, v37, v38, v39);
          v10 = 0;
          v16 = v14;
          v15 = v13;
          v13 = v40;
          v14 = v41;
          goto LABEL_20;
        case 3:
          objc_msgSend(v6, "closePath");
          if (a3 > 0.0)
          {
            objc_msgSend(v6, "bounds");
            v21 = v20;
            v23 = v22;
            if (fmaxf(v21, v23) > a3)
              objc_msgSend(v5, "appendBezierPath:", v6);
            v6 = +[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath");
          }
          v10 = 0;
LABEL_13:
          v16 = v14;
          v15 = v13;
          v14 = y;
          v13 = x;
          goto LABEL_20;
        default:
          goto LABEL_20;
      }
      break;
    }
  }
  if ((objc_msgSend(v5, "isEmpty", *(_QWORD *)&v33, *(_QWORD *)&v34) & 1) != 0)
    return v6;
  if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v6, "bounds");
    v29 = v28;
    v31 = v30;
    if (fmaxf(v29, v31) > a3)
      objc_msgSend(v5, "appendBezierPath:", v6);
  }
  return v5;
}

- (void)convertCloseElementsToLineElements
{
  int64_t sfr_elementCount;
  char v4;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGPath *sfr_path;

  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    v4 = 0;
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    do
    {
      while ((*(_QWORD *)sfr_head & 0xFLL) == 3)
      {
        *(_QWORD *)sfr_head = *(_QWORD *)sfr_head & 0xFFFFFFFFFFFFFFF0 | 1;
        sfr_head += 6;
        v4 = 1;
        if (sfr_head >= v6)
          goto LABEL_9;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
    if ((v4 & 1) == 0)
      return;
LABEL_9:
    sfr_path = self->sfr_path;
    if (sfr_path)
    {
      CFRelease(sfr_path);
      self->sfr_path = 0;
    }
  }
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v9;
  double *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  double *v12;
  CGPath *sfr_path;
  __int128 v14;
  _BOOL4 v15;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform t1;
  CGRect sfr_controlPointBounds;
  CGRect sfr_bounds;

  if (sub_100192C0C(&a3->a))
  {
    v5 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v5;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v19.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v19.c = v6;
    *(_OWORD *)&v19.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (!CGAffineTransformEqualToTransform(&t1, &v19))
    {
      sfr_elementCount = self->sfr_elementCount;
      if (sfr_elementCount >= 1)
      {
        sfr_head = self->sfr_head;
        v9 = &sfr_head[6 * sfr_elementCount];
        do
        {
          *(float64x2_t *)&sfr_head[2] = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, *(double *)&sfr_head[4]), *(float64x2_t *)&a3->a, *(double *)&sfr_head[2]));
          sfr_head += 6;
        }
        while (sfr_head < v9);
      }
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      if (sfr_extraSegments)
      {
        sfr_extraSegmentCount = self->sfr_extraSegmentCount;
        if (sfr_extraSegmentCount >= 1)
        {
          v12 = &sfr_extraSegments[4 * sfr_extraSegmentCount];
          do
          {
            *(float64x2_t *)sfr_extraSegments = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[1]), *(float64x2_t *)&a3->a, *sfr_extraSegments));
            *((float64x2_t *)sfr_extraSegments + 1) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[3]), *(float64x2_t *)&a3->a, sfr_extraSegments[2]));
            sfr_extraSegments += 4;
          }
          while (sfr_extraSegments < v12);
        }
      }
      sfr_path = self->sfr_path;
      if (sfr_path)
      {
        self->sfr_path = CGPathCreateCopyByTransformingPath(self->sfr_path, a3);
        CFRelease(sfr_path);
      }
      v14 = *(_OWORD *)&a3->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&t1.c = v14;
      *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
      v15 = sub_100079A6C(&t1.a);
      sfr_bpFlags = self->sfr_bpFlags;
      if (v15)
      {
        if ((*(_BYTE *)&sfr_bpFlags & 1) == 0)
        {
          sfr_controlPointBounds = self->sfr_controlPointBounds;
          v17 = *(_OWORD *)&a3->c;
          *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
          *(_OWORD *)&t1.c = v17;
          *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
          self->sfr_controlPointBounds = CGRectApplyAffineTransform(sfr_controlPointBounds, &t1);
        }
        if ((*(_BYTE *)&sfr_bpFlags & 2) == 0)
        {
          sfr_bounds = self->sfr_bounds;
          v18 = *(_OWORD *)&a3->c;
          *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
          *(_OWORD *)&t1.c = v18;
          *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
          self->sfr_bounds = CGRectApplyAffineTransform(sfr_bounds, &t1);
        }
      }
      else
      {
        self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 3);
      }
    }
  }
  else
  {
    sub_100192CD8();
  }
}

- (CGPath)CGPath
{
  CGPath *result;
  CGPathRef v4;

  -[CRLBezierPath _doPath](self, "_doPath");
  result = self->sfr_path;
  if (result)
  {
    v4 = CGPathRetain(result);
    return (CGPath *)CFAutorelease(v4);
  }
  return result;
}

- (BOOL)isTriangular
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  unsigned int v7;
  BOOL result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  double v14;
  double v15;
  double v16;
  double v17;

  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v3)
  {
    v4 = v3;
    v5 = v3 - 1;
    if (-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
      v6 = v4;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[CRLBezierPath isFlat](self, "isFlat");
  result = 0;
  if (v7 && (v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v9 = 1;
    while ((id)-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v9) == (id)1)
    {
      if (v6 == ++v9)
      {
        v10 = v6 - 1;
        goto LABEL_13;
      }
    }
    v10 = v9 - 1;
LABEL_13:
    if ((id)-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v6 - 1) == (id)3)
      v11 = v10 + 1;
    else
      v11 = v10;
    v12 = v6 != v11 + 1 || v10 > 3;
    result = 0;
    if (!v12)
    {
      if (v10 != 3)
        return 1;
      v16 = 0.0;
      v17 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, &v16);
      -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 3, &v14);
      if (v16 == v14 && v17 == v15)
        return 1;
    }
  }
  return result;
}

- (BOOL)isDiamond
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  unsigned int v6;
  BOOL result;
  unint64_t v8;
  uint64_t v9;
  int64_t v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  uint64_t v16;
  double MidY;
  uint64_t v18;
  CGPoint v19;
  CGPoint v20;
  CGRect v21;
  CGRect v22;

  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  if (!v3)
  {
    -[CRLBezierPath isFlat](self, "isFlat");
    return 0;
  }
  v4 = v3;
  v5 = v3 - 1;
  if (!-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
    v4 = v5;
  v6 = -[CRLBezierPath isFlat](self, "isFlat");
  result = 0;
  if (v6 && v4 == 5)
  {
    v8 = -5;
    v9 = 4;
    while ((id)-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v8 + 6) == (id)1)
    {
      if (++v8 == -1)
        goto LABEL_13;
    }
    if (v8 < 0xFFFFFFFFFFFFFFFELL)
      return 0;
    v9 = v8 + 5;
LABEL_13:
    v10 = -[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", 4);
    if (v9 != 3 || v10 == 3)
    {
      -[CRLBezierPath bounds](self, "bounds");
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
      MidX = CGRectGetMidX(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v16 = 0;
      MidY = (double)(unint64_t)CGRectGetMidY(v22);
      v18 = v9 + 1;
      v19 = CGPointZero;
      while (1)
      {
        v20 = v19;
        -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v16, &v20, v19);
        if (vabdd_f64((double)(unint64_t)MidX, v20.x) > 0.01 && vabdd_f64(MidY, v20.y) > 0.01)
          break;
        if (v18 == ++v16)
          return 1;
      }
    }
    return 0;
  }
  return result;
}

- (BOOL)isRectangular
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  unint64_t v20;
  double *v21;
  double v22;
  uint64_t v23;
  _BOOL4 v24;
  float64x2_t v25;
  float64x2_t v27[6];
  CGRect v28;
  CGRect v29;

  LODWORD(v3) = -[CRLBezierPath isFlat](self, "isFlat");
  if ((_DWORD)v3)
  {
    v3 = -[CRLBezierPath elementCount](self, "elementCount");
    if (v3)
    {
      v4 = v3;
      v5 = v3 - 1;
      if (-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
        v6 = v4;
      else
        v6 = v5;
      if (v6 < 5)
        goto LABEL_7;
      if (v6 <= 6)
      {
        v9 = 1;
        while ((id)-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v9) == (id)1)
        {
          if (v6 == ++v9)
          {
            v10 = v6 - 1;
            goto LABEL_17;
          }
        }
        v10 = v9 - 1;
LABEL_17:
        v11 = -[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v6 - 1);
        LOBYTE(v3) = 0;
        if (v11 == 3)
          v12 = v10 + 2;
        else
          v12 = v10 + 1;
        if (v11 == 3)
          v13 = v10 + 1;
        else
          v13 = v10;
        if (v6 == v12 && v13 >= 4)
        {
          -[CRLBezierPath bounds](self, "bounds");
          x = v28.origin.x;
          y = v28.origin.y;
          width = v28.size.width;
          height = v28.size.height;
          MaxX = CGRectGetMaxX(v28);
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          MaxY = CGRectGetMaxY(v29);
          v20 = 0;
          v21 = (double *)v27;
          while (1)
          {
            -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v20, v21);
            if (vabdd_f64(x, *v21) >= 0.01 && vabdd_f64(MaxX, *v21) >= 0.01)
              goto LABEL_7;
            v22 = v21[1];
            if (vabdd_f64(y, v22) >= 0.01 && vabdd_f64(MaxY, v22) >= 0.01)
              goto LABEL_7;
            ++v20;
            v21 += 2;
            if (v20 > v10)
            {
              v23 = 0;
              v24 = 0;
              while (1)
              {
                v25 = vabdq_f64(v27[(v23 + 1) % (v10 + 1)], v27[v23]);
                if (v25.f64[0] > 0.01 != v25.f64[1] <= 0.01 || v23 && ((v24 ^ (v25.f64[0] > 0.01)) & 1) == 0)
                  break;
                ++v23;
                v24 = v25.f64[0] > 0.01;
                if (v23 == 4)
                {
                  LOBYTE(v3) = 1;
                  return v3;
                }
              }
              goto LABEL_7;
            }
          }
        }
      }
      else
      {
        v7 = -[CRLBezierPath bezierPathByRemovingRedundantElements](self, "bezierPathByRemovingRedundantElements");
        v8 = objc_msgSend(v7, "elementCount");
        if ((uint64_t)v8 >= -[CRLBezierPath elementCount](self, "elementCount"))
        {
LABEL_7:
          LOBYTE(v3) = 0;
          return v3;
        }
        LOBYTE(v3) = objc_msgSend(v7, "isRectangular");
      }
    }
  }
  return v3;
}

- (BOOL)isCircular
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  double v16;
  double v17;
  int64_t v18;
  float64x2_t *v19;
  double v20;
  double v21;
  double v22;
  float64x2_t v24;
  _BYTE v25[32];
  double v26[3];

  -[CRLBezierPath bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v11 >= 1)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = v4 + v8 * 0.5;
    v17 = v6 + v10 * 0.5;
    while (1)
    {
      v18 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, v25, *(_OWORD *)&v24);
      if (v18 == 2)
      {
        if (fabs(sub_100061070((v26[0] - v16) / v8, (v26[1] - v17) / v10) + -0.5) > 0.0001)
          return v14;
        v20 = sub_1000602A8(&v24, 0.5);
        v22 = sub_100061070((v20 - v16) / v8, (v21 - v17) / v10);
        v19 = (float64x2_t *)v26;
        if (fabs(v22 + -0.5) > 0.0001)
          return v14;
      }
      else
      {
        if (v18 == 3)
        {
          if (v15 > 0)
            return v14;
          v15 = 1;
          goto LABEL_12;
        }
        v19 = (float64x2_t *)v25;
        if (v18 == 1)
          return v14;
      }
      v24 = *v19;
LABEL_12:
      v14 = v12 <= ++v13;
      if (v12 == v13)
        return v14;
    }
  }
  return 1;
}

- (BOOL)isEmpty
{
  return self->sfr_elementCount == 0;
}

- (CGPoint)currentPoint
{
  PATHSEGMENT *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  Swift::String v14;
  CGPoint result;

  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235FA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7B1C();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can not get the current point of an empty path.", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CRLBezierPath currentPoint]");
    v13 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath currentPoint]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1520, 1, "Can not get the current point of an empty path.");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v13, v14);
    abort();
  }
  v3 = &self->sfr_head[6 * self->sfr_elementCount];
  v4 = *(double *)&v3[-4];
  v5 = *(double *)&v3[-2];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)controlPointBounds
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  CGPoint v4;
  double y;
  float64x2_t size;
  PATHSEGMENT *sfr_head;
  int64_t sfr_elementCount;
  float64x2_t v9;
  unint64_t v10;
  PATHSEGMENT *v11;
  uint64_t v12;
  float64x2_t v14;
  float64x2_t *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  float64x2_t *v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  Swift::String v31;
  CGRect result;

  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235FE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7BD0();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can not determine control point bounds for an empty path.", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLBezierPath controlPointBounds]");
    v30 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath controlPointBounds]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1529, 1, "Can not determine control point bounds for an empty path.");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v30, v31);
    abort();
  }
  sfr_bpFlags = self->sfr_bpFlags;
  if ((*(_BYTE *)&sfr_bpFlags & 1) != 0)
  {
    sfr_head = self->sfr_head;
    sfr_elementCount = self->sfr_elementCount;
    v9 = *(float64x2_t *)&sfr_head[2];
    if (sfr_elementCount < 2)
    {
      v4 = *(CGPoint *)&sfr_head[2];
    }
    else
    {
      v10 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      v11 = sfr_head + 6;
      v4 = (CGPoint)v9;
      do
      {
        v12 = *(_QWORD *)v11 & 0xFLL;
        if (v12 != 3 && (v12 || (unint64_t)&v11[6] < v10))
        {
          v14 = *(float64x2_t *)&v11[2];
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v14, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v14);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, v9), (int8x16_t)v14, (int8x16_t)v9);
        }
        v11 += 6;
      }
      while ((unint64_t)v11 < v10);
    }
    sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
    if (sfr_extraSegments)
    {
      sfr_extraSegmentCount = self->sfr_extraSegmentCount;
      if (sfr_extraSegmentCount >= 1)
      {
        v17 = &sfr_extraSegments[2 * sfr_extraSegmentCount];
        do
        {
          v18 = *sfr_extraSegments;
          v19 = sfr_extraSegments[1];
          sfr_extraSegments += 2;
          v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v18);
          v21 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v9), (int8x16_t)v18, (int8x16_t)v9);
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v19, v20), (int8x16_t)v20, (int8x16_t)v19);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v19, v21), (int8x16_t)v19, (int8x16_t)v21);
        }
        while (sfr_extraSegments < v17);
      }
    }
    self->sfr_controlPointBounds.origin = v4;
    size = vsubq_f64(v9, (float64x2_t)v4);
    self->sfr_controlPointBounds.size = (CGSize)size;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFFFE);
    y = v4.y;
  }
  else
  {
    v4.x = self->sfr_controlPointBounds.origin.x;
    y = self->sfr_controlPointBounds.origin.y;
    size = (float64x2_t)self->sfr_controlPointBounds.size;
  }
  v22 = size.f64[1];
  result.size.width = size.f64[0];
  result.origin.x = v4.x;
  result.size.height = v22;
  result.origin.y = y;
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGPath *sfr_path;
  CGSize size;
  CGRect result;

  if (-[CRLBezierPath isFlat](self, "isFlat"))
  {
    -[CRLBezierPath controlPointBounds](self, "controlPointBounds");
  }
  else
  {
    if ((*(_BYTE *)&self->sfr_bpFlags & 2) != 0)
    {
      -[CRLBezierPath _doPath](self, "_doPath");
      sfr_path = self->sfr_path;
      if (sfr_path)
      {
        self->sfr_bounds = CGPathGetPathBoundingBox(sfr_path);
      }
      else
      {
        size = CGRectZero.size;
        self->sfr_bounds.origin = CGRectZero.origin;
        self->sfr_bounds.size = size;
      }
      *(_DWORD *)&self->sfr_bpFlags &= ~2u;
    }
    x = self->sfr_bounds.origin.x;
    y = self->sfr_bounds.origin.y;
    width = self->sfr_bounds.size.width;
    height = self->sfr_bounds.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isFlat
{
  return (*(_BYTE *)&self->sfr_bpFlags >> 2) & 1;
}

- (BOOL)isClockwise
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  double x;
  double y;
  float v10;
  double v11;
  double v12;
  unsigned int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  const char *v18;
  __int128 v20;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  double v29;
  double v30;

  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v3 < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v5 = v3;
    v6 = 0;
    v7 = 0;
    x = CGPointZero.x;
    y = CGPointZero.y;
    v10 = 0.0;
    *(_QWORD *)&v4 = 67109378;
    v20 = v4;
    v11 = y;
    v12 = CGPointZero.x;
    do
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v6, &v29, v20))
      {
        case 0:
          v12 = v29;
          v11 = v30;
          x = v29;
          y = v30;
          break;
        case 1:
          if (x != v29 || y != v30)
            v10 = x * v30 - y * v29 + v10;
          v7 = 1;
          x = v29;
          y = v30;
          break;
        case 2:
          v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101236028);
          v15 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v22 = v14;
            v23 = 2082;
            v24 = "-[CRLBezierPath isClockwise]";
            v25 = 2082;
            v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
            v27 = 1024;
            v28 = 1622;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Path should be flat. Illegal CRLCurveToBezierPathElement.", buf, 0x22u);
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101236048);
          }
          v16 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v18 = +[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString");
            *(_DWORD *)buf = v20;
            v22 = v14;
            v23 = 2114;
            v24 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath isClockwise]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1622, 0, "Path should be flat. Illegal CRLCurveToBezierPathElement.");
          break;
        case 3:
          v17 = x == v12 && y == v11;
          v7 = 0;
          if (!v17)
            v10 = x * v11 - y * v12 + v10;
          break;
        default:
          break;
      }
      ++v6;
    }
    while (v5 != v6);
    if ((v7 & 1) != 0)
      v10 = x * v11 - y * v12 + v10;
  }
  return v10 >= 0.0;
}

- (BOOL)containsClosePathElement
{
  int64_t sfr_elementCount;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;

  sfr_elementCount = self->sfr_elementCount;
  v3 = sfr_elementCount + 1;
  v4 = 24 * sfr_elementCount - 24;
  do
  {
    if (--v3 < 1)
      break;
    v5 = *(_QWORD *)((char *)self->sfr_head + v4);
    v4 -= 24;
  }
  while ((v5 & 0xF) != 3);
  return v3 > 0;
}

- (double)calculateLengthOfElement:(int64_t)a3
{
  int64_t v3;
  double result;
  unsigned int v7;
  NSObject *v8;
  int64_t sfr_elementCount;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  Swift::String v18;
  int64_t v19;
  float v20;
  _BYTE buf[64];

  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236068);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v7;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "-[CRLBezierPath calculateLengthOfElement:]";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 1722;
      *(_WORD *)&buf[34] = 2048;
      *(_QWORD *)&buf[36] = a3;
      *(_WORD *)&buf[44] = 2048;
      *(_QWORD *)&buf[46] = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236088);
    }
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    v19 = self->sfr_elementCount;
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[CRLBezierPath calculateLengthOfElement:]");
    v17 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath calculateLengthOfElement:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1722, 1, "Given index (%zd) must be within bounds [0, %zd).", a3, self->sfr_elementCount, 1722, a3, v19);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v17, v18);
    abort();
  }
  if (!a3)
    return 0.0;
  *(_OWORD *)buf = xmmword_100EEC438;
  *(_OWORD *)&buf[16] = xmmword_100EEC438;
  *(_OWORD *)&buf[32] = xmmword_100EEC438;
  *(_OWORD *)&buf[48] = xmmword_100EEC438;
  v3 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a3, buf);
  if (v3 == 3)
    return sub_10006108C(*(double *)buf, *(double *)&buf[8], *(double *)&buf[16], *(double *)&buf[24]);
  if (v3 == 2)
  {
    v20 = 0.0;
    sub_1000DF4D0((uint64_t)buf, &v20);
    return v20;
  }
  else
  {
    result = 0.0;
    if (v3 == 1)
      return sub_10006108C(*(double *)buf, *(double *)&buf[8], *(double *)&buf[16], *(double *)&buf[24]);
  }
  return result;
}

- (void)calculateLengths
{
  uint64_t v3;
  uint64_t i;
  double v5;

  self->sfr_totalLength = 0.0;
  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  self->sfr_elementLength = (double *)NSZoneRealloc((NSZone *)-[CRLBezierPath zone](self, "zone"), self->sfr_elementLength, 8 * self->sfr_elementMax);
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      -[CRLBezierPath calculateLengthOfElement:](self, "calculateLengthOfElement:", i);
      self->sfr_elementLength[i] = v5;
      self->sfr_totalLength = v5 + self->sfr_totalLength;
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[CRLBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  unsigned int v6;
  NSObject *v7;
  int64_t sfr_elementCount;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  Swift::String v17;
  int64_t v18;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;

  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012360A8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      v20 = v6;
      v21 = 2082;
      v22 = "-[CRLBezierPath lengthOfElement:]";
      v23 = 2082;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      v25 = 1024;
      v26 = 1775;
      v27 = 2048;
      v28 = a3;
      v29 = 2048;
      v30 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012360C8);
    }
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    v18 = self->sfr_elementCount;
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[CRLBezierPath lengthOfElement:]");
    v16 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath lengthOfElement:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1775, 1, "Given index (%zd) must be within bounds [0, %zd).", a3, self->sfr_elementCount, 1775, a3, v18);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v16, v17);
    abort();
  }
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[CRLBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  int64_t v3;
  double *sfr_elementLength;
  double result;
  double v7;
  unsigned int v8;
  NSObject *v9;
  int64_t sfr_elementCount;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  Swift::String v19;
  uint8_t buf[4];
  unsigned int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  int64_t v31;

  v3 = a3;
  if (a3 < 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012360E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7C84();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must not be negative.", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[CRLBezierPath lengthToElement:]");
    v18 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath lengthToElement:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1785, 1, "Given index (%zd) must not be negative.", v3, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m", 1785, v3);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v18, v19);
    abort();
  }
  if (self->sfr_elementCount <= a3)
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236128);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      v21 = v8;
      v22 = 2082;
      v23 = "-[CRLBezierPath lengthToElement:]";
      v24 = 2082;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      v26 = 1024;
      v27 = 1788;
      v28 = 2048;
      v29 = v3;
      v30 = 2048;
      v31 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must not be greater than or equal to max element (%zd)", buf, 0x36u);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236148);
    }
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath lengthToElement:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1788, 0, "Given index (%zd) must not be greater than or equal to max element (%zd)", v3, self->sfr_elementCount);
    -[CRLBezierPath length](self, "length");
  }
  else
  {
    if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
      -[CRLBezierPath calculateLengths](self, "calculateLengths");
    if (v3)
    {
      sfr_elementLength = self->sfr_elementLength;
      result = 0.0;
      do
      {
        v7 = *sfr_elementLength++;
        result = result + v7;
        --v3;
      }
      while (v3);
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (int64_t)elementCount
{
  return self->sfr_elementCount;
}

- (int64_t)elementAtIndex:(int64_t)a3
{
  return -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", a3, 0);
}

- (int64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v5;
  int64_t v6;
  char *sfr_extraSegments;
  CGPoint *v8;
  unsigned int v12;
  NSObject *v13;
  int64_t sfr_elementCount;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unsigned int v27;
  NSObject *v28;
  int64_t sfr_extraSegmentCount;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  int64_t v48;
  uint8_t buf[4];
  unsigned int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  int64_t v60;

  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236168);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      v50 = v12;
      v51 = 2082;
      v52 = "-[CRLBezierPath elementAtIndex:associatedPoints:]";
      v53 = 2082;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      v55 = 1024;
      v56 = 1816;
      v57 = 2048;
      v58 = a3;
      v59 = 2048;
      v60 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236188);
    }
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    v47 = self->sfr_elementCount;
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[CRLBezierPath elementAtIndex:associatedPoints:]");
    v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:associatedPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1816, 1, "Given index (%zd) must be within bounds [0, %zd).", a3, self->sfr_elementCount, 1816, a3, v47);
    goto LABEL_18;
  }
  sfr_head = self->sfr_head;
  v5 = &sfr_head[6 * a3];
  if (a4)
  {
    if ((*(_QWORD *)v5 & 0xFLL) != 2)
    {
LABEL_8:
      *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
      return *(_QWORD *)v5 & 0xFLL;
    }
    v6 = *(_QWORD *)v5 >> 4;
    if (v6 >= self->sfr_extraSegmentCount)
    {
      v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012361A8);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        sfr_extraSegmentCount = self->sfr_extraSegmentCount;
        *(_DWORD *)buf = 67110402;
        v50 = v27;
        v51 = 2082;
        v52 = "-[CRLBezierPath elementAtIndex:associatedPoints:]";
        v53 = 2082;
        v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
        v55 = 1024;
        v56 = 1822;
        v57 = 2048;
        v58 = a3;
        v59 = 2048;
        v60 = sfr_extraSegmentCount;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Extra index (%zd) must be within extra segment bounds [0, %zd).", buf, 0x36u);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012361C8);
      }
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      v48 = self->sfr_extraSegmentCount;
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Extra index (%zd) must be within extra segment bounds [0, %zd).", v30, v31, v32, v33, v34, v35, v36, (uint64_t)"-[CRLBezierPath elementAtIndex:associatedPoints:]");
      v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:associatedPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1822, 1, "Extra index (%zd) must be within extra segment bounds [0, %zd).", a3, self->sfr_extraSegmentCount, 1822, a3, v48);
    }
    else
    {
      sfr_extraSegments = (char *)self->sfr_extraSegments;
      if (sfr_extraSegments)
      {
        v8 = (CGPoint *)&sfr_extraSegments[32 * v6];
        *a4 = *v8;
        a4[1] = v8[1];
        a4 += 2;
        goto LABEL_8;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012361E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF7D58();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Missing extra segments.", v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[CRLBezierPath elementAtIndex:associatedPoints:]");
      v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:associatedPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1824, 1, "Missing extra segments.", v44, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m", 1824, v45, v46);
    }
LABEL_18:
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v22, *(Swift::String *)&v23);
    abort();
  }
  return *(_QWORD *)v5 & 0xFLL;
}

- (void)iteratePathElementsWithBlock:(id)a3
{
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  CGFloat y;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  void (*v15)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128);
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v5 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    y = CGPointZero.y;
    do
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v7, &v18))
      {
        case 0:
          v15 = (void (*)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))*((_QWORD *)a3 + 2);
          v9.n128_u64[0] = v18;
          v10.n128_u64[0] = v19;
          v16 = a3;
          v17 = 0;
          goto LABEL_8;
        case 1:
          v15 = (void (*)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))*((_QWORD *)a3 + 2);
          v9.n128_u64[0] = v18;
          v10.n128_u64[0] = v19;
          v16 = a3;
          v17 = 1;
          goto LABEL_8;
        case 2:
          v9.n128_u64[0] = v22;
          v10.n128_u64[0] = v23;
          v11.n128_u64[0] = v18;
          v12.n128_u64[0] = v19;
          v13.n128_u64[0] = v20;
          v14.n128_u64[0] = v21;
          (*((void (**)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))a3 + 2))(a3, 2, v9, v10, v11, v12, v13, v14);
          break;
        case 3:
          v15 = (void (*)(id, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))*((_QWORD *)a3 + 2);
          v16 = a3;
          v17 = 3;
          v9.n128_u64[0] = *(_QWORD *)&CGPointZero.x;
          v10.n128_f64[0] = y;
LABEL_8:
          v11.n128_u64[0] = *(_QWORD *)&CGPointZero.x;
          v12.n128_f64[0] = y;
          v13.n128_u64[0] = *(_QWORD *)&CGPointZero.x;
          v14.n128_f64[0] = y;
          v15(v16, v17, v9, v10, v11, v12, v13, v14);
          break;
        default:
          break;
      }
      ++v7;
    }
    while (v6 != v7);
  }
}

- (int64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
{
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v5;
  unint64_t v6;
  CGPoint *v7;
  unsigned int v11;
  NSObject *v12;
  int64_t sfr_elementCount;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  Swift::String v22;
  int64_t v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int64_t v35;

  if (a3 < 0 || self->sfr_elementCount <= a3)
  {
    v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236228);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      v25 = v11;
      v26 = 2082;
      v27 = "-[CRLBezierPath elementAtIndex:allPoints:]";
      v28 = 2082;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      v30 = 1024;
      v31 = 1869;
      v32 = 2048;
      v33 = a3;
      v34 = 2048;
      v35 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236248);
    }
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    v23 = self->sfr_elementCount;
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v14, v15, v16, v17, v18, v19, v20, (uint64_t)"-[CRLBezierPath elementAtIndex:allPoints:]");
    v21 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath elementAtIndex:allPoints:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1869, 1, "Given index (%zd) must be within bounds [0, %zd).", a3, self->sfr_elementCount, 1869, a3, v23);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v21, v22);
    abort();
  }
  sfr_head = self->sfr_head;
  v5 = &sfr_head[6 * a3];
  if (a4)
  {
    v6 = *(_QWORD *)v5;
    if ((*(_QWORD *)v5 & 0xFLL) != 0)
    {
      *a4 = *(CGPoint *)&sfr_head[6 * a3 - 4];
      v6 = *(_QWORD *)v5;
    }
    if ((v6 & 0xF) != 0)
    {
      if ((v6 & 0xF) == 2)
      {
        v7 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (v6 >> 4));
        a4[1] = *v7;
        a4[2] = v7[1];
        a4 += 3;
      }
      else
      {
        ++a4;
      }
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(_QWORD *)v5 & 0xFLL;
}

- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4
{
  PATHSEGMENT *sfr_head;
  CGPoint *v6;
  CGPoint v7;
  CGPath *sfr_path;
  unsigned int v10;
  NSObject *v11;
  int64_t sfr_elementCount;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  Swift::String v21;
  int64_t v22;
  uint8_t buf[4];
  unsigned int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;

  if (a4 < 0 || self->sfr_elementCount <= a4)
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236268);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      sfr_elementCount = self->sfr_elementCount;
      *(_DWORD *)buf = 67110402;
      v24 = v10;
      v25 = 2082;
      v26 = "-[CRLBezierPath setAssociatedPoints:atIndex:]";
      v27 = 2082;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m";
      v29 = 1024;
      v30 = 1895;
      v31 = 2048;
      v32 = a4;
      v33 = 2048;
      v34 = sfr_elementCount;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", buf, 0x36u);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236288);
    }
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    v22 = self->sfr_elementCount;
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Given index (%zd) must be within bounds [0, %zd).", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[CRLBezierPath setAssociatedPoints:atIndex:]");
    v20 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath setAssociatedPoints:atIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 1895, 1, "Given index (%zd) must be within bounds [0, %zd).", a4, self->sfr_elementCount, 1895, a4, v22);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v20, v21);
    abort();
  }
  sfr_head = self->sfr_head;
  if ((*(_QWORD *)&sfr_head[6 * a4] & 0xFLL) == 2)
  {
    v6 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(_QWORD *)&sfr_head[6 * a4] >> 4));
    *v6 = *a3;
    v7 = a3[1];
    a3 += 2;
    v6[1] = v7;
  }
  *(CGPoint *)&sfr_head[6 * a4 + 2] = *a3;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 3u;
}

- (void)_appendToPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  PATHSEGMENT *sfr_head;
  int64_t sfr_elementCount;
  double *sfr_extraSegments;
  BOOL v8;
  PATHSEGMENT *v9;

  sfr_head = self->sfr_head;
  sfr_elementCount = self->sfr_elementCount;
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  v8 = a4 && (uint64_t)objc_msgSend(a3, "elementCount") > 0;
  if (sfr_elementCount >= 1)
  {
    v9 = &sfr_head[6 * sfr_elementCount];
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          if (!v8)
            objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          v8 = 0;
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "curveToPoint:controlPoint1:controlPoint2:", *(double *)&sfr_head[2], *(double *)&sfr_head[4], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(a3, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v9);
  }
}

- (void)appendBezierPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a4;
  v7 = objc_opt_class(a3, a2);
  if (v7 == objc_opt_class(CRLBezierPath, v8))
  {
    _objc_msgSend(a3, "_appendToPath:skippingInitialMoveIfPossible:", self, v4);
  }
  else
  {
    v9 = v4 && -[CRLBezierPath elementCount](self, "elementCount") > 0;
    v10 = (uint64_t)objc_msgSend(a3, "elementCount");
    if (v10 >= 1)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        switch((unint64_t)objc_msgSend(a3, "elementAtIndex:associatedPoints:", i, &v13))
        {
          case 0uLL:
            if (!v9)
              -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v13, v14);
            v9 = 0;
            break;
          case 1uLL:
            -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v13, v14);
            break;
          case 2uLL:
            -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v17, v18, v13, v14, v15, v16);
            break;
          case 3uLL:
            -[CRLBezierPath closePath](self, "closePath");
            break;
          default:
            continue;
        }
      }
    }
  }
}

- (void)appendBezierPath:(id)a3
{
  -[CRLBezierPath appendBezierPath:skippingInitialMoveIfPossible:](self, "appendBezierPath:skippingInitialMoveIfPossible:", a3, 0);
}

- (void)appendPointsInRange:(_NSRange)a3 fromBezierPath:(id)a4
{
  uint64_t v4;

  v4 = 0;
  -[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:](self, "p_appendPointsInRange:fromBezierPath:countingSubpaths:", a3.location, a3.length, a4, &v4);
}

- (void)p_appendPointsInRange:(_NSRange)a3 fromBezierPath:(id)a4 countingSubpaths:(unint64_t *)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  int v11;
  NSUInteger v12;
  int v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  Swift::String v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  length = a3.length;
  location = a3.location;
  v10 = a3.location + a3.length;
  if (a3.location + a3.length > (unint64_t)objc_msgSend(a4, "elementCount"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012362A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7EC0();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2004, 0, "Point append range is out of range of available points.");
  }
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) != 0)
    v11 = (*((unsigned __int8 *)a4 + 201) >> 2) & 1;
  else
    v11 = 0;
  if (location < v10)
  {
    v12 = location;
    do
    {
      v24 = xmmword_100EEC438;
      v25 = xmmword_100EEC438;
      v26 = xmmword_100EEC438;
      switch((unint64_t)objc_msgSend(a4, "elementAtIndex:associatedPoints:", v12, &v24))
      {
        case 0uLL:
          ++*a5;
          -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v24);
          break;
        case 1uLL:
          -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v24);
          break;
        case 2uLL:
          if (-[CRLBezierPath isEmpty](self, "isEmpty"))
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012362E8);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF7E0C();
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF735C();
            sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to add a curve when there is no current point.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:]");
            v22 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2019, 1, "Unable to add a curve when there is no current point.");
            SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v22, v23);
            abort();
          }
          if (v12 > location)
            v13 = v11;
          else
            v13 = 0;
          if (v13 == 1)
            v14 = *(double *)(*((_QWORD *)a4 + 4) + 8 * v12);
          else
            v14 = NAN;
          -[CRLBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:", v26, v24, v25, v14);
          break;
        case 3uLL:
          -[CRLBezierPath closePath](self, "closePath");
          break;
        default:
          break;
      }
      ++v12;
      --length;
    }
    while (length);
  }
}

- (id)copyWithPointsInRange:(_NSRange)a3
{
  uint64_t v4;

  v4 = 0;
  return -[CRLBezierPath copyWithPointsInRange:countingSubpaths:](self, "copyWithPointsInRange:countingSubpaths:", a3.location, a3.length, &v4);
}

- (id)copyWithPointsInRange:(_NSRange)a3 countingSubpaths:(unint64_t *)a4
{
  NSUInteger length;
  NSUInteger location;
  CRLBezierPath *v8;
  CRLBezierPath *v9;
  unint64_t v10;
  _OWORD v12[4];

  length = a3.length;
  location = a3.location;
  v8 = objc_alloc_init(CRLBezierPath);
  v9 = v8;
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) != 0)
    -[CRLBezierPath calculateLengths](v8, "calculateLengths");
  if (length)
  {
    v12[0] = xmmword_100EEC438;
    v12[1] = xmmword_100EEC438;
    v12[2] = xmmword_100EEC438;
    v12[3] = xmmword_100EEC438;
    v10 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", location, v12);
    if (v10)
    {
      ++*a4;
      if (v10 <= 3)
        -[CRLBezierPath moveToPoint:](v9, "moveToPoint:", v12[0]);
    }
    -[CRLBezierPath p_appendPointsInRange:fromBezierPath:countingSubpaths:](v9, "p_appendPointsInRange:fromBezierPath:countingSubpaths:", location, length, self, a4);
  }
  return v9;
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxX;
  double v9;
  double MinX;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLBezierPath moveToPoint:](self, "moveToPoint:");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MaxX = CGRectGetMaxX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[CRLBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v12));
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = CGRectGetMaxX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v14));
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  -[CRLBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v16));
  -[CRLBezierPath closePath](self, "closePath");
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4;
  double *p_y;

  v4 = a4 - 1;
  if (a4 >= 1)
  {
    if (-[CRLBezierPath isEmpty](self, "isEmpty") || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100)
      -[CRLBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    else
      -[CRLBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    if ((unint64_t)a4 >= 2)
    {
      p_y = &a3[1].y;
      do
      {
        -[CRLBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
        p_y += 2;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLBezierPath *v8;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v16.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v8 = objc_alloc_init(CRLBezierPath);
  -[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", CGPointZero.x, CGPointZero.y, 1.0, -45.0, 315.0);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tx = *(_OWORD *)&v16.tx;
  CGAffineTransformTranslate(&v16, &v15, MidX, MidY);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = CGRectGetWidth(v19) * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetHeight(v20);
  v14 = v16;
  CGAffineTransformScale(&v15, &v14, v11, v12 * 0.5);
  v16 = v15;
  -[CRLBezierPath transformUsingAffineTransform:](v8, "transformUsingAffineTransform:", &v15);
  -[CRLBezierPath appendBezierPath:](self, "appendBezierPath:", v8);

}

- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6
{
  double y;
  double x;
  __double2 v12;
  double v13;
  __double2 v14;
  __double2 v15;

  y = a3.y;
  x = a3.x;
  v12 = __sincos_stret((a6 - a5) * 0.5);
  v13 = (1.0 - v12.__cosval) * 4.0 / (v12.__sinval * 3.0);
  v14 = __sincos_stret(a5);
  v15 = __sincos_stret(a6);
  -[CRLBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:", x + a4 * v15.__cosval, y + a4 * v15.__sinval, x + a4 * v14.__cosval - v13 * a4 * v14.__sinval, y + a4 * v14.__sinval + v13 * a4 * v14.__cosval, x + a4 * v15.__cosval + v13 * a4 * v15.__sinval, y + a4 * v15.__sinval - v13 * a4 * v15.__cosval, NAN);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  double y;
  double x;
  double v14;
  double v15;
  __double2 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  y = a3.y;
  x = a3.x;
  if (__fpclassifyd(a5) <= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236328);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF8030();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d angle1 should not be infinte or NaN (%f)", v22, v23, v24, v25, v26, v27, v28, (uint64_t)"-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]");
    v29 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2175, 1, "angle1 should not be infinte or NaN (%f)", *(_QWORD *)&a5, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m", 2175, *(_QWORD *)&a5);
LABEL_35:
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v29, *(Swift::String *)&v30);
    abort();
  }
  if (__fpclassifyd(a6) <= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236368);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF7F74();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d angle2 should not be infinte or NaN (%f)", v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]");
    v29 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2176, 1, "angle2 should not be infinte or NaN (%f)", *(_QWORD *)&a6, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m", 2176, *(_QWORD *)&a6);
    goto LABEL_35;
  }
  v14 = a5 * 3.14159265 / 180.0;
  v15 = a6 * 3.14159265;
  v16 = __sincos_stret(v14);
  v17 = x + a4 * v16.__cosval;
  v18 = y + a4 * v16.__sinval;
  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
    -[CRLBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v17, v18);
  else
    -[CRLBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v17, v18);
  v19 = v15 / 180.0;
  if (a7)
  {
    for (; v14 < v19; v14 = v14 + 6.28318531)
      ;
    v20 = v14 - v19;
    if (v14 - v19 > 1.57079633)
    {
      do
      {
        v21 = v14 + -1.57079633;
        -[CRLBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v14, v14 + -1.57079633);
        v20 = v21 - v19;
        v14 = v14 + -1.57079633;
      }
      while (v21 - v19 > 1.57079633);
      goto LABEL_18;
    }
  }
  else
  {
    for (; v19 < v14; v19 = v19 + 6.28318531)
      ;
    v20 = v19 - v14;
    if (v19 - v14 > 1.57079633)
    {
      do
      {
        v21 = v14 + 1.57079633;
        -[CRLBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v14, v14 + 1.57079633);
        v20 = v19 - v21;
        v14 = v14 + 1.57079633;
      }
      while (v19 - v21 > 1.57079633);
      goto LABEL_18;
    }
  }
  v21 = v14;
LABEL_18:
  if (v20 > 0.0)
    -[CRLBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v21, v19);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6
{
  -[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, a3.x, a3.y, a4, a5, a6);
}

- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat ty;
  CGFloat tx;
  CGFloat d;
  CGFloat c;
  CGFloat b;
  CGAffineTransform v38;
  CGAffineTransform v39;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  b = CGAffineTransformIdentity.b;
  d = CGAffineTransformIdentity.d;
  c = CGAffineTransformIdentity.c;
  ty = CGAffineTransformIdentity.ty;
  tx = CGAffineTransformIdentity.tx;
  -[CRLBezierPath currentPoint](self, "currentPoint");
  v13 = v11;
  v14 = v12;
  if (v11 == v9 && v12 == v8)
  {
    v17 = v9 - v11;
    v16 = v8 - v12;
    v18 = 0.0;
    v30 = 0.0;
  }
  else
  {
    v30 = a5;
    v16 = v8 - v12;
    v17 = v9 - v11;
    v18 = atan2(v8 - v12, v17);
  }
  v38.a = CGAffineTransformIdentity.a;
  v38.b = b;
  v38.c = c;
  v38.d = d;
  v38.tx = tx;
  v38.ty = ty;
  CGAffineTransformRotate(&v39, &v38, -v18);
  v19 = v39.tx + v16 * v39.c + v39.a * v17;
  v20 = v39.ty + v16 * v39.d + v39.b * v17;
  v32 = v14;
  v21 = v39.tx + (y - v14) * v39.c + v39.a * (x - v13);
  v22 = v39.ty + (y - v14) * v39.d + v39.b * (x - v13);
  v23 = v19 == v21 && v20 == v22;
  v24 = 0.0;
  if (!v23)
    v24 = 3.14159265 - fabs(atan2(v22 - v20, v21 - v19));
  v25 = sin(v24 * 0.5);
  v31 = v13;
  if (v25 == 0.0)
  {
    v26 = 0.0;
    v27 = v20;
    v28 = 0.0;
    v29 = 0.0;
  }
  else
  {
    v19 = v19 - v30 * fabs(cos(v24 * 0.5) / v25);
    if (v22 <= v20)
    {
      v27 = -v30;
      v29 = v24 + -1.57079633;
      v26 = 1.57079633;
    }
    else
    {
      v29 = 1.57079633 - v24;
      v26 = -1.57079633;
      v27 = v30;
    }
    v28 = v30;
  }
  v38.a = CGAffineTransformIdentity.a;
  v38.b = b;
  v38.c = c;
  v38.d = d;
  v38.tx = tx;
  v38.ty = ty;
  CGAffineTransformRotate(&v39, &v38, v18);
  -[CRLBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v39.tx + v27 * v39.c + v39.a * v19, v32 + v39.ty + v27 * v39.d + v39.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPath *sfr_path;
  BOOL v7;
  CGPoint v9;

  y = a3.y;
  x = a3.x;
  if ((byte_101414DC0 & 1) == 0)
    byte_101414DC0 = 1;
  -[CRLBezierPath _doPath](self, "_doPath");
  sfr_path = self->sfr_path;
  if (!sfr_path)
    return 0;
  v7 = (id)-[CRLBezierPath windingRule](self, "windingRule") == (id)1;
  v9.x = x;
  v9.y = y;
  return CGPathContainsPoint(sfr_path, 0, v9, v7);
}

- (const)cString
{
  id v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  char *v8;
  size_t v9;
  int v10;
  char v12;
  _BYTE v13[7];

  v3 = +[NSMutableData data](NSMutableData, "data");
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    while (2)
    {
      if (sfr_head == self->sfr_head)
      {
        v8 = &v12;
        v9 = 256;
      }
      else
      {
        v12 = 32;
        v8 = v13;
        v9 = 255;
      }
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          v10 = snprintf(v8, v9, "M %f %f");
          goto LABEL_12;
        case 1:
          v10 = snprintf(v8, v9, "L %f %f");
          goto LABEL_12;
        case 2:
          v10 = snprintf(v8, v9, "C %f %f %f %f %f %f", *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          sfr_extraSegments += 4;
          goto LABEL_12;
        case 3:
          *v8 = 90;
          v10 = 1;
LABEL_12:
          if (v10 < 1 || v10 >= (int)v9)
            goto LABEL_23;
          objc_msgSend(v3, "appendBytes:length:", &v12, &v8[v10] - &v12);
          sfr_head += 6;
          if (sfr_head >= v6)
            break;
          continue;
        default:
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012363A8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF81A0();
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF735C();
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath cString]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2405, 0, "Unhandled path element type");
LABEL_23:
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012363E8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF80EC();
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF735C();
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath cString]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2413, 0, "buffer too small for path element string");
          goto LABEL_30;
      }
      break;
    }
  }
LABEL_30:
  v12 = 0;
  objc_msgSend(v3, "appendBytes:length:", &v12, 1);
  return (const char *)objc_msgSend(v3, "bytes");
}

- (CRLBezierPath)initWithCString:(const char *)a3
{
  CRLBezierPath *v4;
  CRLBezierPath *v5;
  int v6;
  int v7;
  const char *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v35;
  int v36;

  v4 = -[CRLBezierPath init](self, "init");
  v5 = v4;
  if (a3 && v4 && *a3)
  {
    v36 = 0;
    v35 = 0;
    while (1)
    {
      v6 = v36;
      v7 = a3[v36];
      if (v7 == 32)
      {
        v8 = &a3[v36 + 1];
        do
        {
          ++v6;
          v9 = *(unsigned __int8 *)v8++;
          v7 = v9;
        }
        while (v9 == 32);
      }
      v36 = v6 + 1;
      if (!v7)
        return v5;
      if ((char)v7 > 98)
      {
        if ((char)v7 > 108)
        {
          if ((char)v7 == 122)
            goto LABEL_29;
          if ((char)v7 == 113)
          {
LABEL_30:
            sub_1000DE8C4((uint64_t)a3, &v36, &v35);
            v28 = v27;
            sub_1000DE8C4((uint64_t)a3, &v36, &v35);
            v30 = v29;
            sub_1000DE8C4((uint64_t)a3, &v36, &v35);
            v32 = v31;
            sub_1000DE8C4((uint64_t)a3, &v36, &v35);
            -[CRLBezierPath curveToPoint:controlPoint:](v5, "curveToPoint:controlPoint:", v32, v33, v28, v30);
            goto LABEL_31;
          }
          if ((char)v7 != 109)
          {
LABEL_40:
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101236428);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF8308();
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF735C();
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath initWithCString:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2485, 0, "Bezier path string contained unknown elmt.");
LABEL_32:
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101236468);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF8254();
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF735C();
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath initWithCString:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2491, 0, "Something is wrong with this bezier path!");
            return v5;
          }
LABEL_27:
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          v14 = v13;
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          -[CRLBezierPath moveToPoint:](v5, "moveToPoint:", v14, v15);
          goto LABEL_31;
        }
        if ((char)v7 == 99)
        {
LABEL_28:
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          v17 = v16;
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          v19 = v18;
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          v21 = v20;
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          v23 = v22;
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          v25 = v24;
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", v25, v26, v17, v19, v21, v23);
          goto LABEL_31;
        }
        if ((char)v7 != 101)
        {
          if ((char)v7 != 108)
            goto LABEL_40;
          goto LABEL_19;
        }
      }
      else
      {
        if ((char)v7 > 76)
        {
          if ((char)v7 != 77)
          {
            if ((char)v7 == 81)
              goto LABEL_30;
            if ((char)v7 != 90)
              goto LABEL_40;
LABEL_29:
            -[CRLBezierPath closePath](v5, "closePath");
            goto LABEL_31;
          }
          goto LABEL_27;
        }
        if ((char)v7 == 67)
          goto LABEL_28;
        if ((char)v7 != 69)
        {
          if ((char)v7 != 76)
            goto LABEL_40;
LABEL_19:
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          v11 = v10;
          sub_1000DE8C4((uint64_t)a3, &v36, &v35);
          -[CRLBezierPath lineToPoint:](v5, "lineToPoint:", v11, v12);
        }
      }
LABEL_31:
      if (v35)
        goto LABEL_32;
    }
  }
  return v5;
}

- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  int64_t sfr_elementCount;
  PATHSEGMENT *v9;
  double *v10;
  int64_t v11;
  PATHSEGMENT *v12;
  CGPath *sfr_path;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  NSString *v24;
  const char *v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString *v35;
  id v36;
  Swift::String v37;

  y = a4.y;
  x = a4.x;
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount == self->sfr_elementMax)
  {
    self->sfr_elementMax = 2 * sfr_elementCount + 10;
    v9 = (PATHSEGMENT *)NSZoneRealloc((NSZone *)-[CRLBezierPath zone](self, "zone"), self->sfr_head, 24 * self->sfr_elementMax);
    if (v9)
    {
      self->sfr_head = v9;
      if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
        goto LABEL_6;
      v10 = (double *)NSZoneRealloc((NSZone *)-[CRLBezierPath zone](self, "zone"), self->sfr_elementLength, 8 * self->sfr_elementMax);
      if (v10)
      {
        self->sfr_elementLength = v10;
        goto LABEL_6;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012364E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8470();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_elementLength)", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m");
      v25 = "sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_elementLength)";
      v26 = v35;
      v27 = 2577;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012364A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF83BC();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_head)", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLBezierPathDevicePrimitives) _addPathSegment:point:]");
      v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m");
      v25 = "sfr_head could not NSZoneRealloc. No memory (when reallocing sfr_head)";
      v26 = v23;
      v27 = 2568;
    }
    v36 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v24, v27, 1, v25);
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v36, v37);
    abort();
  }
LABEL_6:
  *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] = *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
  *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
  v11 = self->sfr_elementCount;
  v12 = &self->sfr_head[6 * v11];
  *(CGFloat *)&v12[2] = x;
  *(CGFloat *)&v12[4] = y;
  self->sfr_elementCount = v11 + 1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  sfr_bpFlags = self->sfr_bpFlags;
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 3);
  if (a3 != 2 && (*(_WORD *)&sfr_bpFlags & 0x400) != 0)
  {
    -[CRLBezierPath calculateLengthOfElement:](self, "calculateLengthOfElement:", self->sfr_elementCount - 1);
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceMoveToPoint:(CGPoint)a3
{
  int v4;
  PATHSEGMENT *sfr_head;
  int64_t v6;

  v4 = (*(_DWORD *)&self->sfr_bpFlags >> 8) & 3;
  if (v4 == 2)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
    if ((*(_BYTE *)&sfr_head[6 * v6] & 0xF) == 0)
      goto LABEL_6;
  }
  else if (v4 == 1)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
LABEL_6:
    *(CGPoint *)&sfr_head[6 * v6 + 2] = a3;
    goto LABEL_7;
  }
  -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
  v6 = self->sfr_elementCount - 1;
LABEL_7:
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
  self->sfr_lastSubpathIndex = v6;
}

- (void)_deviceLineToPoint:(CGPoint)a3
{
  -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 1, a3.x, a3.y);
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
}

- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5 elementLength:(double)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  int64_t sfr_extraSegmentCount;
  char *sfr_extraSegments;
  CGFloat *v14;
  PATHSEGMENT *v15;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  Swift::String v27;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    self->sfr_extraSegmentMax = 2 * sfr_extraSegmentCount + 10;
    sfr_extraSegments = (char *)NSZoneRealloc((NSZone *)-[CRLBezierPath zone](self, "zone"), self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
    if (!sfr_extraSegments)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236528);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF8524();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d sfr_extraSegments could not NSZoneRealloc. No memory", v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[CRLBezierPath(CRLBezierPathDevicePrimitives) _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:]");
      v26 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLBezierPathDevicePrimitives) _deviceCurveToPoint:controlPoint1:controlPoint2:elementLength:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2642, 1, "sfr_extraSegments could not NSZoneRealloc. No memory");
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v26, v27);
      abort();
    }
    self->sfr_extraSegments = sfr_extraSegments;
    sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  }
  else
  {
    sfr_extraSegments = (char *)self->sfr_extraSegments;
  }
  v14 = (CGFloat *)&sfr_extraSegments[32 * sfr_extraSegmentCount];
  *v14 = v10;
  v14[1] = v9;
  v14[2] = x;
  v14[3] = y;
  self->sfr_extraSegmentCount = sfr_extraSegmentCount + 1;
  v15 = &self->sfr_head[6 * self->sfr_elementCount];
  *(_QWORD *)&v15[-6] = *(_QWORD *)&v15[-6] & 0xFLL | (16 * sfr_extraSegmentCount);
  sfr_bpFlags = self->sfr_bpFlags;
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFCFB | 0x200);
  if ((*(_WORD *)&sfr_bpFlags & 0x400) != 0)
  {
    v17 = fabs(a6);
    if (v17 >= INFINITY && v17 <= INFINITY)
    {
      -[CRLBezierPath calculateLengthOfElement:](self, "calculateLengthOfElement:", self->sfr_elementCount - 1);
      a6 = v18;
    }
    self->sfr_elementLength[self->sfr_elementCount - 1] = a6;
    self->sfr_totalLength = a6 + self->sfr_totalLength;
  }
}

- (void)_deviceClosePath
{
  int64_t sfr_lastSubpathIndex;
  PATHSEGMENT *v4;

  if ((*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x200)
  {
    sfr_lastSubpathIndex = self->sfr_lastSubpathIndex;
    if (sfr_lastSubpathIndex < 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236568);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF85D8();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLBezierPathDevicePrimitives) _deviceClosePath]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath.m"), 2671, 0, "Invalid parameter not satisfying: %{public}s", "sfr_lastSubpathIndex >= 0");
      sfr_lastSubpathIndex = self->sfr_lastSubpathIndex;
    }
    -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 2], *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 4]);
    v4 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[CRLBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v4[2], *(double *)&v4[4]);
    self->sfr_lastSubpathIndex = self->sfr_elementCount - 1;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

+ (void)setMiterLimit:(double)a3
{
  _objc_msgSend(a1, "setDefaultMiterLimit:", a3);
}

+ (void)setFlatness:(double)a3
{
  _objc_msgSend(a1, "setDefaultFlatness:", a3);
}

+ (double)flatness
{
  double result;

  _objc_msgSend(a1, "defaultFlatness");
  return result;
}

+ (void)setWindingRule:(int64_t)a3
{
  _objc_msgSend(a1, "setDefaultWindingRule:", a3);
}

+ (int64_t)windingRule
{
  return (int64_t)_objc_msgSend(a1, "defaultWindingRule");
}

+ (void)setLineCapStyle:(unint64_t)a3
{
  _objc_msgSend(a1, "setDefaultLineCapStyle:", a3);
}

+ (void)setLineJoinStyle:(unint64_t)a3
{
  _objc_msgSend(a1, "setDefaultLineJoinStyle:", a3);
}

+ (void)setLineWidth:(double)a3
{
  _objc_msgSend(a1, "setDefaultLineWidth:", a3);
}

+ (double)lineWidth
{
  double result;

  _objc_msgSend(a1, "defaultLineWidth");
  return result;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  CGRect v15;
  CGRect v16;

  v3 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("CRLBezierPath <%p>"), self);
  if (!-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
    -[CRLBezierPath bounds](self, "bounds");
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Bounds: %@"), NSStringFromCGRect(v15));
    -[CRLBezierPath controlPointBounds](self, "controlPointBounds");
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Control point bounds: %@"), NSStringFromCGRect(v16));
    v4 = -[CRLBezierPath elementCount](self, "elementCount");
    if (v4 >= 1)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v12))
        {
          case 0:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f moveto"), v12[0], v8, v9, v10, v11);
            break;
          case 1:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f lineto"), v12[0], v8, v9, v10, v11);
            break;
          case 2:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f %f %f %f %f curveto"), v12[0], v12[1], v13, v14);
            break;
          case 3:
            objc_msgSend(v3, "appendString:", CFSTR("\n    closepath"));
            break;
          default:
            continue;
        }
      }
    }
  }
  return v3;
}

- (BOOL)isCompound
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v3 < 1)
  {
    v7 = 0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    do
    {
      if (!-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v5))
        ++v6;
      ++v5;
    }
    while (v4 != v5);
    v7 = v6 - (-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v4 - 1) == 0);
  }
  return v7 > 1;
}

- (BOOL)isOpen
{
  uint64_t v3;
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  int v8;
  double v9;
  double v10;
  BOOL result;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  x = CGPointZero.x;
  y = CGPointZero.y;
  if (v3 < 1)
  {
    v9 = CGPointZero.y;
    v10 = CGPointZero.x;
    return !sub_10005FDF0(v10, y, x, v9);
  }
  else
  {
    v6 = v3;
    v7 = 0;
    v8 = 0;
    v9 = CGPointZero.y;
    v10 = CGPointZero.x;
    while (2)
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v7, &v12))
      {
        case 0:
          x = v12;
          v9 = v13;
          if (!v8)
          {
            v10 = v12;
            y = v13;
          }
          ++v8;
          goto LABEL_9;
        case 1:
          x = v12;
          v9 = v13;
          goto LABEL_9;
        case 2:
          x = v14;
          v9 = v15;
          goto LABEL_9;
        case 3:
          goto LABEL_11;
        default:
LABEL_9:
          if (v6 != ++v7)
            continue;
          if (v8 <= 1)
            return !sub_10005FDF0(v10, y, x, v9);
LABEL_11:
          result = 0;
          break;
      }
      break;
    }
  }
  return result;
}

- (BOOL)isLineSegment
{
  BOOL v3;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12[4];
  double v13;
  double v14;

  if ((id)-[CRLBezierPath elementCount](self, "elementCount") == (id)2
    && !-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", 0))
  {
    v3 = 1;
    v5 = -[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", 1);
    if (v5 == 1)
      return v3;
    if (v5 == 2)
    {
      -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, &v10);
      -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 1, v12);
      v6 = v10;
      v7 = v11;
      v8 = v13;
      v9 = v14;
      if (sub_1000E8170(v12[0], v12[1], v10, v11, v13, v14))
        return sub_1000E8170(v12[2], v12[3], v6, v7, v8, v9);
    }
  }
  return 0;
}

- (BOOL)isEffectivelyClosed
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];
  double v10;
  double v11;

  if (-[CRLBezierPath containsClosePathElement](self, "containsClosePathElement"))
    return 1;
  if (-[CRLBezierPath elementCount](self, "elementCount") < 2
    || -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, &v10))
  {
    return 0;
  }
  v4 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", (char *)-[CRLBezierPath elementCount](self, "elementCount") - 1, v9);
  if (v4 < 2)
  {
    v5 = v10;
    v6 = v11;
    v7 = *(double *)v9;
    v8 = *(double *)&v9[1];
  }
  else
  {
    if (v4 != 2)
      return v4 == 3;
    v5 = v10;
    v6 = v11;
    v7 = *(double *)&v9[4];
    v8 = *(double *)&v9[5];
  }
  return v6 == v8 && v5 == v7;
}

- (BOOL)containsElementsOtherThanMoveAndClose
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v3 < 2)
    return 0;
  v4 = v3;
  v5 = 1;
  while (!-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v5)
       || (id)-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v5) == (id)3)
  {
    if (v4 == ++v5)
      return 0;
  }
  return 1;
}

- (unint64_t)totalSubpathCountIncludingEffectivelyEmptySubpaths
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  do
  {
    if (!-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v5))
      ++v6;
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (NSArray)rangesOfSubpaths
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      if (-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v6))
      {
        v8 = v7;
      }
      else
      {
        if (v7 >= 1)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v5, v7));
          objc_msgSend(v3, "addObject:", v9);

        }
        v8 = 0;
        v5 = v6;
      }
      v7 = v8 + 1;
      ++v6;
    }
    while (v4 != v6);
    if ((v8 & 0x8000000000000000) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v5, v8 + 1));
      objc_msgSend(v3, "addObject:", v10);

    }
  }
  return (NSArray *)v3;
}

- (double)flattenedArea
{
  CRLBezierPath *v2;
  uint64_t v3;
  char *v4;
  double v5;
  char *v6;
  char *v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;

  v2 = self;
  if (!-[CRLBezierPath isFlat](v2, "isFlat"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[CRLBezierPath bezierPathByFlatteningPath](v2, "bezierPathByFlatteningPath"));

    v2 = (CRLBezierPath *)v3;
  }
  v4 = -[CRLBezierPath elementCount](v2, "elementCount");
  v5 = 0.0;
  if ((unint64_t)v4 >= 3)
  {
    v6 = v4 - 1;
    -[CRLBezierPath elementAtIndex:associatedPoints:](v2, "elementAtIndex:associatedPoints:", v4 - 1, &v12);
    v7 = 0;
    v9 = v12;
    v8 = v13;
    do
    {
      -[CRLBezierPath elementAtIndex:associatedPoints:](v2, "elementAtIndex:associatedPoints:", v7, &v12);
      v10 = -(v13 * v9);
      v9 = v12;
      v5 = v5 + v10 + v12 * v8;
      ++v7;
      v8 = v13;
    }
    while (v6 != v7);
    v5 = v5 * 0.5;
  }

  return fabs(v5);
}

- (CGRect)boundsIncludingStroke
{
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[CRLBezierPath lineWidth](self, "lineWidth");
  v4 = v3;
  v5 = -[CRLBezierPath lineJoinStyle](self, "lineJoinStyle");
  v6 = -[CRLBezierPath lineCapStyle](self, "lineCapStyle");
  -[CRLBezierPath miterLimit](self, "miterLimit");
  -[CRLBezierPath boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:](self, "boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:", v5, v6, 0, v4, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (NSString)inferredAccessibilityDescription
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;

  -[CRLBezierPath bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if (-[CRLBezierPath isLineSegment](self, "isLineSegment"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Line"), 0, 0));
  }
  else if (-[CRLBezierPath isRectangular](self, "isRectangular"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v11;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Square"), 0, 0));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Rectangle"), 0, 0));
  }
  else if (-[CRLBezierPath isCircular](self, "isCircular"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v12;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Circle"), 0, 0));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Oval"), 0, 0));
  }
  else if (-[CRLBezierPath isTriangular](self, "isTriangular"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Triangle"), 0, 0));
  }
  else
  {
    v13 = -[CRLBezierPath isDiamond](self, "isDiamond");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v14;
    if (v13)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Diamond"), 0, 0));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Shape"), 0, 0));
  }
  v9 = (void *)v8;

  return (NSString *)v9;
}

- (NSString)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;

  -[CRLBezierPath bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if (-[CRLBezierPath isLineSegment](self, "isLineSegment"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Describe the selected line."), 0, 0));
  }
  else if (-[CRLBezierPath isRectangular](self, "isRectangular"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v11;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Describe the selected square."), 0, 0));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Describe the selected rectangle."), 0, 0));
  }
  else if (-[CRLBezierPath isCircular](self, "isCircular"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v12;
    if (v6 == v4 || vabdd_f64(v6, v4) < 0.00999999978)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Describe the selected circle."), 0, 0));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Describe the selected oval."), 0, 0));
  }
  else if (-[CRLBezierPath isTriangular](self, "isTriangular"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Describe the selected triangle."), 0, 0));
  }
  else
  {
    v13 = -[CRLBezierPath isDiamond](self, "isDiamond");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v14;
    if (v13)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Describe the selected diamond."), 0, 0));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Describe the selected shape."), 0, 0));
  }
  v9 = (void *)v8;

  return (NSString *)v9;
}

- (BOOL)hasAtLeastTwoVisuallyDistinctSubregions
{
  return +[CRLBezierPathBooleanOperationHelper hasAtLeastTwoVisuallyDistinctSubregionsInPath:](CRLBezierPathBooleanOperationHelper, "hasAtLeastTwoVisuallyDistinctSubregionsInPath:", self);
}

- (NSArray)visuallyDistinctSubregions
{
  return (NSArray *)+[CRLBezierPathBooleanOperationHelper pathsBySeparatingVisuallyDistinctSubregionsOfPath:](CRLBezierPathBooleanOperationHelper, "pathsBySeparatingVisuallyDistinctSubregionsOfPath:", self);
}

- (id)strokedCopy
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (!-[CRLBezierPath containsElementsOtherThanMoveAndClose](self, "containsElementsOtherThanMoveAndClose"))
    return (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPath p_strokedPathByUsingCG](self, "p_strokedPathByUsingCG"));
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "containsElementsOtherThanMoveAndClose") & 1) == 0)
  {
    v5 = 0;
LABEL_8:
    v7 = objc_claimAutoreleasedReturnValue(-[CRLBezierPath p_strokedPathByUsingBrushStroke](self, "p_strokedPathByUsingBrushStroke"));

    v5 = (id)v7;
    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236D78);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF913C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236D98);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) strokedCopy]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 325, 0, "Unable to recover from CoreGraphics and CRLBrushStroke failing to stroke.");

      v5 = 0;
    }
    goto LABEL_18;
  }
  v5 = v4;
  if ((objc_msgSend(v5, "containsElementsOtherThanMoveAndClose") & 1) == 0)
    goto LABEL_8;
LABEL_18:

  return v5;
}

- (id)p_strokedPathByUsingCG
{
  CGLineCap v3;
  CGLineJoin v4;
  CRLBezierPath *v5;
  const CGPath *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  const CGPath *CopyByStrokingPath;
  void *v11;

  v3 = sub_1000D7994(-[CRLBezierPath lineCapStyle](self, "lineCapStyle"));
  v4 = sub_1000D7994(-[CRLBezierPath lineJoinStyle](self, "lineJoinStyle"));
  v5 = objc_retainAutorelease(self);
  v6 = -[CRLBezierPath CGPath](v5, "CGPath");
  -[CRLBezierPath lineWidth](v5, "lineWidth");
  v8 = v7;
  -[CRLBezierPath miterLimit](v5, "miterLimit");
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v6, 0, v8, v3, v4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", CopyByStrokingPath));
  CGPathRelease(CopyByStrokingPath);
  return v11;
}

- (id)p_strokedPathByUsingBrushStroke
{
  unint64_t v3;
  __CFString *v4;
  CRLBrushStroke *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  CRLBrushStroke *v13;
  void *v14;

  v3 = -[CRLBezierPath lineCapStyle](self, "lineCapStyle");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = *off_101237468[v3];
  v5 = [CRLBrushStroke alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
  -[CRLBezierPath lineWidth](self, "lineWidth");
  v8 = v7;
  v9 = -[CRLBezierPath lineCapStyle](self, "lineCapStyle");
  v10 = -[CRLBezierPath lineJoinStyle](self, "lineJoinStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
  -[CRLBezierPath miterLimit](self, "miterLimit");
  v13 = -[CRLBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v5, "initWithName:color:width:cap:join:pattern:miterLimit:", v4, v6, v9, v10, v11, v8, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStroke strokedCopyOfPath:](v13, "strokedCopyOfPath:", self));
  return v14;
}

- (id)pathByNormalizingClosedPathToRemoveSelfIntersections
{
  return +[CRLBezierPathBooleanOperationHelper pathByNormalizingPath:](CRLBezierPathBooleanOperationHelper, "pathByNormalizingPath:", self);
}

- (id)uniteWithBezierPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v3));

  return v4;
}

+ (id)uniteBezierPaths:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:](CRLBezierPathBooleanOperationHelper, "pathByPerformingBooleanOperation:onPaths:", 0, a3));
}

- (id)intersectBezierPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath intersectBezierPaths:](CRLBezierPath, "intersectBezierPaths:", v3));

  return v4;
}

+ (id)intersectBezierPaths:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:](CRLBezierPathBooleanOperationHelper, "pathByPerformingBooleanOperation:onPaths:", 1, a3));
}

- (id)subtractBezierPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath subtractBezierPaths:](CRLBezierPath, "subtractBezierPaths:", v3));

  return v4;
}

+ (id)subtractBezierPaths:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:](CRLBezierPathBooleanOperationHelper, "pathByPerformingBooleanOperation:onPaths:", 2, a3));
}

- (id)excludeBezierPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self, a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath excludeBezierPaths:](CRLBezierPath, "excludeBezierPaths:", v3));

  return v4;
}

+ (id)excludeBezierPaths:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:](CRLBezierPathBooleanOperationHelper, "pathByPerformingBooleanOperation:onPaths:", 3, a3));
}

+ (id)exteriorOfBezierPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  unsigned int v13;
  double v15[2];
  double v16[6];

  v3 = a3;
  v4 = (uint64_t)objc_msgSend(v3, "elementCount");
  v5 = v4 - 1;
  if (v4 < 1)
  {
LABEL_21:
    v7 = v3;
    goto LABEL_22;
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v6 + 1;
    if (v5 != v6 && objc_msgSend(v3, "elementAtIndex:", v6 + 1))
      goto LABEL_15;
    if (v9)
    {
      if (!v7)
        v7 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
      objc_msgSend(v7, "appendBezierPath:fromSegment:toSegment:", v3, v8, v6 + 1);
    }
    if (v10 >= v5)
    {
      v9 = 0;
LABEL_15:
      v10 = v8;
      goto LABEL_19;
    }
    objc_msgSend(v3, "elementAtIndex:associatedPoints:", v6 + 1, v15);
    v11 = objc_msgSend(v7, "containsPoint:", v15[0], v15[1]) ^ 1;
    if ((v11 & 1) == 0)
    {
      v12 = objc_msgSend(v3, "elementAtIndex:associatedPoints:", v6 + 2, v16);
      if (v12 == (id)2)
      {
        v13 = objc_msgSend(v7, "containsPoint:", v16[4], v16[5]);
        goto LABEL_17;
      }
      if (v12 == (id)1)
      {
        v13 = objc_msgSend(v7, "containsPoint:", v16[0], v16[1]);
LABEL_17:
        v11 = v13 ^ 1;
      }
    }
    v9 = v11 != 0;
LABEL_19:
    ++v6;
    v8 = v10;
  }
  while (v4 != v6);
  if (!v7)
    goto LABEL_21;
LABEL_22:

  return v7;
}

+ (id)smoothBezierPath:(id)a3 withThreshold:(double)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSimplifier simplifiedPathWithRawPath:threshold:](CRLBezierPathSimplifier, "simplifiedPathWithRawPath:threshold:", a3, a4));
}

- (id)bezierPathByOffsettingPath:(double)a3 joinStyle:(unint64_t)a4
{
  CRLBezierPath *v5;
  void *v6;
  unsigned __int8 v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v19;
  CGRect v20;

  if (a3 == 0.0)
  {
LABEL_2:
    v5 = self;
LABEL_3:
    v6 = v5;
    return v6;
  }
  v10 = -[CRLBezierPath isEmpty](self, "isEmpty");
  if (a3 < 0.0 && (v10 & 1) == 0)
  {
    -[CRLBezierPath bounds](self, "bounds");
    if (v11 <= a3 * -2.0)
    {
      -[CRLBezierPath bounds](self, "bounds");
      if (v12 <= a3 * -2.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236DB8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF91BC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236DD8);
        v16 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) bezierPathByOffsettingPath:joinStyle:]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 464, 0, "Cannot offset path that is already smaller than the offset amount!");

        goto LABEL_2;
      }
    }
  }
  if (-[CRLBezierPath isRectangular](self, "isRectangular"))
  {
    -[CRLBezierPath bounds](self, "bounds");
    v20 = CGRectInset(v19, -a3, -a3);
    if (a3 > 0.0 && a4 == 1)
      v5 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithLegacyRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithLegacyRoundedRect:cornerRadius:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, a3));
    else
      v5 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height));
    goto LABEL_3;
  }
  v13 = -[CRLBezierPath copy](self, "copy");
  objc_msgSend(v13, "setLineWidth:", fabs(a3 + a3));
  objc_msgSend(v13, "setLineJoinStyle:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "strokedCopy"));
  if (a3 <= 0.0)
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subtractBezierPath:", v14));
  else
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniteWithBezierPath:", v14));
  v6 = (void *)v15;

  return v6;
}

+ (CRLBezierPath)bezierPathWithConvexHullOfPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  void *v7;
  void *v8;
  double x;
  double y;
  CGFloat *p_y;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double i;
  char v18;
  CGFloat *v19;
  unint64_t v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat *v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  CGFloat *v34;
  char v35;
  double *v36;
  unint64_t v37;
  char v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v8 = v7;
  x = a3->x;
  y = a3->y;
  if (a4)
  {
    p_y = &a3->y;
    v12 = a4;
    do
    {
      v13 = *(p_y - 1);
      if (v13 >= x)
      {
        if (v13 == x && *p_y > y)
        {
          x = *(p_y - 1);
          y = *p_y;
        }
      }
      else
      {
        y = *p_y;
        x = *(p_y - 1);
      }
      p_y += 2;
      --v12;
    }
    while (v12);
  }
  objc_msgSend(v7, "moveToPoint:", x, y);
  v14 = CGPointZero.x;
  v15 = CGPointZero.y;
  v16 = x;
  for (i = y; ; i = v15)
  {
    if (!a4)
    {
      v27 = a3->x;
      v28 = a3->y;
      goto LABEL_26;
    }
    v18 = 0;
    v19 = &a3->y;
    v20 = a4;
    do
    {
      v21 = v18;
      v22 = v14;
      v23 = v15;
      v24 = *(v19 - 1);
      v18 |= v16 < v24;
      if (v16 < v24)
      {
        v14 = *(v19 - 1);
        v15 = *v19;
        if ((v21 & 1) != 0)
        {
          objc_msgSend(a1, "p_findPointWithGreatestSlopeFromStartPoint:toPointA:orPointB:", v16, i, v22, v23);
          v14 = v25;
          v15 = v26;
          v18 = 1;
        }
      }
      v19 += 2;
      --v20;
    }
    while (v20);
    if ((v18 & 1) == 0)
      break;
    objc_msgSend(v8, "lineToPoint:", v14, v15, v22, v23);
    v16 = v14;
  }
  v27 = a3->x;
  v29 = &a3->y;
  v28 = a3->y;
  v30 = a4;
  do
  {
    v31 = *(v29 - 1);
    if (v31 <= v27)
    {
      if (v31 == v27 && *v29 < v28)
      {
        v27 = *(v29 - 1);
        v28 = *v29;
      }
    }
    else
    {
      v28 = *v29;
      v27 = *(v29 - 1);
    }
    v29 += 2;
    --v30;
  }
  while (v30);
LABEL_26:
  objc_msgSend(v8, "lineToPoint:", v27, v28);
  v32 = CGPointZero.x;
  v33 = CGPointZero.y;
  v34 = &a3->y;
  while (a4)
  {
    v35 = 0;
    v36 = v34;
    v37 = a4;
    do
    {
      v38 = v35;
      v39 = v32;
      v40 = v33;
      v41 = *(v36 - 1);
      v35 |= v27 > v41;
      if (v27 > v41)
      {
        v32 = *(v36 - 1);
        v33 = *v36;
        if ((v38 & 1) != 0)
        {
          objc_msgSend(a1, "p_findPointWithGreatestSlopeFromStartPoint:toPointA:orPointB:", v27, v28, v39, v40);
          v32 = v42;
          v33 = v43;
          v35 = 1;
        }
      }
      v36 += 2;
      --v37;
    }
    while (v37);
    if ((v35 & 1) == 0)
      break;
    objc_msgSend(v8, "lineToPoint:", v32, v33, v39, v40);
    v27 = v32;
    v28 = v33;
  }
  objc_msgSend(v8, "lineToPoint:", x, y);
  objc_msgSend(v8, "closePath");
  return (CRLBezierPath *)v8;
}

+ (CGPoint)p_findPointWithGreatestSlopeFromStartPoint:(CGPoint)a3 toPointA:(CGPoint)a4 orPointB:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a4.x - a3.x;
  v11 = a5.x - a3.x;
  if (a4.x - a3.x == 0.0 || v11 == 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236DF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF923C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236E18);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPath(CRLAdditions) p_findPointWithGreatestSlopeFromStartPoint:toPointA:orPointB:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 600, 0, "If delta X is 0, we would divide by zero.");

  }
  v15 = (v7 - v9) / v10;
  if (v10 == 0.0)
    v15 = 1.79769313e308;
  v16 = (y - v9) / v11;
  if (v11 == 0.0)
    v16 = 1.79769313e308;
  if (v15 <= v16)
  {
    if (v16 <= v15)
    {
      if (fabs(v11) > fabs(v10))
      {
        v8 = x;
        v7 = y;
      }
    }
    else
    {
      v8 = x;
      v7 = y;
    }
  }
  v17 = v8;
  v18 = v7;
  result.y = v18;
  result.x = v17;
  return result;
}

+ (CRLBezierPath)bezierPathWithConvexHullFromWrapPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  void *__p;
  void *v13;
  uint64_t v14;

  v3 = a3;
  if (objc_msgSend(v3, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236E38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF92BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236E58);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPath(CRLAdditions) bezierPathWithConvexHullFromWrapPath:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 629, 0, "The wrap path cannot be empty when calculating the convex hull.");

  }
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = sub_1000EA034;
  v11[4] = sub_1000EA058;
  v11[5] = &unk_1010E66AB;
  __p = 0;
  v13 = 0;
  v14 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bezierPathByFlatteningPathWithFlatness:", 1.0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000EA070;
  v10[3] = &unk_101236E80;
  v10[4] = v11;
  objc_msgSend(v7, "iteratePathElementsWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithConvexHullOfPoints:count:](CRLBezierPath, "bezierPathWithConvexHullOfPoints:count:"));

  _Block_object_dispose(v11, 8);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

  return (CRLBezierPath *)v8;
}

- (id)pathBySplittingAtPointOnPath:(CGPoint)a3 controlPointDistanceEqual:(BOOL)a4
{
  _BOOL8 v4;
  double x;
  double v7;
  double v9;
  uint64_t v10;

  v4 = a4;
  x = a3.x;
  v9 = 0.0;
  v10 = 0;
  -[CRLBezierPath p_yValueFromXValue:elementIndex:parametricValue:](self, "p_yValueFromXValue:elementIndex:parametricValue:", &v10, &v9, a3.x, a3.y);
  return (id)objc_claimAutoreleasedReturnValue(-[CRLBezierPath p_pathBySplittingAtPointGuaranteedToBeOnPath:controlPointDistanceEqual:elementIndex:parametricValue:](self, "p_pathBySplittingAtPointGuaranteedToBeOnPath:controlPointDistanceEqual:elementIndex:parametricValue:", v4, v10, x, v7, v9));
}

- (id)p_pathBySplittingAtPointGuaranteedToBeOnPath:(CGPoint)a3 controlPointDistanceEqual:(BOOL)a4 elementIndex:(int64_t)a5 parametricValue:(double)a6
{
  _BOOL4 v7;
  double x;
  double y;
  void *v11;
  uint64_t i;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;

  v7 = a4;
  x = CGPointZero.x;
  y = CGPointZero.y;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath", a3.x, a3.y));
  for (i = 0; i < -[CRLBezierPath elementCount](self, "elementCount"); ++i)
  {
    v13 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, &v78);
    if (a5 == i)
    {
      v14 = v78;
      v15 = v79;
      v16 = v80;
      v17 = v81;
      v18 = v83;
      v77 = v82;
      v19 = sub_1000603B8(v78, v79, x);
      v21 = sub_1000603DC(v19, v20, a6);
      v22 = sub_1000603D0(x, y, v21);
      v24 = v23;
      v25 = sub_1000603B8(v16, v17, v14);
      v27 = sub_1000603DC(v25, v26, a6);
      v28 = sub_1000603D0(v14, v15, v27);
      v30 = v29;
      v76 = v18;
      v31 = sub_1000603B8(v77, v18, v16);
      v33 = sub_1000603DC(v31, v32, a6);
      v34 = sub_1000603D0(v16, v17, v33);
      v36 = v35;
      v37 = sub_1000603B8(v28, v30, v22);
      v39 = sub_1000603DC(v37, v38, a6);
      v75 = v22;
      v40 = v22;
      v41 = v24;
      v42 = sub_1000603D0(v40, v24, v39);
      v44 = v43;
      v73 = v36;
      v74 = v34;
      v45 = sub_1000603B8(v34, v36, v28);
      v47 = sub_1000603DC(v45, v46, a6);
      v48 = sub_1000603D0(v28, v30, v47);
      v50 = v49;
      v51 = sub_1000603B8(v48, v49, v42);
      v53 = sub_1000603DC(v51, v52, a6);
      v54 = sub_1000603D0(v42, v44, v53);
      v56 = v55;
      if (v7)
      {
        v57 = sub_1000603B8(v42, v44, v54);
        v59 = v58;
        v60 = sub_1000603B8(v48, v50, v54);
        v62 = sub_1000603DC(v60, v61, -1.0);
        v63 = sub_1000603D0(v57, v59, v62);
        v65 = sub_1000603DC(v63, v64, 0.5);
        v67 = v66;
        v42 = sub_1000603D0(v54, v56, v65);
        v44 = v68;
        v69 = sub_1000603DC(v65, v67, -1.0);
        v48 = sub_1000603D0(v54, v56, v69);
        v50 = v70;
      }
      objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", v54, v56, v75, v41, v42, v44);
      y = v76;
      x = v77;
      objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", v77, v76, v48, v50, v74, v73);
    }
    else
    {
      switch(v13)
      {
        case 0:
          objc_msgSend(v11, "moveToPoint:", v78, v79);
          goto LABEL_10;
        case 1:
          objc_msgSend(v11, "lineToPoint:", v78, v79);
LABEL_10:
          x = v78;
          y = v79;
          break;
        case 2:
          objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", v82, v83, v78, v79, v80, v81);
          x = v82;
          y = v83;
          break;
        case 3:
          objc_msgSend(v11, "closePath");
          break;
        default:
          continue;
      }
    }
  }
  return v11;
}

- (id)pathByCreatingHoleInPathAtPoint:(CGPoint)a3 withDiameter:(id)a4 andThreshold:(double)a5 updatingPatternOffsetsBySubpath:(id)a6
{
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  char *v22;
  char *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  int64_t v33;
  double v34;
  int v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  uint64_t v41;
  int64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  double v48;
  double v49;
  uint64_t v50;
  unint64_t v51;
  double v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int64_t v60;
  double v61;
  double v62;
  int v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  BOOL v70;
  char *v71;
  int64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  double v77;
  double v78;
  void *v79;
  unint64_t v80;
  double v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  unint64_t v93;
  uint64_t v94;
  void *v95;
  double (**v96)(double, double, double, double, double);
  int v97;
  double v98;
  char *v99;
  uint64_t v100[4];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;

  y = a3.y;
  x = a3.x;
  v96 = (double (**)(double, double, double, double, double))a4;
  v11 = a6;
  v98 = 0.0;
  v99 = 0;
  -[CRLBezierPath distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:](self, "distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:", &v99, &v98, 1, x, y, a5);
  v13 = v12;
  if (v12 > a5
    || (-[CRLBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", v99, v98),
        v15 = v14,
        v17 = v16,
        -[CRLBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", v99, v98),
        v20 = v96[2](v13, v15, v17, v18, v19),
        v20 <= 0.0))
  {
    v24 = 0;
    goto LABEL_6;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v22 = v99;
  if (v99)
  {
    v23 = v99 - 1;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236EA0);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      sub_100DF953C();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236EC0);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 761, 0, "firstElementAfter should be at least 1.");

    v23 = 0;
  }
  v30 = v20 * 0.5;
  v31 = v98;
  v32 = v30;
  while (1)
  {
    v105 = xmmword_100EEC438;
    v106 = xmmword_100EEC438;
    v107 = xmmword_100EEC438;
    v108 = xmmword_100EEC438;
    v33 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v23 + 1, &v105);
    if (v33 == 3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236EE0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF94BC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236F00);
      v37 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 798, 0, "-pathByCreatingHoleInPathAtPoint doesn't know how to handle close elements.");

LABEL_32:
      v35 = 0;
      v36 = v23 + 1;
      v97 = 1;
      goto LABEL_33;
    }
    if ((unint64_t)(v33 - 3) < 0xFFFFFFFFFFFFFFFELL)
      goto LABEL_32;
    -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", v23 + 1);
    if (v32 <= v31 * v34)
      break;
    if (!v23)
    {
      v97 = 0;
      v47 = 0;
      v41 = 0;
      v40 = 0.0;
      v24 = v21;
      if (v11)
        goto LABEL_53;
LABEL_50:
      v48 = 0.0;
      v49 = 0.0;
      goto LABEL_60;
    }
    v32 = v32 - v31 * v34;
    --v23;
    v31 = 1.0;
    if (v32 <= 0.0)
    {
      v35 = 0;
      v97 = 0;
      v36 = v23 + 1;
LABEL_33:
      v40 = 0.0;
      goto LABEL_35;
    }
  }
  v97 = 0;
  v40 = v31 - v32 / v34;
  v36 = v23 + 1;
  v35 = 1;
LABEL_35:
  v100[0] = 0;
  v24 = -[CRLBezierPath copyWithPointsInRange:countingSubpaths:](self, "copyWithPointsInRange:countingSubpaths:", 0, v36, v100);

  v41 = v100[0];
  if (v35)
  {
    v105 = xmmword_100EEC438;
    v106 = xmmword_100EEC438;
    v107 = xmmword_100EEC438;
    v108 = xmmword_100EEC438;
    v42 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v36, &v105);
    if ((unint64_t)(v42 - 1) >= 2)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236F20);
      v43 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
        sub_100DF943C();

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101236F40);
      v44 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 847, 0, "If we have a path before, the last element before +1 should be a curve or line.");

    }
    if (v42 == 1)
    {
      objc_msgSend(v24, "lineToPoint:", sub_100061A8C(*(double *)&v105, *((double *)&v105 + 1), *(double *)&v106, *((double *)&v106 + 1), v40));
    }
    else if (v42 == 2)
    {
      v101 = xmmword_100EEC438;
      v102 = xmmword_100EEC438;
      v103 = xmmword_100EEC438;
      v104 = xmmword_100EEC438;
      sub_100313400((float64x2_t *)&v105, (uint64_t)&v101, 0.0, v40);
      objc_msgSend(v24, "curveToPoint:controlPoint1:controlPoint2:", v104, v102, v103);
    }
  }
  v47 = 1;
  if (!v11)
    goto LABEL_50;
LABEL_53:
  v50 = (uint64_t)objc_msgSend(v24, "elementCount");
  if (v50 < 1)
  {
    v49 = 0.0;
  }
  else
  {
    v51 = v50 + 1;
    v49 = 0.0;
    do
    {
      if (!objc_msgSend(v24, "elementAtIndex:", v51 - 2))
        break;
      objc_msgSend(v24, "lengthOfElement:", v51 - 2);
      v49 = v49 + v52;
      --v51;
    }
    while (v51 > 1);
  }
  v53 = -[CRLBezierPath copyFromSegment:t:toSegment:t:](self, "copyFromSegment:t:toSegment:t:", ((_DWORD)v23 + 1), v99, v40, v98);
  objc_msgSend(v53, "length");
  v55 = v54;

  v48 = v55 + 0.0;
LABEL_60:
  v56 = INFINITY;
  v57 = INFINITY;
  v58 = v98;
  if (v22 >= (char *)-[CRLBezierPath elementCount](self, "elementCount"))
  {
    v63 = 0;
    v64 = 0;
LABEL_69:
    v59 = 1.0;
    if (v11)
      goto LABEL_107;
  }
  else
  {
    v59 = 1.0 - v58;
    while (1)
    {
      v105 = xmmword_100EEC438;
      v106 = xmmword_100EEC438;
      v107 = xmmword_100EEC438;
      v108 = xmmword_100EEC438;
      v60 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v22, &v105);
      if (v60 == 3)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236F60);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF93BC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236F80);
        v65 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v66, v67, 894, 0, "-pathByCreatingHoleInPathAtPoint doesn't know how to handle close elements.");

LABEL_80:
        v59 = 1.0;
        v64 = 1;
        goto LABEL_87;
      }
      if ((unint64_t)(v60 - 3) < 0xFFFFFFFFFFFFFFFELL)
        goto LABEL_80;
      -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", v22);
      v62 = v61;
      if (v30 <= v59 * v61)
        break;
      if (v22 >= (char *)-[CRLBezierPath elementCount](self, "elementCount") - 1)
      {
        v63 = 0;
        v64 = 0;
        v22 = (char *)-[CRLBezierPath elementCount](self, "elementCount") - 1;
        goto LABEL_69;
      }
      v30 = v30 - v59 * v62;
      ++v22;
      v59 = 1.0;
      if (v30 <= 0.0)
        goto LABEL_86;
    }
    v59 = 1.0 - v59 + v30 / v61;
    if (v60 == 2)
      v68 = sub_1000602A8((float64x2_t *)&v105, v59);
    else
      v68 = sub_100061A8C(*(double *)&v105, *((double *)&v105 + 1), *(double *)&v106, *((double *)&v106 + 1), v59);
    v56 = v68;
    v57 = v69;
LABEL_86:
    v64 = 0;
LABEL_87:
    v70 = v56 == INFINITY && v57 == INFINITY;
    v71 = v22;
    if (!v70)
    {
      objc_msgSend(v24, "moveToPoint:", v56, v57);
      v105 = xmmword_100EEC438;
      v106 = xmmword_100EEC438;
      v107 = xmmword_100EEC438;
      v108 = xmmword_100EEC438;
      v72 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v22, &v105);
      if ((unint64_t)(v72 - 1) >= 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236FA0);
        v73 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
          sub_100DF933C();

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101236FC0);
        v74 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:]"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v95, v75, 946, 0, "If we have a path after, the first element after should be a curve or line.");

      }
      if (v72 == 1)
      {
        objc_msgSend(v24, "lineToPoint:", v106);
      }
      else if (v72 == 2)
      {
        v101 = xmmword_100EEC438;
        v102 = xmmword_100EEC438;
        v103 = xmmword_100EEC438;
        v104 = xmmword_100EEC438;
        sub_100313400((float64x2_t *)&v105, (uint64_t)&v101, v59, 1.0);
        objc_msgSend(v24, "curveToPoint:controlPoint1:controlPoint2:", v104, v102, v103);
      }
      v71 = v22 + 1;
    }
    objc_msgSend(v24, "appendPointsInRange:fromBezierPath:", v71, (_BYTE *)-[CRLBezierPath elementCount](self, "elementCount") - v71, self);
    v63 = 1;
    if (v11)
    {
LABEL_107:
      v76 = -[CRLBezierPath copyFromSegment:t:toSegment:t:](self, "copyFromSegment:t:toSegment:t:", v99, v22, v98, v59);
      objc_msgSend(v76, "length");
      v78 = v77;

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v80 = 0;
      v81 = v48 + v78;
      while (v80 < (unint64_t)objc_msgSend(v11, "count"))
      {
        if (v80)
          v82 = 1;
        else
          v82 = v47;
        if (v80 + 1 == v41 || (v82 & 1) == 0)
        {
          if (v47)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v80));
            objc_msgSend(v79, "addObject:", v84);

          }
          if (!v63)
            break;
          if ((v64 & 1) == 0)
          {
            if (v97)
            {
              v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v80 + 1));
              objc_msgSend(v85, "crl_CGFloatValue");
              v87 = v86;

              v88 = v87 + 0.0;
            }
            else
            {
              v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v80));
              objc_msgSend(v89, "crl_CGFloatValue");
              v91 = v90;

              v88 = v49 + v91 + 0.0;
            }
            v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", v81 + v88));
            objc_msgSend(v79, "addObject:", v92);

          }
          if (v97)
            v93 = v80 + 1;
          else
            v93 = v80;
          v80 = v93 + 1;
        }
        else
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v80));
          objc_msgSend(v79, "addObject:", v83);

          ++v80;
        }
      }
      objc_msgSend(v11, "removeAllObjects");
      objc_msgSend(v11, "addObjectsFromArray:", v79);

    }
  }
  if ((objc_msgSend(v24, "isEmpty") & 1) == 0
    && (objc_msgSend(v24, "containsElementsOtherThanMoveAndClose") & 1) == 0)
  {
    v94 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));

    v24 = (id)v94;
    objc_msgSend(v11, "removeAllObjects");
  }
LABEL_6:

  return v24;
}

- (id)pathByWobblingByUpTo:(double)a3 subdivisions:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  unsigned int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  unint64_t v30;
  float v31;
  double v32;
  double y;
  double x;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  v7 = -[CRLBezierPath copy](self, "copy");
  objc_msgSend(v7, "removeAllPoints");
  y = CGPointZero.y;
  x = CGPointZero.x;
  v8 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v8 >= 1)
  {
    v9 = 0;
    v10 = a3;
    v36 = v10;
    do
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, &v37))
      {
        case 0:
          v12 = v37;
          v11 = v38;
          v13 = sub_1003C6618();
          y = v11 + (sub_1003C6618() + -0.5) * v36;
          x = v12 + (v13 + -0.5) * v36;
          objc_msgSend(v7, "moveToPoint:", x);
          break;
        case 1:
          v14 = 0;
          v15 = v37;
          v16 = v38;
          goto LABEL_8;
        case 2:
          v18 = v41;
          v17 = v42;
          v19 = sub_1003C6618();
          objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v18 + (v19 + -0.5) * v36, v17 + (sub_1003C6618() + -0.5) * v36, v37, v38, v39, v40);
          break;
        case 3:
          v16 = y;
          v15 = x;
          v37 = x;
          v38 = y;
          v14 = 1;
LABEL_8:
          v20 = 0;
          v21 = 1;
          do
          {
            objc_msgSend(v7, "currentPoint");
            v23 = v22;
            v25 = v24;
            v26 = sub_1000603B8(v15, v16, v22);
            v28 = v27;
            v29 = 1.0;
            v30 = a4 - v20;
            if (v30)
            {
              v31 = sub_1003C6618() + 0.5;
              v29 = fminf((float)(1.0 / (float)v30) * v31, 1.0);
            }
            v32 = sub_1003C6618();
            objc_msgSend(v7, "lineToPoint:", v23 + v26 * v29 + (v32 + -0.5) * v36, v25 + v28 * v29 + (sub_1003C6618() + -0.5) * v36);
            v20 = v21++;
          }
          while (v20 <= a4);
          if (v14)
            objc_msgSend(v7, "closePath");
          break;
        default:
          break;
      }
      ++v9;
    }
    while (v9 != v8);
  }
  return v7;
}

- (id)arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  -[CRLBezierPath copyPathAttributesTo:](self, "copyPathAttributesTo:", v6);
  for (i = 0; -[CRLBezierPath elementCount](self, "elementCount") > i; ++i)
  {
    switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, &v10))
    {
      case 0:
        if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
          objc_msgSend(v5, "addObject:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));

        -[CRLBezierPath copyPathAttributesTo:](self, "copyPathAttributesTo:", v8);
        objc_msgSend(v8, "moveToPoint:", v10, v11);
        break;
      case 1:
        objc_msgSend(v6, "lineToPoint:", v10, v11);
        v8 = v6;
        break;
      case 2:
        objc_msgSend(v6, "curveToPoint:controlPoint1:controlPoint2:", v14, v15, v10, v11, v12, v13);
        v8 = v6;
        break;
      case 3:
        objc_msgSend(v6, "closePath");
        objc_msgSend(v5, "addObject:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));

        -[CRLBezierPath copyPathAttributesTo:](self, "copyPathAttributesTo:", v8);
        break;
      default:
        v8 = v6;
        break;
    }
    v6 = v8;
  }
  if ((objc_msgSend(v6, "isEmpty") & 1) == 0
    && (!v3 || objc_msgSend(v6, "containsElementsOtherThanMoveAndClose")))
  {
    objc_msgSend(v5, "addObject:", v6);
  }

  return v5;
}

- (id)pathSplitAtSubpathBoundariesWithSoftElementLimit:(unint64_t)a3 hardElementLimit:(unint64_t)a4
{
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  char *v29;
  id v30;
  unint64_t v31;
  int64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  unint64_t v40;
  unint64_t v41;
  id v42;
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;

  if (-[CRLBezierPath elementCount](self, "elementCount") < 0)
  {
    v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101236FE0);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      sub_100DF95BC((uint64_t)buf, v14, -[CRLBezierPath elementCount](self, "elementCount"), v15);

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237000);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1147, 0, "elementCount (%zd) should be positive.", -[CRLBezierPath elementCount](self, "elementCount"));

    goto LABEL_51;
  }
  v7 = -[CRLBezierPath elementCount](self, "elementCount");
  if (a3 > a4)
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    v9 = a4;
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237020);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      v44 = v8;
      v45 = 2082;
      v46 = "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]";
      v47 = 2082;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
      v49 = 1024;
      v50 = 1154;
      v51 = 2048;
      v52 = a3;
      v53 = 2048;
      v54 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d softElementLimit (%zu) should be less than or equal to hardElementLimit (%zu).", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237040);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1154, 0, "softElementLimit (%zu) should be less than or equal to hardElementLimit (%zu).", a3, v9);

    goto LABEL_51;
  }
  v41 = a3;
  if (a3 < 2 || (v19 = a4 - 1, a4 <= 1))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237060);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF963C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237080);
    v35 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 1159, 0, "Unable to split a path with subpaths less than 2 elements at a time.");

    goto LABEL_51;
  }
  if (!v7)
  {
LABEL_51:
    v20 = &__NSArray0__struct;
    return v20;
  }
  if (v7 <= a3)
  {
    v39 = -[CRLBezierPath copy](self, "copy");
    v42 = v39;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));

    return v20;
  }
  v40 = a4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPath p_elementCountForSubpaths](self, "p_elementCountForSubpaths"));
  v22 = (char *)objc_msgSend(v21, "count");
  if (v22)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    while (1)
    {
      v26 = v21;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v23));
      v28 = (unint64_t)objc_msgSend(v27, "unsignedIntegerValue");
      ++v23;

      v29 = &v24[v28];
      if ((unint64_t)&v24[v28] <= v41)
        goto LABEL_37;
      if (v24)
      {
        v30 = -[CRLBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v25, v24);
        objc_msgSend(v20, "addObject:", v30);

        v25 += (uint64_t)v24;
      }
      v31 = v40;
      if (v28 <= v40)
        break;
      do
      {
        if (v28 >= v31)
          v32 = v31;
        else
          v32 = v28;
        v33 = -[CRLBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v25, v32);
        objc_msgSend(v20, "addObject:", v33);

        v25 += v32;
        v31 = v19;
        v28 -= v32;
      }
      while (v28);
      v29 = 0;
LABEL_40:
      v24 = v29;
      v21 = v26;
      if (v23 == v22)
        goto LABEL_41;
    }
    v29 = (char *)v28;
LABEL_37:
    if (v23 == v22 && v29)
    {
      v34 = -[CRLBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v25, v29);
      objc_msgSend(v20, "addObject:", v34);

    }
    goto LABEL_40;
  }
LABEL_41:

  return v20;
}

- (id)p_elementCountForSubpaths
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = -v4;
    v7 = 1;
    do
    {
      if (!(v6 + v7) || !-[CRLBezierPath elementAtIndex:](self, "elementAtIndex:", v7))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7 - v5));
        objc_msgSend(v3, "addObject:", v8);

        v5 = v7;
      }
      ++v7;
    }
    while (v6 + v7 != 1);
  }
  return v3;
}

- (BOOL)isVisuallyEqualToPath:(id)a3 withThreshold:(double)a4
{
  CRLBezierPath *v6;
  CRLBezierPath *v7;
  CRLBezierHitTester *v8;
  CRLBezierHitTester *v9;
  double v10;
  uint64_t v11;
  char v12;
  char v13;
  CRLBezierPath *v14;
  CRLBezierPath *v15;
  CRLBezierPath *v16;
  CRLBezierHitTester *v17;
  BOOL v18;
  _QWORD v20[4];
  CRLBezierHitTester *v21;
  uint64_t *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = (CRLBezierPath *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v18 = 1;
  }
  else if (v6)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1;
    v8 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", 5.0);
    v9 = v8;
    if (a4 >= 1.0)
      v10 = 1.0;
    else
      v10 = a4;
    -[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:](v8, "addPath:filled:pathID:crawlingDistance:", self, 0, 0, v10);
    -[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:](v9, "addPath:filled:pathID:crawlingDistance:", v7, 0, 1, v10);
    v11 = 0;
    v12 = 1;
    do
    {
      v13 = v12;
      v14 = v7;
      if ((v12 & 1) != 0)
        v15 = self;
      else
        v15 = v7;
      v16 = v15;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000EC664;
      v20[3] = &unk_1012370C8;
      v22 = &v25;
      v17 = v9;
      v21 = v17;
      v23 = a4;
      v24 = v11;
      -[CRLBezierPath iterateOverPathWithPointDistancePerIteration:usingBlock:](v16, "iterateOverPathWithPointDistancePerIteration:usingBlock:", v20, 1.0);

      v12 = 0;
      v11 = 1;
      v7 = v14;
    }
    while ((v13 & 1) != 0);
    v18 = *((_BYTE *)v26 + 24) != 0;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (CGPoint)pointAlongPathAtPercentage:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPath bezierPathByFlatteningPath](self, "bezierPathByFlatteningPath"));
  v12 = 0;
  v13 = 0;
  -[CRLBezierPath pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:](self, "pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:", v5, &v13, &v12, a3);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)pointAlongPathAtPercentage:(double)a3 withFlattenedPath:(id)a4 andLength:(double *)a5 atStartIndex:(unint64_t *)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double x;
  double y;
  id v27;
  unsigned int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  char *v41;
  int v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  CGFloat v48;
  double v49;
  id v50;
  __int128 *v51;
  double *v52;
  double v53;
  double v54;
  float v55;
  double v56;
  double v57;
  double v58;
  uint8_t v62[4];
  unsigned int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  _BYTE buf[48];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CGPoint result;

  v6 = a4;
  if (objc_msgSend(v6, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012370E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9768();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237108);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1289, 0, "It is impossible to find pointAlongPathAtPercentage at any percentage of an empty path.");

  }
  v10 = (char *)objc_msgSend(v6, "elementCount");
  objc_msgSend(v6, "length");
  v12 = v11;
  v13 = v11 * sub_1003C65EC(a3, 0.0, 1.0);
  v14 = *a5;
  v15 = *a6;
  if (*a6 < (unint64_t)v10)
  {
    while (1)
    {
      v72 = xmmword_100EEC438;
      v73 = xmmword_100EEC438;
      v74 = xmmword_100EEC438;
      v75 = xmmword_100EEC438;
      v16 = (unint64_t)objc_msgSend(v6, "elementAtIndex:allPoints:", v15, &v72);
      if (v16 == 2)
      {
        v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101237128);
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v17;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]";
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1301;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We don't expect curve elements in a flattened path.", buf, 0x22u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101237148);
        v19 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v17;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v33;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 1301, 0, "We don't expect curve elements in a flattened path.");

LABEL_25:
        v24 = v14;
        goto LABEL_55;
      }
      if ((v16 | 2) != 3)
        goto LABEL_25;
      if (v16 == 1)
        break;
      x = CGPointZero.x;
      y = CGPointZero.y;
      if (v15 && v16 == 3)
      {
        *(_OWORD *)buf = xmmword_100EEC438;
        *(_OWORD *)&buf[16] = xmmword_100EEC438;
        *(_OWORD *)&buf[32] = xmmword_100EEC438;
        v71 = xmmword_100EEC438;
        v27 = objc_msgSend(v6, "elementAtIndex:allPoints:", v15 - 1, buf);
        if (v27 == (id)1)
        {
          y = *(double *)&buf[24];
          x = *(double *)&buf[16];
        }
        else if (v27)
        {
          v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237168);
          v35 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v62 = 67109890;
            v63 = v34;
            v64 = 2082;
            v65 = "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]";
            v66 = 2082;
            v67 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
            v68 = 1024;
            v69 = 1323;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We expect the node before a close path to be either a move or lineto.", v62, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237188);
          v36 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            v41 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)v62 = 67109378;
            v63 = v34;
            v64 = 2114;
            v65 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v62, 0x12u);

          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 1323, 0, "We expect the node before a close path to be either a move or lineto.");

        }
        else
        {
          x = *(double *)buf;
          y = *(double *)&buf[8];
        }
        v23 = y;
        v22 = x;
        goto LABEL_53;
      }
      if (v16 == 3)
      {
        v28 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012371A8);
        v29 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v28;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]";
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1329;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Can't begin a path with a close element.", buf, 0x22u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012371C8);
        v30 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v28;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v40;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 1329, 0, "Can't begin a path with a close element.");

      }
      v22 = CGPointZero.x;
      v23 = y;
LABEL_54:
      v39 = sub_10006108C(v22, v23, x, y);
      v24 = v14 + v39;
      if (v14 + v39 >= v13)
      {
        v54 = sub_1000603B8(x, y, v22);
        if (v39 > 0.0)
        {
          v55 = (v13 - v14) / v39;
          v54 = sub_1000603DC(v54, v53, v55);
        }
        v49 = sub_1000603D0(v22, v23, v54);
        v48 = v56;
        *a5 = v14;
        *a6 = v15;
        goto LABEL_77;
      }
LABEL_55:
      ++v15;
      v14 = v24;
      if (v10 == (char *)v15)
        goto LABEL_58;
    }
    v23 = *((double *)&v72 + 1);
    v22 = *(double *)&v72;
LABEL_53:
    y = *((double *)&v73 + 1);
    x = *(double *)&v73;
    goto LABEL_54;
  }
  v24 = *a5;
LABEL_58:
  if (v24 == v13 || vabdd_f64(v24, v13) < 0.00999999978)
  {
    v72 = xmmword_100EEC438;
    v73 = xmmword_100EEC438;
    v74 = xmmword_100EEC438;
    v75 = xmmword_100EEC438;
    v50 = objc_msgSend(v6, "elementAtIndex:allPoints:", v10 - 1, &v72);
    v51 = &v73;
    v52 = (double *)&v73 + 1;
    if (v50 != (id)1)
      v52 = (double *)&v72 + 1;
    v48 = *v52;
    if (v50 != (id)1)
      v51 = &v72;
    v49 = *(double *)v51;
    *a5 = v12;
    *a6 = (unint64_t)(v10 - 1);
  }
  else
  {
    *a5 = 0.0;
    *a6 = 0;
    v42 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012371E8);
    v43 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF96BC(v42, v43, v44, a3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237208);
    v45 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:]"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v47, 1374, 0, "Failed to find point at percentage: %f", *(_QWORD *)&a3);

    v49 = CGPointZero.x;
    v48 = CGPointZero.y;
  }
LABEL_77:

  v57 = v49;
  v58 = v48;
  result.y = v58;
  result.x = v57;
  return result;
}

- (void)iterateOverPathWithPointDistancePerIteration:(double)a3 usingBlock:(id)a4
{
  void (**v6)(_QWORD);
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;

  v6 = (void (**)(_QWORD))a4;
  if (-[CRLBezierPath elementCount](self, "elementCount") >= 1)
  {
    -[CRLBezierPath length](self, "length");
    v8 = v7;
    if (v7 == 0.0 || fabs(v7) < 0.00999999978)
    {
      -[CRLBezierPath currentPoint](self, "currentPoint");
      v6[2](v6);
      -[CRLBezierPath currentPoint](self, "currentPoint");
      v6[2](v6);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPath bezierPathByFlatteningPath](self, "bezierPathByFlatteningPath"));
      v12 = 0;
      v13 = 0;
      v10 = 0.0;
      v11 = a3 / v8;
      do
      {
        -[CRLBezierPath pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:](self, "pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:", v9, &v13, &v12, v10);
        v6[2](v6);
        v10 = v11 + v10;
      }
      while (v10 < 1.0);
      -[CRLBezierPath pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:](self, "pointAlongPathAtPercentage:withFlattenedPath:andLength:atStartIndex:", v9, &v13, &v12, 1.0);
      v6[2](v6);

    }
  }

}

- (BOOL)intersectsRect:(CGRect)a3 hasFill:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat MaxX;
  CGFloat v15;
  CGFloat MinX;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  char v32;
  BOOL v33;
  double v35;
  double v36;
  _QWORD v37[8];
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CRLBezierPath elementCount](self, "elementCount") < 2
    || (-[CRLBezierPath bounds](self, "bounds"), !sub_100060F38(v10, v11, v12, v13, x, y, width, height)))
  {
    v18 = 0;
LABEL_19:
    v33 = 0;
    goto LABEL_20;
  }
  if (!v4)
  {
LABEL_7:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPath bezierPathByFlatteningPath](self, "bezierPathByFlatteningPath"));
    v19 = CGPointZero.x;
    v20 = CGPointZero.y;
    v21 = (uint64_t)objc_msgSend(v18, "elementCount");
    if (v21 >= 1)
    {
      v22 = 0;
      v23 = v20;
      v24 = CGPointZero.x;
      do
      {
        v25 = objc_msgSend(v18, "elementAtIndex:associatedPoints:", v22, &v38);
        if (v25 == (id)3)
        {
          if ((sub_10006092C(v24, v23, v19, v20, x, y, width, height) & 1) != 0)
            goto LABEL_22;
        }
        else if (v25 == (id)1)
        {
          v35 = v20;
          v36 = v19;
          v26 = x;
          v27 = y;
          v28 = width;
          v29 = height;
          v30 = v38;
          v31 = v39;
          v32 = sub_10006092C(v24, v23, v38, v39, v26, v27, v28, v29);
          v24 = v30;
          height = v29;
          width = v28;
          y = v27;
          x = v26;
          v23 = v31;
          v20 = v35;
          v19 = v36;
          if ((v32 & 1) != 0)
            goto LABEL_22;
        }
        else if (!v25)
        {
          v24 = v38;
          v23 = v39;
          v19 = v38;
          v20 = v39;
        }
        ++v22;
      }
      while (v21 != v22);
    }
    goto LABEL_19;
  }
  *(double *)v37 = x;
  *(double *)&v37[1] = y;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MaxX = CGRectGetMaxX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  *(CGFloat *)&v37[2] = MaxX;
  v37[3] = CGRectGetMinY(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v15 = CGRectGetMaxX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  *(CGFloat *)&v37[4] = v15;
  v37[5] = CGRectGetMaxY(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MinX = CGRectGetMinX(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v17 = 0;
  *(CGFloat *)&v37[6] = MinX;
  v37[7] = CGRectGetMaxY(v45);
  while (!-[CRLBezierPath containsPoint:](self, "containsPoint:", *(double *)&v37[v17], *(double *)&v37[v17 + 1]))
  {
    v17 += 2;
    if (v17 == 8)
      goto LABEL_7;
  }
  v18 = 0;
LABEL_22:
  v33 = 1;
LABEL_20:

  return v33;
}

- (CGRect)boundsIncludingStrokeWidth:(double)a3 joinStyle:(unint64_t)a4 capStyle:(unint64_t)a5 miterLimit:(double)a6 needsToExtendJoins:(BOOL)a7
{
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v16;
  void *v17;
  void *v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CRLBezierPath *v31;
  const CGPath *v32;
  unsigned int v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  id v43;
  double v44[6];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect result;
  CGRect v49;
  CGRect v50;

  if (a3 < 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a4, a5, a7);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237228);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9868();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237248);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1476, 0, "lineWidth should not be negative.");

    if (!-[CRLBezierPath isEmpty](self, "isEmpty"))
      goto LABEL_23;
    goto LABEL_13;
  }
  v11 = a7;
  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237268);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF97E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237288);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1481, 0, "Can not calculate the stroked bounds of an empty path.");

    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    goto LABEL_24;
  }
  if (a3 == 0.0)
  {
LABEL_23:
    -[CRLBezierPath bounds](self, "bounds");
    x = v23;
    y = v24;
    width = v25;
    height = v26;
    goto LABEL_24;
  }
  v31 = objc_retainAutorelease(self);
  v32 = -[CRLBezierPath CGPath](v31, "CGPath");
  v33 = sub_1000D7994(a5);
  v34 = sub_1000D7994(a4);
  sub_1000C87AC(v32, v33, v34, a3, a6);
  x = v35;
  y = v36;
  width = v37;
  height = v38;
  if (v11)
  {
    v39 = -[CRLBezierPath elementCount](v31, "elementCount");
    if (v39 >= 1)
    {
      v40 = v39;
      v41 = 0;
      v42 = sqrt(a3 * 0.5 * a3);
      while (1)
      {
        v43 = -[CRLBezierPath elementAtIndex:associatedPoints:](v31, "elementAtIndex:associatedPoints:", v41, v44);
        if ((unint64_t)v43 < 2)
          break;
        if (v43 == (id)2)
        {
          v50.origin.x = v44[4] - v42;
          v50.origin.y = v44[5] - v42;
          v47.origin.x = x;
          v47.origin.y = y;
          v47.size.width = width;
          v47.size.height = height;
          v50.size.width = v42 + v42;
          v50.size.height = v42 + v42;
          v46 = CGRectUnion(v47, v50);
          goto LABEL_32;
        }
LABEL_33:
        if (v40 == ++v41)
          goto LABEL_24;
      }
      v49.origin.x = v44[0] - v42;
      v49.origin.y = v44[1] - v42;
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v49.size.width = v42 + v42;
      v49.size.height = v42 + v42;
      v46 = CGRectUnion(v45, v49);
LABEL_32:
      x = v46.origin.x;
      y = v46.origin.y;
      width = v46.size.width;
      height = v46.size.height;
      goto LABEL_33;
    }
  }
LABEL_24:
  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6 findClosestMatch:(BOOL)a7
{
  _BOOL4 v7;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int64_t v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  BOOL v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v47;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  char v59;
  double v60;
  double v62;
  double v63;
  double v65;
  double v66;
  CGPoint v67;
  __int128 v68;
  _OWORD v69[3];

  v7 = a7;
  y = a3.y;
  x = a3.x;
  if (a6 >= 1.79769313e308 && !a7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012372A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF98E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012372C8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1543, 0, "Should provide a threshold if not looking for the closest match.");

  }
  if (!-[CRLBezierPath containsElementsOtherThanMoveAndClose](self, "containsElementsOtherThanMoveAndClose"))
    return 1.79769313e308;
  -[CRLBezierPath controlPointBounds](self, "controlPointBounds");
  v21 = x + a6;
  if (x + a6 < v17)
    return 1.79769313e308;
  v22 = x - a6;
  if (x - a6 > v17 + v19)
    return 1.79769313e308;
  v23 = y - a6;
  v66 = y + a6;
  if (y + a6 < v18 || v23 > v18 + v20)
    return 1.79769313e308;
  v25 = -[CRLBezierPath elementCount](self, "elementCount");
  v26 = v25;
  v27 = 0;
  v68 = xmmword_100EEC438;
  v69[0] = xmmword_100EEC438;
  v69[1] = xmmword_100EEC438;
  v69[2] = xmmword_100EEC438;
  v67 = CGPointZero;
  v28 = a6 * a6;
  v29 = 1.79769313e308;
  v30 = a6 * a6 < 1.79769313e308;
  v31 = a6 * a6 < 1.79769313e308 || v7;
  v65 = 0.0;
  if (v25 && v31)
  {
    v27 = 0;
    v32 = 0;
    v65 = 0.0;
    v29 = 1.79769313e308;
    do
    {
      switch(-[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v32, &v68, *(_QWORD *)&v65))
      {
        case 0:
          v67 = (CGPoint)v68;
          goto LABEL_68;
        case 1:
          goto LABEL_58;
        case 2:
          v33 = 0;
          v34 = *((double *)&v68 + 1);
          v36 = *((double *)&v68 + 1);
          v35 = *(double *)&v68;
          v37 = *(double *)&v68;
          do
          {
            v39 = *(double *)&v69[v33];
            v38 = *((double *)&v69[v33] + 1);
            if (v39 > v35)
              v40 = *(double *)&v69[v33];
            else
              v40 = v35;
            if (v39 >= v37)
              v35 = v40;
            else
              v37 = *(double *)&v69[v33];
            if (v38 >= v36)
            {
              if (v38 > v34)
                v34 = *((double *)&v69[v33] + 1);
            }
            else
            {
              v36 = *((double *)&v69[v33] + 1);
            }
            ++v33;
          }
          while (v33 != 3);
          v41 = v35 - v37;
          v42 = v34 - v36;
          v43 = v37 + v35 - v37;
          if (v21 < v37 || v22 > v43 || v66 < v36 || v23 > v36 + v42)
            goto LABEL_68;
          sub_1000610BC(x, y, v37, v36, v41, v42);
          if (v47 > v28 || v47 >= v29)
            goto LABEL_68;
          v49 = sub_10031367C((float64x2_t *)&v68, x, y, 1.0);
          v50 = sub_1000602A8((float64x2_t *)&v68, v49);
          break;
        case 3:
          v69[0] = v67;
LABEL_58:
          v55 = sub_10005FDB0(*(double *)&v68, *((double *)&v68 + 1), *(double *)v69);
          if (v21 < v55 || v22 > v55 + v53 || v66 < v52 || v23 > v52 + v54)
            goto LABEL_68;
          sub_1000610BC(x, y, v55, v52, v53, v54);
          if (v60 > v28 || v60 >= v29)
            goto LABEL_68;
          v49 = sub_1003135C8((double *)&v68, x, y);
          v50 = sub_100061A8C(*(double *)&v68, *((double *)&v68 + 1), *(double *)v69, *((double *)v69 + 1), v49);
          break;
        default:
          goto LABEL_68;
      }
      v62 = sub_10006010C(v50, v51, x, y);
      v63 = v65;
      if (v62 < v29)
        v63 = v49;
      v65 = v63;
      if (v62 < v29)
      {
        v27 = v32;
        v29 = v62;
      }
LABEL_68:
      ++v32;
      v30 = v29 > v28;
      v59 = v29 > v28 || v7;
    }
    while (v32 < v26 && (v59 & 1) != 0);
  }
  if (v30)
    return 1.79769313e308;
  if (a4)
    *a4 = v27;
  if (a5)
    *a5 = v65;
  return sqrt(v29);
}

- (double)yValueFromXValue:(double)a3
{
  double result;

  -[CRLBezierPath p_yValueFromXValue:elementIndex:parametricValue:](self, "p_yValueFromXValue:elementIndex:parametricValue:", 0, 0, a3);
  return result;
}

- (double)p_yValueFromXValue:(double)a3 elementIndex:(int64_t *)a4 parametricValue:(double *)a5
{
  uint64_t v9;
  double x;
  double y;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  int64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  long double v34;
  unint64_t v35;
  int64_t v37;
  long double v38;
  double v39;
  long double v40;
  __double2 v41;
  double v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v9 = -[CRLBezierPath elementCount](self, "elementCount");
  x = CGPointZero.x;
  y = CGPointZero.y;
  v51 = xmmword_100EEC438;
  v52 = xmmword_100EEC438;
  v53 = xmmword_100EEC438;
  v12 = v9 - 1;
  if (v9 < 1)
    goto LABEL_5;
  v13 = v9;
  if (!-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, &v51))
  {
    x = *(double *)&v51;
    y = *((double *)&v51 + 1);
  }
  if (v13 == 1)
  {
LABEL_5:
    v14 = 1;
    v15 = x;
    v16 = y;
  }
  else
  {
    v14 = 1;
    while (1)
    {
      v15 = x;
      v16 = y;
      v35 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v14, &v51);
      if (v35 == 2)
      {
        y = *((double *)&v53 + 1);
        x = *(double *)&v53;
      }
      else if (v35 <= 1)
      {
        y = *((double *)&v51 + 1);
        x = *(double *)&v51;
      }
      if (v15 <= a3 && x >= a3)
        break;
      if (v13 == ++v14)
      {
        v14 = v13;
        break;
      }
    }
  }
  if (v15 == x)
    return y;
  if (v15 >= a3)
  {
    if (a4)
      *a4 = v14 - 1;
    if (a5)
      *a5 = 0.0;
  }
  else
  {
    if (x <= a3)
    {
      if (a4)
      {
        if (v12 >= v14)
          v37 = v14;
        else
          v37 = v12;
        *a4 = v37;
      }
      if (a5)
        *a5 = 1.0;
      return y;
    }
    if (a4)
    {
      if (v12 >= v14)
        v18 = v14;
      else
        v18 = v12;
      *a4 = v18;
    }
    v19 = *((double *)&v51 + 1);
    v50 = *((double *)&v52 + 1);
    v20 = x + *(double *)&v51 * 3.0 - v15 + *(double *)&v52 * -3.0;
    v21 = (*(double *)&v51 * -6.0 + v15 * 3.0 + *(double *)&v52 * 3.0) / v20;
    v22 = (*(double *)&v51 * 3.0 + v15 * -3.0) / v20;
    v23 = (v15 - a3) / v20;
    v24 = v23 + v21 * (v21 * (v21 + v21)) / 27.0 + v21 * v22 / -3.0;
    v25 = v24 * v24 * 0.25;
    v26 = (v22 + v21 * v21 / -3.0) * ((v22 + v21 * v21 / -3.0) * (v22 + v21 * v21 / -3.0)) / 27.0 + v25;
    if (v26 == 0.0 || fabs(v26) < 1.0e-12)
    {
      if (v23 >= 0.0)
        v34 = -pow(v23, 0.333333333);
      else
        v34 = pow(fabs(v23), 0.333333333);
    }
    else if (v26 <= 0.0)
    {
      v38 = sqrt(v25 - v26);
      v39 = pow(v38, 0.333333333);
      v40 = acos(-v24 / (v38 + v38));
      v41 = __sincos_stret(v40 / 3.0);
      v42 = v21 / -3.0;
      v34 = v21 / -3.0 + (v39 + v39) * v41.__cosval;
      if (v34 < 0.0 && vabdd_f64(0.0, v34) >= 1.0e-12
        || (v34 >= 1.0 ? (v43 = v34 == 1.0) : (v43 = 1), !v43 && fabs(v34 + -1.0) >= 1.0e-12))
      {
        if ((v34 = v42 - v39 * (v41.__cosval + v41.__sinval * 1.73205081), v34 < 0.0) && vabdd_f64(0.0, v34) >= 1.0e-12
          || (v34 >= 1.0 ? (v44 = v34 == 1.0) : (v44 = 1), !v44 && fabs(v34 + -1.0) >= 1.0e-12))
        {
          if ((v34 = v42 - v39 * (v41.__cosval - v41.__sinval * 1.73205081), v34 < 0.0)
            && vabdd_f64(0.0, v34) >= 1.0e-12
            || (v34 >= 1.0 ? (v45 = v34 == 1.0) : (v45 = 1), !v45 && fabs(v34 + -1.0) >= 1.0e-12))
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_1012372E8);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DF99E8();
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101237308);
            v46 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              sub_100DE7E60();
            }

            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) p_yValueFromXValue:elementIndex:parametricValue:]"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 1789, 0, "No valid roots!");

            v34 = 0.0;
          }
        }
      }
    }
    else
    {
      v27 = v24 * -0.5;
      v28 = sqrt(v26);
      v49 = *((double *)&v51 + 1);
      v29 = v24 * -0.5 + v28;
      v30 = pow(fabs(v29), 0.333333333);
      if (v29 <= 0.0)
        v31 = -v30;
      else
        v31 = v30;
      v32 = pow(vabdd_f64(v27, v28), 0.333333333);
      if (v27 - v28 <= 0.0)
        v32 = -v32;
      v33 = v31 + v32;
      v19 = v49;
      v34 = v33 + v21 / -3.0;
    }
    if (a5)
      *a5 = v34;
    return v16
         + (v19 * -6.0 + v16 * 3.0 + v50 * 3.0) * (v34 * v34)
         + v34 * (v34 * v34) * (y + v19 * 3.0 - v16 + v50 * -3.0)
         + v34 * (v19 * 3.0 + v16 * -3.0);
  }
  return v16;
}

- (void)addPathToContext:(CGContext *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  v5 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, &v8))
      {
        case 0:
          CGContextMoveToPoint(a3, v8, v9);
          break;
        case 1:
          CGContextAddLineToPoint(a3, v8, v9);
          break;
        case 2:
          CGContextAddCurveToPoint(a3, v8, v9, v10, v11, v12, v13);
          break;
        case 3:
          CGContextClosePath(a3);
          break;
        default:
          continue;
      }
    }
  }
}

- (void)clearStroke:(CGContext *)a3
{
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect v10;

  CGContextSaveGState(a3);
  -[CRLBezierPath flatness](self, "flatness");
  CGContextSetFlatness(a3, v5);
  CGContextBeginPath(a3);
  -[CRLBezierPath addPathToContext:](self, "addPathToContext:", a3);
  -[CRLBezierPath lineWidth](self, "lineWidth");
  CGContextSetLineWidth(a3, v6);
  CGContextReplacePathWithStrokedPath(a3);
  CGContextClip(a3);
  CGContextBeginPath(a3);
  -[CRLBezierPath lineWidth](self, "lineWidth");
  v8 = v7;
  -[CRLBezierPath bounds](self, "bounds");
  v10 = CGRectInset(v9, -(v8 + 10.0), -(v8 + 10.0));
  CGContextClearRect(a3, v10);
  CGContextRestoreGState(a3);
}

- (id)aliasedPathInContext:(CGContext *)a3 effectiveStrokeWidth:(float)a4
{
  double v4;
  double v5;

  *(float *)&v4 = a4;
  LODWORD(v5) = 1.0;
  return -[CRLBezierPath p_aliasedPathInContext:viewScale:effectiveStrokeWidth:](self, "p_aliasedPathInContext:viewScale:effectiveStrokeWidth:", a3, v5, v4);
}

- (id)aliasedPathWithViewScale:(float)a3 effectiveStrokeWidth:(float)a4
{
  return -[CRLBezierPath p_aliasedPathInContext:viewScale:effectiveStrokeWidth:](self, "p_aliasedPathInContext:viewScale:effectiveStrokeWidth:", 0);
}

- (id)p_aliasedPathInContext:(CGContext *)a3 viewScale:(float)a4 effectiveStrokeWidth:(float)a5
{
  uint64_t v8;
  double v9;
  CRLBezierPath *v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  double v15;
  double v16;
  int v17;
  CGFloat *p_c;
  double a;
  double b;
  double v21;
  double d;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double y;
  double x;
  double v41;
  double v42;
  double v43;
  double v44;
  double *v45;
  double v46;
  _BOOL4 v47;
  double v48;
  double v49;
  _BOOL4 v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGPoint v58;
  double v59;
  CGFloat v60;
  CGPoint v61;
  double v62;
  double v63;
  double v64;
  double v65;
  _BOOL4 v66;
  int v67;
  CGContextRef c;
  char *v69;
  int v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  CGPoint v75;
  CGAffineTransform v76;
  double v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  CGAffineTransform v83;
  __int128 v84;
  CGPoint v85;
  CGPoint v86;

  v8 = -[CRLBezierPath elementCount](self, "elementCount");
  v9 = sub_1003C65A0(a5);
  if (!v8)
    goto LABEL_6;
  v67 = (int)v9;
  if (vabds_f32((float)(int)v9, a5) > 0.1)
    goto LABEL_6;
  c = a3;
  if (a3)
  {
    memset(&v83, 0, sizeof(v83));
    CGContextGetUserSpaceToDeviceSpaceTransform(&v83, a3);
    v76 = v83;
    if (sub_100079384(&v76.a))
    {
      v66 = fabs(v83.a) < fabs(v83.b);
      goto LABEL_9;
    }
LABEL_6:
    v10 = self;
    return v10;
  }
  v66 = 0;
LABEL_9:
  v10 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  if (v8 >= 1)
  {
    v12 = 0;
    v73 = 0;
    v13 = 0;
    v70 = 0;
    v14 = 0;
    v69 = 0;
    v71 = 0;
    v65 = a4;
    v15 = (float)(1.0 / a4);
    v16 = 0.5;
    do
    {
      v17 = 0;
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v12, &v83.c))
      {
        case 0:
          -[CRLBezierPath moveToPoint:](v10, "moveToPoint:", v83.c, v83.d);
          v70 = 0;
          v13 = 0;
          v73 = 0;
          v69 = (char *)-[CRLBezierPath elementCount](v10, "elementCount") - 1;
          v14 = 1;
          p_c = &v83.c;
          v71 = v12;
          goto LABEL_45;
        case 1:
          goto LABEL_18;
        case 2:
          a = v83.a;
          b = v83.b;
          v21 = v83.c;
          d = v83.d;
          if (sub_10005FDF0(v83.a, v83.b, v83.c, v83.d)
            && sub_10005FDF0(a, b, v83.tx, v83.ty)
            && sub_10005FDF0(a, b, *(double *)&v84, *((double *)&v84 + 1)))
          {
            break;
          }
          -[CRLBezierPath currentPoint](v10, "currentPoint");
          v25 = sub_1000603B8(v23, v24, v83.a);
          v83.c = sub_1000603D0(v21, d, v25);
          v83.d = v26;
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](v10, "curveToPoint:controlPoint1:controlPoint2:", v84, v83.c, v26, v83.tx, v83.ty);
          v14 = 0;
          v73 = 0;
          p_c = (CGFloat *)&v84;
          goto LABEL_45;
        case 3:
          -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v71, &v83.c);
          v17 = 1;
LABEL_18:
          v72 = v14;
          v27 = v13;
          v29 = v83.a;
          v28 = v83.b;
          v31 = v83.c;
          v30 = v83.d;
          v32 = fabs(sub_1000603B8(v83.a, v83.b, v83.c));
          v34 = fabs(v33);
          v35 = v34 > v32 + v15 * -0.01 && v32 < v15;
          v36 = v32 > v34 + v15 * -0.01 && v34 < v15;
          if (v36 || v35)
          {
            if (v36 && v35)
            {
              v13 = v27;
              if ((v17 & (v27 | v70)) == 1)
              {
                -[CRLBezierPath elementAtIndex:associatedPoints:](v10, "elementAtIndex:associatedPoints:", v69, &v83.c);
              }
              else if ((id)-[CRLBezierPath elementAtIndex:associatedPoints:](v10, "elementAtIndex:associatedPoints:", (char *)-[CRLBezierPath elementCount](v10, "elementCount") - 1, &v83.c) == (id)2)
              {
                *(_OWORD *)&v83.c = v84;
              }
              v75 = *(CGPoint *)&v83.c;
              y = v83.d;
              x = v83.c;
            }
            else
            {
              if (c)
              {
                v85.x = v29;
                v85.y = v28;
                *(_QWORD *)&v37 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(c, v85);
                *(_QWORD *)&v38 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(c, *(CGPoint *)&v83.c);
              }
              else
              {
                v37 = sub_1000603DC(v29, v28, v65);
                v16 = 0.5;
                v38 = sub_1000603DC(v31, v30, v65);
              }
              v46 = v38;
              if (vabdd_f64(v37, v38) < 0.1)
                v46 = v37;
              if (v66)
                v47 = v35;
              else
                v47 = v36;
              if ((v67 & 1) != 0)
              {
                if (v66)
                  v50 = v36;
                else
                  v50 = v35;
                v49 = v37 + v16;
                v48 = v46 + v16;
                if (v50)
                {
                  BYTE4(v73) = 1;
                  v51 = v72;
                }
                else
                {
                  if ((v73 & 0x100000000) == 0)
                    v49 = v37;
                  v51 = v17 & v27;
                  if ((v17 & v27) == 0)
                    v48 = v46;
                }
                v27 = v51 | v27;
                if (v47)
                {
                  v70 |= v72;
                  LOBYTE(v73) = 1;
                }
              }
              else
              {
                v48 = v46;
                v49 = v37;
              }
              v52 = sub_10006305C(v49);
              v54 = v53;
              v56 = sub_10006305C(v48);
              v57 = v55;
              v75.x = v56;
              v75.y = v55;
              if ((v73 & 0x100000000) != 0)
              {
                v52 = v52 + -0.5;
                v56 = v56 + -0.5;
                v75.x = v56;
              }
              if ((v73 & 1) != 0)
              {
                v54 = v54 + -0.5;
                v57 = v55 + -0.5;
                v75.y = v55 + -0.5;
              }
              if (c)
              {
                v86.x = v52;
                v86.y = v54;
                v58 = CGContextConvertPointToUserSpace(c, v86);
                x = v58.x;
                y = v58.y;
                v61 = CGContextConvertPointToUserSpace(c, v75);
                v60 = v61.y;
                v59 = v61.x;
              }
              else
              {
                x = sub_1000603DC(v52, v54, v15);
                y = v62;
                v59 = sub_1000603DC(v56, v57, v15);
              }
              v16 = 0.5;
              v75.x = v59;
              v75.y = v60;
              if (v36)
              {
                v13 = v27;
                if ((v72 & 1) == 0)
                {
                  -[CRLBezierPath currentPoint](v10, "currentPoint");
                  x = v63;
                }
                if (v12 + 1 < v8 && -[CRLBezierPath elementAtIndex:](self, "elementAtIndex:"))
                  v75.x = v83.c;
              }
              else
              {
                v13 = v27;
                if (v35)
                {
                  if ((v72 & 1) == 0)
                  {
                    -[CRLBezierPath currentPoint](v10, "currentPoint");
                    y = v64;
                  }
                  if (v12 + 1 < v8 && -[CRLBezierPath elementAtIndex:](self, "elementAtIndex:"))
                    v75.y = v83.d;
                }
              }
            }
            if ((id)-[CRLBezierPath elementAtIndex:associatedPoints:](v10, "elementAtIndex:associatedPoints:", (char *)-[CRLBezierPath elementCount](v10, "elementCount") - 1, &v77) == (id)2)
            {
              v41 = v79;
              v42 = v80;
              v43 = sub_1000603B8(x, y, v81);
              v79 = sub_1000603D0(v41, v42, v43);
              v80 = v44;
              v81 = x;
              v45 = (double *)&v82;
            }
            else
            {
              v77 = x;
              v45 = (double *)&v78;
            }
            *v45 = y;
            -[CRLBezierPath setAssociatedPoints:atIndex:](v10, "setAssociatedPoints:atIndex:", &v77, (char *)-[CRLBezierPath elementCount](v10, "elementCount") - 1);
            if (v17)
            {
              -[CRLBezierPath setAssociatedPoints:atIndex:](v10, "setAssociatedPoints:atIndex:", &v75, v69);
              -[CRLBezierPath closePath](v10, "closePath");
            }
            else
            {
              -[CRLBezierPath lineToPoint:](v10, "lineToPoint:", v75);
            }
          }
          else
          {
            if (v17)
              -[CRLBezierPath closePath](v10, "closePath");
            else
              -[CRLBezierPath lineToPoint:](v10, "lineToPoint:", v31, v30);
            v13 = v27;
          }
          v14 = 0;
          p_c = &v83.c;
LABEL_45:
          *(_OWORD *)&v83.a = *(_OWORD *)p_c;
          break;
        default:
          break;
      }
      ++v12;
    }
    while (v8 != v12);
  }
  return v10;
}

- (void)alignBoundsToOrigin
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGAffineTransform v7;

  if (-[CRLBezierPath elementCount](self, "elementCount") >= 1)
  {
    -[CRLBezierPath bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    if (!sub_10005FDF0(CGPointZero.x, CGPointZero.y, v3, v5))
    {
      CGAffineTransformMakeTranslation(&v7, -v4, -v6);
      -[CRLBezierPath transformUsingAffineTransform:](self, "transformUsingAffineTransform:", &v7);
    }
  }
}

+ (id)appendBezierPaths:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator"));
  v6 = 0;
  while (1)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));

    if (!v7)
      break;
    v6 = (void *)v7;
    objc_msgSend(v4, "appendBezierPath:", v7);
  }

  return v4;
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(unint64_t)a6 startNewPath:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  NSObject *v34;
  void *v35;
  char *v36;
  char *v37;
  char *v38;
  CGFloat ty;
  CGFloat tyb;
  uint64_t tya;
  CGFloat tx;
  _BOOL4 v43;
  CGAffineTransform v45;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v48;
  uint8_t buf[4];
  unsigned int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v43 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  tx = CGRectGetMidX(a3);
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  ty = CGRectGetMidY(v60);
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v14 = CGRectGetWidth(v61) * 0.5;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v15 = CGRectGetHeight(v62) * 0.5;
  if (a6 == 1)
  {
    sub_10006226C(a4, v14, v15);
    v17 = v18;
    sub_10006226C(a4 + a5, v14, v15);
    v16 = v19;
  }
  else
  {
    if (a6)
      v16 = 0.0;
    else
      v16 = a4 + a5;
    if (a6)
      v17 = 0.0;
    else
      v17 = a4;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath", *(_QWORD *)&ty));
  objc_msgSend(v20, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v17 > v16, CGPointZero.x, CGPointZero.y, 1.0, v17, v16);
  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&t1, v14, v15);
  CGAffineTransformMakeTranslation(&t2, tx, tyb);
  CGAffineTransformConcat(&v48, &t1, &t2);
  v45 = v48;
  objc_msgSend(v20, "transformUsingAffineTransform:", &v45);
  v21 = (uint64_t)objc_msgSend(v20, "elementCount");
  if (v21 >= 1)
  {
    v22 = 0;
    tya = 67109378;
    do
    {
      v58 = 0u;
      v59 = 0u;
      v57 = 0u;
      switch((unint64_t)objc_msgSend(v20, "elementAtIndex:associatedPoints:", v22, &v57, tya))
      {
        case 0uLL:
          if (v22)
          {
            v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101237368);
            v24 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v50 = v23;
              v51 = 2082;
              v52 = "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleTy"
                    "pe:startNewPath:]";
              v53 = 2082;
              v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
              v55 = 1024;
              v56 = 2120;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Only the first element of the arc should be a moveto", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101237388);
            v25 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
            {
              v38 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = tya;
              v50 = v23;
              v51 = 2114;
              v52 = v38;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 2120, 0, "Only the first element of the arc should be a moveto");

          }
          if (v43)
            -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v57);
          else
            -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v57);
          break;
        case 1uLL:
          v28 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012373A8);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v50 = v28;
            v51 = 2082;
            v52 = "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]";
            v53 = 2082;
            v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
            v55 = 1024;
            v56 = 2128;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The arc shouldn't contain lineto elements", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012373C8);
          v30 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
          {
            v36 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = tya;
            v50 = v28;
            v51 = 2114;
            v52 = v36;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 2128, 0, "The arc shouldn't contain lineto elements");
          goto LABEL_43;
        case 2uLL:
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v59, v57, v58);
          break;
        case 3uLL:
          v33 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012373E8);
          v34 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v50 = v33;
            v51 = 2082;
            v52 = "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]";
            v53 = 2082;
            v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm";
            v55 = 1024;
            v56 = 2134;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The arc shouldn't contain close_subpath elements", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237408);
          v35 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
          {
            v37 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = tya;
            v50 = v33;
            v51 = 2114;
            v52 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 2134, 0, "The arc shouldn't contain close_subpath elements");
LABEL_43:

          break;
        default:
          break;
      }
      ++v22;
    }
    while (v21 != v22);
  }

}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(unint64_t)a6 startNewPath:(BOOL)a7
{
  _BOOL8 v7;
  double x;
  double v10;
  double v11;
  CGFloat height;
  double width;
  double v14;
  double v15;
  double MidX;
  double MidY;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double y;
  CGRect v26;

  v7 = a7;
  y = a5.y;
  x = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v14 = a3.origin.y;
  v15 = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v26.origin.x = v15;
  v26.origin.y = v14;
  v24 = height;
  v26.size.width = width;
  v26.size.height = height;
  MidY = CGRectGetMidY(v26);
  v19 = atan2(v10 - MidY, v11 - MidX) * 180.0 / 3.14159265;
  v20 = atan2(y - MidY, x - MidX) * 180.0 / 3.14159265;
  if (a6)
  {
    if (a6 == 1)
    {
      for (; v19 < v20; v19 = v19 + 360.0)
        ;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237428);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF9A68();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237448);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(CRLAdditions) appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPath_CRLAdditions.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 2157, 0, "Unexpected angle sign");

    }
  }
  else
  {
    for (; v20 < v19; v20 = v20 + 360.0)
      ;
  }
  -[CRLBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](self, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, v7, v15, v14, width, v24, v19, v20 - v19);
}

- (void)takeAttributesFromStroke:(id)a3
{
  unsigned int v4;
  double v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "supportsWidth");
  v5 = 0.0;
  if (v4)
    objc_msgSend(v7, "width", 0.0);
  -[CRLBezierPath setLineWidth:](self, "setLineWidth:", v5);
  if (objc_msgSend(v7, "supportsLineOptions"))
  {
    objc_msgSend(v7, "miterLimit");
    -[CRLBezierPath setMiterLimit:](self, "setMiterLimit:");
    -[CRLBezierPath setLineCapStyle:](self, "setLineCapStyle:", objc_msgSend(v7, "cap"));
    v6 = (uint64_t)objc_msgSend(v7, "join");
  }
  else
  {
    v6 = 1;
  }
  -[CRLBezierPath setLineJoinStyle:](self, "setLineJoinStyle:", v6);

}

- (CGRect)boundsIncludingCRLStroke:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  unsigned __int8 v28;
  BOOL v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD block[4];
  Block_layout *v38;
  CGRect v39;
  CGRect result;

  v4 = a3;
  if (-[CRLBezierPath isEmpty](self, "isEmpty"))
  {
LABEL_2:
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    goto LABEL_10;
  }
  if (!v4 || (objc_msgSend(v4, "shouldRender") & 1) == 0)
  {
    -[CRLBezierPath bounds](self, "bounds");
    x = v12;
    y = v13;
    width = v14;
    height = v15;
    goto LABEL_10;
  }
  *(_QWORD *)&v10 = objc_opt_class(v4, v9).n128_u64[0];
  if (objc_msgSend(v11, "requiresCustomBoundsMeasurement", v10))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002101A4;
    block[3] = &unk_10122D7E0;
    v38 = &stru_101245040;
    if (qword_101415078 != -1)
      dispatch_once(&qword_101415078, block);

    goto LABEL_2;
  }
  v20 = 0.0;
  if (objc_msgSend(v4, "supportsWidth"))
  {
    objc_msgSend(v4, "width");
    v20 = v21;
  }
  if (objc_msgSend(v4, "supportsLineOptions"))
  {
    v22 = objc_msgSend(v4, "join");
    v23 = objc_msgSend(v4, "cap");
    objc_msgSend(v4, "miterLimit");
  }
  else
  {
    v22 = +[CRLBezierPath defaultLineJoinStyle](CRLBezierPath, "defaultLineJoinStyle");
    v23 = +[CRLBezierPath defaultLineCapStyle](CRLBezierPath, "defaultLineCapStyle");
    +[CRLBezierPath defaultMiterLimit](CRLBezierPath, "defaultMiterLimit");
  }
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pattern"));
  v27 = objc_msgSend(v26, "count");

  v28 = objc_msgSend(v4, "needsToExtendJoinsForBoundsCalculation");
  if (v27)
    v29 = v23 == 0;
  else
    v29 = 1;
  v30 = !v29;
  if ((v28 & 1) != 0)
    v31 = 1;
  else
    v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathToStrokeFromCRLBezierPath:", self));
  objc_msgSend(v32, "boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:", v22, v23, v31, v20, v25);
  x = v33;
  y = v34;
  width = v35;
  height = v36;

  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  if (CGRectIsNull(v39))
    goto LABEL_2;
LABEL_10:

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ ($C03DF7238EFD9881545AA7BAA15E5874)p_makeDefaultPositioning
{
  retstr->var1 = CGPointZero;
  retstr->var0 = 1.57079633;
  retstr->var2 = -1;
  retstr->var3 = 0.0;
  return result;
}

+ (id)createClippedPath:(id)a3 headPositioning:(id *)a4 tailPositioning:(id *)a5 stroke:(id)a6
{
  CRLBezierPath *v9;
  CRLBezierPath *v10;
  double y;
  double x;
  int64_t var2;
  int64_t v14;
  CRLBezierPath *v15;
  double var0;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double var3;
  double v44;
  double v45;

  v9 = (CRLBezierPath *)a3;
  v10 = v9;
  x = a5->var1.x;
  y = a5->var1.y;
  var2 = a4->var2;
  v14 = a5->var2;
  if ((var2 & 0x8000000000000000) == 0 || (v15 = v9, (v14 & 0x8000000000000000) == 0))
  {
    var3 = a5->var3;
    v44 = a4->var3;
    var0 = a5->var0;
    v17 = a4->var1.x;
    v45 = a4->var1.y;
    v18 = a4->var0;
    v19 = a6;
    objc_msgSend(v19, "width");
    v21 = v20;
    v15 = objc_alloc_init(CRLBezierPath);

    objc_msgSend(v19, "lineEndInsetAdjustment");
    v23 = v22;

    v24 = sub_100061F64(var0 + 1.57079633);
    v41 = v23;
    v25 = v21 * v23;
    v27 = sub_1000603DC(v24, v26, v21 * v23);
    v28 = sub_1000603D0(x, y, v27);
    v30 = v29;
    v31 = sub_100061F64(v18 + 1.57079633);
    v33 = sub_1000603DC(v31, v32, v25);
    v34 = sub_1000603D0(v17, v45, v33);
    v36 = v35;
    if ((var2 < 0 || var2 >= v14) && (var2 != v14 || v44 >= var3))
    {
      if (v14 < 0)
      {
        -[CRLBezierPath moveToPoint:](v15, "moveToPoint:", x, y);
        v40 = var3;
        v39 = v44;
      }
      else
      {
        -[CRLBezierPath moveToPoint:](v15, "moveToPoint:", v28, v30);
        v38 = x == v28 && y == v30;
        v40 = var3;
        v39 = v44;
        if (!v38)
          -[CRLBezierPath lineToPoint:](v15, "lineToPoint:", x, y);
      }
      -[CRLBezierPath appendBezierPath:fromSegment:t:toSegment:t:withoutMove:](v15, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v10, v14, var2, 1, v40, v39, *(_QWORD *)&v41);
      if (var2 < 0 || v42 <= 0.0)
        goto LABEL_9;
    }
    else
    {
      -[CRLBezierPath moveToPoint:](v15, "moveToPoint:", v28, v30, *(_QWORD *)&v41);
    }
    -[CRLBezierPath lineToPoint:](v15, "lineToPoint:", v34, v36);
LABEL_9:

  }
  return v15;
}

+ ($C03DF7238EFD9881545AA7BAA15E5874)lineEndPositioningOnPath:(SEL)a3 atHead:(id)a4 headPoint:(BOOL)a5 tailPoint:(CGPoint)a6 headLineEnd:(CGPoint)a7 tailLineEnd:(id)a8 stroke:(id)a9
{
  double y;
  double x;
  double v15;
  double v16;
  _BOOL8 v17;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  $C03DF7238EFD9881545AA7BAA15E5874 *result;
  id v28;
  double MaxY;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  long double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  id v49;
  CGRect BoundingBox;

  y = a7.y;
  x = a7.x;
  v15 = a6.y;
  v16 = a6.x;
  v17 = a5;
  v49 = a4;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.y = 0u;
  retstr->var3 = 0.0;
  +[CRLBezierPath p_makeDefaultPositioning](CRLBezierPath, "p_makeDefaultPositioning");
  if (v17)
    v22 = v15;
  else
    v22 = y;
  if (v17)
    v23 = v16;
  else
    v23 = x;
  if (v17)
  {
    v24 = v19;
    if (!v19)
    {
LABEL_9:
      v25 = 0;
LABEL_13:
      retstr->var0 = 1.57079633;
      retstr->var1.x = v23;
      retstr->var1.y = v22;
      retstr->var2 = -1;
      retstr->var3 = 0.0;
      goto LABEL_14;
    }
  }
  else
  {
    v24 = v20;
    if (!v20)
      goto LABEL_9;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "strokeLineEnd:", v24));
  v25 = v26;
  if (!v26 || (objc_msgSend(v26, "isNone") & 1) != 0)
    goto LABEL_13;
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path")));
  BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v28, "CGPath"));
  MaxY = CGRectGetMaxY(BoundingBox);
  objc_msgSend(v25, "endPoint");
  v31 = MaxY - v30;

  if (!objc_msgSend(v25, "isFilled"))
    v31 = v31 + 0.75;
  objc_msgSend(v21, "width");
  objc_msgSend(v25, "scaleForStrokeWidth:");
  v33 = v32 * v31;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v23 - v33, v22 - v33, v33 + v33, v33 + v33));
  v35 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v49, "addIntersectionsWithPath:to:allIntersections:reversed:", v34, v35, 0, v17);
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "sortUsingSelector:", "compareSegmentAndT:");
    if (v17)
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastObject"));
    else
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndex:", 0));
    v37 = v36;
    objc_msgSend(v36, "point");
    x = v38;
    y = v39;
  }
  else
  {
    v37 = 0;
    if (!v17)
    {
      x = v16;
      y = v15;
    }
  }
  v40 = sub_1000603B8(v23, v22, x);
  retstr->var0 = sub_1000618B4(v40, v41) + -1.57079633;
  v42 = sub_1000603B8(x, y, v23);
  v44 = CGPointZero.x;
  if (v42 != CGPointZero.x || v43 != CGPointZero.y)
  {
    v45 = sub_100060398(v42, v43);
    v44 = sub_1000603DC(v45, v46, v33);
  }
  retstr->var1.x = sub_1000603D0(v23, v22, v44);
  retstr->var1.y = v47;
  if (v37)
  {
    retstr->var2 = (int64_t)objc_msgSend(v37, "segment");
    objc_msgSend(v37, "t");
  }
  else
  {
    retstr->var2 = 0;
    v48 = 0.0;
  }
  retstr->var3 = v48;

LABEL_14:
  return result;
}

- (id)labelForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  const __CFString *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  if (-[CRLBezierPath isOpen](self, "isOpen") || (id)-[CRLBezierPath elementCount](self, "elementCount") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Line");
    goto LABEL_15;
  }
  if (-[CRLBezierPath isRectangular](self, "isRectangular"))
  {
    v9 = -[CRLBezierPath p_equalWidthAndHeightForSize:](self, "p_equalWidthAndHeightForSize:", width, height);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v9)
      v8 = CFSTR("Square");
    else
      v8 = CFSTR("Rectangle");
LABEL_14:
    v6 = v7;
    goto LABEL_15;
  }
  if (-[CRLBezierPath isCircular](self, "isCircular"))
  {
    v10 = -[CRLBezierPath p_equalWidthAndHeightForSize:](self, "p_equalWidthAndHeightForSize:", width, height);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v10)
      v8 = CFSTR("Circle");
    else
      v8 = CFSTR("Oval");
    goto LABEL_14;
  }
  if (-[CRLBezierPath isTriangular](self, "isTriangular"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Triangle");
  }
  else
  {
    if (!-[CRLBezierPath isDiamond](self, "isDiamond"))
    {
      v11 = 0;
      return v11;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Diamond");
  }
LABEL_15:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, 0, 0));

  return v11;
}

- (BOOL)p_equalWidthAndHeightForSize:(CGSize)a3
{
  return vabdd_f64(a3.width, a3.height) < 0.00999999978 || a3.width == a3.height;
}

- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4
{
  int64_t v7;
  CGPoint *v8;
  _BYTE v9[32];
  uint64_t v10;

  -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, a3);
  v7 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", (char *)-[CRLBezierPath elementCount](self, "elementCount") - 1, v9);
  v8 = (CGPoint *)v9;
  if (v7 == 2)
    v8 = (CGPoint *)&v10;
  if (v7 == 3)
    v8 = a3;
  *a4 = *v8;
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  char *v45;
  char *v46;
  char *v47;
  void *v48;
  double v49;
  float64x2_t *v50;
  float64x2_t *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  id v55;
  uint64_t v57;
  uint64_t v58;
  CRLBezierPath *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  _OWORD v68[4];
  float64x2_t v69[4];

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v55 = objc_msgSend(v10, "count");
  v59 = self;
  v11 = -[CRLBezierPath elementCount](self, "elementCount");
  v12 = (uint64_t)objc_msgSend(v9, "elementCount");
  if (v11 < 2)
    goto LABEL_44;
  v13 = v12;
  if (v12 < 2)
    goto LABEL_44;
  if (v6)
    v14 = v11 - 1;
  else
    v14 = 0;
  if (v6)
    v15 = -1;
  else
    v15 = v11;
  v16 = -1;
  if (!v6)
    v16 = 1;
  v57 = v16;
  v58 = v15;
  while (2)
  {
    v17 = -[CRLBezierPath elementAtIndex:allPoints:](v59, "elementAtIndex:allPoints:", v14, &v64);
    if (!v17)
      goto LABEL_43;
    v18 = (uint64_t)v17;
    if (v17 == (id)2)
    {
      v19 = v64;
      v20 = v65;
      v21 = v66;
      if (sub_1000600B4(v64.f64[0], v64.f64[1], v65.f64[0], v65.f64[1], v66.f64[0], v66.f64[1])
        && (v22 = v67, sub_1000600B4(v20.f64[0], v20.f64[1], v21.f64[0], v21.f64[1], v67.f64[0], v67.f64[1]))
        && (v23 = sub_10005FDB0(v19.f64[0], v19.f64[1], v22.f64[0]),
            v25 = v24,
            v27 = v26,
            v29 = v28,
            sub_100060F8C(v20.f64[0], v20.f64[1], v23, v24, v26, v28))
        && sub_100060F8C(v21.f64[0], v21.f64[1], v23, v25, v27, v29))
      {
        v65 = v67;
        v18 = 1;
      }
      else
      {
        v18 = 2;
      }
    }
    v30 = 0;
    do
    {
      v31 = objc_msgSend(v9, "elementAtIndex:allPoints:", v30, &v60);
      if (!v31)
        goto LABEL_40;
      v32 = v31;
      if (v31 == (id)2)
      {
        v33 = v60;
        v34 = v61;
        v35 = v62;
        if (sub_1000600B4(*(double *)&v60, *((double *)&v60 + 1), *(double *)&v61, *((double *)&v61 + 1), *(double *)&v62, *((double *)&v62 + 1)))
        {
          v36 = v63;
          if (sub_1000600B4(*(double *)&v34, *((double *)&v34 + 1), *(double *)&v35, *((double *)&v35 + 1), *(double *)&v63, *((double *)&v63 + 1)))
          {
            v37 = sub_10005FDB0(*(double *)&v33, *((double *)&v33 + 1), *(double *)&v36);
            v39 = v38;
            v41 = v40;
            v43 = v42;
            if (sub_100060F8C(*(double *)&v34, *((double *)&v34 + 1), v37, v38, v40, v42)
              && sub_100060F8C(*(double *)&v35, *((double *)&v35 + 1), v37, v39, v41, v43))
            {
              v61 = v63;
              if (v18 == 2)
                goto LABEL_37;
              goto LABEL_39;
            }
          }
        }
      }
      if (v18 != 2)
      {
        if (v32 != (id)2)
        {
LABEL_39:
          sub_1003142AC(v64.f64, (double *)&v60, v14, v30, v10);
          goto LABEL_40;
        }
        v50 = (float64x2_t *)&v60;
        v51 = &v64;
        v52 = v30;
        v53 = v14;
        v54 = 1;
LABEL_38:
        sub_100313F90(v50->f64, v51->f64, v52, v53, v54, v10);
        goto LABEL_40;
      }
      if (v32 != (id)2)
      {
LABEL_37:
        v50 = &v64;
        v51 = (float64x2_t *)&v60;
        v52 = v14;
        v53 = v30;
        v54 = 0;
        goto LABEL_38;
      }
      v44 = v10;
      v45 = (char *)objc_msgSend(v44, "count");
      v69[0] = v64;
      v69[1] = v65;
      v69[2] = v66;
      v69[3] = v67;
      v68[0] = v60;
      v68[1] = v61;
      v68[2] = v62;
      v68[3] = v63;
      sub_100317D08(v69, (double *)v68, v14, v30, 0, v44, 1.0, 0.0, 1.0, 0.0);
      v46 = (char *)objc_msgSend(v44, "count");
      if ((uint64_t)v45 < (uint64_t)v46)
      {
        v47 = v46;
        do
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndex:", v45));
          objc_msgSend(v48, "t");
          objc_msgSend(v48, "setPoint:", sub_1000602A8(&v64, v49));

          ++v45;
        }
        while (v47 != v45);
      }

LABEL_40:
      ++v30;
    }
    while (v30 != v13);
    if (a5 || v55 >= objc_msgSend(v10, "count"))
    {
LABEL_43:
      v14 += v57;
      if (v14 == v58)
        break;
      continue;
    }
    break;
  }
LABEL_44:

}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4
{
  -[CRLBezierPath addIntersectionsWithPath:to:allIntersections:reversed:](self, "addIntersectionsWithPath:to:allIntersections:reversed:", a3, a4, 1, 0);
}

- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  uint64_t i;
  __int128 v10;
  CGPoint v11;
  __int128 v12;
  _OWORD v13[3];

  v6 = a4;
  v11 = CGPointZero;
  v7 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      switch(-[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v13, v11, v12))
      {
        case 0:
          v11 = (CGPoint)v13[0];
          v12 = v13[0];
          continue;
        case 1:
          goto LABEL_7;
        case 2:
          sub_100313F90((double *)&v12, &a3->x, i, -1, 0, v6);
          v10 = v13[2];
          goto LABEL_8;
        case 3:
          v13[0] = v11;
LABEL_7:
          sub_1003142AC((double *)&v12, &a3->x, i, -1, v6);
          v10 = v13[0];
LABEL_8:
          v12 = v10;
          break;
        default:
          continue;
      }
    }
  }

}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 toSegment:(int64_t)a5
{
  int64_t v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a4 < a5)
  {
    v6 = a4;
    do
    {
      switch((unint64_t)objc_msgSend(a3, "elementAtIndex:associatedPoints:", v6, &v9))
      {
        case 0uLL:
          -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
          break;
        case 1uLL:
          -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
          break;
        case 2uLL:
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
          break;
        case 3uLL:
          -[CRLBezierPath closePath](self, "closePath");
          break;
        default:
          break;
      }
      ++v6;
    }
    while (a5 != v6);
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 t:(double)a5 toSegment:(int64_t)a6 t:(double)a7 withoutMove:(BOOL)a8
{
  id v14;
  id v15;
  int64_t v16;
  _BOOL4 v18;
  int64_t v19;
  id v21;
  int64_t v22;
  int64_t v23;
  char v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float64x2_t v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v14 = a3;
  v15 = objc_msgSend(v14, "elementCount");
  v16 = (int64_t)v15;
  v18 = a4 < 1 || (uint64_t)v15 <= a4;
  if (v18)
    v19 = -1;
  else
    v19 = a4;
  if (a6 <= 0)
    a6 = (int64_t)v15 + 1;
  if (v19 != a6)
  {
    if (!v18)
    {
      switch((unint64_t)objc_msgSend(v14, "elementAtIndex:allPoints:", a4, &v34))
      {
        case 0uLL:
          if (!a8)
            -[CRLBezierPath moveToPoint:](self, "moveToPoint:", *(_OWORD *)&v34);
          break;
        case 1uLL:
        case 3uLL:
          if (!a8)
            -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
          -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v35, v36);
          break;
        case 2uLL:
          sub_100313400(&v34, (uint64_t)&v26, a5, 1.0);
          if (!a8)
            -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
          break;
        default:
          break;
      }
    }
    if (a6 >= v16)
      v22 = v16;
    else
      v22 = a6;
    v23 = v19 + 1;
    if (v23 < v22)
    {
      v24 = 0;
      do
      {
        switch((unint64_t)objc_msgSend(v14, "elementAtIndex:associatedPoints:", v23, &v34))
        {
          case 0uLL:
            -[CRLBezierPath moveToPoint:](self, "moveToPoint:", *(_OWORD *)&v34);
            goto LABEL_47;
          case 1uLL:
            -[CRLBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v34);
            break;
          case 2uLL:
            -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v37, v38, *(_OWORD *)&v34, v35, v36);
            break;
          case 3uLL:
            if ((v24 & 1) != 0)
            {
              -[CRLBezierPath closePath](self, "closePath");
LABEL_47:
              v24 = 1;
            }
            else
            {
              -[CRLBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v34);
              v24 = 0;
            }
            break;
          default:
            break;
        }
        ++v23;
      }
      while (v22 != v23);
    }
    if (a6 < 1 || a6 >= v16)
      goto LABEL_58;
    v25 = objc_msgSend(v14, "elementAtIndex:allPoints:", a6, &v34);
    if (v25 != (id)3)
    {
      if (v25 == (id)2)
      {
        sub_100313400(&v34, (uint64_t)&v26, 0.0, a7);
LABEL_57:
        -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
        goto LABEL_58;
      }
      if (v25 != (id)1)
        goto LABEL_58;
    }
LABEL_55:
    -[CRLBezierPath lineToPoint:](self, "lineToPoint:", v35 * a7 + v34.f64[0] * (1.0 - a7), v36 * a7 + v34.f64[1] * (1.0 - a7));
    goto LABEL_58;
  }
  if (a7 < a5 || v19 >= (uint64_t)v15)
    LOBYTE(v18) = 1;
  if (v18)
    goto LABEL_58;
  v21 = objc_msgSend(v14, "elementAtIndex:allPoints:", v19, &v34);
  if (v21 == (id)3)
    goto LABEL_22;
  if (v21 == (id)2)
  {
    sub_100313400(&v34, (uint64_t)&v26, a5, a7);
    if (!a8)
      -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
    goto LABEL_57;
  }
  if (v21 == (id)1)
  {
LABEL_22:
    if (!a8)
      -[CRLBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
    goto LABEL_55;
  }
LABEL_58:

}

- (id)copyFromSegment:(int)a3 t:(double)a4 toSegment:(int)a5 t:(double)a6
{
  Class v11;
  id v12;

  objc_opt_class(self, a2);
  v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", self, a3, a5, 0, a4, a6);
  objc_msgSend(v12, "setWindingRule:", -[CRLBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v12, "setLineCapStyle:", -[CRLBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v12, "setLineJoinStyle:", -[CRLBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[CRLBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(v12, "setLineWidth:");
  return v12;
}

- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2]
{
  double x;
  double y;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  double v10;
  int64_t v11;
  CGPoint v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint v25;
  float64x2_t v26;
  _OWORD v27[3];
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  v25 = CGPointZero;
  v7 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 3.40282347e38;
    while (1)
    {
      v11 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, v27);
      if (v11 == 2)
        break;
      if (v11 == 3)
      {
        v12 = v25;
LABEL_9:
        v27[0] = v12;
        v11 = 2;
      }
      v15 = a3[1].x;
      v14 = a3[1].y;
      v16 = v14 - a3->y;
      v17 = v15 - a3->x;
      v18 = v17 * v17 + v16 * v16;
      v19 = (float)(1.0 / sqrtf(v18));
      v20 = vabdd_f64(*((double *)v27 + 1) * -(v17 * v19) + v16 * v19 * *(double *)v27, v14 * -(v17 * v19) + v16 * v19 * v15);
      if (v20 < v10)
      {
        y = *((double *)v27 + 1);
        x = *(double *)v27;
        v10 = v20;
      }
      v26 = (float64x2_t)v27[0];
      if (!v11)
        v25 = (CGPoint)v27[0];
      if (v8 == ++v9)
        goto LABEL_15;
    }
    v23 = 0.0;
    v24 = 0.0;
    v13 = sub_100313798(&v26, &a3->x, (uint64_t)&v23);
    if (v13 < v10)
    {
      y = v24;
      x = v23;
      v10 = v13;
    }
    v12 = (CGPoint)v27[2];
    goto LABEL_9;
  }
LABEL_15:
  v21 = x;
  v22 = y;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2]
{
  double x;
  double y;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  int64_t v19;
  uint64_t v20;
  double v21;
  __int128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGPoint v32;
  float64x2_t v33;
  _OWORD v34[3];
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  v7 = a3[1].x;
  v8 = a3[1].y;
  v9 = a3->x;
  v32 = CGPointZero;
  v10 = -[CRLBezierPath elementCount](self, "elementCount");
  if (v10)
  {
    v11 = v10;
    v12 = sub_1000603B8(v7, v8, v9);
    v14 = sub_100060398(v12, v13);
    v16 = v15;
    v17 = 0;
    v18 = -2.0;
    do
    {
      v19 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v17, v34);
      v20 = v19;
      if (v19 == 2)
      {
        v30 = 0.0;
        v31 = 0.0;
        v21 = sub_100314CCC(&v33, &a3->x, (uint64_t)&v30);
        if (v21 > v18)
        {
          v18 = v21;
          y = v31;
          x = v30;
        }
        v34[0] = v34[2];
      }
      else if (v19 == 3)
      {
        v34[0] = v32;
        v20 = 2;
      }
      v22 = v34[0];
      v23 = sub_1000603B8(*(double *)v34, *((double *)v34 + 1), a3->x);
      v25 = sub_100060398(v23, v24);
      v27 = sub_1000603C4(v14, v16, v25, v26);
      if (v27 > v18)
      {
        v18 = v27;
        y = *((double *)&v22 + 1);
        x = *(double *)&v22;
      }
      v33 = (float64x2_t)v34[0];
      if (!v20)
        v32 = (CGPoint)v34[0];
      ++v17;
    }
    while (v11 != v17);
  }
  v28 = x;
  v29 = y;
  result.y = v29;
  result.x = v28;
  return result;
}

- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4
{
  return -[CRLBezierPath elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:](self, "elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:", a3, 0, a4, 0.0);
}

- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4 startingElementIndex:(int64_t)a5 lengthToStartingElement:(double)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v25;
  double v26;

  -[CRLBezierPath length](self, "length");
  if (v11 <= 0.0 || (v12 = v11, -[CRLBezierPath elementCount](self, "elementCount") <= 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251170);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1FC50();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251190);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1254, 0, "Can't calculate a percentage of a path with no length or elements.");

    a5 = 0;
    v23 = 0.0;
  }
  else
  {
    v13 = v12 * a4;
    if (a4 <= 0.0)
    {
      if (-[CRLBezierPath elementCount](self, "elementCount") < 1)
      {
        a5 = 0;
      }
      else
      {
        a5 = 0;
        do
        {
          -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", a5);
          if (v25 > 0.0)
            break;
          ++a5;
        }
        while (a5 < -[CRLBezierPath elementCount](self, "elementCount"));
      }
      -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", a5);
      v23 = v13 / v26;
    }
    else
    {
      v14 = v13 - a6;
      v15 = -[CRLBezierPath elementCount](self, "elementCount");
      if (v15 <= a5)
      {
        do
        {
LABEL_7:
          if (v15-- < 1)
            break;
          -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", v15);
        }
        while (v18 <= 0.0);
        -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", v15);
        v19 = v14 + v16;
        a5 = v15;
      }
      else
      {
        while (1)
        {
          -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", a5);
          v14 = v14 - v16;
          if (v14 < 0.0)
            break;
          if (v15 == ++a5)
            goto LABEL_7;
        }
        v19 = v16 + v14;
      }
      v23 = v19 / v16;
    }
  }
  *a3 = v23;
  return a5;
}

- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4
{
  CGPoint v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double y;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  CGPoint result;

  switch(-[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v22))
  {
    case 0:
      v6 = (CGPoint)v22;
      break;
    case 1:
    case 3:
      v6 = (CGPoint)vmlaq_n_f64(vmulq_n_f64(v23, a3), v22, 1.0 - a3);
      break;
    case 2:
      if (a3 >= 0.0)
      {
        if (a3 <= 1.0)
        {
          __asm { FMOV            V4.2D, #3.0 }
          v6 = (CGPoint)vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(v23, _Q4), a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v22, 1.0 - a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(vmulq_f64(v24, _Q4), a3), a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v25, a3), a3), a3);
          break;
        }
        -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, a3);
        v9 = sub_1000603DC(v12, v13, a3 + -1.0);
        v11 = v25.f64[1];
        v10 = v25.f64[0];
      }
      else
      {
        -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, a3);
        v9 = sub_1000603DC(v7, v8, a3);
        v11 = v22.f64[1];
        v10 = v22.f64[0];
      }
      v6.x = sub_1000603D0(v10, v11, v9);
      v6.y = v14;
      break;
    default:
      v6 = CGPointZero;
      break;
  }
  y = v6.y;
  result.x = v6.x;
  result.y = y;
  return result;
}

- (CGPoint)pointAt:(double)a3
{
  double v5;
  int64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGPoint result;

  -[CRLBezierPath length](self, "length");
  if (v5 <= 0.0)
  {
    if (-[CRLBezierPath isEmpty](self, "isEmpty"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012511F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1FD50();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251210);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) pointAt:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1343, 0, "Can't get a point on an empty path.");

      v7 = INFINITY;
      v8 = INFINITY;
    }
    else
    {
      -[CRLBezierPath currentPoint](self, "currentPoint");
    }
  }
  else
  {
    v12 = 0.0;
    v6 = -[CRLBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v12, a3);
    -[CRLBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", v6, v12);
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, a3);
  v6 = sub_100060398(v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)gradientAt:(double)a3
{
  int64_t v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v7 = 0.0;
  v4 = -[CRLBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v7, a3);
  -[CRLBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", v4, v7);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 getElement:(int64_t *)a6 getPercentage:(double *)a7
{
  double y;
  double x;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v29 = 0.0;
  v14 = -[CRLBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v29);
  if (v14 >= a4)
  {
    if (v14 <= a5)
    {
      a4 = v14;
    }
    else
    {
      -[CRLBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a5, x);
      v29 = v16;
      a4 = a5;
    }
  }
  else
  {
    -[CRLBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a4, x);
    v29 = v15;
  }
  -[CRLBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", a4);
  v18 = v17;
  v20 = v19;
  -[CRLBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", a4, v29);
  v22 = v21;
  v24 = v23;
  -[CRLBezierPath lineWidth](self, "lineWidth");
  v26 = y * v25;
  v27 = v18 - v24 * (y * v25);
  v28 = v20 + v22 * v26;
  *a6 = a4;
  *a7 = v29;
  result.y = v28;
  result.x = v27;
  return result;
}

- (double)elementPercentageFromElement:(int64_t)a3 forOverallPercentage:(double)a4
{
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  -[CRLBezierPath length](self, "length");
  v8 = v7;
  if (a3 < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
      v10 = v10 + v11;
      ++v9;
    }
    while (a3 != v9);
  }
  -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", a3);
  return (v8 * a4 - v10) / v12;
}

- (CGPoint)rawGradientAt:(double)a3 fromElement:(int64_t)a4
{
  float64x2_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v17;
  CGPoint v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  CGPoint result;

  v18 = CGPointZero;
  switch(-[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v19))
  {
    case 0:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251230);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1FDD0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251250);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) rawGradientAt:fromElement:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1428, 0, "-rawGradientAt:fromElement: can't handle move to.");

      goto LABEL_12;
    case 1:
    case 3:
      v5 = vsubq_f64(v20, v19);
      break;
    case 2:
      v9 = 0.0001;
      if (a3 >= 0.0001)
        v9 = a3;
      if (v9 <= 0.9999)
        v10 = v9;
      else
        v10 = 0.9999;
      __asm
      {
        FMOV            V4.2D, #-3.0
        FMOV            V5.2D, #3.0
      }
      v5 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_f64(v20, _Q5), v10 * -4.0 + 1.0 + v10 * 3.0 * v10), vmulq_n_f64(vmulq_f64(v19, _Q4), v10 + -1.0), v10 + -1.0), vmulq_n_f64(vmulq_f64(v21, _Q5), v10), v10 * -3.0 + 2.0), vmulq_n_f64(vmulq_f64(v22, _Q5), v10), v10);
      break;
    default:
LABEL_12:
      v5 = (float64x2_t)v18;
      break;
  }
  v17 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v17;
  return result;
}

- (CGPoint)myGradientAt:(double)a3
{
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v14 = 0.0;
  v4 = -[CRLBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v14, a3);
  -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v4, v14);
  v6 = v5;
  v8 = v7;
  -[CRLBezierPath length](self, "length");
  v10 = v9;
  -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", v4);
  v12 = sub_1000603DC(v6, v8, v10 / v11);
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)myGradientAt:(double)a3 fromElement:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a3);
  v7 = v6;
  v9 = v8;
  -[CRLBezierPath length](self, "length");
  v11 = v10;
  -[CRLBezierPath lengthOfElement:](self, "lengthOfElement:", a4);
  v13 = sub_1000603DC(v7, v9, v11 / v12);
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)curvatureAt:(double)a3
{
  int64_t v4;
  double v5;
  double v6;
  double v8;

  v8 = 0.0;
  v4 = -[CRLBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v8, a3);
  -[CRLBezierPath curvatureAt:fromElement:](self, "curvatureAt:fromElement:", v4, v8);
  v6 = -0.5;
  if (v5 >= -0.5)
    v6 = v5;
  if (v5 <= 0.5)
    return v6;
  else
    return 0.5;
}

- (double)curvatureAt:(double)a3 fromElement:(int64_t)a4
{
  int64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v5 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v15);
  if (v5 == 2)
  {
    v10 = 0.01;
    if (a3 >= 0.01)
      v10 = a3;
    if (v10 > 0.99)
      v10 = 0.99;
    v11 = (v10 * (v10 * (v21 - v19) + (1.0 - v10) * (v19 - v17))
         + (1.0 - v10) * (v10 * (v19 - v17) + (1.0 - v10) * (v17 - v15)))
        * 3.0;
    v12 = (v10 * (v10 * (v22 - v20) + (1.0 - v10) * (v20 - v18))
         + (1.0 - v10) * (v10 * (v20 - v18) + (1.0 - v10) * (v18 - v16)))
        * 3.0;
    v13 = v11 * ((v10 * (v22 - v20 - (v20 - v18)) + (1.0 - v10) * (v20 - v18 - (v18 - v16))) * 6.0)
        - v12 * ((v10 * (v21 - v19 - (v19 - v17)) + (1.0 - v10) * (v19 - v17 - (v17 - v15))) * 6.0);
    return v13 / pow(v12 * v12 + v11 * v11, 1.5);
  }
  else
  {
    v6 = 0.0;
    if (!v5)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251270);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1FE50();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251290);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) curvatureAt:fromElement:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1479, 0, "-curvatureAt:fromElement: can't handle move to.");

    }
  }
  return v6;
}

- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CRLBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v7, 0, (char *)objc_msgSend(v7, "elementCount") - 1, v6, 0.0, 1.0);

}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a5;
  v10 = a3;
  -[CRLBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v10, 0, (char *)objc_msgSend(v10, "elementCount") - 1, v9, var0, var1);

}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  double var1;
  double var0;
  id v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSString *v20;
  void *v21;
  CRLPathCut *v22;
  double v23;
  double v24;
  double v25;
  CRLPathCut *v26;
  double v27;
  NSUInteger v28;
  NSUInteger v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  long double v57;
  CRLPathCut *v58;
  double v59;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CRLPathCut *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CRLPathCut *v72;
  uint64_t v73;
  BOOL v74;
  int64_t v75;
  BOOL v76;
  int64_t v77;
  CGPoint v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  NSObject *v88;
  NSString *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  __int128 v95;
  __int128 v96;
  CGPoint v97;
  _BYTE buf[64];
  NSRange v99;
  NSRange v100;

  length = a5.length;
  location = a5.location;
  var1 = a4.var1;
  var0 = a4.var0;
  v12 = a3;
  v13 = a6;
  if ((objc_msgSend(v12, "isEmpty") & 1) == 0 && length)
  {
    v14 = location + length;
    if (location + length <= (unint64_t)objc_msgSend(v12, "elementCount"))
    {
      v92 = var0;
      v93 = var1;
      v18 = objc_alloc_init((Class)NSMutableArray);
      v22 = [CRLPathCut alloc];
      objc_msgSend(v12, "lengthToElement:", location);
      v24 = v23;
      objc_msgSend(v12, "length");
      v26 = -[CRLPathCut initWithSegment:atT:withSkew:](v22, "initWithSegment:atT:withSkew:", location, v24 / v25, 0.0);
      objc_msgSend(v18, "addObject:", v26);

      objc_msgSend(v12, "miterLimit");
      v28 = location + 1;
      if (v28 < v14)
      {
        v91 = v27 * 0.995;
        v29 = length - 1;
        do
        {
          v30 = v28 + 1;
          objc_msgSend(v12, "lengthOfElement:", v28 + 1);
          if (v31 >= 0.1)
          {
            objc_msgSend(v12, "lengthOfElement:", v28);
            if (v32 >= 0.1)
            {
              objc_msgSend(v12, "gradientAt:fromElement:", v28, 1.0);
              v35 = sub_100060398(v33, v34);
              v37 = v36;
              objc_msgSend(v12, "gradientAt:fromElement:", v28 + 1, 0.0);
              v40 = sub_100060398(v38, v39);
              v42 = v41;
              v43 = sub_1000603C4(v35, v37, v40, v41);
              if (v43 < 0.99)
              {
                v44 = v43;
                objc_msgSend(v12, "lengthToElement:", v28 + 1);
                v94 = v45;
                objc_msgSend(v12, "length");
                v47 = v46;
                v48 = 0.0;
                if (v30 < v14)
                {
                  v49 = sub_1000603DC(v40, v42, -1.0);
                  v50 = sub_1000603D0(v35, v37, v49);
                  v52 = v51;
                  v53 = -sub_1000603C4(v35, v37, v50, v51);
                  v54 = sub_10006200C(0, v35, v37);
                  v56 = v53 / sub_1000603C4(v50, v52, v54, v55);
                  v57 = acos(fmin(fmax(-v44, -1.0), 1.0));
                  if (1.0 / sin(v57 * 0.5) <= v91)
                    v48 = v56;
                  else
                    v48 = 0.0;
                }
                v58 = -[CRLPathCut initWithSegment:atT:withSkew:]([CRLPathCut alloc], "initWithSegment:atT:withSkew:", v28, v94 / v47, v48);
                objc_msgSend(v18, "addObject:", v58);

              }
            }
          }
          v28 = v30;
          --v29;
        }
        while (v29);
      }
      if (v14 < 1)
      {
LABEL_29:
        objc_msgSend(v12, "lengthToElement:", v14);
        v62 = v61;
        objc_msgSend(v12, "lengthOfElement:", v14);
        v64 = v62 + v63;
        objc_msgSend(v12, "length");
        v66 = -[CRLPathCut initWithSegment:atT:withSkew:]([CRLPathCut alloc], "initWithSegment:atT:withSkew:", v14, v64 / v65, 0.0);
        objc_msgSend(v18, "addObject:", v66);

      }
      else
      {
        while (1)
        {
          objc_msgSend(v12, "lengthOfElement:", v14);
          if (v59 >= 0.1)
            break;
          if (v14-- <= 1)
          {
            v14 = 0;
            goto LABEL_29;
          }
        }
        objc_msgSend(v12, "lengthToElement:", v14);
        v68 = v67;
        objc_msgSend(v12, "lengthOfElement:", v14);
        v70 = v68 + v69;
        objc_msgSend(v12, "length");
        v72 = -[CRLPathCut initWithSegment:atT:withSkew:]([CRLPathCut alloc], "initWithSegment:atT:withSkew:", v14, v70 / v71, 0.0);
        objc_msgSend(v18, "addObject:", v72);

        *(_OWORD *)buf = xmmword_100EEC438;
        *(_OWORD *)&buf[16] = xmmword_100EEC438;
        *(_OWORD *)&buf[32] = xmmword_100EEC438;
        *(_OWORD *)&buf[48] = xmmword_100EEC438;
        v97 = CGPointZero;
        if (-[CRLBezierPath elementCount](self, "elementCount") >= 1)
        {
          v73 = 0;
          v74 = 0;
          do
          {
            v75 = -[CRLBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v73, &buf[16]);
            v76 = v75 == 0;
            if (v75)
            {
              v77 = v75;
              if (v75 == 2)
              {
                *(double *)&buf[16] = v92 + *(double *)&buf[16] * v93;
                *(double *)&buf[32] = v92 + *(double *)&buf[32] * v93;
                *(double *)&buf[48] = v92 + *(double *)&buf[48] * v93;
                v95 = *(_OWORD *)&buf[48];
                sub_10031646C((float64x2_t *)buf, v12, v13, v74, v18);
                *(_OWORD *)buf = v95;
              }
              else
              {
                if (v75 == 3)
                {
                  *(CGPoint *)&buf[16] = v97;
                  v78 = v97;
                }
                else
                {
                  v78.x = v92 + *(double *)&buf[16] * v93;
                  *(double *)&buf[16] = v78.x;
                }
                v79 = *(double *)buf;
                v80 = *(double *)&buf[8];
                v81 = sub_1000603B8(v78.x, *(double *)&buf[24], *(double *)buf);
                v83 = v82;
                *(_OWORD *)&buf[48] = *(_OWORD *)&buf[16];
                v84 = sub_1000603DC(v81, v82, 0.33);
                *(_QWORD *)&buf[16] = sub_1000603D0(v79, v80, v84);
                *(_QWORD *)&buf[24] = v85;
                v86 = sub_1000603DC(v81, v83, 0.66);
                *(_QWORD *)&buf[32] = sub_1000603D0(v79, v80, v86);
                *(_QWORD *)&buf[40] = v87;
                v96 = *(_OWORD *)&buf[48];
                sub_10031646C((float64x2_t *)buf, v12, v13, v74, v18);
                *(_OWORD *)buf = v96;
                if (v77 == 3)
                  objc_msgSend(v13, "closePath");
              }
            }
            else
            {
              *(double *)&buf[16] = v92 + *(double *)&buf[16] * v93;
              v97 = *(CGPoint *)&buf[16];
              *(_OWORD *)buf = *(_OWORD *)&buf[16];
            }
            ++v73;
            v74 = v76;
          }
          while (v73 < -[CRLBezierPath elementCount](self, "elementCount"));
        }
      }
    }
    else
    {
      v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012512B0);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v88 = v16;
        v100.location = location;
        v100.length = length;
        v89 = NSStringFromRange(v100);
        v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v15;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "-[CRLBezierPath(Distortion) recursiveSubdivideOntoPath:withScaling:inElementRange:into:]";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 1717;
        *(_WORD *)&buf[34] = 2112;
        *(_QWORD *)&buf[36] = v90;
        *(_WORD *)&buf[44] = 2048;
        *(_QWORD *)&buf[46] = objc_msgSend(v12, "elementCount");
        _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Asked to recursively subdivide using a range (%@) beyond the end of a path with element count %zd", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012512D0);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPath(Distortion) recursiveSubdivideOntoPath:withScaling:inElementRange:into:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPathDistortion.m"));
      v99.location = location;
      v99.length = length;
      v20 = NSStringFromRange(v99);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1717, 0, "Asked to recursively subdivide using a range (%@) beyond the end of a path with element count %zd", v21, objc_msgSend(v12, "elementCount"));

    }
  }

}

- (id)chisel
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  double v10;
  double v11;
  BOOL v12;
  int64_t v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  int64_t v47;
  BOOL v48;
  int64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v78;
  double v79;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  float64x2_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  -[CRLBezierPath lineWidth](self, "lineWidth");
  v5 = v4 * 0.5;
  v6 = -[CRLBezierPath elementCount](self, "elementCount");
  if (!v6)
  {
    v9 = 1;
    v43 = -1;
    goto LABEL_60;
  }
  v7 = v6;
  v8 = 0;
  v9 = 1;
  v10 = 9.0;
  v11 = -9.0;
  do
  {
    v12 = v9;
    v13 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v8, &v89);
    v9 = v13 == 0;
    if (!v13)
      goto LABEL_56;
    v14 = v13;
    -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, 0.0);
    if (v15 <= 0.0)
      v16 = -v5;
    else
      v16 = v5;
    if (v14 == 2)
    {
      v17 = v90 * v10 + v89.f64[0] * -3.0 + v92 * v11 + v94 * 3.0;
      v18 = v90 * -12.0 + v89.f64[0] * 6.0 + v92 * 6.0;
      v19 = v90 * 3.0 + v89.f64[0] * -3.0;
      v20 = v19 * (v17 * -4.0) + v18 * v18;
      if (v20 <= 0.0)
      {
        v31 = v16 + v89.f64[1];
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v89.f64[0], v31);
        else
          objc_msgSend(v3, "lineToPoint:", v89.f64[0], v31);
        v33 = v94;
        v34 = v16 + v95;
        v35 = v90;
        v36 = v16 + v91;
        v37 = v92;
        v38 = v93;
        goto LABEL_55;
      }
      v21 = v20;
      v22 = sqrtf(v21);
      v23 = (-v18 - v22) / (v17 + v17);
      v24 = (v22 - v18) / (v17 + v17);
      if (v24 >= v23)
        v25 = v24;
      else
        v25 = v23;
      if (v24 < v23)
        v23 = v24;
      v26 = fabs(v17);
      if (v26 <= 0.001)
        v27 = 10.0;
      else
        v27 = v25;
      if (v26 <= 0.001)
        v28 = -v19 / v18;
      else
        v28 = v23;
      if (v28 > 0.0 && v28 < 1.0)
      {
        sub_100313400(&v89, (uint64_t)&v81, 0.0, v28);
        v32 = v16 + v82;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v81, v32);
        else
          objc_msgSend(v3, "lineToPoint:", v81, v32);
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v87, v16 + v88, v83, v16 + v84, v85, v16 + v86);
        -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v28 + 0.01);
        v12 = 0;
        if (v39 <= 0.0)
          v16 = -v5;
        else
          v16 = v5;
      }
      else
      {
        v28 = 0.0;
      }
      if (v27 > 0.0 && v27 < 1.0)
      {
        sub_100313400(&v89, (uint64_t)&v81, v28, v27);
        v41 = v16 + v82;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v81, v41);
        else
          objc_msgSend(v3, "lineToPoint:", v81, v41);
        v10 = 9.0;
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v87, v16 + v88, v83, v16 + v84, v85, v16 + v86);
        -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v27 + 0.01);
        if (v42 <= 0.0)
          v16 = -v5;
        else
          v16 = v5;
        sub_100313400(&v89, (uint64_t)&v81, v27, 1.0);
      }
      else
      {
        sub_100313400(&v89, (uint64_t)&v81, v28, 1.0);
        if (v12)
        {
          objc_msgSend(v3, "moveToPoint:", v81, v16 + v82);
          v10 = 9.0;
          v11 = -9.0;
LABEL_54:
          v33 = v87;
          v34 = v16 + v88;
          v35 = v83;
          v36 = v16 + v84;
          v37 = v85;
          v38 = v86;
LABEL_55:
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v33, v34, v35, v36, v37, v16 + v38);
          goto LABEL_56;
        }
        v10 = 9.0;
      }
      v11 = -9.0;
      objc_msgSend(v3, "lineToPoint:", v81, v16 + v82);
      goto LABEL_54;
    }
    v30 = v16 + v89.f64[1];
    if (v12)
      objc_msgSend(v3, "moveToPoint:", v89.f64[0], v30);
    else
      objc_msgSend(v3, "lineToPoint:", v89.f64[0], v30);
    objc_msgSend(v3, "lineToPoint:", v90, v16 + v91);
LABEL_56:
    ++v8;
  }
  while (v7 != v8);
  v43 = v7 - 1;
  if (v43)
  {
LABEL_60:
    if (CGPointZero.x >= 0.0)
      v44 = -v5;
    else
      v44 = v5;
    v45 = 9.0;
    v46 = -3.0;
    do
    {
      v47 = -[CRLBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v43, &v89);
      v48 = v47 == 0;
      if (v47)
      {
        v49 = v47;
        -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v43, 1.0);
        if (v50 >= 0.0)
          v51 = -v5;
        else
          v51 = v5;
        if (v49 == 2)
        {
          v52 = v90 * v45 + v89.f64[0] * v46 + v92 * -9.0 + v94 * 3.0;
          v53 = v90 * -12.0 + v89.f64[0] * 6.0 + v92 * 6.0;
          v54 = v90 * 3.0 + v89.f64[0] * v46;
          v55 = v54 * (v52 * -4.0) + v53 * v53;
          if (v55 <= 0.0)
          {
            v68 = v51 + v95;
            if (v9)
              objc_msgSend(v3, "moveToPoint:", v94, v68);
            else
              objc_msgSend(v3, "lineToPoint:", v94, v68);
            v70 = v89.f64[0];
            v71 = v51 + v89.f64[1];
            v72 = v92;
            v73 = v51 + v93;
            v74 = v90;
            v75 = v91;
          }
          else
          {
            v56 = v55;
            v57 = sqrtf(v56);
            v58 = (-v53 - v57) / (v52 + v52);
            v59 = (v57 - v53) / (v52 + v52);
            if (v59 <= v58)
              v60 = v59;
            else
              v60 = v58;
            if (v59 > v58)
              v58 = v59;
            v61 = fabs(v52);
            if (v61 <= 0.001)
              v62 = 10.0;
            else
              v62 = v60;
            if (v61 <= 0.001)
              v63 = -v54 / v53;
            else
              v63 = v58;
            if (v63 > 0.0 && v63 < 1.0)
            {
              sub_100313400(&v89, (uint64_t)&v81, v63, 1.0);
              v69 = v51 + v88;
              if (v9)
                objc_msgSend(v3, "moveToPoint:", v87, v69);
              else
                objc_msgSend(v3, "lineToPoint:", v87, v69);
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v81, v51 + v82, v85, v51 + v86, v83, v51 + v84);
              -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v43, v63 + -0.01);
              v9 = 0;
              if (v76 >= 0.0)
                v51 = -v5;
              else
                v51 = v5;
            }
            else
            {
              v63 = 1.0;
            }
            if (v62 > 0.0 && v62 < 1.0)
            {
              sub_100313400(&v89, (uint64_t)&v81, v62, v63);
              v78 = v51 + v88;
              if (v9)
                objc_msgSend(v3, "moveToPoint:", v87, v78);
              else
                objc_msgSend(v3, "lineToPoint:", v87, v78);
              v45 = 9.0;
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v81, v51 + v82, v85, v51 + v86, v83, v51 + v84);
              -[CRLBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v43, v62 + -0.01);
              if (v79 >= 0.0)
                v51 = -v5;
              else
                v51 = v5;
              sub_100313400(&v89, (uint64_t)&v81, 0.0, v62);
            }
            else
            {
              sub_100313400(&v89, (uint64_t)&v81, 0.0, v63);
              if (v9)
              {
                objc_msgSend(v3, "moveToPoint:", v87, v51 + v88);
                v45 = 9.0;
                v46 = -3.0;
                goto LABEL_117;
              }
              v45 = 9.0;
            }
            v46 = -3.0;
            objc_msgSend(v3, "lineToPoint:", v87, v51 + v88);
LABEL_117:
            v70 = v81;
            v71 = v51 + v82;
            v72 = v85;
            v73 = v51 + v86;
            v74 = v83;
            v75 = v84;
          }
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v70, v71, v72, v73, v74, v51 + v75);
          goto LABEL_119;
        }
        v67 = v51 + v91;
        if (v9)
          objc_msgSend(v3, "moveToPoint:", v90, v67);
        else
          objc_msgSend(v3, "lineToPoint:", v90, v67);
        v65 = v89.f64[0];
        v66 = v51 + v89.f64[1];
      }
      else
      {
        v65 = v89.f64[0];
        v66 = v89.f64[1] - v44;
      }
      objc_msgSend(v3, "lineToPoint:", v65, v66);
LABEL_119:
      v9 = v48;
      --v43;
    }
    while (v43);
  }
  return v3;
}

+ (CRLBezierPath)bezierPathWithContinuousCornerRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (CRLBezierPath *)objc_msgSend(a1, "bezierPathWithRoundedRect:upperRightRadius:lowerRightRadius:lowerLeftRadius:upperLeftRadius:useLegacyCorners:keepNoOpElements:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4, a4, a4);
}

+ (CRLBezierPath)bezierPathWithLegacyRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (CRLBezierPath *)objc_msgSend(a1, "bezierPathWithRoundedRect:upperRightRadius:lowerRightRadius:lowerLeftRadius:upperLeftRadius:useLegacyCorners:keepNoOpElements:", 1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4, a4, a4);
}

+ (CRLBezierPath)bezierPathWithRoundedRect:(CGRect)a3 upperRightRadius:(double)a4 lowerRightRadius:(double)a5 lowerLeftRadius:(double)a6 upperLeftRadius:(double)a7 useLegacyCorners:(BOOL)a8 keepNoOpElements:(BOOL)a9
{
  _BOOL4 v10;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v19;
  double v20;
  double MinX;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v10 = a8;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  if (v10)
  {
    v30 = sub_10036E124(a4, x, y, width, height, a7, a5);
    v32 = sub_10036E124(a5, x, y, width, height, a6, a4);
    v34 = sub_10036E124(a6, x, y, width, height, a5, a7);
    v20 = sub_10036E124(a7, x, y, width, height, a4, a6);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MinX = CGRectGetMinX(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    objc_msgSend(v19, "moveToPoint:", v20 + MinX, CGRectGetMinY(v37));
    sub_10036E8E4(v19, 0, a9, x, y, width, height, v30);
    sub_10036E8E4(v19, 1, a9, x, y, width, height, v32);
    sub_10036E8E4(v19, 2, a9, x, y, width, height, v34);
    sub_10036E8E4(v19, 3, a9, x, y, width, height, v20);
  }
  else
  {
    v31 = sub_10036E124(a4, x, y, width, height, a7 * 1.528665, a5 * 1.528665);
    v22 = a4 * 1.528665;
    v33 = sub_10036E124(a5, x, y, width, height, a6 * 1.528665, v22);
    v35 = sub_10036E124(a6, x, y, width, height, a5 * 1.528665, a7 * 1.528665);
    v23 = sub_10036E124(a7, x, y, width, height, v22, a6 * 1.528665);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v24 = CGRectGetWidth(v38);
    v25 = v24 * 0.5;
    v26 = v24 - v31 * 1.528665;
    if (v25 >= v26)
      v26 = v25;
    if (v26 >= v23 * 1.528665)
      v27 = v23 * 1.528665;
    else
      v27 = v26;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v28 = CGRectGetMinX(v39);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    objc_msgSend(v19, "moveToPoint:", v28 + v27, CGRectGetMinY(v40));
    sub_10036E2C4(v19, 0, a9, x, y, width, height, v31, v23, v33);
    sub_10036E2C4(v19, 1, a9, x, y, width, height, v33, v35, v31);
    sub_10036E2C4(v19, 2, a9, x, y, width, height, v35, v33, v23);
    sub_10036E2C4(v19, 3, a9, x, y, width, height, v23, v31, v35);
  }
  objc_msgSend(v19, "closePath");
  return (CRLBezierPath *)v19;
}

+ (double)minimumLengthForSideToHaveFullContinuityWithCornerRadius1:(double)a3 cornerRadius2:(double)a4
{
  return a4 * 1.528665 + a3 * 1.528665;
}

+ (id)pathForObjectEraserWithPoint:(CGPoint)a3
{
  id v3;

  sub_1009DACFC(a3.x, a3.y);
  return v3;
}

@end
