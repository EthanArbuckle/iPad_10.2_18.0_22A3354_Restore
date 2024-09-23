@implementation SUReviewsHeaderCellConfiguration

- (SUReviewsHeaderCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 2, 1);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 51.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor", a3, a4);
  else
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0, a4, 0.392156863, 0.396078431, 0.4, 1.0);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3 == 1)
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0);
  if (a3)
    return 0;
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
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

  width = self->super.super.super.super._layoutSize.width;
  images = self->super.super.super._images;
  if (*images)
  {
    imageFrames = self->super.super.super._imageFrames;
    imageFrames->origin = (CGPoint)xmmword_21B5582D0;
    objc_msgSend(*images, "size");
    imageFrames->size.width = v6;
    imageFrames->size.height = v7;
  }
  stringFrames = self->super.super.super._stringFrames;
  stringFrames->origin = (CGPoint)xmmword_21B5582E0;
  stringFrames->size.width = width + -8.0 + -80.0;
  *(_OWORD *)&stringFrames->size.height = xmmword_21B5582F0;
  stringFrames[1].origin.y = 6.0;
  stringFrames[1].size.width = width + -8.0 + -8.0;
  stringFrames[1].size.height = 17.0;
}

- (void)reloadStrings
{
  void *v3;
  id v4;
  const __CFDate *v5;
  const __CFDate *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *((_QWORD *)self->super.super.super._strings + 1) = v4;
  v5 = (const __CFDate *)objc_msgSend(self->super.super.super.super._representedObject, "dateValueForProperty:", CFSTR("last-review-date"));
  if (v5)
  {
    v6 = SUCopyDateStringForDate(v5, kCFDateFormatterLongStyle);
    if (v6)
      v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("LAST_REVIEW_DATE_FORMAT"), &stru_24DE83F60, 0), v6);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  v8 = (id)objc_msgSend(v7, "length");
  if (v8)
    v8 = v7;
  *self->super.super.super._strings = v8;
}

@end
