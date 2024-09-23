@implementation UIIndexBarAccessoryView

- (int64_t)edge
{
  return self->_edge;
}

- (BOOL)overlay
{
  void *v2;
  char v3;

  -[UIIndexBarView visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "overlay");

  return v3;
}

- (void)update
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  id v59;

  -[UIIndexBarView visualStyle](self, "visualStyle");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_18;
  -[UIIndexBarView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_18:
    return;
  }
  -[UIIndexBarView entries](self, "entries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = -[UIIndexBarAccessoryView edge](self, "edge");
    v7 = v6 != 2;
    v8 = v6 != 4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "_minimumContentOffset");
    v11 = v10;
    v13 = v12;

    v14 = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(v14, "_maximumContentOffset");
    v16 = v15;
    v18 = v17;

    v19 = v7 && v8;
    if (v7 && v8)
      v20 = v18;
    else
      v20 = v16;
    if (v7 && v8)
      v21 = v13;
    else
      v21 = v11;
    v22 = v20 - v21;
    v23 = -1.0;
    if (v20 - v21 > 0.0)
    {
      v24 = objc_loadWeakRetained((id *)&self->_scrollView);
      objc_msgSend(v24, "contentOffset");
      v26 = v25;
      v28 = v27;

      v29 = v7 && v8 ? v28 : v26;
      v30 = (v29 - v21) / v22;
      v23 = -2.0;
      if (v30 >= 0.0)
      {
        if (v30 <= 1.0)
        {
          -[UIIndexBarView entries](self, "entries");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count") - 1;

          if (v32 < 2)
          {
            v33 = 0;
            v35 = 0.0;
            v36 = INFINITY;
          }
          else
          {
            v33 = 0;
            v34 = llround(v30 * (double)v32);
            v35 = 0.0;
            v36 = INFINITY;
            do
            {
              -[UIIndexBarView delegate](self, "delegate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIIndexBarView entries](self, "entries");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectAtIndexedSubscript:", v34);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "indexBarAccessoryView:contentOffsetForEntry:atIndex:", self, v39, v34);
              v41 = v40;
              v43 = v42;

              if (v19)
                v44 = v43;
              else
                v44 = v41;
              if (v44 >= v29)
              {
                if (v44 <= v29)
                {
                  v33 = v34;
                  v32 = v34;
                }
                else
                {
                  v32 = v34--;
                  v36 = v44;
                }
              }
              else
              {
                v33 = v34++;
                v35 = v44;
              }
            }
            while (v32 - v33 > 1);
          }
          if (v32 == v33)
          {
            v23 = (double)v33;
          }
          else if (v32 >= v33)
          {
            if (v35 == 0.0)
            {
              -[UIIndexBarView delegate](self, "delegate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIIndexBarView entries](self, "entries");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectAtIndexedSubscript:", v33);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "indexBarAccessoryView:contentOffsetForEntry:atIndex:", self, v47, v33);
              v49 = v48;
              v51 = v50;

              if (v19)
                v35 = v51;
              else
                v35 = v49;
            }
            if (v36 == INFINITY)
            {
              -[UIIndexBarView delegate](self, "delegate");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIIndexBarView entries](self, "entries");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectAtIndexedSubscript:", v32);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "indexBarAccessoryView:contentOffsetForEntry:atIndex:", self, v54, v32);
              v56 = v55;
              v58 = v57;

              if (v19)
                v36 = v58;
              else
                v36 = v56;
            }
            if (v29 >= v35)
            {
              v23 = -3.0;
              if (v29 <= v36)
                v23 = (v29 - v35) / (v36 - v35) + (double)v33;
            }
          }
          else
          {
            v23 = (double)v33 + 0.5;
          }
        }
        else
        {
          v23 = -3.0;
        }
      }
    }
    -[UIIndexBarView setHighlightedIndex:](self, "setHighlightedIndex:", v23);
  }
}

- (void)setEdge:(int64_t)a3
{
  self->_edge = a3;
}

- (void)setEntries:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIIndexBarAccessoryView;
  -[UIIndexBarView setEntries:](&v5, sel_setEntries_, a3);
  -[UIIndexBarAccessoryView scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateAccessories");

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

+ (void)makeIndexBarView:(id *)a3 scrollAccessoryContainerView:(id *)a4 forTraits:(id)a5
{
  id v9;
  _UIIndexBarScrollAccessoryContainerAdapterView *v10;
  _UIIndexBarScrollAccessoryContainerAdapterView *v11;
  _UIIndexBarScrollAccessoryContainerAdapterView *v12;
  _UIIndexBarScrollAccessoryContainerAdapterView *v13;
  _UIIndexBarScrollAccessoryContainerAdapterView *v14;
  _UIIndexBarScrollAccessoryContainerAdapterView *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v9 = a5;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIIndexBarAccessoryView.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexBarView != nil"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIIndexBarAccessoryView.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView != nil"));

LABEL_3:
  v18 = 0;
  v19 = 0;
  objc_msgSend(a1, "makeIndexBarView:containerView:forTraits:", &v19, &v18, v9);
  v10 = (_UIIndexBarScrollAccessoryContainerAdapterView *)v19;
  v11 = (_UIIndexBarScrollAccessoryContainerAdapterView *)v18;
  v12 = v10;
  if (v10 != v11)
  {
    v13 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = v13;
    }
    else
    {
      v12 = -[_UIIndexBarScrollAccessoryContainerAdapterView initWithContents:delegatingToView:]([_UIIndexBarScrollAccessoryContainerAdapterView alloc], "initWithContents:delegatingToView:", v13, v10);

    }
  }
  v14 = objc_retainAutorelease(v10);
  *a3 = v14;
  v15 = objc_retainAutorelease(v12);
  *a4 = v15;

}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIIndexBarAccessoryView;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)_selectEntry:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;

  v6 = a3;
  -[UIIndexBarView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "indexBarView:didSelectEntry:atIndex:", self, v6, a4);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  -[UIIndexBarAccessoryView scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIIndexBarView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexBarAccessoryView:contentOffsetForEntry:atIndex:", self, v6, a4);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v9, "contentOffset");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v9, "setContentOffset:animated:", 0, v12, v14);
  objc_msgSend(v9, "contentOffset");
  v21 = vabdd_f64(v19, v16) >= 0.00000011920929;
  v8 = vabdd_f64(v20, v18) >= 0.00000011920929 || v21;

LABEL_10:
  return v8;
}

- (id)displayEntryNearestToContentOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  y = a3.y;
  x = a3.x;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__235;
  v16 = __Block_byref_object_dispose__235;
  v17 = 0;
  -[UIIndexBarView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIIndexBarView displayEntries](self, "displayEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__UIIndexBarAccessoryView_displayEntryNearestToContentOffset___block_invoke;
    v11[3] = &unk_1E16EA890;
    *(CGFloat *)&v11[6] = x;
    *(CGFloat *)&v11[7] = y;
    v11[4] = self;
    v11[5] = &v12;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  }
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __62__UIIndexBarAccessoryView_displayEntryNearestToContentOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "entry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "type") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexBarAccessoryView:contentOffsetForEntry:atIndex:", *(_QWORD *)(a1 + 32), v8, objc_msgSend(v12, "entryIndex"));
    v11 = v10;

    if (v11 <= *(double *)(a1 + 56))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    else
      *a4 = 1;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
