@implementation SUReviewCellConfiguration

- (SUReviewCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 3, 1);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  double v6;
  double v7;
  uint64_t v8;
  double v9;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v7 = v6 + -8.0 + -8.0;
  v8 = objc_msgSend(a4, "humanReadableDescription");
  objc_msgSend(a3, "sizeForString:font:constrainedToSize:", v8, objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0), v7, 1.79769313e308);
  return v9 + 43.0 + 7.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a3 == 2)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 2, a4, 0.392156863, 0.396078431, 0.4, 1.0);
  else
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor", a3, a4);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  void *v3;
  double v4;

  switch(a3)
  {
    case 2uLL:
      v3 = (void *)MEMORY[0x24BDF6A70];
      v4 = 14.0;
      return (id)objc_msgSend(v3, "systemFontOfSize:", v4);
    case 1uLL:
      return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0);
    case 0uLL:
      v3 = (void *)MEMORY[0x24BDF6A70];
      v4 = 13.0;
      return (id)objc_msgSend(v3, "systemFontOfSize:", v4);
  }
  return 0;
}

- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6
{
  if (a5 == 1)
  {
    *a3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", a3, a4, 1, a6, 0.760784314, 1.0);
    *a4 = (CGSize)xmmword_21B558270;
  }
  return a5 == 1;
}

- (void)reloadImages
{
  id context;

  context = self->super.super.super.super._context;
  objc_msgSend((id)objc_msgSend(self->super.super.super.super._representedObject, "reviewStatistics"), "averageUserRating");
  *self->super.super.super._images = (id)objc_msgSend(context, "ratingImageForRating:style:", 0);
}

- (void)reloadLayoutInformation
{
  double width;
  id *images;
  CGRect *imageFrames;
  CGFloat v6;
  CGFloat v7;
  CGRect *stringFrames;
  CGFloat v9;

  width = self->super.super.super.super._layoutSize.width;
  images = self->super.super.super._images;
  if (*images)
  {
    imageFrames = self->super.super.super._imageFrames;
    imageFrames->origin = (CGPoint)xmmword_21B558280;
    objc_msgSend(*images, "size");
    imageFrames->size.width = v6;
    imageFrames->size.height = v7;
  }
  objc_msgSend(self->super.super.super.super._context, "sizeForString:font:constrainedToSize:", *self->super.super.super._strings, -[SUReviewCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), width + -8.0 + -8.0, 1.79769313e308);
  stringFrames = self->super.super.super._stringFrames;
  stringFrames->origin = (CGPoint)xmmword_21B558290;
  stringFrames->size.width = width + -8.0 + -8.0;
  stringFrames->size.height = v9;
  stringFrames[1].origin = (CGPoint)xmmword_21B5582A0;
  stringFrames[1].size.width = width + -8.0 + -8.0;
  *(_OWORD *)&stringFrames[1].size.height = xmmword_21B5582B0;
  stringFrames[2].origin.y = 22.0;
  stringFrames[2].size.width = width + -8.0 + -80.0;
  stringFrames[2].size.height = 17.0;
}

- (void)reloadStrings
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *((_QWORD *)self->super.super.super._strings + 1) = v4;
  v5 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "humanReadableDescription");

  v6 = (id)objc_msgSend(v5, "length");
  if (v6)
    v6 = v5;
  *self->super.super.super._strings = v6;
  v7 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "stringValueForProperty:", CFSTR("user-name"));

  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = objc_msgSend(v9, "initWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("USER_NAME_FORMAT"), &stru_24DE83F60, 0), v7);
  }
  *((_QWORD *)self->super.super.super._strings + 2) = v8;
}

@end
