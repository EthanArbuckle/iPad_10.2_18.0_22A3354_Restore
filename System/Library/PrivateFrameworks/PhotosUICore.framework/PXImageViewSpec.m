@implementation PXImageViewSpec

- (PXImageViewSpec)init
{
  PXImageViewSpec *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImageViewSpec;
  result = -[PXViewSpec init](&v3, sel_init);
  if (result)
    result->_roundedCornersMode = 1;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXImageViewSpec;
  v3 = -[PXViewSpec hash](&v7, sel_hash);
  -[PXImageViewSpec overlaySpecs](self, "overlaySpecs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  int v11;
  BOOL v12;
  int64_t v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXImageViewSpec;
  v5 = -[PXViewSpec isEqual:](&v15, sel_isEqual_, v4);
  v6 = v4;
  if (!v5)
    goto LABEL_7;
  -[PXImageViewSpec overlaySpecs](self, "overlaySpecs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlaySpecs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_7;
  }
  v11 = -[PXImageViewSpec shouldEnableFocus](self, "shouldEnableFocus");
  if (v11 == objc_msgSend(v6, "shouldEnableFocus"))
  {
    v14 = -[PXImageViewSpec roundedCornersMode](self, "roundedCornersMode");
    v12 = v14 == objc_msgSend(v6, "roundedCornersMode");
    goto LABEL_8;
  }
LABEL_7:
  v12 = 0;
LABEL_8:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXImageViewSpec;
  v5 = -[PXViewSpec copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (self->_overlaySpecs)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_overlaySpecs, 1);
    v8 = (void *)v6[13];
    v6[13] = v7;
  }
  else
  {
    v8 = (void *)v5[13];
    v5[13] = 0;
  }

  *((_BYTE *)v6 + 96) = self->_shouldEnableFocus;
  v6[14] = self->_roundedCornersMode;
  return v6;
}

- (CGPoint)floatingContentMotionRotation
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.100000001;
  v3 = 0.100000001;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)floatingContentMotionTranslation
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 10.0;
  v3 = 10.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)floatingUnfocusedShadowOpacity
{
  return 0.200000003;
}

- (double)floatingShadowOpacity
{
  return 0.5;
}

- (double)floatingUnfocusedShadowRadius
{
  return 2.0;
}

- (double)floatingShadowRadius
{
  return 20.0;
}

- (double)floatingUnfocusedShadowVerticalOffset
{
  return 10.0;
}

- (CGSize)floatingUnfocusedShadowExpansion
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)focusedSizeIncrease
{
  return 70.0;
}

- (NSArray)overlaySpecs
{
  return self->_overlaySpecs;
}

- (void)setOverlaySpecs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)shouldEnableFocus
{
  return self->_shouldEnableFocus;
}

- (void)setShouldEnableFocus:(BOOL)a3
{
  self->_shouldEnableFocus = a3;
}

- (int64_t)roundedCornersMode
{
  return self->_roundedCornersMode;
}

- (void)setRoundedCornersMode:(int64_t)a3
{
  self->_roundedCornersMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaySpecs, 0);
}

@end
