@implementation SUThreeLineTrackCellConfiguration

- (SUThreeLineTrackCellConfiguration)init
{
  return -[SUMediaItemCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 3, 0);
}

+ (id)copyDefaultContext
{
  id v2;
  SUImageDataProvider *v3;
  id v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUThreeLineTrackCellConfiguration;
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
  if ((a4 & 1) != 0)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))
    {
      if (a3 == 3)
        return (id)SUTableCellGetHighlightedTextColor();
      else
        return -[SUThreeLineTrackCellConfiguration colorForLabelAtIndex:withModifiers:](self, "colorForLabelAtIndex:withModifiers:", a3, a4 & 0xFFFFFFFFFFFFFFFELL);
    }
    else
    {
      return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    }
  }
  else
  {
    if (a3 == 3)
      return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    if (a3 - 1 <= 1)
      return (id)objc_msgSend(MEMORY[0x24BDF6950], "grayColor", a3);
    if (objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "contentRating"), "isExplicitContent"))return (id)SUTableCellGetExplicitColor();
    else
      return (id)SUTableCellGetCleanColor();
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 1 < 2)
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
  if (a3 == 3)
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0);
  v4.receiver = self;
  v4.super_class = (Class)SUThreeLineTrackCellConfiguration;
  return -[SUMediaItemCellConfiguration fontForLabelAtIndex:](&v4, sel_fontForLabelAtIndex_);
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 3;
}

- (void)reloadImages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUThreeLineTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadImages](&v3, sel_reloadImages);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "offerMedia"), "URL"))
  {

    *((_QWORD *)self->super.super.super.super._selectedImages + 1) = 0;
  }
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
  id *strings;
  id v18;
  CGRect *stringFrames;
  _QWORD *p_height;
  double v21;
  uint64_t v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)SUThreeLineTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadLayoutInformation](&v23, sel_reloadLayoutInformation);
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
      v11 = v5 + -2.0 + 10.0;
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
    v24.size.width = v14;
    v24.size.height = v15;
    v16 = self->super.super.super.super._imageFrames;
    v16[1].size.width = v14;
    v16[1].size.height = v15;
    v24.origin.x = v10 - v14;
    v24.origin.y = floor((p_layoutSize->height - v15) * 0.5);
    v16[1].origin.x = v24.origin.x;
    v16[1].origin.y = v24.origin.y;
    v13 = CGRectGetMinX(v24) + -5.0;
  }
  strings = self->super.super.super.super._strings;
  v18 = strings[1];
  if (strings[2])
  {
    if (v18)
    {
      stringFrames = self->super.super.super.super._stringFrames;
      stringFrames[3].origin.x = v11;
      stringFrames[3].origin.y = 18.0;
      stringFrames[3].size.width = v13 - v11;
      stringFrames[3].size.height = 18.0;
      stringFrames[2].origin.x = v11 + 1.0;
      stringFrames[2].origin.y = 2.0;
      stringFrames[2].size.width = v13 - v11 + -1.0;
      stringFrames[2].size.height = 16.0;
      stringFrames[1].origin.x = v11;
      stringFrames[1].origin.y = 36.0;
      stringFrames[1].size.width = v13 - v11;
      p_height = (_QWORD *)&stringFrames[1].size.height;
      v21 = 37.0;
      v22 = 1;
      goto LABEL_14;
    }
  }
  else if (v18)
  {
    stringFrames = self->super.super.super.super._stringFrames;
    stringFrames[3].origin.x = v11;
    stringFrames[3].origin.y = 27.0;
    stringFrames[3].size.width = v13 - v11;
    stringFrames[3].size.height = 18.0;
    stringFrames[1].origin.x = v11;
    stringFrames[1].origin.y = 10.0;
    stringFrames[1].size.width = v13 - v11;
    p_height = (_QWORD *)&stringFrames[1].size.height;
    v21 = 30.0;
    v22 = 3;
    goto LABEL_14;
  }
  stringFrames = self->super.super.super.super._stringFrames;
  stringFrames[3].origin.x = v11;
  stringFrames[3].origin.y = 27.0;
  stringFrames[3].size.width = v13 - v11;
  stringFrames[3].size.height = 18.0;
  stringFrames[2].origin.x = v11 + 1.0;
  stringFrames[2].origin.y = 10.0;
  stringFrames[2].size.width = v13 - v11 + -1.0;
  p_height = (_QWORD *)&stringFrames[2].size.height;
  v21 = 30.0;
  v22 = 3;
LABEL_14:
  *p_height = 0x4030000000000000;
  if (*strings)
  {
    v25.origin.x = v13 + stringFrames->origin.x - v10;
    v25.origin.y = v21 + stringFrames->origin.y;
    stringFrames->origin.x = v25.origin.x;
    stringFrames->origin.y = v25.origin.y;
    v25.size.width = stringFrames->size.width;
    v25.size.height = stringFrames->size.height;
    self->super.super.super.super._stringFrames[v22].size.width = CGRectGetMinX(v25)
                                                                + -6.0
                                                                - self->super.super.super.super._stringFrames[v22].origin.x;
  }
}

- (void)reloadStrings
{
  void *v3;
  void *v4;
  uint64_t v5;
  id **p_strings;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SUThreeLineTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadStrings](&v14, sel_reloadStrings);
  v3 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "artistName");
  v4 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "title");
  if (objc_msgSend(self->super.super.super.super.super._representedObject, "itemType") == 1009)
  {
    v5 = objc_msgSend(self->super.super.super.super.super._representedObject, "containerName");
    if (v5)
      v3 = (void *)v5;
    p_strings = &self->super.super.super.super._strings;

    v7 = (id)objc_msgSend(v3, "length");
    if (v7)
      v7 = v3;
    (*p_strings)[2] = v7;

    v8 = (id)objc_msgSend(v4, "length");
    if (v8)
      v8 = v4;
    (*p_strings)[3] = v8;
    v9 = objc_msgSend(self->super.super.super.super.super._representedObject, "secondaryTitle");
  }
  else
  {
    p_strings = &self->super.super.super.super._strings;

    v10 = (id)objc_msgSend(v3, "length");
    if (v10)
      v10 = v3;
    (*p_strings)[2] = v10;

    v11 = (id)objc_msgSend(v4, "length");
    if (v11)
      v11 = v4;
    (*p_strings)[3] = v11;
    v9 = objc_msgSend(self->super.super.super.super.super._representedObject, "collectionName");
  }
  v12 = (void *)v9;

  v13 = (id)objc_msgSend(v12, "length");
  if (v13)
    v13 = v12;
  (*p_strings)[1] = v13;
}

@end
