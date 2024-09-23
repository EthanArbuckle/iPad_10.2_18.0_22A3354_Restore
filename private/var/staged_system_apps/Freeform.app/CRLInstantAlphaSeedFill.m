@implementation CRLInstantAlphaSeedFill

+ (id)newSeedFillWithImage:(id)a3 seedPoint:(CGPoint)a4 context:(id *)a5 oldFill:(id)a6
{
  double y;
  double x;
  _QWORD *v10;
  id v11;
  CRLInstantAlphaBinaryBitmap *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int *v22;
  unsigned int v23;
  BOOL v24;
  int v25;
  int v26;
  uint64_t v27;
  int *v28;
  unsigned int v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  CRLInstantAlphaBinaryBitmap *v35;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v11 = a6;
  v38 = 0;
  qword_101415748 = (uint64_t)a5;
  v12 = -[CRLInstantAlphaBinaryBitmap initWithWidth:height:]([CRLInstantAlphaBinaryBitmap alloc], "initWithWidth:height:", v10[1], v10[2], 0);
  if (v12)
  {
    v13 = malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
    if (v13)
    {
      v14 = (uint64_t)v13;
      v15 = malloc_type_malloc(0x268uLL, 0x1020040F89E1A17uLL);
      *(_QWORD *)v14 = v15;
      *(_QWORD *)(v14 + 8) = v15;
      if (v15)
      {
        v40 = 0;
        v39 = 0;
        *v15 = 0;
        v15[1] = 0;
        *(_QWORD *)(v14 + 16) = v15 + 2;
        sub_1003A10D0(v10, v12, (int)x, (int)y, &v39, v11);
        sub_1003A1274(v12, (int *)&v39);
        sub_1003A15F8(v14, &v39);
        while (1)
        {
          v17 = *(_QWORD *)(v14 + 8);
          v16 = *(_QWORD *)(v14 + 16);
          if (v16 == v17 + 16)
          {
            v18 = *(_QWORD *)(v17 + 8);
            if (!v18)
            {
              -[CRLInstantAlphaBinaryBitmap unionWithBitmap:](v12, "unionWithBitmap:", v11);
              sub_1003A168C((_QWORD **)v14);
              v35 = v12;
              goto LABEL_39;
            }
            *(_QWORD *)(v14 + 8) = v18;
            v16 = v18 + 616;
          }
          *(_QWORD *)(v14 + 16) = v16 - 12;
          v39 = *(_QWORD *)(v16 - 12);
          v40 = *(_DWORD *)(v16 - 4);
          v19 = (int)v39;
          if ((int)v39 >= 1)
          {
            v20 = HIDWORD(v39);
            v21 = v40;
            if (SHIDWORD(v39) <= v40)
            {
              do
              {
                if (!sub_1003A16C4(v12, v20, (v19 - 1)))
                {
                  if (sub_1003A16C4(v11, v20, (v19 - 1))
                    || (v22 = (int *)qword_101415748,
                        v23 = sub_1003A19F4(v10, v20, (v19 - 1)),
                        sub_1003A1978(v22, v23)))
                  {
                    sub_1003A10D0(v10, v12, v20, v19 - 1, &v37, v11);
                    sub_1003A1274(v12, (int *)&v37);
                    if (!sub_1003A15F8(v14, &v37))
                    {
LABEL_27:
                      sub_1003A168C((_QWORD **)v14);
                      goto LABEL_38;
                    }
                    v20 = v38 + 2;
                  }
                }
                v24 = v20++ < v21;
              }
              while (v24);
            }
          }
          if (v10[2] - 1 > v19)
          {
            v25 = HIDWORD(v39);
            v26 = v40;
            if (SHIDWORD(v39) <= v40)
            {
              v27 = (int)v19 + 1;
              do
              {
                if (!sub_1003A16C4(v12, v25, v27))
                {
                  if (sub_1003A16C4(v12, v25, v27)
                    || (v28 = (int *)qword_101415748, v29 = sub_1003A19F4(v10, v25, v27), sub_1003A1978(v28, v29)))
                  {
                    sub_1003A10D0(v10, v12, v25, v27, &v37, v11);
                    sub_1003A1274(v12, (int *)&v37);
                    if (!sub_1003A15F8(v14, &v37))
                      goto LABEL_27;
                    v25 = v38 + 2;
                  }
                }
                v24 = v25++ < v26;
              }
              while (v24);
            }
          }
        }
      }
      free((void *)v14);
    }
    else
    {
      puts("allocSpanStack: stack could not be allocated");
    }
    v30 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257988);
    v31 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A970(v30, v31);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012579A8);
    v32 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLInstantAlphaSeedFill newSeedFillWithImage:seedPoint:context:oldFill:]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaSeedFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 178, 0, "can't allocate span stack");

  }
LABEL_38:
  v35 = 0;
LABEL_39:

  return v35;
}

@end
