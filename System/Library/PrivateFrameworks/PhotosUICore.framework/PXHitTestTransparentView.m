@implementation PXHitTestTransparentView

- (PXHitTestTransparentView)initWithFrame:(CGRect)a3
{
  PXHitTestTransparentView *v3;
  PXHitTestTransparentView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXHitTestTransparentView;
  v3 = -[PXHitTestTransparentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXHitTestTransparentView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    sub_1A7AE3F38();
    -[PXHitTestTransparentView setHitTestInsets:](v4, "setHitTestInsets:");
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  PXHitTestTransparentView *v8;
  PXHitTestTransparentView *v9;
  PXHitTestTransparentView *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PXHitTestTransparentView;
  -[PXHitTestTransparentView hitTest:withEvent:](&v26, sel_hitTest_withEvent_, v7, x, y);
  v8 = (PXHitTestTransparentView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PXHitTestTransparentView subviews](self, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
          objc_msgSend(v16, "convertPoint:fromView:", self, x, y, 0, 0);
          v20 = v17;
          v21 = v18;
          if (-[PXHitTestTransparentView _isPoint:insideView:withEvent:adjustedPoint:](self, "_isPoint:insideView:withEvent:adjustedPoint:", v16, v7, &v20))
          {
            objc_msgSend(v16, "hitTest:withEvent:", v7, v20, v21);
            v10 = (PXHitTestTransparentView *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v13)
          continue;
        break;
      }
    }

    v10 = 0;
  }
  else
  {
    v10 = v8;
  }
LABEL_13:

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  SEL v14;
  double v15;
  double v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  objc_super v22;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXHitTestTransparentView;
  if (-[PXHitTestTransparentView pointInside:withEvent:](&v22, sel_pointInside_withEvent_, v8, x, y))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke;
    v17[3] = &unk_1E5140E10;
    v17[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke_2;
    v11[3] = &unk_1E5140E38;
    v11[4] = self;
    v14 = a2;
    v15 = x;
    v16 = y;
    v12 = v8;
    v13 = &v18;
    -[PXHitTestTransparentView px_enumerateDescendantSubviewsPassingTest:usingBlock:](self, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", v17, v11);
    v9 = *((_BYTE *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isPoint:(CGPoint)a3 insideView:(id)a4 withEvent:(id)a5 adjustedPoint:(CGPoint *)a6
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  CGRect v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "bounds");
  CGRectInset(v17, 1.0, 1.0);
  PXRectClampPoint();
  v11 = v10;
  v13 = v12;
  PXDistanceBetweenPoints();
  if (v14 <= *(double *)off_1E50B8010)
  {
    if (a6)
    {
      a6->x = v11;
      a6->y = v13;
    }
    v15 = objc_msgSend(v8, "pointInside:withEvent:", v9, v11, v13);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)_hitTestBehaviorForView:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  if (a3 == self)
    return 1;
  v4 = a3;
  -[PXHitTestTransparentView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hitTestTransparentView:hitTestBehaviorForView:", self, v4);

  return v6;
}

- (PXHitTestTransparentViewDelegate)delegate
{
  return (PXHitTestTransparentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hitTestBehaviorForView:", a2) != 2;
}

void __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_hitTestBehaviorForView:");
  if (v5)
  {
    if (v5 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXHitTestTransparentView.m"), 68, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  else
  {
    objc_msgSend(v11, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v8 = v7;
    v10 = v9;
    if (objc_msgSend(v11, "isUserInteractionEnabled")
      && objc_msgSend(*(id *)(a1 + 32), "_isPoint:insideView:withEvent:adjustedPoint:", v11, *(_QWORD *)(a1 + 40), 0, v8, v10))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

@end
