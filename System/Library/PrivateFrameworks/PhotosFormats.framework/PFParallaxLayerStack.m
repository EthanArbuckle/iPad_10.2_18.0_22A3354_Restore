@implementation PFParallaxLayerStack

- (PFParallaxLayerStack)initWithLayers:(id)a3 layout:(id)a4 depthEnabled:(BOOL)a5 parallaxDisabled:(BOOL)a6 clockAreaLuminance:(double)a7 settlingEffectEnabled:(BOOL)a8
{
  id v12;
  PFPosterOrientedLayout *v13;
  PFParallaxLayerStack *v14;
  uint64_t v15;
  NSArray *layers;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *layerMap;
  PFPosterOrientedLayout *layout;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (PFPosterOrientedLayout *)a4;
  v35.receiver = self;
  v35.super_class = (Class)PFParallaxLayerStack;
  v14 = -[PFParallaxLayerStack init](&v35, sel_init);
  v15 = objc_msgSend(v12, "copy");
  layers = v14->_layers;
  v14->_layers = (NSArray *)v15;

  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v20);
  }

  v25 = objc_msgSend(v17, "copy");
  layerMap = v14->_layerMap;
  v14->_layerMap = (NSDictionary *)v25;

  layout = v14->_layout;
  v14->_layout = v13;

  v14->_depthEnabled = a5;
  v14->_parallaxDisabled = a6;
  v14->_clockAreaLuminance = a7;
  v14->_settlingEffectEnabled = a8;

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFParallaxLayerStack size](self, "size");
  v6 = v5;
  -[PFParallaxLayerStack size](self, "size");
  v8 = v7;
  v9 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
  v10 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled") ^ 1;
  v11 = -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled");
  -[PFParallaxLayerStack layers](self, "layers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayerStack layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %0.0fx%0.0f depth:%d parallax:%d settling:%d layers:%@ layout:%@>"), v4, self, v6, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PFParallaxLayerStack layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (PFParallaxImageLayer)backgroundLayer
{
  return (PFParallaxImageLayer *)-[PFParallaxLayerStack layerWithIdentifier:](self, "layerWithIdentifier:", CFSTR("background"));
}

- (PFParallaxImageLayer)foregroundLayer
{
  return (PFParallaxImageLayer *)-[PFParallaxLayerStack layerWithIdentifier:](self, "layerWithIdentifier:", CFSTR("foreground"));
}

- (PFParallaxVideoLayer)settlingEffectLayer
{
  return (PFParallaxVideoLayer *)-[PFParallaxLayerStack layerWithIdentifier:](self, "layerWithIdentifier:", CFSTR("settling-video"));
}

- (PFParallaxImageLayer)inactiveBackgroundLayer
{
  return (PFParallaxImageLayer *)-[PFParallaxLayerStack layerWithIdentifier:](self, "layerWithIdentifier:", CFSTR("inactive-background"));
}

- (PFParallaxImageLayer)inactiveForegroundLayer
{
  return (PFParallaxImageLayer *)-[PFParallaxLayerStack layerWithIdentifier:](self, "layerWithIdentifier:", CFSTR("inactive-foreground"));
}

- (PFParallaxImageLayer)backgroundBackfillLayer
{
  return (PFParallaxImageLayer *)-[PFParallaxLayerStack layerWithIdentifier:](self, "layerWithIdentifier:", CFSTR("background-backfill"));
}

- (PFParallaxImageLayer)foregroundBackfillLayer
{
  return (PFParallaxImageLayer *)-[PFParallaxLayerStack layerWithIdentifier:](self, "layerWithIdentifier:", CFSTR("foreground-backfill"));
}

- (id)layerWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_layerMap, "objectForKeyedSubscript:", a3);
}

- (BOOL)hasMainLayers
{
  void *v2;
  char v3;

  -[PFParallaxLayerStack layers](self, "layers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PFExists();

  return v3;
}

- (BOOL)hasInactiveLayers
{
  void *v2;
  char v3;

  -[PFParallaxLayerStack layers](self, "layers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PFExists();

  return v3;
}

- (BOOL)hasBackfillLayers
{
  void *v2;
  char v3;

  -[PFParallaxLayerStack layers](self, "layers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PFExists();

  return v3;
}

- (BOOL)hasDebugLayers
{
  void *v2;
  char v3;

  -[PFParallaxLayerStack layers](self, "layers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PFExists();

  return v3;
}

- (void)markMayContainBakedHeadroom
{
  self->_mayContainBakedHeadroom = 1;
}

- (NSArray)layers
{
  return self->_layers;
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (double)clockAreaLuminance
{
  return self->_clockAreaLuminance;
}

- (BOOL)depthEnabled
{
  return self->_depthEnabled;
}

- (BOOL)settlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (BOOL)parallaxDisabled
{
  return self->_parallaxDisabled;
}

- (BOOL)mayContainBakedHeadroom
{
  return self->_mayContainBakedHeadroom;
}

- (NSDictionary)layerMap
{
  return self->_layerMap;
}

- (void)setLayerMap:(id)a3
{
  objc_storeStrong((id *)&self->_layerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerMap, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_layers, 0);
}

uint64_t __38__PFParallaxLayerStack_hasDebugLayers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("debug"));

  return v3;
}

uint64_t __41__PFParallaxLayerStack_hasBackfillLayers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("backfill"));

  return v3;
}

uint64_t __41__PFParallaxLayerStack_hasInactiveLayers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("inactive"));

  return v3;
}

uint64_t __37__PFParallaxLayerStack_hasMainLayers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isForeground") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isBackground");

  return v3;
}

- (id)layerStackByUpdatingVisibleFrame:(CGRect)a3
{
  void *v4;
  PFParallaxLayerStack *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  double v9;
  PFParallaxLayerStack *v10;

  -[PFPosterOrientedLayout layoutByUpdatingVisibleFrame:](self->_layout, "layoutByUpdatingVisibleFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PFParallaxLayerStack alloc];
  -[PFParallaxLayerStack layers](self, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
  v8 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
  -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
  v10 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v4, v7, v8, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v9);

  return v10;
}

- (id)layerStackByUpdatingInactiveFrame:(CGRect)a3
{
  void *v4;
  PFParallaxLayerStack *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  double v9;
  PFParallaxLayerStack *v10;

  -[PFPosterOrientedLayout layoutByUpdatingInactiveFrame:](self->_layout, "layoutByUpdatingInactiveFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PFParallaxLayerStack alloc];
  -[PFParallaxLayerStack layers](self, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
  v8 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
  -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
  v10 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v4, v7, v8, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v9);

  return v10;
}

- (id)layerStackByUpdatingClockLayerOrder:(id)a3
{
  void *v4;
  PFParallaxLayerStack *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  double v9;
  PFParallaxLayerStack *v10;

  -[PFPosterOrientedLayout layoutByUpdatingClockLayerOrder:](self->_layout, "layoutByUpdatingClockLayerOrder:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PFParallaxLayerStack alloc];
  -[PFParallaxLayerStack layers](self, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
  v8 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
  -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
  v10 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v4, v7, v8, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v9);

  return v10;
}

- (id)layerStackByUpdatingDepthEnabled:(BOOL)a3
{
  _BOOL8 v3;
  PFParallaxLayerStack *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  double v9;
  PFParallaxLayerStack *v10;

  v3 = a3;
  if (-[PFParallaxLayerStack depthEnabled](self, "depthEnabled") == a3)
  {
    v10 = self;
  }
  else
  {
    v5 = [PFParallaxLayerStack alloc];
    -[PFParallaxLayerStack layers](self, "layers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFParallaxLayerStack layout](self, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
    -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
    v10 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v7, v3, v8, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v9);

  }
  return v10;
}

- (id)layerStackByUpdatingSettlingEffectEnabled:(BOOL)a3
{
  _BOOL8 v3;
  PFParallaxLayerStack *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  PFParallaxLayerStack *v10;

  v3 = a3;
  if (-[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled") == a3)
  {
    v10 = self;
  }
  else
  {
    v5 = [PFParallaxLayerStack alloc];
    -[PFParallaxLayerStack layers](self, "layers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFParallaxLayerStack layout](self, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
    v9 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
    -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
    v10 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v7, v8, v9, v3);

  }
  return v10;
}

- (id)layerStackByUpdatingParallaxDisabled:(BOOL)a3
{
  _BOOL8 v3;
  PFParallaxLayerStack *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  double v9;
  PFParallaxLayerStack *v10;

  v3 = a3;
  if (-[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled") == a3)
  {
    v10 = self;
  }
  else
  {
    v5 = [PFParallaxLayerStack alloc];
    -[PFParallaxLayerStack layers](self, "layers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFParallaxLayerStack layout](self, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
    -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
    v10 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v7, v8, v3, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v9);

  }
  return v10;
}

- (id)layerStackByUpdatingClockAreaLuminance:(double)a3
{
  PFParallaxLayerStack *v5;
  void *v6;
  void *v7;
  PFParallaxLayerStack *v8;

  v5 = [PFParallaxLayerStack alloc];
  -[PFParallaxLayerStack layers](self, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayerStack layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v5, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v6, v7, -[PFParallaxLayerStack depthEnabled](self, "depthEnabled"), -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled"), -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), a3);

  return v8;
}

- (id)layerStackByUpdatingLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  PFParallaxLayerStack *v30;
  _BOOL8 v31;
  _BOOL8 v32;
  double v33;
  PFParallaxLayerStack *v34;

  v4 = a3;
  -[PFParallaxLayerStack layers](self, "layers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayerStack layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "imageSize");
  v12 = v11;
  v14 = v13;

  if (v8 != v12 || v10 != v14)
  {
    objc_msgSend(v4, "imageSize");
    v17 = v16;
    -[PFParallaxLayerStack layout](self, "layout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageSize");
    v20 = v19;

    if (v17 >= v20)
    {
      -[PFParallaxLayerStack layers](self, "layers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFParallaxLayerStack layout](self, "layout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageSize");
      v24 = v23;
      v26 = v25;
      objc_msgSend(v4, "imageSize");
      -[PFParallaxLayerStack _resizeLayers:oldImageSize:newImageSize:](self, "_resizeLayers:oldImageSize:newImageSize:", v21, v24, v26, v27, v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v29;
    }
    else
    {
      -[PFParallaxLayerStack layout](self, "layout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageSize");
      objc_msgSend(v4, "layoutByUpdatingImageSize:");
      v22 = v4;
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  v30 = [PFParallaxLayerStack alloc];
  v31 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
  v32 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
  -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
  v34 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v30, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v5, v4, v31, v32, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v33);

  return v34;
}

- (id)_resizeLayers:(id)a3 oldImageSize:(CGSize)a4 newImageSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v12;
  void *v13;
  _QWORD v15[4];
  __int128 v16;
  double v17;
  double v18;
  __int128 v19;
  double v20;
  double v21;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v9 = a3;
  v10 = v9;
  if (v8 == width && v7 == height)
  {
    v12 = v9;
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D538];
    v19 = v16;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__PFParallaxLayerStack_Updating___resizeLayers_oldImageSize_newImageSize___block_invoke;
    v15[3] = &__block_descriptor_96_e42___PFParallaxLayer_16__0__PFParallaxLayer_8l;
    v17 = v8;
    v18 = v7;
    v20 = width;
    v21 = height;
    PFMap(v9, v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (id)layerStackByUpdatingLayers:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PFParallaxLayerStack *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  PFParallaxLayerStack *v26;
  _BOOL8 v27;
  _BOOL8 v28;
  double v29;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    PFMap(v7, &__block_literal_global_88);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFParallaxLayerStack layerMap](self, "layerMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeObjectsForKeys:", v8);
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFParallaxLayerStack layout](self, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageSize");
    if (v13 <= width)
    {
      v16 = width;
      v18 = height;
    }
    else
    {
      -[PFParallaxLayerStack layout](self, "layout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageSize");
      v16 = v15;
      v18 = v17;

    }
    -[PFParallaxLayerStack layout](self, "layout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageSize");
    -[PFParallaxLayerStack _resizeLayers:oldImageSize:newImageSize:](self, "_resizeLayers:oldImageSize:newImageSize:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PFParallaxLayerStack _resizeLayers:oldImageSize:newImageSize:](self, "_resizeLayers:oldImageSize:newImageSize:", v7, width, height, v16, v18);
    v22 = objc_claimAutoreleasedReturnValue();

    -[PFParallaxLayerStack layout](self, "layout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutByUpdatingImageSize:", v16, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = [PFParallaxLayerStack alloc];
    v27 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
    v28 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
    -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
    v19 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v26, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v25, v24, v27, v28, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v29);

    v7 = (id)v22;
  }
  else
  {
    v19 = self;
  }

  return v19;
}

- (id)layerStackByRemovingLayersWithOptions:(unint64_t)a3
{
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[PFParallaxLayerStack layers](self, "layers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (!v7)
      goto LABEL_27;
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isForeground") & 1) != 0)
        {
          if ((v4 & 1) == 0)
            goto LABEL_13;
LABEL_12:
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

          goto LABEL_13;
        }
        v12 = objc_msgSend(v11, "isBackground");
        if ((v4 & 1) != 0 && (v12 & 1) != 0)
          goto LABEL_12;
LABEL_13:
        v14 = objc_msgSend(v11, "isBackfill");
        if ((v4 & 2) != 0 && v14)
        {
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
        v16 = objc_msgSend(v11, "isDebug");
        if ((v4 & 0x10) != 0 && v16)
        {
          objc_msgSend(v11, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

        }
        v18 = objc_msgSend(v11, "isInactive");
        if ((v4 & 4) != 0 && v18)
        {
          objc_msgSend(v11, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

        }
        v20 = objc_msgSend(v11, "isSettlingEffect");
        if ((v4 & 0x40) != 0)
        {
          if (v20)
          {
            objc_msgSend(v11, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v21);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v8)
      {
LABEL_27:

        -[PFParallaxLayerStack layerStackByRemovingLayersWithIdentifiers:](self, "layerStackByRemovingLayersWithIdentifiers:", v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        return v22;
      }
    }
  }
  return self;
}

- (id)layerStackByRemovingLayersWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PFParallaxLayerStack *v12;
  PFParallaxLayerStack *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)-[NSDictionary mutableCopy](self->_layerMap, "mutableCopy");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10++), (_QWORD)v20);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v11 = objc_msgSend(v5, "count");
    if (v11 == -[NSDictionary count](self->_layerMap, "count"))
    {
      v12 = self;
    }
    else
    {
      v13 = [PFParallaxLayerStack alloc];
      objc_msgSend(v5, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFParallaxLayerStack layout](self, "layout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PFParallaxLayerStack depthEnabled](self, "depthEnabled");
      v17 = -[PFParallaxLayerStack parallaxDisabled](self, "parallaxDisabled");
      -[PFParallaxLayerStack clockAreaLuminance](self, "clockAreaLuminance");
      v12 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:](v13, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v14, v15, v16, v17, -[PFParallaxLayerStack settlingEffectEnabled](self, "settlingEffectEnabled"), v18);

    }
  }
  else
  {
    v12 = self;
  }

  return v12;
}

uint64_t __71__PFParallaxLayerStack_Updating__layerStackByUpdatingLayers_imageSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __74__PFParallaxLayerStack_Updating___resizeLayers_oldImageSize_newImageSize___block_invoke(double *a1, void *a2)
{
  id v3;
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
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v8 = a1[6];
  v7 = a1[7];
  v10 = v9 - a1[4];
  v11 = 0.0;
  v12 = 0.0;
  if (v8 != 0.0)
  {
    v10 = v10 / v8;
    v12 = v5 / v8;
  }
  v13 = v4 - a1[5];
  if (v7 != 0.0)
  {
    v13 = v13 / v7;
    v11 = v6 / v7;
  }
  objc_msgSend(v3, "layerByUpdatingFrame:", a1[8] + v10 * a1[10], a1[9] + v13 * a1[11], v12 * a1[10], v11 * a1[11]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
