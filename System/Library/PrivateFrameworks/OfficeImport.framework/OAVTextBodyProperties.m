@implementation OAVTextBodyProperties

+ (void)readFromManager:(id)a3 toShape:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v30;
  id v31;

  v31 = a3;
  v8 = a5;
  objc_msgSend(a4, "textBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend((id)objc_msgSend(v8, "client"), "vmlSupportLevel");
  objc_msgSend(v31, "textInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v10, "setLeftInset:");
  LODWORD(v18) = v13;
  objc_msgSend(v10, "setTopInset:", v18);
  LODWORD(v19) = v15;
  objc_msgSend(v10, "setRightInset:", v19);
  LODWORD(v20) = v17;
  objc_msgSend(v10, "setBottomInset:", v20);
  objc_msgSend(v10, "setIsUpright:", v11 != 2);
  if (v11 == 2)
  {
    objc_msgSend(v31, "textRotation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(a1, "readRotation:", v22);

  }
  else
  {
    v21 = 0;
  }
  +[OABTextBodyProperties setTextRotation:textBodyProperties:](OABTextBodyProperties, "setTextRotation:textBodyProperties:", v21, v10);
  objc_msgSend(v31, "textLayoutFlow");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "textAltLayoutFlow");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFlowType:", objc_msgSend(a1, "flowTypeWithLayoutFlowString:altLayoutFlowString:", v23, v24));
  +[OABTextBodyProperties setAutoFit:textBodyProperties:](OABTextBodyProperties, "setAutoFit:textBodyProperties:", objc_msgSend(v31, "fitShapeToText"), v10);
  if (v11 == 2)
  {
    objc_msgSend(v31, "textWrapStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(a1, "readWrapStyle:", v26);

  }
  else
  {
    v25 = 0;
  }
  +[OABTextBodyProperties setWrap:textBodyProperties:](OABTextBodyProperties, "setWrap:textBodyProperties:", v25, v10);
  if (v11 < 1)
  {
    v30 = 0;
  }
  else
  {
    objc_msgSend(v31, "textAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(a1, "readAnchor:", v27);
    if (v28 > 2 && v11 == 1)
      v30 = 0;
    else
      v30 = v28;

  }
  +[OABTextBodyProperties setTextAnchor:textBodyProperties:](OABTextBodyProperties, "setTextAnchor:textBodyProperties:", v30, v10);
  +[OABTextBodyProperties setIsAnchorCenter:textBodyProperties:](OABTextBodyProperties, "setIsAnchorCenter:textBodyProperties:", v30, v10);

}

+ (unsigned)flowTypeWithLayoutFlowString:(id)a3 altLayoutFlowString:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("vertical")))
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("top-to-bottom")) & 1) != 0)
    {
      v7 = 4;
      goto LABEL_13;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("bottom-to-top")) & 1) != 0)
    {
      v7 = 3;
      goto LABEL_13;
    }
    if (!objc_msgSend(v6, "length"))
    {
      v7 = 2;
      goto LABEL_13;
    }
  }
  objc_msgSend(v6, "length");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("vertical-ideographic")) & 1) != 0)
  {
    v7 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("horizontal-ideographic")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "isEqualToString:", CFSTR("horizontal"));
    v7 = 0;
  }
LABEL_13:

  return v7;
}

+ (int)readAnchor:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  TCEnumerationMap *v6;
  void *v7;
  int v8;

  v3 = a3;
  v4 = (void *)+[OAVTextBodyProperties readAnchor:]::anchorEnumMap;
  if (!+[OAVTextBodyProperties readAnchor:]::anchorEnumMap)
  {
    if ((v5 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_38, 0, &dword_22A0CC000);
    }
    v6 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVTextBodyProperties readAnchor:]::anchorEnumStructs, 10, 0);
    v7 = (void *)+[OAVTextBodyProperties readAnchor:]::anchorEnumMap;
    +[OAVTextBodyProperties readAnchor:]::anchorEnumMap = (uint64_t)v6;

    v4 = (void *)+[OAVTextBodyProperties readAnchor:]::anchorEnumMap;
  }
  v8 = objc_msgSend(v4, "valueForString:", v3);

  return v8;
}

+ (int)readRotation:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  TCEnumerationMap *v6;
  void *v7;
  int v8;

  v3 = a3;
  v4 = (void *)+[OAVTextBodyProperties readRotation:]::rotationEnumMap;
  if (!+[OAVTextBodyProperties readRotation:]::rotationEnumMap)
  {
    if ((v5 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_18, 0, &dword_22A0CC000);
    }
    v6 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVTextBodyProperties readRotation:]::rotationEnumStructs, 4, 0);
    v7 = (void *)+[OAVTextBodyProperties readRotation:]::rotationEnumMap;
    +[OAVTextBodyProperties readRotation:]::rotationEnumMap = (uint64_t)v6;

    v4 = (void *)+[OAVTextBodyProperties readRotation:]::rotationEnumMap;
  }
  v8 = objc_msgSend(v4, "valueForString:", v3);

  return v8;
}

+ (int)readWrapStyle:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  TCEnumerationMap *v6;
  void *v7;
  int v8;

  v3 = a3;
  v4 = (void *)+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap;
  if (!+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap)
  {
    if ((v5 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_17, 0, &dword_22A0CC000);
    }
    v6 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVTextBodyProperties readWrapStyle:]::wrapEnumStructs, 5, 0);
    v7 = (void *)+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap;
    +[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap = (uint64_t)v6;

    v4 = (void *)+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap;
  }
  v8 = objc_msgSend(v4, "valueForString:", v3);

  return v8;
}

@end
