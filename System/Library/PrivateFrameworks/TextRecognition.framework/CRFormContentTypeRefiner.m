@implementation CRFormContentTypeRefiner

+ (BOOL)_isRegion:(id)a3 onLeftOfRegion:(id)a4 withTolerance:(double)a5
{
  id v7;
  void *v8;
  void *v9;
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
  BOOL v28;

  v7 = a4;
  objc_msgSend(a3, "boundingQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingQuad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v11 = v10;
  objc_msgSend(v9, "size");
  v13 = v12;
  objc_msgSend(v9, "topLeft");
  v15 = v14;
  objc_msgSend(v8, "topRight");
  v17 = v16;
  objc_msgSend(v8, "midPoint");
  v19 = v18;
  objc_msgSend(v9, "midPoint");
  if (v19 >= v20
    || (v21 = (v11 + v13) * 0.5, v15 - v17 >= v21 * a5 * 1.5)
    || v15 - v17 <= -(a5 * v21)
    || (objc_msgSend(v8, "size"), v23 = v22, objc_msgSend(v9, "size"), vabdd_f64(v23, v24) >= v21 * 0.3))
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v8, "midPoint");
    v26 = v25;
    objc_msgSend(v9, "midPoint");
    v28 = vabdd_f64(v26, v27) < v21 * 0.5;
  }

  return v28;
}

+ (void)_groupOrRefinePhoneNumberWithContext:(ContentTypeRefinementContext *)a3 shouldGroup:(BOOL)a4
{
  void *v4;
  _BOOL4 v5;
  void *var1;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *__p;
  void *v23;
  char *v24;

  v5 = a4;
  var1 = a3->var1;
  v9 = operator new(0x28uLL);
  v23 = v9 + 5;
  v24 = (char *)(v9 + 5);
  v9[4] = 48;
  *(_OWORD *)v9 = _ZGRZ77__CRFormContentTypeRefiner__groupOrRefinePhoneNumberWithContext_shouldGroup__E15kTelephoneTypes_;
  *((_OWORD *)v9 + 1) = unk_1D513AE60;
  __p = v9;
  objc_msgSend(a1, "_findSubTextFieldsInFields:maxLength:minAspectRatio:contentTypes:includeNone:", var1, 3, &__p, 1, 0.1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v23 = __p;
    operator delete(__p);
  }
  if (objc_msgSend(v10, "count") != 2 && objc_msgSend(v10, "count") != 3)
    goto LABEL_31;
  if (objc_msgSend(v10, "count") != 2)
    goto LABEL_19;
  v11 = objc_msgSend(v10, "count");
  if (v11 == 2)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    var1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(var1, "textContentType") != 45)
    {
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "textContentType") != 46)
    {
LABEL_29:

      goto LABEL_30;
    }
  }
  if (objc_msgSend(v10, "count") != 3)
  {
    if (v11 == 2)
    {

    }
    goto LABEL_19;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "textContentType") != 45)
  {
LABEL_28:

    if (v11 != 2)
    {
LABEL_31:
      goto LABEL_32;
    }
    goto LABEL_29;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "textContentType") != 47)
  {

    goto LABEL_28;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "textContentType");

  if (v11 == 2)
  {

  }
  if (v15 != 48)
    goto LABEL_31;
LABEL_19:
  if (v5)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextContentType:", 45);

    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextContentType:", 46);

    if (objc_msgSend(v10, "count") == 3)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextContentType:", 46);

    }
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextContentType:", 45);

    if (objc_msgSend(v10, "count") == 2)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextContentType:", 46);
    }
    else
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTextContentType:", 47);

      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextContentType:", 48);
    }

  }
LABEL_32:

}

+ (id)_findSubTextFieldsInFields:(const void *)a3 maxLength:(unint64_t)a4 minAspectRatio:(double)a5 contentTypes:(const void *)a6 includeNone:(BOOL)a7
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  unint64_t v35;
  id v39;

  v10 = (void *)objc_opt_new();
  v35 = a4;
  v11 = *((_QWORD *)a3 + 1);
  if (3 * a4 >= *((_QWORD *)a3 + 2))
    v12 = *((_QWORD *)a3 + 2);
  else
    v12 = 3 * a4;
  if ((const void *)v11 == a3 || v12 == 0)
  {

    return v10;
  }
  v39 = 0;
  v14 = 0;
  while (1)
  {
    v15 = *(id *)(v11 + 16);
    if (objc_msgSend(v15, "fieldType") == 1)
    {
      v16 = objc_msgSend(v15, "fieldSource");
      if (v16 == objc_msgSend(*(id *)(*((_QWORD *)a3 + 1) + 16), "fieldSource"))
        break;
    }
LABEL_34:

    ++v14;
    v11 = *(_QWORD *)(v11 + 8);
    if ((const void *)v11 == a3 || v14 >= v12)
      goto LABEL_39;
  }
  CRCastAsClass<CRFormTextFieldOutputRegion>(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "labelRegion");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v39 || !v19)
    {
      if (v39 && v19 && v19 != v39)
      {

LABEL_33:
        goto LABEL_34;
      }
    }
    else
    {
      v39 = v19;
    }

  }
  if (objc_msgSend(v15, "textContentType") && (objc_msgSend(v15, "textContentType") != 1 || !a7))
  {
    v21 = *(_QWORD **)a6;
    v22 = (_QWORD *)*((_QWORD *)a6 + 1);
    v23 = objc_msgSend(v15, "textContentType");
    if (v21 != v22)
    {
      while (*v21 != v23)
      {
        if (++v21 == v22)
        {
          v21 = v22;
          break;
        }
      }
    }
    if (v21 == *((_QWORD **)a6 + 1))
      goto LABEL_33;
  }
  objc_msgSend(v10, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v10, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(a1, "_isRegion:onLeftOfRegion:withTolerance:", v25, v15, 2.0);

    if ((v26 & 1) == 0)
      goto LABEL_33;
  }
  objc_msgSend(v15, "boundingQuad");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "size");
  v29 = v28;
  objc_msgSend(v15, "boundingQuad");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "size");
  v32 = v31 * a5;

  if (v29 < v32)
    goto LABEL_33;
  objc_msgSend(v10, "addObject:", v15);
  if (objc_msgSend(v10, "count") != v35)
    goto LABEL_33;

LABEL_39:
  return v10;
}

+ (void)_refineDateAndBirthdayTypesWithContext:(ContentTypeRefinementContext *)a3 locale:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *var1;
  const void *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t i;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *__p;
  void *v56;
  char *v57;

  v6 = a4;
  v7 = +[CRFormContentTypeUtilities contentTypeIsBirthdayComponent:](CRFormContentTypeUtilities, "contentTypeIsBirthdayComponent:", objc_msgSend(*(id *)(*((_QWORD *)a3->var1 + 1) + 16), "textContentType"));
  var1 = a3->var1;
  if (v7)
    v9 = &_ZGRZ74__CRFormContentTypeRefiner__refineDateAndBirthdayTypesWithContext_locale__E14kBirthdayTypes_;
  else
    v9 = &_ZGRZ74__CRFormContentTypeRefiner__refineDateAndBirthdayTypesWithContext_locale__E10kDateTypes_;
  v10 = (char *)operator new(0x20uLL);
  v11 = v10 + 32;
  __p = v10;
  v57 = v10 + 32;
  memmove(v10, v9, 0x20uLL);
  v56 = v11;
  objc_msgSend(a1, "_findSubTextFieldsInFields:maxLength:minAspectRatio:contentTypes:includeNone:", var1, 3, &__p, 0, 0.1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v56 = __p;
    operator delete(__p);
  }
  objc_msgSend(v12, "count");
  if (objc_msgSend(v12, "count") == 3)
  {
    v13 = a3->var1;
    v14 = (char *)operator new(0x20uLL);
    __p = v14;
    v56 = v14;
    v57 = v14 + 32;
    memmove(v14, v9, 0x20uLL);
    v56 = v14 + 32;
    objc_msgSend(a1, "_findSubTextFieldsInFields:maxLength:minAspectRatio:contentTypes:includeNone:", v13, 3, &__p, 0, 0.2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (__p)
    {
      v56 = __p;
      operator delete(__p);
    }
    v16 = objc_msgSend(v15, "count");
    if (v16 < objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "boundingQuad");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "size");
      v20 = v19;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "boundingQuad");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "size");
      v24 = v23;

      if (v20 * 0.2 > v24)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v7)
          v27 = 37;
        else
          v27 = 52;
        objc_msgSend(v25, "setTextContentType:", v27);

        for (i = 1; i < objc_msgSend(v12, "count"); ++i)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setTextContentType:", 1);

        }
        objc_msgSend(v12, "subarrayWithRange:", 0, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_54;
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("yMMMMd"), 1, v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'ngày' "), &stru_1E98DC948);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v32 = objc_msgSend(v31, "hasPrefix:", CFSTR("d"));
    v33 = objc_msgSend(v31, "hasPrefix:", CFSTR("y"));
  }
  else
  {
    v32 = 0;
    v33 = 0;
  }
  objc_msgSend(v12, "count");
  if (objc_msgSend(v12, "count") == 3)
  {
    if (v33)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v7)
        v36 = 40;
      else
        v36 = 55;
      objc_msgSend(v34, "setTextContentType:", v36);

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v7)
        v39 = 39;
      else
        v39 = 54;
      objc_msgSend(v37, "setTextContentType:", v39);

      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v7)
        v42 = 38;
      else
        v42 = 53;
    }
    else if (v32)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v7)
        v45 = 38;
      else
        v45 = 53;
      objc_msgSend(v43, "setTextContentType:", v45);

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v7)
        v48 = 39;
      else
        v48 = 54;
      objc_msgSend(v46, "setTextContentType:", v48);

      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v7)
        v42 = 40;
      else
        v42 = 55;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v7)
        v51 = 39;
      else
        v51 = 54;
      objc_msgSend(v49, "setTextContentType:", v51);

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if (v7)
        v54 = 38;
      else
        v54 = 53;
      objc_msgSend(v52, "setTextContentType:", v54);

      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v7)
        v42 = 40;
      else
        v42 = 55;
    }
    objc_msgSend(v40, "setTextContentType:", v42);

  }
  else
  {
  }
LABEL_54:

}

+ (void)_groupCreditCardNumberWithContext:(ContentTypeRefinementContext *)a3 shouldGroup:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *var1;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *__p;
  void *v20;
  _QWORD *v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(*(id *)(*((_QWORD *)a3->var1 + 1) + 16), "textContentType");
  var1 = a3->var1;
  v9 = operator new(8uLL);
  __p = v9;
  *v9 = v7;
  v20 = v9 + 1;
  v21 = v9 + 1;
  objc_msgSend(a1, "_findSubTextFieldsInFields:maxLength:minAspectRatio:contentTypes:includeNone:", var1, 4, &__p, 1, 0.2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }
  if (objc_msgSend(v10, "count") == 4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setTextContentType:", v7, (_QWORD)v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v12);
    }

    if (v4)
    else
  }
  else
  {
  }

}

+ (void)_refineCreditCardExpirationTypesWithContext:(ContentTypeRefinementContext *)a3
{
  void *var1;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *__p;
  void *v11;
  char *v12;

  objc_msgSend(*(id *)(*((_QWORD *)a3->var1 + 1) + 16), "textContentType");
  var1 = a3->var1;
  v6 = operator new(0x18uLL);
  v11 = v6 + 3;
  v12 = (char *)(v6 + 3);
  v6[2] = 31;
  *(_OWORD *)v6 = _ZGRZ72__CRFormContentTypeRefiner__refineCreditCardExpirationTypesWithContext__E11kCCExpTypes_;
  __p = v6;
  objc_msgSend(a1, "_findSubTextFieldsInFields:maxLength:minAspectRatio:contentTypes:includeNone:", var1, 2, &__p, 1, 0.25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextContentType:", 30);

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextContentType:", 31);

  }
  else
  {
  }

}

+ (void)_refineAddressTypesWithContext:(ContentTypeRefinementContext *)a3
{
  _QWORD *var1;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  var1 = a3->var1;
  objc_msgSend(*(id *)(var1[1] + 16), "textContentType");
  v39 = *(id *)(var1[1] + 16);
  v4 = var1[2];
  v5 = 5;
  if (v4 < 5)
    v5 = var1[2];
  if (v5 >= 2)
  {
    v6 = var1[1];
    v7 = 1;
    while (1)
    {
      v6 = *(_QWORD *)(v6 + 8);
      v8 = *(id *)(v6 + 16);
      if (objc_msgSend(v8, "fieldSource") != 2
        && objc_msgSend(v8, "fieldSource") != 3
        && objc_msgSend(v8, "fieldType") == 1
        && +[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:", v8, 1, 1, 0))
      {
        objc_msgSend(v39, "boundingQuad");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "size");
        v11 = v10;
        objc_msgSend(v8, "boundingQuad");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "size");
        v14 = v13 >= v11 ? v11 : v13;

        objc_msgSend(v8, "boundingQuad");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "topLeft");
        v17 = v16;
        objc_msgSend(v39, "boundingQuad");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bottomLeft");
        v20 = v17 - v19;

        if (v20 <= v14 * 2.5)
        {
          v21 = objc_msgSend(v8, "textContentType");
          if (v21 <= 0x14 && ((1 << v21) & 0x138000) != 0)
            break;
        }
      }

      ++v7;
      v4 = var1[2];
      if (v4 >= 5)
        v22 = 5;
      else
        v22 = var1[2];
      if (v7 >= v22)
        goto LABEL_19;
    }
    CROSLogForCategory(6);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", objc_msgSend(v39, "textContentType"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", 13);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v41 = "+[CRFormContentTypeRefiner _refineAddressTypesWithContext:]";
      v42 = 2112;
      v43 = v36;
      v44 = 2112;
      v45 = v37;
      _os_log_impl(&dword_1D4FB8000, v35, OS_LOG_TYPE_DEBUG, "%s: Rewriting content types: %@ => %@", buf, 0x20u);

    }
    objc_msgSend(v39, "setTextContentType:", 13);

    v4 = var1[2];
  }
LABEL_19:
  if (v4 >= 4)
    v4 = 4;
  if (v4 < 2)
    goto LABEL_41;
  v23 = var1[1];
  v24 = 1;
  while (1)
  {
    v23 = *(_QWORD *)(v23 + 8);
    v25 = *(id *)(v23 + 16);
    if (objc_msgSend(v25, "fieldSource") == 1)
      break;
LABEL_35:

    ++v24;
    v34 = var1[2];
    if (v34 >= 4)
      v34 = 4;
    if (v24 >= v34)
      goto LABEL_41;
  }
  if (objc_msgSend(v25, "fieldType") != 1
    || !+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:", v25, 1, 1, 0)|| objc_msgSend(v25, "textContentType") != 12&& objc_msgSend(v25, "textContentType") != 13&& objc_msgSend(v25, "textContentType") != 14)
  {
    goto LABEL_40;
  }
  v26 = v25;
  objc_msgSend(v26, "labelRegion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (v28)
  {
    if (+[CRFormUtilities isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:](CRFormUtilities, "isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:", v39, v26, (double)v24 * 3.0))
    {
      objc_msgSend(v39, "setTextContentType:", 13);
      objc_msgSend(v26, "setTextContentType:", 14);
      CROSLogForCategory(6);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", objc_msgSend(v39, "textContentType"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "textContentTypeString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", 13);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", 14);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v41 = "+[CRFormContentTypeRefiner _refineAddressTypesWithContext:]";
        v42 = 2112;
        v43 = v30;
        v44 = 2112;
        v45 = v31;
        v46 = 2112;
        v47 = v32;
        v48 = 2112;
        v49 = v33;
        _os_log_impl(&dword_1D4FB8000, v29, OS_LOG_TYPE_DEBUG, "%s: Rewriting content types: %@ %@ => %@ %@", buf, 0x34u);

      }
    }

    goto LABEL_35;
  }

LABEL_40:
LABEL_41:

}

+ (id)groupAndAssignStructuralContentTypesForFields:(id)a3 locale:(id)a4 updateExternalFields:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v23;
  _QWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (qword_1ED0B46A0 != -1)
    dispatch_once(&qword_1ED0B46A0, &__block_literal_global_25);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count", v8));
  v29 = &v29;
  v30 = (uint64_t *)&v29;
  v31 = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v15 = operator new(0x18uLL);
        v16 = v14;
        v15[1] = &v29;
        v15[2] = v16;
        v17 = (uint64_t)v29;
        *v15 = v29;
        *(_QWORD *)(v17 + 8) = v15;
        v29 = v15;
        ++v31;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v11);
  }

  v18 = v23;
  v24[0] = v18;
  v24[1] = &v29;
  v19 = v18;
  if (v31)
  {
    do
    {
      v20 = (id)v30[2];
      if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:", v20, v5, 1, 0))
      {
        v21 = objc_msgSend(v20, "textContentType");
        switch(v21)
        {
          case 28:
            if (objc_msgSend(v20, "fieldSource") != 1)
              goto LABEL_14;
            objc_msgSend(a1, "_groupCreditCardNumberWithContext:shouldGroup:", v24, _MergedGlobals_25);
            break;
          case 29:
          case 30:
          case 31:
            objc_msgSend(a1, "_refineCreditCardExpirationTypesWithContext:", v24);
            break;
          case 32:
          case 33:
          case 34:
          case 35:
          case 36:
          case 41:
          case 43:
          case 44:
          case 46:
          case 47:
          case 48:
          case 49:
          case 50:
          case 51:
            goto LABEL_14;
          case 37:
          case 38:
          case 39:
          case 40:
          case 52:
          case 53:
          case 54:
          case 55:
            objc_msgSend(a1, "_refineDateAndBirthdayTypesWithContext:locale:", v24, v9);
            break;
          case 42:
          case 45:
            objc_msgSend(a1, "_groupOrRefinePhoneNumberWithContext:shouldGroup:", v24, _MergedGlobals_25);
            break;
          default:
            if (v21 != 12)
              goto LABEL_14;
            objc_msgSend(a1, "_refineAddressTypesWithContext:", v24);
            break;
        }
      }
      else
      {
LABEL_14:
      }

    }
    while (v31);
    v19 = (void *)v24[0];
  }

  std::__list_imp<objc_object  {objcproto20CRFormFieldProviding}* {__strong}>::clear((uint64_t *)&v29);
  return v18;
}

void __102__CRFormContentTypeRefiner_groupAndAssignStructuralContentTypesForFields_locale_updateExternalFields___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CR_FORM_DISABLE_FIELD_GROUPS"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_25 = objc_msgSend(v1, "BOOLValue") ^ 1;

}

@end
