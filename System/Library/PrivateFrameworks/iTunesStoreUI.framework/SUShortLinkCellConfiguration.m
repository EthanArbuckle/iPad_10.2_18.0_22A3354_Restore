@implementation SUShortLinkCellConfiguration

- (SUShortLinkCellConfiguration)init
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
  v6.super_class = (Class)&OBJC_METACLASS___SUShortLinkCellConfiguration;
  v2 = objc_msgSendSuper2(&v6, sel_copyDefaultContext);
  v3 = SUTableCellCopyImageProviderForSize(55.0, 55.0);
  objc_msgSend(v2, "setImageProvider:", v3);

  v4 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PlaceholderNormal.png"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class())));
  objc_msgSend(v2, "setPlaceholderImage:", v4);

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  _BOOL4 v6;
  int v7;
  double result;

  if (objc_msgSend(a4, "secondaryTitle") || objc_msgSend(a4, "artistName"))
  {
    v6 = 1;
    if (a3)
      goto LABEL_4;
    return 56.0;
  }
  v6 = objc_msgSend(a4, "containerName") != 0;
  if (!a3)
    return 56.0;
LABEL_4:
  v7 = objc_msgSend(a3, "itemsHaveArtwork");
  result = 45.0;
  if (v7 | v6)
    return 56.0;
  return result;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  void *v4;

  if ((a4 & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", a3);
  if ((a4 & 2) != 0)
  {
    v4 = (void *)MEMORY[0x24BDF6950];
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDF6950];
    if (a3 == 2)
      return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  }
  return (id)objc_msgSend(v4, "grayColor", a3);
}

- (id)copyImageDataProvider
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUShortLinkCellConfiguration;
  v3 = -[SUMediaItemCellConfiguration copyImageDataProvider](&v5, sel_copyImageDataProvider);
  if (SUItemTypeIsVideoType(objc_msgSend(self->super.super.super.super.super._representedObject, "itemType")))
    objc_msgSend(v3, "setFillColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
  return v3;
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;

  switch(a3)
  {
    case 3uLL:
      return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    case 2uLL:
      if (objc_msgSend(self->super.super.super.super._strings[1], "length")
        || objc_msgSend(self->super.super.super.super._strings[3], "length"))
      {
        v5 = (void *)MEMORY[0x24BDF6A70];
        v6 = 14.0;
      }
      else
      {
        v5 = (void *)MEMORY[0x24BDF6A70];
        v6 = 17.0;
      }
      return (id)objc_msgSend(v5, "boldSystemFontOfSize:", v6);
    case 1uLL:
      return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    default:
      return 0;
  }
}

- (void)reloadLayoutInformation
{
  double v3;
  double v4;
  id v5;
  CGRect *imageFrames;
  CGFloat v7;
  float v8;
  CGSize *p_layoutSize;
  double width;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  CGRect *v15;
  double v16;
  id *strings;
  CGRect *stringFrames;
  CGRect *v19;
  char v20;
  CGRect *v21;
  uint64_t v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)SUShortLinkCellConfiguration;
  -[SUMediaItemCellConfiguration reloadLayoutInformation](&v23, sel_reloadLayoutInformation);
  -[SUMediaItemCellConfiguration artworkSize](self, "artworkSize");
  v4 = v3;
  v5 = *self->super.super.super.super._images;
  if (!v5)
  {
    p_layoutSize = &self->super.super.super.super.super._layoutSize;
    width = self->super.super.super.super.super._layoutSize.width;
    goto LABEL_5;
  }
  objc_msgSend(v5, "size");
  imageFrames = self->super.super.super.super._imageFrames;
  v8 = (v4 - v7) * 0.5;
  imageFrames->origin.x = floorf(v8);
  imageFrames->origin.y = 0.0;
  imageFrames->size.width = v7;
  imageFrames->size.height = 55.0;
  p_layoutSize = &self->super.super.super.super.super._layoutSize;
  width = self->super.super.super.super.super._layoutSize.width;
  if (!*self->super.super.super.super._images)
  {
LABEL_5:
    v11 = 10.0;
    if (objc_msgSend(self->super.super.super.super.super._representedObject, "itemDisplayType") == 1)
      goto LABEL_7;
  }
  v11 = v4 + -2.0 + 10.0;
LABEL_7:
  v12 = (void *)*((_QWORD *)self->super.super.super.super._images + 1);
  if (v12)
  {
    objc_msgSend(v12, "size");
    v24.size.width = v13;
    v24.size.height = v14;
    v15 = self->super.super.super.super._imageFrames;
    v15[1].size.width = v13;
    v15[1].size.height = v14;
    v24.origin.x = p_layoutSize->width - v13 + -5.0;
    v15[1].origin.x = v24.origin.x;
    v15[1].origin.y = 21.0;
    v24.origin.y = 21.0;
    width = CGRectGetMinX(v24);
  }
  v16 = width + -5.0;
  strings = self->super.super.super.super._strings;
  if (strings[3])
  {
    stringFrames = self->super.super.super.super._stringFrames;
    stringFrames[2].origin.x = v11;
    stringFrames[2].origin.y = 19.0;
    stringFrames[2].size.width = v16 - v11;
    stringFrames[2].size.height = 18.0;
    stringFrames[1].origin.x = v11;
    stringFrames[1].origin.y = 2.0;
    stringFrames[1].size.width = v16 - v11;
    stringFrames[1].size.height = 16.0;
    stringFrames[3].origin.x = v11;
    stringFrames[3].origin.y = 37.0;
    stringFrames[3].size.width = v16 - v11;
    stringFrames[3].size.height = 16.0;
  }
  else if (strings[1])
  {
    v19 = self->super.super.super.super._stringFrames;
    v19[2].origin.x = v11;
    v19[2].origin.y = 27.0;
    v19[2].size.width = v16 - v11;
    v19[2].size.height = 18.0;
    v19[1].origin.x = v11;
    v19[1].origin.y = 10.0;
    v19[1].size.width = v16 - v11;
    v19[1].size.height = 16.0;
  }
  else
  {
    v20 = objc_msgSend(self->super.super.super.super.super._context, "itemsHaveArtwork");
    v21 = self->super.super.super.super._stringFrames;
    v21[2].origin.x = v11;
    if ((v20 & 1) != 0)
      v22 = 0x4030000000000000;
    else
      v22 = 0x4028000000000000;
    *(_QWORD *)&v21[2].origin.y = v22;
    v21[2].size.width = v16 - v11;
    v21[2].size.height = 20.0;
  }
}

- (void)reloadStrings
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUShortLinkCellConfiguration;
  -[SUMediaItemCellConfiguration reloadStrings](&v9, sel_reloadStrings);
  v3 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *((_QWORD *)self->super.super.super.super._strings + 2) = v4;
  v5 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "containerName");
  if (!objc_msgSend(v5, "length"))
    v5 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "artistName");

  v6 = (id)objc_msgSend(v5, "length");
  if (v6)
    v6 = v5;
  *((_QWORD *)self->super.super.super.super._strings + 1) = v6;
  v7 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "secondaryTitle");

  v8 = (id)objc_msgSend(v7, "length");
  if (v8)
    v8 = v7;
  *((_QWORD *)self->super.super.super.super._strings + 3) = v8;
}

- (BOOL)showContentRating
{
  return 0;
}

@end
