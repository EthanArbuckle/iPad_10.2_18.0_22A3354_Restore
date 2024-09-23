@implementation WBCharacterProperties

+ (void)readFrom:(id)a3 wrdProperties:(WrdCharacterProperties *)a4 tracked:(WrdCharacterProperties *)a5 document:(id)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;

  v14 = a3;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v13, "setResolveMode:", 0);
  objc_msgSend(a1, "readFrom:wrdProperties:document:properties:", v14, a4, v12, v13);
  if (a5)
  {
    objc_msgSend(v13, "setResolveMode:", 1);
    objc_msgSend(a1, "readFrom:wrdProperties:document:properties:", v14, a5, v12, v13);
  }
  objc_msgSend(v13, "setResolveMode:", 2);

}

+ (void)readFrom:(id)a3 wrdProperties:(WrdCharacterProperties *)a4 document:(id)a5 properties:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t var2;
  unint64_t v15;
  WrdBorder *BorderReference;
  void *v17;
  WrdShading *ShadingReference;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int *p_var29;
  uint64_t v31;
  int v32;
  uint64_t var13;
  void *v34;
  _BOOL8 v35;
  uint64_t v36;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!a4 || !v12)
    goto LABEL_135;
  var2 = (uint64_t)a4->var2;
  if ((var2 & 0x40000000000000) != 0)
  {
    BorderReference = WrdCharacterProperties::getBorderReference(a4);
    objc_msgSend(v13, "mutableBorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BorderReference, v17);

    v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
    var2 = (uint64_t)a4->var2;
    if ((var2 & 0x400000) == 0)
    {
LABEL_5:
      if ((var2 & 0x2000) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else
  {
    v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
    if ((var2 & 0x400000) == 0)
      goto LABEL_5;
  }
  ShadingReference = WrdCharacterProperties::getShadingReference(a4);
  objc_msgSend(v13, "mutableShading");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBShading readFrom:to:](WBShading, "readFrom:to:", ShadingReference, v19);

  v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
  var2 = (uint64_t)a4->var2;
  if ((var2 & 0x2000) == 0)
  {
LABEL_6:
    if ((var2 & 0x40000000000) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_14:
  objc_msgSend(v10, "fontAtIndex:", a4->var43);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v13, "setFont:", v20);

  v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
  var2 = (uint64_t)a4->var2;
  if ((var2 & 0x40000000000) == 0)
  {
LABEL_7:
    if ((var2 & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_17:
  objc_msgSend(v10, "fontAtIndex:", a4->var46);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v13, "setExtendedFont:", v21);

  v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
  var2 = (uint64_t)a4->var2;
  if ((var2 & 0x4000) == 0)
  {
LABEL_8:
    if ((var2 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_20:
  objc_msgSend(v10, "fontAtIndex:", a4->var44);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v13, "setFarEastFont:", v22);

  v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
  var2 = (uint64_t)a4->var2;
  if ((var2 & 0x8000) == 0)
  {
LABEL_9:
    if ((v15 & 0x4000000000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_23:
  objc_msgSend(v10, "fontAtIndex:", a4->var45);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v13, "setSymbolFont:", v23);

  v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
  var2 = (uint64_t)a4->var2;
  if ((v15 & 0x4000000000) == 0)
  {
LABEL_10:
    if ((v15 & 0x2000000000) == 0)
      goto LABEL_32;
    goto LABEL_29;
  }
LABEL_26:
  objc_msgSend(a1, "formattingChangeDate:", a4->var12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDeletionDate:", v24);

  v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
  if ((*((_DWORD *)&a4->var2 + 2) & 0x4000) != 0)
  {
    objc_msgSend(v13, "setIndexToAuthorIDOfDeletion:", a4->var71);
    objc_msgSend(v13, "deletionDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addChangeTrackingEditAtDate:authorIndex:", v25, objc_msgSend(v13, "indexToAuthorIDOfDeletion"));

    v15 = *((unsigned int *)&a4->var2 + 2) | ((unint64_t)*((unsigned __int16 *)&a4->var2 + 6) << 32);
  }
  var2 = (uint64_t)a4->var2;
  if ((v15 & 0x2000000000) != 0)
  {
LABEL_29:
    objc_msgSend(a1, "formattingChangeDate:", a4->var11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEditDate:", v26);

    var2 = (uint64_t)a4->var2;
    if ((var2 & 0x80000000000000) != 0)
    {
      objc_msgSend(v13, "setIndexToAuthorIDOfEdit:", a4->var61);
      objc_msgSend(v13, "editDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addChangeTrackingEditAtDate:authorIndex:", v27, objc_msgSend(v13, "indexToAuthorIDOfEdit"));

      LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
      var2 = (uint64_t)a4->var2;
    }
    else
    {
      LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    }
  }
LABEL_32:
  if ((~(_DWORD)v15 & 0x3000000) == 0)
  {
    objc_msgSend(v13, "setIndexToAuthorIDOfFormattingChange:", a4->var69);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x10) != 0)
  {
    objc_msgSend(v13, "setOutline:", a4->var25);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x100) != 0)
  {
    objc_msgSend(v13, "setShadow:", a4->var30);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x200) != 0)
  {
    objc_msgSend(v13, "setEmbossed:", a4->var31);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x400) != 0)
  {
    objc_msgSend(v13, "setImprint:", a4->var32);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x100000) != 0)
  {
    objc_msgSend(v13, "setUnderline:", a4->var16);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x10000000000000) != 0)
  {
    objc_msgSend(v13, "setKerning:", a4->var63);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x100000000000) != 0)
  {
    objc_msgSend(v13, "setTextScale:", a4->var60);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x20000000000000) != 0)
  {
    +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", &a4->var3.var3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUnderlineColor:", v28);

    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x8000000) != 0)
  {
    objc_msgSend(v10, "styleAtIndex:expectedType:", a4->var72, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBaseStyle:", v29);

    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x4000000000) != 0)
  {
    objc_msgSend(v13, "setRightToLeft:", a4->var38);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x100000000000000) != 0)
  {
    objc_msgSend(v13, "setHorizontalInVertical:", (*((_DWORD *)a4 + 85) >> 10) & 1);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((v15 & 2) != 0)
  {
    objc_msgSend(v13, "setCompressHorizontalInVertical:", (*((_DWORD *)a4 + 85) >> 17) & 1);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x1000000000000000) != 0)
  {
    objc_msgSend(v13, "setHorizontalInVertical:", (*((_DWORD *)a4 + 85) >> 13) & 1);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x800000000000000) != 0)
  {
    objc_msgSend(v13, "setTwoLinesInOne:", (*((_DWORD *)a4 + 85) >> 12) & 1);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if (var2 < 0)
  {
    objc_msgSend(v13, "setBracketTwoLinesInOne:", a4->var18);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((v15 & 0x20) != 0)
  {
    objc_msgSend(v13, "setSymbolCharacter:", a4->var50);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 2) != 0)
  {
    objc_msgSend(v13, "setBold:", a4->var23);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x800000000) != 0)
  {
    objc_msgSend(v13, "setBoldForBiText:", a4->var33);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 4) != 0)
  {
    objc_msgSend(v13, "setItalic:", a4->var24);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x1000000000) != 0)
  {
    objc_msgSend(v13, "setItalicForBiText:", a4->var34);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x80) != 0)
  {
    objc_msgSend(v13, "setStrikeThrough:", a4->var26);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x800) != 0)
  {
    objc_msgSend(v13, "setDoubleStrikeThrough:", (*((_DWORD *)a4 + 85) >> 6) & 1);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((v15 & 0x100000) != 0)
  {
    objc_msgSend(v13, "setHighlight:", (*((_DWORD *)a4 + 85) >> 20) & 1);
    LODWORD(v15) = *((_DWORD *)&a4->var2 + 2);
    var2 = (uint64_t)a4->var2;
  }
  if ((v15 & 0x80000) != 0)
  {
    objc_msgSend(v13, "setHighlightColor:", a4->var20);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x10000000) != 0)
  {
    objc_msgSend(v13, "setSmallCaps:", a4->var27);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x20000000) != 0)
  {
    objc_msgSend(v13, "setCaps:", a4->var28);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x100000000) != 0)
  {
    objc_msgSend(v13, "setLowerCase:", (*((_DWORD *)a4 + 85) >> 3) & 1);
    var2 = (uint64_t)a4->var2;
  }
  if ((var2 & 0x20) != 0)
  {
    p_var29 = &a4->var29;
  }
  else
  {
    if ((var2 & 0x2000000000) == 0)
      goto LABEL_93;
    p_var29 = &a4->var35;
  }
  objc_msgSend(v13, "setHidden:", *p_var29);
LABEL_93:
  v31 = (uint64_t)a4->var2;
  if ((v31 & 0x80000000000) != 0)
  {
    objc_msgSend(v13, "setSpacing:", SLOWORD(a4->var49));
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
    if ((v31 & 0x200000) == 0)
    {
LABEL_95:
      if ((v31 & 0x1000) == 0)
        goto LABEL_96;
      goto LABEL_103;
    }
  }
  else
  {
    v32 = *((_DWORD *)&a4->var2 + 2);
    if ((v31 & 0x200000) == 0)
      goto LABEL_95;
  }
  objc_msgSend(v13, "setPosition:", a4->var105);
  v32 = *((_DWORD *)&a4->var2 + 2);
  v31 = (uint64_t)a4->var2;
  if ((v31 & 0x1000) == 0)
  {
LABEL_96:
    if ((v31 & 0x80000) == 0)
      goto LABEL_97;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(v13, "setFontSize:", a4->var62);
  v32 = *((_DWORD *)&a4->var2 + 2);
  v31 = (uint64_t)a4->var2;
  if ((v31 & 0x80000) == 0)
  {
LABEL_97:
    if ((v31 & 0x40000) == 0)
      goto LABEL_98;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(v13, "setVerticalAlign:", a4->var15);
  v32 = *((_DWORD *)&a4->var2 + 2);
  v31 = (uint64_t)a4->var2;
  if ((v31 & 0x40000) == 0)
  {
LABEL_98:
    if ((v31 & 0x10000) == 0)
      goto LABEL_99;
LABEL_106:
    +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", (char *)&a4->var2 + 14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
LABEL_109:
      objc_msgSend(v13, "setColor:", v34);

      v32 = *((_DWORD *)&a4->var2 + 2);
      v31 = (uint64_t)a4->var2;
      goto LABEL_110;
    }
    var13 = 31;
LABEL_108:
    v36 = 255;
    WrdProperty::convertWord97ColorEnumToColor(var13, (uint64_t)&v36);
    +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", &v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_109;
  }
LABEL_105:
  objc_msgSend(v13, "setEmphasisMark:", a4->var14);
  v32 = *((_DWORD *)&a4->var2 + 2);
  v31 = (uint64_t)a4->var2;
  if ((v31 & 0x10000) != 0)
    goto LABEL_106;
LABEL_99:
  if ((v31 & 0x20000) != 0)
  {
    var13 = a4->var13;
    goto LABEL_108;
  }
LABEL_110:
  if ((v31 & 0x30000) != 0)
  {
    v35 = (v31 & 0x20000) != 0 && a4->var13 == 0;
    objc_msgSend(v13, "setColorAuto:", v35);
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
  }
  if ((v31 & 0x200000000000) != 0)
  {
    objc_msgSend(v13, "setLanguageForDefaultText:", a4->var39);
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
  }
  if ((v31 & 8) != 0)
  {
    objc_msgSend(v13, "setDeleted:", a4->var36);
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
  }
  if ((v31 & 0x40) != 0)
  {
    objc_msgSend(v13, "setEdited:", a4->var37);
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
  }
  if ((v32 & 0x800000) != 0)
  {
    objc_msgSend(v13, "setFormattingChanged:", (*((_DWORD *)a4 + 85) >> 23) & 1);
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
  }
  if ((v31 & 0x40000000) != 0)
  {
    objc_msgSend(v13, "setSpecialCharacter:", (*((_DWORD *)a4 + 85) >> 1) & 1);
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
  }
  if ((v32 & 0x40000) != 0)
  {
    objc_msgSend(v13, "setListCharacterPictureBullet:", a4->var75 != 0);
    v32 = *((_DWORD *)&a4->var2 + 2);
    v31 = (uint64_t)a4->var2;
  }
  if ((v32 & 0x800) != 0)
  {
    objc_msgSend(v13, "setCharPositionOfPictureBulletInBookmark:", a4->var58);
    v31 = (uint64_t)a4->var2;
  }
  if ((v31 & 0x400000000000) != 0)
  {
    objc_msgSend(v13, "setLanguageForFarEast:", a4->var40);
    v31 = (uint64_t)a4->var2;
  }
  if ((v31 & 0x800000000000) != 0)
  {
    objc_msgSend(v13, "setLanguageForBiText:", a4->var41);
    v31 = (uint64_t)a4->var2;
  }
  if ((v31 & 0x4000000) != 0)
    objc_msgSend(v13, "setFontSizeForBiText:", a4->var66);
LABEL_135:

}

+ (id)formattingChangeDate:(const WrdDateTime *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "tc_dateWithWordDate:", a3);
}

+ (void)prepareForWriting:(id)a3 properties:(id)a4 wrdProperties:(WrdCharacterProperties *)a5 tracked:(WrdCharacterProperties *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  objc_msgSend(v10, "setResolveMode:", 0);
  objc_msgSend(v10, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "write:properties:wrdProperties:document:", v13, v10, a5, v11);

  if (a6)
  {
    objc_msgSend(v10, "setResolveMode:", 1);
    objc_msgSend(v10, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "write:properties:wrdProperties:document:", v13, v10, a6, v12);

    if (WrdCharacterProperties::isEqualWithoutRevisions(a6, a5))
      WrdCharacterProperties::clearAllRevisionPropertiesAttributes(a6);
  }
  objc_msgSend(v10, "setResolveMode:", 2);

}

+ (WrdCharacterProperties)createTrackedPropertiesIfNeeded:(id)a3
{
  id v3;
  uint64_t v4;
  WrdObject *v5;
  WrdCharacterProperties *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "resolveMode");
  objc_msgSend(v3, "setResolveMode:", 1);
  if (!objc_msgSend(v3, "isAnythingOverridden"))
  {
    objc_msgSend(v3, "setResolveMode:", v4);
    goto LABEL_5;
  }
  objc_msgSend(v3, "setResolveMode:", v4);
  v5 = +[WBObjectFactory create:](WBObjectFactory, "create:", 10);
  if (!v5)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
LABEL_6:

  return v6;
}

@end
