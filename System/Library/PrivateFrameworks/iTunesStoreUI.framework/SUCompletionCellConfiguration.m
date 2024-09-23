@implementation SUCompletionCellConfiguration

- (SUCompletionCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 1, 0);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 44.0;
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
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", a3, 18.0);
}

- (void)reloadLayoutInformation
{
  CGRect *stringFrames;
  CGFloat v3;

  stringFrames = self->super._stringFrames;
  v3 = self->super.super._layoutSize.width + -10.0 + -10.0;
  stringFrames->origin = (CGPoint)xmmword_21B558110;
  stringFrames->size.width = v3;
  stringFrames->size.height = 20.0;
}

- (void)reloadStrings
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(self->super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *self->super._strings = v4;
}

@end
