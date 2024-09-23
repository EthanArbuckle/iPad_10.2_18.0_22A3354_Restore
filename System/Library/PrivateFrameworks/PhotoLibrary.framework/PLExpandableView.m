@implementation PLExpandableView

- (PLExpandableView)initWithFrame:(CGRect)a3
{
  PLExpandableView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLExpandableView;
  result = -[PLExpandableView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&result->_expandFlags & 0xFFFFF7F8 | 0x800);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_expansionCompletionHandler = 0;
  self->_collapsingCompletionHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLExpandableView;
  -[PLExpandableView dealloc](&v3, sel_dealloc);
}

- (void)_setAutorotationDisabled:(BOOL)a3
{
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags;

  expandFlags = self->_expandFlags;
  if (a3)
  {
    if ((*(_BYTE *)&expandFlags & 0x80) == 0)
    {
      self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags | 0x80);
      objc_msgSend((id)-[PLExpandableView window](self, "window"), "beginDisablingInterfaceAutorotation");
    }
  }
  else if ((*(_BYTE *)&expandFlags & 0x80) != 0)
  {
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFF7F);
    if (objc_msgSend((id)-[PLExpandableView window](self, "window"), "isInterfaceAutorotationDisabled"))
      objc_msgSend((id)-[PLExpandableView window](self, "window"), "endDisablingInterfaceAutorotation");
  }
}

- (void)_notifyDidCompleteCollapsing
{
  -[PLExpandableView _setAutorotationDisabled:](self, "_setAutorotationDisabled:", 0);
  if ((*((_BYTE *)&self->_expandFlags + 2) & 8) != 0)
    -[PLExpandableViewDelegate expandableViewDidCompleteCollapsing:](self->_delegate, "expandableViewDidCompleteCollapsing:", self);
}

- (void)_notifyWillBeginExpanding
{
  -[PLExpandableView _setAutorotationDisabled:](self, "_setAutorotationDisabled:", 1);
  if ((*((_BYTE *)&self->_expandFlags + 1) & 0x10) != 0)
    -[PLExpandableViewDelegate expandableViewWillBeginExpanding:](self->_delegate, "expandableViewWillBeginExpanding:", self);
}

- (void)_notifyWillCancelCollapsingWithDuration:(double)a3
{
  if ((*((_BYTE *)&self->_expandFlags + 2) & 0x10) != 0)
    -[PLExpandableViewDelegate expandableView:willCancelCollapsingWithDuration:](self->_delegate, "expandableView:willCancelCollapsingWithDuration:", self, a3);
}

- (void)_notifyWillCompleteCollapsingWithDuration:(double)a3
{
  if ((*((_BYTE *)&self->_expandFlags + 2) & 4) != 0)
    -[PLExpandableViewDelegate expandableView:willCompleteCollapsingWithDuration:](self->_delegate, "expandableView:willCompleteCollapsingWithDuration:", self, a3);
}

- (void)_notifyWillCompleteExpandingWithDuration:(double)a3
{
  if ((*((_BYTE *)&self->_expandFlags + 1) & 0x20) != 0)
    -[PLExpandableViewDelegate expandableView:willCompleteExpandingWithDuration:](self->_delegate, "expandableView:willCompleteExpandingWithDuration:", self, a3);
}

- (void)_notifyWillCancelExpandingWithDuration:(double)a3
{
  if ((*((_BYTE *)&self->_expandFlags + 1) & 0x80) != 0)
    -[PLExpandableViewDelegate expandableView:willCancelExpandingWithDuration:](self->_delegate, "expandableView:willCancelExpandingWithDuration:", self, a3);
}

- (void)_notifyDidCompleteExpanding
{
  -[PLExpandableView _setAutorotationDisabled:](self, "_setAutorotationDisabled:", 0);
  if ((*((_BYTE *)&self->_expandFlags + 1) & 0x40) != 0)
    -[PLExpandableViewDelegate expandableViewDidCompleteExpanding:](self->_delegate, "expandableViewDidCompleteExpanding:", self);
}

- (void)_notifyWillBeginCollapsing
{
  -[PLExpandableView _setAutorotationDisabled:](self, "_setAutorotationDisabled:", 1);
  if ((*((_BYTE *)&self->_expandFlags + 2) & 2) != 0)
    -[PLExpandableViewDelegate expandableViewDidBeginCollapsing:](self->_delegate, "expandableViewDidBeginCollapsing:", self);
}

- (void)_notifyDidCancelExpanding
{
  -[PLExpandableView _setAutorotationDisabled:](self, "_setAutorotationDisabled:", 0);
  if ((*((_BYTE *)&self->_expandFlags + 2) & 1) != 0)
    -[PLExpandableViewDelegate expandableViewDidCancelExpanding:](self->_delegate, "expandableViewDidCancelExpanding:", self);
}

- (void)_notifyDidCancelCollapsing
{
  -[PLExpandableView _setAutorotationDisabled:](self, "_setAutorotationDisabled:", 0);
  if ((*((_BYTE *)&self->_expandFlags + 2) & 0x20) != 0)
    -[PLExpandableViewDelegate expandableViewDidCancelCollapsing:](self->_delegate, "expandableViewDidCancelCollapsing:", self);
}

- (void)_transitionFromContracted:(int)a3 withDuration:(double)a4
{
  if (a3 == 1)
    -[PLExpandableView _notifyWillBeginExpanding](self, "_notifyWillBeginExpanding", a4);
}

- (void)_transitionFromExpanding:(int)a3 withDuration:(double)a4
{
  if (a3 == 3)
  {
    -[PLExpandableView _notifyWillCancelExpandingWithDuration:](self, "_notifyWillCancelExpandingWithDuration:", a4);
  }
  else if (a3 == 2)
  {
    -[PLExpandableView _notifyWillCompleteExpandingWithDuration:](self, "_notifyWillCompleteExpandingWithDuration:", a4);
  }
}

- (void)_transitionFromCompleteExpand:(int)a3 withDuration:(double)a4
{
  if (a3 == 5)
  {
    -[PLExpandableView _notifyDidCompleteExpanding](self, "_notifyDidCompleteExpanding", a4);
    -[PLExpandableView _notifyWillBeginCollapsing](self, "_notifyWillBeginCollapsing");
  }
  else if (a3 == 4)
  {
    -[PLExpandableView _notifyDidCompleteExpanding](self, "_notifyDidCompleteExpanding", a4);
  }
}

- (void)_transitionFromCancelExpand:(int)a3 withDuration:(double)a4
{
  if (a3 == 1)
  {
    -[PLExpandableView _notifyDidCancelExpanding](self, "_notifyDidCancelExpanding", a4);
    -[PLExpandableView _notifyWillBeginExpanding](self, "_notifyWillBeginExpanding");
  }
  else if (!a3)
  {
    -[PLExpandableView _notifyDidCancelExpanding](self, "_notifyDidCancelExpanding", a4);
  }
}

- (void)_transitionFromExpanded:(int)a3 withDuration:(double)a4
{
  if (a3 == 5)
    -[PLExpandableView _notifyWillBeginCollapsing](self, "_notifyWillBeginCollapsing", a4);
}

- (void)_transitionFromContracting:(int)a3 withDuration:(double)a4
{
  if (a3 == 7)
  {
    -[PLExpandableView _notifyWillCompleteCollapsingWithDuration:](self, "_notifyWillCompleteCollapsingWithDuration:", a4);
  }
  else if (a3 == 6)
  {
    -[PLExpandableView _notifyWillCancelCollapsingWithDuration:](self, "_notifyWillCancelCollapsingWithDuration:", a4);
  }
}

- (void)_transitionFromCancelContract:(int)a3 withDuration:(double)a4
{
  if (a3 == 5)
  {
    -[PLExpandableView _notifyDidCancelCollapsing](self, "_notifyDidCancelCollapsing", a4);
    -[PLExpandableView _notifyWillBeginCollapsing](self, "_notifyWillBeginCollapsing");
  }
  else if (a3 == 4)
  {
    -[PLExpandableView _notifyDidCancelCollapsing](self, "_notifyDidCancelCollapsing", a4);
  }
}

- (void)_transitionFromCompleteContract:(int)a3 withDuration:(double)a4
{
  if (a3 == 1)
  {
    -[PLExpandableView _notifyDidCompleteCollapsing](self, "_notifyDidCompleteCollapsing", a4);
    -[PLExpandableView _notifyWillBeginExpanding](self, "_notifyWillBeginExpanding");
  }
  else if (!a3)
  {
    -[PLExpandableView _notifyDidCompleteCollapsing](self, "_notifyDidCompleteCollapsing", a4);
  }
}

- (void)setState:(int)a3 withDuration:(double)a4
{
  char v4;
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags;

  if ((*(_DWORD *)&self->_expandFlags & 7) != a3)
  {
    v4 = a3;
    -[PLExpandableView stateWillChangeTo:](self, "stateWillChangeTo:");
    expandFlags = self->_expandFlags;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFFC0 | v4 & 7 | (8 * (*(_BYTE *)&expandFlags & 7)));
    __asm { BR              X10 }
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3 && (*(_BYTE *)&self->_expandFlags & 0x80) != 0)
    -[PLExpandableView _setAutorotationDisabled:](self, "_setAutorotationDisabled:", 0);
}

- (void)didMoveToWindow
{
  uint64_t v3;
  uint64_t v4;
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags;
  CGRect *p_contractedFrame;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect *p_expandedFrame;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;

  v3 = -[PLExpandableView window](self, "window");
  v4 = v3;
  expandFlags = self->_expandFlags;
  if ((*(_WORD *)&expandFlags & 0x200) != 0 && v3)
  {
    p_contractedFrame = &self->_contractedFrame;
    if (!CGRectIsEmpty(self->_contractedFrame))
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v4, p_contractedFrame->origin.x, self->_contractedFrame.origin.y, self->_contractedFrame.size.width, self->_contractedFrame.size.height);
      p_contractedFrame->origin.x = v7;
      self->_contractedFrame.origin.y = v8;
      self->_contractedFrame.size.width = v9;
      self->_contractedFrame.size.height = v10;
    }
    expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFFDFF);
    self->_expandFlags = expandFlags;
  }
  if ((*(_WORD *)&expandFlags & 0x400) != 0 && v4)
  {
    p_expandedFrame = &self->_expandedFrame;
    if (!CGRectIsEmpty(self->_expandedFrame))
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v4, p_expandedFrame->origin.x, self->_expandedFrame.origin.y, self->_expandedFrame.size.width, self->_expandedFrame.size.height);
      p_expandedFrame->origin.x = v12;
      self->_expandedFrame.origin.y = v13;
      self->_expandedFrame.size.width = v14;
      self->_expandedFrame.size.height = v15;
    }
    *(_DWORD *)&self->_expandFlags &= ~0x400u;
  }
}

- (void)notifyExpansionFraction:(float)a3 force:(BOOL)a4
{
  double v4;

  v4 = a3;
  if (self->_expansionFraction != a3 || a4)
  {
    if ((*((_BYTE *)&self->_expandFlags + 2) & 0x40) != 0)
      -[PLExpandableViewDelegate expandableView:expansionFractionChanged:](self->_delegate, "expandableView:expansionFractionChanged:", self);
    -[PLExpandableView setExpansionFraction:](self, "setExpansionFraction:", a4, v4);
  }
}

- (void)startedPinch:(id)a3
{
  CGPoint *p_leftTouchLocation;
  CGPoint v6;
  CGPoint *p_rightTouchLocation;
  CGPoint v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  double expansionFraction;

  if ((unint64_t)objc_msgSend(a3, "numberOfTouches") >= 2 && -[PLExpandableView _canPinch](self, "_canPinch"))
  {
    -[PLExpandableView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
    *(_DWORD *)&self->_expandFlags |= 0x40u;
    self->_leftTouchIndex = 0;
    self->_rightTouchIndex = 1;
    p_leftTouchLocation = &self->_leftTouchLocation;
    v6 = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_leftTouchLocation = (CGPoint)*MEMORY[0x1E0C9D538];
    p_rightTouchLocation = &self->_rightTouchLocation;
    self->_rightTouchLocation = v6;
    -[PLExpandableView updatePinchState:](self, "updatePinchState:", a3);
    if (self->_leftTouchLocation.x >= self->_rightTouchLocation.x)
    {
      v8 = *p_leftTouchLocation;
      self->_leftTouchIndex = 1;
      self->_rightTouchIndex = 0;
      *p_leftTouchLocation = *p_rightTouchLocation;
      *p_rightTouchLocation = v8;
    }
    v9 = (*(_DWORD *)&self->_expandFlags & 7) - 1;
    if (v9 > 5)
    {
      v10 = 0;
      v11 = 1;
    }
    else
    {
      v10 = dword_1B98D5D9C[v9];
      v11 = dword_1B98D5DB4[v9];
    }
    -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", v10, 0.0);
    -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", v11, 0.0);
    -[PLExpandableView beginTrackingPinch:](self, "beginTrackingPinch:", a3);
    expansionFraction = self->_expansionFraction;
    *(float *)&expansionFraction = expansionFraction;
    -[PLExpandableView notifyExpansionFraction:force:](self, "notifyExpansionFraction:force:", 1, expansionFraction);
  }
  else
  {
    *(_DWORD *)&self->_expandFlags &= ~0x40u;
  }
}

- (void)continuedPinch:(id)a3
{
  if ((*(_BYTE *)&self->_expandFlags & 0x40) != 0)
  {
    -[PLExpandableView updatePinchState:](self, "updatePinchState:");
    if ((*(_DWORD *)&self->_expandFlags & 3 | 4) == 5)
    {
      -[PLExpandableView continueTrackingPinch:](self, "continueTrackingPinch:", a3);
      -[PLExpandableView notifyExpansionFraction:force:](self, "notifyExpansionFraction:force:", 0);
    }
  }
}

- (void)finishedPinch:(id)a3
{
  int v5;
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags;
  int v7;
  uint64_t v8;
  double expansionFraction;
  uint64_t v10;
  double v11;
  float v12;
  CGPoint v13;

  if ((*(_DWORD *)&self->_expandFlags & 0x40) != 0)
  {
    v5 = -[PLExpandableView snapState:](self, "snapState:", (*(_DWORD *)&self->_expandFlags & 7) == 1);
    expandFlags = self->_expandFlags;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFFBF);
    v7 = *(_BYTE *)&expandFlags & 7;
    if (v7 == 5)
    {
      if (v5)
      {
        if (v5 == 4)
        {
          v8 = 6;
          goto LABEL_10;
        }
LABEL_15:
        v13 = (CGPoint)*MEMORY[0x1E0C9D538];
        self->_leftTouchLocation = (CGPoint)*MEMORY[0x1E0C9D538];
        self->_previousLeftLocation = v13;
        self->_rightTouchLocation = v13;
        self->_previousRightLocation = v13;
        return;
      }
      v8 = 7;
    }
    else
    {
      if (v7 != 1)
        goto LABEL_15;
      if (v5)
      {
        if (v5 == 4)
        {
          v8 = 2;
LABEL_10:
          expansionFraction = 1.0 - self->_expansionFraction;
          v10 = 4;
LABEL_14:
          v11 = expansionFraction * 0.3;
          -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", v8, expansionFraction * 0.3);
          -[PLExpandableView completeTrackingPinch:toState:duration:](self, "completeTrackingPinch:toState:duration:", a3, v10, v11);
          -[PLExpandableView setExpansionFraction:](self, "setExpansionFraction:", v12);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      v8 = 3;
    }
    v10 = 0;
    expansionFraction = self->_expansionFraction;
    goto LABEL_14;
  }
}

- (void)canceledPinch:(id)a3
{
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags;
  int v6;
  uint64_t v7;
  double expansionFraction;
  uint64_t v9;
  double v10;
  float v11;
  CGPoint v12;

  expandFlags = self->_expandFlags;
  if ((*(_BYTE *)&expandFlags & 0x40) != 0)
  {
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFFBF);
    v6 = -[PLExpandableView state](self, "state");
    if (v6 == 5)
    {
      expansionFraction = 1.0 - self->_expansionFraction;
      v7 = 4;
      v9 = 6;
    }
    else
    {
      if (v6 != 1)
        return;
      v7 = 0;
      expansionFraction = self->_expansionFraction;
      v9 = 3;
    }
    v10 = expansionFraction * 0.3;
    -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", v9, expansionFraction * 0.3);
    -[PLExpandableView completeTrackingPinch:toState:duration:](self, "completeTrackingPinch:toState:duration:", a3, v7, v10);
    -[PLExpandableView setExpansionFraction:](self, "setExpansionFraction:", v11);
    v12 = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_leftTouchLocation = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_previousLeftLocation = v12;
    self->_rightTouchLocation = v12;
    self->_previousRightLocation = v12;
  }
}

- (void)finishTransition
{
  unsigned int v3;

  v3 = -[PLExpandableView state](self, "state") - 2;
  if (v3 <= 5 && ((0x33u >> v3) & 1) != 0)
    -[PLExpandableView finishTransitionToState:](self, "finishTransitionToState:", dword_1B98D5DCC[v3]);
}

- (void)finishTransitionToState:(int)a3
{
  uint64_t v4;
  id *v5;

  if (a3)
  {
    if (a3 != 4)
      return;
    if ((*(_DWORD *)&self->_expandFlags & 3 | 4) == 6)
      -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", 4, 0.0);
    v4 = 432;
  }
  else
  {
    if ((~*(_DWORD *)&self->_expandFlags & 3) == 0)
      -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", 0, 0.0);
    v4 = 424;
  }
  v5 = (id *)((char *)&self->super.super.super.isa + v4);
  if (*v5)
  {
    (*((void (**)(void))*v5 + 2))();

    *v5 = 0;
  }
}

- (int)snapState:(BOOL)a3
{
  double expansionFraction;
  float pinchVelocity;
  double v5;
  float v6;
  double v7;
  float v8;
  BOOL v9;
  int v10;
  int v11;

  expansionFraction = self->_expansionFraction;
  if (a3)
  {
    pinchVelocity = self->_pinchVelocity;
  }
  else
  {
    v5 = 1.0 - expansionFraction;
    v9 = expansionFraction < 1.0;
    expansionFraction = 0.0;
    if (v9)
      expansionFraction = v5;
    v6 = self->_pinchVelocity;
    pinchVelocity = -v6;
  }
  if (pinchVelocity <= 1.0
    && ((v7 = pinchVelocity, v8 = expansionFraction, v8 > 0.25) ? (v9 = v7 < -0.2) : (v9 = 1), v9 && v8 <= 0.7))
  {
    v10 = 0;
    v11 = 4;
  }
  else
  {
    v11 = 0;
    v10 = 4;
  }
  if (a3)
    return v10;
  else
    return v11;
}

- (void)updatePinchState:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;

  if (objc_msgSend(a3, "numberOfTouches") == 2)
  {
    self->_previousLeftLocation = self->_leftTouchLocation;
    self->_previousRightLocation = self->_rightTouchLocation;
    objc_msgSend(a3, "locationOfTouch:inView:", self->_leftTouchIndex, self);
    self->_leftTouchLocation.x = v5;
    self->_leftTouchLocation.y = v6;
    objc_msgSend(a3, "locationOfTouch:inView:", self->_rightTouchIndex, self);
    self->_rightTouchLocation.x = v7;
    self->_rightTouchLocation.y = v8;
    objc_msgSend(a3, "velocity");
    self->_pinchVelocity = v9;
    objc_msgSend(a3, "scale");
    self->_trackingTimeInterval = v10 / self->_pinchVelocity;
  }
}

- (CGRect)pinchRect:(CGRect)a3 inView:(id)a4 insetTouches:(BOOL)a5
{
  double v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat MaxY;
  double v24;
  double v25;
  CGFloat MidY;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v7 = a3.size.width * 0.21;
  v8 = 0.0;
  if (!a5)
    v7 = 0.0;
  v9 = a3.size.height * 0.21;
  if (!a5)
    v9 = 0.0;
  v36 = v7;
  v38 = v9;
  v44 = CGRectInset(a3, v7, v9);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  -[PLExpandableView convertPoint:toView:](self, "convertPoint:toView:", a4, self->_leftTouchLocation.x, self->_leftTouchLocation.y);
  v15 = v14;
  v17 = v16;
  -[PLExpandableView convertPoint:toView:](self, "convertPoint:toView:", a4, self->_rightTouchLocation.x, self->_rightTouchLocation.y);
  v19 = v18;
  v40 = v20;
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  if (v15 < CGRectGetMinX(v45)
    || (v46.origin.x = x, v46.origin.y = y, v46.size.width = width, v46.size.height = height, v15 > CGRectGetMaxX(v46)))
  {
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    v8 = v15 - CGRectGetMidX(v47);
  }
  v34 = v15;
  v37 = v8;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  if (v17 < CGRectGetMinY(v48)
    || (v49.origin.x = x,
        v49.origin.y = y,
        v49.size.width = width,
        v49.size.height = height,
        v21 = 0.0,
        v17 > CGRectGetMaxY(v49)))
  {
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v21 = v17 - CGRectGetMidY(v50);
  }
  v35 = v17;
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  if (v19 < CGRectGetMinX(v51)
    || (v52.origin.x = x,
        v52.origin.y = y,
        v52.size.width = width,
        v52.size.height = height,
        v22 = 0.0,
        v19 > CGRectGetMaxX(v52)))
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    v22 = v19 - CGRectGetMidX(v53);
  }
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  if (v40 < CGRectGetMinY(v54)
    || (v55.origin.x = x,
        v55.origin.y = y,
        v55.size.width = width,
        v55.size.height = height,
        MaxY = CGRectGetMaxY(v55),
        v24 = v40,
        v25 = 0.0,
        v40 > MaxY))
  {
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    MidY = CGRectGetMidY(v56);
    v24 = v40;
    v25 = v40 - MidY;
  }
  memset(&v43, 0, sizeof(v43));
  if (a4)
  {
    objc_msgSend(a4, "transform");
    v24 = v40;
  }
  v27 = (vabdd_f64(v34, v19) + v36 * 2.0) / a3.size.width;
  if (v27 < 1.0)
    v27 = 1.0;
  v28 = (vabdd_f64(v35, v24) + v38 * 2.0) / a3.size.height;
  if (v28 < 1.0)
    v28 = 1.0;
  if (v27 >= v28)
    v29 = v27;
  else
    v29 = v28;
  v41 = v43;
  CGAffineTransformTranslate(&v42, &v41, (v37 + v22) * 0.5, (v21 + v25) * 0.5);
  v43 = v42;
  UIRectGetCenter();
  v31 = v30;
  v33 = v32;
  v41 = v43;
  CGAffineTransformTranslate(&v42, &v41, v30, v32);
  v43 = v42;
  v41 = v42;
  CGAffineTransformScale(&v42, &v41, v29, v29);
  v43 = v42;
  v41 = v42;
  CGAffineTransformTranslate(&v42, &v41, -v31, -v33);
  v43 = v42;
  return CGRectApplyAffineTransform(a3, &v42);
}

- (float)continueTrackingPinch:(id)a3
{
  return 0.0;
}

- (float)completeTrackingPinch:(id)a3 toState:(int)a4 duration:(double)a5
{
  return 0.0;
}

- (void)collapseWithAnimation:(BOOL)a3 completion:(id)a4
{
  double v7;
  PLExpandableView *v8;
  float v9;

  if (a3)
    v7 = 0.3;
  else
    v7 = 0.0;
  if (!a3)
  {
    v8 = self;
    *(_DWORD *)&self->_expandFlags |= 0x100u;
  }

  self->_collapsingCompletionHandler = (id)objc_msgSend(a4, "copy");
  -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", 5, 0.0);
  -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", 7, v7);
  -[PLExpandableView completeTrackingPinch:toState:duration:](self, "completeTrackingPinch:toState:duration:", 0, 0, v7);
  -[PLExpandableView setExpansionFraction:](self, "setExpansionFraction:", v9);
  if (!a3)
    *(_DWORD *)&self->_expandFlags &= ~0x100u;
}

- (void)expandWithAnimation:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v5;
  double v7;
  float v8;

  v5 = a3;
  if (-[PLExpandableView allowsExpansion](self, "allowsExpansion"))
  {
    if (v5)
      v7 = 0.3;
    else
      v7 = 0.0;
    if (!v5)
      *(_DWORD *)&self->_expandFlags |= 0x100u;

    self->_expansionCompletionHandler = (id)objc_msgSend(a4, "copy");
    -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", 1, 0.0);
    -[PLExpandableView setState:withDuration:](self, "setState:withDuration:", 2, v7);
    -[PLExpandableView completeTrackingPinch:toState:duration:](self, "completeTrackingPinch:toState:duration:", 0, 4, v7);
    -[PLExpandableView setExpansionFraction:](self, "setExpansionFraction:", v8);
    if (!v5)
      *(_DWORD *)&self->_expandFlags &= ~0x100u;
  }
}

- (void)setDelegate:(id)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;

  if (self->_delegate != a3)
  {
    self->_delegate = (PLExpandableViewDelegate *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 4096;
    else
      v4 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFEFFF | v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 0x2000;
    else
      v5 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFDFFF | v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 0x4000;
    else
      v6 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFBFFF | v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 0x8000;
    else
      v7 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFF7FFF | v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 0x10000;
    else
      v8 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFEFFFF | v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 0x20000;
    else
      v9 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFDFFFF | v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 0x40000;
    else
      v10 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFBFFFF | v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 0x80000;
    else
      v11 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFF7FFFF | v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 0x100000;
    else
      v12 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFEFFFFF | v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 0x200000;
    else
      v13 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFDFFFFF | v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 0x400000;
    else
      v14 = 0;
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFBFFFFF | v14);
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setContractedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  $D001CA967CA97F9C3908BE3E81D85F1E v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PLExpandableView window](self, "window");
  if (v8)
  {
    objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v8, x, y, width, height);
    self->_contractedFrame.origin.x = v9;
    self->_contractedFrame.origin.y = v10;
    self->_contractedFrame.size.width = v11;
    self->_contractedFrame.size.height = v12;
    v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFFDFF);
  }
  else
  {
    self->_contractedFrame.origin.x = x;
    self->_contractedFrame.origin.y = y;
    self->_contractedFrame.size.width = width;
    self->_contractedFrame.size.height = height;
    v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags | 0x200);
  }
  self->_expandFlags = v13;
}

- (CGRect)contractedFrame
{
  CGRect *p_contractedFrame;
  double x;
  double y;
  double width;
  double height;
  uint64_t v8;
  CGRect result;

  p_contractedFrame = &self->_contractedFrame;
  if (CGRectIsEmpty(self->_contractedFrame))
  {
    -[PLExpandableView frame](self, "frame");
  }
  else
  {
    v8 = -[PLExpandableView window](self, "window");
    if (v8)
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:fromView:", v8, p_contractedFrame->origin.x, p_contractedFrame->origin.y, p_contractedFrame->size.width, p_contractedFrame->size.height);
    }
    else
    {
      x = p_contractedFrame->origin.x;
      y = p_contractedFrame->origin.y;
      width = p_contractedFrame->size.width;
      height = p_contractedFrame->size.height;
    }
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExpandedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  $D001CA967CA97F9C3908BE3E81D85F1E v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PLExpandableView window](self, "window");
  if (v8)
  {
    objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v8, x, y, width, height);
    self->_expandedFrame.origin.x = v9;
    self->_expandedFrame.origin.y = v10;
    self->_expandedFrame.size.width = v11;
    self->_expandedFrame.size.height = v12;
    v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFFBFF);
  }
  else
  {
    self->_expandedFrame.origin.x = x;
    self->_expandedFrame.origin.y = y;
    self->_expandedFrame.size.width = width;
    self->_expandedFrame.size.height = height;
    v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags | 0x400);
  }
  self->_expandFlags = v13;
}

- (CGRect)expandedFrame
{
  CGRect *p_expandedFrame;
  double x;
  double y;
  double width;
  double height;
  uint64_t v8;
  CGRect result;

  p_expandedFrame = &self->_expandedFrame;
  if (!CGRectIsEmpty(self->_expandedFrame))
  {
    v8 = -[PLExpandableView window](self, "window");
    if (v8)
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:fromView:", v8, p_expandedFrame->origin.x, p_expandedFrame->origin.y, p_expandedFrame->size.width, p_expandedFrame->size.height);
      goto LABEL_7;
    }
    if (-[PLExpandableView state](self, "state") != 4)
    {
      x = p_expandedFrame->origin.x;
      y = p_expandedFrame->origin.y;
      width = p_expandedFrame->size.width;
      height = p_expandedFrame->size.height;
      goto LABEL_7;
    }
  }
  -[PLExpandableView frame](self, "frame");
LABEL_7:
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAllowsExpansion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFF7FF | v3);
}

- (BOOL)allowsExpansion
{
  return (*((unsigned __int8 *)&self->_expandFlags + 1) >> 3) & 1;
}

- (int)state
{
  return *(_DWORD *)&self->_expandFlags & 7;
}

- (int)previousState
{
  return (*(_DWORD *)&self->_expandFlags >> 3) & 7;
}

- (void)setExpansionFraction:(double)a3
{
  self->_expansionFraction = a3;
}

- (double)expansionFraction
{
  return self->_expansionFraction;
}

- (BOOL)isTracking
{
  return (*(_BYTE *)&self->_expandFlags >> 6) & 1;
}

- (BOOL)_canPinch
{
  return (*(_BYTE *)&self->_expandFlags & 7) != 0 || -[PLExpandableView allowsExpansion](self, "allowsExpansion");
}

- (BOOL)canCollapse
{
  return ((*(_DWORD *)&self->_expandFlags & 7) != 7) & (0x54u >> (*(_DWORD *)&self->_expandFlags & 7));
}

@end
