@implementation EBString

+ (id)edStringFromXlString:(const void *)a3 edResources:(id)a4
{
  id v5;
  EDString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;
  __int16 *v15;
  void *v16;
  EDString *v18;

  v5 = a4;
  if (a3)
  {
    v6 = objc_alloc_init(EDString);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)a3 + 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDString setString:](v6, "setString:", v7);

    if (((*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) & 0x7FFFFFFF8) != 0)
    {
      v18 = v6;
      +[EDCollection collection](EDRunsCollection, "collection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *((_QWORD *)a3 + 7);
      v9 = *((_QWORD *)a3 + 8);
      -[EDString string](v6, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");
      v13 = v9 - v10;

      if (((v9 - v10) & 0x7FFFFFFF8) != 0)
      {
        v14 = 0;
        do
        {
          v15 = *(__int16 **)(*((_QWORD *)a3 + 7) + 8 * v14);
          if (v15 && v12 > *v15)
          {
            +[EDRun runWithCharIndex:fontIndex:resources:](EDRun, "runWithCharIndex:fontIndex:resources:", *v15, +[EBFontTable edFontIndexFromXlFontIndex:](EBFontTable, "edFontIndexFromXlFontIndex:", v15[1]), v5);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
          ++v14;
        }
        while ((v13 >> 3) != v14);
      }
      v6 = v18;
      -[EDString setRuns:](v18, "setRuns:", v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)xlStringFromEDString:(id)a3 state:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _WORD *v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  unint64_t v21;
  char *v22;
  unsigned int v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  unsigned int v35;
  void *v36;
  void *v37;
  XlPhoneticRun *v38;
  id v41;
  void *v42;
  void *v43;
  OcText v44;
  OcText v45;

  v5 = a3;
  v41 = a4;
  v43 = v5;
  if (v5)
  {
    objc_msgSend(v5, "string");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v42, "length") >= 0xFFFF)
    {
      objc_msgSend(v42, "substringToIndex:", 65534);
      v6 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)v6;
      +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", ECStringTooLong);
    }
    OcText::OcText(&v45);
    objc_msgSend(v42, "copyToOcText:", &v45);
    v7 = operator new();
    XlString::XlString((XlString *)v7, &v45);
    objc_msgSend(v5, "runs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(v8, "objectAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if ((unint64_t)objc_msgSend(v11, "charIndex") > 0xFFFE)
          {

            break;
          }
          v13 = (_WORD *)operator new[]();
          *v13 = objc_msgSend(v12, "charIndex");
          v13[1] = +[EBFontTable xlFontIndexFromEDFontIndex:](EBFontTable, "xlFontIndexFromEDFontIndex:", objc_msgSend(v12, "fontIndex"));
          v15 = *(_QWORD **)(v7 + 64);
          v14 = *(_QWORD *)(v7 + 72);
          if ((unint64_t)v15 >= v14)
          {
            v17 = *(_QWORD *)(v7 + 56);
            v18 = (unint64_t)v15 - v17;
            v19 = (v14 - v17) >> 3;
            v20 = 2 * v19;
            if (2 * (int)v19 <= (v18 >> 3) + 1)
              v20 = (v18 >> 3) + 1;
            if (v19 >= 0x7FFFFFFF)
              v21 = 0xFFFFFFFFLL;
            else
              v21 = v20;
            if ((_DWORD)v21)
            {
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>(v7 + 72, v21);
              v24 = v23;
            }
            else
            {
              v22 = 0;
              v24 = 0;
            }
            v25 = &v22[v18 & 0x7FFFFFFF8];
            *(_QWORD *)v25 = v13;
            v16 = v25 + 8;
            v27 = *(char **)(v7 + 56);
            v26 = *(char **)(v7 + 64);
            if (v26 != v27)
            {
              do
              {
                v28 = *((_QWORD *)v26 - 1);
                v26 -= 8;
                *((_QWORD *)v25 - 1) = v28;
                v25 -= 8;
              }
              while (v26 != v27);
              v26 = *(char **)(v7 + 56);
            }
            *(_QWORD *)(v7 + 56) = v25;
            *(_QWORD *)(v7 + 64) = v16;
            *(_QWORD *)(v7 + 72) = &v22[8 * v24];
            if (v26)
              operator delete(v26);
          }
          else
          {
            *v15 = v13;
            v16 = v15 + 1;
          }
          *(_QWORD *)(v7 + 64) = v16;
        }

      }
    }
    objc_msgSend(v5, "phoneticInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = operator new();
      XlPhoneticInfo::XlPhoneticInfo((XlPhoneticInfo *)v30);
      *(_DWORD *)(v30 + 12) = objc_msgSend(v29, "type");
      *(_DWORD *)(v30 + 16) = objc_msgSend(v29, "align");
      *(_WORD *)(v30 + 8) = +[EBFontTable xlFontIndexFromEDFontIndex:](EBFontTable, "xlFontIndexFromEDFontIndex:", objc_msgSend(v29, "fontIndex"));
      OcText::OcText(&v44);
      objc_msgSend(v29, "string");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "copyToOcText:", &v44);

      OcText::operator=(v30 + 24, (uint64_t)&v44);
      objc_msgSend(v29, "runs");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v33)
      {
        v34 = 0;
        v35 = 1;
        do
        {
          objc_msgSend(v29, "runs");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndex:", v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            v38 = (XlPhoneticRun *)operator new();
            XlPhoneticRun::XlPhoneticRun(v38);
            *((_WORD *)v38 + 4) = objc_msgSend(v37, "charIndex");
            *((_WORD *)v38 + 5) = objc_msgSend(v37, "charBaseIndex");
            *((_WORD *)v38 + 6) = objc_msgSend(v37, "charBaseCount");
            XlPhoneticInfo::appendRun((XlPhoneticInfo *)v30, v38);
          }

          v34 = v35;
        }
        while (v33 > v35++);
      }
      XlDocRoute::setBookTitle((XlDocRoute *)v7, (XlString *)v30);
      OcText::~OcText(&v44);
    }

    OcText::~OcText(&v45);
  }
  else
  {
    v7 = 0;
  }

  return (void *)v7;
}

+ (void)xlStringWithIndex:(unsigned int)a3
{
  XlString *v4;

  v4 = (XlString *)operator new();
  XlString::XlString(v4);
  XlString::setIndex(v4, a3);
  return v4;
}

@end
