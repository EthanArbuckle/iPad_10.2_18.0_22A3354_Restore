@implementation OABImage

+ (void)readfromShape:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  OADImageFill *v9;
  uint64_t v10;
  EshShapeImageData *v11;
  EshFill *isBlipSet;
  EshFill *v13;
  uint64_t *DefaultBlipName;
  void *v15;
  OADStretchTechnique *v16;
  OADBlipRef *v17;
  OADRelativeRect *v18;
  EshFixedPointUtil *CropTop;
  double v20;
  EshFixedPointUtil *CropBottom;
  double v22;
  EshFixedPointUtil *CropLeft;
  double v24;
  EshFixedPointUtil *CropRight;
  double v26;
  OADLuminanceEffect *v27;
  EshFixedPointUtil *Gain;
  double v29;
  EshFixedPointUtil *BlackLevel;
  float v31;
  double v32;
  OADGrayscaleEffect *v33;
  OADBiLevelEffect *v34;
  double v35;
  const EshColor *Chromakey;
  double v37;
  void *v38;
  double v39;
  void *v40;
  OADColorChangeEffect *v41;
  OADAlphaModFixEffect *v42;
  EshFixedPointUtil *Opacity;
  double v44;
  uint64_t *QuicktimeData;
  void *v46;
  OADQTStubFile *v47;
  id v48;
  id v49;
  void *v50;
  EshColor v51;
  EshColor v52;
  EshColor v53;

  v7 = a3;
  v8 = a4;
  v49 = a5;
  objc_msgSend(v8, "imageProperties");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(OADImageFill);
  v10 = objc_msgSend(v7, "eshShape");
  v11 = (EshShapeImageData *)(v10 + 480);
  isBlipSet = (EshFill *)EshShapeImageData::isBlipSet((EshShapeImageData *)(v10 + 480));
  if ((_DWORD)isBlipSet)
  {
    isBlipSet = (EshFill *)EshShapeImageData::getBlipId(v11);
    v13 = isBlipSet;
  }
  else
  {
    v13 = 0;
  }
  DefaultBlipName = (uint64_t *)EshFill::getDefaultBlipName(isBlipSet);
  if (EshShapeImageData::isBlipNameSet(v11))
    DefaultBlipName = EshShapeImageData::getBlipName(v11);
  if (DefaultBlipName && *((_DWORD *)DefaultBlipName + 4))
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", DefaultBlipName);
  else
    v15 = 0;
  v16 = objc_alloc_init(OADStretchTechnique);
  if ((_DWORD)v13)
  {
    v17 = -[OADBlipRef initWithIndex:name:blip:]([OADBlipRef alloc], "initWithIndex:name:blip:", v13, v15, 0);
    if ((EshShapeImageData::isCropTopSet(v11) & 1) != 0
      || (EshShapeImageData::isCropBottomSet(v11) & 1) != 0
      || (EshShapeImageData::isCropLeftSet(v11) & 1) != 0
      || EshShapeImageData::isCropRightSet(v11))
    {
      v18 = objc_alloc_init(OADRelativeRect);
      if (EshShapeImageData::isCropTopSet(v11))
      {
        CropTop = (EshFixedPointUtil *)EshShapeImageData::getCropTop(v11);
        *(float *)&v20 = EshFixedPointUtil::toFloat(CropTop);
        -[OADRelativeRect setTop:](v18, "setTop:", v20);
      }
      if (EshShapeImageData::isCropBottomSet(v11))
      {
        CropBottom = (EshFixedPointUtil *)EshShapeImageData::getCropBottom(v11);
        *(float *)&v22 = EshFixedPointUtil::toFloat(CropBottom);
        -[OADRelativeRect setBottom:](v18, "setBottom:", v22);
      }
      if (EshShapeImageData::isCropLeftSet(v11))
      {
        CropLeft = (EshFixedPointUtil *)EshShapeImageData::getCropLeft(v11);
        *(float *)&v24 = EshFixedPointUtil::toFloat(CropLeft);
        -[OADRelativeRect setLeft:](v18, "setLeft:", v24);
      }
      if (EshShapeImageData::isCropRightSet(v11))
      {
        CropRight = (EshFixedPointUtil *)EshShapeImageData::getCropRight(v11);
        *(float *)&v26 = EshFixedPointUtil::toFloat(CropRight);
        -[OADRelativeRect setRight:](v18, "setRight:", v26);
      }
      -[OADImageFill setSourceRect:](v9, "setSourceRect:", v18);

    }
    if ((EshShapeImageData::isGainSet(v11) & 1) != 0 || EshShapeImageData::isBlackLevelSet(v11))
    {
      v27 = objc_alloc_init(OADLuminanceEffect);
      if (EshShapeImageData::isGainSet(v11))
      {
        Gain = (EshFixedPointUtil *)EshShapeImageData::getGain(v11);
        *(float *)&v29 = EshFixedPointUtil::toFloat(Gain);
        if (*(float *)&v29 <= 1.0)
          *(float *)&v29 = *(float *)&v29 + -1.0;
        else
          *(float *)&v29 = 1.0 - (float)(1.0 / *(float *)&v29);
        -[OADLuminanceEffect setContrast:](v27, "setContrast:", v29);
      }
      if (EshShapeImageData::isBlackLevelSet(v11))
      {
        BlackLevel = (EshFixedPointUtil *)EshShapeImageData::getBlackLevel(v11);
        v31 = EshFixedPointUtil::toFloat(BlackLevel);
        *(float *)&v32 = v31 + v31;
        -[OADLuminanceEffect setBrightness:](v27, "setBrightness:", v32);
      }
      -[OADBlipRef addEffect:](v17, "addEffect:", v27);

    }
    if (EshShapeImageData::isGrayScaleSet(v11) && EshShapeImageData::getGrayScale(v11))
    {
      v33 = objc_alloc_init(OADGrayscaleEffect);
      -[OADBlipRef addEffect:](v17, "addEffect:", v33);

    }
    if (EshShapeImageData::isBilevelSet(v11) && EshShapeImageData::getBilevel(v11))
    {
      v34 = objc_alloc_init(OADBiLevelEffect);
      LODWORD(v35) = 0.5;
      -[OADBiLevelEffect setThreshold:](v34, "setThreshold:", v35);
      -[OADBlipRef addEffect:](v17, "addEffect:", v34);

    }
    if (EshShapeImageData::isChromakeySet(v11))
    {
      v48 = v7;
      Chromakey = (const EshColor *)EshShapeImageData::getChromakey(v11);
      EshColor::EshColor(&v53, Chromakey);
      EshColor::EshColor(&v52, &v53);
      LODWORD(v37) = 1.0;
      +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v52, 0, v49, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      EshColor::EshColor(&v51, &v53);
      LODWORD(v39) = 0;
      +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v51, 0, v49, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_alloc_init(OADColorChangeEffect);
      -[OADColorChangeEffect setFromColor:](v41, "setFromColor:", v38);
      -[OADColorChangeEffect setToColor:](v41, "setToColor:", v40);
      -[OADBlipRef addEffect:](v17, "addEffect:", v41);

      v7 = v48;
    }
    if (EshFill::isOpacitySet((EshFill *)(v10 + 296)))
    {
      v42 = objc_alloc_init(OADAlphaModFixEffect);
      Opacity = (EshFixedPointUtil *)EshFill::getOpacity((EshFill *)(v10 + 296));
      *(float *)&v44 = EshFixedPointUtil::toFloat(Opacity);
      -[OADAlphaModFixEffect setAlpha:](v42, "setAlpha:", v44);
      -[OADBlipRef addEffect:](v17, "addEffect:", v42);

    }
    -[OADImageFill setBlipRef:](v9, "setBlipRef:", v17, v48);

  }
  -[OADImageFill setTechnique:](v9, "setTechnique:", v16);
  objc_msgSend(v50, "setImageFill:", v9);
  if (EshShapeImageData::isQuicktimeDataSet(v11))
  {
    QuicktimeData = EshShapeImageData::getQuicktimeData(v11);
    if (QuicktimeData)
    {
      if (*(_DWORD *)QuicktimeData)
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", QuicktimeData[1], *(unsigned int *)QuicktimeData);
        v47 = objc_alloc_init(OADQTStubFile);
        -[OADMovie setName:](v47, "setName:", v15);
        -[OADMovie setData:](v47, "setData:", v46);
        -[OCDDelayedNode setLoaded:](v47, "setLoaded:", 1);
        objc_msgSend(v8, "setMovie:", v47);

      }
    }
  }

}

@end
