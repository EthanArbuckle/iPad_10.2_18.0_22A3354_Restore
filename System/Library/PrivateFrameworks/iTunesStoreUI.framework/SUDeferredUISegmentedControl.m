@implementation SUDeferredUISegmentedControl

- (void)dealloc
{
  objc_super v3;

  self->_deferredSegments = 0;
  self->_isDeferringInterfaceUpdates = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUDeferredUISegmentedControl;
  -[SUDeferredUISegmentedControl dealloc](&v3, sel_dealloc);
}

- (BOOL)isDeferringInterfaceUpdates
{
  return self->_isDeferringInterfaceUpdates;
}

- (void)setDeferringInterfaceUpdates:(BOOL)a3
{
  if (self->_isDeferringInterfaceUpdates != a3)
  {
    if (!self->_isDeferringInterfaceUpdates)
      -[SUDeferredUISegmentedControl _saveCurrentStateAsDeferred](self, "_saveCurrentStateAsDeferred");
    self->_isDeferringInterfaceUpdates = a3;
    if (!a3)
      -[SUDeferredUISegmentedControl _commitDeferredInterfaceUpdates](self, "_commitDeferredInterfaceUpdates");
  }
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  objc_super v7;
  CGRect result;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    x = self->_deferredFrame.origin.x;
    y = self->_deferredFrame.origin.y;
    width = self->_deferredFrame.size.width;
    height = self->_deferredFrame.size.height;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl frame](&v7, sel_frame);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)imageForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  objc_super v7;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    if (-[NSMutableArray count](self->_deferredSegments, "count") <= a3)
    {
      return 0;
    }
    else
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](self->_deferredSegments, "objectAtIndex:", a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v5;
      else
        return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISegmentedControl;
    return -[SUDeferredUISegmentedControl imageForSegmentAtIndex:](&v7, sel_imageForSegmentAtIndex_, a3);
  }
}

- (void)insertSegmentWithImage:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  objc_super v9;

  v5 = a5;
  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    -[SUDeferredUISegmentedControl _insertSegmentWithValue:atIndex:](self, "_insertSegmentWithValue:atIndex:", a3, a4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl insertSegmentWithImage:atIndex:animated:](&v9, sel_insertSegmentWithImage_atIndex_animated_, a3, a4, v5);
  }
}

- (void)insertSegmentWithTitle:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  objc_super v9;

  v5 = a5;
  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    -[SUDeferredUISegmentedControl _insertSegmentWithValue:atIndex:](self, "_insertSegmentWithValue:atIndex:", a3, a4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl insertSegmentWithTitle:atIndex:animated:](&v9, sel_insertSegmentWithTitle_atIndex_animated_, a3, a4, v5);
  }
}

- (unint64_t)numberOfSegments
{
  objc_super v4;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return -[NSMutableArray count](self->_deferredSegments, "count");
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISegmentedControl;
  return -[SUDeferredUISegmentedControl numberOfSegments](&v4, sel_numberOfSegments);
}

- (void)removeAllSegments
{
  objc_super v3;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    -[NSMutableArray removeAllObjects](self->_deferredSegments, "removeAllObjects");
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl removeAllSegments](&v3, sel_removeAllSegments);
  }
}

- (void)removeSegmentAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    if (-[NSMutableArray count](self->_deferredSegments, "count") > a3)
      -[NSMutableArray removeObjectAtIndex:](self->_deferredSegments, "removeObjectAtIndex:", a3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl removeSegmentAtIndex:animated:](&v7, sel_removeSegmentAtIndex_animated_, a3, v4);
  }
}

- (int64_t)segmentedControlStyle
{
  objc_super v4;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredSegmentedControlStyle;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISegmentedControl;
  return -[SUDeferredUISegmentedControl segmentedControlStyle](&v4, sel_segmentedControlStyle);
}

- (int64_t)selectedSegmentIndex
{
  objc_super v4;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredSelectedSegmentIndex;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISegmentedControl;
  return -[SUDeferredUISegmentedControl selectedSegmentIndex](&v4, sel_selectedSegmentIndex);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredFrame.origin.x = x;
    self->_deferredFrame.origin.y = y;
    self->_deferredFrame.size.width = width;
    self->_deferredFrame.size.height = height;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setImage:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    if (-[NSMutableArray count](self->_deferredSegments, "count") > a4)
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_deferredSegments, "replaceObjectAtIndex:withObject:", a4, a3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl setImage:forSegmentAtIndex:](&v7, sel_setImage_forSegmentAtIndex_, a3, a4);
  }
}

- (void)setSegmentedControlStyle:(int64_t)a3
{
  objc_super v5;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredSegmentedControlStyle = a3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl setSegmentedControlStyle:](&v5, sel_setSegmentedControlStyle_, a3);
  }
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  objc_super v5;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredSelectedSegmentIndex = a3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl setSelectedSegmentIndex:](&v5, sel_setSelectedSegmentIndex_, a3);
  }
}

- (void)setTitle:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    if (-[NSMutableArray count](self->_deferredSegments, "count") > a4)
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_deferredSegments, "replaceObjectAtIndex:withObject:", a4, a3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl setTitle:forSegmentAtIndex:](&v7, sel_setTitle_forSegmentAtIndex_, a3, a4);
  }
}

- (void)sizeToFit
{
  objc_super v3;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredSizeToFit = 1;
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SUDeferredUISegmentedControl;
    -[SUDeferredUISegmentedControl sizeToFit](&v3, sel_sizeToFit);
  }
}

- (void)sizeToFitWithMinimumSegmentWidth:(double)a3 maximumTotalWidth:(double)a4
{
  objc_super v7;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredMaxTotalWidth = a4;
    self->_deferredMinSegmentWidth = a3;
    self->_deferredSizeToFit = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISegmentedControl;
    -[UISegmentedControl sizeToFitWithMinimumSegmentWidth:maximumTotalWidth:](&v7, sel_sizeToFitWithMinimumSegmentWidth_maximumTotalWidth_, a3, a4);
  }
}

- (id)titleForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  objc_super v7;

  if (-[SUDeferredUISegmentedControl isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    if (-[NSMutableArray count](self->_deferredSegments, "count") <= a3)
    {
      return 0;
    }
    else
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](self->_deferredSegments, "objectAtIndex:", a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v5;
      else
        return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISegmentedControl;
    return -[SUDeferredUISegmentedControl titleForSegmentAtIndex:](&v7, sel_titleForSegmentAtIndex_, a3);
  }
}

- (void)_commitDeferredInterfaceUpdates
{
  NSMutableArray *deferredSegments;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  char isKindOfClass;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_deferredSegments)
  {
    -[SUDeferredUISegmentedControl removeAllSegments](self, "removeAllSegments");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    deferredSegments = self->_deferredSegments;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredSegments, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(deferredSegments);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v10 = -[SUDeferredUISegmentedControl numberOfSegments](self, "numberOfSegments");
          if ((isKindOfClass & 1) != 0)
            -[SUDeferredUISegmentedControl insertSegmentWithImage:atIndex:animated:](self, "insertSegmentWithImage:atIndex:animated:", v8, v10, 0);
          else
            -[SUDeferredUISegmentedControl insertSegmentWithTitle:atIndex:animated:](self, "insertSegmentWithTitle:atIndex:animated:", v8, v10, 0);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](deferredSegments, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    self->_deferredSegments = 0;
  }
  -[SUDeferredUISegmentedControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", self->_deferredSelectedSegmentIndex);
  if (self->_deferredSizeToFit)
  {
    self->_deferredSizeToFit = 0;
    -[SUDeferredUISegmentedControl sizeToFitWithMinimumSegmentWidth:maximumTotalWidth:](self, "sizeToFitWithMinimumSegmentWidth:maximumTotalWidth:", self->_deferredMinSegmentWidth, self->_deferredMaxTotalWidth);
  }
  else
  {
    -[SUDeferredUISegmentedControl setFrame:](self, "setFrame:", self->_deferredFrame.origin.x, self->_deferredFrame.origin.y, self->_deferredFrame.size.width, self->_deferredFrame.size.height);
  }
}

- (void)_insertSegmentWithValue:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *deferredSegments;
  unint64_t v8;
  unint64_t v9;

  deferredSegments = self->_deferredSegments;
  if (!deferredSegments)
  {
    deferredSegments = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_deferredSegments = deferredSegments;
  }
  v8 = -[NSMutableArray count](deferredSegments, "count");
  if (v8 >= a4)
    v9 = a4;
  else
    v9 = v8;
  -[NSMutableArray insertObject:atIndex:](deferredSegments, "insertObject:atIndex:", a3, v9);
}

- (void)_saveCurrentStateAsDeferred
{
  CGRect *p_deferredFrame;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;

  p_deferredFrame = &self->_deferredFrame;
  -[SUDeferredUISegmentedControl frame](self, "frame");
  p_deferredFrame->origin.x = v4;
  p_deferredFrame->origin.y = v5;
  p_deferredFrame->size.width = v6;
  p_deferredFrame->size.height = v7;
  self->_deferredMaxTotalWidth = 0.0;
  self->_deferredMinSegmentWidth = 0.0;
  self->_deferredSegmentedControlStyle = -[SUDeferredUISegmentedControl segmentedControlStyle](self, "segmentedControlStyle");
  self->_deferredSelectedSegmentIndex = -[SUDeferredUISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex");
  self->_deferredSizeToFit = 0;
  -[SUDeferredUISegmentedControl _saveSegmentsAsDeferred](self, "_saveSegmentsAsDeferred");
}

- (void)_saveSegmentsAsDeferred
{
  NSMutableArray *deferredSegments;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  deferredSegments = self->_deferredSegments;
  if (!deferredSegments)
  {
    deferredSegments = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_deferredSegments = deferredSegments;
  }
  -[NSMutableArray removeAllObjects](deferredSegments, "removeAllObjects");
  v4 = -[SUDeferredUISegmentedControl numberOfSegments](self, "numberOfSegments");
  if (v4 >= 1)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = -[SUDeferredUISegmentedControl titleForSegmentAtIndex:](self, "titleForSegmentAtIndex:", i);
      if (!v7)
        v7 = -[SUDeferredUISegmentedControl imageForSegmentAtIndex:](self, "imageForSegmentAtIndex:", i);
      -[NSMutableArray addObject:](self->_deferredSegments, "addObject:", v7);
    }
  }
}

@end
