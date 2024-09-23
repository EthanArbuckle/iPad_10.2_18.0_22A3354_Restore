@implementation MFPGraphics

- (MFPGraphics)initWithCanvas:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  MFPGraphics *v7;
  MFPGraphics *v8;
  MFPGraphicsState *v9;
  MFPGraphicsState *mCurrentState;
  NSMutableArray *v11;
  NSMutableArray *mStateStack;
  MFPObjectTable *v13;
  MFPObjectTable *mObjectTable;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *mAvailableFonts;
  uint64_t i;
  void *v20;
  void *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)MFPGraphics;
  v7 = -[MFPGraphics init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->mCanvas.origin.x = x;
    v7->mCanvas.origin.y = y;
    v7->mCanvas.size.width = width;
    v7->mCanvas.size.height = height;
    v9 = -[MFPGraphicsState initWithDefaults]([MFPGraphicsState alloc], "initWithDefaults");
    mCurrentState = v8->mCurrentState;
    v8->mCurrentState = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mStateStack = v8->mStateStack;
    v8->mStateStack = v11;

    v13 = objc_alloc_init(MFPObjectTable);
    mObjectTable = v8->mObjectTable;
    v8->mObjectTable = v13;

    TCFontFamilyNames();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v16);
    mAvailableFonts = v8->mAvailableFonts;
    v8->mAvailableFonts = (NSMutableDictionary *)v17;

    if (v16)
    {
      for (i = 0; i != v16; ++i)
      {
        objc_msgSend(v15, "objectAtIndex:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "uppercaseString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v8->mAvailableFonts, "setObject:forKey:", v20, v21);

      }
    }

  }
  return v8;
}

- (void)setHorizontalDpi:(int)a3 verticalDpi:(int)a4
{
  self->mHorzDpi = a3;
  self->mVertDpi = a4;
}

- (CGRect)canvas
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mCanvas.origin.x;
  y = self->mCanvas.origin.y;
  width = self->mCanvas.size.width;
  height = self->mCanvas.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)objectTable
{
  return self->mObjectTable;
}

+ (float)unitsPerInch:(int)a3
{
  float result;

  result = 0.0;
  if ((a3 - 3) <= 3)
    return flt_22A4C0C40[a3 - 3];
  return result;
}

- (float)pixelsPerUnit:(int)a3 direction:(int)a4
{
  float v4;
  float v7;
  uint64_t v8;

  v4 = 1.0;
  if (a3 >= 3)
  {
    +[MFPGraphics unitsPerInch:](MFPGraphics, "unitsPerInch:");
    if (!a4)
    {
      v8 = 40;
      return (float)*(int *)((char *)&self->super.isa + v8) / v7;
    }
    v4 = 0.0;
    if (a4 == 1)
    {
      v8 = 44;
      return (float)*(int *)((char *)&self->super.isa + v8) / v7;
    }
  }
  return v4;
}

- (CGAffineTransform)pageTransformWithScale:(SEL)a3 unit:(float)a4
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  CGAffineTransform *v10;
  float v11;
  float v12;
  float v13;

  v7 = MEMORY[0x24BDBD8B8];
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  if (a5 >= 2)
  {
    v9 = *(_QWORD *)&a5;
    v10 = self;
    -[CGAffineTransform pixelsPerUnit:direction:](self, "pixelsPerUnit:direction:");
    v12 = v11 * a4;
    -[CGAffineTransform pixelsPerUnit:direction:](v10, "pixelsPerUnit:direction:", v9, 1);
    return CGAffineTransformMakeScale(retstr, v12, (float)(v13 * a4));
  }
  return self;
}

- (void)saveGraphicsStateWithId:(unsigned int)a3
{
  CGContext *CurrentContext;
  MFPGraphicsState *v5;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v5 = -[MFPGraphicsState initWithGraphicsState:]([MFPGraphicsState alloc], "initWithGraphicsState:", self->mCurrentState);
  -[NSMutableArray addObject:](self->mStateStack, "addObject:");

}

- (void)beginContainerWithId:(unsigned int)a3 containerTransform:(CGAffineTransform *)a4
{
  CGContext *CurrentContext;
  MFPGraphicsContainer *v7;
  MFPGraphicsState *mCurrentState;
  __int128 v9;
  MFPGraphicsContainer *v10;
  MFPGraphicsState *v11;
  MFPGraphicsState *v12;
  _OWORD v13[3];

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v7 = [MFPGraphicsContainer alloc];
  mCurrentState = self->mCurrentState;
  v9 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v9;
  v13[2] = *(_OWORD *)&a4->tx;
  v10 = -[MFPGraphicsContainer initWithParentGraphicsState:containerTransform:](v7, "initWithParentGraphicsState:containerTransform:", mCurrentState, v13);
  -[NSMutableArray addObject:](self->mStateStack, "addObject:", v10);
  v11 = -[MFPGraphicsState initWithDefaults]([MFPGraphicsState alloc], "initWithDefaults");
  v12 = self->mCurrentState;
  self->mCurrentState = v11;

}

- (void)beginContainerNoParamsWithId:(unsigned int)a3
{
  uint64_t v3;
  MFPGraphicsState *mCurrentState;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v3 = *(_QWORD *)&a3;
  memset(&v8, 0, sizeof(v8));
  mCurrentState = self->mCurrentState;
  if (mCurrentState)
    -[MFPGraphicsState pageTransform](mCurrentState, "pageTransform");
  else
    memset(&v7, 0, sizeof(v7));
  CGAffineTransformInvert(&v8, &v7);
  v6 = v8;
  -[MFPGraphics beginContainerWithId:containerTransform:](self, "beginContainerWithId:containerTransform:", v3, &v6);
}

- (void)beginContainerWithId:(unsigned int)a3 boundsInParent:(CGRect)a4 bounds:(CGRect)a5 boundsUnit:(int)a6
{
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  double height;
  double width;
  double v14;
  double v15;
  CGFloat v16;
  float v17;
  float v18;
  float v19;
  CGFloat v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;

  y = a4.origin.y;
  x = a4.origin.x;
  v8 = *(_QWORD *)&a3;
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v22 = *MEMORY[0x24BDBD8B8];
  v23 = v10;
  v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (a6 >= 2)
  {
    v11 = *(_QWORD *)&a6;
    height = a5.size.height;
    width = a5.size.width;
    v14 = a5.origin.y;
    v15 = a5.origin.x;
    v16 = a4.size.width;
    v20 = a4.size.height;
    -[MFPGraphics pixelsPerUnit:direction:](self, "pixelsPerUnit:direction:", *(_QWORD *)&a6, 0);
    v18 = v17;
    -[MFPGraphics pixelsPerUnit:direction:](self, "pixelsPerUnit:direction:", v11, 1);
    mapSrcRectOntoDstRect((uint64_t)&v22, v15 * v18, v14 * v19, width * v18, height * v19, x, y, v16, v20);
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  -[MFPGraphics beginContainerWithId:containerTransform:](self, "beginContainerWithId:containerTransform:", v8, v21);
}

- (void)restoreGraphicsStateOrEndContainerWithId:(unsigned int)a3
{
  void *v5;
  id v6;
  void *v7;
  CGContext *CurrentContext;

  while (-[NSMutableArray count](self->mStateStack, "count") > (unint64_t)a3)
  {
    -[NSMutableArray lastObject](self->mStateStack, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(v5, "parentGraphicsState");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    objc_storeStrong((id *)&self->mCurrentState, v6);
    -[NSMutableArray removeLastObject](self->mStateStack, "removeLastObject");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextRestoreGState(CurrentContext);

  }
}

- (BOOL)areThereOpenContainers
{
  unint64_t v3;
  void *v4;
  char isKindOfClass;

  if (-[NSMutableArray count](self->mStateStack, "count"))
  {
    v3 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->mStateStack, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      ++v3;
    }
    while (v3 < -[NSMutableArray count](self->mStateStack, "count"));
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)currentState
{
  return self->mCurrentState;
}

- (void)fillPath:(id)a3 brush:(id)a4
{
  objc_msgSend(a4, "fillPath:", a3);
}

- (void)strokePath:(id)a3 pen:(id)a4
{
  objc_msgSend(a4, "strokePath:", a3);
}

- (id)fontNameForUppercaseFontName:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mAvailableFonts, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAvailableFonts, 0);
  objc_storeStrong((id *)&self->mObjectTable, 0);
  objc_storeStrong((id *)&self->mStateStack, 0);
  objc_storeStrong((id *)&self->mCurrentState, 0);
}

@end
