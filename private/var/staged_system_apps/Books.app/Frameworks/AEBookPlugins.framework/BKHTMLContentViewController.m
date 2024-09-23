@implementation BKHTMLContentViewController

- (void)setIgnorePageTurnGestures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "setIgnorePageTurnGestures:") & 1) != 0)
    objc_msgSend(v4, "setIgnorePageTurnGestures:", v3);

}

- (void)adjustGesturesForTextInteractionAssistant:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UILongPressGestureRecognizer *v9;
  UILongPressGestureRecognizer *indirectImmediateHighlightRecognizer;
  UIGestureRecognizer *v11;
  UIGestureRecognizer *indirectHighlightRecognizer;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self->_webView2, "be_textInputChild"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "loupeGesture"));
    objc_msgSend(v8, "setMinimumPressDuration:", 0.25);
    objc_msgSend(v8, "setAllowedTouchTypes:", &off_1CD558);
    -[BKHTMLContentViewController _timeIntervalForHighlightGesture](self, "_timeIntervalForHighlightGesture");
    objc_msgSend(v8, "setBe_gestureDelay:");
    if (!self->_indirectImmediateHighlightRecognizer)
    {
      v9 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_handleStylusGesture:");
      indirectImmediateHighlightRecognizer = self->_indirectImmediateHighlightRecognizer;
      self->_indirectImmediateHighlightRecognizer = v9;

      -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_indirectImmediateHighlightRecognizer, "setMinimumPressDuration:", 0.0);
      -[UILongPressGestureRecognizer setDelegate:](self->_indirectImmediateHighlightRecognizer, "setDelegate:", self);
      -[UILongPressGestureRecognizer setAllowedTouchTypes:](self->_indirectImmediateHighlightRecognizer, "setAllowedTouchTypes:", &off_1CD570);
      objc_msgSend(v6, "addGestureRecognizer:", self->_indirectImmediateHighlightRecognizer);
    }
    if (!self->_indirectHighlightRecognizer)
    {
      v11 = (UIGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "_handleStylusGesture:");
      indirectHighlightRecognizer = self->_indirectHighlightRecognizer;
      self->_indirectHighlightRecognizer = v11;

      -[UIGestureRecognizer setDelegate:](self->_indirectHighlightRecognizer, "setDelegate:", self);
      -[UIGestureRecognizer setAllowedTouchTypes:](self->_indirectHighlightRecognizer, "setAllowedTouchTypes:", &off_1CD588);
      objc_msgSend(v6, "addGestureRecognizer:", self->_indirectHighlightRecognizer);
    }

  }
}

- (void)showContextMenuAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "be_contentView"));

  if (v12)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
    objc_msgSend(v12, "convertPoint:fromView:", v7, x, y);
    v9 = v8;
    v11 = v10;

    -[BKHTMLContentViewController setOverrideBuildMenuLocation:](self, "setOverrideBuildMenuLocation:", v9, v11);
    -[BKHTMLContentViewController setOverrideBuildMenuLocation:](self, "setOverrideBuildMenuLocation:", CGPointZero.x, CGPointZero.y);
  }

}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  unsigned __int8 v7;

  y = a4.y;
  x = a4.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2", a3));
  v7 = objc_msgSend(v6, "be_hasSelectablePositionAtPoint:", x, y);

  return v7;
}

- (void)interactionDidEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double width;
  double height;
  double v22;
  double x;
  double v24;
  double y;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double MaxX;
  double MaxY;
  void *v36;
  void *v37;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v38 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "be_selectionRects"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "CGRectValue");
    v44.origin.x = v16;
    v44.origin.y = v17;
    v44.size.width = v18;
    v44.size.height = v19;
    v39.origin.x = v9;
    v39.origin.y = v11;
    v39.size.width = v13;
    v39.size.height = v15;
    v40 = CGRectUnion(v39, v44);
    width = v40.size.width;
    height = v40.size.height;
    objc_msgSend(v6, "CGRectValue", v40.origin.x, v40.origin.y);
    x = v22;
    y = v24;
    if (!v7)
      goto LABEL_7;
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    if (!v7)
      goto LABEL_7;
  }
  -[BKHTMLContentViewController rectForPresentedMenuForTextInteraction](self, "rectForPresentedMenuForTextInteraction");
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  if (!CGRectEqualToRect(v41, v45))
  {
    objc_msgSend(v7, "CGRectValue");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[BKHTMLContentViewController setRectForPresentedMenuForTextInteraction:](self, "setRectForPresentedMenuForTextInteraction:", x, y, width, height);
    v42.origin.x = v27;
    v42.origin.y = v29;
    v42.size.width = v31;
    v42.size.height = v33;
    MaxX = CGRectGetMaxX(v42);
    v43.origin.x = v27;
    v43.origin.y = v29;
    v43.size.width = v31;
    v43.size.height = v33;
    MaxY = CGRectGetMaxY(v43);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "view"));
    objc_msgSend(v36, "convertPoint:fromView:", v37, MaxX, MaxY);
    -[BKHTMLContentViewController showContextMenuAtLocation:](self, "showContextMenuAtLocation:");

  }
LABEL_7:

}

- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  double v11;
  double v12;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  uint64_t v97;
  _BYTE v98[128];
  CGPoint v99;
  CGRect v100;
  CGRect v101;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  -[BKHTMLContentViewController overrideBuildMenuLocation](self, "overrideBuildMenuLocation");
  if (v12 != CGPointZero.x || v11 != CGPointZero.y)
  {
    -[BKHTMLContentViewController overrideBuildMenuLocation](self, "overrideBuildMenuLocation");
    x = v14;
    y = v15;
  }
  -[BKHTMLContentViewController clearSelectedAnnotation](self, "clearSelectedAnnotation");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "be_textInputChild"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
  objc_msgSend(v16, "convertPoint:toView:", v17, x, y);
  v19 = v18;
  v21 = v20;

  v22 = -[BKHTMLContentViewController _preflightTapLocation:](self, "_preflightTapLocation:", v19, v21);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedText](self, "selectedText"));
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "be_selectionRects"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v88;
    while (2)
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v88 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i), "CGRectValue");
        v101 = CGRectInset(v100, -10.0, -10.0);
        v99.x = x;
        v99.y = y;
        if (CGRectContainsPoint(v101, v99))
        {
          v29 = 0;
          goto LABEL_16;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
      if (v26)
        continue;
      break;
    }
  }
  v29 = 1;
LABEL_16:

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _activityItemsConfiguration](self, "_activityItemsConfiguration"));
  -[BKHTMLContentViewController setActivityItemsConfiguration:](self, "setActivityItemsConfiguration:", v31);

  -[__CFString length](v23, "length");
  if (v23 && -[__CFString length](v23, "length"))
  {
    if (v30)
      v32 = 0;
    else
      v32 = v29;
    if ((v32 & 1) == 0)
      goto LABEL_26;
  }
  else if (v30)
  {
    goto LABEL_26;
  }
  if (objc_msgSend(v10, "be_hasSelectablePositionAtPoint:", x, y))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "be_textInputChild"));
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1C5A0;
    v86[3] = &unk_1BEA38;
    v86[4] = self;
    objc_msgSend(v33, "selectTextWithGranularity:atPoint:completionHandler:", 1, v86, x, y);

  }
LABEL_26:
  v83 = v10;
  objc_msgSend(v9, "removeMenuForIdentifier:", UIMenuLookup);
  objc_msgSend(v9, "removeMenuForIdentifier:", UIMenuServices);
  objc_msgSend(v9, "removeMenuForIdentifier:", UIMenuShare);
  objc_msgSend(v9, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuStandardEdit, &stru_1BEED0);
  v34 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.on.doc")));
  v35 = AEBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1C3088, 0));
  v82 = (void *)v34;
  v38 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v37, v34, "copy:", CFSTR("C"), 0x80000, 0));

  v39 = UIMenu;
  v81 = (void *)v38;
  v97 = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v97, 1));
  v41 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1C3088, 0, CFSTR("BKContextMenuEditIdentifier"), 17, v40));

  v84 = v9;
  v80 = (void *)v41;
  objc_msgSend(v9, "insertSiblingMenu:afterMenuForIdentifier:", v41, UIMenuStandardEdit);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v95 = CFSTR("lookUpTerm");
  v43 = v23;
  if (!v23)
  {
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "annotationSelectedText"));
    v39 = (void *)v44;
    if (v44)
      v43 = (const __CFString *)v44;
    else
      v43 = &stru_1C3088;
  }
  v85 = v30;
  v96 = v43;
  v45 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
  if (!v23)

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass.circle")));
  v47 = AEBundle();
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Look Up"), &stru_1C3088, 0));
  v79 = (void *)v45;
  v50 = objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v49, v46, "lookupSelection:", v45));

  v78 = (void *)v50;
  objc_msgSend(v42, "addObject:", v50);
  v51 = AEBundle();
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("Translate"), &stru_1C3088, 0));

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("translate")));
  if (v23)
  {
    v55 = v23;
    v56 = v23;
  }
  else
  {
    v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "annotationSelectedText"));
    v56 = 0;
    v58 = (void *)v57;
    if (v57)
      v59 = (__CFString *)v57;
    else
      v59 = &stru_1C3088;
    v55 = v59;

  }
  v76 = v24;
  v93 = CFSTR("translateTerm");
  v94 = v55;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v53, v54, "translateSelection:", v60));

  objc_msgSend(v42, "addObject:", v61);
  v91 = CFSTR("searchTerm");
  v62 = v56;
  if (!v56)
  {
    v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "annotationSelectedText"));
    v53 = (void *)v63;
    v62 = &stru_1C3088;
    if (v63)
      v62 = (const __CFString *)v63;
  }
  v92 = v62;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1));
  v77 = (__CFString *)v56;
  if (!v56)

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.text.magnifyingglass")));
  v66 = AEBundle();
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("Search"), &stru_1C3088, 0));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v68, v65, "searchUsingSelection:", v64));

  objc_msgSend(v42, "addObject:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
  v71 = AEBundle();
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1C3088, 0));
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v73, v70, "_share:", UICommandTagShare));

  objc_msgSend(v42, "addObject:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1C3088, 0, CFSTR("BKContextMenuAnnotationIdentifier"), 17, v42));
  objc_msgSend(v84, "insertSiblingMenu:afterMenuForIdentifier:", v75, CFSTR("BKContextMenuEditIdentifier"));
  objc_msgSend(v84, "removeMenuForIdentifier:", UIMenuStandardEdit);

}

- (id)_payloadForKey:(id)a3 fromSender:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  objc_opt_class(UICommand);
  v8 = BUDynamicCast(v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9 && objc_msgSend(v5, "length"))
  {
    *(_QWORD *)&v10 = objc_opt_class(NSDictionary).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "propertyList", v10));
    v14 = BUDynamicCast(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    *(_QWORD *)&v16 = objc_opt_class(NSString).n128_u64[0];
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v5, v16));
    v20 = BUDynamicCast(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)searchWeb:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _payloadForKey:fromSender:](self, "_payloadForKey:fromSender:", CFSTR("searchTerm"), a3));
  if (objc_msgSend(v5, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    objc_msgSend(v4, "contentViewController:searchWebForString:", self, v5);

  }
}

- (void)searchWikipedia:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _payloadForKey:fromSender:](self, "_payloadForKey:fromSender:", CFSTR("searchTerm"), a3));
  if (objc_msgSend(v5, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    objc_msgSend(v4, "contentViewController:searchEncyclopediaForString:", self, v5);

  }
}

- (void)changeAnnotationStyle:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class(UICommand);
  v6 = BUDynamicCast(v5, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation"));
  if (v7)
    -[BKHTMLContentViewController changeAnnotationStyle:annotation:](self, "changeAnnotationStyle:annotation:", v8, v7);

}

- (void)changeAnnotationStyle:(id)a3 annotation:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "propertyList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("style")));

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController themePage](self, "themePage"));
    v10 = objc_msgSend(v9, "annotationPageTheme");

    switch((unint64_t)v8)
    {
      case 1uLL:
        v11 = objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme yellowTheme:](AEAnnotationTheme, "yellowTheme:", v10));
        goto LABEL_9;
      case 2uLL:
        v11 = objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme greenTheme:](AEAnnotationTheme, "greenTheme:", v10));
        goto LABEL_9;
      case 3uLL:
        v11 = objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme blueTheme:](AEAnnotationTheme, "blueTheme:", v10));
        goto LABEL_9;
      case 4uLL:
        v11 = objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme pinkTheme:](AEAnnotationTheme, "pinkTheme:", v10));
        goto LABEL_9;
      case 5uLL:
        v11 = objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme purpleTheme:](AEAnnotationTheme, "purpleTheme:", v10));
        goto LABEL_9;
      case 6uLL:
        v11 = objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme underlineTheme:](AEAnnotationTheme, "underlineTheme:", v10));
LABEL_9:
        v12 = (void *)v11;
        break;
      default:
        v12 = 0;
        break;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    v14 = BUProtocolCast(&OBJC_PROTOCOL___AEHighlightColorEditorControllerDelegate, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v12 && v15)
    {
      objc_msgSend(v15, "editorController:setTheme:forAnnotation:", 0, v12, v16);
      -[BKHTMLContentViewController clearSelection](self, "clearSelection");
    }

  }
}

- (void)addNote:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation", a3));
  if (v4)
  {
    v5 = v4;
    -[BKHTMLContentViewController selectAnnotation:](self, "selectAnnotation:", v4);
    -[BKHTMLContentViewController annotateSelection:](self, "annotateSelection:", v5);
    v4 = v5;
  }

}

- (void)removeNote:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation", a3));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAnnotationNote:", &stru_1C3088);
    v3 = v4;
  }

}

- (void)removeNoteAndHighlight:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation", a3));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setAnnotationNote:", &stru_1C3088);
    objc_msgSend(v5, "setAnnotationDeleted:", 1);
    -[BKHTMLContentViewController removeHighlightForAnnotation:](self, "removeHighlightForAnnotation:", v5);
    v4 = v5;
  }

}

- (id)_activityItemsConfiguration
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v17;

  v3 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation"));
  v4 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedText](self, "selectedText"));
  v5 = (void *)v4;
  v6 = 0;
  if (!v3 && v4)
  {
    v6 = objc_alloc_init(BKHTMLContentViewControllerDummyAnnotation);
    objc_msgSend((id)v6, "setAnnotationStyle:", 0);
    objc_msgSend((id)v6, "setAnnotationRepresentativeText:", v5);
    v7 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationDataProvider](self, "annotationDataProvider"));
    v8 = (void *)v7;
    if (v7 && (objc_opt_respondsToSelector(v7, "chapterTitleForOrdinal:pageOffset:") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chapterTitleForOrdinal:pageOffset:", -[BKContentViewController ordinal](self, "ordinal"), -[BKContentViewController pageOffset](self, "pageOffset")));
      objc_msgSend((id)v6, "setChapterTitle:", v9);

    }
  }
  if (v3 | v6)
  {
    if (v3)
      v10 = v3;
    else
      v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationCatalystItemProvider itemProviderWithAnnotation:propertyProvider:](AEAnnotationCatalystItemProvider, "itemProviderWithAnnotation:propertyProvider:", v10, self));
    v12 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", v11);
    v13 = objc_alloc((Class)UIActivityItemsConfiguration);
    v17 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v15 = objc_msgSend(v13, "initWithItemProviders:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)addNoteToCurrentSelection:(id)a3
{
  -[BKHTMLContentViewController _bookmarkSelectionAndAnnotate:showColorEditor:completion:](self, "_bookmarkSelectionAndAnnotate:showColorEditor:completion:", 1, 0, 0);
}

- (void)addHighlightToCurrentSelection:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  BKHTMLContentViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1CD2C;
  v5[3] = &unk_1BEEF8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[BKHTMLContentViewController _bookmarkSelectionAndAnnotate:showColorEditor:completion:](self, "_bookmarkSelectionAndAnnotate:showColorEditor:completion:", 0, 0, v5);

}

- (BKHTMLContentViewController)init
{
  BKHTMLContentViewController *v2;
  BKWebViewProxy *v3;
  BKWebViewProxy *webViewProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHTMLContentViewController;
  v2 = -[BKContentViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(BKWebViewProxy);
    webViewProxy = v2->_webViewProxy;
    v2->_webViewProxy = v3;

    -[BKWebViewProxy setHasWKWebView:](v2->_webViewProxy, "setHasWKWebView:", 1);
  }
  return v2;
}

- (void)releaseViews
{
  UIView *fadeView;
  UITapGestureRecognizer *tapGesture;
  UITapGestureRecognizer *doubleTapGesture;
  UIGestureRecognizer *indirectHighlightRecognizer;
  UILongPressGestureRecognizer *indirectImmediateHighlightRecognizer;
  WebVisiblePosition *highlightWordStart;
  WebVisiblePosition *highlightWordEnd;
  WebVisiblePosition *highlightLastPos;
  CGPoint v11;
  BKHTMLContentViewControllerDummyAnnotation *highlightDummyAnnotation;
  NSFetchedResultsController *highlightsFRC;
  AEHighlightRenderingController *highlightRenderingController;
  BKActivityIndicatorOverlayView *activityIndicator;
  objc_super v16;

  fadeView = self->_fadeView;
  self->_fadeView = 0;

  -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_tapGesture, "removeTarget:action:", 0, 0);
  tapGesture = self->_tapGesture;
  self->_tapGesture = 0;

  -[UITapGestureRecognizer setDelegate:](self->_doubleTapGesture, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_doubleTapGesture, "removeTarget:action:", 0, 0);
  doubleTapGesture = self->_doubleTapGesture;
  self->_doubleTapGesture = 0;

  -[UIGestureRecognizer setDelegate:](self->_indirectHighlightRecognizer, "setDelegate:", 0);
  -[UIGestureRecognizer removeTarget:action:](self->_indirectHighlightRecognizer, "removeTarget:action:", 0, 0);
  indirectHighlightRecognizer = self->_indirectHighlightRecognizer;
  self->_indirectHighlightRecognizer = 0;

  -[UILongPressGestureRecognizer setDelegate:](self->_indirectImmediateHighlightRecognizer, "setDelegate:", 0);
  -[UILongPressGestureRecognizer removeTarget:action:](self->_indirectImmediateHighlightRecognizer, "removeTarget:action:", 0, 0);
  indirectImmediateHighlightRecognizer = self->_indirectImmediateHighlightRecognizer;
  self->_indirectImmediateHighlightRecognizer = 0;

  highlightWordStart = self->_highlightWordStart;
  self->_highlightWordStart = 0;

  highlightWordEnd = self->_highlightWordEnd;
  self->_highlightWordEnd = 0;

  highlightLastPos = self->_highlightLastPos;
  self->_highlightLastPos = 0;

  v11 = CGPointZero;
  self->_highlightStartPoint = CGPointZero;
  self->_highlightStartPoint2 = v11;
  highlightDummyAnnotation = self->_highlightDummyAnnotation;
  self->_highlightDummyAnnotation = 0;

  -[NSFetchedResultsController setDelegate:](self->_highlightsFRC, "setDelegate:", 0);
  highlightsFRC = self->_highlightsFRC;
  self->_highlightsFRC = 0;

  highlightRenderingController = self->_highlightRenderingController;
  self->_highlightRenderingController = 0;

  self->super._contentLoaded = 0;
  -[BKContentViewController setContentLoadPending:](self, "setContentLoadPending:", 0);
  -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:](self, "_updateReadingStateVisibilityPossible:", 0);
  -[BKActivityIndicatorOverlayView hideIndicatorAnimated:animationDelay:](self->_activityIndicator, "hideIndicatorAnimated:animationDelay:", 0, 0.0);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  v16.receiver = self;
  v16.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController releaseViews](&v16, "releaseViews");
}

- (void)dealloc
{
  NSMutableDictionary *annotationRectUnionCache;
  NSMutableDictionary *annotationRectsCache;
  objc_super v5;

  -[BKHTMLContentViewController teardownNotifications](self, "teardownNotifications");
  -[BKHTMLContentViewController releaseViews](self, "releaseViews");
  -[BKHTMLContentViewController clearCurrentHighlighting](self, "clearCurrentHighlighting");
  annotationRectUnionCache = self->_annotationRectUnionCache;
  self->_annotationRectUnionCache = 0;

  annotationRectsCache = self->_annotationRectsCache;
  self->_annotationRectsCache = 0;

  -[BKHTMLContentViewController setTempOwnerID:](self, "setTempOwnerID:", 0);
  -[IMPerformSelectorProxy teardown](self->_performSelectorProxy, "teardown");
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController dealloc](&v5, "dealloc");
}

- (void)setupNotifications
{
  void *v3;
  id v4;

  if (!self->_areNotificationsSetup)
  {
    self->_areNotificationsSetup = 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "menuWillClose:", UIMenuControllerWillHideMenuNotification, 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "menuDidClose:", UIMenuControllerDidHideMenuNotification, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, BEDocumentExternalLoadApprovalCacheDefaultsClearKey, 0, off_20B940);

  }
}

- (void)teardownNotifications
{
  void *v3;
  id v4;

  if (self->_areNotificationsSetup)
  {
    self->_areNotificationsSetup = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, UIMenuControllerWillHideMenuNotification, 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, UIMenuControllerDidHideMenuNotification, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, BEDocumentExternalLoadApprovalCacheDefaultsClearKey, off_20B940);

  }
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  IMPerformSelectorProxy *performSelectorProxy;
  IMPerformSelectorProxy *v4;
  IMPerformSelectorProxy *v5;

  performSelectorProxy = self->_performSelectorProxy;
  if (!performSelectorProxy)
  {
    v4 = (IMPerformSelectorProxy *)objc_msgSend(objc_alloc((Class)IMPerformSelectorProxy), "initWithTarget:", self);
    v5 = self->_performSelectorProxy;
    self->_performSelectorProxy = v4;

    performSelectorProxy = self->_performSelectorProxy;
  }
  return performSelectorProxy;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapGesture;
  void *v7;
  BKActivityIndicatorOverlayView *v8;
  void *v9;
  void *v10;
  void *v11;
  BKActivityIndicatorOverlayView *v12;
  BKActivityIndicatorOverlayView *activityIndicator;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "preloadContentViewController:highPriority:") & 1) != 0)
    objc_msgSend(v4, "preloadContentViewController:highPriority:", self, 1);
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
  tapGesture = self->_tapGesture;
  self->_tapGesture = v5;

  -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
  objc_msgSend(v3, "addGestureRecognizer:", self->_tapGesture);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController themePage](self, "themePage"));
  v8 = [BKActivityIndicatorOverlayView alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentTextColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColorForTraitEnvironment:", self));
  v12 = -[BKActivityIndicatorOverlayView initWithBackgroundColor:foregroundColor:](v8, "initWithBackgroundColor:foregroundColor:", v10, v11);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v12;

  -[WKWebView setBe_textInteractionAssistantDelegate:](self->_webView2, "setBe_textInteractionAssistantDelegate:", self);
  if (-[BKHTMLContentViewController supportsNotesAndHighlights](self, "supportsNotesAndHighlights"))
    -[WKWebView setBe_textInteractionDelegate:](self->_webView2, "setBe_textInteractionDelegate:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKHTMLContentViewController;
  -[BKHTMLContentViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[BKHTMLContentViewController setupNotifications](self, "setupNotifications");
  -[BKHTMLContentViewController _refreshAnnotationsAndSearchResult](self, "_refreshAnnotationsAndSearchResult");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKHTMLContentViewController stopActivityIndicator:](self, "stopActivityIndicator:");
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  -[BKHTMLContentViewController teardownNotifications](self, "teardownNotifications");
  -[BKHTMLContentViewController clearCurrentHighlighting](self, "clearCurrentHighlighting");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[BKHTMLContentViewController setHighlightViews:](self, "setHighlightViews:", 0);
  -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:](self, "_updateReadingStateVisibilityPossible:", 0);
}

- (void)startActivityIndicatorAfterDelay:(double)a3
{
  -[BKHTMLContentViewController setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 1, 1, a3);
}

- (void)stopActivityIndicator:(BOOL)a3
{
  -[BKHTMLContentViewController setActivityIndicatorVisible:animated:afterDelay:](self, "setActivityIndicatorVisible:animated:afterDelay:", 0, a3, 0.0);
}

- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v6 = a4;
  if (a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v9, "contentViewController:hostViewForActivityIndicator:") & 1) != 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentViewController:hostViewForActivityIndicator:", self, self->_activityIndicator));

      v11 = (id)v10;
    }
    else
    {
      v11 = v12;
    }
    v13 = v11;
    -[BKActivityIndicatorOverlayView showIndicatorCenteredInView:animated:animationDelay:](self->_activityIndicator, "showIndicatorCenteredInView:animated:animationDelay:", v11, v6, a5);

  }
  else
  {
    -[BKActivityIndicatorOverlayView hideIndicatorAnimated:animationDelay:](self->_activityIndicator, "hideIndicatorAnimated:animationDelay:", a4, a5);
  }
}

- (void)setEstimatedContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  _QWORD v7[2];
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController setEstimatedContentSize:](&v8, "setEstimatedContentSize:");
  *(CGFloat *)v7 = width;
  *(CGFloat *)&v7[1] = height;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v7, "{CGSize=dd}"));
  -[WKWebView setBe_estimatedContentSizeValue:](self->_webView2, "setBe_estimatedContentSizeValue:", v6);

}

- (void)setTheme:(id)a3
{
  -[BKHTMLContentViewController setTheme:force:](self, "setTheme:force:", a3, 0);
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8 || v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)BKHTMLContentViewController;
    -[BKContentViewController setTheme:force:](&v13, "setTheme:force:", v6, v4);
    if (self->_highlightRenderingController)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
      -[AEHighlightRenderingController setAnnotationBlendMode:](self->_highlightRenderingController, "setAnnotationBlendMode:", objc_msgSend(v9, "annotationBlendMode"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
      -[AEHighlightRenderingController setPageTheme:](self->_highlightRenderingController, "setPageTheme:", objc_msgSend(v10, "annotationPageTheme"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
      if ((objc_msgSend(v11, "shouldInvertContent") & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
        -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", objc_msgSend(v12, "isScroll") ^ 1);

      }
      else
      {
        -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", 0);
      }

    }
  }
  -[BKHTMLContentViewController invalidateContentBasedOverlay](self, "invalidateContentBasedOverlay");

}

- (void)setNeedsRestyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController setNeedsRestyle](&v3, "setNeedsRestyle");
  self->_underlinePercent = 0.0;
  -[BKHTMLContentViewController invalidateContentBasedOverlayCache](self, "invalidateContentBasedOverlayCache");
}

- (int64_t)effectivePageOffset
{
  if (-[BKContentViewController pageProgressionDirection](self, "pageProgressionDirection") == 1
    && -[BKHTMLContentViewController _isDoubleWide](self, "_isDoubleWide")
    && -[BKContentViewController pageOffset](self, "pageOffset") >= 1)
  {
    return -[BKContentViewController pageOffset](self, "pageOffset") - 1;
  }
  else
  {
    return -[BKContentViewController pageOffset](self, "pageOffset");
  }
}

- (void)playFirstVisibleAutoplayMediaObject
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.playFirstAutoplayMedia();")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webView"));
  objc_msgSend(v4, "evaluateJavaScript:completionHandler:", v5, 0);

}

- (void)didChangeLocationClosing:(BOOL)a3
{
  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded", a3))
    -[BKHTMLContentViewController playFirstVisibleAutoplayMediaObject](self, "playFirstVisibleAutoplayMediaObject");
  else
    self->_shouldAutoplay = 1;
}

- (void)reload
{
  id v2;

  v2 = -[WKWebView reload](self->_webView2, "reload");
}

- (id)arrayOfVisibleRectsFromRects:(id)a3
{
  return a3;
}

- (id)arrayOfVisibleRectsFromRects:(id)a3 contentRect:(CGRect)a4
{
  return a3;
}

- (void)setHighlightViews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    -[BKHTMLContentViewController clearHighlights](self, "clearHighlights");
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController setHighlightViews:](&v5, "setHighlightViews:", v4);

}

- (void)highlightSearchLocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController highlightSearchLocation:](&v5, "highlightSearchLocation:", v4);
  if (-[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v4)
    && -[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    -[BKHTMLContentViewController _highlightLocation:withHighlightType:owner:](self, "_highlightLocation:withHighlightType:owner:", v4, -[BKContentViewController selectionHighlightType](self, "selectionHighlightType"), v4);
  }

}

- (void)clearSearchLocation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController clearSearchLocation](&v3, "clearSearchLocation");
  -[BKHTMLContentViewController clearSelectionHighlights](self, "clearSelectionHighlights");
}

- (void)clearHighlightsForSearchResults
{
  -[BKContentViewController setSearchLocation:](self, "setSearchLocation:", 0);
  -[BKHTMLContentViewController setHighlightViews:](self, "setHighlightViews:", 0);
}

- (void)drawHighlights
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "highlightLayers"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController __highlightContainerView](self, "__highlightContainerView"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer", (_QWORD)v13));
        objc_msgSend(v12, "addSublayer:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)clearHighlights
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_highlightsFRC, "fetchedObjects", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationUuid"));
        objc_msgSend(v9, "removeHighlightForData:", v10);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)preservedSelectionHighlights
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews"));
    v7 = objc_msgSend(v6, "copy");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          -[NSMutableArray removeObject:](self->super._highlightViews, "removeObject:", v13, (_QWORD)v15);
          objc_msgSend(v5, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)highlightAnnotations:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
    v8 = objc_msgSend(v7, "isAddingHighlights");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
      objc_msgSend(v9, "setAddingHighlights:", 1);

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = v4;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            -[BKHTMLContentViewController _highlightAnnotation:](self, "_highlightAnnotation:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), (_QWORD)v16);
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
      objc_msgSend(v15, "setAddingHighlights:", 0);

    }
  }

}

- (double)underlinePercent
{
  double result;
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFDictionary *v7;
  const __CTFontDescriptor *v8;
  const __CTFontDescriptor *v9;
  const __CTFont *v10;
  double Ascent;
  double v12;

  result = self->_underlinePercent;
  if (result == 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "style"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontFamily"));

    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v6, kCTFontFamilyNameAttribute));
    v8 = CTFontDescriptorCreateWithAttributes(v7);
    if (!v8 || (v9 = v8, v10 = CTFontCreateWithFontDescriptor(v8, 0.0, 0), CFRelease(v9), !v10))
      v10 = CTFontCreateWithName(v6, 0.0, 0);
    Ascent = CTFontGetAscent(v10);
    v12 = Ascent + CTFontGetDescent(v10);
    self->_underlinePercent = CTFontGetAscent(v10) / v12;
    if (v10)
      CFRelease(v10);

    return self->_underlinePercent;
  }
  return result;
}

- (BOOL)_isCachedAnnotationRectVisible:(id)a3 considerEntirePage:(BOOL)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  BOOL IsNull;
  id v20;
  CGRect v21;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    objc_msgSend(v7, "contentRectForVisiblePage");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webViewProxy](self, "webViewProxy"));
    objc_msgSend(v7, "contentRectForVisibleContent");
  }
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;

  v20 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController arrayOfVisibleRectsFromRects:contentRect:](self, "arrayOfVisibleRectsFromRects:contentRect:", v16, v12, v13, v14, v15));
  v21.origin.x = BKUnionRects(v17);
  IsNull = CGRectIsNull(v21);

  return !IsNull;
}

- (void)_highlightAnnotation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "isAnnotationDeleted") & 1) == 0
    || (objc_msgSend(v4, "isAnnotationDeleted") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1E4E4;
    v13[3] = &unk_1BEAD8;
    objc_copyWeak(&v15, &location);
    v6 = v4;
    v14 = v6;
    v7 = objc_retainBlock(v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    v9 = objc_msgSend(v8, "isScroll");

    if (v9)
    {
      ((void (*)(_QWORD *, uint64_t))v7[2])(v7, 1);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationLocation"));
      if (v10
        && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache")),
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10)),
            v11,
            v12))
      {
        if ((-[BKContentViewController pageOffset](self, "pageOffset") & 0x8000000000000000) == 0
          && -[BKContentViewController pageOffset](self, "pageOffset") != 0x7FFFFFFFFFFFFFFFLL
          && -[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v5))
        {
          ((void (*)(_QWORD *, BOOL))v7[2])(v7, -[BKHTMLContentViewController _isCachedAnnotationRectVisible:considerEntirePage:](self, "_isCachedAnnotationRectVisible:considerEntirePage:", v12, 0));
        }
      }
      else
      {
        -[BKHTMLContentViewController isLocationVisible:annotation:completion:](self, "isLocationVisible:annotation:completion:", v5, v6, v7);
        v12 = 0;
      }

    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

- (void)_highlightAnnotation:(id)a3 rects:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  BKHTMLContentViewController *v35;
  id v36;
  id v37;
  int v38;

  v31 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "annotationUuid"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "highlightWithData:", v8));

  v10 = (id)v9;
  if (!v9)
  {
    v10 = objc_alloc_init((Class)AEHighlight);
    objc_msgSend(v10, "setAnnotation:", v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    objc_msgSend(v10, "setLines:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lines", v31));
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &stru_1BEF38);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  v14 = objc_msgSend(v13, "isVerticalDocument");

  if (v14)
  {
    if (-[BKContentViewController pageProgressionDirection](self, "pageProgressionDirection") == 1)
      v15 = 2;
    else
      v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
  v17 = objc_msgSend(v16, "isScroll");

  if (v17)
    v18 = v6;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController arrayOfVisibleRectsFromRects:](self, "arrayOfVisibleRectsFromRects:", v6));
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lines"));
  v21 = objc_msgSend(v20, "mutableCopy");

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1E80C;
  v33[3] = &unk_1BEF80;
  v22 = v10;
  v34 = v22;
  v35 = self;
  v38 = v15;
  v23 = v19;
  v36 = v23;
  v24 = v21;
  v37 = v24;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v33);
  objc_msgSend(v22, "setLines:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
  v26 = v25;
  if (v9)
  {
    objc_msgSend(v25, "updatedHighlight:", v22);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "annotationUuid"));
    objc_msgSend(v26, "addHighlight:forData:", v22, v27);

  }
  -[BKHTMLContentViewController drawHighlights](self, "drawHighlights");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  v29 = objc_opt_respondsToSelector(v28, "contentViewControllerAnnotationCacheDidChange:");

  if ((v29 & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    objc_msgSend(v30, "contentViewControllerAnnotationCacheDidChange:", self);

  }
}

- (void)_highlightAnnotationWK2:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionRects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
  if (!v7)
  {
    if (!v6)
      goto LABEL_8;
    v9 = 0;
LABEL_7:
    -[BKHTMLContentViewController _highlightAnnotation:rects:](self, "_highlightAnnotation:rects:", v4, v6);
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectsCache](self, "annotationRectsCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (v6)
    goto LABEL_7;
  if (v9)
  {
    -[BKHTMLContentViewController _highlightAnnotation:rects:](self, "_highlightAnnotation:rects:", v4, v9);
    goto LABEL_14;
  }
LABEL_8:
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webViewProxy](self, "webViewProxy"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1EC5C;
    v14[3] = &unk_1BEFA8;
    objc_copyWeak(&v18, &location);
    v15 = v7;
    v16 = v4;
    v17 = v5;
    objc_msgSend(v10, "clientRectsForLocation:completion:", v17, v14);

    objc_destroyWeak(&v18);
  }
  else
  {
    v11 = _AEAnnotationLocationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "_highlightAnnotationWK2 nil location.", v13, 2u);
    }

  }
  v9 = 0;
LABEL_14:

  objc_destroyWeak(&location);
}

- (BOOL)currentlyHighlighting
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewControllerDummyAnnotation dummyLocation2](self->_highlightDummyAnnotation, "dummyLocation2"));
  v3 = v2 != 0;

  return v3;
}

- (void)_showAnnotations:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (-[BKHTMLContentViewController supportsNotesAndHighlights](self, "supportsNotesAndHighlights"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
      objc_msgSend(v6, "layoutIfNeeded");

      if (v3)
        v10 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController preservedSelectionHighlights](self, "preservedSelectionHighlights"));
      else
        v10 = 0;
      -[BKHTMLContentViewController setHighlightViews:](self, "setHighlightViews:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_highlightsFRC, "fetchedObjects"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationType == %d"), 2));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v8));

      -[BKHTMLContentViewController highlightAnnotations:](self, "highlightAnnotations:", v9);
      if (objc_msgSend(v10, "count"))
        -[NSMutableArray addObjectsFromArray:](self->super._highlightViews, "addObjectsFromArray:", v10);
      -[BKHTMLContentViewController drawHighlights](self, "drawHighlights");

    }
  }
}

- (void)removeHighlightForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("owner == %@"), v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v6));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[BKContentViewController removeHighlightView:](self, "removeHighlightView:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationUuid"));
  objc_msgSend(v14, "removeHighlightForData:", v15);

}

- (void)_annotationChanged:(id)a3 forceRender:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "ordinal");
    if (v7 == (id)-[BKContentViewController ordinal](self, "ordinal"))
    {
      v8 = _AEAnnotationLocationLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationUuid"));
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "_annotationChanged for %@", buf, 0xCu);

      }
      if (objc_msgSend(v6, "annotationType") == 2)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationUuid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("owner == %@"), v11, 0));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v12));

        v15 = _AEAnnotationLocationLog();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationUuid"));
          *(_DWORD *)buf = 138412546;
          v30 = v17;
          v31 = 2112;
          v32 = v14;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "_annotationChanged for %@ found views: %@", buf, 0x16u);

        }
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v18 = v14;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v25;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(v18);
              -[BKContentViewController removeHighlightView:](self, "removeHighlightView:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v22));
              v22 = (char *)v22 + 1;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v20);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6));
        -[BKHTMLContentViewController highlightAnnotations:](self, "highlightAnnotations:", v23);

      }
    }
  }

}

- (void)_refreshAnnotationsAndSearchResult
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController searchLocation](self, "searchLocation"));
    -[BKHTMLContentViewController _showAnnotations:](self, "_showAnnotations:", v3 == 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController searchLocation](self, "searchLocation"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController searchLocation](self, "searchLocation"));
      -[BKHTMLContentViewController highlightSearchLocation:](self, "highlightSearchLocation:", v5);

    }
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v6, "contentViewControllerAnnotationsDidChange:") & 1) != 0)
      objc_msgSend(v6, "contentViewControllerAnnotationsDidChange:", self);

  }
}

- (void)_highlightLocation:(id)a3 withHighlightType:(int)a4 owner:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  BKHTMLContentViewController *v13;
  id v14;
  id v15;
  int v16;
  id location;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webViewProxy](self, "webViewProxy"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1F5B4;
    v11[3] = &unk_1BEFF8;
    objc_copyWeak(&v15, &location);
    v12 = v8;
    v13 = self;
    v16 = a4;
    v14 = v9;
    objc_msgSend(v10, "clientRectsForLocation:completion:", v12, v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    -[BKHTMLContentViewController clearSelection](self, "clearSelection");
  }

}

- (id)_highlightRects:(id)a3 withHighlightType:(int)a4 owner:(id)a5 forWK2:(BOOL)a6 clearSelection:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v9;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  float v20;
  void *i;
  double v22;
  double v23;
  double v24;
  double v25;
  double x;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  BKTextHighlightView *v34;
  double v35;
  void *v36;
  float v38;
  _BOOL4 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CGRect v45;

  v7 = a7;
  v39 = a6;
  v9 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v11, "count")));
  -[WKWebView be_scale](self->_webView2, "be_scale");
  v15 = v14;
  if (v7)
    -[BKHTMLContentViewController clearSelection](self, "clearSelection");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v41;
    v20 = v15;
    v38 = v20;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i), "CGRectValue");
        v23 = v22;
        v25 = v24;
        -[BKHTMLContentViewController _originPointForPoint:](self, "_originPointForPoint:");
        x = v45.origin.x;
        v27 = v15 * v23;
        v28 = v15 * v25;
        v30 = v15 + v29;
        v45.origin.y = v15 + v29;
        v45.size.width = v27;
        v45.size.height = v15 * v25;
        v31 = v15 + v15;
        v32 = v15 * 3.0;
        if (CGRectGetHeight(v45) <= v15 * 19.0)
        {
          v33 = objc_msgSend(v16, "count");
          if ((unint64_t)v33 <= 1)
            v31 = v15 + v15;
          else
            v31 = v15;
          if ((unint64_t)v33 <= 1)
            v32 = v15 * 3.0;
          else
            v32 = v15 + v15;
        }
        v34 = -[BKTextHighlightView initWithFrame:]([BKTextHighlightView alloc], "initWithFrame:", x - v15 * 3.0, v30 - v31, v15 * 3.0 + v15 * 3.0 + v27, v28 + v31 + v32);
        -[BKTextHighlightView setHighlightType:](v34, "setHighlightType:", v9);
        -[BKTextHighlightView setOwner:](v34, "setOwner:", v12);
        *(float *)&v35 = v38;
        -[BKTextHighlightView setCurrentScale:](v34, "setCurrentScale:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
        -[BKTextHighlightView setLightenBlend:](v34, "setLightenBlend:", objc_msgSend(v36, "shouldInvertContent"));

        -[BKTextHighlightView setContentInsets:](v34, "setContentInsets:", v31, v15 * 3.0, v32, v15 * 3.0);
        -[BKContentViewController addHighlightView:forWK2:](self, "addHighlightView:forWK2:", v34, v39);
        objc_msgSend(v13, "addObject:", v34);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v18);
  }

  return v13;
}

- (id)highlightRangeFromRects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BEJavascriptUtilities collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:](BEJavascriptUtilities, "collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:", v4, objc_msgSend(v5, "isVerticalDocument")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _highlightRects:withHighlightType:owner:forWK2:clearSelection:](self, "_highlightRects:withHighlightType:owner:forWK2:clearSelection:", v6, -[BKContentViewController selectionHighlightType](self, "selectionHighlightType"), 0, 1, 1));
  return v7;
}

- (void)clearSelectionHighlights
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];

  v13.receiver = self;
  v13.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController clearSelectionHighlights](&v13, "clearSelectionHighlights");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[BKContentViewController removeHighlightView:](self, "removeHighlightView:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (id)highlightViewContainerWK2
{
  return 0;
}

- (id)selectedAnnotation
{
  id tempOwnerID;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  tempOwnerID = self->_tempOwnerID;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(tempOwnerID, v4) & 1) == 0)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_highlightsFRC, "fetchedObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "annotationUuid"));
        v12 = objc_msgSend(v11, "isEqualToString:", self->_tempOwnerID);

        if (v12)
        {
          v13 = v10;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)_contentRectForLocation:(id)a3 visible:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void (**v41)(_QWORD);
  void *v42;
  void (**v43)(_QWORD, double);
  double v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  BKHTMLContentViewController *v48;
  id v49;
  id v50;
  BOOL v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  void *v55;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_opt_class(BKPageLocation);
  v11 = BUDynamicCast(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    -[BKHTMLContentViewController rectForLocation:adjustedForContentOffset:](self, "rectForLocation:adjustedForContentOffset:", v12, 0);
    v54[0] = v13;
    v54[1] = v14;
    v54[2] = v15;
    v54[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v54, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
    v55 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
    -[BKHTMLContentViewController _contentRectFromRects:visible:](self, "_contentRectFromRects:visible:", v18, v6);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v27 = objc_retainBlock(v9);
    v28 = v27;
    if (v27)
      (*((void (**)(id, double, double, double, double))v27 + 2))(v27, v20, v22, v24, v26);
  }
  else
  {
    objc_opt_class(BKEpubLocation);
    v30 = BUDynamicCast(v29, v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v28 = v31;
    if (v31
      && (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "jsonObject")), v32, v32))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_20444;
      v52[3] = &unk_1BF020;
      v53 = v9;
      objc_msgSend(v33, "clientRectForEpubLocation:completion:", v28, v52);

      v34 = v53;
    }
    else
    {
      objc_opt_class(BKEpubCFILocation);
      v36 = BUDynamicCast(v35, v8);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cfiString"));
      if (v34
        && (v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache")),
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v37)),
            v38,
            v39))
      {
        if (v6)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectsCache](self, "annotationRectsCache"));
          v41 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v37));

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController arrayOfVisibleRectsFromRects:](self, "arrayOfVisibleRectsFromRects:", v41));
          v43 = (void (**)(_QWORD, double))objc_retainBlock(v9);
          if (v43)
          {
            v44 = BKUnionRects(v42);
            v43[2](v43, v44);
          }

        }
        else
        {
          v41 = (void (**)(_QWORD))objc_retainBlock(v9);
          if (v41)
          {
            objc_msgSend(v39, "CGRectValue");
            v41[2](v41);
          }
        }

      }
      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webViewProxy](self, "webViewProxy"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_204C0;
        v46[3] = &unk_1BF048;
        v47 = v34;
        v48 = self;
        v49 = v37;
        v51 = v6;
        v50 = v9;
        objc_msgSend(v45, "clientRectsForLocation:completion:", v8, v46);

      }
    }

  }
}

- (CGRect)_contentRectFromRects:(id)a3 visible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a4;
  v6 = a3;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = objc_msgSend(v6, "count");
  if (v4)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController arrayOfVisibleRectsFromRects:](self, "arrayOfVisibleRectsFromRects:", v6));
      x = BKUnionRects(v12);
      y = v13;
      width = v14;
      height = v15;

    }
  }
  else if (v11)
  {
    x = BKUnionRects(v6);
    y = v16;
    width = v17;
    height = v18;
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)contentRectForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  void *v24;
  id v25;
  NSObject *v26;
  Class v27;
  NSString *v28;
  void *v29;
  id v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  int v35;
  void *v36;

  v6 = a3;
  v7 = a4;
  objc_opt_class(BKEpubCFILocation);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
    || (objc_opt_class(BKEpubLocation), (objc_opt_isKindOfClass(v6, v9) & 1) != 0))
  {
    -[BKHTMLContentViewController _contentRectForLocation:visible:completion:](self, "_contentRectForLocation:visible:completion:", v6, 0, v7);
  }
  else
  {
    objc_opt_class(BKPageLocation);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      -[BKHTMLContentViewController rectForLocation:](self, "rectForLocation:", v6);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v19 = objc_retainBlock(v7);
      v24 = v19;
      if (v19)
      {
        v20.n128_u64[0] = v12;
        v21.n128_u64[0] = v14;
        v22.n128_u64[0] = v16;
        v23.n128_u64[0] = v18;
        (*((void (**)(__n128, __n128, __n128, __n128))v19 + 2))(v20, v21, v22, v23);
      }
    }
    else
    {
      v25 = _AECaptureLocationLog();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_opt_class(v6);
        v28 = NSStringFromClass(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v35 = 138412290;
        v36 = v29;

      }
      v30 = objc_retainBlock(v7);
      v24 = v30;
      if (v30)
      {
        v31.n128_u64[0] = *(_QWORD *)&CGRectZero.origin.x;
        v32.n128_u64[0] = *(_QWORD *)&CGRectZero.origin.y;
        v33.n128_u64[0] = *(_QWORD *)&CGRectZero.size.width;
        v34.n128_u64[0] = *(_QWORD *)&CGRectZero.size.height;
        (*((void (**)(__n128, __n128, __n128, __n128))v30 + 2))(v31, v32, v33, v34);
      }
    }

  }
}

- (void)contentRectForAnnotation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "location"));
  -[BKHTMLContentViewController _contentRectForLocation:visible:completion:](self, "_contentRectForLocation:visible:completion:", v7, 0, v6);

}

- (CGRect)rectForLocation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[BKHTMLContentViewController rectForLocation:adjustedForContentOffset:](self, "rectForLocation:adjustedForContentOffset:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectForLocation:(id)a3 adjustedForContentOffset:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v4 = a4;
  v6 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  objc_opt_class(BKAnchorLocation);
  if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anchorFrameForAnchor:", v12));

    if (v14)
    {
      objc_msgSend(v14, "rectValue");
      x = v15;
      y = v16;
      width = v17;
      height = v18;
    }

LABEL_7:
    if (v4)
    {
LABEL_8:
      -[BKHTMLContentViewController _originPointForPoint:](self, "_originPointForPoint:", x, y);
      x = v28;
      y = v29;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_opt_class(BKPageLocation);
  if ((objc_opt_isKindOfClass(v6, v19) & 1) == 0)
  {
    if (!v4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v20 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  v22 = objc_msgSend(v20, "pageOffset");

  objc_msgSend(v21, "rectForPageOffset:", v22);
  x = v23;
  y = v24;
  width = v25;
  height = v26;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
  LODWORD(v21) = objc_msgSend(v27, "isScroll");

  if (!(_DWORD)v21)
    goto LABEL_7;
LABEL_9:

  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)rectForLocation:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  BKHTMLContentViewController *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_20B34;
  v6[3] = &unk_1BF070;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[BKHTMLContentViewController _contentRectForLocation:visible:completion:](v7, "_contentRectForLocation:visible:completion:", a3, 0, v6);

}

- (void)visibleRectForLocation:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  BKHTMLContentViewController *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_20C78;
  v6[3] = &unk_1BF070;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[BKHTMLContentViewController _contentRectForLocation:visible:completion:](v7, "_contentRectForLocation:visible:completion:", a3, 1, v6);

}

- (BOOL)isRectVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v8;
  CGRect v9;

  v8 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController arrayOfVisibleRectsFromRects:](self, "arrayOfVisibleRectsFromRects:", v5, v8));
  v9.origin.x = BKUnionRects(v6);
  LOBYTE(self) = CGRectIsNull(v9);

  return self ^ 1;
}

- (id)_annotationUuidIntersectingPoint:(CGPoint)a3 inView:(id)a4 annotationLayerRect:(CGRect *)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unsigned int v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  y = a3.y;
  x = a3.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "layer"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "highlightLayers"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "convertPoint:fromLayer:", v9, x, y);
        v17 = v16;
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
        v21 = objc_msgSend(v20, "layer:containsHighlightAtPoint:", v15, v17, v19);

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController highlightRenderingController](self, "highlightRenderingController"));
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "annotationUuidForHighlightLayer:", v15));

          if (a5)
          {
            objc_msgSend(v15, "bounds");
            v24 = v23;
            v26 = v25;
            v28 = v27;
            v30 = v29;
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layer"));
            objc_msgSend(v15, "convertRect:toLayer:", v32, v24, v26, v28, v30);
            a5->origin.x = v33;
            a5->origin.y = v34;
            a5->size.width = v35;
            a5->size.height = v36;

          }
          goto LABEL_12;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_12:

  return v12;
}

- (void)handleTap:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "retrieveAndClearSelectionRectValue"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "CGRectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[BKHTMLContentViewController becomeFirstResponder](self, "becomeFirstResponder");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation"));
    v15 = +[BKBookViewController useEnhancedEditMenu](BKBookViewController, "useEnhancedEditMenu");
    if (v14)
    {
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
        objc_msgSend(v17, "locationInView:", v16);
        -[BKHTMLContentViewController showContextMenuAtLocation:](self, "showContextMenuAtLocation:");

      }
      else
      {
        -[BKHTMLContentViewController showHighlightingMenuForAnnotation:](self, "showHighlightingMenuForAnnotation:", v14);
      }
    }
    else if ((v15 & 1) == 0)
    {
      -[BKHTMLContentViewController _showMenuForRect:](self, "_showMenuForRect:", v7, v9, v11, v13);
    }

  }
}

- (id)_preflightTapLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double width;
  double height;
  CGSize size;
  void *v42;
  CGRect v44;
  CGRect v45;

  y = a3.y;
  x = a3.x;
  if (!+[BKBookViewController useEnhancedEditMenu](BKBookViewController, "useEnhancedEditMenu"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
    v7 = objc_msgSend(v6, "isMenuVisible");

    if ((v7 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitTest:withEvent:", 0, x, y));

      objc_opt_class(BKTextHighlightView);
      v12 = BUDynamicCast(v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (v13)
      {
        *(_QWORD *)&v14 = objc_opt_class(BKLocation).n128_u64[0];
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "owner", v14));
        v18 = BUDynamicCast(v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (v19)
        {
          objc_msgSend(v13, "bounds");
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
          objc_msgSend(v13, "convertRect:toView:", v28, v21, v23, v25, v27);
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;

          -[BKHTMLContentViewController setTempOwnerID:](self, "setTempOwnerID:", v19);
          v37 = v30;
          v38 = v32;
          width = v34;
          height = v36;
LABEL_11:
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v37, v38, width, height));
          goto LABEL_12;
        }
      }
      else
      {
        size = CGRectNull.size;
        v44.origin = CGRectNull.origin;
        v44.size = size;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v42, &v44, x, y));

        if (v19)
        {
          -[BKHTMLContentViewController setTempOwnerID:](self, "setTempOwnerID:", v19);
          v45.origin.x = CGRectNull.origin.x;
          v45.origin.y = CGRectNull.origin.y;
          v45.size.width = CGRectNull.size.width;
          v45.size.height = CGRectNull.size.height;
          if (!CGRectEqualToRect(v44, v45))
          {
            v38 = v44.origin.y;
            v37 = v44.origin.x;
            height = v44.size.height;
            width = v44.size.width;
            goto LABEL_11;
          }
        }
      }
      v8 = 0;
LABEL_12:

      return v8;
    }
  }
  v8 = 0;
  return v8;
}

- (BOOL)preflightTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
  objc_msgSend(v4, "locationInView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _preflightTapLocation:](self, "_preflightTapLocation:"));

  if (v6)
    objc_msgSend(v4, "captureSelectionRectValueForTap:", v6);

  return v6 != 0;
}

- (BOOL)_shouldDoubleTapReceiveTouch:(id)a3
{
  return 0;
}

- (void)removeDummyHighlight
{
  id v3;
  NSObject *v4;
  BKHTMLContentViewControllerDummyAnnotation *highlightDummyAnnotation;
  WebVisiblePosition *highlightWordStart;
  WebVisiblePosition *highlightWordEnd;
  WebVisiblePosition *highlightLastPos;
  BKHTMLContentViewControllerDummyAnnotation *v9;
  void *v10;
  NSTimer *highlightTimer;
  int v12;
  BKHTMLContentViewControllerDummyAnnotation *v13;

  if (self->_highlightDummyAnnotation)
  {
    v3 = _AEAnnotationLocationLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      highlightDummyAnnotation = self->_highlightDummyAnnotation;
      v12 = 138412290;
      v13 = highlightDummyAnnotation;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Removing _highlightDummyAnnotation:%@", (uint8_t *)&v12, 0xCu);
    }

    -[BKHTMLContentViewControllerDummyAnnotation setRemoved:](self->_highlightDummyAnnotation, "setRemoved:", 1);
    -[BKHTMLContentViewController removeHighlightForAnnotation:](self, "removeHighlightForAnnotation:", self->_highlightDummyAnnotation);
    highlightWordStart = self->_highlightWordStart;
    self->_highlightWordStart = 0;

    highlightWordEnd = self->_highlightWordEnd;
    self->_highlightWordEnd = 0;

    highlightLastPos = self->_highlightLastPos;
    self->_highlightLastPos = 0;

    self->_highlightStartPoint2 = CGPointZero;
    v9 = self->_highlightDummyAnnotation;
    self->_highlightDummyAnnotation = 0;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("BKHTMLContentViewControllerDummyAnnotationUUID"));

    self->_highlightCancelled = 0;
    -[NSTimer invalidate](self->_highlightTimer, "invalidate");
    highlightTimer = self->_highlightTimer;
    self->_highlightTimer = 0;

  }
}

- (void)_scheduleInteractionReset
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_resetInteractionTracking", 0);
  -[BKHTMLContentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_resetInteractionTracking", 0, 0.25);
}

- (void)_resetInteractionTracking
{
  self->_haveDeterminedInitialModifiers = 0;
  self->_initialTextInteractionModifiers = 0;
}

- (BOOL)_shouldBeginCustomHighlighterActionForTouchType:(int64_t)a3 modifierFlags:(int64_t)initialTextInteractionModifiers
{
  unint64_t v4;

  if (a3 == 3)
  {
    if (self->_haveDeterminedInitialModifiers)
    {
      initialTextInteractionModifiers = self->_initialTextInteractionModifiers;
    }
    else
    {
      self->_haveDeterminedInitialModifiers = 1;
      self->_initialTextInteractionModifiers = initialTextInteractionModifiers;
    }
    v4 = ((unint64_t)initialTextInteractionModifiers >> 20) & 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  -[BKHTMLContentViewController _scheduleInteractionReset](self, "_scheduleInteractionReset");
  return v4;
}

- (CGPoint)_webkit2LocationForContentViewPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  WKWebView *webView2;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self->_webView2, "be_textInputChild"));
  objc_msgSend(v6, "convertPoint:toView:", self->_webView2, x, y);
  v8 = v7;
  v10 = v9;

  -[WKWebView bounds](self->_webView2, "bounds");
  v11 = v28.origin.x;
  v12 = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  MinX = CGRectGetMinX(v28);
  if (v8 < MinX)
    v8 = MinX;
  v29.origin.x = v11;
  v29.origin.y = v12;
  v29.size.width = width;
  v29.size.height = height;
  MaxX = CGRectGetMaxX(v29);
  if (v8 >= MaxX)
    v8 = MaxX;
  v30.origin.x = v11;
  v30.origin.y = v12;
  v30.size.width = width;
  v30.size.height = height;
  MinY = CGRectGetMinY(v30);
  if (v10 < MinY)
    v10 = MinY;
  v31.origin.x = v11;
  v31.origin.y = v12;
  v31.size.width = width;
  v31.size.height = height;
  MaxY = CGRectGetMaxY(v31);
  if (v10 >= MaxY)
    v10 = MaxY;
  webView2 = self->_webView2;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](webView2, "be_textInputChild"));
  -[WKWebView convertPoint:toView:](webView2, "convertPoint:toView:", v20, v8, v10);
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

- (void)_highlightTimerFired:(id)a3
{
  NSTimer *highlightTimer;

  -[NSTimer invalidate](self->_highlightTimer, "invalidate", a3);
  highlightTimer = self->_highlightTimer;
  self->_highlightTimer = 0;

  if (!self->_highlightCancelled)
  {
    self->_highlightCancelled = 1;
    -[WKWebView be_selectForWebView:](self->_webView2, "be_selectForWebView:", 0);
  }
}

- (double)_timeIntervalForHighlightGesture
{
  void *v2;
  unsigned int v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
  v3 = objc_msgSend(v2, "isScroll");

  result = 0.25;
  if (v3)
    return 0.5;
  return result;
}

- (void)__webView2_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4 isTouch:(BOOL)a5
{
  BKHTMLContentViewControllerDummyAnnotation *highlightDummyAnnotation;
  _BOOL4 v8;
  double y;
  double x;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  char **v15;
  NSTimer *v16;
  NSTimer *highlightTimer;
  void *v18;
  BKHTMLContentViewControllerDummyAnnotation *v19;
  NSTimer *v20;
  BKHTMLContentViewControllerDummyAnnotation *v21;
  BKHTMLContentViewControllerDummyAnnotation *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _BYTE v56[128];

  if ((unint64_t)(a3 - 4) < 2)
  {
    -[BKHTMLContentViewController removeDummyHighlight](self, "removeDummyHighlight", a4.x, a4.y);
    +[UIViewController attemptRotationToDeviceOrientation](UIViewController, "attemptRotationToDeviceOrientation");
    -[BKHTMLContentViewController _resetInteractionTracking](self, "_resetInteractionTracking");
    return;
  }
  if (a3 == 3)
  {
    highlightDummyAnnotation = self->_highlightDummyAnnotation;
    if (highlightDummyAnnotation)
    {
      -[BKHTMLContentViewControllerDummyAnnotation setRemoved:](highlightDummyAnnotation, "setRemoved:", 1, a5, a4.x, a4.y);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_21DCC;
      v55[3] = &unk_1BF098;
      v55[4] = self;
      -[BKHTMLContentViewController _bookmarkSelectionAndAnnotate:showColorEditor:completion:](self, "_bookmarkSelectionAndAnnotate:showColorEditor:completion:", 0, 0, v55);
    }
    +[UIViewController attemptRotationToDeviceOrientation](UIViewController, "attemptRotationToDeviceOrientation", a4.x, a4.y);
    -[BKHTMLContentViewController _resetInteractionTracking](self, "_resetInteractionTracking");
    return;
  }
  v8 = a5;
  y = a4.y;
  x = a4.x;
  -[BKHTMLContentViewController _webkit2LocationForContentViewPoint:](self, "_webkit2LocationForContentViewPoint:");
  v13 = v11;
  v14 = v12;
  v15 = &selRef_setCompletion_;
  if (a3 == 1)
  {
    self->_highlightCancelled = 0;
    self->_highlightStartPoint2.x = v11;
    self->_highlightStartPoint2.y = v12;
    if (v8)
    {
      -[NSTimer invalidate](self->_highlightTimer, "invalidate");
      -[BKHTMLContentViewController _timeIntervalForHighlightGesture](self, "_timeIntervalForHighlightGesture");
      v16 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_highlightTimerFired:", 0, 0));
      highlightTimer = self->_highlightTimer;
      self->_highlightTimer = v16;

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self->_webView2, "be_textInputChild"));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_21DD4;
    v54[3] = &unk_1BEA38;
    v54[4] = self;
    objc_msgSend(v18, "selectTextWithGranularity:atPoint:completionHandler:", 1, v54, v13, v14);

    v19 = self->_highlightDummyAnnotation;
    self->_highlightDummyAnnotation = 0;

  }
  if (v8
    && (v14 - self->_highlightStartPoint2.y) * (v14 - self->_highlightStartPoint2.y)
     + (v13 - self->_highlightStartPoint2.x) * (v13 - self->_highlightStartPoint2.x) < 113.2096)
  {
    if (self->_highlightDummyAnnotation)
    {
      self->_highlightCancelled = 1;
      -[BKHTMLContentViewController removeDummyHighlight](self, "removeDummyHighlight");
    }
    return;
  }
  -[NSTimer invalidate](self->_highlightTimer, "invalidate");
  v20 = self->_highlightTimer;
  self->_highlightTimer = 0;

  if (!self->_highlightCancelled && !self->_highlightDummyAnnotation)
  {
    v21 = objc_alloc_init(BKHTMLContentViewControllerDummyAnnotation);
    v22 = self->_highlightDummyAnnotation;
    self->_highlightDummyAnnotation = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self->_webView2, "be_textInputChild"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
    objc_msgSend(v23, "convertPoint:toView:", v24, x, y);
    v26 = v25;
    v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "hitTest:withEvent:", 0, v26, v28));

    objc_opt_class(BKTextHighlightView);
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
    {
      if ((objc_opt_respondsToSelector(v30, "owner") & 1) != 0)
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "owner"));
      else
        v32 = 0;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v33, 0, v26, v28));

    }
    objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v32, v34) & 1) != 0)
    {
      v48 = v30;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_highlightsFRC, "fetchedObjects"));
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v51;
LABEL_25:
        v39 = 0;
        while (1)
        {
          if (*(_QWORD *)v51 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "annotationUuid"));
          v42 = objc_msgSend(v41, "isEqualToString:", v32);

          if ((v42 & 1) != 0)
            break;
          if (v37 == (id)++v39)
          {
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
            if (v37)
              goto LABEL_25;
            goto LABEL_31;
          }
        }
        v43 = v40;

        v15 = &selRef_setCompletion_;
        v30 = v48;
        if (!v43)
          goto LABEL_34;
        -[BKHTMLContentViewControllerDummyAnnotation setAnnotationStyle:](self->_highlightDummyAnnotation, "setAnnotationStyle:", objc_msgSend(v43, "annotationStyle"));
        v44 = objc_msgSend(v43, "annotationIsUnderline");
        goto LABEL_35;
      }
LABEL_31:

      v15 = &selRef_setCompletion_;
      v30 = v48;
    }
LABEL_34:
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[BKHTMLContentViewControllerDummyAnnotation setAnnotationStyle:](self->_highlightDummyAnnotation, "setAnnotationStyle:", objc_msgSend(v45, "integerForKey:", BKDefaultHighlightColor[0]));

    v43 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v44 = objc_msgSend(v43, "BOOLForKey:", BKDefaultUnderlineState);
LABEL_35:
    -[BKHTMLContentViewControllerDummyAnnotation setAnnotationIsUnderline:](self->_highlightDummyAnnotation, "setAnnotationIsUnderline:", v44);

  }
  v46 = *((int *)v15 + 900);
  if (self->_highlightDummyAnnotation
    || objc_msgSend(*(id *)&self->super.super.IMViewController_opaque[v46], "be_hasSelectablePositionAtPoint:", v13, v14))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.super.IMViewController_opaque[v46], "be_textInputChild"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_21E00;
    v49[3] = &unk_1BEA88;
    v49[4] = self;
    objc_msgSend(v47, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", 1, v49, v13, v14);

  }
}

- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
  -[BKHTMLContentViewController __webView2_performHighlighterActionWithGestureState:location:isTouch:](self, "__webView2_performHighlighterActionWithGestureState:location:isTouch:", a3, 1, a4.x, a4.y);
}

- (void)_handleStylusGesture:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self->_webView2, "be_textInputChild"));
  objc_msgSend(v4, "locationInView:", v10);
  v7 = v6;
  v9 = v8;

  -[BKHTMLContentViewController __webView2_performHighlighterActionWithGestureState:location:isTouch:](self, "__webView2_performHighlighterActionWithGestureState:location:isTouch:", v5, 0, v7, v9);
}

- (void)_willMoveTextRangeExtentAtPoint:(CGPoint)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3.x, a3.y));
  if ((objc_opt_respondsToSelector(v4, "contentViewControllerIgnoreNextSwipe:") & 1) != 0)
    objc_msgSend(v4, "contentViewControllerIgnoreNextSwipe:", self);

}

- (BOOL)_hasDraggableSelectionAtPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_webSelectionRects](self->_webView2, "be_webSelectionRects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "rect");
        v15.x = x;
        v15.y = y;
        if (CGRectContainsPoint(v16, v15))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)shouldHighlightReceiveTouch:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;

  v4 = a3;
  if (-[UIGestureRecognizer state](self->_indirectHighlightRecognizer, "state") == UIGestureRecognizerStatePossible
    && !-[UILongPressGestureRecognizer state](self->_indirectImmediateHighlightRecognizer, "state"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView](self, "webView"));
    objc_msgSend(v4, "locationInView:", v7);
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    v13 = (unint64_t)objc_msgSend(v12, "layout");

    if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v7, "bounds");
      v18 = v14;
      v19 = v15;
      v20 = v16;
      v21 = v17;
      if (v13 == 3)
      {
        if (v11 >= CGRectGetMinY(*(CGRect *)&v14) + -20.0)
        {
          v30.origin.x = v18;
          v30.origin.y = v19;
          v30.size.width = v20;
          v30.size.height = v21;
          if (v11 <= CGRectGetMaxY(v30) + 20.0)
            goto LABEL_14;
        }
      }
      else
      {
        if (v13 != 2)
          goto LABEL_14;
        if (v9 >= CGRectGetMinX(*(CGRect *)&v14) + -20.0)
        {
          v29.origin.x = v18;
          v29.origin.y = v19;
          v29.size.width = v20;
          v29.size.height = v21;
          if (v9 <= CGRectGetMaxX(v29) + 20.0)
            goto LABEL_14;
        }
      }
      v5 = 0;
LABEL_15:

      goto LABEL_4;
    }
LABEL_14:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "be_textInputChild"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
    objc_msgSend(v24, "convertPoint:toView:", v23, v9, v11);
    v26 = v25;
    v28 = v27;

    v5 = objc_msgSend(v23, "hasSelectablePositionAtPoint:", v26, v28);
    goto LABEL_15;
  }
  v5 = 0;
LABEL_4:

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UILongPressGestureRecognizer *v6;
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  unsigned __int8 v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;

  v6 = (UILongPressGestureRecognizer *)a3;
  v7 = a4;
  if (self->_indirectImmediateHighlightRecognizer != v6)
    goto LABEL_3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
  objc_msgSend(v7, "locationInView:", v12);
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v17, 0, v14, v16));

  if (v18)
  {
    v11 = 0;
  }
  else
  {
LABEL_3:
    if ((UILongPressGestureRecognizer *)self->_indirectHighlightRecognizer == v6
      || self->_indirectImmediateHighlightRecognizer == v6)
    {
      v11 = -[BKHTMLContentViewController shouldHighlightReceiveTouch:](self, "shouldHighlightReceiveTouch:", v7);
    }
    else if ((UILongPressGestureRecognizer *)self->_doubleTapGesture == v6
           && -[BKHTMLContentViewController _shouldDoubleTapReceiveTouch:](self, "_shouldDoubleTapReceiveTouch:", v7)
           || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view")),
               objc_opt_class(BKTextHighlightView),
               isKindOfClass = objc_opt_isKindOfClass(v8, v9),
               v8,
               (isKindOfClass & 1) != 0))
    {
      v11 = 1;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      objc_msgSend(v7, "locationInView:", v19);
      v21 = v20;
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v24, 0, v21, v23));

      v11 = v25 != 0;
    }
  }

  return v11;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_tapGesture == a3)
    return -[BKHTMLContentViewController preflightTap:](self, "preflightTap:");
  else
    return 1;
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  id v11;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if (!-[BKHTMLContentViewController supportsExpandedContent](self, "supportsExpandedContent")
    || self->_tapGesture == v6
    && (objc_opt_class(UITapGestureRecognizer), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
  {
    v9 = 0;
  }
  else if (self->_doubleTapGesture == v6
         && (objc_opt_class(UITapGestureRecognizer), (objc_opt_isKindOfClass(v7, v10) & 1) != 0))
  {
    v11 = v7;
    v9 = objc_msgSend(v11, "numberOfTapsRequired") != (char *)&dword_0 + 2
      || objc_msgSend(v11, "numberOfTouchesRequired") != (char *)&dword_0 + 1;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)nextResponder
{
  id v3;
  void *v4;
  objc_super v6;

  if (-[BKHTMLContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    v6.receiver = self;
    v6.super_class = (Class)BKHTMLContentViewController;
    v3 = -[BKHTMLContentViewController nextResponder](&v6, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)menuWillClose:(id)a3
{
  -[BKHTMLContentViewController setTempOwnerID:](self, "setTempOwnerID:", 0);
  -[BKHTMLContentViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)showHighlightingMenuForAnnotation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "contentViewController:showHighlightingMenuForAnnotation:") & 1) != 0)
    objc_msgSend(v4, "contentViewController:showHighlightingMenuForAnnotation:", self, v5);

}

- (void)_showMenuForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!+[BKBookViewController useEnhancedEditMenu](BKBookViewController, "useEnhancedEditMenu"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
    objc_msgSend(v9, "showMenuFromView:rect:", v8, x, y, width, height);

  }
}

- (void)selectLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WKWebView *webView2;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_opt_class(BKEpubCFILocation);
  v9 = BUDynamicCast(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    objc_initWeak(&location, self);
    webView2 = self->_webView2;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cfiString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.setSelectedRange('%@')"), v12));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_22890;
    v14[3] = &unk_1BF0E8;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    -[WKWebView evaluateJavaScript:completionHandler:](webView2, "evaluateJavaScript:completionHandler:", v13, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)selectAnnotation:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
  -[BKHTMLContentViewController selectLocation:completion:](self, "selectLocation:completion:", v4, 0);

}

- (AEHighlightRenderingController)highlightRenderingController
{
  AEHighlightRenderingController *highlightRenderingController;
  AEHighlightRenderingController *v4;
  AEHighlightRenderingController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  highlightRenderingController = self->_highlightRenderingController;
  if (!highlightRenderingController)
  {
    v4 = (AEHighlightRenderingController *)objc_alloc_init((Class)AEHighlightRenderingController);
    v5 = self->_highlightRenderingController;
    self->_highlightRenderingController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
    -[AEHighlightRenderingController setAnnotationBlendMode:](self->_highlightRenderingController, "setAnnotationBlendMode:", objc_msgSend(v6, "annotationBlendMode"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
    -[AEHighlightRenderingController setPageTheme:](self->_highlightRenderingController, "setPageTheme:", objc_msgSend(v7, "annotationPageTheme"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
    if ((objc_msgSend(v8, "shouldInvertContent") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
      -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", objc_msgSend(v9, "isScroll") ^ 1);

    }
    else
    {
      -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", 0);
    }

    -[AEHighlightRenderingController setCanUseFilters:](self->_highlightRenderingController, "setCanUseFilters:", 1);
    highlightRenderingController = self->_highlightRenderingController;
  }
  return highlightRenderingController;
}

- (BOOL)supportsNotesAndHighlights
{
  return 0;
}

- (BOOL)canCopyContent
{
  void *v2;
  void *v3;
  unsigned int v5;
  void *v6;
  unsigned int v7;

  v5 = -[AEBookInfo isProtected](self->super._book, "isProtected");
  if (v5
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientApplicationController")),
        !objc_msgSend(v3, "allowCitationForProtectedBooks")))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sampleContent](self->super._book, "sampleContent"));
    v7 = objc_msgSend(v6, "BOOLValue") ^ 1;

    if (!v5)
      return v7;
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned int v7;
  unsigned int v8;
  id tempOwnerID;
  uint64_t v10;
  int isKindOfClass;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  char v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v29;
  unsigned __int8 v30;
  char v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  unsigned int v38;
  int v39;
  objc_super v40;
  _QWORD v41[5];

  v6 = a4;
  v7 = -[BKHTMLContentViewController hasTextSelected](self, "hasTextSelected");
  v8 = -[WKWebView be_hasSelection](self->_webView2, "be_hasSelection");
  tempOwnerID = self->_tempOwnerID;
  objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(tempOwnerID, v10);
  v12 = self->_tempOwnerID;
  objc_opt_class(BKLocation);
  v14 = objc_opt_isKindOfClass(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedText](self, "selectedText"));
  v16 = (void *)v15;
  v17 = isKindOfClass ^ 1;
  if (((isKindOfClass ^ 1) & 1) == 0 && (v14 & 1) == 0 && (v7 & v8 & 1) == 0)
  {
    v38 = v8;
    v39 = v14;
    v18 = (void *)v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotations](self, "annotations"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_23010;
    v41[3] = &unk_1BF110;
    v41[4] = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v41));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filteredArrayUsingPredicate:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));

    if (v22)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "annotationSelectedText"));

      v7 = 1;
    }
    else
    {
      v16 = v18;
    }

    v8 = v38;
    v14 = v39;
  }
  if ("selectAnnotation:" == a3)
  {
    if (((v17 | v7) & 1) != 0)
      goto LABEL_35;
LABEL_23:
    v23 = -[BKHTMLContentViewController supportsNotesAndHighlights](self, "supportsNotesAndHighlights");
    goto LABEL_24;
  }
  if ("selectBookmarkedLink:" == a3)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    v26 = objc_msgSend(v25, "currentSelectionContainsAnchor");
LABEL_26:
    v24 = v26;
LABEL_27:

    goto LABEL_36;
  }
  if ("annotateSelection:" == a3)
  {
    if (-[BKHTMLContentViewController supportsNotesAndHighlights](self, "supportsNotesAndHighlights"))
    {
      v24 = v14 | v8;
      if (((v14 | v8 | v17) & 1) != 0)
        goto LABEL_36;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "annotationNote"));
      v24 = objc_msgSend(v27, "length") == 0;

      goto LABEL_27;
    }
LABEL_35:
    v24 = 0;
    goto LABEL_36;
  }
  if ("bookmarkSelection:" == a3)
  {
    if (((v14 | v8) & 1) == 0)
      goto LABEL_35;
    goto LABEL_23;
  }
  if ("lookupSelection:" == a3)
  {
    if (((v14 | v7) & 1) != 0)
    {
      v24 = (unint64_t)objc_msgSend(v16, "tokenCountWithEnumerationOptions:maxTokenCount:outLimitLength:", 3, 4, 0) < 4;
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if ("searchUsingSelection:" == a3 || "books_useSelectionForFind:" == a3)
  {
    v24 = v14 | v7;
    goto LABEL_36;
  }
  if ("translateSelection:" == a3)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v30 = +[BKBookViewController areCitationsAllowedForBook:](BKBookViewController, "areCitationsAllowedForBook:", v29);

    v24 = v7 & v30;
    goto LABEL_36;
  }
  if ("shareSelection:" != a3 && "_share:" != a3 && "copyContent:" != a3 && "copy:" != a3)
  {
    if ("endOfBook:" != a3)
    {
      v40.receiver = self;
      v40.super_class = (Class)BKHTMLContentViewController;
      v23 = -[BKHTMLContentViewController canPerformAction:withSender:](&v40, "canPerformAction:withSender:", a3, v6);
LABEL_24:
      v24 = v23;
      goto LABEL_36;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v26 = objc_msgSend(v25, "BOOLForKey:", CFSTR("BKAllowEndOfBookDebugMenu"));
    goto LABEL_26;
  }
  v31 = v14 | v7;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v33 = +[BKBookViewController areCitationsAllowedForBook:](BKBookViewController, "areCitationsAllowedForBook:", v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    v36 = objc_msgSend(v35, "isAnnotationSharingSupportedForContentViewController:", self);

  }
  else
  {
    v36 = 1;
  }

  v24 = v31 & v33 & v36;
  if ("shareSelection:" != a3 && "_share:" != a3)
  {
    if ("copyContent:" == a3 || "copy:" == a3)
      v24 = v33;
    else
      v24 = 0;
  }
LABEL_36:

  return v24 & 1;
}

- (void)endOfBook:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "contentViewController:setEndOfBookToLocation:range:");

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_23140;
    v7[3] = &unk_1BF138;
    objc_copyWeak(&v8, &location);
    -[BKHTMLContentViewController _contentForSelectedRangeWithCompletion:](self, "_contentForSelectedRangeWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)lookupSelection:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id location[2];
  CGRect v42;

  v4 = a3;
  objc_initWeak(location, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_2365C;
  v39[3] = &unk_1BF188;
  objc_copyWeak(&v40, location);
  v5 = objc_retainBlock(v39);
  v6 = self->_tempOwnerID;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_237CC;
  v35[3] = &unk_1BF1D8;
  v35[4] = self;
  objc_copyWeak(&v38, location);
  v7 = v6;
  v36 = v7;
  v8 = v5;
  v37 = v8;
  v9 = objc_retainBlock(v35);
  if (-[BKHTMLContentViewController hasTextSelected](self, "hasTextSelected"))
  {
    ((void (*)(_QWORD *))v9[2])(v9);
  }
  else
  {
    v32 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _payloadForKey:fromSender:](self, "_payloadForKey:fromSender:", CFSTR("lookUpTerm"), v4));
    if (objc_msgSend(v10, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotations](self, "annotations"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_23A7C;
      v33[3] = &unk_1BF110;
      v34 = v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v33));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v12));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "annotationLocation"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));
      objc_msgSend(v16, "CGRectValue");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      v42.origin.x = v18;
      v42.origin.y = v20;
      v42.size.width = v22;
      v42.size.height = v24;
      if (CGRectIsEmpty(v42))
      {
        -[BKHTMLContentViewController rectForPresentedMenuForTextInteraction](self, "rectForPresentedMenuForTextInteraction");
        v18 = v25;
        v20 = v26;
        v22 = v27;
        v24 = v28;
      }
      v29 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v18, v20, v22, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_contentView](self->_webView2, "be_contentView"));
      objc_msgSend(v30, "addSubview:", v29);

      ((void (*)(_QWORD *, void *, id, uint64_t))v8[2])(v8, v10, v29, 1);
    }
    else
    {
      ((void (*)(_QWORD *))v9[2])(v9);
    }

    v4 = v32;
  }

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

}

- (id)_rectsFromDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("top")));
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("left")));
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("width")));
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("height")));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v15, v12, v18, v21));
        objc_msgSend(v4, "addObject:", v22);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)translateSelection:(id)a3
{
  void *v4;
  char v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "contentViewController:showTranslateForText:fromView:onClose:");

  if ((v5 & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_23D6C;
    v6[3] = &unk_1BF200;
    v6[4] = self;
    -[BKHTMLContentViewController _contentForSelectedRangeWithCompletion:](self, "_contentForSelectedRangeWithCompletion:", v6);
  }
}

- (void)dummyAnnotationForSelectionWK2WithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKHTMLContentViewController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_23F84;
  v4[3] = &unk_1BF228;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKHTMLContentViewController _contentForSelectedRangeWithCompletion:](v5, "_contentForSelectedRangeWithCompletion:", v4);

}

- (void)searchUsingSelection:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_24534;
  v5[3] = &unk_1BF250;
  objc_copyWeak(&v6, &location);
  -[BKHTMLContentViewController _extractSelectedTextWithSender:completion:](self, "_extractSelectedTextWithSender:completion:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_extractSelectedTextWithSender:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void ***v8;
  void *v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  BKHTMLContentViewController *v16;
  id v17;

  v6 = a3;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_246FC;
  v15 = &unk_1BF2A0;
  v16 = self;
  v7 = a4;
  v17 = v7;
  v8 = objc_retainBlock(&v12);
  if (-[BKHTMLContentViewController hasTextSelected](self, "hasTextSelected", v12, v13, v14, v15, v16))
  {
    ((void (*)(void ***))v8[2])(v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _payloadForKey:fromSender:](self, "_payloadForKey:fromSender:", CFSTR("searchTerm"), v6));
    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_retainBlock(v7);
      v11 = v10;
      if (v10)
        (*((void (**)(id, void *))v10 + 2))(v10, v9);

    }
    else
    {
      ((void (*)(void ***))v8[2])(v8);
    }

  }
}

- (void)books_useSelectionForFind:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_248D8;
  v5[3] = &unk_1BF250;
  objc_copyWeak(&v6, &location);
  -[BKHTMLContentViewController _extractSelectedTextWithSender:completion:](self, "_extractSelectedTextWithSender:completion:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_share:(id)a3
{
  -[BKHTMLContentViewController shareSelection:](self, "shareSelection:", a3);
}

- (void)shareSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedAnnotation](self, "selectedAnnotation"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_24BD8;
    v8[3] = &unk_1BF2F0;
    v8[4] = self;
    v9 = v6;
    -[BKHTMLContentViewController visibleRectForLocation:completion:](self, "visibleRectForLocation:completion:", v7, v8);

  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_24B74;
    v10[3] = &unk_1BF2C8;
    objc_copyWeak(&v11, &location);
    -[BKHTMLContentViewController dummyAnnotationForSelectionWK2WithCompletion:](self, "dummyAnnotationForSelectionWK2WithCompletion:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)_shareAnnotation:(id)a3 annotationRects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "contentViewController:shareAnnotation:annotationRects:completion:");

  if ((v9 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_24DB4;
    v11[3] = &unk_1BF318;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "contentViewController:shareAnnotation:annotationRects:completion:", self, v6, v7, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_bookmarkSelectionAndAnnotate:(BOOL)a3 showColorEditor:(BOOL)a4
{
  -[BKHTMLContentViewController _bookmarkSelectionAndAnnotate:showColorEditor:completion:](self, "_bookmarkSelectionAndAnnotate:showColorEditor:completion:", a3, a4, 0);
}

- (void)_bookmarkSelectionAndAnnotate:(BOOL)a3 showColorEditor:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;
  id location;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v9, "clearSearchResultForContentViewController:") & 1) != 0)
    objc_msgSend(v9, "clearSearchResultForContentViewController:", self);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_24F3C;
  v11[3] = &unk_1BF390;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  v14 = a3;
  v15 = a4;
  -[BKHTMLContentViewController _contentForSelectedRangeWithCompletion:](self, "_contentForSelectedRangeWithCompletion:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_combineAnnotation:(id)a3 withAnnotation:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13 != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "annotationNote"));
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotationNote"));
      if (objc_msgSend(v9, "length"))
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "annotationNote"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\n%@"), v9, v10));

        v9 = (void *)v10;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "annotationNote"));
      }

      objc_msgSend(v6, "setAnnotationNote:", v11);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    objc_msgSend(v12, "deleteAnnotation:", v13);

  }
}

- (void)_showAnnotationWithState:(BOOL)a3 showColorEditor:(BOOL)a4 forAnnotation:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[BKHTMLContentViewController clearSelection](self, "clearSelection");
  v9 = objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  v10 = (void *)v9;
  if (v6)
  {
    if ((objc_opt_respondsToSelector(v9, "contentViewController:showNoteForAnnotation:") & 1) != 0)
      objc_msgSend(v10, "contentViewController:showNoteForAnnotation:", self, v8);
  }
  else
  {
    if (v5)
      -[BKHTMLContentViewController showHighlightingMenuForAnnotation:](self, "showHighlightingMenuForAnnotation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
    v14 = 0;
    v12 = objc_msgSend(v11, "save:", &v14);
    v13 = v14;

    if ((v12 & 1) == 0 && v13)
      NSLog(CFSTR("Error Saving Annotation MOC: %@"), v13);
    if ((objc_opt_respondsToSelector(v10, "paginationUpdateRequiredForContentViewController:") & 1) != 0)
      objc_msgSend(v10, "paginationUpdateRequiredForContentViewController:", self);

  }
}

- (void)bookmarkSelection:(id)a3
{
  -[BKHTMLContentViewController _bookmarkSelectionAndAnnotate:showColorEditor:](self, "_bookmarkSelectionAndAnnotate:showColorEditor:", 0, 1);
}

- (void)annotateSelection:(id)a3
{
  -[BKHTMLContentViewController _bookmarkSelectionAndAnnotate:showColorEditor:](self, "_bookmarkSelectionAndAnnotate:showColorEditor:", 1, 1);
}

- (void)selectBookmarkedLink:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader", a3));
  v5 = objc_msgSend(v4, "currentSelectionContainsAnchor");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
    objc_msgSend(v6, "evaluateJavaScript:completionHandler:", CFSTR("__ibooks_content_support.clickFirstAnchorInSelection()"), 0);

  }
}

- (void)_contentForSelectedRangeWithCompletion:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  WKWebView *v11;
  id v12;
  id v13;
  WKWebView *v14;
  _QWORD v15[4];
  id v16;
  WKWebView *v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  *(_QWORD *)&v5 = objc_opt_class(BKEpubCFILocation).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController tempOwnerID](self, "tempOwnerID", v5));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  objc_initWeak(&location, self);
  v11 = self->_webView2;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_25E24;
  v15[3] = &unk_1BF3E0;
  objc_copyWeak(&v19, &location);
  v12 = v4;
  v18 = v12;
  v13 = v10;
  v16 = v13;
  v14 = v11;
  v17 = v14;
  -[WKWebView evaluateJavaScript:completionHandler:](v14, "evaluateJavaScript:completionHandler:", CFSTR("__ibooks_cfi_utilities.getSelectedRange()"), v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)copy:(id)a3
{
  -[BKHTMLContentViewController copyContent:](self, "copyContent:", a3);
}

- (void)copyContent
{
  _QWORD v3[4];
  Block_layout *v4;
  id v5;
  id location;

  if (-[BKHTMLContentViewController canCopyContent](self, "canCopyContent"))
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_26334;
    v3[3] = &unk_1BF448;
    objc_copyWeak(&v5, &location);
    v4 = &stru_1BF420;
    -[BKHTMLContentViewController dummyAnnotationForSelectionWK2WithCompletion:](self, "dummyAnnotationForSelectionWK2WithCompletion:", v3);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  return 0;
}

- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  objc_msgSend(v8, "pageOffsetRangeForLocation:completion:", v7, v6);

}

- (BOOL)isLocationFromThisDocument:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "ordinal");
  if (v5 == (id)-[BKContentViewController ordinal](self, "ordinal"))
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class(BKAnchorPathLocation);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "href"));
      v6 = objc_msgSend(v8, "isEqualToString:", v10);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  if (-[BKContentViewController pageOffset](self, "pageOffset") < 0
    || -[BKContentViewController pageOffset](self, "pageOffset") == 0x7FFFFFFFFFFFFFFFLL
    || !-[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v4))
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    objc_opt_class(BKEpubCFILocation);
    v6 = BUDynamicCast(v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentVisbleCFILocation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cfi"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cfi"));
      v12 = objc_msgSend(v10, "rangeIntersectsCFI:", v11);

    }
    else
    {
      v12 = 0;
    }
    v14 = _AEAnnotationLocationLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentVisbleCFILocation"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
      v19 = 138412802;
      v20 = v17;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "isLocationOnCurrentPage: currentVisibleCFI:%@ forLocation:%@ isVisible:%@", (uint8_t *)&v19, 0x20u);

    }
  }

  return (char)v12;
}

- (void)isLocationVisible:(id)a3 annotation:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  if (-[BKContentViewController pageOffset](self, "pageOffset") < 0
    || -[BKContentViewController pageOffset](self, "pageOffset") == 0x7FFFFFFFFFFFFFFFLL
    || !-[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v7))
  {
    v9 = objc_retainBlock(v8);
    v10 = v9;
    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_267A4;
    v11[3] = &unk_1BF070;
    v12 = v7;
    v13 = v8;
    -[BKHTMLContentViewController visibleRectForLocation:completion:](self, "visibleRectForLocation:completion:", v12, v11);

  }
}

- (BOOL)isAnnotationVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _BOOL4 v13;
  unsigned __int8 v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v7 = -[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v6);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationLocation"));
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
          if (objc_msgSend(v11, "isScroll"))
            v12 = objc_msgSend(v5, "annotationType") == 1;
          else
            v12 = 0;
          v14 = -[BKHTMLContentViewController _isCachedAnnotationRectVisible:considerEntirePage:](self, "_isCachedAnnotationRectVisible:considerEntirePage:", v10, v12);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v13) = 1;
            goto LABEL_15;
          }
          -[BKHTMLContentViewController cachedVisibleRectForAnnotation:](self, "cachedVisibleRectForAnnotation:", v5);
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24.origin.x = CGRectZero.origin.x;
          v24.origin.y = CGRectZero.origin.y;
          v24.size.width = CGRectZero.size.width;
          v24.size.height = CGRectZero.size.height;
          v26.origin.x = v16;
          v26.origin.y = v18;
          v26.size.width = v20;
          v26.size.height = v22;
          if (!CGRectEqualToRect(v24, v26))
          {
            v25.origin.x = v16;
            v25.origin.y = v18;
            v25.size.width = v20;
            v25.size.height = v22;
            v13 = !CGRectIsNull(v25);
            goto LABEL_15;
          }
        }
      }
      else
      {
        v10 = 0;
      }
      LOBYTE(v13) = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  LOBYTE(v13) = 0;
LABEL_16:

  return v13;
}

- (CGRect)cachedRectForAnnotation:(id)a3
{
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  v5 = v4;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v11 = -[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v10);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationLocation"));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

        if (v14)
        {
          objc_msgSend(v14, "rectValue");
          x = v15;
          y = v16;
          width = v17;
          height = v18;

        }
      }

    }
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
{
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  v5 = v4;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v11 = -[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v10);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationLocation"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectsCache](self, "annotationRectsCache"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

      if (objc_msgSend(v14, "count"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController arrayOfVisibleRectsFromRects:](self, "arrayOfVisibleRectsFromRects:", v14));
        x = BKUnionRects(v15);
        y = v16;
        width = v17;
        height = v18;

      }
    }
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)_isDoubleWide
{
  return 0;
}

- (int64_t)totalPages
{
  return 1;
}

- (int64_t)visiblePageCount
{
  unsigned int v3;
  int64_t v4;

  if (!-[BKHTMLContentViewController _isDoubleWide](self, "_isDoubleWide"))
    return 1;
  v3 = -[BKContentViewController pageProgressionDirection](self, "pageProgressionDirection");
  if (v3 == 1)
  {
    if (-[BKContentViewController pageOffset](self, "pageOffset") <= 0)
      return 1;
  }
  else
  {
    if (v3)
      return 1;
    v4 = -[BKHTMLContentViewController totalPages](self, "totalPages");
    if (v4 < -[BKContentViewController pageOffset](self, "pageOffset") + 2)
      return 1;
  }
  return 2;
}

- (void)setOrdinal:(int64_t)a3
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHTMLContentViewController;
  if (-[BKContentViewController ordinal](&v6, "ordinal") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKHTMLContentViewController;
    -[BKContentViewController setOrdinal:](&v5, "setOrdinal:", a3);
    -[BKContentViewController setTotalPages:](self, "setTotalPages:", -1);
    -[BKContentViewController setContentLoaded:](self, "setContentLoaded:", 0);
    -[BKContentViewController setContentLoadPending:](self, "setContentLoadPending:", 0);
    -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:](self, "_updateReadingStateVisibilityPossible:", 0);
  }
}

- (id)currentLocation
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController contentView](self, "contentView"));
  if (v3
    && (v4 = (void *)v3, v5 = -[BKContentViewController isContentLoaded](self, "isContentLoaded"), v4, v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentFirstVisbleCFILocation"));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isLoading
{
  return !-[BKContentViewController isContentLoaded](self, "isContentLoaded");
}

- (void)contentReady
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController contentReady](&v5, "contentReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController searchLocation](self, "searchLocation"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController searchLocation](self, "searchLocation"));
    -[BKHTMLContentViewController highlightSearchLocation:](self, "highlightSearchLocation:", v4);

  }
  -[BKHTMLContentViewController _updateReadingState](self, "_updateReadingState");
  if (self->_shouldAutoplay)
  {
    -[BKHTMLContentViewController playFirstVisibleAutoplayMediaObject](self, "playFirstVisibleAutoplayMediaObject");
    self->_shouldAutoplay = 0;
  }
  -[WKWebView setHidden:](self->_webView2, "setHidden:", 0);
}

- (void)suspend
{
  void *v3;
  void *v4;
  id v5;

  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webView"));
    objc_msgSend(v4, "_suspendAllMediaPlayback");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    objc_msgSend(v5, "unregisterForVisibleCFIUpdates");

  }
}

- (void)resume
{
  void *v3;
  void *v4;
  id v5;

  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webView"));
    objc_msgSend(v4, "_resumeAllMediaPlayback");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    objc_msgSend(v5, "registerForVisibleCFIUpdates");

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController prepareForReuse](&v3, "prepareForReuse");
  -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:](self, "_updateReadingStateVisibilityPossible:", 0);
}

- (void)_updateReadingState
{
  -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:knownDOMRange:](self, "_updateReadingStateVisibilityPossible:knownDOMRange:", 1, 0);
}

- (void)_updateReadingStateVisibilityPossible:(BOOL)a3
{
  -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:knownDOMRange:](self, "_updateReadingStateVisibilityPossible:knownDOMRange:", a3, 0);
}

- (void)_updateReadingStateVisibilityPossible:(BOOL)a3 knownDOMRange:(id)a4
{
  _BOOL4 v4;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double width;
  double height;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3, a4));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetViewControllerDelegateForContentViewController:", self));

  v7 = objc_msgSend(v36, "readingStatisticsEnabled");
  v8 = v36;
  if (v7)
  {
    if (v4
      && -[BKContentViewController isContentLoaded](self, "isContentLoaded")
      && -[BKHTMLContentViewController isViewLoaded](self, "isViewLoaded")
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window")),
          v10,
          v9,
          v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
      objc_msgSend(v12, "bounds");
      objc_msgSend(v11, "convertRect:toView:", 0);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v21, "bounds");
      v39.origin.x = v14;
      v39.origin.y = v16;
      v39.size.width = v18;
      v39.size.height = v20;
      v38 = CGRectIntersection(v37, v39);
      width = v38.size.width;
      height = v38.size.height;

      v24 = 0;
      if (width > 0.0 && height > 0.0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentVisbleCFILocation"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ensureRange"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cfiString"));

      }
    }
    else
    {
      v24 = 0;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController visibleCFIString](self, "visibleCFIString"));
    v29 = objc_msgSend(v28, "isEqualToString:", v24);

    if ((v29 & 1) == 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController visibleCFIString](self, "visibleCFIString"));
      v31 = objc_msgSend(v30, "length");

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController visibleCFIString](self, "visibleCFIString"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFISet cfiSetWithCFIString:](BCCFISet, "cfiSetWithCFIString:", v32));

        if (v33)
          objc_msgSend(v36, "assetViewController:willHideContentWithCFIs:", 0, v33);

      }
      -[BKHTMLContentViewController setVisibleCFIString:](self, "setVisibleCFIString:", v24);
      if (objc_msgSend(v24, "length"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController visibleCFIString](self, "visibleCFIString"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFISet cfiSetWithCFIString:](BCCFISet, "cfiSetWithCFIString:", v34));

        if (v35)
          objc_msgSend(v36, "assetViewController:didShowContentWithCFIs:", 0, v35);

      }
    }

    v8 = v36;
  }

}

- (void)clearSelection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController clearSelection](&v3, "clearSelection");
  -[WKWebView be_clearSelection](self->_webView2, "be_clearSelection");
}

- (void)clearSelectedAnnotation
{
  -[BKHTMLContentViewController setTempOwnerID:](self, "setTempOwnerID:", 0);
}

- (BOOL)hasTextSelected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController selectedText](self, "selectedText"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)selectedText
{
  return -[WKWebView be_selectedText](self->_webView2, "be_selectedText");
}

- (id)selectedTextForAccessibility
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTextSelection"));

  return v3;
}

- (void)stopPlayingMedia:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = objc_msgSend(&off_1CD5A0, "mutableCopy");
  v8 = v5;
  if (!a3)
  {
    objc_msgSend(v5, "addObject:", CFSTR("audio"));
    v5 = v8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support._pauseMediaTypes(\"%@\")"), v6));
  -[WKWebView evaluateJavaScript:completionHandler:](self->_webView2, "evaluateJavaScript:completionHandler:", v7, 0);

}

- (void)stopPlayingMediaIfNoLongerVisible
{
  -[WKWebView evaluateJavaScript:completionHandler:](self->_webView2, "evaluateJavaScript:completionHandler:", CFSTR("__ibooks_content_support._pauseMediaTypes(\"audio,video\", true)"), 0);
}

- (void)_setupSelectionContextMenu
{
  id v2;
  id v3;
  id v4;

  v2 = AEBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Last page in this chapter"), &stru_1C3088, 0);

}

- (BOOL)contentNeedsFilter
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
  v3 = objc_msgSend(v2, "shouldInvertContent") ^ 1;

  return v3;
}

- (id)_errorForURL:(id)a3
{
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description", v5));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3 != 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->super._book != 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->super._ordinal));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self->super._book, "databaseKey"));
  if (v9)
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self->super._book, "databaseKey"));
  else
    v10 = CFSTR("<nil>");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookTitle](self->super._book, "bookTitle"));
  if (v11)
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookTitle](self->super._book, "bookTitle"));
  else
    v12 = CFSTR("<nil>");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self->super._book, "bookBundlePath"));
  if (v13)
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self->super._book, "bookBundlePath"));
  else
    v14 = CFSTR("<nil>");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v18, CFSTR("url!=nil"), v7, CFSTR("_book!=nil"), v8, CFSTR("_ordinal"), v10, CFSTR("_book.databaseKey"), v12, CFSTR("_book.bookTitle"), v14, CFSTR("_book.bookBundlePath"), 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, 1, v15));

  if (v13)
  if (v11)

  if (v9)
  return v16;
}

- (id)URLForLoadingDocument
{
  AEBookInfo *book;
  void *v3;
  void *v4;

  book = self->super._book;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo urlForDocument:](book, "urlForDocument:", v3));

  return v4;
}

- (void)load
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  WKWebView *webView2;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController load](&v10, "load");
  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_navigationHandler](self->_webView2, "be_navigationHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView URL](self->_webView2, "URL"));
    -[BKHTMLContentViewController navigationHandler:didFinishLoadOfURL:](self, "navigationHandler:didFinishLoadOfURL:", v3, v4);
LABEL_7:

    goto LABEL_8;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController URLForLoadingDocument](self, "URLForLoadingDocument"));
  if (!v3)
  {
    -[BKContentViewController setContentLoadPending:](self, "setContentLoadPending:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _errorForURL:](self, "_errorForURL:", 0));
    objc_msgSend(v4, "contentViewFailedToLoad:error:", self, v9);

    goto LABEL_7;
  }
  -[BKHTMLContentViewController _recheckRemoveAccessApproval](self, "_recheckRemoveAccessApproval");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView URL](self->_webView2, "URL"));
  v6 = objc_msgSend(v5, "be_isEquivalentToURL:ignoringFragment:", v3, 0);

  if ((v6 & 1) == 0)
  {
    webView2 = self->_webView2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v3));
    v8 = -[WKWebView loadRequest:](webView2, "loadRequest:", v4);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_recheckRemoveAccessApproval
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));

  if (v3)
  {
    if (self->_webView2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheItem"));
      v6 = objc_msgSend(v5, "contentBlockingRule");

      objc_initWeak(&location, self->_webView2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentBlockingRules sharedInstance](BEContentBlockingRules, "sharedInstance"));
      v8 = objc_loadWeakRetained(&location);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_27A3C;
      v9[3] = &unk_1BF470;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v7, "applyContentBlockingRule:toWebView:completion:", v6, v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;
  _QWORD block[5];

  if (off_20B940 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", BEDocumentExternalLoadApprovalCacheDefaultsClearKey, a4, a5))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_27B2C;
      block[3] = &unk_1BEA38;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKHTMLContentViewController;
    -[BKHTMLContentViewController observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;
  CGAffineTransform v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&v11, 0, sizeof(v11));
  self->_isRotating = !CGAffineTransformIsIdentity(&v11);
  v10.receiver = self;
  v10.super_class = (Class)BKHTMLContentViewController;
  -[BKHTMLContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
  -[BKContentViewController setTotalPages:](self, "setTotalPages:", -1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_27C24;
  v9[3] = &unk_1BE8C8;
  v9[4] = self;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v9);

}

- (id)objectForMatchingAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  double MaxX;
  double MaxY;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[2];
  _QWORD v35[2];
  CGRect v36;
  CGRect v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotationLocation")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotationSelectedText")));
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_1C3088;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("text"));

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotationLocation")));
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_1C3088;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("uuid"));

    objc_msgSend(v7, "rectValue");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v35[0] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
    v35[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));

    v36.origin.x = v16;
    v36.origin.y = v18;
    v36.size.width = v20;
    v36.size.height = v22;
    MaxX = CGRectGetMaxX(v36);
    v37.origin.x = v16;
    v37.origin.y = v18;
    v37.size.width = v20;
    v37.size.height = v22;
    MaxY = CGRectGetMaxY(v37);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", MaxX));
    v34[0] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", MaxY));
    v34[1] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));

    if (v25)
      v31 = v25;
    else
      v31 = &__NSArray0__struct;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("startPoint"));
    if (v30)
      v32 = v30;
    else
      v32 = &__NSArray0__struct;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("endPoint"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)writeAnnotationsToWebProcessPlugin:(id)a3 andHighlights:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "be_updateAXValueForMessage:", v7));

  objc_msgSend(v8, "be_updateAXCurrentReadingStateWithMessage:forValue:", CFSTR("BEWebProcessPluginBookmarkStateParameterKey"), v10);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "be_updateAXValueForMessage:", v6));

  objc_msgSend(v13, "be_updateAXCurrentReadingStateWithMessage:forValue:", CFSTR("BEWebProcessPluginAnnotationParameterKey"), v12);
}

- (void)writeControlVisibilityStateToWebProcessPlugin:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "be_updateAXValueForMessage:", v6));
  objc_msgSend(v8, "be_updateAXCurrentReadingStateWithMessage:forValue:", CFSTR("BEWebProcessPluginHasVisibleControlsParameterKey"), v7);

}

- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4
{
  -[BKHTMLContentViewController startActivityIndicatorAfterDelay:](self, "startActivityIndicatorAfterDelay:", a3, a4, 1.0);
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(id, _QWORD);
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v8, "contentViewController:handleUserRequestForFrameToLoadExternalURL:completion:") & 1) != 0)
  {
    objc_msgSend(v8, "contentViewController:handleUserRequestForFrameToLoadExternalURL:completion:", self, v10, v7);
  }
  else
  {
    v9 = (void (**)(id, _QWORD))objc_retainBlock(v7);

    if (v9)
      v9[2](v9, 0);
    v7 = v9;
  }

}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a5;
  v8 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "contentViewController:goToURL:likelyUserInitiated:") & 1) != 0)
    objc_msgSend(v7, "contentViewController:goToURL:likelyUserInitiated:", self, v8, v5);

}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  id v5;
  AEBookInfo *book;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a4;
  book = self->super._book;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo urlForDocument:](book, "urlForDocument:", v7));
  v9 = objc_msgSend(v5, "be_isEquivalentToURL:ignoringFragment:", v8, 0);

  if ((v9 & 1) != 0)
  {
    -[WKWebView setHidden:](self->_webView2, "setHidden:", 1);
  }
  else
  {
    if (-[BKHTMLContentViewController shouldShowExpandedContentForURL:](self, "shouldShowExpandedContentForURL:", v5))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKExpandedContentResource resourceForURL:](BKExpandedContentResource, "resourceForURL:", v5));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cacheItem"));
      objc_msgSend(v10, "setCacheItem:", v12);

      if (BEDoesURLPointToUSDZFile(v5))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteURL"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "standardizedURL"));
        v15 = BEURLHandlerAssetInfoPathForBookURL();
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v10, "setSourceURL:", v16);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
      objc_msgSend(v17, "contentViewController:showExpandedContentForResource:atLocation:", self, v10, 0);

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
      objc_msgSend(v10, "contentViewController:goToURL:likelyUserInitiated:", self, v5, 0);
    }

  }
  return v9;
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v5;

  -[BKContentViewController setTotalPages:](self, "setTotalPages:", -[BKWK2WebViewLoader pageCount](self->_loader, "pageCount", a3, a4));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "contentViewControllerDidFinishLayout:") & 1) != 0)
    objc_msgSend(v5, "contentViewControllerDidFinishLayout:", self);
  -[BKHTMLContentViewController stopActivityIndicator:](self, "stopActivityIndicator:", 1);

}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  void *v4;
  WKWebView *webView2;
  _QWORD v6[4];
  id v7;

  self->_firstSignificantPaintCompleted = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController locationEnsuredFirstPaintWorkBlock](self, "locationEnsuredFirstPaintWorkBlock", a3));
  if (v4)
  {
    -[BKHTMLContentViewController setLocationEnsuredFirstPaintWorkBlock:](self, "setLocationEnsuredFirstPaintWorkBlock:", 0);
    webView2 = self->_webView2;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_28448;
    v6[3] = &unk_1BEC70;
    v7 = v4;
    -[WKWebView _doAfterNextStablePresentationUpdate:](webView2, "_doAfterNextStablePresentationUpdate:", v6);

  }
}

- (void)navigationHandlerWebContentProcessAttemptingReload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  BKHTMLContentViewController *v8;

  v4 = _AEBookPluginsLifeCycleLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Content for %@ Attempting reload", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "contentViewControllerAttemptingReload:") & 1) != 0)
    objc_msgSend(v6, "contentViewControllerAttemptingReload:", self);

}

- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  BKHTMLContentViewController *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;

  v5 = a4;
  -[BKHTMLContentViewController setLoadFailureCount:](self, "setLoadFailureCount:", (char *)-[BKHTMLContentViewController loadFailureCount](self, "loadFailureCount") + 1);
  v6 = _AEBookPluginsLifeCycleLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKHTMLContentViewController loadFailureCount](self, "loadFailureCount")));
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Content for %@ crashed with reason %@ - %@", (uint8_t *)&v10, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v9, "contentViewController:encounteredIssueWithContent:failureCount:") & 1) != 0)
    objc_msgSend(v9, "contentViewController:encounteredIssueWithContent:failureCount:", self, v5, -[BKHTMLContentViewController loadFailureCount](self, "loadFailureCount"));

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BKExpandedContentResource *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double x;
  double v59;
  double y;
  double v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;

  v5 = a4;
  *(_QWORD *)&v6 = objc_opt_class(NSDictionary).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "body", v6));
  v10 = BUDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("showAside")))
  {
    v14 = objc_alloc_init(BKExpandedContentResource);
    *(_QWORD *)&v15 = objc_opt_class(NSString).n128_u64[0];
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("documentURL"), v15));
    v19 = BUDynamicCast(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));
      -[BKExpandedContentResource setSourceURL:](v14, "setSourceURL:", v21);

    }
    *(_QWORD *)&v22 = objc_opt_class(NSString).n128_u64[0];
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("html"), v22));
    v26 = BUDynamicCast(v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[BKExpandedContentResource setResource:](v14, "setResource:", v27);

    *(_QWORD *)&v28 = objc_opt_class(NSString).n128_u64[0];
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title"), v28));
    v32 = BUDynamicCast(v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    -[BKExpandedContentResource setTitle:](v14, "setTitle:", v33);

    *(_QWORD *)&v34 = objc_opt_class(NSString).n128_u64[0];
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("contentType"), v34));
    v38 = BUDynamicCast(v36, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    -[BKExpandedContentResource setContentType:](v14, "setContentType:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    objc_msgSend(v40, "fontSize");
    -[BKExpandedContentResource setZoomScale:](v14, "setZoomScale:");

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "cacheItem"));
    -[BKExpandedContentResource setCacheItem:](v14, "setCacheItem:", v42);

    *(_QWORD *)&v43 = objc_opt_class(NSDictionary).n128_u64[0];
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("rect"), v43));
    v47 = BUDynamicCast(v45, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

    if (v48)
    {
      v72 = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[BEJavascriptUtilities collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:](BEJavascriptUtilities, "collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:", v49, objc_msgSend(v50, "isVerticalDocument")));

      v52 = -[BKHTMLContentViewController _highlightRects:withHighlightType:owner:forWK2:clearSelection:](self, "_highlightRects:withHighlightType:owner:forWK2:clearSelection:", v51, -[BKContentViewController selectionHighlightType](self, "selectionHighlightType"), 0, 1, 0);
      if ((objc_opt_respondsToSelector(v13, "showFootnoteInContentViewController:resource:fromView:stylesheetSet:") & 1) != 0)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->super._highlightViews, "firstObject"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController stylesheetSet](self, "stylesheetSet"));
        objc_msgSend(v13, "showFootnoteInContentViewController:resource:fromView:stylesheetSet:", self, v14, v53, v54);

      }
    }

    goto LABEL_9;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("toggleBookmark")))
  {
    if ((objc_opt_respondsToSelector(v13, "toggleBookmarkForContentViewController:") & 1) != 0)
      objc_msgSend(v13, "toggleBookmarkForContentViewController:", self);
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("toggleControlsVisibility")))
  {
    if ((objc_opt_respondsToSelector(v13, "toggleControlsForContentViewController:") & 1) != 0)
      objc_msgSend(v13, "toggleControlsForContentViewController:", self);
  }
  else
  {
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("showHighlightMenu")))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
      v14 = (BKExpandedContentResource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "be_selectionRects"));

      if (-[BKExpandedContentResource count](v14, "count"))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKExpandedContentResource firstObject](v14, "firstObject"));
        objc_msgSend(v56, "CGRectValue");
        x = v57;
        y = v59;

      }
      else
      {
        x = CGPointZero.x;
        y = CGPointZero.y;
      }
      -[BKHTMLContentViewController showContextMenuAtLocation:](self, "showContextMenuAtLocation:", x, y);
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("turnPage")))
    {
      if ((objc_opt_respondsToSelector(v13, "contentViewController:navigatePageDirection:") & 1) == 0)
        goto LABEL_10;
      *(_QWORD *)&v61 = objc_opt_class(NSString).n128_u64[0];
      v63 = v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("direction"), v61));
      v65 = BUDynamicCast(v63, v64);
      v14 = (BKExpandedContentResource *)objc_claimAutoreleasedReturnValue(v65);

      objc_msgSend(v13, "contentViewController:navigatePageDirection:", self, v14);
      goto LABEL_9;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("checkOperation")))
    {
      -[BKHTMLContentViewController _bkaxCheckCanPerformEditActions](self, "_bkaxCheckCanPerformEditActions");
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("performOperation")))
    {
      *(_QWORD *)&v66 = objc_opt_class(NSString).n128_u64[0];
      v68 = v67;
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("selector"), v66));
      v70 = BUDynamicCast(v68, v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
      -[BKHTMLContentViewController _bkaxPerformEditAction:](self, "_bkaxPerformEditAction:", v71);

    }
  }
LABEL_10:

}

- (BKReadAloudEventHandler)readAloudEventHandler
{
  BKReadAloudEventHandler *readAloudEventHandler;
  void *v4;
  void *v5;
  BKReadAloudEventHandler *v6;
  BKReadAloudEventHandler *v7;

  readAloudEventHandler = self->_readAloudEventHandler;
  if (!readAloudEventHandler)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaActiveClass"));
    v6 = (BKReadAloudEventHandler *)objc_claimAutoreleasedReturnValue(+[BKReadAloudEventHandler readAloudEventHandlerWithMediaClass:delegate:](BKReadAloudEventHandler, "readAloudEventHandlerWithMediaClass:delegate:", v5, self));
    v7 = self->_readAloudEventHandler;
    self->_readAloudEventHandler = v6;

    readAloudEventHandler = self->_readAloudEventHandler;
  }
  return readAloudEventHandler;
}

- (void)_bkaxPerformEditAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  void *v35;
  void *v36;
  unsigned int v37;
  id v38;
  void *v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  v5 = AEBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Select highlight"), &stru_1C3088, 0));
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if (v8)
  {
    v9 = CFSTR("selectAnnotation:");
    goto LABEL_21;
  }
  v10 = AEBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Open link"), &stru_1C3088, 0));
  v13 = objc_msgSend(v4, "isEqualToString:", v12);

  if (v13)
  {
    v9 = CFSTR("selectBookmarkedLink:");
    goto LABEL_21;
  }
  v14 = AEBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Add note"), &stru_1C3088, 0));
  v17 = objc_msgSend(v4, "isEqualToString:", v16);

  if (v17)
  {
    v9 = CFSTR("annotateSelection:");
    goto LABEL_21;
  }
  v18 = AEBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Highlight"), &stru_1C3088, 0));
  v21 = objc_msgSend(v4, "isEqualToString:", v20);

  if (v21)
  {
    v9 = CFSTR("bookmarkSelection:");
    goto LABEL_21;
  }
  v22 = AEBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Lookup"), &stru_1C3088, 0));
  v25 = objc_msgSend(v4, "isEqualToString:", v24);

  if (v25)
  {
    v9 = CFSTR("lookupSelection:");
    goto LABEL_21;
  }
  v26 = AEBundle();
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Search"), &stru_1C3088, 0));
  v29 = objc_msgSend(v4, "isEqualToString:", v28);

  if (v29)
  {
    v9 = CFSTR("searchUsingSelection:");
    goto LABEL_21;
  }
  v30 = AEBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Translate"), &stru_1C3088, 0));
  v33 = objc_msgSend(v4, "isEqualToString:", v32);

  if (v33)
  {
    v9 = CFSTR("translateSelection:");
    goto LABEL_21;
  }
  v34 = AEBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1C3088, 0));
  v37 = objc_msgSend(v4, "isEqualToString:", v36);

  if (v37)
  {
    v9 = CFSTR("copy:");
    goto LABEL_21;
  }
  v38 = AEBundle();
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Share selection"), &stru_1C3088, 0));
  v41 = objc_msgSend(v4, "isEqualToString:", v40);

  if (v41)
  {
    v9 = CFSTR("shareSelection:");
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Debug end of book experience")))
  {
    v9 = CFSTR("endOfBook:");
LABEL_21:
    if (-[BKHTMLContentViewController _bkaxPerformSelector:](self, "_bkaxPerformSelector:", v9))
      goto LABEL_25;
  }
  v42 = BCIMLog();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    sub_11C204((uint64_t)v4, v43, v44, v45, v46, v47, v48, v49);

LABEL_25:
}

- (BOOL)_bkaxPerformSelector:(id)a3
{
  SEL v4;
  char v5;

  v4 = NSSelectorFromString((NSString *)a3);
  v5 = objc_opt_respondsToSelector(self, v4);
  if ((v5 & 1) != 0)
    -[BKHTMLContentViewController performSelector:withObject:](self, "performSelector:withObject:", v4, 0);
  return v5 & 1;
}

- (void)_bkaxCheckCanPerformEditActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;

  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("selectAnnotation:")), 0))
  {
    v3 = AEBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Select highlight"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v5);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("selectBookmarkedLink:")), 0))
  {
    v6 = AEBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Open link"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v8);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("annotateSelection:")), 0))
  {
    v9 = AEBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Add note"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v11);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("bookmarkSelection:")), 0))
  {
    v12 = AEBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Highlight"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v14);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("lookupSelection:")), 0))
  {
    v15 = AEBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Lookup"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v17);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("searchUsingSelection:")), 0))
  {
    v18 = AEBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Search"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v20);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("translateSelection:")), 0))
  {
    v21 = AEBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Translate"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v23);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("copy:")), 0)|| -[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("copyContent:")), 0))
  {
    v24 = AEBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v26);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("shareSelection:")), 0))
  {
    v27 = AEBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Share selection"), &stru_1C3088, 0));
    objc_msgSend(v34, "addObject:", v29);

  }
  if (-[BKHTMLContentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", NSSelectorFromString(CFSTR("endOfBook:")), 0))
  {
    objc_msgSend(v34, "addObject:", CFSTR("Debug end of book experience"));
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView2](self, "webView2"));
  v32 = objc_msgSend(v34, "copy");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "be_updateAXValueForMessage:", v32));
  objc_msgSend(v30, "be_updateAXCurrentReadingStateWithMessage:forValue:", CFSTR("BEWebProcessPluginOperationsParameterKey"), v33);

}

- (void)readAloudEventHandler:(id)a3 foundMediaSource:(id)a4
{
  -[BKHTMLContentViewController setMediaSource:](self, "setMediaSource:", a4);
}

- (void)readAloudEventHandler:(id)a3 tappedElementID:(id)a4 inHref:(id)a5
{
  -[BKHTMLContentViewController _smilElementIDSelected:inHREF:](self, "_smilElementIDSelected:inHREF:", a4, a5);
}

- (void)readAloudEventHandler:(id)a3 performedAction:(id)a4 turnStyle:(id)a5
{
  id v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v7 = a5;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("start")) & 1) != 0)
  {
    v8 = 0;
    v9 = 1;
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("stop")) & 1) != 0)
  {
    v8 = 0;
    v9 = 2;
  }
  else
  {
    v10 = objc_msgSend(v12, "isEqualToString:", CFSTR("startstop"));
    v8 = v10 ^ 1;
    if (v10)
      v9 = 3;
    else
      v9 = 0;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("automatic")) & 1) != 0)
  {
    v11 = 1;
    if ((v8 & 1) != 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("manual")))
    v11 = 2;
  else
    v11 = 0;
  if ((v8 & 1) == 0)
LABEL_15:
    -[BKHTMLContentViewController invokedSMILControlAction:withSMILTurnStyle:](self, "invokedSMILControlAction:withSMILTurnStyle:", v9, v11);
LABEL_16:

}

- (void)readAloudEventHandler:(id)a3 audioElementEnded:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3, a4));
  v6 = objc_opt_respondsToSelector(v5, "resumeReadAloudForContentViewController:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    objc_msgSend(v7, "resumeReadAloudForContentViewController:", self);

  }
}

- (void)installReadAloudClickHandlersOnMediaOverlayElements:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = NSStringFromSelector("elementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController readAloudEventHandler](self, "readAloudEventHandler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "href"));
  objc_msgSend(v7, "installTapHandlersOnElementIDs:withHref:", v10, v9);

}

- (void)removeReadAloudClickHandlersOnMediaOverlayElements:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector("elementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController readAloudEventHandler](self, "readAloudEventHandler"));
  objc_msgSend(v7, "removeTapHandlersOnElementIDs:", v8);

}

- (void)markupDocumentForMediaOverlay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController readAloudEventHandler](self, "readAloudEventHandler"));
  objc_msgSend(v2, "addMarkupForReadAloudToDocument");

}

- (void)cleanDocumentForMediaOverlay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController readAloudEventHandler](self, "readAloudEventHandler"));
  objc_msgSend(v2, "removeMarkupForReadAloudToDocument");

}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  objc_msgSend(v9, "contentViewController:presentAlertController:completion:", self, v8, v7);

}

- (void)handler:(id)a3 webView:(id)a4 didNotHandleTapAsClickAtPoint:(CGPoint)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  y = a5.y;
  x = a5.x;
  v14 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v8, "contentView:unhandledClickAtPoint:") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
    objc_msgSend(v9, "convertPoint:fromView:", v14, x, y);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v8, "contentView:unhandledClickAtPoint:", self, v11, v13);
  }

}

- (id)handler:(id)a3 citationForText:(id)a4 webView:(id)a5
{
  id v6;
  BKHTMLContentViewControllerDummyAnnotation *v7;
  void *v8;

  v6 = a4;
  v7 = objc_alloc_init(BKHTMLContentViewControllerDummyAnnotation);
  -[BKHTMLContentViewControllerDummyAnnotation setAnnotationRepresentativeText:](v7, "setAnnotationRepresentativeText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _excerptCitedStringForAnnotation:](self, "_excerptCitedStringForAnnotation:", v7));
  return v8;
}

- (id)adjustedItemProvidersWithCitation:(id)a3 withExcerptString:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  UTType *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id obj;
  void *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v5 = a3;
  v6 = a4;
  v29 = objc_alloc_init((Class)NSMutableArray);
  v7 = objc_alloc_init((Class)NSItemProvider);
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_29D28;
    v43[3] = &unk_1BF498;
    v44 = v6;
    objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v8, 0, v43);

  }
  v28 = v6;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    v12 = UTTypeImage;
    v30 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      v31 = v10;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[UTType identifier](v12, "identifier", v28));
        v16 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v15);

        if ((v16 & 1) == 0)
        {
          v33 = v13;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "registeredTypeIdentifiers"));
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(_QWORD *)v36 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
                LODWORD(v22) = objc_msgSend(v22, "isEqualToString:", v23);

                if ((_DWORD)v22)
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
                  v34[0] = _NSConcreteStackBlock;
                  v34[1] = 3221225472;
                  v34[2] = sub_29D88;
                  v34[3] = &unk_1BF498;
                  v34[4] = v14;
                  objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v24, 0, v34);

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            }
            while (v19);
          }

          v12 = UTTypeImage;
          v11 = v30;
          v10 = v31;
          v13 = v33;
        }
        v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v10);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "registeredTypeIdentifiers"));
  v26 = objc_msgSend(v25, "count");

  if (v26)
    objc_msgSend(v29, "addObject:", v7);

  return v29;
}

- (BOOL)shouldShowExpandedContentForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  if (!a3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bc_pathWithoutPrecedingSlash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByRemovingURLFragment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentAtPath:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentOrdinal"));
  if (objc_msgSend(v8, "integerValue") == (id)-1)
  {
    v10 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nonlinearElement"));
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  return v10;
}

- (void)_smilElementIDSelected:(id)a3 inHREF:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  char v24;
  BKHTMLContentViewController *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v27 = a4;
  v25 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mediaOverlayElements"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v29;
LABEL_3:
    v12 = 0;
    v26 = v10;
    while (1)
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "elementId"));
      if ((objc_msgSend(v14, "isEqualToString:", v6) & 1) != 0)
      {
        v15 = v11;
        v16 = v6;
        v17 = v9;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "documentHref"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastPathComponent"));
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        v9 = v17;
        v6 = v16;
        v11 = v15;
        v10 = v26;

        if ((v21 & 1) != 0)
        {
          v10 = v13;

          if (v10)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](v25, "delegate"));
            v24 = objc_opt_respondsToSelector(v23, "contentView:didSelectMediaOverlayElement:");

            if ((v24 & 1) != 0)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](v25, "delegate"));
              objc_msgSend(v22, "contentView:didSelectMediaOverlayElement:", v25, v10);
              goto LABEL_16;
            }
          }
          goto LABEL_17;
        }
      }
      else
      {

      }
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }
  v22 = v9;
LABEL_16:

LABEL_17:
}

- (void)invokedSMILControlAction:(int)a3 withSMILTurnStyle:(int)a4
{
  void *v7;
  unsigned int v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  char v13;
  _BOOL8 v14;
  char v15;
  unsigned int v16;
  void *v17;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v8 = objc_msgSend(v7, "hasMediaOverlayElements");

  v9 = v17;
  if (!v8)
    goto LABEL_20;
  v10 = objc_opt_respondsToSelector(v17, "contentViewController:setTurnState:");
  v11 = v17;
  if ((v10 & 1) != 0)
  {
    if (a4 == 1)
    {
      v12 = 1;
    }
    else
    {
      if (a4 != 2)
        goto LABEL_8;
      v12 = 0;
    }
    objc_msgSend(v17, "contentViewController:setTurnState:", self, v12);
    v11 = v17;
  }
LABEL_8:
  v13 = objc_opt_respondsToSelector(v11, "contentViewController:setReadAloudState:");
  v9 = v17;
  if ((v13 & 1) != 0)
  {
    switch(a3)
    {
      case 1:
        v14 = 1;
        goto LABEL_19;
      case 3:
        v15 = objc_opt_respondsToSelector(v17, "contentViewControllerReadAloudState");
        v9 = v17;
        if ((v15 & 1) != 0)
        {
          v16 = objc_msgSend(v17, "contentViewControllerReadAloudState");
          v9 = v17;
          if ((v16 & 0x80000000) != 0)
            break;
        }
        else
        {
          v16 = 0;
        }
        v14 = v16 == 0;
        goto LABEL_19;
      case 2:
        v14 = 0;
LABEL_19:
        objc_msgSend(v9, "contentViewController:setReadAloudState:", self, v14);
        v9 = v17;
        break;
    }
  }
LABEL_20:

}

- (void)webViewDidEnterFullscreen:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKContentViewControllerDelegate, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ((objc_opt_respondsToSelector(v6, "contentViewControllerDidEnterFullscreen:") & 1) != 0)
    objc_msgSend(v6, "contentViewControllerDidEnterFullscreen:", self);

}

- (void)webViewDidExitFullscreen:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKContentViewControllerDelegate, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ((objc_opt_respondsToSelector(v6, "contentViewControllerDidExitFullscreen:") & 1) != 0)
    objc_msgSend(v6, "contentViewControllerDidExitFullscreen:", self);

}

- (void)webViewFullscreenMayReturnToInline:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate", a3));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKContentViewControllerDelegate, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ((objc_opt_respondsToSelector(v6, "contentViewControllerWillExitFullscreen:") & 1) != 0)
    objc_msgSend(v6, "contentViewControllerWillExitFullscreen:", self);

}

- (id)webView2
{
  return self->_webView2;
}

- (BEKindOfWebView)webView
{
  return (BEKindOfWebView *)self->_webView2;
}

- (UIScrollView)contentScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController webView](self, "webView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scrollView"));

  return (UIScrollView *)v3;
}

- (void)setLoader:(id)a3
{
  BKWK2WebViewLoader *v5;
  BKWK2WebViewLoader *v6;

  v5 = (BKWK2WebViewLoader *)a3;
  if (self->_loader != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_loader, a3);
    -[BKWK2WebViewLoader setDelegate:](self->_loader, "setDelegate:", self);
    v5 = v6;
  }

}

- (void)webViewLoader:(id)a3 didUpdateCurrentVisibleCFILocation:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:knownDOMRange:](self, "_updateReadingStateVisibilityPossible:knownDOMRange:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "contentViewController:didUpdateCurrentVisibleCFILocation:") & 1) != 0)
    objc_msgSend(v5, "contentViewController:didUpdateCurrentVisibleCFILocation:", self, v6);

}

- (void)highlightMediaOverlayElement:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController readAloudEventHandler](self, "readAloudEventHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "elementId"));
    objc_msgSend(v4, "addhighlightForElementID:", v5);

  }
}

- (void)clearMediaOverlayElement:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController readAloudEventHandler](self, "readAloudEventHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "elementId"));
    objc_msgSend(v4, "removeHighlightForElementID:", v5);

  }
}

- (id)pathForSoundtrack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController mediaSource](self, "mediaSource"));
    if (objc_msgSend(v3, "length"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "href"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 0, (char *)objc_msgSend(v6, "count") - 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v7));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v3));
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_refreshContentBasedOverlay
{
  -[BKHTMLContentViewController setContentBasedOverlayRefreshScheduled:](self, "setContentBasedOverlayRefreshScheduled:", 0);
  -[BKHTMLContentViewController _refreshAnnotationsAndSearchResult](self, "_refreshAnnotationsAndSearchResult");
}

- (void)_refreshContentBasedOverlayAfterDelay
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController performSelectorProxy](self, "performSelectorProxy"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v3, "_refreshContentBasedOverlay", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController performSelectorProxy](self, "performSelectorProxy"));
  objc_msgSend(v4, "performSelector:withObject:afterDelay:", "_refreshContentBasedOverlay", 0, 0.1);

}

- (id)predicateForOverlayCache
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BKHTMLContentViewController predicateForOverlayCache]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v2, 0));

  objc_exception_throw(v3);
}

- (void)_setupAnnotationRectCachesFromClientRects:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  WKWebView *webView2;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  -[BKHTMLContentViewController setAnnotationRectUnionCache:](self, "setAnnotationRectUnionCache:", v5);

  v6 = objc_msgSend(v4, "mutableCopy");
  if (v6)
  {
    -[BKHTMLContentViewController setAnnotationRectsCache:](self, "setAnnotationRectsCache:", v6);
  }
  else
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    -[BKHTMLContentViewController setAnnotationRectsCache:](self, "setAnnotationRectsCache:", v7);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v13));
        if (objc_msgSend(v14, "count"))
        {
          v23[0] = BKUnionRects(v14);
          v23[1] = v15;
          v23[2] = v16;
          v23[3] = v17;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v23, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  webView2 = self->_webView2;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_2AA34;
  v22[3] = &unk_1BEA38;
  v22[4] = self;
  -[WKWebView _doAfterNextPresentationUpdate:](webView2, "_doAfterNextPresentationUpdate:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v21, "contentViewControllerAnnotationCacheDidChange:") & 1) != 0)
    objc_msgSend(v21, "contentViewControllerAnnotationCacheDidChange:", self);

}

- (void)_fetchMissingCfiLocationRects:(id)a3 forAnnotations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];

  v5 = a3;
  v6 = a4;
  v23 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "location"));
        objc_opt_class(BKEpubCFILocation);
        v14 = BUDynamicCast(v13, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = v15;
        if (v15
          && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cfiString")),
              v18 = objc_msgSend(v7, "containsObject:", v17),
              v17,
              (v18 & 1) == 0))
        {
          objc_msgSend(v24, "addObject:", v16);
        }
        else
        {
          v19 = _AEAnnotationLocationLog();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v16;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "#annotationcache skipping calculation of rect for cfiLocation:%{public}@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v24, "count"))
  {
    objc_initWeak((id *)buf, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_2AD20;
    v25[3] = &unk_1BF4C0;
    objc_copyWeak(&v27, (id *)buf);
    v26 = v23;
    objc_msgSend(v21, "clientRectsForLocations:completion:", v24, v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[BKHTMLContentViewController _setupAnnotationRectCachesFromClientRects:](self, "_setupAnnotationRectCachesFromClientRects:", v23);
  }

}

- (void)prepareContentBasedOverlayCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;

  -[BKHTMLContentViewController startFetchingAnnotations](self, "startFetchingAnnotations");
  -[BKHTMLContentViewController setContentBasedOverlayRefreshScheduled:](self, "setContentBasedOverlayRefreshScheduled:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_highlightsFRC, "fetchedObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController predicateForOverlayCache](self, "predicateForOverlayCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  v6 = _AEAnnotationLocationLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("annotationUuid")));
    v15 = 138543362;
    v16 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Preparing overlay cache for annotations:%{public}@", (uint8_t *)&v15, 0xCu);

  }
  v9 = objc_alloc_init((Class)NSDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "contentViewController:locationRectsForAnnotations:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentViewController:locationRectsForAnnotations:", self, v5));

    v9 = (id)v13;
  }
  v14 = objc_msgSend(v9, "count");
  if (v14 == objc_msgSend(v5, "count"))
    -[BKHTMLContentViewController _setupAnnotationRectCachesFromClientRects:](self, "_setupAnnotationRectCachesFromClientRects:", v9);
  else
    -[BKHTMLContentViewController _fetchMissingCfiLocationRects:forAnnotations:](self, "_fetchMissingCfiLocationRects:forAnnotations:", v9, v5);

}

- (void)invalidateContentBasedOverlayCache
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _AEAnnotationLocationLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Invalidating overlay cache.", v5, 2u);
  }

  -[BKHTMLContentViewController setAnnotationRectUnionCache:](self, "setAnnotationRectUnionCache:", 0);
  -[BKHTMLContentViewController setAnnotationRectsCache:](self, "setAnnotationRectsCache:", 0);
}

- (void)invalidateContentBasedOverlay
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  uint8_t v10[16];

  v3 = _AEAnnotationLocationLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Invalidating Overlay Views. Refreshing.", v10, 2u);
  }

  -[BKHTMLContentViewController setHighlightViews:](self, "setHighlightViews:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController theme](self, "theme"));
  if ((objc_msgSend(v5, "shouldInvertContent") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController configuration](self, "configuration"));
    -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", objc_msgSend(v6, "isScroll") ^ 1);

  }
  else
  {
    -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", 0);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationRectUnionCache](self, "annotationRectUnionCache"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[BKHTMLContentViewController contentBasedOverlayRefreshScheduled](self, "contentBasedOverlayRefreshScheduled");

    if ((v9 & 1) == 0)
      -[BKHTMLContentViewController _refreshAnnotationsAndSearchResult](self, "_refreshAnnotationsAndSearchResult");
  }
}

- (void)updateReadingStatisticsForScroll
{
  -[BKHTMLContentViewController _updateReadingStateVisibilityPossible:knownDOMRange:](self, "_updateReadingStateVisibilityPossible:knownDOMRange:", 1, 0);
}

- (id)annotations
{
  return -[NSFetchedResultsController fetchedObjects](self->_highlightsFRC, "fetchedObjects");
}

- (void)startFetchingAnnotations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSFetchedResultsController *v14;
  NSFetchedResultsController *highlightsFRC;
  NSFetchedResultsController *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  if (!self->_highlightsFRC)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
    if (!v3)
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/EPub/Shared/Controllers/BKHTMLContentViewController.m", 4323, "-[BKHTMLContentViewController startFetchingAnnotations]", "book", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uiManagedObjectContext"));

    if (!v5)
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/EPub/Shared/Controllers/BKHTMLContentViewController.m", 4326, "-[BKHTMLContentViewController startFetchingAnnotations]", "moc", 0);
    v6 = objc_alloc_init((Class)NSFetchRequest);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController document](self, "document"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "documentOrdinal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForAnnotationsWithAssetID:ordinal:](AEAnnotation, "predicateForAnnotationsWithAssetID:ordinal:", v7, objc_msgSend(v9, "intValue")));
    objc_msgSend(v6, "setPredicate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("AEAnnotation"), v5));
    objc_msgSend(v6, "setEntity:", v11);

    v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("annotationCreationDate"), 1);
    v13 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v12, 0);
    objc_msgSend(v6, "setSortDescriptors:", v13);

    v14 = (NSFetchedResultsController *)objc_msgSend(objc_alloc((Class)IMUbiquitousFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v6, v5, 0, 0);
    highlightsFRC = self->_highlightsFRC;
    self->_highlightsFRC = v14;

    -[NSFetchedResultsController setDelegate:](self->_highlightsFRC, "setDelegate:", self);
    v16 = self->_highlightsFRC;
    v26 = 0;
    LOBYTE(v13) = -[NSFetchedResultsController performFetch:](v16, "performFetch:", &v26);
    v17 = v26;
    if ((v13 & 1) == 0)
    {
      v18 = BCIMLog();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_11C268((uint64_t)v17, v19, v20, v21, v22, v23, v24, v25);

    }
  }
}

- (void)controllerWillChangeContent:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *changedAnnotations;

  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = v4;

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  NSFetchedResultsController *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *changedAnnotations;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  BKHTMLContentViewController *v37;
  id v38;
  uint8_t buf[4];
  void *v40;

  v12 = (NSFetchedResultsController *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (self->_highlightsFRC == v12)
  {
    v16 = v13;
    v17 = v16;
    if (a6 - 3 < 2)
    {
      changedAnnotations = self->_changedAnnotations;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "annotationUuid"));
      -[NSMutableDictionary setObject:forKey:](changedAnnotations, "setObject:forKey:", v17, v23);

    }
    else if (a6 == 2)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "annotationUuid"));

      if (v24)
        -[BKHTMLContentViewController removeHighlightForAnnotation:](self, "removeHighlightForAnnotation:", v17);
    }
    else if (a6 == 1)
    {
      if (objc_msgSend(v16, "annotationType") == 2)
      {
        v18 = _AEAnnotationLocationLog();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotationUuid"));
          *(_DWORD *)buf = 138412290;
          v40 = v20;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "controller didInsert range annotation: %@.  Highlighting...", buf, 0xCu);

        }
        -[BKHTMLContentViewController removeDummyHighlight](self, "removeDummyHighlight");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v17));
        -[BKHTMLContentViewController highlightAnnotations:](self, "highlightAnnotations:", v21);

      }
      else if (objc_msgSend(v17, "annotationType") == 1)
      {
        v25 = _AEAnnotationLocationLog();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotationUuid"));
          *(_DWORD *)buf = 138412290;
          v40 = v27;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "controller didInsert point annotation: %@", buf, 0xCu);

        }
        objc_initWeak((id *)buf, self);
        *(_QWORD *)&v28 = objc_opt_class(BKEpubCFILocation).n128_u64[0];
        v30 = v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "location", v28));
        v32 = BUDynamicCast(v30, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

        if (v33 && -[BKHTMLContentViewController isLocationFromThisDocument:](self, "isLocationFromThisDocument:", v33))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController loader](self, "loader"));
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_2B710;
          v35[3] = &unk_1BF4E8;
          objc_copyWeak(&v38, (id *)buf);
          v36 = v17;
          v37 = self;
          objc_msgSend(v34, "clientRectsForLocation:completion:", v33, v35);

          objc_destroyWeak(&v38);
        }

        objc_destroyWeak((id *)buf);
      }
    }

  }
}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *changedAnnotations;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_changedAnnotations, "allValues", a3, 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[BKHTMLContentViewController _annotationChanged:forceRender:](self, "_annotationChanged:forceRender:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), 1);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "contentViewControllerAnnotationsDidChange:") & 1) != 0)
    objc_msgSend(v10, "contentViewControllerAnnotationsDidChange:", self);

}

- (id)_excerptCitedStringForAnnotation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __CFString *v10;

  v4 = a3;
  v5 = objc_alloc((Class)AEAssetActivityItemProvider);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKBookViewController propertySourceFromBook:](BKBookViewController, "propertySourceFromBook:", v6));
  v8 = objc_msgSend(v5, "initWithAnnotation:propertySource:", v4, v7);

  objc_msgSend(v8, "setShareType:", 0);
  objc_msgSend(v8, "setCitationsAllowed:", -[BKHTMLContentViewController canCopyContent](self, "canCopyContent"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pasteboardString"));
  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = &stru_1C3088;

  return v10;
}

- (id)bookTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bookTitle"));

  return v3;
}

- (id)author
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bookAuthor"));

  return v3;
}

- (id)storeURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storeId"));

  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeShortURLForStoreId:dataSource:", v3, 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *v11;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "physicalPageNumber") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "physicalPageNumber"));
  }
  else
  {
    objc_opt_class(BKHTMLContentViewControllerDummyAnnotation);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController annotationDataProvider](self, "annotationDataProvider"));
      v8 = (void *)v7;
      if (v7
        && (objc_opt_respondsToSelector(v7, "pageNumberForOrdinal:") & 1) != 0
        && (v9 = (char *)objc_msgSend(v8, "pageNumberForOrdinal:", -[BKContentViewController ordinal](self, "ordinal")),
            v9 != (char *)0x7FFFFFFFFFFFFFFFLL))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", &v9[-[BKContentViewController pageOffset](self, "pageOffset")]));
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)stylesheetSet
{
  return 0;
}

- (CGPoint)_originPointForPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  WKWebView *webView2;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  -[WKWebView _convertPointFromContentsToView:](self->_webView2, "_convertPointFromContentsToView:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  webView2 = self->_webView2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController view](self, "view"));
  -[WKWebView convertPoint:toView:](webView2, "convertPoint:toView:", v9, v5, v7);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)registerScriptMessageHandlersWithUserContentController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", self, CFSTR("showAside"));
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", self, CFSTR("toggleBookmark"));
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", self, CFSTR("toggleControlsVisibility"));
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", self, CFSTR("showHighlightMenu"));
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", self, CFSTR("turnPage"));
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", self, CFSTR("checkOperation"));
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", self, CFSTR("performOperation"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController readAloudEventHandler](self, "readAloudEventHandler"));
  objc_msgSend(v4, "be_addScriptMessageHandler:name:", v5, CFSTR("readAloudHandler"));

}

- (void)afterEnsuringFirstPaintPerform:(id)a3
{
  id v4;
  void *v5;
  WKWebView *webView2;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint8_t v11[8];
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = v4;
  if (self->_firstSignificantPaintCompleted)
  {
    webView2 = self->_webView2;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2BFDC;
    v12[3] = &unk_1BEC70;
    v13 = v4;
    -[WKWebView _doAfterNextStablePresentationUpdate:](webView2, "_doAfterNextStablePresentationUpdate:", v12);

  }
  else
  {
    if (self->_locationEnsuredFirstPaintWorkBlock)
    {
      v7 = _AESwipeLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Firing after first paint block early (cancelled) because another is being scheduled", v11, 2u);
      }

      v9 = objc_retainBlock(self->_locationEnsuredFirstPaintWorkBlock);
      v10 = v9;
      if (v9)
        (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);

    }
    -[BKHTMLContentViewController setLocationEnsuredFirstPaintWorkBlock:](self, "setLocationEnsuredFirstPaintWorkBlock:", v5);
  }

}

- (id)tempOwnerID
{
  return self->_tempOwnerID;
}

- (void)setTempOwnerID:(id)a3
{
  objc_storeStrong(&self->_tempOwnerID, a3);
}

- (void)setHighlightRenderingController:(id)a3
{
  objc_storeStrong((id *)&self->_highlightRenderingController, a3);
}

- (BKWebViewProxy)webViewProxy
{
  return self->_webViewProxy;
}

- (void)setWebViewProxy:(id)a3
{
  objc_storeStrong((id *)&self->_webViewProxy, a3);
}

- (BKWK2WebViewLoader)loader
{
  return self->_loader;
}

- (BOOL)supportsExpandedContent
{
  return self->_supportsExpandedContent;
}

- (void)setSupportsExpandedContent:(BOOL)a3
{
  self->_supportsExpandedContent = a3;
}

- (BKAnnotationDataProvider)annotationDataProvider
{
  return (BKAnnotationDataProvider *)objc_loadWeakRetained((id *)&self->_annotationDataProvider);
}

- (void)setAnnotationDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_annotationDataProvider, a3);
}

- (NSMutableDictionary)annotationRectUnionCache
{
  return self->_annotationRectUnionCache;
}

- (void)setAnnotationRectUnionCache:(id)a3
{
  objc_storeStrong((id *)&self->_annotationRectUnionCache, a3);
}

- (NSMutableDictionary)annotationRectsCache
{
  return self->_annotationRectsCache;
}

- (void)setAnnotationRectsCache:(id)a3
{
  objc_storeStrong((id *)&self->_annotationRectsCache, a3);
}

- (BOOL)contentBasedOverlayRefreshScheduled
{
  return self->_contentBasedOverlayRefreshScheduled;
}

- (void)setContentBasedOverlayRefreshScheduled:(BOOL)a3
{
  self->_contentBasedOverlayRefreshScheduled = a3;
}

- (UILongPressGestureRecognizer)indirectImmediateHighlightRecognizer
{
  return self->_indirectImmediateHighlightRecognizer;
}

- (void)setIndirectImmediateHighlightRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectImmediateHighlightRecognizer, a3);
}

- (UIGestureRecognizer)indirectHighlightRecognizer
{
  return self->_indirectHighlightRecognizer;
}

- (void)setIndirectHighlightRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectHighlightRecognizer, a3);
}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (NSString)mediaSource
{
  return self->_mediaSource;
}

- (void)setMediaSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setReadAloudEventHandler:(id)a3
{
  objc_storeStrong((id *)&self->_readAloudEventHandler, a3);
}

- (NSString)visibleCFIString
{
  return self->_visibleCFIString;
}

- (void)setVisibleCFIString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (NSDictionary)currentHighlightSearchSelection
{
  return self->_currentHighlightSearchSelection;
}

- (void)setCurrentHighlightSearchSelection:(id)a3
{
  objc_storeStrong((id *)&self->_currentHighlightSearchSelection, a3);
}

- (BOOL)firstSignificantPaintCompleted
{
  return self->_firstSignificantPaintCompleted;
}

- (void)setFirstSignificantPaintCompleted:(BOOL)a3
{
  self->_firstSignificantPaintCompleted = a3;
}

- (id)locationEnsuredFirstPaintWorkBlock
{
  return self->_locationEnsuredFirstPaintWorkBlock;
}

- (void)setLocationEnsuredFirstPaintWorkBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (BOOL)haveDeterminedInitialModifiers
{
  return self->_haveDeterminedInitialModifiers;
}

- (void)setHaveDeterminedInitialModifiers:(BOOL)a3
{
  self->_haveDeterminedInitialModifiers = a3;
}

- (int64_t)initialTextInteractionModifiers
{
  return self->_initialTextInteractionModifiers;
}

- (void)setInitialTextInteractionModifiers:(int64_t)a3
{
  self->_initialTextInteractionModifiers = a3;
}

- (unint64_t)loadFailureCount
{
  return self->_loadFailureCount;
}

- (void)setLoadFailureCount:(unint64_t)a3
{
  self->_loadFailureCount = a3;
}

- (CGPoint)overrideBuildMenuLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_overrideBuildMenuLocation.x;
  y = self->_overrideBuildMenuLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOverrideBuildMenuLocation:(CGPoint)a3
{
  self->_overrideBuildMenuLocation = a3;
}

- (CGRect)rectForPresentedMenuForTextInteraction
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectForPresentedMenuForTextInteraction.origin.x;
  y = self->_rectForPresentedMenuForTextInteraction.origin.y;
  width = self->_rectForPresentedMenuForTextInteraction.size.width;
  height = self->_rectForPresentedMenuForTextInteraction.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectForPresentedMenuForTextInteraction:(CGRect)a3
{
  self->_rectForPresentedMenuForTextInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationEnsuredFirstPaintWorkBlock, 0);
  objc_storeStrong((id *)&self->_currentHighlightSearchSelection, 0);
  objc_storeStrong((id *)&self->_visibleCFIString, 0);
  objc_storeStrong((id *)&self->_readAloudEventHandler, 0);
  objc_storeStrong((id *)&self->_mediaSource, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_indirectHighlightRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectImmediateHighlightRecognizer, 0);
  objc_storeStrong((id *)&self->_annotationRectsCache, 0);
  objc_storeStrong((id *)&self->_annotationRectUnionCache, 0);
  objc_destroyWeak((id *)&self->_annotationDataProvider);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_webViewProxy, 0);
  objc_storeStrong((id *)&self->_highlightRenderingController, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_highlightDummyAnnotation, 0);
  objc_storeStrong((id *)&self->_highlightTimer, 0);
  objc_storeStrong((id *)&self->_highlightLastPos, 0);
  objc_storeStrong((id *)&self->_highlightWordEnd, 0);
  objc_storeStrong((id *)&self->_highlightWordStart, 0);
  objc_storeStrong((id *)&self->_highlightsFRC, 0);
  objc_storeStrong(&self->_tempOwnerID, 0);
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_changedAnnotations, 0);
  objc_storeStrong((id *)&self->_lineImageCache, 0);
  objc_storeStrong((id *)&self->_fadeView, 0);
  objc_storeStrong((id *)&self->_webView2, 0);
}

- (id)_accessibilityQuickSpeakContent
{
  return -[BKHTMLContentViewController selectedTextForAccessibility](self, "selectedTextForAccessibility");
}

- (BOOL)_accessibilityQuickSpeakContentIsSpeakable
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHTMLContentViewController _accessibilityQuickSpeakContent](self, "_accessibilityQuickSpeakContent"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

@end
