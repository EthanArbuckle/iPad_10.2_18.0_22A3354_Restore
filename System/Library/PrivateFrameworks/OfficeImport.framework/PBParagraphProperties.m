@implementation PBParagraphProperties

+ (void)readParagraphProperties:(id)a3 paragraphProperty:(void *)a4 bulletStyle:(PptParaProperty9 *)a5 isMaster:(BOOL)a6 state:(id)a7
{
  id v11;
  id v12;
  OADBulletSizeFollowText *v13;
  int v14;
  OADPercentBulletSize *v15;
  double v16;
  OADPointBulletSize *v17;
  OADBulletColorFollowText *v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  OADRgbColor *v23;
  double v24;
  double v25;
  double v26;
  OADSchemeColor *v27;
  OADBulletColorSpecification *v28;
  OADBulletFontFollowText *v29;
  OADBulletFontSpecification *v30;
  void *v31;
  OADBulletFontSpecification *v32;
  OADCharacterBulletProperties *v33;
  void *v34;
  __int16 v35;
  int v36;
  OADPercentTextSpacing *v37;
  double v38;
  OADPointTextSpacing *v39;
  OADPointTextSpacing *v40;
  int v41;
  OADPercentTextSpacing *v42;
  double v43;
  OADPointTextSpacing *v44;
  OADPointTextSpacing *v45;
  int v46;
  OADPercentTextSpacing *v47;
  double v48;
  OADPointTextSpacing *v49;
  OADPointTextSpacing *v50;
  double v51;
  double v52;
  _QWORD *v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  OADTabStop *v58;
  unint64_t v59;
  double v60;
  id v61;
  void *v62;
  __int16 v63;

  v11 = a3;
  v12 = a7;
  if ((*(_WORD *)((_BYTE *)a4 + 3) & 8) != 0)
  {
    v14 = *((__int16 *)a4 + 5);
    if (v14 < 1)
    {
      v17 = -[OADPointBulletSize initWithPoints:]([OADPointBulletSize alloc], "initWithPoints:", -v14);
    }
    else
    {
      v15 = [OADPercentBulletSize alloc];
      *(float *)&v16 = (float)v14;
      v17 = -[OADPercentBulletSize initWithPercent:](v15, "initWithPercent:", v16);
    }
    v13 = (OADBulletSizeFollowText *)v17;
    objc_msgSend(v11, "setBulletSize:", v17);
  }
  else
  {
    v13 = objc_alloc_init(OADBulletSizeFollowText);
    objc_msgSend(v11, "setBulletSize:", v13);
  }

  if ((*(_WORD *)((_BYTE *)a4 + 3) & 4) != 0)
  {
    v19 = *((_DWORD *)a4 + 5);
    if (v19 == 255)
      goto LABEL_15;
    if (v19 == 254)
    {
      v20 = *((unsigned __int16 *)a4 + 7);
      v21 = *((unsigned __int16 *)a4 + 8);
      v22 = *((unsigned __int16 *)a4 + 9);
      v23 = [OADRgbColor alloc];
      *(float *)&v24 = (float)v20;
      *(float *)&v25 = (float)v21;
      *(float *)&v26 = (float)v22;
      v27 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v23, "initWithRedByte:greenByte:blueByte:", v24, v25, v26);
    }
    else
    {
      v27 = -[OADSchemeColor initWithSchemeColorIndex:]([OADSchemeColor alloc], "initWithSchemeColorIndex:", +[PBColorScheme oadSchemeColorValueForEshSchemeColorIndex:](PBColorScheme, "oadSchemeColorValueForEshSchemeColorIndex:", (unsigned __int16)*((_DWORD *)a4 + 5)));
    }
    v18 = (OADBulletColorFollowText *)v27;
    TCVerifyInputMeetsCondition(v27 != 0);
    v28 = -[OADBulletColorSpecification initWithBulletColor:]([OADBulletColorSpecification alloc], "initWithBulletColor:", v18);
    objc_msgSend(v11, "setBulletColor:", v28);

  }
  else
  {
    v18 = objc_alloc_init(OADBulletColorFollowText);
    objc_msgSend(v11, "setBulletColor:", v18);
  }

LABEL_15:
  if ((*(_WORD *)((_BYTE *)a4 + 3) & 2) != 0)
  {
    objc_msgSend(v12, "fontEntityAtIndex:", *((unsigned __int16 *)a4 + 4));
    v29 = (OADBulletFontFollowText *)objc_claimAutoreleasedReturnValue();
    TCVerifyInputMeetsCondition(v29 != 0);
    v30 = [OADBulletFontSpecification alloc];
    -[OADBulletFontFollowText faceName](v29, "faceName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[OADBulletFontSpecification initWithFont:](v30, "initWithFont:", v31);

    objc_msgSend(v11, "setBulletFont:", v32);
    objc_msgSend(v11, "setBulletCharSet:", -[OADBulletFontFollowText charSet](v29, "charSet"));

  }
  else
  {
    v29 = objc_alloc_init(OADBulletFontFollowText);
    objc_msgSend(v11, "setBulletFont:", v29);
  }

  if ((*(_WORD *)((_BYTE *)a4 + 3) & 1) != 0)
  {
    if (!a5
      || (+[PBBulletProperties readBulletProperties:state:](PBBulletProperties, "readBulletProperties:state:", a5, v12), (v33 = (OADCharacterBulletProperties *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v63 = *((_WORD *)a4 + 3);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v63, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[OADCharacterBulletProperties initWithBullet:]([OADCharacterBulletProperties alloc], "initWithBullet:", v34);

    }
  }
  else
  {
    v33 = objc_alloc_init(OADNullBulletProperties);
  }
  objc_msgSend(v11, "setBulletProperties:", v33);
  v35 = *(_WORD *)a4;
  if ((*(_WORD *)a4 & 0x800) != 0)
  {
    v36 = *((__int16 *)a4 + 12);
    if (v36 < 0)
    {
      v39 = -[OADPointTextSpacing initWithPoints:]([OADPointTextSpacing alloc], "initWithPoints:", -v36 >> 3);
    }
    else
    {
      v37 = [OADPercentTextSpacing alloc];
      *(float *)&v38 = (float)v36;
      v39 = -[OADPercentTextSpacing initWithPercent:](v37, "initWithPercent:", v38);
    }
    v40 = v39;
    objc_msgSend(v11, "setLineSpacing:", v39);

    v35 = *(_WORD *)a4;
  }
  if ((v35 & 0x1000) != 0)
  {
    v41 = *((__int16 *)a4 + 13);
    if (v41 < 0)
    {
      v44 = -[OADPointTextSpacing initWithPoints:]([OADPointTextSpacing alloc], "initWithPoints:", -v41 >> 3);
    }
    else
    {
      v42 = [OADPercentTextSpacing alloc];
      *(float *)&v43 = (float)v41;
      v44 = -[OADPercentTextSpacing initWithPercent:](v42, "initWithPercent:", v43);
    }
    v45 = v44;
    objc_msgSend(v11, "setBeforeSpacing:", v44);

    v35 = *(_WORD *)a4;
  }
  if ((v35 & 0x2000) != 0)
  {
    v46 = *((__int16 *)a4 + 14);
    if (v46 < 0)
    {
      v49 = -[OADPointTextSpacing initWithPoints:]([OADPointTextSpacing alloc], "initWithPoints:", -v46 >> 3);
    }
    else
    {
      v47 = [OADPercentTextSpacing alloc];
      *(float *)&v48 = (float)v46;
      v49 = -[OADPercentTextSpacing initWithPercent:](v47, "initWithPercent:", v48);
    }
    v50 = v49;
    objc_msgSend(v11, "setAfterSpacing:", v49);

  }
  objc_msgSend(a1, "readAlign:pptAlignmentType:", v11, *((_BYTE *)a4 + 4) & 0xF);
  *(float *)&v51 = (float)*((__int16 *)a4 + 15) * 0.125;
  objc_msgSend(v11, "setLeftMargin:", v51);
  v53 = (_QWORD *)*((_QWORD *)a4 + 5);
  if (v53)
  {
    v61 = v12;
    v54 = v53[1] - *v53;
    v55 = (v54 >> 3);
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v55);
    if ((v54 & 0x7FFFFFFF8) != 0)
    {
      v57 = 0;
      do
      {
        v58 = objc_alloc_init(OADTabStop);
        v59 = *(_QWORD *)(*v53 + 8 * v57);
        -[OADTabStop setAlign:](v58, "setAlign:", v59);
        -[OADTabStop setPosition:](v58, "setPosition:", ((__int16)(WORD2(v59) + ((((int)(v59 >> 16) >> 16) >> 28) & 7)) >> 3));
        objc_msgSend(v56, "addObject:", v58);

        ++v57;
      }
      while (v55 != v57);
    }
    objc_msgSend(v11, "setTabStops:", v56, v61);

    v12 = v62;
  }
  *(float *)&v52 = (float)(*((__int16 *)a4 + 16) - *((__int16 *)a4 + 15)) * 0.125;
  objc_msgSend(v11, "setIndent:", v52);
  *(float *)&v60 = (float)*((__int16 *)a4 + 17) * 0.125;
  objc_msgSend(v11, "setDefaultTab:", v60);

}

+ (void)readAlign:(id)a3 pptAlignmentType:(int)a4
{
  id v5;
  unint64_t v6;
  id v7;

  v5 = a3;
  v6 = 0x503020100uLL >> (8 * a4);
  if (a4 >= 5)
    LOBYTE(v6) = 0;
  v7 = v5;
  objc_msgSend(v5, "setAlign:", v6 & 7);

}

+ (void)readParagraphProperties:(id)a3 paragraphPropertyRun:(void *)a4 bulletStyle:(PptParaProperty9 *)a5 state:(id)a6
{
  id v10;
  id v11;

  v11 = a3;
  v10 = a6;
  objc_msgSend(v11, "setLevel:", *((__int16 *)a4 + 2));
  objc_msgSend(a1, "readParagraphProperties:paragraphProperty:bulletStyle:isMaster:state:", v11, (char *)a4 + 8, a5, 0, v10);

}

+ (signed)pptTextSpacingWithOADParaSpacing:(id)a3 defaultPptParaSpacing:(signed __int16)a4
{
  int v4;
  id v5;
  float v6;

  LOWORD(v4) = a4;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "percent");
    v4 = (int)v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      LOWORD(v4) = -8 * objc_msgSend(v5, "points");
  }

  return v4;
}

+ (int)pptAlignmentTypeWithOADTextAlignType:(unsigned __int8)a3
{
  if ((a3 - 1) > 5)
    return 0;
  else
    return dword_22A4D37BC[(char)(a3 - 1)];
}

+ (int)pptFontAlignWithOADTextFontAlign:(unsigned __int8)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

@end
