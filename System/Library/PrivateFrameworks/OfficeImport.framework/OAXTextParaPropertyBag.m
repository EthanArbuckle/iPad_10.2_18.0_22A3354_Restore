@implementation OAXTextParaPropertyBag

+ (void)readParagraphProperties:(_xmlNode *)a3 paragraphProperties:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  id v14;
  double v15;
  _BOOL4 v16;
  id v17;
  _xmlNode *i;
  void *v19;
  OADBulletColorFollowText *v20;
  OADBulletColorSpecification *v21;
  OADPointBulletSize *v22;
  OADPercentBulletSize *v23;
  double v24;
  _BOOL4 v25;
  OADBulletFontSpecification *v26;
  _BOOL4 v27;
  void *v28;
  int v29;
  OADAutoNumberBulletProperties *v30;
  uint64_t v31;
  OADAutoNumberBulletProperties *v32;
  _BOOL4 v33;
  OADBulletColorFollowText *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  OADCharacterBulletProperties *v38;
  uint64_t v39;
  OADBulletColorFollowText *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  unint64_t v48;
  id v49;
  id v50;
  id v51;
  double v52;
  BOOL v53;
  uint64_t v54;

  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v54 = 0;
    v53 = 0;
    v52 = 0.0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marL", &v54))
    {
      v10 = (double)v54 / 12700.0;
      *(float *)&v10 = v10;
      objc_msgSend(v8, "setLeftMargin:", v10);
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marR", &v54))
    {
      v11 = (double)v54 / 12700.0;
      *(float *)&v11 = v11;
      objc_msgSend(v8, "setRightMargin:", v11);
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lvl", &v54))
      objc_msgSend(v8, "setLevel:", v54);
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"indent", &v54))
    {
      v12 = (double)v54 / 12700.0;
      *(float *)&v12 = v12;
      objc_msgSend(v8, "setIndent:", v12);
    }
    v51 = 0;
    v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"algn", &v51);
    v14 = v51;
    if (v13)
      objc_msgSend(a1, "readAlign:paragraphProperties:", v14, v8);
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defTabSz", &v54, 12))
    {
      v15 = (double)v54 / 12700.0;
      *(float *)&v15 = v15;
      objc_msgSend(v8, "setDefaultTab:", v15);
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtl", &v53))
      objc_msgSend(v8, "setIsRightToLeft:", v53);
    v45 = v14;
    v50 = 0;
    v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"fontAlgn", &v50);
    v17 = v50;
    if (v16)
      objc_msgSend(a1, "readFontAlign:paragraphProperties:", v17, v8);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"latinLnBrk", &v53))
      objc_msgSend(v8, "setIsLatinLineBreak:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hangingPunct", &v53))
      objc_msgSend(v8, "setIsHangingPunctuation:", v53);
    v44 = v17;
    for (i = OCXFirstChild(a3); ; i = OCXNextSibling(i))
    {
      if (!i)
      {

        break;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"lnSpc"))
      {
        objc_msgSend(a1, "readSpacing:drawingState:", i, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLineSpacing:", v19);
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"spcBef"))
      {
        objc_msgSend(a1, "readSpacing:drawingState:", i, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBeforeSpacing:", v19);
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"spcAft"))
      {
        objc_msgSend(a1, "readSpacing:drawingState:", i, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAfterSpacing:", v19);
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"tabLst"))
      {
        objc_msgSend(a1, "readTabList:paragraphProperties:drawingState:", i, v8, v9);
        v19 = 0;
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"defRPr"))
      {
        +[OAXTextCharPropertyBag readCharacterProperties:characterProperties:drawingState:](OAXTextCharPropertyBag, "readCharacterProperties:characterProperties:drawingState:", i, v8, v9);
        v19 = 0;
        goto LABEL_42;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"buClr"))
      {
        +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", i);
        v20 = (OADBulletColorFollowText *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = -[OADBulletColorSpecification initWithBulletColor:]([OADBulletColorSpecification alloc], "initWithBulletColor:", v20);
          objc_msgSend(v8, "setBulletColor:", v21);
LABEL_37:

        }
      }
      else
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"buClrTx"))
        {
          v20 = objc_alloc_init(OADBulletColorFollowText);
          objc_msgSend(v8, "setBulletColor:", v20);
          goto LABEL_40;
        }
        if (xmlStrEqual(i->name, (const xmlChar *)"buSzPts"))
        {
          if (!CXOptionalLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v54))
            goto LABEL_41;
          v22 = [OADPointBulletSize alloc];
          v20 = -[OADPointBulletSize initWithPoints:](v22, "initWithPoints:", ((int)v54 / 100));
          objc_msgSend(v8, "setBulletSize:", v20);
        }
        else
        {
          if (xmlStrEqual(i->name, (const xmlChar *)"buSzPct"))
          {
            if (!CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v52))
              goto LABEL_41;
            v23 = [OADPercentBulletSize alloc];
            v24 = v52 * 100.0;
            *(float *)&v24 = v52 * 100.0;
            v20 = -[OADPercentBulletSize initWithPercent:](v23, "initWithPercent:", v24);
            objc_msgSend(v8, "setBulletSize:", v20);
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buSzTx"))
          {
            v20 = objc_alloc_init(OADBulletSizeFollowText);
            objc_msgSend(v8, "setBulletSize:", v20);
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buFont"))
          {
            v49 = 0;
            v25 = CXOptionalStringAttribute(i, (void *)CXNoNamespace, (xmlChar *)"typeface", &v49);
            v20 = (OADBulletColorFollowText *)v49;
            if (v25)
              v26 = -[OADBulletFontSpecification initWithFont:]([OADBulletFontSpecification alloc], "initWithFont:", v20);
            else
              v26 = objc_alloc_init(OADBulletFontFollowText);
            objc_msgSend(v8, "setBulletFont:", v26);

            v48 = 0;
            if (CXOptionalUnsignedLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"charset", &v48))
              objc_msgSend(v8, "setBulletCharSet:", v48);
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buFontTx"))
          {
            v20 = objc_alloc_init(OADBulletFontFollowText);
            objc_msgSend(v8, "setBulletFont:", v20);
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buAutoNum"))
          {
            v47 = 0;
            v27 = CXOptionalStringAttribute(i, (void *)CXNoNamespace, (xmlChar *)"type", &v47);
            v20 = (OADBulletColorFollowText *)v47;
            if (v27)
            {
              numberBulletSchemeEnumMap();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v20;
              v39 = objc_msgSend(v28, "valueForString:", v20);

              LODWORD(v28) = CXOptionalLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"startAt", &v54);
              v29 = v54;
              v30 = [OADAutoNumberBulletProperties alloc];
              if ((_DWORD)v28)
                v31 = v29;
              else
                v31 = 1;
              v32 = -[OADAutoNumberBulletProperties initWithAutoNumberSchemeType:startIndex:](v30, "initWithAutoNumberSchemeType:startIndex:", v39, v31);
              objc_msgSend(v8, "setBulletProperties:", v32);

              v20 = v40;
            }
            goto LABEL_40;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"buChar"))
          {
            v46 = 0;
            v33 = CXOptionalStringAttribute(i, (void *)CXNoNamespace, (xmlChar *)"char", &v46);
            v34 = (OADBulletColorFollowText *)v46;
            v20 = v34;
            if (!v33)
              goto LABEL_40;
            v35 = -[OADBulletColorFollowText length](v34, "length");
            if (!v35)
              goto LABEL_40;
            v36 = -[OADBulletColorFollowText characterAtIndex:](v20, "characterAtIndex:", 0) & 0xFC00;
            if ((_DWORD)v36 == 55296)
            {
              if (v35 < 2
                || -[OADBulletColorFollowText characterAtIndex:](v20, "characterAtIndex:", 1) >> 10 != 55)
              {
                goto LABEL_40;
              }
              v37 = 2;
            }
            else
            {
              if ((_DWORD)v36 == 56320)
                goto LABEL_40;
              v37 = 1;
            }
            v42 = v37;
            v38 = [OADCharacterBulletProperties alloc];
            -[OADBulletColorFollowText substringToIndex:](v20, "substringToIndex:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[OADCharacterBulletProperties initWithBullet:](v38, "initWithBullet:", v43);

            objc_msgSend(v8, "setBulletProperties:", v21);
            goto LABEL_37;
          }
          if (!xmlStrEqual(i->name, (const xmlChar *)"buBlip"))
          {
            if (!xmlStrEqual(i->name, (const xmlChar *)"buNone"))
              goto LABEL_41;
            v20 = objc_alloc_init(OADNullBulletProperties);
            objc_msgSend(v8, "setBulletProperties:", v20);
            goto LABEL_40;
          }
          objc_msgSend(v9, "packagePart");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[OAXFill readBlipRefFromXmlNode:packagePart:forDrawable:drawingState:forBullet:](OAXFill, "readBlipRefFromXmlNode:packagePart:forDrawable:drawingState:forBullet:", i, v41, 0, v9, 1);
          v20 = (OADBulletColorFollowText *)objc_claimAutoreleasedReturnValue();

          if (v20 && (-[OADBulletColorFollowText isNull](v20, "isNull") & 1) == 0)
          {
            v21 = -[OADImageBulletProperties initWithBlipRef:]([OADImageBulletProperties alloc], "initWithBlipRef:", v20);
            objc_msgSend(v8, "setBulletProperties:", v21);
            goto LABEL_37;
          }
        }
      }
LABEL_40:

LABEL_41:
      v19 = 0;
LABEL_42:

    }
  }

}

+ (void)readAlign:(id)a3 paragraphProperties:(id)a4
{
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (textAlignEnumMap(void)::once != -1)
    dispatch_once(&textAlignEnumMap(void)::once, &__block_literal_global_155);
  v6 = (id)textAlignEnumMap(void)::theEnumMap;
  objc_msgSend(v5, "setAlign:", objc_msgSend(v6, "valueForString:", v7));

}

+ (void)readFontAlign:(id)a3 paragraphProperties:(id)a4
{
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (fontAlignEnumMap(void)::once != -1)
    dispatch_once(&fontAlignEnumMap(void)::once, &__block_literal_global_165_0);
  v6 = (id)fontAlignEnumMap(void)::theEnumMap;
  objc_msgSend(v5, "setFontAlign:", objc_msgSend(v6, "valueForString:", v7));

}

+ (int)readBulletScheme:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("alphaLcParenBoth")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("alphaLcParenR")) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("alphaLcPeriod")) & 1) != 0)
    {
      v5 = 5;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("alphaUcParenBoth")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("alphaUcParenR")) & 1) != 0)
    {
      v5 = 4;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("alphaUcPeriod")) & 1) != 0)
    {
      v5 = 6;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabic1Minus")) & 1) != 0)
    {
      v5 = 13;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabic2Minus")) & 1) != 0)
    {
      v5 = 14;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabicDbPeriod")) & 1) != 0)
    {
      v5 = 11;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabicDbPlain")) & 1) != 0)
    {
      v5 = 12;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabicParenBoth")) & 1) != 0)
    {
      v5 = 7;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabicParenR")) & 1) != 0)
    {
      v5 = 8;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabicPeriod")) & 1) != 0)
    {
      v5 = 9;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arabicPlain")) & 1) != 0)
    {
      v5 = 10;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("circleNumDbPlain")) & 1) != 0)
    {
      v5 = 22;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("circleNumWdBlackPlain")) & 1) != 0)
    {
      v5 = 23;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("circleNumWdWhitePlain")) & 1) != 0)
    {
      v5 = 24;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ea1ChsPeriod")) & 1) != 0)
    {
      v5 = 25;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ea1ChsPlain")) & 1) != 0)
    {
      v5 = 26;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ea1ChtPeriod")) & 1) != 0)
    {
      v5 = 27;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ea1ChtPlain")) & 1) != 0)
    {
      v5 = 28;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ea1JpnChsDbPeriod")) & 1) != 0)
    {
      v5 = 29;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ea1JpnKorPeriod")) & 1) != 0)
    {
      v5 = 31;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ea1JpnKorPlain")) & 1) != 0)
    {
      v5 = 30;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("hebrew2Minus")) & 1) != 0)
    {
      v5 = 15;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("hindiAlpha1Period")) & 1) != 0)
    {
      v5 = 41;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("hindiAlphaPeriod")) & 1) != 0)
    {
      v5 = 38;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("hindiNumParenR")) & 1) != 0)
    {
      v5 = 40;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("hindiNumPeriod")) & 1) != 0)
    {
      v5 = 39;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("romanLcParenBoth")) & 1) != 0)
    {
      v5 = 16;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("romanLcParenR")) & 1) != 0)
    {
      v5 = 18;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("romanLcPeriod")) & 1) != 0)
    {
      v5 = 20;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("romanUcParenBoth")) & 1) != 0)
    {
      v5 = 17;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("romanUcParenR")) & 1) != 0)
    {
      v5 = 19;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("romanUcPeriod")) & 1) != 0)
    {
      v5 = 21;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thaiAlphaParenBoth")) & 1) != 0)
    {
      v5 = 34;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thaiAlphaParenR")) & 1) != 0)
    {
      v5 = 33;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thaiAlphaPeriod")) & 1) != 0)
    {
      v5 = 32;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thaiNumParenBoth")) & 1) != 0)
    {
      v5 = 37;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("thaiNumParenR")) & 1) != 0)
    {
      v5 = 36;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("thaiNumPeriod")))
    {
      v5 = 35;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)readSpacing:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  CXNamespace *v6;
  _xmlNode *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  _BOOL4 v10;
  OADPercentTextSpacing *v12;
  double v13;
  uint64_t v14;
  _BOOL4 v15;
  OADPointTextSpacing *v17;
  void *v18;
  uint64_t v20;

  v5 = a4;
  objc_msgSend(v5, "OAXMainNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "spcPct");

  objc_msgSend(v5, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "spcPts");

  if (!v7)
  {
    if (v9)
    {
      *(double *)&v20 = 0.0;
      v15 = CXOptionalLongAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v20);
      if (v20 >= 0 && v15)
      {
        v17 = [OADPointTextSpacing alloc];
        v14 = -[OADPointTextSpacing initWithPoints:](v17, "initWithPoints:", ((int)v20 / 100));
        goto LABEL_13;
      }
    }
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  *(double *)&v20 = 0.0;
  v10 = CXOptionalFractionAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", (double *)&v20);
  if (*(double *)&v20 < 0.0 || !v10)
    goto LABEL_14;
  v12 = [OADPercentTextSpacing alloc];
  v13 = *(double *)&v20 * 100.0;
  *(float *)&v13 = *(double *)&v20 * 100.0;
  v14 = -[OADPercentTextSpacing initWithPercent:](v12, "initWithPercent:", v13);
LABEL_13:
  v18 = (void *)v14;
LABEL_15:

  return v18;
}

+ (void)readTabList:(_xmlNode *)a3 paragraphProperties:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  id v9;
  CXNamespace *v10;
  _xmlNode *Child;
  _BOOL4 v12;
  id v13;
  OADTabStop *v14;
  id v15;
  CXNamespace *v16;
  id v17;
  uint64_t v18;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v8, "OAXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v10, "tab");

  while (Child)
  {
    v18 = 0;
    if (CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"pos", &v18, 12))
    {
      v17 = 0;
      v12 = CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"algn", &v17);
      v13 = v17;
      if (v12)
      {
        v14 = objc_alloc_init(OADTabStop);
        -[OADTabStop setPosition:](v14, "setPosition:", (int)((double)v18 / 12700.0));
        if (tabStopAlignEnumMap(void)::once != -1)
          dispatch_once(&tabStopAlignEnumMap(void)::once, &__block_literal_global_145);
        v15 = (id)tabStopAlignEnumMap(void)::theEnumMap;
        -[OADTabStop setAlign:](v14, "setAlign:", objc_msgSend(v15, "valueForString:", v13));

        objc_msgSend(v9, "addObject:", v14);
      }
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v8, "OAXMainNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v16, (xmlChar *)"tab");

  }
  objc_msgSend(v7, "setTabStops:", v9);

}

@end
