@implementation SUPlainTextCellConfiguration

- (SUPlainTextCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 1, 0);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  uint64_t v5;
  double v6;
  double v7;

  v5 = objc_msgSend(a4, "humanReadableDescription");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  objc_msgSend(a3, "sizeForString:font:constrainedToSize:", v5, objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0), v6 + -20.0, 3.40282347e38);
  return v7;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", a3, a4, 0.294117647, 0.333333333, 0.419607843, 1.0);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a3, 15.0);
}

- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6
{
  *a3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", a3, a4, a5, a6);
  *a4 = (CGSize)xmmword_21B558270;
  return 1;
}

- (void)reloadLayoutInformation
{
  CGRect *stringFrames;
  CGSize layoutSize;

  stringFrames = self->super.super.super._stringFrames;
  layoutSize = self->super.super.super.super._layoutSize;
  stringFrames->origin.x = 0.0;
  stringFrames->origin.y = 0.0;
  stringFrames->size = layoutSize;
}

- (void)reloadStrings
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "humanReadableDescription");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *self->super.super.super._strings = v4;
}

- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3
{
  return 1;
}

@end
