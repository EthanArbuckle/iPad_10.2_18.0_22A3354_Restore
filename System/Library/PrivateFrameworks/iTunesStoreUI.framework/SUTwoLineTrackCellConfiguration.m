@implementation SUTwoLineTrackCellConfiguration

- (SUTwoLineTrackCellConfiguration)init
{
  return -[SUMediaItemCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 2, 0);
}

+ (id)copyDefaultContext
{
  id v2;
  SUImageDataProvider *v3;
  id v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUTwoLineTrackCellConfiguration;
  v2 = objc_msgSendSuper2(&v6, sel_copyDefaultContext);
  v3 = SUTableCellCopyImageProviderForSize(55.0, 55.0);
  objc_msgSend(v2, "setImageProvider:", v3);

  v4 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PlaceholderNormal.png"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class())));
  objc_msgSend(v2, "setPlaceholderImage:", v4);

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 56.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 2) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "grayColor", a3);
  if ((a4 & 1) == 0)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
        return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      if (objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "contentRating"), "isExplicitContent"))return (id)SUTableCellGetExplicitColor();
      return (id)SUTableCellGetCleanColor();
    }
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "grayColor", a3);
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  if (a3 == 2)
    return (id)SUTableCellGetHighlightedTextColor();
  return -[SUTwoLineTrackCellConfiguration colorForLabelAtIndex:withModifiers:](self, "colorForLabelAtIndex:withModifiers:", a3, a4 & 0xFFFFFFFFFFFFFFFELL);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  objc_super v4;

  if (a3 == 2)
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0);
  if (a3 == 1)
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
  v4.receiver = self;
  v4.super_class = (Class)SUTwoLineTrackCellConfiguration;
  return -[SUMediaItemCellConfiguration fontForLabelAtIndex:](&v4, sel_fontForLabelAtIndex_);
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 2;
}

- (void)reloadLayoutInformation
{
  double v3;
  id *images;
  double v5;
  CGRect *imageFrames;
  CGFloat v7;
  float v8;
  CGSize *p_layoutSize;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  CGRect *v16;
  CGRect *stringFrames;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)SUTwoLineTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadLayoutInformation](&v18, sel_reloadLayoutInformation);
  -[SUMediaItemCellConfiguration artworkSize](self, "artworkSize");
  images = self->super.super.super.super._images;
  if (*images)
  {
    v5 = v3;
    objc_msgSend(*images, "size");
    imageFrames = self->super.super.super.super._imageFrames;
    v8 = (v5 - v7) * 0.5;
    imageFrames->origin.x = floorf(v8);
    imageFrames->origin.y = 0.0;
    imageFrames->size.width = v7;
    imageFrames->size.height = 55.0;
    images = self->super.super.super.super._images;
    p_layoutSize = &self->super.super.super.super.super._layoutSize;
    v10 = self->super.super.super.super.super._layoutSize.width + -5.0;
    if (*images)
    {
      v11 = v5 + -3.0 + 10.0;
      goto LABEL_6;
    }
  }
  else
  {
    p_layoutSize = &self->super.super.super.super.super._layoutSize;
    v10 = self->super.super.super.super.super._layoutSize.width + -5.0;
  }
  v11 = 10.0;
LABEL_6:
  v12 = images[1];
  v13 = v10;
  if (v12)
  {
    objc_msgSend(v12, "size", v10);
    v19.size.width = v14;
    v19.size.height = v15;
    v16 = self->super.super.super.super._imageFrames;
    v16[1].size.width = v14;
    v16[1].size.height = v15;
    v19.origin.x = v10 - v14;
    v19.origin.y = floor((p_layoutSize->height - v15) * 0.5);
    v16[1].origin.x = v19.origin.x;
    v16[1].origin.y = v19.origin.y;
    v13 = CGRectGetMinX(v19) + -5.0;
  }
  stringFrames = self->super.super.super.super._stringFrames;
  stringFrames[2].origin.x = v11;
  stringFrames[2].origin.y = 10.0;
  stringFrames[2].size.width = v13 - v11;
  stringFrames[2].size.height = 18.0;
  stringFrames[1].origin.x = v11 + 1.0;
  stringFrames[1].origin.y = 27.0;
  stringFrames[1].size.width = v13 - v11 + -1.0;
  stringFrames[1].size.height = 16.0;
  if (*self->super.super.super.super._strings)
  {
    v20.origin.x = v13 + stringFrames->origin.x - v10;
    v20.origin.y = stringFrames->origin.y + 30.0;
    stringFrames->origin.x = v20.origin.x;
    stringFrames->origin.y = v20.origin.y;
    v20.size.width = stringFrames->size.width;
    v20.size.height = stringFrames->size.height;
    self->super.super.super.super._stringFrames[1].size.width = CGRectGetMinX(v20)
                                                              + -6.0
                                                              - self->super.super.super.super._stringFrames[1].origin.x;
  }
}

- (void)reloadImages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUTwoLineTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadImages](&v3, sel_reloadImages);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))
  {

    *((_QWORD *)self->super.super.super.super._selectedImages + 1) = 0;
  }
}

- (void)reloadStrings
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUTwoLineTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadStrings](&v7, sel_reloadStrings);
  v3 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *((_QWORD *)self->super.super.super.super._strings + 2) = v4;
  v5 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "artistName");

  v6 = (id)objc_msgSend(v5, "length");
  if (v6)
    v6 = v5;
  *((_QWORD *)self->super.super.super.super._strings + 1) = v6;
}

@end
