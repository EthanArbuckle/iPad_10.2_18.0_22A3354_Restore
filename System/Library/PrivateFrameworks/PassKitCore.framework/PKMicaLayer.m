@implementation PKMicaLayer

- (PKMicaLayer)init
{
  return -[PKMicaLayer initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (PKMicaLayer)initWithFrame:(CGRect)a3
{
  return -[PKMicaLayer initWithFrame:package:](self, "initWithFrame:package:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKMicaLayer)initWithFrame:(CGRect)a3 package:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PKMicaLayer *v16;
  id *p_isa;
  void *v18;
  id v19;
  void *v20;
  id v21;
  CGFloat v22;
  id v23;
  uint64_t v24;
  void (**v25)(void *, void *, void *);
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  PKMicaLayer *v44;
  uint64_t v45;
  NSDictionary *publishedColorLayers;
  id v47;
  uint64_t v48;
  NSDictionary *publishedColorShapeLayers;
  void *context;
  id v52;
  id v53;
  PKMicaLayer *v54;
  void *v55;
  void (**v56)(void *, void *, void *);
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  _QWORD aBlock[4];
  id v65;
  id v66;
  id v67;
  CATransform3D v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v71 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = v9;
  if (!v9)
  {

    v44 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v9, "rootLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGeometryFlipped:", objc_msgSend(v10, "isGeometryFlipped"));
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  if (CGRectIsNull(v72))
  {
    x = *MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
    width = v13 * 0.5;
    height = v15 * 0.5;
  }
  if (!v11)
  {

    goto LABEL_31;
  }
  v69.receiver = self;
  v69.super_class = (Class)PKMicaLayer;
  v16 = -[PKMicaLayer init](&v69, sel_init);
  if (!v16)
  {
LABEL_31:
    v44 = 0;
    goto LABEL_32;
  }
  p_isa = (id *)&v16->super.super.isa;
  PKLayerNullActions();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "setActions:", v18);

  objc_msgSend(p_isa, "setFrame:", x, y, width, height);
  v55 = v11;
  objc_storeStrong(p_isa + 4, v11);
  v19 = p_isa[4];
  PKLayerNullActions();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActions:", v20);

  objc_msgSend(p_isa[4], "setAnchorPoint:", 0.5, 0.5);
  v21 = p_isa[4];
  v22 = fmin(width / v13, height / v15);
  CATransform3DMakeScale(&v68, v22, v22, 1.0);
  objc_msgSend(v21, "setTransform:", &v68);
  v54 = (PKMicaLayer *)p_isa;
  objc_msgSend(p_isa, "addSublayer:", p_isa[4]);
  v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v66 = v23;
  v24 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PKMicaLayer_initWithFrame_package___block_invoke;
  aBlock[3] = &unk_1E2ADCBE8;
  v52 = v67;
  v65 = v52;
  v25 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v62[0] = v24;
  v62[1] = 3221225472;
  v62[2] = __37__PKMicaLayer_initWithFrame_package___block_invoke_2;
  v62[3] = &unk_1E2ADCC10;
  v53 = v23;
  v63 = v53;
  v56 = (void (**)(void *, void *, void *))_Block_copy(v62);
  context = (void *)MEMORY[0x19400CFE8]();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^\\((layer|shape)(?::([^\\)]+))?\\)(?::.+)?$"), 0, 0);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v57 = v10;
  objc_msgSend(v10, "publishedObjectNames");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (!v28)
    goto LABEL_24;
  v29 = v28;
  v30 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v59 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v26, "firstMatchInString:options:range:", v32, 4, 0, objc_msgSend(v32, "length"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "numberOfRanges");
      if (v34 >= 2)
      {
        v35 = v34;
        v36 = objc_msgSend(v33, "rangeAtIndex:", 1);
        objc_msgSend(v32, "substringWithRange:", v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35 == 2 || (v39 = objc_msgSend(v33, "rangeAtIndex:", 2), !v40))
        {
          v41 = 0;
        }
        else
        {
          objc_msgSend(v32, "substringWithRange:", v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v38, "isEqualToString:", CFSTR("layer")))
        {
          objc_msgSend(v57, "publishedObjectWithName:", v32);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v25[2](v25, v42, v41);
          goto LABEL_20;
        }
        if (objc_msgSend(v38, "isEqualToString:", CFSTR("shape")))
        {
          objc_msgSend(v57, "publishedObjectWithName:", v32);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v56[2](v56, v42, v41);
LABEL_20:

        }
      }

    }
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  }
  while (v29);
LABEL_24:

  objc_autoreleasePoolPop(context);
  v43 = (void *)MEMORY[0x19400CFE8]();
  v44 = v54;
  if (objc_msgSend(v52, "count"))
  {
    __37__PKMicaLayer_initWithFrame_package___block_invoke_3(&v67);
    v45 = objc_claimAutoreleasedReturnValue();
    publishedColorLayers = v54->_publishedColorLayers;
    v54->_publishedColorLayers = (NSDictionary *)v45;

  }
  v47 = v53;
  v11 = v55;
  if (objc_msgSend(v53, "count"))
  {
    __37__PKMicaLayer_initWithFrame_package___block_invoke_3(&v66);
    v48 = objc_claimAutoreleasedReturnValue();
    publishedColorShapeLayers = v54->_publishedColorShapeLayers;
    v54->_publishedColorShapeLayers = (NSDictionary *)v48;

    v47 = v66;
  }
  objc_autoreleasePoolPop(v43);

  v10 = v57;
LABEL_32:

LABEL_33:
  return v44;
}

void __37__PKMicaLayer_initWithFrame_package___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v5)
        v5 = &stru_1E2ADF4C0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
      }
      objc_msgSend(v6, "addObject:", v7);

    }
  }

}

void __37__PKMicaLayer_initWithFrame_package___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v5)
        v5 = &stru_1E2ADF4C0;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
      }
      objc_msgSend(v6, "addObject:", v7);

    }
  }

}

id __37__PKMicaLayer_initWithFrame_package___block_invoke_3(id *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v11 = *a1;
  *a1 = 0;

  v12 = (void *)objc_msgSend(v2, "copy");
  return v12;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKMicaLayer;
  -[PKMicaLayer dealloc](&v2, sel_dealloc);
}

- (void)layoutSublayers
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CALayer *rootLayer;
  double v12;
  double MidX;
  CATransform3D v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)PKMicaLayer;
  -[PKMicaLayer layoutSublayers](&v15, sel_layoutSublayers);
  -[PKMicaLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKMicaLayer pointScaleToMatchBoundsSize:](self, "pointScaleToMatchBoundsSize:", v7, v9);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v14, v12 * 0.5, v12 * 0.5, 1.0);
  -[CALayer setTransform:](rootLayer, "setTransform:", &v14);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", MidX, CGRectGetMidY(v17));
}

- (double)pointScaleToMatchBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  -[CALayer bounds](self->_rootLayer, "bounds");
  v7 = width / v6;
  v8 = 0.0;
  if (v6 == 0.0)
    v7 = 0.0;
  if (v5 != 0.0)
    v8 = height / v5;
  v9 = fmin(v7, v8);
  return v9 + v9;
}

- (CGSize)boundsSizeToMatchPointScale:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = a3 * 0.5;
  -[CALayer bounds](self->_rootLayer, "bounds");
  v5 = v3 * v4;
  v7 = v3 * v6;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (NSDictionary)publishedColorLayers
{
  return self->_publishedColorLayers;
}

- (NSDictionary)publishedColorShapeLayers
{
  return self->_publishedColorShapeLayers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishedColorShapeLayers, 0);
  objc_storeStrong((id *)&self->_publishedColorLayers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
}

@end
