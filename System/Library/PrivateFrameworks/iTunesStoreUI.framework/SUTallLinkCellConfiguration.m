@implementation SUTallLinkCellConfiguration

- (SUTallLinkCellConfiguration)init
{
  return -[SUMediaItemCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 4, 1);
}

+ (id)copyDefaultContext
{
  id v2;
  SUImageDataProvider *v3;
  id v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUTallLinkCellConfiguration;
  v2 = objc_msgSendSuper2(&v6, sel_copyDefaultContext);
  v3 = SUTableCellCopyImageProviderForSize(88.0, 88.0);
  objc_msgSend(v2, "setImageProvider:", v3);

  v4 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PlaceholderBig.png"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class())));
  objc_msgSend(v2, "setPlaceholderImage:", v4);

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 89.0;
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
    if (a3 == 4)
      return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  }
  return (id)objc_msgSend(v4, "grayColor", a3);
}

- (id)copyImageDataProvider
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUTallLinkCellConfiguration;
  v3 = -[SUMediaItemCellConfiguration copyImageDataProvider](&v5, sel_copyImageDataProvider);
  if (SUItemTypeIsVideoType(objc_msgSend(self->super.super.super.super.super._representedObject, "itemType")))
    objc_msgSend(v3, "setFillColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
  return v3;
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  uint64_t v5;

  if (a3 == 3)
  {
    v5 = objc_msgSend(self->super.super.super.super.super._representedObject, "itemType");
    v3 = (void *)MEMORY[0x24BDF6A70];
    if (v5 != 1009)
      return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    goto LABEL_7;
  }
  if (a3 != 4)
  {
    v3 = (void *)MEMORY[0x24BDF6A70];
LABEL_7:
    v4 = 13.0;
    return (id)objc_msgSend(v3, "boldSystemFontOfSize:", v4);
  }
  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = 15.0;
  return (id)objc_msgSend(v3, "boldSystemFontOfSize:", v4);
}

- (void)reloadImages
{
  void *v3;
  id context;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUTallLinkCellConfiguration;
  -[SUMediaItemCellConfiguration reloadImages](&v6, sel_reloadImages);
  if (!*self->super.super.super.super._images)
    *self->super.super.super.super._images = (id)objc_msgSend(self->super.super.super.super.super._context, "placeholderImage");
  v3 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "reviewStatistics");
  if (objc_msgSend(v3, "numberOfUserRatings") < 1)
  {
    v5 = 0;
  }
  else
  {
    context = self->super.super.super.super.super._context;
    objc_msgSend(v3, "averageUserRating");
    v5 = (id)objc_msgSend(context, "ratingImageForRating:style:", 1);
  }

  *((_QWORD *)self->super.super.super.super._images + 2) = v5;
}

- (void)reloadLayoutInformation
{
  CGRect *imageFrames;
  double v4;
  CGFloat v5;
  id *images;
  double v7;
  id v8;
  double v9;
  double v10;
  CGFloat v11;
  CGRect *v12;
  double MinX;
  double v14;
  double v15;
  id *strings;
  id v17;
  double v18;
  CGFloat v19;
  CGRect *stringFrames;
  double v21;
  double v22;
  CGRect *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGRect *v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)SUTallLinkCellConfiguration;
  -[SUMediaItemCellConfiguration reloadLayoutInformation](&v34, sel_reloadLayoutInformation);
  -[SUMediaItemCellConfiguration artworkSize](self, "artworkSize");
  imageFrames = self->super.super.super.super._imageFrames;
  imageFrames->origin.x = 0.0;
  imageFrames->origin.y = 0.0;
  imageFrames->size.width = v4;
  imageFrames->size.height = v5;
  images = self->super.super.super.super._images;
  v7 = v4 + -4.0 + 10.0;
  v8 = images[1];
  if (*images)
    v9 = v7;
  else
    v9 = 10.0;
  if (v8)
  {
    objc_msgSend(v8, "size");
    v35.size.width = v10;
    v35.size.height = v11;
    v12 = self->super.super.super.super._imageFrames;
    v12[1].size.width = v10;
    v12[1].size.height = v11;
    v35.origin.x = self->super.super.super.super.super._layoutSize.width - v10 + -5.0;
    v12[1].origin.x = v35.origin.x;
    v12[1].origin.y = 38.0;
    v35.origin.y = 38.0;
    MinX = CGRectGetMinX(v35);
  }
  else
  {
    MinX = self->super.super.super.super.super._layoutSize.width;
  }
  v14 = MinX + -5.0;
  v15 = MinX + -5.0 - v9;
  strings = self->super.super.super.super._strings;
  v17 = strings[2];
  if (v17)
  {
    objc_msgSend(self->super.super.super.super.super._context, "sizeForString:font:constrainedToSize:", v17, -[SUTallLinkCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 2), 1.79769313e308, 1.79769313e308);
    v36.size.width = v18;
    v36.size.height = v19;
    v36.origin.x = v14 - v18;
    stringFrames = self->super.super.super.super._stringFrames;
    stringFrames[2].origin.x = v36.origin.x;
    stringFrames[2].size.width = v36.size.width;
    stringFrames[2].size.height = v19;
    v36.origin.y = stringFrames[2].origin.y;
    v21 = CGRectGetMinX(v36) + -10.0 - v9;
    strings = self->super.super.super.super._strings;
  }
  else
  {
    v21 = MinX + -5.0 - v9;
  }
  objc_msgSend(self->super.super.super.super.super._context, "sizeForString:font:constrainedToSize:", strings[4], -[SUTallLinkCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 4), v21, 34.0);
  v23 = self->super.super.super.super._stringFrames;
  v24 = 24.0;
  if (v22 < 33.0)
    v24 = 34.0;
  v25 = 6.0;
  if (v22 < 33.0)
    v25 = 15.0;
  v26 = 63.0;
  if (v22 < 33.0)
    v26 = 56.0;
  v27 = 64.0;
  if (v22 < 33.0)
    v27 = 57.0;
  v23[4].origin.x = v9;
  v23[4].origin.y = v24;
  v23[4].size.width = v21;
  v23[4].size.height = v22;
  v23[1].origin.x = v9;
  v23[1].origin.y = v25;
  v23[1].size.width = v15;
  v23[1].size.height = 16.0;
  v23[3].origin.x = v9;
  v23[3].origin.y = v26;
  v23[3].size.width = v15;
  v23[3].size.height = 16.0;
  v28 = self->super.super.super.super._imageFrames;
  v28[2].origin.x = v9;
  v28[2].origin.y = v27;
  v23[2].origin.y = 35.0;
  v29 = (void *)*((_QWORD *)self->super.super.super.super._images + 2);
  if (v29)
  {
    objc_msgSend(v29, "size");
    v28[2].size.width = v30;
    v28[2].size.height = v31;
    v32 = CGRectGetMaxX(self->super.super.super.super._imageFrames[2]) + 5.0;
    v33 = self->super.super.super.super._stringFrames;
    v33[3].origin.x = v32;
    v33[3].size.width = v14 - v32;
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
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUTallLinkCellConfiguration;
  -[SUMediaItemCellConfiguration reloadStrings](&v15, sel_reloadStrings);
  v3 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *((_QWORD *)self->super.super.super.super._strings + 4) = v4;
  v5 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "containerName");
  if (!objc_msgSend(v5, "length"))
    v5 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "artistName");

  v6 = (id)objc_msgSend(v5, "length");
  if (v6)
    v6 = v5;
  *((_QWORD *)self->super.super.super.super._strings + 1) = v6;
  if (objc_msgSend(self->super.super.super.super.super._representedObject, "itemType") == 3000)
    v7 = (void *)objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "defaultStoreOffer"), "priceDisplay");
  else
    v7 = 0;

  v8 = (id)objc_msgSend(v7, "length");
  if (v8)
    v8 = v7;
  *((_QWORD *)self->super.super.super.super._strings + 2) = v8;
  v9 = objc_msgSend((id)objc_msgSend(self->super.super.super.super.super._representedObject, "reviewStatistics"), "numberOfUserRatings");
  v10 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "secondaryTitle");

  if (v9 == 1)
  {
    if (!objc_msgSend(v10, "length"))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = CFSTR("ONE_REVIEW");
      goto LABEL_18;
    }
  }
  else if (v9)
  {
    if (!objc_msgSend(v10, "length"))
    {
      v14 = objc_alloc(MEMORY[0x24BDD17C8]);
      v13 = (id)objc_msgSend(v14, "initWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REVIEW_COUNT"), &stru_24DE83F60, 0), v9);
      goto LABEL_21;
    }
  }
  else if (!objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = CFSTR("NO_REVIEWS");
LABEL_18:
    v10 = (void *)objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24DE83F60, 0);
  }
  v13 = v10;
LABEL_21:
  *((_QWORD *)self->super.super.super.super._strings + 3) = v13;
}

- (BOOL)showContentRating
{
  return 0;
}

@end
