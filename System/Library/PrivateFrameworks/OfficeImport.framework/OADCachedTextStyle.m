@implementation OADCachedTextStyle

- (OADCachedTextStyle)initWithTextBodyProperties:(id)a3 paragraphProperties:(id)a4 characterProperties:(id)a5 colorContext:(id)a6 graphicStyleCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  OADTextSpacing *v17;
  OADTextSpacing *v18;
  OADTextSpacing *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  void *v25;
  float v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int16 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  objc_super v48;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v47 = a7;
  v48.receiver = self;
  v48.super_class = (Class)OADCachedTextStyle;
  v16 = -[OADCachedTextStyle init](&v48, sel_init);
  if (v16)
  {
    v16[8] = v16[8] & 0xF8 | objc_msgSend(v12, "textAnchorType") & 7;
    objc_msgSend(v13, "lineSpacing");
    v17 = (OADTextSpacing *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)(v16 + 9) = OADTextCachedSpacingWithSpacing(v17);

    objc_msgSend(v13, "beforeSpacing");
    v18 = (OADTextSpacing *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)(v16 + 11) = OADTextCachedSpacingWithSpacing(v18);

    objc_msgSend(v13, "afterSpacing");
    v19 = (OADTextSpacing *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)(v16 + 13) = OADTextCachedSpacingWithSpacing(v19);

    objc_msgSend(v13, "leftMargin");
    *(_WORD *)(v16 + 15) = llroundf(v20 * 8.0);
    objc_msgSend(v13, "rightMargin");
    *(_WORD *)(v16 + 17) = llroundf(v21 * 8.0);
    objc_msgSend(v13, "indent");
    *(_WORD *)(v16 + 19) = llroundf(v22 * 8.0);
    objc_msgSend(v13, "defaultTab");
    *(_WORD *)(v16 + 21) = llroundf(v23 * 8.0);
    v16[23] = v16[23] & 0xF0 | objc_msgSend(v13, "align") & 0xF;
    if (objc_msgSend(v14, "hasLatinFont"))
      objc_msgSend(v14, "latinFont");
    else
      objc_msgSend(v13, "latinFont");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "fontFaceCache", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)v16 + 12) = objc_msgSend(v24, "cacheFeature:", v46);

    if (objc_msgSend(v14, "hasSize"))
      v25 = v14;
    else
      v25 = v13;
    objc_msgSend(v25, "size");
    *((_WORD *)v16 + 13) = llroundf(v26 * 8.0);
    if (objc_msgSend(v14, "hasFill"))
      objc_msgSend(v14, "fill");
    else
      objc_msgSend(v13, "fill");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    TSUDynamicCast(v27, (uint64_t)v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "color");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "map");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scheme");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "palette");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADColor rgbColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "rgbColorWithColor:colorMap:colorScheme:colorPalette:", v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v44;
    objc_msgSend(v47, "colorCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)v16 + 14) = objc_msgSend(v34, "cacheFeature:", v33);

    if (objc_msgSend(v14, "hasIsBold"))
      v35 = v14;
    else
      v35 = v13;
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFFFE | objc_msgSend(v35, "isBold");
    if (objc_msgSend(v14, "hasIsItalic"))
      v36 = v14;
    else
      v36 = v13;
    if (objc_msgSend(v36, "isItalic"))
      v37 = 2;
    else
      v37 = 0;
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFFFD | v37;
    if (objc_msgSend(v14, "hasUnderlineType"))
      v38 = v14;
    else
      v38 = v13;
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFF83 | (4 * (objc_msgSend(v38, "underlineType") & 0x1F));
    if (objc_msgSend(v14, "hasFormatType"))
      v39 = v14;
    else
      v39 = v13;
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFE7F | ((objc_msgSend(v39, "formatType") & 3) << 7);
    if (objc_msgSend(v14, "hasFormatKerningType"))
      v40 = v14;
    else
      v40 = v13;
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xF9FF | ((objc_msgSend(v40, "formatKerningType") & 3) << 9);
    if (objc_msgSend(v14, "hasStrikeThroughType"))
      v41 = v14;
    else
      v41 = v13;
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xE7FF | ((objc_msgSend(v41, "strikeThroughType") & 3) << 11);
    if (objc_msgSend(v14, "hasCaps"))
      v42 = v14;
    else
      v42 = v13;
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0x9FFF | ((objc_msgSend(v42, "caps") & 3) << 13);
    *((_QWORD *)v16 + 4) = TSUHash(v16 + 8, 24);

  }
  return (OADCachedTextStyle *)v16;
}

- (unint64_t)hash
{
  return *((_QWORD *)&self->mData + 3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OADCachedTextStyle *v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v10;

  v4 = a3;
  v5 = self;
  v6 = v4;
  v7 = objc_opt_class();
  v10 = v7 == objc_opt_class()
     && *((_QWORD *)&v5->mData + 3) == v6[4]
     && *(_QWORD *)&v5->mData == v6[1]
     && *(_QWORD *)&v5->mData.leftMargin == v6[2]
     && *((_QWORD *)&v5->mData + 2) == v6[3];

  return v10;
}

- (void)applyToParagraphProperties:(id)a3 graphicStyleCache:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  OADSolidFill *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  OADTextSpacingWithCachedSpacing(*(__int16 *)((char *)&self->mData + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLineSpacing:", v7);

  OADTextSpacingWithCachedSpacing(*(__int16 *)((char *)&self->mData.lineSpacing + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBeforeSpacing:", v8);

  OADTextSpacingWithCachedSpacing(*(__int16 *)((char *)&self->mData.beforeSpacing + 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAfterSpacing:", v9);

  *(float *)&v10 = (float)*(__int16 *)((char *)&self->mData.afterSpacing + 1) * 0.125;
  objc_msgSend(v22, "setLeftMargin:", v10);
  *(float *)&v11 = (float)*(__int16 *)((char *)&self->mData.leftMargin + 1) * 0.125;
  objc_msgSend(v22, "setRightMargin:", v11);
  *(float *)&v12 = (float)*(__int16 *)((char *)&self->mData.rightMargin + 1) * 0.125;
  objc_msgSend(v22, "setIndent:", v12);
  *(float *)&v13 = (float)*(__int16 *)((char *)&self->mData.indent + 1) * 0.125;
  objc_msgSend(v22, "setDefaultTab:", v13);
  objc_msgSend(v22, "setAlign:", HIBYTE(self->mData.defaultTab) & 0xF);
  objc_msgSend(v6, "fontFaceCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "countedFeatureAtIndex:", *((unsigned __int16 *)&self->mData + 8));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "feature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLatinFont:", v16);

  *(float *)&v17 = (float)(__int16)self->mData.fontFaceIndex * 0.125;
  objc_msgSend(v22, "setSize:", v17);
  v18 = objc_alloc_init(OADSolidFill);
  objc_msgSend(v6, "colorCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "countedFeatureAtIndex:", (unsigned __int16)self->mData.fontSize);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "feature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADSolidFill setColor:](v18, "setColor:", v21);

  objc_msgSend(v22, "setFill:", v18);
  objc_msgSend(v22, "setIsBold:", self->mData.fontColorIndex & 1);
  objc_msgSend(v22, "setIsItalic:", (self->mData.fontColorIndex >> 1) & 1);
  objc_msgSend(v22, "setUnderlineType:", (LOBYTE(self->mData.fontColorIndex) >> 2) & 0x1F);
  objc_msgSend(v22, "setFormatType:", (self->mData.fontColorIndex >> 7) & 3);
  objc_msgSend(v22, "setFormatKerningType:", (self->mData.fontColorIndex >> 9) & 3);
  objc_msgSend(v22, "setStrikeThroughType:", (self->mData.fontColorIndex >> 11) & 3);
  objc_msgSend(v22, "setCaps:", (self->mData.fontColorIndex >> 13) & 3);

}

- (void)applyToTextBodyProperties:(id)a3 graphicStyleCache:(id)a4
{
  objc_msgSend(a3, "setTextAnchorType:", *(_BYTE *)&self->mData & 7, a4);
}

@end
