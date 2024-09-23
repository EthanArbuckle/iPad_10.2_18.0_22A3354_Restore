@implementation THFlowPageRep

- (void)canvasDidScrollInFlowMode
{
  id v3;

  if (objc_msgSend(-[THFlowPageRep layout](self, "layout"), "parent"))
  {
    if (objc_msgSend(-[THFlowPageRep layout](self, "layout"), "layoutController"))
    {
      v3 = objc_msgSend(-[THFlowPageRep childReps](self, "childReps"), "arrayPiecewiseTransformedBy:", &stru_429B18);
      objc_msgSend(-[THFlowPageRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRectForContent");
      if ((objc_msgSend(-[THFlowPageRep p_desiredVisibleLayoutsForRect:](self, "p_desiredVisibleLayoutsForRect:"), "isEqualToArray:", v3) & 1) == 0)objc_msgSend(-[THFlowPageRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateRepsInBackground");
    }
    objc_msgSend(-[THFlowPageRep layout](self, "layout"), "canvasDidScroll");
  }
}

- (void)updateChildrenFromLayout
{
  _QWORD v4[5];

  objc_msgSend(-[THFlowPageRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRectForContent");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_108BB0;
  v4[3] = &unk_429B40;
  v4[4] = self;
  -[THPageRep setChildReps:](self, "setChildReps:", objc_msgSend(-[THFlowPageRep p_desiredVisibleLayoutsForRect:](self, "p_desiredVisibleLayoutsForRect:"), "arrayPiecewiseTransformedBy:", v4));
  objc_msgSend(-[THFlowPageRep childReps](self, "childReps"), "makeObjectsPerformSelector:", a2);
}

- (id)p_desiredVisibleLayoutsForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_msgSend(-[THFlowPageRep layout](self, "layout"), "children");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "frameInRoot");
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        if (CGRectIntersectsRect(v21, v22))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  return v8;
}

- (BOOL)drawsPageBackground
{
  return 0;
}

- (int)marginNoteSideForPageRelativeRect:(CGRect)a3
{
  return objc_msgSend(-[THFlowPageRep layout](self, "layout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height), "isMaxXEdgeObscured") ^ 1;
}

@end
