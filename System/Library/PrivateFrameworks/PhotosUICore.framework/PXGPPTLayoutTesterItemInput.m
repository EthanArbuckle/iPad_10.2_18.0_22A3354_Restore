@implementation PXGPPTLayoutTesterItemInput

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)weight
{
  return self->_weight;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredCropRect.origin.x;
  y = self->_preferredCropRect.origin.y;
  width = self->_preferredCropRect.size.width;
  height = self->_preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_acceptableCropRect.origin.x;
  y = self->_acceptableCropRect.origin.y;
  width = self->_acceptableCropRect.size.width;
  height = self->_acceptableCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGAffineTransform)transform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (CGPoint)positionOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)weightUsingCriterion:(int64_t)a3
{
  return self->_weight;
}

+ (id)createItemInputsForCount:(int64_t)a3
{
  int64_t v3;
  void *v4;
  time_t v5;
  PXGPPTLayoutTesterItemInput *v11;
  CGSize v13;
  int64x2_t v14;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  v5 = time(0);
  srand48(v5);
  if (v3 >= 1)
  {
    __asm { FMOV            V0.2D, #1.0 }
    v13 = _Q0;
    v14 = vdupq_n_s64(0x4069000000000000uLL);
    do
    {
      v11 = objc_alloc_init(PXGPPTLayoutTesterItemInput);
      v11->_size = (CGSize)v14;
      v11->_weight = drand48();
      v11->_preferredCropRect.origin.x = 0.0;
      v11->_preferredCropRect.origin.y = 0.0;
      v11->_preferredCropRect.size = v13;
      v11->_acceptableCropRect.origin.x = 0.0;
      v11->_acceptableCropRect.origin.y = 0.0;
      v11->_acceptableCropRect.size = v13;
      objc_msgSend(v4, "addObject:", v11);

      --v3;
    }
    while (v3);
  }
  return v4;
}

@end
