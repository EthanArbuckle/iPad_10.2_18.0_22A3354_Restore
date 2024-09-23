@implementation THWButtonControlRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWButtonControlRep;
  -[THWButtonControlRep dealloc](&v3, "dealloc");
}

- (THWButtonControlDelegate)delegate
{
  if (*(THWButtonControlDelegate **)((char *)&self->_delegate + 1))
    return *(THWButtonControlDelegate **)((char *)&self->_delegate + 1);
  else
    return (THWButtonControlDelegate *)TSUProtocolCast(&OBJC_PROTOCOL___THWButtonControlDelegate, -[THWButtonControlRep parentRep](self, "parentRep"));
}

- (void)screenScaleDidChange
{
  THWButtonControlDelegate *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWButtonControlRep;
  -[THWButtonControlRep screenScaleDidChange](&v4, "screenScaleDidChange");
  v3 = -[THWButtonControlRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "buttonControlUseContentsScaleForImageCache:") & 1) != 0)
  {
    if (-[THWButtonControlDelegate buttonControlUseContentsScaleForImageCache:](v3, "buttonControlUseContentsScaleForImageCache:", self))objc_msgSend(*(id *)((char *)&self->_cachedImages + 1), "removeAllObjects");
  }
}

- (int)state
{
  THWButtonControlDelegate *v3;

  v3 = -[THWButtonControlRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "buttonControlState:") & 1) != 0)
    return -[THWButtonControlDelegate buttonControlState:](v3, "buttonControlState:", self);
  else
    return 0;
}

- (id)p_imageForState:(int)a3 highlighted:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  TSUIntegerKeyDictionary *v7;
  id v8;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = *(TSUIntegerKeyDictionary **)((char *)&self->_cachedImages + 1);
  if (!v7)
  {
    v7 = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
    *(TSUIntegerKeyDictionary **)((char *)&self->_cachedImages + 1) = v7;
  }
  v8 = -[TSUIntegerKeyDictionary objectForKey:](v7, "objectForKey:", v4 | (2 * (_DWORD)v5));
  if (!v8)
  {
    v8 = -[THWButtonControlDelegate buttonControl:imageForState:highlighted:](-[THWButtonControlRep delegate](self, "delegate"), "buttonControl:imageForState:highlighted:", self, v5, v4);
    if (!v8 && v4)
      v8 = -[THWButtonControlRep p_imageForState:highlighted:](self, "p_imageForState:highlighted:", v5, 0);
    if ((_DWORD)v5 == 1 && !v8)
    {
      v8 = -[THWButtonControlRep p_imageForState:highlighted:](self, "p_imageForState:highlighted:", 0, v4);
      if (v8)
      {
LABEL_12:
        objc_msgSend(*(id *)((char *)&self->_cachedImages + 1), "setObject:forKey:", v8, v4 | (2 * (_DWORD)v5));
        return v8;
      }
      v8 = -[THWButtonControlRep p_imageForState:highlighted:](self, "p_imageForState:highlighted:", 0, 0);
    }
    if (v8)
      goto LABEL_12;
  }
  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  THWButtonControlDelegate *v4;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[THWControlRep invalidateLayers](self, "invalidateLayers");
    v4 = -[THWButtonControlRep delegate](self, "delegate");
    if ((objc_opt_respondsToSelector(v4, "buttonControlHighlightedDidChange:") & 1) != 0)
      -[THWButtonControlDelegate buttonControlHighlightedDidChange:](v4, "buttonControlHighlightedDidChange:", self);
  }
}

- (BOOL)p_interactionEnabled
{
  id v3;

  v3 = -[THWControlRep controlHostRep](self, "controlHostRep");
  if ((objc_opt_respondsToSelector(v3, "control:isInteractionEnabledForRep:") & 1) != 0)
    return objc_msgSend(v3, "control:isInteractionEnabledForRep:", -[THWButtonControlRep layout](self, "layout"), self);
  else
    return 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "gestureKind");
  if (v4 == (id)TSWPImmediatePress && -[THWButtonControlRep state](self, "state") != 2)
    return -[THWButtonControlRep p_interactionEnabled](self, "p_interactionEnabled");
  else
    return 0;
}

- (BOOL)handleGesture:(id)a3
{
  THWButtonControlRep *v5;
  id v6;
  uint64_t v7;
  double v8;
  id v9;

  switch(objc_msgSend(a3, "gestureState"))
  {
    case 1u:
      -[THWButtonControlRep p_interactionWillStart](self, "p_interactionWillStart");
      v5 = self;
      v6 = &dword_0 + 1;
      goto LABEL_10;
    case 2u:
      if (objc_msgSend(objc_msgSend(-[THWButtonControlRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "isAncestorScrollViewDragging"))
      {
        v7 = objc_opt_class(UIGestureRecognizer);
        *(_QWORD *)&v8 = TSUDynamicCast(v7, a3).n128_u64[0];
        objc_msgSend(v9, "cancel", v8);
        v5 = self;
        v6 = 0;
      }
      else
      {
        objc_msgSend(a3, "naturalLocationForRep:", self);
        v6 = -[THWButtonControlRep containsPoint:](self, "containsPoint:");
        v5 = self;
      }
LABEL_10:
      -[THWButtonControlRep setHighlighted:](v5, "setHighlighted:", v6);
      return 1;
    case 3u:
      if (-[THWButtonControlRep highlighted](self, "highlighted"))
      {
        -[THWButtonControlRep setHighlighted:](self, "setHighlighted:", 0);
        -[THWButtonControlDelegate buttonControlWasPressed:](-[THWButtonControlRep delegate](self, "delegate"), "buttonControlWasPressed:", self);
      }
      goto LABEL_6;
    case 4u:
    case 5u:
      -[THWButtonControlRep setHighlighted:](self, "setHighlighted:", 0);
LABEL_6:
      -[THWButtonControlRep p_interactionDidEnd](self, "p_interactionDidEnd");
      break;
    default:
      return 1;
  }
  return 1;
}

- (void)p_interactionWillStart
{
  THWButtonControlDelegate *v3;

  v3 = -[THWButtonControlRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "buttonControlInteractionWillStart:") & 1) != 0)
    -[THWButtonControlDelegate buttonControlInteractionWillStart:](v3, "buttonControlInteractionWillStart:", self);
}

- (void)p_interactionDidEnd
{
  THWButtonControlDelegate *v3;

  v3 = -[THWButtonControlRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "buttonControlInteractionDidEnd:") & 1) != 0)
    -[THWButtonControlDelegate buttonControlInteractionDidEnd:](v3, "buttonControlInteractionDidEnd:", self);
}

- (CALayer)highlightLayer
{
  CALayer *result;
  double y;

  result = *(CALayer **)((char *)&self->_highlightLayer + 1);
  if (!result)
  {
    *(CALayer **)((char *)&self->_highlightLayer + 1) = (CALayer *)objc_alloc_init((Class)CALayer);
    objc_msgSend(*(id *)((char *)&self->_highlightLayer + 1), "setBackgroundColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.3), "CGColor"));
    y = CGPointZero.y;
    objc_msgSend(*(id *)((char *)&self->_highlightLayer + 1), "setAnchorPoint:", CGPointZero.x, y);
    objc_msgSend(*(id *)((char *)&self->_highlightLayer + 1), "setPosition:", CGPointZero.x, y);
    return *(CALayer **)((char *)&self->_highlightLayer + 1);
  }
  return result;
}

- (void)didUpdateLayer:(id)a3
{
  id v5;
  THWButtonControlDelegate *v6;
  unsigned int v7;
  double v8;
  double v9;
  id v10;
  CALayer *v11;
  double y;

  v5 = -[THWButtonControlRep p_imageForState:highlighted:](self, "p_imageForState:highlighted:", -[THWButtonControlRep state](self, "state"), self->_highlighted);
  v6 = -[THWButtonControlRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v6, "buttonControlAdjustImageWhenHighlighted:") & 1) != 0)
  {
    if (self->_highlighted)
    {
      v7 = -[THWButtonControlDelegate buttonControlAdjustImageWhenHighlighted:](v6, "buttonControlAdjustImageWhenHighlighted:", self);
      goto LABEL_7;
    }
  }
  else if (self->_highlighted)
  {
    v7 = v5 == -[THWButtonControlRep p_imageForState:highlighted:](self, "p_imageForState:highlighted:", -[THWButtonControlRep state](self, "state"), 0);
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  objc_msgSend(-[THWButtonControlRep canvas](self, "canvas"), "contentsScale");
  v9 = v8;
  v10 = objc_msgSend(v5, "CGImageForContentsScale:");
  if (objc_msgSend(a3, "contents") != v10)
  {
    objc_msgSend(a3, "setContents:", v10);
    objc_msgSend(a3, "setContentsScale:", v9);
  }
  if (v7)
  {
    v11 = -[THWButtonControlRep highlightLayer](self, "highlightLayer");
    y = CGPointZero.y;
    objc_msgSend(a3, "bounds");
    -[CALayer setBounds:](v11, "setBounds:", CGPointZero.x, y);
    if (!-[CALayer superlayer](v11, "superlayer"))
      objc_msgSend(a3, "insertSublayer:atIndex:", v11, 0);
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->_highlightLayer + 1), "removeFromSuperlayer");

    *(CALayer **)((char *)&self->_highlightLayer + 1) = 0;
  }
  if ((objc_opt_respondsToSelector(v6, "buttonControl:didUpdateLayer:") & 1) != 0)
    -[THWButtonControlDelegate buttonControl:didUpdateLayer:](v6, "buttonControl:didUpdateLayer:", self, a3);
}

- (id)additionalLayersOverLayer
{
  THWButtonControlDelegate *v3;

  v3 = -[THWButtonControlRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "buttonControlAdditionalLayersOverLayer:") & 1) != 0)
    return -[THWButtonControlDelegate buttonControlAdditionalLayersOverLayer:](v3, "buttonControlAdditionalLayersOverLayer:", self);
  else
    return 0;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  THWButtonControlDelegate *v5;

  v5 = -[THWButtonControlRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "buttonControl:addAdditionalChildLayersToArray:") & 1) != 0)
    -[THWButtonControlDelegate buttonControl:addAdditionalChildLayersToArray:](v5, "buttonControl:addAdditionalChildLayersToArray:", self, a3);
}

- (TSUIntegerKeyDictionary)cachedImages
{
  return *(TSUIntegerKeyDictionary **)((char *)&self->_cachedImages + 1);
}

- (void)setDelegate:(id)a3
{
  *(THWButtonControlDelegate **)((char *)&self->_delegate + 1) = (THWButtonControlDelegate *)a3;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end
