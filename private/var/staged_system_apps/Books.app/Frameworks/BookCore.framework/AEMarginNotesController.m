@implementation AEMarginNotesController

- (AEMarginNotesController)init
{
  AEMarginNotesController *v2;
  AEMarginNotesController *v3;
  uint64_t v4;
  NSMapTable *marginNoteMarkers;
  uint64_t v6;
  NSMapTable *highlightedMarginNoteMarkers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AEMarginNotesController;
  v2 = -[AEMarginNotesController init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_pageTheme = 4;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    marginNoteMarkers = v3->_marginNoteMarkers;
    v3->_marginNoteMarkers = (NSMapTable *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    highlightedMarginNoteMarkers = v3->_highlightedMarginNoteMarkers;
    v3->_highlightedMarginNoteMarkers = (NSMapTable *)v6;

    v3->_ownerScale = 1.0;
  }
  return v3;
}

- (CGSize)ownerSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[AEMarginNotesController ownerFrame](self, "ownerFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setOwnerSize:(CGSize)a3
{
  -[AEMarginNotesController setOwnerFrame:](self, "setOwnerFrame:", 0.0, 0.0, a3.width, a3.height);
}

- (NSArray)layers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectEnumerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D4BF0;
  v7[3] = &unk_290E50;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (id)p_marginNoteIntersectingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v31;
  double MidY;
  double MidX;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MidY = CGRectGetMidY(v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  v9 = objc_msgSend(v8, "copy");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v36;
    v34 = 1.79769313e308;
    v31 = x;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v16, *(_QWORD *)&v31));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));

        objc_msgSend(v18, "frame");
        v19 = v41.origin.x;
        v20 = v41.origin.y;
        v21 = v41.size.width;
        v22 = v41.size.height;
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        if (CGRectIntersectsRect(v41, v44))
        {
          v23 = y;
          v24 = width;
          v25 = height;
          v42.origin.x = v19;
          v42.origin.y = v20;
          v42.size.width = v21;
          v42.size.height = v22;
          v26 = CGRectGetMidX(v42);
          v43.origin.x = v19;
          v43.origin.y = v20;
          v43.size.width = v21;
          v43.size.height = v22;
          v27 = CGRectGetMidY(v43);
          v28 = CGPointSquaredDistanceFromPoint(v26, v27, MidX, MidY);
          if (!v13 || v28 < v34)
          {
            v29 = v16;

            v34 = v28;
            v13 = v29;
          }
          height = v25;
          width = v24;
          y = v23;
          x = v31;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)marginNoteAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  __n128 v13;
  __n128 v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double MidX;
  double MidY;
  double v30;
  id v31;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  CGPoint v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  y = a3.y;
  x = a3.x;
  v6 = -[AEMarginNotesController ownerScale](self, "ownerScale");
  if (v7 <= 0.0)
    v8 = 1.0;
  else
    v8 = v7;
  v9 = CGPointMultiply(v6, x, y, v8);
  v11 = v10;
  v12 = isPad();
  v14.n128_u64[0] = 0x4044000000000000;
  if (v12)
    v14.n128_f64[0] = 120.0;
  v13.n128_u64[0] = 0x404C000000000000;
  if (!v12)
    v13.n128_f64[0] = 28.0;
  v15 = CGSizeScale(v14, v13, v8);
  v17 = v16;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v35;
    v33 = 1.79769313e308;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v24));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));

        objc_msgSend(v27, "frame");
        MidX = CGRectGetMidX(v40);
        objc_msgSend(v27, "frame");
        MidY = CGRectGetMidY(v41);
        v42.origin.x = MidX - v15 * 0.5;
        v42.origin.y = MidY - v17 * 0.5;
        v42.size.width = v15;
        v42.size.height = v17;
        v39.x = v9;
        v39.y = v11;
        if (CGRectContainsPoint(v42, v39))
        {
          v30 = (MidY - v11) * (MidY - v11) + (MidX - v9) * (MidX - v9);
          if (!v21 || v30 < v33)
          {
            v31 = v24;

            v33 = v30;
            v21 = v31;
          }
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)hasMarginNoteAtPoint:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteAtPoint:](self, "marginNoteAtPoint:", a3.x, a3.y));
  v4 = v3 != 0;

  return v4;
}

- (void)p_updateLayerLayout
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat width;
  CGFloat height;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  double v57;
  double v58;
  double v59;
  double v60;
  id v61;
  uint64_t v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController layers](self, "layers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i), "setPosition:", -100.0, -100.0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyEnumerator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingComparator:", &stru_290E70));

  -[AEMarginNotesController ownerScale](self, "ownerScale");
  v64 = 0u;
  v65 = 0u;
  if (v12 <= 0.0)
    v13 = 1.0;
  else
    v13 = v12;
  v66 = 0uLL;
  v67 = 0uLL;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v65;
    v17 = -(v13 * 6.0 + -0.00000011920929);
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v65 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v19));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
        objc_msgSend(v21, "imageSize");
        v24 = v23;
        if (objc_msgSend(v19, "side"))
        {
          -[AEMarginNotesController ownerSize](self, "ownerSize");
          v26 = v25;
          objc_msgSend(v21, "edgeInsets");
          v28 = v26 - v27 - v24;
        }
        else
        {
          objc_msgSend(v21, "edgeInsets");
          v28 = v29;
        }
        objc_msgSend(v19, "xOffset");
        v31 = v28 + v30;
        -[AEMarginNotesController ownerFrame](self, "ownerFrame");
        v33 = v31 + v32;
        objc_msgSend(v19, "yStart");
        v35 = v34;
        v36 = -[AEMarginNotesController ownerFrame](self, "ownerFrame");
        v38 = CGPointMultiply(v36, v33, v35 + v37, v13);
        v40 = v39;
        v74.origin.x = CGRectMakeWithOriginSize(objc_msgSend(v22, "bounds"));
        width = v74.size.width;
        height = v74.size.height;
        v75 = CGRectInset(v74, v17, v17);
        v43 = objc_claimAutoreleasedReturnValue(-[AEMarginNotesController p_marginNoteIntersectingRect:](self, "p_marginNoteIntersectingRect:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height));
        if (v43)
        {
          v44 = (void *)v43;
          while (1)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", v44));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));

            if (!v47)
              break;

            objc_msgSend(v47, "frame");
            v40 = v13 * 6.0 + CGRectGetMaxY(v76);
            v77.origin.x = v38;
            v77.origin.y = v40;
            v77.size.width = width;
            v77.size.height = height;
            v78 = CGRectInset(v77, v17, v17);
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController p_marginNoteIntersectingRect:](self, "p_marginNoteIntersectingRect:", v78.origin.x, v78.origin.y, v78.size.width, v78.size.height));

            if (!v44)
              goto LABEL_23;
          }
          BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEMarginNotesController.m", 191, (uint64_t)"-[AEMarginNotesController p_updateLayerLayout]", (uint64_t)"nearbyLayer", 0, v48, v49, v50, v62);

        }
LABEL_23:
        objc_msgSend(v22, "frame");
        v52 = v51;
        v54 = v53;
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        v56 = objc_msgSend(v55, "scale");
        v58 = CGPointRoundForScale(v56, v38, v40, v57);
        v60 = v59;

        objc_msgSend(v22, "setFrame:", v58, v60, v52, v54);
        v18 = (char *)v18 + 1;
      }
      while (v18 != v15);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      v15 = v61;
    }
    while (v61);
  }

}

- (void)addMarginNote:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v9;
  id v10;
  void *v11;
  AEAnnotationMarker *v12;
  void *v13;
  AEAnnotationMarker *v14;
  void *v15;
  id v16;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v16 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "theme"));
  if ((objc_msgSend(v9, "isUnderline") & 1) != 0)
  {
    v10 = &dword_4 + 2;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "theme"));
    v10 = objc_msgSend(v11, "annotationStyle");

  }
  v12 = [AEAnnotationMarker alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v13, "scale");
  v14 = -[AEAnnotationMarker initWithAnnotationStyle:contentScale:](v12, "initWithAnnotationStyle:contentScale:", v10);

  -[AEAnnotationMarker setPageTheme:](v14, "setPageTheme:", -[AEMarginNotesController pageTheme](self, "pageTheme"));
  -[AEMarginNotesController ownerScale](self, "ownerScale");
  -[AEAnnotationMarker setViewScale:](v14, "setViewScale:");
  -[AEAnnotationMarker setEdgeInsets:](v14, "setEdgeInsets:", top, left, bottom, right);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  objc_msgSend(v15, "setObject:forKey:", v14, v16);

  -[AEMarginNotesController p_updateLayerLayout](self, "p_updateLayerLayout");
}

- (void)removeMarginNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController highlightedMarginNoteMarkers](self, "highlightedMarginNoteMarkers"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

  -[AEMarginNotesController p_updateLayerLayout](self, "p_updateLayerLayout");
}

- (void)highlightMarginNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  objc_msgSend(v7, "setEffect:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController highlightedMarginNoteMarkers](self, "highlightedMarginNoteMarkers"));
  objc_msgSend(v6, "setObject:forKey:", v7, v4);

}

- (void)unhighlightMarginNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController marginNoteMarkers](self, "marginNoteMarkers"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  objc_msgSend(v7, "setEffect:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController highlightedMarginNoteMarkers](self, "highlightedMarginNoteMarkers"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

- (void)unhighlightAllMarginNotes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNotesController highlightedMarginNoteMarkers](self, "highlightedMarginNoteMarkers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyEnumerator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[AEMarginNotesController unhighlightMarginNote:](self, "unhighlightMarginNote:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (CGRect)ownerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_ownerFrame.origin.x;
  y = self->_ownerFrame.origin.y;
  width = self->_ownerFrame.size.width;
  height = self->_ownerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOwnerFrame:(CGRect)a3
{
  self->_ownerFrame = a3;
}

- (double)ownerScale
{
  return self->_ownerScale;
}

- (void)setOwnerScale:(double)a3
{
  self->_ownerScale = a3;
}

- (BOOL)compactPresentation
{
  return self->_compactPresentation;
}

- (void)setCompactPresentation:(BOOL)a3
{
  self->_compactPresentation = a3;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

- (NSMapTable)marginNoteMarkers
{
  return self->_marginNoteMarkers;
}

- (void)setMarginNoteMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_marginNoteMarkers, a3);
}

- (NSMapTable)highlightedMarginNoteMarkers
{
  return self->_highlightedMarginNoteMarkers;
}

- (void)setHighlightedMarginNoteMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedMarginNoteMarkers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedMarginNoteMarkers, 0);
  objc_storeStrong((id *)&self->_marginNoteMarkers, 0);
}

- (AEMarginNotesControllerAccessibilityDelegate)imaxAccessibilityDelegate
{
  return (AEMarginNotesControllerAccessibilityDelegate *)objc_getAssociatedObject(self, &unk_26A980);
}

- (void)imaxSetAccessibilityDelegate:(id)a3
{
  objc_setAssociatedObject(self, &unk_26A980, a3, 0);
}

@end
