@implementation CRLNearbyElementRotorSearchController

+ (id)nearbyDescriptionForLayoutFrame:(CGRect)a3 andSelectedLayoutFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  double v42;
  void *v43;
  void *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v49;
  double MidY;
  void *v51;
  double MidX;
  double v53;
  void *v54;
  double v55;
  void *v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v55 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v57.origin.x = v11;
  v57.origin.y = v10;
  v57.size.width = v9;
  v57.size.height = v8;
  MidY = CGRectGetMidY(v57);
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  v12 = CGRectGetMidX(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v13 = MidX - v12;
  v53 = MidY - CGRectGetMidY(v59);
  sub_1004005E0(x, y, width, height, v11, v10, v9, v55);
  v14 = (int)v13;
  v15 = (int)v53;
  v18 = (int)sqrt(v16 * v16 + v17 * v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s bottom right corner"), 0, 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s bottom left corner"), 0, 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s top right corner"), 0, 0));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s top left corner"), 0, 0));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s top edge"), 0, 0));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s left edge"), 0, 0));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s bottom edge"), 0, 0));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("%d points close to selection’s right edge"), 0, 0));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("horizontally centered"), 0, 0));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("vertically centered"), 0, 0));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((int)v13 >= 0)
    v36 = (int)v13;
  else
    v36 = -v14;
  if (width * 0.25 <= (double)v36)
  {
    if (v15 >= 0)
      v41 = v15;
    else
      v41 = -v15;
    v42 = height * 0.25;
    if (height * 0.25 <= (double)v41)
    {
      if (v15 < 1)
      {
        if (v14 < 1)
          v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v49, v42, v18);
        else
          v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v42, v18);
      }
      else if (v14 < 1)
      {
        v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v42, v18);
      }
      else
      {
        v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v56, v42, v18);
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      objc_msgSend(v35, "addObject:", v46);

    }
    else
    {
      if (v14 <= 0)
        v43 = v26;
      else
        v43 = v30;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v43, v42, v18));
      objc_msgSend(v35, "addObject:", v44);

      if (!v15)
      {
        v39 = v35;
        v40 = v32;
        goto LABEL_19;
      }
    }
  }
  else
  {
    if (v15 <= 0)
      v37 = v24;
    else
      v37 = v28;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v37, 0.25, (double)v36, width * 0.25, v18));
    objc_msgSend(v35, "addObject:", v38);

    if (!v14)
    {
      v39 = v35;
      v40 = v34;
LABEL_19:
      objc_msgSend(v39, "addObject:", v40);
    }
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", ")));

  return v47;
}

- (unint64_t)distanceToSelectedSearchReference:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  CGRect v26;
  CGRect v27;

  objc_msgSend(a3, "searchReferenceLayoutFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNearbyElementRotorSearchController selectedRep](self, "selectedRep"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
  objc_msgSend(v13, "alignmentFrameInRoot");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v27.origin.x = v15;
  v27.origin.y = v17;
  v27.size.width = v19;
  v27.size.height = v21;
  if (CGRectEqualToRect(v26, v27))
  {
    v22 = 1.79769313e308;
  }
  else
  {
    sub_1004005E0(v5, v7, v9, v11, v15, v17, v19, v21);
    if (v22 >= 0.0)
      v22 = sqrt(v22 * v22 + v23 * v23);
  }
  v24 = vcvtmd_u64_f64(v22);

  return v24;
}

- (id)nearbyDescriptionForSearchReference:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  objc_msgSend(a3, "searchReferenceLayoutFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNearbyElementRotorSearchController selectedRep](self, "selectedRep"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
  objc_msgSend(v13, "alignmentFrameInRoot");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLNearbyElementRotorSearchController nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:](CRLNearbyElementRotorSearchController, "nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:", v5, v7, v9, v11, v14, v15, v16, v17));

  return v18;
}

- (BOOL)shouldChangeSelectionPath
{
  return 0;
}

+ (id)searchTargetSearchSelectors
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "layoutSearchForNearbyElementsWithHitBlock:"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  unint64_t v18;

  v6 = a3;
  -[CRLModelSearchController buildSearchResultsIfNecessary](self, "buildSearchResultsIfNecessary");
  if (-[CRLModelSearchController searchResultsCount](self, "searchResultsCount"))
  {
    v7 = -[CRLNearbyElementRotorSearchController distanceToSelectedSearchReference:](self, "distanceToSelectedSearchReference:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100400A44;
    v16[3] = &unk_10125B3C8;
    v16[4] = self;
    v18 = v7;
    v17 = v6;
    v9 = (uint64_t)objc_msgSend(v8, "indexOfObjectPassingTest:", v16);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = -1;
    if (a4)
      v10 = -1;
    else
      v10 = 1;
    v11 = (uint64_t)-[CRLModelSearchController searchResultsCount](self, "searchResultsCount") - 1;
    if (v11 >= v9 + v10)
      v11 = v9 + v10;
    v12 = v11 & ~(v11 >> 63);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v12));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)sortLayoutSearchResultsArray:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100400B8C;
  v7[3] = &unk_10125B3F0;
  v7[4] = self;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v7));
  objc_msgSend(v4, "filterUsingPredicate:", v5);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100400C4C;
  v6[3] = &unk_10125B418;
  v6[4] = self;
  objc_msgSend(v4, "sortUsingComparator:", v6);

}

- (void)_addObservers
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLNearbyElementRotorSearchController;
  -[CRLRotorSearchController _addObservers](&v6, "_addObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRotorSearchController interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_editorControllerSelectionPathDidChange:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v5);

}

- (CRLCanvasRep)selectedRep
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRotorSearchController interactiveCanvasController](self, "interactiveCanvasController", v3));
  v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxFirstSelectedRep"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxTarget"));

  return (CRLCanvasRep *)v10;
}

- (id)focusedRep
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility currentlyFocusedElement](CRLAccessibility, "currentlyFocusedElement"));
  objc_opt_class(CRLCanvasRep, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v9)
    abort();
  v7 = (void *)v6;

  return v7;
}

@end
