@implementation PREditorElementLayoutController

+ (void)registerBoundingRect:(CGRect)a3 forTitleLayout:(unint64_t)a4 variant:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (void *)registeredTitleLayoutToBoundingRects;
  if (!registeredTitleLayoutToBoundingRects)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)registeredTitleLayoutToBoundingRects;
    registeredTitleLayoutToBoundingRects = v12;

    v11 = (void *)registeredTitleLayoutToBoundingRects;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)registeredTitleLayoutToBoundingRects;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

  }
  *(CGFloat *)v24 = x;
  *(CGFloat *)&v24[1] = y;
  *(CGFloat *)&v24[2] = width;
  *(CGFloat *)&v24[3] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v24, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)registeredTitleLayoutToBoundingRects;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v23);

}

+ (void)clearRegisteredBoundingRectForTitleLayout:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)registeredTitleLayoutToBoundingRects;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v4);

}

+ (CGRect)frameForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "frameForElements:variant:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "boundsForElements:variant:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  void *v6;
  void *v7;
  PREditorElementLayoutController *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)frameForElements_variant__mainScreenLayoutController;
  if (!frameForElements_variant__mainScreenLayoutController)
  {
    v8 = -[PREditorElementLayoutController initWithTraitEnvironment:]([PREditorElementLayoutController alloc], "initWithTraitEnvironment:", v6);
    v9 = (void *)frameForElements_variant__mainScreenLayoutController;
    frameForElements_variant__mainScreenLayoutController = (uint64_t)v8;

    v7 = (void *)frameForElements_variant__mainScreenLayoutController;
  }
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "frameForElements:variant:withBoundingRect:", a3, a4);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "frameForElements:variant:", a3, a4);
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (PREditorElementLayoutController)initWithTraitEnvironment:(id)a3
{
  id v4;
  PREditorElementLayoutController *v5;
  PREditorElementLayoutController *v6;
  uint64_t v7;
  CSProminentLayoutController *csLayoutController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PREditorElementLayoutController;
  v5 = -[PREditorElementLayoutController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_traitEnvironment, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1BCB0]), "initWithTraitEnvironment:", v4);
    csLayoutController = v6->_csLayoutController;
    v6->_csLayoutController = (CSProminentLayoutController *)v7;

  }
  return v6;
}

- (void)setNumberingSystem:(id)a3
{
  -[CSProminentLayoutController setNumberingSystem:](self->_csLayoutController, "setNumberingSystem:", CSTimeNumberingSystemStringToType());
}

- (void)setFourDigitTime:(BOOL)a3
{
  -[CSProminentLayoutController setFourDigitTime:](self->_csLayoutController, "setFourDigitTime:", a3);
}

- (CGRect)frameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PREditorElementLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  -[PREditorElementLayoutController frameAttributesForElements:variant:titleLayout:withBoundingRect:](self, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  -[PREditorElementLayoutController boundsAttributesForElements:variant:titleLayout:withBoundingRect:](self, "boundsAttributesForElements:variant:titleLayout:withBoundingRect:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)frameAttributesForElements:(unint64_t)a3 variant:(unint64_t)a4 titleLayout:(unint64_t)a5 withBoundingRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v11;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  unint64_t v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a3;
  v13 = *MEMORY[0x1E0C9D628];
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if ((a3 & 1) == 0)
  {
LABEL_4:
    if (!v11)
      return -[PREditorElementLayoutAttributes initWithRect:variant:resolvedTitleLayout:]([PREditorElementLayoutAttributes alloc], "initWithRect:variant:resolvedTitleLayout:", a4, 0, v13, v14, v15, v16);
    goto LABEL_5;
  }
  v17 = (void *)registeredTitleLayoutToBoundingRects;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "CGRectValue");
    v36.origin.x = v22;
    v36.origin.y = v23;
    v36.size.width = v24;
    v36.size.height = v25;
    v32.origin.x = v13;
    v32.origin.y = v14;
    v32.size.width = v15;
    v32.size.height = v16;
    v33 = CGRectUnion(v32, v36);
    v13 = v33.origin.x;
    v14 = v33.origin.y;
    v15 = v33.size.width;
    v16 = v33.size.height;

    v11 &= ~1uLL;
    goto LABEL_4;
  }
LABEL_5:
  if (a4 - 1 >= 3)
    v26 = 0;
  else
    v26 = a4;
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self->_csLayoutController, "frameForElements:variant:withBoundingRect:", v11 & 0x1F | (((v11 >> 5) & 3) << 6), v26, x, y, width, height);
  v37.origin.x = v27;
  v37.origin.y = v28;
  v37.size.width = v29;
  v37.size.height = v30;
  v34.origin.x = v13;
  v34.origin.y = v14;
  v34.size.width = v15;
  v34.size.height = v16;
  v35 = CGRectUnion(v34, v37);
  v13 = v35.origin.x;
  v14 = v35.origin.y;
  v15 = v35.size.width;
  v16 = v35.size.height;
  return -[PREditorElementLayoutAttributes initWithRect:variant:resolvedTitleLayout:]([PREditorElementLayoutAttributes alloc], "initWithRect:variant:resolvedTitleLayout:", a4, 0, v13, v14, v15, v16);
}

- (id)boundsAttributesForElements:(unint64_t)a3 variant:(unint64_t)a4 titleLayout:(unint64_t)a5 withBoundingRect:(CGRect)a6
{
  void *v7;
  double v8;
  double v9;
  PREditorElementLayoutAttributes *v10;

  -[PREditorElementLayoutController frameAttributesForElements:variant:titleLayout:withBoundingRect:](self, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rect");
  v10 = -[PREditorElementLayoutAttributes initWithRect:variant:resolvedTitleLayout:]([PREditorElementLayoutAttributes alloc], "initWithRect:variant:resolvedTitleLayout:", a4, objc_msgSend(v7, "resolvedTitleLayout"), 0.0, 0.0, v8, v9);

  return v10;
}

- (UITraitEnvironment)traitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_traitEnvironment);
}

- (void)setTraitEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_traitEnvironment, a3);
}

- (CSProminentLayoutController)csLayoutController
{
  return self->_csLayoutController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csLayoutController, 0);
  objc_destroyWeak((id *)&self->_traitEnvironment);
}

@end
