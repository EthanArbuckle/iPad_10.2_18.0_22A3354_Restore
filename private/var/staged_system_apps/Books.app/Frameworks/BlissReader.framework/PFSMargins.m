@implementation PFSMargins

+ (void)valuesFromMarginValueList:(id)a3 top:(id *)a4 right:(id *)a5 bottom:(id *)a6 left:(id *)a7
{
  int *v12;
  int *v13;
  int *v14;
  int *v15;

  v12 = (int *)objc_msgSend(a3, "count");
  v13 = v12;
  if (v12)
  {
    v12 = (int *)objc_msgSend(a3, "objectAtIndex:", 0);
    v14 = v12;
    if (v13 == &dword_4)
    {
      v13 = (int *)objc_msgSend(a3, "objectAtIndex:", 1);
      v15 = (int *)objc_msgSend(a3, "objectAtIndex:", 2);
      v12 = (int *)objc_msgSend(a3, "objectAtIndex:", 3);
      if (a4)
        goto LABEL_12;
    }
    else
    {
      if (v13 == (int *)((char *)&dword_0 + 3))
      {
        v13 = (int *)objc_msgSend(a3, "objectAtIndex:", 1);
        v15 = (int *)objc_msgSend(a3, "objectAtIndex:", 2);
        v12 = v13;
        if (!a4)
          goto LABEL_13;
        goto LABEL_12;
      }
      if (v13 == (int *)((char *)&dword_0 + 2))
      {
        v12 = (int *)objc_msgSend(a3, "objectAtIndex:", 1);
        v13 = v12;
        v15 = v14;
        if (!a4)
          goto LABEL_13;
LABEL_12:
        *a4 = v14;
        goto LABEL_13;
      }
      v13 = v12;
      v15 = v12;
      if (a4)
        goto LABEL_12;
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
    if (a4)
      goto LABEL_12;
  }
LABEL_13:
  if (a5)
    *a5 = v13;
  if (a6)
    *a6 = v15;
  if (a7)
    *a7 = v12;
}

+ (void)mapMarginStyleProperty:(id)a3 propertyNames:(id *)a4 left:(double *)a5 top:(double *)a6 right:(double *)a7 bottom:(double *)a8 parentFontSize:(double)a9 percentageBasis:(double)a10
{
  id v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int64x2_t v35;
  id v36;
  _OWORD v37[2];
  int64x2_t v38;
  uint64_t v39;

  v39 = 0;
  v38 = 0u;
  memset(v37, 0, sizeof(v37));
  sub_1D0314(v37, a4);
  sub_1D0398((uint64_t)v37, &a4->var3);
  v19 = objc_msgSend(a3, "firstValueFromCandidatePropertyNames:selectedIndex:", v37, &v39);
  if (v19)
  {
    v36 = 0;
    if (v39 == 1)
    {
      v36 = objc_msgSend(v19, "lastObject");
      if (v36)
      {
LABEL_5:
        +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", a9, a10);
        v21 = v20;
        goto LABEL_8;
      }
    }
    else if (!v39)
    {
      objc_msgSend(a1, "valuesFromMarginValueList:top:right:bottom:left:", v19, &v36, 0, 0, 0);
      if (v36)
        goto LABEL_5;
    }
  }
  v21 = -65536.0;
LABEL_8:
  v35 = (int64x2_t)xmmword_315790;
  v38 = vaddq_s64(v38, (int64x2_t)xmmword_315790);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((_QWORD *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  sub_1D0398((uint64_t)v37, &a4->var2);
  v22 = objc_msgSend(a3, "firstValueFromCandidatePropertyNames:selectedIndex:", v37, &v39);
  if (v22)
  {
    v36 = 0;
    if (v39 == 1)
    {
      v36 = objc_msgSend(v22, "lastObject");
      if (v36)
      {
LABEL_14:
        +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", a9, a10, 1, -1);
        v24 = v23;
        goto LABEL_17;
      }
    }
    else if (!v39)
    {
      objc_msgSend(a1, "valuesFromMarginValueList:top:right:bottom:left:", v22, 0, &v36, 0, 0);
      if (v36)
        goto LABEL_14;
    }
  }
  v24 = -65536.0;
LABEL_17:
  v38 = vaddq_s64(v38, v35);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((_QWORD *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  sub_1D0398((uint64_t)v37, &a4->var4);
  v25 = objc_msgSend(a3, "firstValueFromCandidatePropertyNames:selectedIndex:", v37, &v39);
  if (v25)
  {
    v36 = 0;
    if (v39 == 1)
    {
      v36 = objc_msgSend(v25, "lastObject");
      if (v36)
      {
LABEL_23:
        +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", a9, a10, *(_OWORD *)&v35);
        v27 = v26;
        goto LABEL_26;
      }
    }
    else if (!v39)
    {
      objc_msgSend(a1, "valuesFromMarginValueList:top:right:bottom:left:", v25, 0, 0, &v36, 0);
      if (v36)
        goto LABEL_23;
    }
  }
  v27 = -65536.0;
LABEL_26:
  v38 = vaddq_s64(v38, v35);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((_QWORD *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  sub_1D0398((uint64_t)v37, &a4->var1);
  v28 = objc_msgSend(a3, "firstValueFromCandidatePropertyNames:selectedIndex:", v37, &v39);
  if (v28)
  {
    v36 = 0;
    if (v39 == 1)
    {
      v36 = objc_msgSend(v28, "lastObject");
      if (v36)
      {
LABEL_32:
        +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", a9, a10, *(_OWORD *)&v35);
        v30 = v29;
        goto LABEL_35;
      }
    }
    else if (!v39)
    {
      objc_msgSend(a1, "valuesFromMarginValueList:top:right:bottom:left:", v28, 0, 0, 0, &v36);
      if (v36)
        goto LABEL_32;
    }
  }
  v30 = -65536.0;
LABEL_35:
  v38 = vaddq_s64(v38, v35);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((_QWORD *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  if (v30 != -65536.0)
  {
    v31 = *a5;
    if (*a5 == -65536.0)
      v31 = -0.0;
    *a5 = v30 + v31;
  }
  if (v21 != -65536.0)
  {
    v32 = *a6;
    if (*a6 == -65536.0)
      v32 = -0.0;
    *a6 = v21 + v32;
  }
  if (v24 != -65536.0)
  {
    v33 = *a7;
    if (*a7 == -65536.0)
      v33 = -0.0;
    *a7 = v24 + v33;
  }
  if (v27 != -65536.0)
  {
    v34 = *a8;
    if (*a8 == -65536.0)
      v34 = -0.0;
    *a8 = v27 + v34;
  }
  sub_1D0414(v37);
}

@end
