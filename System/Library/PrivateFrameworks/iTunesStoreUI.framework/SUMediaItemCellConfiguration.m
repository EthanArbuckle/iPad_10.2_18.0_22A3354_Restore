@implementation SUMediaItemCellConfiguration

- (SUMediaItemCellConfiguration)initWithStringCount:(unint64_t)a3 imageCount:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUMediaItemCellConfiguration;
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](&v5, sel_initWithStringCount_imageCount_, a3 + 1, a4 + 2);
}

- (CGSize)artworkSize
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = objc_msgSend(self->super.super.super.super._context, "imageProvider");
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(self->super.super.super.super._context, "artworkWidth");
    v6 = v5;
    objc_msgSend(v4, "finalSize");
    if (v6 > 0.00000011920929)
      v7 = v6;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)copyImageDataProvider
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUMediaItemCellConfiguration;
  v3 = -[SUArtworkCellConfiguration copyImageDataProvider](&v5, sel_copyImageDataProvider);
  -[SUMediaItemCellConfiguration artworkSize](self, "artworkSize");
  objc_msgSend(v3, "setFinalSize:");
  return v3;
}

- (int64_t)mediaIconType
{
  uint64_t v3;
  int64_t result;
  void *v5;

  v3 = objc_msgSend(self->super.super.super.super._representedObject, "itemType");
  result = 1;
  if (v3 != 1005 && v3 != 1011)
  {
    if ((SUItemTypeIsVideoType(v3) & 1) != 0)
    {
      return 2;
    }
    else
    {
      v5 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "itemMediaKind");
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB2728]))
        return 2;
      else
        return 0;
    }
  }
  return result;
}

- (BOOL)showContentRating
{
  return objc_msgSend(self->super.super.super.super._representedObject, "contentRating") != 0;
}

- (double)alphaForLabelAtIndex:(unint64_t)a3 fromAlpha:(double *)a4 withModifiers:(unint64_t)a5
{
  BOOL v5;
  double result;

  v5 = (a5 & 4) != 0 && a3 == 0;
  result = 0.0;
  if (!v5)
    result = 1.0;
  if (a4)
    *a4 = result;
  return result;
}

- (double)alphaForImageAtIndex:(unint64_t)a3 fromAlpha:(double *)a4 withModifiers:(unint64_t)a5
{
  BOOL v5;
  double result;

  v5 = (a5 & 4) != 0 && a3 == 1;
  result = 0.0;
  if (!v5)
    result = 1.0;
  if (a4)
    *a4 = result;
  return result;
}

+ (id)copyDefaultContext
{
  return objc_alloc_init(SUMediaItemCellContext);
}

- (void)drawWithModifiers:(unint64_t)a3
{
  CGRect *stringFrames;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGRect v11;

  if ((a3 & 4) == 0)
  {
    if (*self->super.super.super._strings)
    {
      objc_msgSend(-[SUCellConfiguration colorForLabelAtIndex:withModifiers:](self, "colorForLabelAtIndex:withModifiers:", 0), "set");
      stringFrames = self->super.super.super._stringFrames;
      -[SUMediaItemCellConfiguration _ratingBorderInsets](self, "_ratingBorderInsets");
      v6 = v5 + stringFrames->origin.y;
      v9 = stringFrames->size.width - (v7 + v8);
      v11.size.height = stringFrames->size.height - (v5 + v10);
      v11.origin.x = stringFrames->origin.x + v7;
      v11.origin.y = v6;
      v11.size.width = v9;
      UIRectFrame(v11);
    }
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 7.0);
}

- (void)reloadImages
{
  double v3;
  double v4;
  BOOL v5;
  uint64_t v6;
  id v7;
  id **p_images;
  int64_t v9;
  uint64_t v10;
  id v11;

  -[SUMediaItemCellConfiguration artworkSize](self, "artworkSize");
  v5 = v3 == *MEMORY[0x24BDBF148] && v4 == *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v5
    || (v6 = objc_msgSend((id)objc_msgSend(self->super.super.super.super._representedObject, "itemImageCollection"), "bestImageForSize:", v3, v4)) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[SUArtworkCellConfiguration artworkImageForItemImage:](self, "artworkImageForItemImage:", v6);
  }
  p_images = &self->super.super.super._images;

  *self->super.super.super._images = v7;
  v9 = -[SUMediaItemCellConfiguration mediaIconType](self, "mediaIconType");
  if (v9 && (v10 = v9, (objc_msgSend(self->super.super.super.super._context, "hiddenMediaIconTypes") & v9) == 0))
  {
    (*p_images)[1] = (id)SUTableCellGetMediaIcon(v10, 0);
    v11 = (id)SUTableCellGetMediaIcon(v10, 1);
    p_images = &self->super.super.super._selectedImages;
  }
  else
  {
    v11 = 0;
    *((_QWORD *)self->super.super.super._selectedImages + 1) = 0;
  }
  (*p_images)[1] = v11;
}

- (void)reloadLayoutInformation
{
  id v2;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGRect *stringFrames;
  double v10;
  double v11;

  v2 = *self->super.super.super._strings;
  if (v2)
  {
    objc_msgSend(self->super.super.super.super._context, "sizeForString:font:constrainedToSize:", v2, -[SUMediaItemCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), 1.79769313e308, 10.0);
    v5 = v4;
    v7 = v6;
    v8 = self->super.super.super.super._layoutSize.width + -5.0;
    -[SUMediaItemCellConfiguration _ratingBorderInsets](self, "_ratingBorderInsets");
    stringFrames = self->super.super.super._stringFrames;
    stringFrames->origin.x = v8 - v5 + v10;
    stringFrames->origin.y = -v11;
    stringFrames->size.width = v5;
    stringFrames->size.height = v7;
  }
}

- (void)reloadStrings
{
  void *v3;
  id v4;

  if (-[SUMediaItemCellConfiguration showContentRating](self, "showContentRating"))
    v3 = (void *)objc_msgSend((id)objc_msgSend(self->super.super.super.super._representedObject, "contentRating"), "ratingLabel");
  else
    v3 = 0;

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *self->super.super.super._strings = v4;
}

- (UIEdgeInsets)_ratingBorderInsets
{
  double v2;
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  v3 = v2 == 2.0;
  v4 = -0.0;
  v5 = 0.0;
  if (!v3)
    v4 = 0.0;
  v6 = -3.0;
  if (v3)
    v6 = -2.0;
  else
    v5 = -1.0;
  v7 = -2.0;
  result.right = v7;
  result.bottom = v5;
  result.left = v6;
  result.top = v4;
  return result;
}

@end
