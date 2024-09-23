@implementation _UIBanner

- (void)present
{
  _UIBannerView *v3;
  void *v4;
  UILongPressGestureRecognizer *v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[5];

  if ((unint64_t)(self->_state - 1) >= 2)
  {
    if (!self->_view)
    {
      v3 = objc_alloc_init(_UIBannerView);
      -[_UIBanner setView:](self, "setView:", v3);

      -[_UIBanner content](self, "content");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBannerView setContent:](self->_view, "setContent:", v4);

      if (-[NSMutableArray count](self->_tapHandlers, "count"))
      {
        v5 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleLongPressGesture_);
        -[UILongPressGestureRecognizer setMinimumPressDuration:](v5, "setMinimumPressDuration:", 0.0);
        -[UIView addGestureRecognizer:](self->_view, "addGestureRecognizer:", v5);

      }
    }
    self->_state = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    objc_msgSend(WeakRetained, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __20___UIBanner_present__block_invoke;
    v8[3] = &unk_1E16B3FD8;
    v8[4] = self;
    objc_msgSend(v7, "_presentBanner:completion:", self, v8);

  }
}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  _UIBannerView *view;
  _BOOL8 v6;
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGPoint v23;
  CGRect v24;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      view = self->_view;
      v6 = 1;
      v7 = 1;
      goto LABEL_4;
    case 2:
      objc_msgSend(v4, "locationInView:", self->_view);
      v9 = v8;
      v11 = v10;
      -[UIView bounds](self->_view, "bounds");
      v23.x = v9;
      v23.y = v11;
      v6 = CGRectContainsPoint(v24, v23);
      view = self->_view;
      v7 = 0;
LABEL_4:
      -[_UIBannerView setHighlighted:initialPress:](view, "setHighlighted:initialPress:", v6, v7);
      break;
    case 3:
      if (-[_UIBannerView highlighted](self->_view, "highlighted"))
      {
        -[_UIBannerView setHighlighted:](self->_view, "setHighlighted:", 0);
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v12 = self->_tapHandlers;
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v18;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v18 != v15)
                objc_enumerationMutation(v12);
              (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
              ++v16;
            }
            while (v14 != v16);
            v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v14);
        }

        -[_UIBanner dismiss](self, "dismiss", (_QWORD)v17);
      }
      break;
    case 4:
      -[_UIBannerView setHighlighted:](self->_view, "setHighlighted:", 0);
      break;
    default:
      break;
  }

}

- (void)dismiss
{
  int64_t state;
  BOOL v3;
  id WeakRetained;
  void *v6;
  NSMutableArray *dismissalAnimations;
  _QWORD v8[5];

  state = self->_state;
  if (state)
    v3 = state == 3;
  else
    v3 = 1;
  if (!v3)
  {
    self->_state = 3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    objc_msgSend(WeakRetained, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dismissalAnimations = self->_dismissalAnimations;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __20___UIBanner_dismiss__block_invoke;
    v8[3] = &unk_1E16B3FD8;
    v8[4] = self;
    objc_msgSend(v6, "_dismissBanner:alongsideAnimations:completion:", self, dismissalAnimations, v8);

  }
}

- (void)addDismissalAnimations:(id)a3
{
  id v4;
  NSMutableArray *dismissalAnimations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  dismissalAnimations = self->_dismissalAnimations;
  aBlock = v4;
  if (!dismissalAnimations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dismissalAnimations;
    self->_dismissalAnimations = v6;

    v4 = aBlock;
    dismissalAnimations = self->_dismissalAnimations;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](dismissalAnimations, "addObject:", v8);

}

- (void)addDismissalCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *dismissalCompletionHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  dismissalCompletionHandlers = self->_dismissalCompletionHandlers;
  aBlock = v4;
  if (!dismissalCompletionHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dismissalCompletionHandlers;
    self->_dismissalCompletionHandlers = v6;

    v4 = aBlock;
    dismissalCompletionHandlers = self->_dismissalCompletionHandlers;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](dismissalCompletionHandlers, "addObject:", v8);

}

- (void)addTapHandler:(id)a3
{
  id v4;
  NSMutableArray *tapHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  tapHandlers = self->_tapHandlers;
  aBlock = v4;
  if (!tapHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_tapHandlers;
    self->_tapHandlers = v6;

    v4 = aBlock;
    tapHandlers = self->_tapHandlers;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](tapHandlers, "addObject:", v8);

}

- (_UIBannerView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (_UIBannerContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (_UIBannerManager)manager
{
  return (_UIBannerManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (NSLayoutConstraint)visibleConstraint
{
  return self->_visibleConstraint;
}

- (void)setVisibleConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_visibleConstraint, a3);
}

- (NSLayoutConstraint)hiddenConstraint
{
  return self->_hiddenConstraint;
}

- (void)setHiddenConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenConstraint, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)dismissalAnimations
{
  return self->_dismissalAnimations;
}

- (void)setDismissalAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalAnimations, a3);
}

- (NSMutableArray)dismissalCompletionHandlers
{
  return self->_dismissalCompletionHandlers;
}

- (void)setDismissalCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalCompletionHandlers, a3);
}

- (NSMutableArray)tapHandlers
{
  return self->_tapHandlers;
}

- (void)setTapHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_tapHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapHandlers, 0);
  objc_storeStrong((id *)&self->_dismissalCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_dismissalAnimations, 0);
  objc_storeStrong((id *)&self->_hiddenConstraint, 0);
  objc_storeStrong((id *)&self->_visibleConstraint, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
