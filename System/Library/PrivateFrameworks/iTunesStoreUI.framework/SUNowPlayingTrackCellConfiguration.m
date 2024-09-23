@implementation SUNowPlayingTrackCellConfiguration

- (SUNowPlayingTrackCellConfiguration)init
{
  return -[SUMediaItemCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 3, 0);
}

+ (id)copyDefaultContext
{
  id v2;
  SUImageDataProvider *v3;
  void *v9;
  SUReflectionImageModifier *v10;
  SUStrokeEdgesImageModifier *v11;
  SUArrayImageModifier *v12;
  id v13;
  objc_super v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___SUNowPlayingTrackCellConfiguration;
  v2 = objc_msgSendSuper2(&v15, sel_copyDefaultContext);
  v3 = objc_alloc_init(SUImageDataProvider);
  -[SUImageDataProvider setFillColor:](v3, "setFillColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[SUImageDataProvider setFinalSize:](v3, "setFinalSize:", 88.0, 88.0);
  v19 = 0;
  v20 = 0u;
  v16 = 0u;
  v17 = 0;
  v18 = xmmword_21B558540;
  __asm { FMOV            V0.2D, #1.0 }
  v21 = _Q0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A90]), "initVerticalWithValues:", &v16);
  v10 = objc_alloc_init(SUReflectionImageModifier);
  -[SUReflectionImageModifier setReflectionHeight:](v10, "setReflectionHeight:", 8.0);
  -[SUReflectionImageModifier setGradient:](v10, "setGradient:", v9);

  v11 = objc_alloc_init(SUStrokeEdgesImageModifier);
  -[SUStrokeEdgesImageModifier setEdgeInsets:](v11, "setEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
  -[SUStrokeEdgesImageModifier setFitToImage:](v11, "setFitToImage:", 1);
  -[SUStrokeEdgesImageModifier setStrokeColor:](v11, "setStrokeColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.150000006));
  v12 = objc_alloc_init(SUArrayImageModifier);
  -[SUArrayImageModifier setModifiers:](v12, "setModifiers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v10, v11, 0));
  -[SUImageDataProvider setModifier:](v3, "setModifier:", v12);

  objc_msgSend(v2, "setImageProvider:", v3);
  v13 = -[SUImageDataProvider newImageFromImage:](v3, "newImageFromImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PlaceholderBig.png"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class())));
  objc_msgSend(v2, "setPlaceholderImage:", v13);

  return v2;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 104.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 2) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "grayColor", a3);
  if ((a4 & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", a3);
  if (a3 == 2)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.2, 1.0);
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  double v3;

  v3 = 10.0;
  if (a3 == 3)
    v3 = 20.0;
  if (a3 == 1)
    v3 = 15.0;
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", v3);
}

- (void)reloadImages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNowPlayingTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadImages](&v3, sel_reloadImages);
  if (!*self->super.super.super.super._images)
    *self->super.super.super.super._images = (id)objc_msgSend(self->super.super.super.super.super._context, "placeholderImage");
}

- (void)reloadLayoutInformation
{
  CGRect *imageFrames;
  CGRect *stringFrames;
  double v10;
  id *strings;
  CGRect *v12;
  CGFloat v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUNowPlayingTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadLayoutInformation](&v15, sel_reloadLayoutInformation);
  imageFrames = self->super.super.super.super._imageFrames;
  __asm { FMOV            V0.2D, #7.0 }
  imageFrames->origin = _Q0;
  imageFrames->size = (CGSize)xmmword_21B558550;
  stringFrames = self->super.super.super.super._stringFrames;
  v10 = self->super.super.super.super.super._layoutSize.width + -5.0 + -102.0;
  stringFrames[1].origin = (CGPoint)xmmword_21B558560;
  stringFrames[1].size.width = v10;
  *(_OWORD *)&stringFrames[1].size.height = xmmword_21B558570;
  stringFrames[2].origin.y = 6.0;
  stringFrames[2].size.width = v10;
  stringFrames[2].size.height = 14.0;
  strings = self->super.super.super.super._strings;
  if (strings[1])
  {
    stringFrames[3].origin = (CGPoint)xmmword_21B558580;
    stringFrames[3].size.width = v10;
    stringFrames[3].size.height = 25.0;
  }
  else
  {
    objc_msgSend(self->super.super.super.super.super._context, "sizeForString:font:constrainedToSize:", strings[3], -[SUNowPlayingTrackCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 3), v10, 50.0);
    v12 = self->super.super.super.super._stringFrames;
    v12[3].size.width = v13;
    v12[3].size.height = v14;
    *(float *)&v13 = (self->super.super.super.super.super._layoutSize.height - v14) * 0.5;
    v12[3].origin.x = 102.0;
    v12[3].origin.y = floorf(*(float *)&v13);
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
  v7.super_class = (Class)SUNowPlayingTrackCellConfiguration;
  -[SUMediaItemCellConfiguration reloadStrings](&v7, sel_reloadStrings);
  v3 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *((_QWORD *)self->super.super.super.super._strings + 3) = v4;
  v5 = (void *)objc_msgSend(self->super.super.super.super.super._representedObject, "artistName");

  v6 = (id)objc_msgSend(v5, "length");
  if (v6)
    v6 = v5;
  *((_QWORD *)self->super.super.super.super._strings + 1) = v6;
  if (!*((_QWORD *)self->super.super.super.super._strings + 2))
    *((_QWORD *)self->super.super.super.super._strings + 2) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PARTNER_NOW_PLAYING"), &stru_24DE83F60, 0);
}

- (BOOL)showContentRating
{
  return 0;
}

- (int64_t)mediaIconType
{
  return 0;
}

@end
