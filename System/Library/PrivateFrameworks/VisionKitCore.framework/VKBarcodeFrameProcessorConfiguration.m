@implementation VKBarcodeFrameProcessorConfiguration

- (VKBarcodeFrameProcessorConfiguration)init
{
  char *v2;
  VKBarcodeFrameProcessorConfiguration *v3;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKBarcodeFrameProcessorConfiguration;
  v2 = -[VKBarcodeFrameProcessorConfiguration init](&v11, sel_init);
  v3 = (VKBarcodeFrameProcessorConfiguration *)v2;
  if (v2)
  {
    v2[8] = 1;
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)(v2 + 24) = _Q0;
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VKBarcodeFrameProcessorConfiguration *v4;
  void *v5;

  v4 = objc_alloc_init(VKBarcodeFrameProcessorConfiguration);
  -[VKBarcodeFrameProcessorConfiguration setIsForSingleItem:](v4, "setIsForSingleItem:", -[VKBarcodeFrameProcessorConfiguration isForSingleItem](self, "isForSingleItem"));
  -[VKBarcodeFrameProcessorConfiguration comparisonPoint](self, "comparisonPoint");
  -[VKBarcodeFrameProcessorConfiguration setComparisonPoint:](v4, "setComparisonPoint:");
  -[VKBarcodeFrameProcessorConfiguration symbologies](self, "symbologies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKBarcodeFrameProcessorConfiguration setSymbologies:](v4, "setSymbologies:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VKBarcodeFrameProcessorConfiguration *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = (VKBarcodeFrameProcessorConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_opt_class();
      VKDynamicCast(v5, (uint64_t)v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[VKBarcodeFrameProcessorConfiguration isEqualToBarcodeFrameProcessorConfiguration:](self, "isEqualToBarcodeFrameProcessorConfiguration:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToBarcodeFrameProcessorConfiguration:(id)a3
{
  id v4;
  int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "isForSingleItem");
  v6 = -[VKBarcodeFrameProcessorConfiguration isForSingleItem](self, "isForSingleItem");
  objc_msgSend(v4, "comparisonPoint");
  v8 = v7;
  v10 = v9;
  -[VKBarcodeFrameProcessorConfiguration comparisonPoint](self, "comparisonPoint");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "symbologies");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKBarcodeFrameProcessorConfiguration symbologies](self, "symbologies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToArray:", v16);

  if (v5 == v6)
    return VKMNearlyEqualPointsWithThreshold(v8, v10, v12, v14, 0.00001) & v17;
  else
    return 0;
}

- (BOOL)isForSingleItem
{
  return self->_isForSingleItem;
}

- (void)setIsForSingleItem:(BOOL)a3
{
  self->_isForSingleItem = a3;
}

- (CGPoint)comparisonPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_comparisonPoint.x;
  y = self->_comparisonPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setComparisonPoint:(CGPoint)a3
{
  self->_comparisonPoint = a3;
}

- (NSArray)symbologies
{
  return self->_symbologies;
}

- (void)setSymbologies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbologies, 0);
}

@end
