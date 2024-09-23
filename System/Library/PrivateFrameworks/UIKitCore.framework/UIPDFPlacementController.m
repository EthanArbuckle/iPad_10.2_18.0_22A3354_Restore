@implementation UIPDFPlacementController

- (UIPDFPlacementController)initWithAnnotations:(id)a3 viewSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  UIPDFPlacementController *v7;
  UIPDFPlacementController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  height = a4.height;
  width = a4.width;
  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)UIPDFPlacementController;
  v7 = -[UIPDFPlacementController init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_viewSize.width = width;
    v7->_viewSize.height = height;
    v7->_popups = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(a3);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[NSMutableArray addObject:](v8->_popups, "addObject:", v13);
        }
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray removeAllObjects](self->_popups, "removeAllObjects");

  v3.receiver = self;
  v3.super_class = (Class)UIPDFPlacementController;
  -[UIPDFPlacementController dealloc](&v3, sel_dealloc);
}

- (CGRect)boundsForObjectAtIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  UIPDFPageView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  __int128 v16;
  __int128 v17;
  CGRect result;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_popups, "objectAtIndex:", a3), "parent"), "selection");
  if (objc_msgSend(v4, "numberOfRectangles"))
  {
    v16 = 0u;
    v17 = 0u;
    memset(&v15, 0, sizeof(v15));
    objc_msgSend(v4, "getBounds:transform:index:", &v16, &v15, 0);
    v14 = v15;
    if (!CGAffineTransformIsIdentity(&v14))
    {
      v14 = v15;
      *(_QWORD *)&v16 = boundsForRotatedSelection((float64x2_t *)&v14, *(CGFloat *)&v16, *((CGFloat *)&v16 + 1), *(CGFloat *)&v17, *((CGFloat *)&v17 + 1));
      *((_QWORD *)&v16 + 1) = v5;
      *(_QWORD *)&v17 = v6;
      *((_QWORD *)&v17 + 1) = v7;
    }
    v8 = -[UIPDFPlacementController pageView](self, "pageView");
    -[UIPDFPageView convertRectFromPDFPageSpace:](v8, "convertRectFromPDFPageSpace:", v16, v17);
  }
  else
  {
    v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *MEMORY[0x1E0C9D648];
    v17 = v13;
    v10 = *((double *)&v16 + 1);
    v9 = *(double *)&v16;
    v12 = *((double *)&v17 + 1);
    v11 = *(double *)&v17;
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)yForObjectAtIndex:(unint64_t)a3
{
  CGRect v4;

  -[UIPDFPlacementController boundsForObjectAtIndex:](self, "boundsForObjectAtIndex:", a3);
  return CGRectGetMinY(v4);
}

- (id)viewAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_popups, "objectAtIndex:", a3), "annotationView");
}

- (void)shift:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v4 = -[NSMutableArray count](self->_popups, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = -[UIPDFPlacementController viewAtIndex:](self, "viewAtIndex:", i);
      objc_msgSend(v7, "frame");
      objc_msgSend(v7, "setFrame:");
    }
  }
}

- (void)layoutViews:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double MaxY;
  double MinY;
  CGFloat MaxX;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  CGFloat v26;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v61;
  CGFloat recta;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v5 = -[NSMutableArray count](self->_popups, "count");
  if (v5)
  {
    v6 = v5;
    v61 = a3;
    -[UIPDFPage cropBox](-[UIPDFPageView page](-[UIPDFPlacementController pageView](self, "pageView"), "page"), "cropBox");
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->pageView, "convertRectFromPDFPageSpace:");
    x = v68.origin.x;
    y = v68.origin.y;
    width = v68.size.width;
    height = v68.size.height;
    v11 = self->_viewSize.height;
    MaxY = CGRectGetMaxY(v68);
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    MinY = CGRectGetMinY(v69);
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    MaxX = CGRectGetMaxX(v70);
    v16 = self->_viewSize.width;
    v15 = self->_viewSize.height;
    v17 = MaxX - v16;
    -[NSMutableArray sortUsingFunction:context:](self->_popups, "sortUsingFunction:context:", sortByYAscendingThenX, 0);
    v18 = 0;
    v67 = MinY;
    do
    {
      -[UIPDFPlacementController yForObjectAtIndex:](self, "yForObjectAtIndex:", v18);
      if (v19 >= MinY)
        v20 = v19;
      else
        v20 = MinY;
      MinY = v11 + v20;
      objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_popups, "objectAtIndex:", v18++), "annotationView"), "setFrame:", v17, v20, v16, v15);
    }
    while (v6 != v18);
    v21 = -[UIPDFPlacementController viewAtIndex:](self, "viewAtIndex:", 0);
    v22 = v6 - 1;
    v23 = -[UIPDFPlacementController viewAtIndex:](self, "viewAtIndex:", v6 - 1);
    objc_msgSend(v23, "frame");
    v25 = v11 + CGRectGetMinY(v71);
    if (v25 > MaxY)
    {
      objc_msgSend(v21, "frame");
      v26 = CGRectGetMinY(v72);
      v24 = v67;
      if (v26 - v67 > v15 && v25 > MaxY)
      {
        v28 = v6 - 2;
        v66 = MaxY;
        do
        {
          if (v22)
          {
            v29 = v28;
            do
            {
              v30 = -[UIPDFPlacementController viewAtIndex:](self, "viewAtIndex:", v29 + 1);
              v31 = -[UIPDFPlacementController viewAtIndex:](self, "viewAtIndex:", v29);
              objc_msgSend(v30, "frame");
              v33 = v32;
              v35 = v34;
              v37 = v36;
              v39 = v38;
              objc_msgSend(v31, "frame");
              v40 = CGRectGetMaxY(v73);
              v74.origin.x = v33;
              v74.origin.y = v35;
              v74.size.width = v37;
              v74.size.height = v39;
              v41 = CGRectGetMinY(v74);
              objc_msgSend(v30, "setFrame:", v33, v35 - v11, v37, v39);
              v42 = v11 + v40;
              if (!v29)
                break;
              --v29;
            }
            while (v41 < v42);
            MaxY = v66;
            if (v41 < v42)
            {
              objc_msgSend(v21, "frame");
              v44 = v43;
              v63 = v45;
              v64 = v43;
              v47 = v46;
              v48 = v45;
              v65 = v49;
              objc_msgSend(-[UIPDFPlacementController viewAtIndex:](self, "viewAtIndex:", 1), "frame");
              v51 = v50;
              v53 = v52;
              v55 = v54;
              recta = v56;
              v75.origin.x = v44;
              v75.origin.y = v47;
              v75.size.width = v48;
              v75.size.height = v65;
              v57 = CGRectGetMaxY(v75);
              v76.origin.x = v51;
              v76.origin.y = v53;
              v76.size.width = v55;
              v76.size.height = recta;
              MaxY = v66;
              objc_msgSend(v21, "setFrame:", v64, v47 - (v57 - CGRectGetMinY(v76)), v63, v65);
            }
          }
          objc_msgSend(v23, "frame");
          v58 = CGRectGetMinY(v77);
          objc_msgSend(v21, "frame");
          v59 = CGRectGetMinY(v78);
          v24 = v11 + v58;
        }
        while (v59 - v67 > v15 && v24 > MaxY);
      }
    }
    -[UIPDFPlacementController shift:](self, "shift:", v61, v24);
  }
}

- (UIPDFPageView)pageView
{
  return self->pageView;
}

- (void)setPageView:(id)a3
{
  self->pageView = (UIPDFPageView *)a3;
}

@end
