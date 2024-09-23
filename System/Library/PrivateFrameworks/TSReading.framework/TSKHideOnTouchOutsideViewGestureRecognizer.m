@implementation TSKHideOnTouchOutsideViewGestureRecognizer

+ (BOOL)isInFlight
{
  return sGestureInFlight;
}

- (TSKHideOnTouchOutsideViewGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 watchView:(id)a5
{
  TSKHideOnTouchOutsideViewGestureRecognizer *v8;
  TSKHideOnTouchOutsideViewGestureRecognizer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSKHideOnTouchOutsideViewGestureRecognizer;
  v8 = -[TSKHideOnTouchOutsideViewGestureRecognizer initWithTarget:action:](&v11, sel_initWithTarget_action_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->mWatchView = (UIView *)a5;
    v8->mTargets = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[TSKHideOnTouchOutsideViewGestureRecognizer setDelegate:](v9, "setDelegate:", v9);
    -[TSKHideOnTouchOutsideViewGestureRecognizer addTarget:action:](v9, "addTarget:action:", a3, a4);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  sGestureInFlight = 0;

  self->mTargets = 0;
  self->mWatchView = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKHideOnTouchOutsideViewGestureRecognizer;
  -[TSKHideOnTouchOutsideViewGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  TSKHideOnTouchOutsideViewGestureRecognizerTarget *v7;

  v7 = objc_alloc_init(TSKHideOnTouchOutsideViewGestureRecognizerTarget);
  -[TSKHideOnTouchOutsideViewGestureRecognizerTarget setTarget:](v7, "setTarget:", a3);
  -[TSKHideOnTouchOutsideViewGestureRecognizerTarget setAction:](v7, "setAction:", a4);
  -[NSMutableSet addObject:](self->mTargets, "addObject:", v7);

}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  void *v7;
  NSMutableSet *mTargets;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  mTargets = self->mTargets;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mTargets, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(mTargets);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((!a3 || (id)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "target") == a3)
          && (!a4 || (SEL)objc_msgSend(v13, "action") == a4))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mTargets, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v7);
        -[NSMutableSet removeObject:](self->mTargets, "removeObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  CGFloat v20;
  CGFloat v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t j;
  NSMutableSet *mTargets;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  __int128 v35;
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
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  CGPoint v51;
  CGRect v52;

  v50 = *MEMORY[0x24BDAC8D0];
  sGestureInFlight = 1;
  if (!-[TSKHideOnTouchOutsideViewGestureRecognizer watchView](self, "watchView"))
    goto LABEL_12;
  -[UIView bounds](-[TSKHideOnTouchOutsideViewGestureRecognizer watchView](self, "watchView"), "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "locationInView:", -[TSKHideOnTouchOutsideViewGestureRecognizer watchView](self, "watchView"));
        v51.x = v20;
        v51.y = v21;
        v52.origin.x = v8;
        v52.origin.y = v10;
        v52.size.width = v12;
        v52.size.height = v14;
        if (CGRectContainsPoint(v52, v51))
          v17 = 1;
      }
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v16);
    v22 = v17 & 1;
  }
  else
  {
LABEL_12:
    v22 = 0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = (void *)objc_msgSend(a4, "allTouches");
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v23);
        v26 |= objc_msgSend(a3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j)) ^ 1;
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v25);
  }
  else
  {
    v26 = 0;
  }
  if (((v22 | v26) & 1) == 0)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    mTargets = self->mTargets;
    v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mTargets, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v36 != v32)
            objc_enumerationMutation(mTargets);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "target"), "performSelector:withObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "action"), self);
        }
        v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mTargets, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v31);
    }
  }
  if (v22 & 1 | ((v26 & 1) == 0))
    v34 = 5;
  else
    v34 = 1;
  -[TSKHideOnTouchOutsideViewGestureRecognizer setState:](self, "setState:", v34);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sGestureInFlight = 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (UIView)watchView
{
  return self->mWatchView;
}

- (void)setWatchView:(id)a3
{
  self->mWatchView = (UIView *)a3;
}

@end
