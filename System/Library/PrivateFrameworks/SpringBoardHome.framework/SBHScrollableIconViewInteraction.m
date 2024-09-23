@implementation SBHScrollableIconViewInteraction

- (SBHScrollableIconViewInteraction)initWithContainer:(id)a3
{
  id v4;
  SBHScrollableIconViewInteraction *v5;
  SBHScrollableIconViewInteraction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHScrollableIconViewInteraction;
  v5 = -[SBHScrollableIconViewInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_container, v4);

  return v6;
}

- (void)updateScrolling:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[SBHScrollableIconViewInteraction _findInteractingIconView](self, "_findInteractingIconView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_cachedInteractingIconView, v4);

  }
  else
  {
    objc_storeWeak((id *)&self->_cachedInteractingIconView, 0);
  }
}

- (void)clippingScrollViewDidScroll:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachedInteractingIconView);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v6, "convertRect:toView:", v38);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[SBHScrollableIconViewInteraction _clippingFudgeInset](self, "_clippingFudgeInset");
    v16 = v15;
    v39.origin.x = v8;
    v39.origin.y = v10;
    v39.size.width = v12;
    v39.size.height = v14;
    v40 = CGRectInset(v39, v16, v16);
    y = v40.origin.y;
    x = v40.origin.x;
    height = v40.size.height;
    width = v40.size.width;
    objc_msgSend(v38, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_loadWeakRetained((id *)&self->_container);
    objc_msgSend(v25, "visibleContainerInsets");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    v41.origin.x = v18 + v29;
    v41.origin.y = v20 + v27;
    v41.size.width = v22 - (v29 + v33);
    v41.size.height = v24 - (v27 + v31);
    v42.origin.y = y;
    v42.origin.x = x;
    v42.size.height = height;
    v42.size.width = width;
    if (!CGRectContainsRect(v41, v42))
    {
      -[SBHScrollableIconViewInteraction handleTargetIconViewClipped:](self, "handleTargetIconViewClipped:", v5);
      objc_storeWeak((id *)&self->_cachedInteractingIconView, 0);
    }
  }

}

- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3
{
  return 0;
}

- (double)_clippingFudgeInset
{
  return 0.0;
}

- (id)_findInteractingIconView
{
  id WeakRetained;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SBHScrollableIconViewInteraction__findInteractingIconView__block_invoke;
  v6[3] = &unk_1E8D85B48;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(WeakRetained, "enumerateScrollableIconViewsUsingBlock:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __60__SBHScrollableIconViewInteraction__findInteractingIconView__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconViewTheInteractingTargetIconView:"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SBHScrollableIconViewContaining)container
{
  return (SBHScrollableIconViewContaining *)objc_loadWeakRetained((id *)&self->_container);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_destroyWeak((id *)&self->_cachedInteractingIconView);
}

@end
