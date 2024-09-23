@implementation WBParagraphProperties

+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 document:(id)a6 properties:(id)a7
{
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v11 = a7;
  v12 = v11;
  if (a4 && v11)
  {
    objc_msgSend(v11, "setResolveMode:", 0);
    objc_msgSend(a1, "mapWordProperties:reader:toProperties:", a4, v13, v12);
    if (a5)
    {
      objc_msgSend(v12, "setResolveMode:", 1);
      objc_msgSend(a1, "mapWordProperties:reader:toProperties:", a5, v13, v12);
    }
    objc_msgSend(v12, "setResolveMode:", 2);
  }

}

+ (void)mapWordProperties:(void *)a3 reader:(id)a4 toProperties:(id)a5
{
  id v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  char *v11;
  uint64_t BorderTopReference;
  void *v13;
  uint64_t BorderLeftReference;
  void *v15;
  uint64_t BorderBottomReference;
  void *v17;
  uint64_t BorderRightReference;
  void *v19;
  uint64_t BorderBetweenReference;
  void *v21;
  uint64_t BorderBarReference;
  void *v23;
  uint64_t ShadingReference;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[20];
  __int16 v34;
  char v35;
  char v36;

  v7 = a4;
  v8 = a5;
  v9 = *((_WORD *)a3 + 12);
  if ((v9 & 4) != 0)
  {
    BorderTopReference = WrdParagraphProperties::getBorderTopReference((WrdParagraphProperties *)a3);
    objc_msgSend(v8, "mutableTopBorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BorderTopReference, v13);

    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
    if ((v9 & 8) == 0)
    {
LABEL_3:
      if ((v9 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else
  {
    v10 = *((_QWORD *)a3 + 2);
    if ((v9 & 8) == 0)
      goto LABEL_3;
  }
  BorderLeftReference = WrdParagraphProperties::getBorderLeftReference((WrdParagraphProperties *)a3);
  objc_msgSend(v8, "mutableLeftBorder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BorderLeftReference, v15);

  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x10) == 0)
  {
LABEL_4:
    if ((v9 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  BorderBottomReference = WrdParagraphProperties::getBorderBottomReference((WrdParagraphProperties *)a3);
  objc_msgSend(v8, "mutableBottomBorder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BorderBottomReference, v17);

  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x20) == 0)
  {
LABEL_5:
    if ((v9 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  BorderRightReference = WrdParagraphProperties::getBorderRightReference((WrdParagraphProperties *)a3);
  objc_msgSend(v8, "mutableRightBorder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BorderRightReference, v19);

  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x40) == 0)
  {
LABEL_6:
    if ((v9 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  BorderBetweenReference = WrdParagraphProperties::getBorderBetweenReference((WrdParagraphProperties *)a3);
  objc_msgSend(v8, "mutableBetweenBorder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BorderBetweenReference, v21);

  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x80) == 0)
  {
LABEL_7:
    if ((v10 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  BorderBarReference = WrdParagraphProperties::getBorderBarReference((WrdParagraphProperties *)a3);
  objc_msgSend(v8, "mutableBarBorder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BorderBarReference, v23);

  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x80) == 0)
  {
LABEL_8:
    if ((v10 & 1) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  ShadingReference = WrdParagraphProperties::getShadingReference((WrdParagraphProperties *)a3);
  objc_msgSend(v8, "mutableShading");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBShading readFrom:to:](WBShading, "readFrom:to:", ShadingReference, v25);

  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 1) == 0)
  {
LABEL_9:
    if ((v10 & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v7, "styleAtIndex:expectedType:", *((unsigned __int16 *)a3 + 70), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBaseStyle:", v26);

  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x2000) == 0)
  {
LABEL_10:
    if ((v10 & 8) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v8, "setPageBreakBefore:", (*(_DWORD *)((char *)a3 + 294) >> 5) & 1);
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 8) == 0)
  {
LABEL_11:
    if ((v10 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v8, "setListLevel:", *((unsigned __int8 *)a3 + 300));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x10) == 0)
  {
LABEL_12:
    if ((v10 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v8, "setListIndex:", *((unsigned __int16 *)a3 + 71));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v8, "setDropCap:", *(unsigned __int8 *)(*((_QWORD *)a3 + 6) + 8) | ((unint64_t)*(unsigned __int8 *)(*((_QWORD *)a3 + 6) + 12) << 8));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x400000) == 0)
  {
LABEL_14:
    if ((v10 & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v8, "setWidth:", *((int *)a3 + 58));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x8000000) == 0)
  {
LABEL_15:
    if ((v10 & 0x10000000) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v8, "setHeight:", *((unsigned __int16 *)a3 + 145));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x10000000) == 0)
  {
LABEL_16:
    if ((v10 & 0x20000000) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v8, "setHeightRule:", *((unsigned int *)a3 + 40));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_17:
    if ((v10 & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v8, "setVerticalSpace:", *((int *)a3 + 59));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x40000000) == 0)
  {
LABEL_18:
    if ((v10 & 0x400000000) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v8, "setHorizontalSpace:", *((int *)a3 + 60));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x400000000) == 0)
  {
LABEL_19:
    if ((v10 & 0x1000000) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v8, "setWrap:", (*(_DWORD *)((char *)a3 + 294) >> 11) & 1);
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_20:
    if ((v10 & 0x800000) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v8, "setHorizontalAnchor:", *((unsigned int *)a3 + 39));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x800000) == 0)
  {
LABEL_21:
    if ((v10 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v8, "setVerticalAnchor:", *((unsigned int *)a3 + 38));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x100000) == 0)
  {
LABEL_22:
    if ((v10 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v8, "setHorizontalPosition:", *((int *)a3 + 56));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x200000) == 0)
  {
LABEL_23:
    if ((v10 & 0x2000000) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v8, "setVerticalPosition:", *((int *)a3 + 57));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x2000000) == 0)
  {
LABEL_24:
    if ((v10 & 0x80000000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v8, "setWrapCode:", *((char *)a3 + 298));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v10 & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v8, "setAnchorLock:", (*(_DWORD *)((char *)a3 + 294) >> 8) & 1);
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x40000) == 0)
  {
LABEL_26:
    if ((v10 & 0x200000000000000) == 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v8, "setSpaceBefore:", *((unsigned __int16 *)a3 + 136));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x200000000000000) == 0)
  {
LABEL_27:
    if ((v10 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v8, "setSpaceBeforeAuto:", (*(_DWORD *)((char *)a3 + 294) >> 23) & 1);
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x80000) == 0)
  {
LABEL_28:
    if ((v10 & 0x400000000000000) == 0)
      goto LABEL_29;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v8, "setSpaceAfter:", *((unsigned __int16 *)a3 + 138));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x400000000000000) == 0)
  {
LABEL_29:
    if ((v10 & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v8, "setSpaceAfterAuto:", HIBYTE(*(_DWORD *)((char *)a3 + 294)) & 1);
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x20000) == 0)
  {
LABEL_30:
    if ((v10 & 0x1000000000000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_65:
  objc_msgSend(v8, "setLineSpacing:", *(__int16 *)(*((_QWORD *)a3 + 5) + 8));
  v10 = *((_QWORD *)a3 + 2);
  if ((v10 & 0x20000) != 0)
  {
    v27 = *((_QWORD *)a3 + 5);
    if (*(__int16 *)(v27 + 8) < 0)
      v28 = 1;
    else
      v28 = 2 * (*(_WORD *)(v27 + 10) != 1);
    objc_msgSend(v8, "setLineSpacingRule:", v28);
    v10 = *((_QWORD *)a3 + 2);
  }
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((v10 & 0x800000000000000) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v8, "setLeadingIndent:", *((__int16 *)a3 + 126));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x800000000000000) == 0)
  {
LABEL_32:
    if ((v10 & 0x4000000000000000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v8, "setFollowingIndent:", *((__int16 *)a3 + 124));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x4000000000000000) == 0)
  {
LABEL_33:
    if ((v10 & 0x2000000000000000) == 0)
      goto LABEL_34;
LABEL_74:
    objc_msgSend(v8, "setRightIndent:", *((__int16 *)a3 + 132));
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
    if ((v10 & 0x8000000000000000) == 0)
      goto LABEL_35;
LABEL_75:
    v11 = (char *)a3 + 256;
    goto LABEL_76;
  }
LABEL_73:
  objc_msgSend(v8, "setLeftIndent:", *((__int16 *)a3 + 134));
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_74;
LABEL_34:
  if (v10 < 0)
    goto LABEL_75;
LABEL_35:
  if ((v9 & 1) == 0)
    goto LABEL_77;
  v11 = (char *)a3 + 260;
LABEL_76:
  objc_msgSend(v8, "setFirstLineIndent:", *(__int16 *)v11);
  v10 = *((_QWORD *)a3 + 2);
  v9 = *((_WORD *)a3 + 12);
LABEL_77:
  if ((v10 & 0x20) != 0)
  {
    objc_msgSend(v8, "setJustification:", *((unsigned int *)a3 + 42));
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x40) != 0)
  {
    objc_msgSend(v8, "setPhysicalJustification:", *((unsigned int *)a3 + 43));
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x80000000000) != 0)
  {
    objc_msgSend(v8, "setOutlineLevel:", *((unsigned __int8 *)a3 + 299));
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x1000) != 0)
  {
    objc_msgSend(v8, "setKeepNextParagraphTogether:", (*(_DWORD *)((char *)a3 + 294) >> 4) & 1);
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x800) != 0)
  {
    objc_msgSend(v8, "setKeepLinesTogether:", (*(_DWORD *)((char *)a3 + 294) >> 3) & 1);
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x4000000) != 0)
  {
    objc_msgSend(v8, "setSuppressAutoHyphens:", (*(_DWORD *)((char *)a3 + 294) >> 7) & 1);
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x10000) != 0)
  {
    objc_msgSend(v8, "setSuppressLineNumbers:", (*(_DWORD *)((char *)a3 + 294) >> 6) & 1);
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x100000000) != 0)
  {
    objc_msgSend(v8, "setWidowControl:", (*(_DWORD *)((char *)a3 + 294) >> 9) & 1);
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x100000000000) != 0)
  {
    objc_msgSend(v8, "setBiDi:", HIWORD(*(_DWORD *)((char *)a3 + 294)) & 1);
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x200000000) != 0)
  {
    objc_msgSend(v8, "setKinsokuOff:", (*(_DWORD *)((_BYTE *)a3 + 294) & 0x400) == 0);
    v10 = *((_QWORD *)a3 + 2);
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x100) != 0)
  {
    v29 = *((unsigned __int16 *)a3 + 68);
    if (*((__int16 *)a3 + 68) >= 1)
    {
      v30 = 0;
      do
      {
        v34 = *(_WORD *)(*((_QWORD *)a3 + 25) + 2 * v30);
        WrdTabDescriptor::WrdTabDescriptor((WrdTabDescriptor *)v33, *(const WrdTabDescriptor **)(*((_QWORD *)a3 + 22) + 8 * v30));
        v35 = v33[8];
        v36 = v33[12];
        objc_msgSend(v8, "addTabStopAdded:", &v34);
        ++v30;
      }
      while (v29 != v30);
    }
    objc_msgSend(v8, "setTabStopAddedCount:", (__int16)v29);
    if ((*((_QWORD *)a3 + 2) & 0x100) != 0)
    {
      v31 = *((unsigned __int16 *)a3 + 69);
      if (*((__int16 *)a3 + 69) >= 1)
      {
        v32 = 0;
        do
        {
          objc_msgSend(v8, "addTabStopDeletedPosition:", *(__int16 *)(*((_QWORD *)a3 + 26) + v32));
          v32 += 2;
        }
        while (2 * v31 != v32);
      }
      objc_msgSend(v8, "setTabStopDeletedPositionCount:", (__int16)v31);
    }
    v9 = *((_WORD *)a3 + 12);
  }
  if ((v9 & 0x200) != 0)
    objc_msgSend(v8, "setFormattingChanged:", (*(_DWORD *)((char *)a3 + 294) >> 26) & 1);

}

+ (id)formattingChangeDate:(const WrdDateTime *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "tc_dateWithWordDate:", a3);
}

+ (void)createTrackedPropertiesIfNeeded:(id)a3
{
  id v3;
  WrdObject *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "setResolveMode:", 1);
  if (objc_msgSend(v3, "isAnythingOverridden")
    && (v4 = +[WBObjectFactory create:](WBObjectFactory, "create:", 41)) != 0)
  {
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
