@implementation TSKSegmentedControl

- (TSKSegmentedControl)initWithItems:(id)a3
{
  return -[TSKSegmentedControl initWithItems:style:](self, "initWithItems:style:", a3, 0);
}

- (TSKSegmentedControl)initWithItems:(id)a3 style:(int)a4
{
  uint64_t v4;
  TSKSegmentedControl *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)TSKSegmentedControl;
  v6 = -[TSKSegmentedControl initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 44.0);
  if (v6)
  {
    v6->mItems = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", a3);
    v6->mButtonSegments = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
    -[TSKSegmentedControl setAllowsMultipleSelection:](v6, "setAllowsMultipleSelection:", 0);
    -[TSKSegmentedControl setAllowsEmptySelection:](v6, "setAllowsEmptySelection:", 0);
    v6->mLastPressedSegmentIndex = -1;
    v7 = objc_msgSend(a3, "count");
    if (v7)
    {
      v8 = v7;
      do
      {
        --v8;
        v9 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
        objc_msgSend(v9, "addTarget:action:forControlEvents:", v6, sel_tappedSegment_, 64);
        objc_msgSend(v9, "setAdjustsImageWhenHighlighted:", 0);
        -[TSKSegmentedControl addSubview:](v6, "addSubview:", v9);
        -[NSMutableArray addObject:](v6->mButtonSegments, "addObject:", v9);
      }
      while (v8);
    }
    -[TSKSegmentedControl sizeToFit](v6, "sizeToFit");
    -[TSKSegmentedControl p_setSegmentedControlStyle:](v6, "p_setSegmentedControlStyle:", v4);
    -[TSKSegmentedControl p_updateSegmentProperties](v6, "p_updateSegmentProperties");
    -[TSKSegmentedControl setSelectedSegmentIndices:](v6, "setSelectedSegmentIndices:", objc_msgSend(MEMORY[0x24BDD15E0], "indexSet"));
  }
  return v6;
}

- (TSKSegmentedControl)initWithItems:(id)a3 style:(int)a4 target:(id)a5 action:(SEL)a6
{
  TSKSegmentedControl *v8;
  TSKSegmentedControl *v9;

  v8 = -[TSKSegmentedControl initWithItems:style:](self, "initWithItems:style:", a3, *(_QWORD *)&a4);
  v9 = v8;
  if (a6 && v8)
    -[TSKSegmentedControl addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", a5, a6, 64);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKSegmentedControl;
  -[TSKSegmentedControl dealloc](&v3, sel_dealloc);
}

- (void)p_setSelectedTintColor:(id)a3
{
  id v5;

  v5 = a3;

  self->mSelectedTintColor = (UIColor *)a3;
}

- (void)setSelectedTintColor:(id)a3
{
  -[TSKSegmentedControl p_setSelectedTintColor:](self, "p_setSelectedTintColor:", a3);
  -[TSKSegmentedControl p_updateSegmentProperties](self, "p_updateSegmentProperties");
}

- (UIColor)selectedTintColor
{
  UIColor *mSelectedTintColor;

  mSelectedTintColor = self->mSelectedTintColor;
  if (mSelectedTintColor)
    return mSelectedTintColor;
  else
    return (UIColor *)-[TSKSegmentedControl tintColor](self, "tintColor");
}

- (void)p_setSegmentedControlStyle:(int)a3
{
  self->_segmentedControlStyle = a3;
}

- (void)setSegmentedControlStyle:(int)a3
{
  -[TSKSegmentedControl p_setSegmentedControlStyle:](self, "p_setSegmentedControlStyle:", *(_QWORD *)&a3);
  -[TSKSegmentedControl p_updateSegmentProperties](self, "p_updateSegmentProperties");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double v6;
  NSMutableArray *mButtonSegments;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  height = a3.size.height;
  width = a3.size.width;
  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)TSKSegmentedControl;
  -[TSKSegmentedControl setFrame:](&v22, sel_setFrame_, a3.origin.x, a3.origin.y);
  v6 = floor(width / (double)-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  mButtonSegments = self->mButtonSegments;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mButtonSegments, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(mButtonSegments);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setFrame:", v11, 0.0, v6, height);
        v11 = v6 + v11;
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mButtonSegments, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }
  v13 = width - v6 * (double)-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments");
  v14 = -[TSKSegmentedControl numberOfSegments](self, "numberOfSegments");
  if (v13 > 0.0)
  {
    v15 = v14 - 1;
    do
    {
      v16 = (void *)-[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", v15);
      objc_msgSend(v16, "frame");
      v13 = v13 + -1.0;
      objc_msgSend(v16, "setFrame:", v13 + v17);
      --v15;
    }
    while (v13 > 0.0);
  }
  -[TSKSegmentedControl p_updateSegmentProperties](self, "p_updateSegmentProperties");
}

- (void)sizeToFit
{
  NSMutableArray *mButtonSegments;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mButtonSegments = self->mButtonSegments;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mButtonSegments, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v12;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(mButtonSegments);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "imageForState:", 0), "size");
        v8 = v8 + v10;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mButtonSegments, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
    *(float *)&v5 = v8;
  }
  else
  {
    LODWORD(v5) = 0;
  }
  -[TSKSegmentedControl sizeToFitWidth:](self, "sizeToFitWidth:", v5);
}

- (void)sizeToFitWidth:(float)a3
{
  -[TSKSegmentedControl frame](self, "frame");
  -[TSKSegmentedControl setFrame:](self, "setFrame:");
}

- (unint64_t)numberOfSegments
{
  return -[NSMutableArray count](self->mItems, "count");
}

- (void)setTitle:(id)a3 forSegment:(unint64_t)a4
{
  if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments") > a4)
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->mItems, "replaceObjectAtIndex:withObject:", a4, a3);
  -[TSKSegmentedControl p_updateSegmentProperties](self, "p_updateSegmentProperties");
}

- (void)setEnabled:(BOOL)a3 forSegment:(unint64_t)a4
{
  _BOOL8 v5;

  v5 = a3;
  if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments") > a4)
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", a4), "setEnabled:", v5);
}

- (void)setImage:(id)a3 forSegment:(unint64_t)a4
{
  if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments") > a4)
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->mItems, "replaceObjectAtIndex:withObject:", a4, a3);
  -[TSKSegmentedControl p_updateSegmentProperties](self, "p_updateSegmentProperties");
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 forSegment:(unint64_t)a5
{
  if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments") > a5)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", a5), "setBackgroundImage:forState:", a3, a4);
    if (!a4)
    {
      -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", a5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->mItems, "replaceObjectAtIndex:withObject:", a5, a3);
    }
  }
}

- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4
{
  if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments") > a4)
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", a4), "setTag:", a3);
}

- (int64_t)tagForSegment:(unint64_t)a3
{
  if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments") <= a3)
    return 0;
  else
    return objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", a3), "tag");
}

- (unint64_t)segmentWithTag:(int64_t)a3
{
  NSMutableArray *mButtonSegments;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mButtonSegments = self->mButtonSegments;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mButtonSegments, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v6;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mButtonSegments);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "tag") == a3)
          return v7 + v9;
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mButtonSegments, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_fullBleedBackgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5
{
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  CGSize v9;
  CGRect v10;
  CGRect v11;

  v9.width = 3.0;
  v9.height = 3.0;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 3.0;
  v10.size.height = 3.0;
  CGContextClearRect(CurrentContext, v10);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(a5, "CGColor"));
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 3.0;
  v11.size.height = 3.0;
  CGContextFillRect(CurrentContext, v11);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return -[UIImage resizableImageWithCapInsets:](ImageFromCurrentImageContext, "resizableImageWithCapInsets:", 1.0, 1.0, 1.0, 1.0);
}

- (id)p_losengeBackgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5
{
  double v7;
  double v8;
  double v9;
  double width;
  double height;
  CGContext *CurrentContext;
  double v14;
  UIImage *ImageFromCurrentImageContext;
  CGSize v16;
  CGRect v17;
  CGRect v18;

  objc_opt_class();
  if (TSUDynamicCast())
  {
    objc_msgSend(a3, "bounds");
    objc_msgSend(a3, "contentRectForBounds:");
    objc_msgSend(a3, "imageRectForContentRect:");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }
  objc_opt_class();
  if (TSUDynamicCast())
  {
    objc_msgSend(a3, "bounds");
    objc_msgSend(a3, "contentRectForBounds:");
    objc_msgSend(a3, "titleRectForContentRect:");
    v8 = v9;
  }
  objc_msgSend(a3, "bounds");
  objc_msgSend(a3, "backgroundRectForBounds:");
  width = v17.size.width;
  height = v17.size.height;
  if (CGRectIsEmpty(v17))
    return 0;
  v16.width = width;
  v16.height = height;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = width;
  v18.size.height = height;
  CGContextClearRect(CurrentContext, v18);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(a5, "CGColor"));
  v14 = fmax(v8 + 15.0, 38.0);
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", width * 0.5 - v14 * 0.5, height * 0.5 + -19.0, v14, 38.0, 19.0), "CGPath"));
  CGContextFillPath(CurrentContext);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (id)p_backgroundImageForButton:(id)a3 item:(id)a4 fillColor:(id)a5
{
  if (-[TSKSegmentedControl segmentedControlStyle](self, "segmentedControlStyle") == 1)
    return -[TSKSegmentedControl p_losengeBackgroundImageForButton:item:fillColor:](self, "p_losengeBackgroundImageForButton:item:fillColor:", a3, a4, a5);
  else
    return -[TSKSegmentedControl p_fullBleedBackgroundImageForButton:item:fillColor:](self, "p_fullBleedBackgroundImageForButton:item:fillColor:", a3, a4, a5);
}

- (void)p_setButtonAttributedTitle:(id)a3 color:(id)a4 forState:(unint64_t)a5 button:(id)a6
{
  UIFont *mFont;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  mFont = self->mFont;
  if (!mFont)
    mFont = (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
  v11 = *MEMORY[0x24BDF6600];
  v13[0] = *MEMORY[0x24BDF65F8];
  v13[1] = v11;
  v14[0] = mFont;
  v14[1] = a4;
  v12 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  objc_msgSend(a6, "setAttributedTitle:forState:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", a3, v12), a5);
}

- (void)p_updateSegmentProperties
{
  uint64_t v3;
  uint64_t v4;
  UIColor *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat height;
  CGContext *CurrentContext;
  CGImage *v14;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UIColor *v21;
  CGSize v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments"))
  {
    v3 = objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = -[TSKSegmentedControl tintColor](self, "tintColor");
    v19 = objc_msgSend((id)-[TSKSegmentedControl tintColor](self, "tintColor"), "colorWithAlphaComponent:", 0.4);
    v21 = -[TSKSegmentedControl selectedTintColor](self, "selectedTintColor");
    v4 = objc_msgSend((id)-[TSKSegmentedControl tintColor](self, "tintColor"), "colorWithAlphaComponent:", 0.14);
    v5 = -[UIColor colorWithAlphaComponent:](-[TSKSegmentedControl selectedTintColor](self, "selectedTintColor"), "colorWithAlphaComponent:", 0.5);
    if (-[TSKSegmentedControl numberOfSegments](self, "numberOfSegments"))
    {
      v6 = 0;
      do
      {
        v7 = (void *)-[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", v6);
        objc_msgSend(v7, "setTintColor:", -[TSKSegmentedControl tintColor](self, "tintColor"));
        objc_opt_class();
        -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6);
        v8 = (void *)TSUDynamicCast();
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, "size");
          v11 = v10;
          objc_msgSend(v9, "size");
          height = v22.height;
          v22.width = v11;
          UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextTranslateCTM(CurrentContext, 0.0, height);
          CGContextScaleCTM(CurrentContext, 1.0, -1.0);
          v14 = (CGImage *)objc_msgSend(v9, "CGImage");
          v23.origin.x = 0.0;
          v23.origin.y = 0.0;
          v23.size.width = v11;
          v23.size.height = height;
          CGContextClipToMask(CurrentContext, v23, v14);
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)-[TSKSegmentedControl tintColor](self, "tintColor"), "CGColor"));
          v24.origin.x = 0.0;
          v24.origin.y = 0.0;
          v24.size.width = v11;
          v24.size.height = height;
          CGContextClearRect(CurrentContext, v24);
          v25.origin.x = 0.0;
          v25.origin.y = 0.0;
          v25.size.width = v11;
          v25.size.height = height;
          CGContextFillRect(CurrentContext, v25);
          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), "CGColor"));
          v26.origin.x = 0.0;
          v26.origin.y = 0.0;
          v26.size.width = v11;
          v26.size.height = height;
          CGContextClearRect(CurrentContext, v26);
          v27.origin.x = 0.0;
          v27.origin.y = 0.0;
          v27.size.width = v11;
          v27.size.height = height;
          CGContextFillRect(CurrentContext, v27);
          v16 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          objc_msgSend(v7, "setImage:forState:", ImageFromCurrentImageContext, 0);
          objc_msgSend(v7, "setImage:forState:", v16, 4);
          objc_msgSend(v7, "setImage:forState:", v16, 5);
        }
        objc_opt_class();
        -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6);
        v17 = TSUDynamicCast();
        if (v17)
        {
          v18 = v17;
          -[TSKSegmentedControl p_setButtonAttributedTitle:color:forState:button:](self, "p_setButtonAttributedTitle:color:forState:button:", v17, v20, 0, v7);
          -[TSKSegmentedControl p_setButtonAttributedTitle:color:forState:button:](self, "p_setButtonAttributedTitle:color:forState:button:", v18, v3, 4, v7);
          -[TSKSegmentedControl p_setButtonAttributedTitle:color:forState:button:](self, "p_setButtonAttributedTitle:color:forState:button:", v18, v3, 5, v7);
          -[TSKSegmentedControl p_setButtonAttributedTitle:color:forState:button:](self, "p_setButtonAttributedTitle:color:forState:button:", v18, v19, 2, v7);
        }
        objc_msgSend(v7, "setBackgroundImage:forState:", 0, 0);
        objc_msgSend(v7, "setBackgroundImage:forState:", -[TSKSegmentedControl p_backgroundImageForButton:item:fillColor:](self, "p_backgroundImageForButton:item:fillColor:", v7, -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6), v21), 4);
        objc_msgSend(v7, "setBackgroundImage:forState:", -[TSKSegmentedControl p_backgroundImageForButton:item:fillColor:](self, "p_backgroundImageForButton:item:fillColor:", v7, -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6), v4), 1);
        objc_msgSend(v7, "setBackgroundImage:forState:", -[TSKSegmentedControl p_backgroundImageForButton:item:fillColor:](self, "p_backgroundImageForButton:item:fillColor:", v7, -[NSMutableArray objectAtIndex:](self->mItems, "objectAtIndex:", v6++), v5), 5);
      }
      while (v6 < -[TSKSegmentedControl numberOfSegments](self, "numberOfSegments"));
    }
  }
}

- (void)setSelectedSegmentIndices:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  if (!-[NSIndexSet isEqualToIndexSet:](self->mSelectedSegmentIndices, "isEqualToIndexSet:"))
  {

    self->mSelectedSegmentIndices = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexSet:", a3);
    v5 = -[NSMutableArray count](self->mButtonSegments, "count");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->mButtonSegments, "objectAtIndex:", i);
        objc_msgSend(MEMORY[0x24BDF6F90], "transitionWithView:duration:options:animations:completion:", 0.2);
      }
    }
  }
}

uint64_t __49__TSKSegmentedControl_setSelectedSegmentIndices___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 480), "containsIndex:", *(_QWORD *)(a1 + 48)));
}

- (void)tappedSegment:(id)a3
{
  void *v4;
  int v5;
  int64_t mLastPressedSegmentIndex;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  TSKSegmentedControl *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSString *v18;
  SEL v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  NSString *v27;
  SEL v28;
  void *v29;
  uint64_t v30;
  TSKSegmentedControl *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  self->mLastPressedSegmentIndex = -[NSMutableArray indexOfObject:](self->mButtonSegments, "indexOfObject:", a3);
  if (-[TSKSegmentedControl allowsMultipleSelection](self, "allowsMultipleSelection"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexSet:", -[TSKSegmentedControl selectedSegmentIndices](self, "selectedSegmentIndices"));
    v5 = objc_msgSend(v4, "containsIndex:", self->mLastPressedSegmentIndex);
    mLastPressedSegmentIndex = self->mLastPressedSegmentIndex;
    if (v5)
    {
      objc_msgSend(v4, "removeIndex:", mLastPressedSegmentIndex);
      if (-[TSKSegmentedControl allowsEmptySelection](self, "allowsEmptySelection") || objc_msgSend(v4, "count"))
        goto LABEL_7;
      mLastPressedSegmentIndex = self->mLastPressedSegmentIndex;
    }
    objc_msgSend(v4, "addIndex:", mLastPressedSegmentIndex);
LABEL_7:
    -[TSKSegmentedControl setSelectedSegmentIndices:](self, "setSelectedSegmentIndices:", v4);

    goto LABEL_14;
  }
  if (!-[TSKSegmentedControl allowsEmptySelection](self, "allowsEmptySelection"))
  {
    v8 = (void *)MEMORY[0x24BDD15E0];
    goto LABEL_12;
  }
  v7 = -[NSIndexSet containsIndex:](-[TSKSegmentedControl selectedSegmentIndices](self, "selectedSegmentIndices"), "containsIndex:", self->mLastPressedSegmentIndex);
  v8 = (void *)MEMORY[0x24BDD15E0];
  if (!v7)
  {
LABEL_12:
    v9 = objc_msgSend(v8, "indexSetWithIndex:", self->mLastPressedSegmentIndex);
    goto LABEL_13;
  }
  v9 = objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
LABEL_13:
  -[TSKSegmentedControl setSelectedSegmentIndices:](self, "setSelectedSegmentIndices:", v9);
LABEL_14:
  v10 = self;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)-[TSKSegmentedControl allTargets](self, "allTargets");
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v45;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(obj);
        v35 = v11;
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v13 = (void *)-[TSKSegmentedControl actionsForTarget:forControlEvent:](self, "actionsForTarget:forControlEvent:", v12, 4096);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v41 != v16)
                objc_enumerationMutation(v13);
              v18 = *(NSString **)(*((_QWORD *)&v40 + 1) + 8 * i);
              v19 = NSSelectorFromString(v18);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v12, "performSelector:withObject:", v19, self);
              }
              else
              {
                v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKSegmentedControl tappedSegment:]");
                objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKSegmentedControl.m"), 513, CFSTR("%@ does not respond to selector %@"), v12, v18);
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v15);
        }
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v22 = (void *)-[TSKSegmentedControl actionsForTarget:forControlEvent:](self, "actionsForTarget:forControlEvent:", v12, 64);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v37 != v25)
                objc_enumerationMutation(v22);
              v27 = *(NSString **)(*((_QWORD *)&v36 + 1) + 8 * j);
              v28 = NSSelectorFromString(v27);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v12, "performSelector:withObject:", v28, self);
              }
              else
              {
                v29 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKSegmentedControl tappedSegment:]");
                objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKSegmentedControl.m"), 522, CFSTR("%@ does not respond to selector %@"), v12, v27);
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v24);
        }
        v11 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v34);
  }
  v31 = self;
}

- (UIFont)font
{
  return self->mFont;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (NSIndexSet)selectedSegmentIndices
{
  return self->mSelectedSegmentIndices;
}

- (BOOL)allowsMultipleSelection
{
  return self->mAllowsMultipleSelection;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->mAllowsMultipleSelection = a3;
}

- (BOOL)allowsEmptySelection
{
  return self->mAllowsEmptySelection;
}

- (void)setAllowsEmptySelection:(BOOL)a3
{
  self->mAllowsEmptySelection = a3;
}

- (int64_t)lastPressedSegmentIndex
{
  return self->mLastPressedSegmentIndex;
}

- (void)userData
{
  return self->mUserData;
}

- (void)setUserData:(void *)a3
{
  self->mUserData = a3;
}

- (int)segmentedControlStyle
{
  return self->_segmentedControlStyle;
}

@end
