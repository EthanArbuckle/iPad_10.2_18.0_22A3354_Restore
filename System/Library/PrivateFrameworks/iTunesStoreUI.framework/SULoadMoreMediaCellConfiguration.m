@implementation SULoadMoreMediaCellConfiguration

- (SULoadMoreMediaCellConfiguration)init
{
  return -[SUArrayCellConfiguration initWithStringCount:imageCount:](self, "initWithStringCount:imageCount:", 2, 0);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 56.0;
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
    if (a3 == 1)
      return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.321568627, 0.91372549, 1.0);
  }
  return (id)objc_msgSend(v4, "grayColor", a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  double v3;

  if (!a3)
    return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
  if (*self->super.super.super._strings)
    v3 = 18.0;
  else
    v3 = 14.0;
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", v3);
}

- (void)reloadLayoutInformation
{
  double v3;
  double previousCellHeight;
  double v5;
  id v6;
  double height;
  CGRect *stringFrames;
  double v9;
  CGFloat MaxY;
  CGRect *v11;
  CGFloat v12;
  _QWORD *p_height;
  CGRect v14;

  v3 = self->super.super.super.super._layoutSize.width + -5.0;
  previousCellHeight = self->_previousCellHeight;
  if (previousCellHeight >= 0.00000011920929)
    v5 = previousCellHeight + 10.0 + -4.0;
  else
    v5 = 10.0;
  v6 = *self->super.super.super._strings;
  if (*((_QWORD *)self->super.super.super._strings + 1))
  {
    height = self->super.super.super.super._layoutSize.height;
    stringFrames = self->super.super.super._stringFrames;
    v9 = v3 - v5;
    stringFrames[1].origin.x = v5;
    if (!v6)
    {
      p_height = (_QWORD *)&stringFrames[1].size.height;
      stringFrames[1].origin.y = floor((height + -16.0) * 0.5);
      stringFrames[1].size.width = v9;
      goto LABEL_11;
    }
    v14.origin.y = floor((height + -35.0) * 0.5);
    stringFrames[1].origin.y = v14.origin.y;
    stringFrames[1].size.width = v9;
    stringFrames[1].size.height = 20.0;
    v14.size.height = 20.0;
    v14.origin.x = v5;
    v14.size.width = v9;
    MaxY = CGRectGetMaxY(v14);
    v11 = self->super.super.super._stringFrames;
    v11->origin.x = v5;
    v11->origin.y = MaxY + -1.0;
    v11->size.width = v9;
  }
  else
  {
    if (!v6)
      return;
    v11 = self->super.super.super._stringFrames;
    v12 = floor((self->super.super.super.super._layoutSize.height + -16.0) * 0.5);
    v11->origin.x = v5;
    v11->origin.y = v12;
    v11->size.width = v3 - v5;
  }
  p_height = (_QWORD *)&v11->size.height;
LABEL_11:
  *p_height = 0x4030000000000000;
}

- (void)reloadStrings
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_msgSend(self->super.super.super.super._representedObject, "title");

  v4 = (id)objc_msgSend(v3, "length");
  if (v4)
    v4 = v3;
  *((_QWORD *)self->super.super.super._strings + 1) = v4;
  if (objc_msgSend(self->super.super.super.super._representedObject, "representedItemCount") < 0)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SEARCH_TOTAL"), &stru_24DE83F60, 0), objc_msgSend(self->super.super.super.super._representedObject, "representedItemCount"));

  v6 = (id)objc_msgSend(v5, "length");
  if (v6)
    v6 = v5;
  *self->super.super.super._strings = v6;
}

- (double)previousCellHeight
{
  return self->_previousCellHeight;
}

- (void)setPreviousCellHeight:(double)a3
{
  self->_previousCellHeight = a3;
}

@end
