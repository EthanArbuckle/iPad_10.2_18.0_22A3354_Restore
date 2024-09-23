@implementation WBPicture

+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 to:(id)a7
{
  unsigned int v7;
  unsigned int v8;
  id v14;
  id v15;
  WrdCharacterProperties *var4;
  WrdCharacterProperties *var5;
  WDCharacterProperties *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int var1;
  uint64_t v23;
  OADImage *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  ESDBlipContext *v28;
  OADBlip *v29;
  OADBlipRef *v30;
  OADImageFill *v31;
  void *v32;
  WDAContent *v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  float v42;
  float v43;
  float v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t Border;
  uint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  double v67;
  ESDBlipContext *v68;
  OADSubBlip *v69;
  uint64_t v70;
  id v71;
  void (**v72)(WrdPictureBinary *__hidden);
  OcBinaryData v73;
  uint64_t v74[2];
  int v75;
  int v76;
  __int16 v77;
  __int16 v78;
  __int16 v79;
  __int16 v80;
  __int16 v81;
  __int16 v82;
  __int16 v83;

  v71 = a3;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    var4 = a5->var4;
    var5 = a5->var5;
    v18 = [WDCharacterProperties alloc];
    objc_msgSend(v14, "document");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[WDCharacterProperties initWithDocument:](v18, "initWithDocument:", v19);

    objc_msgSend(v14, "document");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v71, var4, var5, v20, v70);

    objc_msgSend(v15, "setProperties:", v70);
    v21 = objc_msgSend(v14, "textType");
    WrdPictureProperties::WrdPictureProperties((WrdPictureProperties *)v74);
    var1 = a5->var1;
    v75 = a4;
    v76 = var1;
    v23 = objc_msgSend(v71, "wrdReader");
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v23 + 416))(v23, v74);
    v24 = 0;
    switch(v77)
    {
      case 'b':
        v72 = &off_24F3B3A80;
        CsString::CsString((CsString *)&v73);
        v25 = objc_msgSend(v71, "wrdReader");
        (*(void (**)(uint64_t, void (***)(WrdPictureBinary *__hidden)))(*(_QWORD *)v25 + 432))(v25, &v72);
        v72 = &off_24F3B3A80;
        CsString::~CsString((CsString *)&v73);
        v24 = 0;
        break;
      case 'c':
        break;
      case 'd':
        objc_msgSend(a1, "readDrawableFromReader:textType:", v71, v21);
        v24 = (OADImage *)objc_claimAutoreleasedReturnValue();
        if (v24)
          goto LABEL_9;
        break;
      case 'f':
        v72 = &off_24F3B3A80;
        CsString::CsString((CsString *)&v73);
        v26 = objc_msgSend(v71, "wrdReader");
        (*(void (**)(uint64_t, void (***)(WrdPictureBinary *__hidden)))(*(_QWORD *)v26 + 432))(v26, &v72);
        objc_msgSend(a1, "readDrawableFromReader:textType:", v71, v21);
        v24 = (OADImage *)objc_claimAutoreleasedReturnValue();
        v72 = &off_24F3B3A80;
        CsString::~CsString((CsString *)&v73);
        if (v24)
          goto LABEL_9;
        break;
      default:
        v72 = &off_24F3B3A40;
        OcBinaryData::OcBinaryData(&v73);
        v27 = objc_msgSend(v71, "wrdReader");
        (*(void (**)(uint64_t, void (***)(WrdPictureBinary *__hidden)))(*(_QWORD *)v27 + 424))(v27, &v72);
        v28 = [ESDBlipContext alloc];
        v68 = -[ESDBlipContext initWithOffset:byteCount:stream:streamID:](v28, "initWithOffset:byteCount:stream:streamID:", v73.var1, v73.var3, v73.var7, v73.var2);
        v69 = -[OADSubBlip initWithData:type:]([OADSubBlip alloc], "initWithData:type:", 0, 4);
        -[OCDDelayedNode setDelayedContext:](v69, "setDelayedContext:", v68);
        v29 = objc_alloc_init(OADBlip);
        -[OADBlip setMainSubBlip:](v29, "setMainSubBlip:", v69);
        v30 = -[OADBlipRef initWithIndex:name:blip:]([OADBlipRef alloc], "initWithIndex:name:blip:", 0, 0, v29);
        v31 = objc_alloc_init(OADImageFill);
        -[OADImageFill setBlipRef:](v31, "setBlipRef:", v30);
        v24 = objc_alloc_init(OADImage);
        -[OADImage imageProperties](v24, "imageProperties");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setImageFill:", v31);

        v33 = objc_alloc_init(WDAContent);
        -[OADDrawable setClientData:](v24, "setClientData:", v33);
        -[WDAContent setDrawable:](v33, "setDrawable:", v24);
        -[WDAContent setTextType:](v33, "setTextType:", v21);

        v72 = &off_24F3B3A40;
        OcBinaryData::~OcBinaryData(&v73);
        if (v24)
        {
LABEL_9:
          -[OADDrawable clientData](v24, "clientData");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDrawable:", v24);
          objc_msgSend(v34, "setTextType:", a5->var1);

        }
        break;
    }
    v35 = v78;
    v36 = v79;
    v37 = v80;
    v38 = v81;
    LOWORD(v8) = v82;
    LOWORD(v7) = v83;
    -[OADDrawable drawableProperties](v24, "drawableProperties");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "orientedBounds");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "rotation");
    v41 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
    v42 = (double)v35 / 20.0;
    v43 = (double)v36 / 20.0;
    v44 = (double)v37 / 20.0;
    v45 = (double)v38 / 20.0;
    v46 = v42;
    v47 = v43;
    v48 = (float)((float)(v44 * (float)v8) / 1000.0);
    v49 = (float)((float)(v45 * (float)v7) / 1000.0);

    if (v41)
    {
      v46 = NSTransposedRectWithSameCenter(v46, v47, v48, v49);
      v47 = v50;
      v48 = v51;
      v49 = v52;
    }
    -[OADDrawable drawableProperties](v24, "drawableProperties");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "orientedBounds");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setBounds:", v46, v47, v48, v49);

    v55 = objc_opt_class();
    TSUDynamicCast(v55, (uint64_t)v24);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v58 = (void *)v70;
    if (!v56)
      goto LABEL_25;
    objc_msgSend(v56, "graphicProperties");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "hasStroke"))
    {
      objc_msgSend(v59, "stroke");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "isFillOverridden"))
      {
        objc_msgSend(v60, "fill");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_23;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_23;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_23;

      }
    }
    Border = WrdPictureProperties::getBorder(v74, 0);
    v63 = Border;
    if (!*(_DWORD *)(Border + 16) || !*(_BYTE *)(Border + 25))
      goto LABEL_24;
    v60 = (void *)objc_opt_new();
    v61 = (void *)objc_opt_new();
    +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", v63 + 8);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADRgbColor rgbColorWithTSUColor:](OADRgbColor, "rgbColorWithTSUColor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "setColor:", v65);
    objc_msgSend(v60, "setFill:", v61);
    LOBYTE(v66) = *(_BYTE *)(v63 + 25);
    v67 = (double)v66 * 0.125;
    *(float *)&v67 = v67;
    objc_msgSend(v60, "setWidth:", v67);
    objc_msgSend(v59, "setStroke:", v60);

    v58 = (void *)v70;
LABEL_23:

LABEL_24:
LABEL_25:

    WrdPictureProperties::~WrdPictureProperties((WrdPictureProperties *)v74);
  }

}

+ (id)readDrawableFromReader:(id)a3 textType:(int)a4
{
  uint64_t v4;
  id v5;
  WBOfficeArtReaderState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[WBOfficeArtReaderState initWithClient:]([WBOfficeArtReaderState alloc], "initWithClient:", objc_opt_class());
  -[WBOfficeArtReaderState setCurrentTextType:](v6, "setCurrentTextType:", v4);
  objc_msgSend(v5, "officeArtState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOfficeArtState:", v6);
  v31 = 4;
  +[WBEscher readRootWithType:reader:](WBEscher, "readRootWithType:reader:", &v31, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "childCount"))
  {
    objc_msgSend(v9, "childAt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "officeArtState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABDrawable readDrawableFromObject:state:](OABDrawable, "readDrawableFromObject:state:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "childAt:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const void *)objc_msgSend(v30, "eshObject");
    if (v13)
    {
      if (v14)
      {
        v15 = 0;
        v16 = (uint64_t)v14 + 16;
        v17 = v9;
        v28 = v7;
        while (1)
        {
          v18 = dword_22A4D2224[v15];
          if (EshOpt::isPropertySet(v16, v18))
          {
            if (*(_BYTE *)EshOpt::getProperty(v16, v18) && *((_DWORD *)EshOpt::getProperty(v16, v18) + 2))
              break;
          }
          v9 = v17;
LABEL_18:
          ++v15;
          v17 = v9;
          if (v15 == 3)
            goto LABEL_36;
        }
        v31 = 5;
        +[WBEscher readRootWithType:reader:](WBEscher, "readRootWithType:reader:", &v31, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9 || !objc_msgSend(v9, "childCount"))
          goto LABEL_18;
        objc_msgSend(v9, "childAt:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "eshObject");
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20) != 61447)
        {
LABEL_34:

          goto LABEL_18;
        }
        +[OABBlip readBlipFromBse:](OABBlip, "readBlipFromBse:", v19);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        switch((_DWORD)v15)
        {
          case 2:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              objc_msgSend(v12, "graphicProperties");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "stroke");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "fill");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
              goto LABEL_27;
            }
            break;
          case 1:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              objc_msgSend(v12, "graphicProperties");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "fill");
              v22 = objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }
            break;
          case 0:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              objc_msgSend(v12, "imageProperties");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "imageFill");
              v22 = objc_claimAutoreleasedReturnValue();
LABEL_24:
              v23 = (void *)v22;
              goto LABEL_25;
            }
            break;
        }
        v23 = 0;
LABEL_27:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "blipRef");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setBlip:", v29);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_33;
          objc_msgSend(v23, "pattern");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v24, "blipRef");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setBlip:", v29);

          }
        }

LABEL_33:
        v7 = v28;
        goto LABEL_34;
      }
    }
LABEL_36:

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v5, "setOfficeArtState:", v7);

  return v12;
}

@end
