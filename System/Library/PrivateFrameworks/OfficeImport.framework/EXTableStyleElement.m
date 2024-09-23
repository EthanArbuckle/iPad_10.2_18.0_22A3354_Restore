@implementation EXTableStyleElement

+ (id)edTableStyleElementFromXmlTableStyleElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  EDTableStyleElement *v7;
  void *v8;
  EDTableStyleElement *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  id v16;

  v6 = a4;
  if (a3)
  {
    v7 = [EDTableStyleElement alloc];
    objc_msgSend(v6, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EDTableStyleElement initWithResources:](v7, "initWithResources:", v8);

    v16 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v16);
    v10 = v16;
    -[EDTableStyleElement setType:](v9, "setType:", objc_msgSend(a1, "edStyleTableTypeFromXmlStyleTableType:", v10));
    v15 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"size", &v15))
      -[EDTableStyleElement setBandSize:](v9, "setBandSize:", v15);
    v14 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dxfId", &v14))
    {
      v11 = objc_msgSend(v6, "isPredefinedDxfsBeingRead");
      v12 = v14;
      if (v11)
        v12 = --v14;
      -[EDTableStyleElement setDifferentialStyleWithIndex:](v9, "setDifferentialStyleWithIndex:", v12);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int)edStyleTableTypeFromXmlStyleTableType:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_58;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("wholeTable")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("headerRow")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("totalRow")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstColumn")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("lastColumn")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstRowStripe")) & 1) != 0)
    {
      v5 = 6;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("secondRowStripe")) & 1) != 0)
    {
      v5 = 7;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstColumnStripe")) & 1) != 0)
    {
      v5 = 8;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("secondColumnStripe")) & 1) != 0)
    {
      v5 = 9;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstHeaderCell")) & 1) != 0)
    {
      v5 = 10;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("lastHeaderCell")) & 1) != 0)
    {
      v5 = 11;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstTotalCell")) & 1) != 0)
    {
      v5 = 12;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("lastTotalCell")) & 1) != 0)
    {
      v5 = 13;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstSubtotalColumn")) & 1) != 0)
    {
      v5 = 15;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("secondSubtotalColumn")) & 1) != 0)
    {
      v5 = 16;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thirdSubtotalColumn")) & 1) != 0)
    {
      v5 = 17;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstSubtotalRow")) & 1) != 0)
    {
      v5 = 18;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("secondSubtotalRow")) & 1) != 0)
    {
      v5 = 19;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thirdSubtotalRow")) & 1) != 0)
    {
      v5 = 20;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("blankRow")) & 1) != 0)
    {
      v5 = 21;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstColumnSubheading")) & 1) != 0)
    {
      v5 = 22;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("secondColumnSubheading")) & 1) != 0)
    {
      v5 = 23;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thirdColumnSubheading")) & 1) != 0)
    {
      v5 = 24;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("firstRowSubheading")) & 1) != 0)
    {
      v5 = 25;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("secondRowSubheading")) & 1) != 0)
    {
      v5 = 26;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thirdRowSubheading")) & 1) != 0)
    {
      v5 = 27;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("pageFieldLabels")) & 1) != 0)
    {
      v5 = 28;
      goto LABEL_59;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("pageFieldValues")) & 1) != 0)
    {
      v5 = 29;
      goto LABEL_59;
    }
LABEL_58:
    v5 = 0;
    goto LABEL_59;
  }
  v5 = 1;
LABEL_59:

  return v5;
}

@end
