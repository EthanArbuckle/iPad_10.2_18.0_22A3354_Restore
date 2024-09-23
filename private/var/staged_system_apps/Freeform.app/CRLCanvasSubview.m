@implementation CRLCanvasSubview

+ (Class)layerClass
{
  return (Class)objc_opt_class(CRLCanvasSubviewLayer, a2);
}

- (CRLCanvasSubview)initWithFrame:(CGRect)a3
{
  CRLCanvasSubview *v3;
  CRLCanvasSubview *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasSubview;
  v3 = -[CRLCanvasSubview initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CRLCanvasSubview setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (void)setSubviews:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  CRLCanvasSubview *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview subviews](self, "subviews"));
  v6 = objc_msgSend(v5, "isEqualToArray:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = objc_alloc((Class)NSMutableOrderedSet);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview subviews](self, "subviews"));
    v9 = objc_msgSend(v7, "initWithArray:", v8);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "containsObject:", v15))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview subviews](self, "subviews"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));

            if (v15 != v17)
            {
              v18 = (CRLCanvasSubview *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));

              if (v18 == self)
              {
                -[CRLCanvasSubview bringSubviewToFront:](self, "bringSubviewToFront:", v15);
              }
              else
              {
                objc_msgSend(v15, "removeFromSuperview");
                -[CRLCanvasSubview addSubview:](self, "addSubview:", v15);
              }
            }
            objc_msgSend(v9, "removeObject:", v15);
          }
          else
          {
            -[CRLCanvasSubview addSubview:](self, "addSubview:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "removeFromSuperview", (_QWORD)v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v21);
    }

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  CRLCanvasSubview *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasSubview;
  v5 = -[CRLCanvasSubview hitTest:withEvent:](&v8, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (CRLCanvasSubview *)objc_claimAutoreleasedReturnValue(v5);
  if (v6 == self)
  {

    v6 = 0;
  }
  return v6;
}

- (BOOL)containsView:(id)a3
{
  return objc_msgSend(a3, "isDescendantOfView:", self);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSubview layerDelegate](self, "layerDelegate"));
  if ((objc_opt_respondsToSelector(v8, "actionForLayer:forKey:") & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionForLayer:forKey:", v6, v7));
  else
    v9 = 0;

  return v9;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLCanvasSubview;
    -[CRLCanvasSubview layoutSublayersOfLayer:](&v5, "layoutSublayersOfLayer:", v4);
  }

}

- (CALayerDelegate)layerDelegate
{
  return (CALayerDelegate *)objc_loadWeakRetained((id *)&self->_layerDelegate);
}

- (void)setLayerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layerDelegate);
}

@end
