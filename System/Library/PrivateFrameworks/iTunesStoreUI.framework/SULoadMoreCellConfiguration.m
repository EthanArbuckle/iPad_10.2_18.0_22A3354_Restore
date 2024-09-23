@implementation SULoadMoreCellConfiguration

- (SULoadMoreCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 1, 0);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 55.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", a3);
  if ((a4 & 2) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "grayColor", a3);
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor", a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", a3, 16.0);
}

- (void)reloadLayoutInformation
{
  CGSize *p_layoutSize;
  CGFloat v4;
  CGFloat v5;
  CGRect *stringFrames;
  CGFloat v7;
  CGFloat v8;

  p_layoutSize = &self->super.super.super.super._layoutSize;
  v4 = self->super.super.super.super._layoutSize.width + -10.0 + -10.0;
  objc_msgSend(self->super.super.super.super._context, "sizeForString:font:constrainedToSize:", *self->super.super.super._strings, -[SULoadMoreCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), v4, 20.0);
  stringFrames = self->super.super.super._stringFrames;
  v8 = floor((p_layoutSize->height - v7) * 0.5);
  stringFrames->origin.x = floor((v4 - v5) * 0.5) + 10.0;
  stringFrames->origin.y = v8;
  stringFrames->size.width = v5;
  stringFrames->size.height = v7;
}

- (void)reloadStrings
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *self->super.super.super._strings = v4;
}

@end
