@implementation TUISymbolImageLayout

- (id)_image
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  TUISymbolImage *v31;
  TUISymbolImage *cachedImage;
  TUISymbolImage *v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instantiateContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));
  v7 = (char *)objc_msgSend(v6, "style");

  v8 = v7 == (_BYTE *)&dword_0 + 1;
  if (v7 == (_BYTE *)&dword_0 + 2)
    v8 = 2;
  v36 = v8;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "manager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "imageResourceCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  objc_msgSend(v3, "fontSize");
  v12 = v11;
  -[TUILayout computedScale](self, "computedScale");
  v14 = v12 * v13;
  v15 = objc_msgSend(v3, "weight");
  v16 = objc_msgSend(v3, "scale");
  v17 = objc_msgSend(v3, "renderingMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colors"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  objc_msgSend(v19, "contentsScale");
  v21 = v20;
  v22 = -[TUILayout computedLayoutDirection](self, "computedLayoutDirection");
  objc_msgSend(v3, "insets");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  LOBYTE(v35) = objc_msgSend(v3, "baseline");
  v31 = (TUISymbolImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "symbolImageWithName:compatibleWithFontSize:weight:scale:renderingMode:colors:style:contentsScale:layoutDirection:insets:baseline:", v10, v15, v16, v17, v18, v36, v14, v21, v24, v26, v28, v30, v22, v35));
  cachedImage = self->_cachedImage;
  self->_cachedImage = v31;

  v33 = self->_cachedImage;
  return v33;
}

- (void)onComputedScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISymbolImageLayout;
  -[TUILayout onComputedScaleDidChange](&v3, "onComputedScaleDidChange");
  -[TUILayout invalidateLayout](self, "invalidateLayout");
  -[TUILayout invalidateIntrinsicSize](self, "invalidateIntrinsicSize");
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUISymbolImageLayout _image](self, "_image"));
  objc_msgSend(v3, "alignmentInsets");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "size");
  v9 = v8 - v5 - v7;
  if (v9 <= -3.40282347e38)
  {
    v12 = 4286578687;
LABEL_6:
    v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
    goto LABEL_7;
  }
  if (v9 >= 3.40282347e38)
  {
    v12 = 2139095039;
    goto LABEL_6;
  }
  *(float *)&v10 = v9;
  v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v10 | 0x7FC0000000000000);
LABEL_7:

  return v11;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUISymbolImageLayout _image](self, "_image"));
  objc_msgSend(v3, "alignmentInsets");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "size");
  v9 = v8 - v5 - v7;
  if (v9 <= -3.40282347e38)
  {
    v12 = 4286578687;
LABEL_6:
    v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
    goto LABEL_7;
  }
  if (v9 >= 3.40282347e38)
  {
    v12 = 2139095039;
    goto LABEL_6;
  }
  *(float *)&v10 = v9;
  v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v10 | 0x7FC0000000000000);
LABEL_7:

  return v11;
}

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[TUISymbolImageLayout _image](self, "_image"));
  objc_msgSend(v16, "alignmentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v16, "size");
  v12 = v11 - v6 - v10;
  objc_msgSend(v16, "size");
  v14 = v13 - v4 - v8;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v12, v14);
  self->_heightAbovePivot = v14;
  if (objc_msgSend(v16, "hasBaseline"))
  {
    objc_msgSend(v16, "baselineOffsetFromBottom");
    self->_heightAbovePivot = self->_heightAbovePivot - (v15 - v8);
  }

}

- (double)computedHeightAbovePivot
{
  return self->_heightAbovePivot;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _BOOL8 v12;
  TUIRenderModelLayer *v13;
  _TUISymbolImageLayerConfig *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _TUISymbolImageLayerConfig *v23;
  void *v24;
  void *v25;

  v6 = a4;
  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v6);
  if (a3 < 3)
  {
    v13 = 0;
  }
  else
  {
    v9 = v7;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    if (objc_msgSend(v11, "hflipForRTL"))
      v12 = (char *)-[TUILayout computedLayoutDirection](self, "computedLayoutDirection") == (char *)&dword_0 + 2;
    else
      v12 = 0;

    v14 = [_TUISymbolImageLayerConfig alloc];
    objc_msgSend(v6, "contentsScale");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUISymbolImageLayout _image](self, "_image"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colors"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "blendMode"));
    v23 = -[_TUISymbolImageLayerConfig initWithContentsScale:image:color:hflip:blendMode:](v14, "initWithContentsScale:image:color:hflip:blendMode:", v17, v20, v12, v22, v16);

    v13 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v23, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TUIRenderModelLayer setSize:](v13, "setSize:", v9, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
    -[TUIRenderModelLayer setIdentifier:](v13, "setIdentifier:", v25);

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end
