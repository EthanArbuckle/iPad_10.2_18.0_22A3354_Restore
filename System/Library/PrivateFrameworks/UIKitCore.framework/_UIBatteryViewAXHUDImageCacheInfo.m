@implementation _UIBatteryViewAXHUDImageCacheInfo

- (BOOL)cacheMatchesCapacity:(double)a3 fillColor:(id)a4 tintColor:(id)a5 showingBolt:(BOOL)a6 reverseLayout:(BOOL)a7 scale:(double)a8 showsPercentage:(BOOL)a9 contentSizeCategory:(id)a10
{
  _BOOL4 v11;
  _BOOL4 v13;
  _BOOL4 v14;
  id v18;
  id v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  char v25;
  void *v27;

  v11 = a9;
  v13 = a7;
  v14 = a6;
  v18 = a4;
  v19 = a5;
  v20 = a10;
  -[_UIBatteryViewAXHUDImageCacheInfo capacity](self, "capacity");
  if (v21 == a3)
  {
    -[_UIBatteryViewAXHUDImageCacheInfo fillColor](self, "fillColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqual:", v18))
    {
      -[_UIBatteryViewAXHUDImageCacheInfo tintColor](self, "tintColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isEqual:", v19)
        && -[_UIBatteryViewAXHUDImageCacheInfo showBolt](self, "showBolt") == v14
        && -[_UIBatteryViewAXHUDImageCacheInfo reverseLayoutDirection](self, "reverseLayoutDirection") == v13
        && (-[_UIBatteryViewAXHUDImageCacheInfo scale](self, "scale"), v24 == a8)
        && -[_UIBatteryViewAXHUDImageCacheInfo showsPercentage](self, "showsPercentage") == v11)
      {
        -[_UIBatteryViewAXHUDImageCacheInfo contentSizeCategory](self, "contentSizeCategory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v27, "isEqualToString:", v20);

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImage, a3);
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(double)a3
{
  self->_capacity = a3;
}

- (BOOL)showBolt
{
  return self->_showBolt;
}

- (void)setShowBolt:(BOOL)a3
{
  self->_showBolt = a3;
}

- (BOOL)reverseLayoutDirection
{
  return self->_reverseLayoutDirection;
}

- (void)setReverseLayoutDirection:(BOOL)a3
{
  self->_reverseLayoutDirection = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)showsPercentage
{
  return self->_showsPercentage;
}

- (void)setShowsPercentage:(BOOL)a3
{
  self->_showsPercentage = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end
