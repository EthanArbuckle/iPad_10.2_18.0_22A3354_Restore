@implementation PFXColumnStyle

+ (unsigned)mapVerticalAlignmentWithPropertySet:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = objc_msgSend(a3, "valueForProperty:", "vertical-align");
  if (v3)
  {
    v4 = objc_msgSend(v3, "lastObject");
    if (objc_msgSend(v4, "type") == &stru_108)
    {
      v5 = objc_msgSend(v4, "value");
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("middle")) & 1) != 0)
      {
        LODWORD(v3) = 1;
      }
      else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
      {
        LODWORD(v3) = 2;
      }
      else if (objc_msgSend(v5, "isEqualToString:", CFSTR("justify")))
      {
        LODWORD(v3) = 3;
      }
      else
      {
        LODWORD(v3) = 0;
      }
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

+ (unint64_t)getColumnCountFromPropertySet:(id)a3 maximumColumnCount:(unint64_t)a4
{
  id v5;
  id v6;
  unint64_t result;

  v5 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubColumnCount[0]);
  if (!v5)
    return 1;
  v6 = objc_msgSend(v5, "lastObject");
  if (objc_msgSend(v6, "type") != &stru_108.addr)
    return 1;
  result = (unint64_t)objc_msgSend(objc_msgSend(v6, "value"), "integerValue");
  if (result >= a4)
    return a4;
  return result;
}

+ (id)createColumnsWithPropertySet:(id)a3 columnCount:(unint64_t)a4 readerState:(id)a5
{
  id v8;
  double v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t i;
  double v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t j;
  double v20;
  double v21;
  id v22;
  _QWORD v24[9];
  double v25[10];

  bzero(v25, 0x50uLL);
  bzero(v24, 0x48uLL);
  v8 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubColumnGap[0]);
  v9 = 0.0;
  if (v8)
  {
    v10 = v8;
    v11 = objc_msgSend(v8, "count");
    v12 = (unint64_t)v11 >= a4 - 1 ? a4 - 1 : (unint64_t)v11;
    if (v12)
    {
      for (i = 0; i != v12; ++i)
      {
        +[PFXStyleUtilities percentageWidthInPair:readerState:](PFXStyleUtilities, "percentageWidthInPair:readerState:", objc_msgSend(v10, "objectAtIndex:", i), a5);
        if (v9 + v14 > 0.75)
          v14 = 0.75 - v9;
        *(double *)&v24[i] = v14;
        v9 = v9 + v14;
      }
      v9 = v9 + 0.0;
    }
  }
  v15 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubColumnWidth[0]);
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "count");
    if ((unint64_t)v17 >= a4)
      v18 = a4;
    else
      v18 = (unint64_t)v17;
    if (v18)
    {
      for (j = 0; j != v18; ++j)
      {
        +[PFXStyleUtilities percentageWidthInPair:readerState:](PFXStyleUtilities, "percentageWidthInPair:readerState:", objc_msgSend(v16, "objectAtIndex:", j), a5);
        if (v9 + v20 > 1.0)
          v20 = 1.0 - v9;
        v25[j] = v20;
        v9 = v9 + v20;
      }
    }
    v21 = 1.0 - v9;
    if (1.0 - v9 > 0.0)
    {
      v25[a4 - 1] = v21 + v25[a4 - 1];
      v9 = v9 + v21;
    }
  }
  v22 = objc_alloc((Class)TSWPColumns);
  if (v9 <= 1.0)
    return objc_msgSend(v22, "initWithColumnCount:equalWidth:widthArray:gapArray:", a4, v16 == 0, v25, v24);
  else
    return objc_msgSend(v22, "initWithColumnCount:", a4);
}

+ (BOOL)propertiesHaveColumnStyle:(id)a3
{
  return objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubColumnCount[0]) != 0;
}

+ (id)createColumnsWithPropertySet:(id)a3 readerState:(id)a4
{
  id v7;
  id result;

  if (!objc_msgSend(a1, "propertiesHaveColumnStyle:"))
    return objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithColumnCount:", 1);
  v7 = objc_msgSend(a1, "getColumnCountFromPropertySet:maximumColumnCount:", a3, 10);
  if ((unint64_t)v7 < 2)
    return objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithColumnCount:", 1);
  result = objc_msgSend(a1, "createColumnsWithPropertySet:columnCount:readerState:", a3, v7, a4);
  if (!result)
    return objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithColumnCount:", 1);
  return result;
}

+ (BOOL)propertiesHaveInset:(id)a3
{
  return objc_msgSend(a3, "valueForProperty:", "padding")
      || objc_msgSend(a3, "valueForProperty:", "padding-top")
      || objc_msgSend(a3, "valueForProperty:", "padding-bottom")
      || objc_msgSend(a3, "valueForProperty:", "padding-left")
      || objc_msgSend(a3, "valueForProperty:", "padding-right") != 0;
}

+ (id)createPaddingWithPropertySet:(id)a3 readerState:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  id v12;
  double v13;
  id v14;
  double v15;
  id v16;
  double v17;
  id v18;
  double v19;

  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (objc_msgSend(a1, "propertiesHaveInset:"))
  {
    v10 = objc_msgSend(a3, "valueForProperty:", "padding");
    if (v10)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v10, "lastObject"), a4);
      v9 = v11;
    }
    v12 = objc_msgSend(a3, "valueForProperty:", "padding-top");
    v6 = v9;
    if (v12)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v12, "lastObject"), a4);
      v6 = v13;
    }
    v14 = objc_msgSend(a3, "valueForProperty:", "padding-bottom");
    v7 = v9;
    if (v14)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v14, "lastObject"), a4);
      v7 = v15;
    }
    v16 = objc_msgSend(a3, "valueForProperty:", "padding-left");
    v8 = v9;
    if (v16)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v16, "lastObject"), a4);
      v8 = v17;
    }
    v18 = objc_msgSend(a3, "valueForProperty:", "padding-right");
    if (v18)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v18, "lastObject"), a4);
      v9 = v19;
    }
  }
  return objc_msgSend(objc_alloc((Class)TSWPPadding), "initWithTopInset:leftInset:bottomInset:rightInset:", v6, v8, v7, v9);
}

@end
