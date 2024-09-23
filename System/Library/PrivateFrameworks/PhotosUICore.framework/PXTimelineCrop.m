@implementation PXTimelineCrop

- (PXTimelineCrop)initWithCrop:(CGRect)a3 score:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PXTimelineCrop *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXTimelineCrop;
  result = -[PXTimelineCrop init](&v10, sel_init);
  if (result)
  {
    result->_cropScore = a4;
    result->_cropRect.origin.x = x;
    result->_cropRect.origin.y = y;
    result->_cropRect.size.width = width;
    result->_cropRect.size.height = height;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXTimelineCrop cropRect](self, "cropRect");
  v5 = v4;
  -[PXTimelineCrop cropRect](self, "cropRect");
  v7 = v6;
  -[PXTimelineCrop cropRect](self, "cropRect");
  v9 = v8;
  -[PXTimelineCrop cropRect](self, "cropRect");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[PXTimelineCrop cropScore](self, "cropScore");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("cropRect:%@ cropScore:%.4f"), v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (id)cropForAsset:(id)a3 withTargetSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PXTimelineCrop *v12;
  double v14;

  v14 = 0.0;
  objc_msgSend(a3, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v14, a4.width, a4.height, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = [PXTimelineCrop alloc];
  return -[PXTimelineCrop initWithCrop:score:](v12, "initWithCrop:score:", v5, v7, v9, v11, v14);
}

@end
