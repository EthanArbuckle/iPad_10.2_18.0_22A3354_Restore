@implementation MTUIFocusedTouchGestureRecognizer

- (MTUIFocusedTouchGestureRecognizer)initWithFocusedView:(id)a3 touchAllowance:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v10;
  MTUIFocusedTouchGestureRecognizer *v11;
  MTUIFocusedTouchGestureRecognizer *v12;
  MTUIFocusedTouchGestureRecognizer *v13;
  objc_super v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3;
  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)MTUIFocusedTouchGestureRecognizer;
    v11 = -[MTUIFocusedTouchGestureRecognizer initWithTarget:action:](&v15, sel_initWithTarget_action_, 0, 0);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_focusedView, a3);
      v12->_touchAllowance.top = top;
      v12->_touchAllowance.left = left;
      v12->_touchAllowance.bottom = bottom;
      v12->_touchAllowance.right = right;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)reset
{
  NSMutableSet *activeTouches;
  objc_super v4;

  activeTouches = self->_activeTouches;
  self->_activeTouches = 0;

  self->_didTouchOutside = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTUIFocusedTouchGestureRecognizer;
  -[MTUIFocusedTouchGestureRecognizer reset](&v4, sel_reset);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double left;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  NSMutableSet *activeTouches;
  NSMutableSet *v30;
  NSMutableSet *v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;
  CGPoint v45;
  CGRect v46;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_didTouchOutside)
    goto LABEL_27;
  v32 = v7;
  obj = v6;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v14, "locationInView:", self->_focusedView);
        v16 = v15;
        v18 = v17;
        -[UIView bounds](self->_focusedView, "bounds");
        left = self->_touchAllowance.left;
        v46.origin.x = v20 + left;
        v46.origin.y = v21 + self->_touchAllowance.top;
        v46.size.width = v22 - (left + self->_touchAllowance.right);
        v46.size.height = v23 - (self->_touchAllowance.top + self->_touchAllowance.bottom);
        v45.x = v16;
        v45.y = v18;
        if (CGRectContainsPoint(v46, v45))
        {
          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v11, "addObject:", v14);
        }
        else
        {
          self->_didTouchOutside = 1;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  if (self->_didTouchOutside)
  {
    -[MTUIFocusedTouchGestureRecognizer setState:](self, "setState:", 1);
    v8 = v32;
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = v11;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    v8 = v32;
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v24);
          -[MTUIFocusedTouchGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v32);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v26);
    }

  }
  v6 = obj;
  if (self->_didTouchOutside)
  {
LABEL_27:
    activeTouches = self->_activeTouches;
    if (activeTouches)
    {
      -[NSMutableSet unionSet:](activeTouches, "unionSet:", v6);
    }
    else
    {
      v30 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v6);
      v31 = self->_activeTouches;
      self->_activeTouches = v30;

    }
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  NSMutableSet *activeTouches;

  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", a3, a4);
  if (!-[NSMutableSet count](self->_activeTouches, "count"))
  {
    if (self->_didTouchOutside)
      v5 = 3;
    else
      v5 = 5;
    -[MTUIFocusedTouchGestureRecognizer setState:](self, "setState:", v5);
    activeTouches = self->_activeTouches;
    self->_activeTouches = 0;

  }
}

- (UIView)focusedView
{
  return self->_focusedView;
}

- (UIEdgeInsets)touchAllowance
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchAllowance.top;
  left = self->_touchAllowance.left;
  bottom = self->_touchAllowance.bottom;
  right = self->_touchAllowance.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchAllowance:(UIEdgeInsets)a3
{
  self->_touchAllowance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedView, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end
