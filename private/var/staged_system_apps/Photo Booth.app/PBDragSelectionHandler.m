@implementation PBDragSelectionHandler

- (PBDragSelectionHandler)initWithController:(id)a3 view:(id)a4
{
  PBDragSelectionHandler *v6;
  PBDragSelectionHandler *v7;
  UILongPressGestureRecognizer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBDragSelectionHandler;
  v6 = -[PBDragSelectionHandler init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_controller = (PBController *)a3;
    v6->_view = (UIView *)a4;
    v8 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v6, "dragSelect:");
    v7->_gestureRecognizer = v8;
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v8, "setMinimumPressDuration:", 0.2);
    -[UIView addGestureRecognizer:](v7->_view, "addGestureRecognizer:", v7->_gestureRecognizer);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UILongPressGestureRecognizer removeTarget:action:](self->_gestureRecognizer, "removeTarget:action:", self, 0);
  -[UIView removeGestureRecognizer:](self->_view, "removeGestureRecognizer:", self->_gestureRecognizer);
  v3.receiver = self;
  v3.super_class = (Class)PBDragSelectionHandler;
  -[PBDragSelectionHandler dealloc](&v3, "dealloc");
}

- (void)dragSelect:(id)a3
{
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  char v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t firstIndex;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  NSUInteger location;
  NSUInteger length;
  id v21;
  int v22;
  PBController *controller;
  unsigned int v24;
  NSRange v25;

  v5 = objc_msgSend(a3, "view");
  objc_msgSend(a3, "locationInView:", v5);
  v6 = objc_msgSend(v5, "hitTest:withEvent:", 0);
  v7 = (char *)objc_msgSend(a3, "state");
  if ((unint64_t)(v7 - 3) < 2)
  {
    -[UILongPressGestureRecognizer setEnabled:](self->_gestureRecognizer, "setEnabled:", 1);
    -[PBController stopAutoscrolling](self->_controller, "stopAutoscrolling");

    self->_originalSelection = 0;
    *((_BYTE *)self + 64) &= 0xFCu;
  }
  else
  {
    if (v7 != (char *)2)
    {
      if (v7 != (char *)1)
        return;
      *((_BYTE *)self + 64) &= 0xFCu;
    }
    v9 = objc_opt_class(PBShelfTile, v8);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      v10 = -[PBController tiles](self->_controller, "tiles");
      if ((*((_BYTE *)self + 64) & 3) == 0)
      {
        if (objc_msgSend(v6, "isSelected"))
          v11 = 1;
        else
          v11 = 2;
        *((_BYTE *)self + 64) = *((_BYTE *)self + 64) & 0xFC | v11;
        self->_originalSelection = (NSArray *)objc_msgSend(-[PBController selectedTiles](self->_controller, "selectedTiles"), "copy");
        v12 = -[NSArray indexOfObject:](v10, "indexOfObject:", v6);
        self->_marqueeRange.location = 0;
        self->_marqueeRange.length = 0;
        self->_firstIndex = v12;
      }
      v13 = -[NSArray indexOfObject:](v10, "indexOfObject:", v6);
      firstIndex = self->_firstIndex;
      v15 = firstIndex - v13;
      if (firstIndex >= v13)
        v16 = v13;
      else
        v16 = self->_firstIndex;
      v17 = v15 + 1;
      v25.location = v16;
      v25.length = v15 + 1;
      v18 = NSUnionRange(self->_marqueeRange, v25);
      if (v18.location < v18.location + v18.length)
      {
        location = v18.location;
        length = v18.length;
        while (1)
        {
          v21 = -[NSArray objectAtIndex:](v10, "objectAtIndex:", location);
          if (v16 > location || location - v16 >= v17)
            break;
          v22 = *((_BYTE *)self + 64) & 3;
          if (v22 == 1)
          {
            controller = self->_controller;
LABEL_24:
            -[PBController deselectTile:](controller, "deselectTile:", v21);
            goto LABEL_25;
          }
          if (v22 == 2)
          {
            controller = self->_controller;
LABEL_22:
            -[PBController selectTile:](controller, "selectTile:", v21);
          }
LABEL_25:
          ++location;
          if (!--length)
            goto LABEL_26;
        }
        v24 = -[NSArray containsObject:](self->_originalSelection, "containsObject:", v21);
        controller = self->_controller;
        if (!v24)
          goto LABEL_24;
        goto LABEL_22;
      }
LABEL_26:
      self->_marqueeRange.location = v16;
      self->_marqueeRange.length = v17;
    }
    -[PBController autoscrollGesture:](self->_controller, "autoscrollGesture:", a3);
  }
}

- (void)tilesWereRemoved:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  NSArray *v7;
  NSRange v8;

  v5 = -[NSArray count](-[PBController tiles](self->_controller, "tiles"), "count");
  if (v5)
  {
    v6 = v5;
    v7 = (NSArray *)-[NSArray mutableCopy](self->_originalSelection, "mutableCopy");
    -[NSArray removeObjectsInArray:](v7, "removeObjectsInArray:", a3);

    self->_originalSelection = v7;
    if (self->_firstIndex >= v6)
      self->_firstIndex = v6 - 1;
    v8.location = 0;
    v8.length = v6;
    self->_marqueeRange = NSIntersectionRange(self->_marqueeRange, v8);
  }
  else
  {
    -[UILongPressGestureRecognizer setEnabled:](self->_gestureRecognizer, "setEnabled:", 0);
  }
}

@end
