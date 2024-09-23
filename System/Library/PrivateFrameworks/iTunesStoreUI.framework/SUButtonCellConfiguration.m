@implementation SUButtonCellConfiguration

- (SUButtonCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 1, 0);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  uint64_t v4;
  double result;

  v4 = objc_msgSend(a4, "itemType", a3);
  result = 55.0;
  if (v4 == 1)
    return 48.0;
  return result;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if ((a4 & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", a3);
  else
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor", a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  uint64_t v3;
  double v4;

  v3 = objc_msgSend(self->super.super.super.super._representedObject, "itemType", a3);
  v4 = 17.0;
  if (v3 == 1)
    v4 = 14.0;
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", v4);
}

- (void)reloadLayoutInformation
{
  CGSize *p_layoutSize;
  CGRect *stringFrames;
  float64_t v5;
  float64x2_t v6;
  float64_t v7;
  float64x2_t v8;

  p_layoutSize = &self->super.super.super.super._layoutSize;
  objc_msgSend(self->super.super.super.super._context, "sizeForString:font:constrainedToSize:", *self->super.super.super._strings, -[SUButtonCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 0), self->super.super.super.super._layoutSize.width, self->super.super.super.super._layoutSize.height);
  stringFrames = self->super.super.super._stringFrames;
  v6.f64[0] = v5;
  v6.f64[1] = v7;
  v8 = vsubq_f64(*(float64x2_t *)p_layoutSize, v6);
  __asm { FMOV            V3.2D, #0.5 }
  stringFrames->origin = (CGPoint)vrndmq_f64(vmulq_f64(v8, _Q3));
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
