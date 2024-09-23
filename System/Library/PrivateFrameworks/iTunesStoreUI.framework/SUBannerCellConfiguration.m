@implementation SUBannerCellConfiguration

- (SUBannerCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 0, 2);
}

+ (id)copyDefaultContext
{
  SUItemCellContext *v2;
  SUImageDataProvider *v3;
  SUClipCornersImageModifier *v4;
  SUStrokeEdgesImageModifier *v5;
  SUArrayImageModifier *v6;
  uint64_t v7;

  v2 = objc_alloc_init(SUItemCellContext);
  v3 = objc_alloc_init(SUImageDataProvider);
  -[SUImageDataProvider setFillColor:](v3, "setFillColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[SUImageDataProvider setFinalSize:](v3, "setFinalSize:", 147.0, 83.0);
  v4 = objc_alloc_init(SUClipCornersImageModifier);
  -[SUClipCornersImageModifier setCornerRadius:](v4, "setCornerRadius:", 10.0);
  -[SUClipCornersImageModifier setCorners:](v4, "setCorners:", 255);
  v5 = objc_alloc_init(SUStrokeEdgesImageModifier);
  -[SUStrokeEdgesImageModifier setEdgeInsets:](v5, "setEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
  -[SUStrokeEdgesImageModifier setStrokeColor:](v5, "setStrokeColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.200000003));
  -[SUStrokeEdgesImageModifier setStrokeCurrentPath:](v5, "setStrokeCurrentPath:", 1);
  v6 = objc_alloc_init(SUArrayImageModifier);
  -[SUArrayImageModifier setModifiers:](v6, "setModifiers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, v5, 0));
  -[SUImageDataProvider setModifier:](v3, "setModifier:", v6);

  -[SUArtworkCellContext setImageProvider:](v2, "setImageProvider:", v3);
  v7 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("PlaceholderBanner.png"));
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PlaceholderBanner.png"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
  -[SUArtworkCellContext setPlaceholderImage:](v2, "setPlaceholderImage:", v7);
  return v2;
}

+ (double)minimumRowHeight
{
  return 101.0;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  uint64_t v4;
  double result;

  v4 = objc_msgSend(a3, "tableViewStyle");
  result = 101.0;
  if (v4 == 1)
    return 84.0;
  return result;
}

- (id)copyImageDataProvider
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(self->super.super.super.super._context, "imageProvider"), "copy");
  if (self->super.super.super.super._layoutSize.width > 0.00000011920929)
  {
    -[SUBannerCellConfiguration _imageSizeForLayoutSize:](self, "_imageSizeForLayoutSize:");
    objc_msgSend(v3, "setFinalSize:");
  }
  return v3;
}

- (void)reloadAfterArtworkLoad
{
  objc_super v3;

  -[SUBannerCellConfiguration reloadImages](self, "reloadImages");
  v3.receiver = self;
  v3.super_class = (Class)SUBannerCellConfiguration;
  -[SUArtworkCellConfiguration reloadAfterArtworkLoad](&v3, sel_reloadAfterArtworkLoad);
}

- (void)reloadImages
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_msgSend((id)objc_msgSend(self->super.super.super.super._representedObject, "itemImageCollection"), "itemImages");
  v4 = objc_msgSend(v3, "count");
  if (v4)
    v5 = objc_msgSend(v3, "objectAtIndex:", 0);
  else
    v5 = 0;

  if (v5)
    v6 = -[SUArtworkCellConfiguration artworkImageForItemImage:](self, "artworkImageForItemImage:", v5);
  else
    v6 = 0;
  *self->super.super.super._images = v6;
  if (v4 < 2)
    v7 = 0;
  else
    v7 = objc_msgSend(v3, "objectAtIndex:", 1);

  if (v7)
    v8 = -[SUArtworkCellConfiguration artworkImageForItemImage:](self, "artworkImageForItemImage:", v7);
  else
    v8 = 0;
  *((_QWORD *)self->super.super.super._images + 1) = v8;
}

- (void)reloadLayoutInformation
{
  CGSize *p_layoutSize;
  CGFloat v4;
  float v5;
  CGFloat v6;
  CGRect *imageFrames;
  double v8;
  CGRect *v9;

  p_layoutSize = &self->super.super.super.super._layoutSize;
  -[SUBannerCellConfiguration _imageSizeForLayoutSize:](self, "_imageSizeForLayoutSize:", self->super.super.super.super._layoutSize.width, self->super.super.super.super._layoutSize.height);
  v5 = (p_layoutSize->height - v4) * 0.5;
  v6 = floorf(v5);
  imageFrames = self->super.super.super._imageFrames;
  imageFrames->origin.x = 0.0;
  imageFrames->origin.y = v6;
  imageFrames->size.width = v8;
  imageFrames->size.height = v4;
  imageFrames[1].origin.x = p_layoutSize->width - v8;
  imageFrames[1].origin.y = v6;
  imageFrames[1].size.width = v8;
  imageFrames[1].size.height = v4;
  if (!objc_msgSend(self->super.super.super.super._context, "tableViewStyle"))
  {
    v9 = self->super.super.super._imageFrames;
    v9->origin.x = 10.0;
    v9[1].origin.x = v9[1].origin.x + -10.0;
  }
}

- (CGSize)_imageSizeForLayoutSize:(CGSize)a3
{
  double v3;
  uint64_t v4;
  double v5;
  float v6;
  float v7;
  double v8;
  double v9;
  CGSize result;

  v3 = a3.width + -6.0;
  v4 = objc_msgSend(self->super.super.super.super._context, "tableViewStyle");
  v5 = v3 + -20.0;
  if (v4)
    v5 = v3;
  v6 = v5 * 0.5;
  v7 = fminf(roundf(v6), 147.0);
  v8 = v7;
  v9 = roundf(v7 * 0.56463);
  result.height = v9;
  result.width = v8;
  return result;
}

@end
