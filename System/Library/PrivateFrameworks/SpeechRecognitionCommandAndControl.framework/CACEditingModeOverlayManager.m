@implementation CACEditingModeOverlayManager

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self, "setContentViewManagerDelegate:", obj);
  }

}

- (_NSRange)rangeForLineNumber:(int64_t)a3 forElement:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  CFTypeID v11;
  NSUInteger v12;
  NSUInteger v13;
  __int128 v14;
  _QWORD v15[2];
  _QWORD v16[3];
  _NSRange result;

  v16[2] = *MEMORY[0x24BDAC8D0];
  v14 = xmmword_229AD41D0;
  v15[0] = CFSTR("lineNumber");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("lineColumn");
  v16[0] = v7;
  v16[1] = &unk_24F2CEB78;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uiElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (const void *)objc_msgSend(v9, "objectWithAXAttribute:parameter:", 92504, v8);
  if (v10)
  {
    v11 = CFGetTypeID(v10);
    if (v11 == AXValueGetTypeID() && AXValueGetType((AXValueRef)v10) == kAXValueTypeCFRange)
      AXValueGetValue((AXValueRef)v10, kAXValueTypeCFRange, &v14);
  }

  v13 = *((_QWORD *)&v14 + 1);
  v12 = v14;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)_webVisibleLineRangesForElement:(id)a3 lineFetchingGeneration:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  unint64_t v22;

  v6 = a3;
  objc_msgSend(v6, "textMarkerRangeForSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __87__CACEditingModeOverlayManager__webVisibleLineRangesForElement_lineFetchingGeneration___block_invoke;
  v20[3] = &unk_24F2AC0A8;
  v21 = v6;
  v22 = a4;
  v20[4] = self;
  v8 = v6;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22E2D5D40](v20);
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "rangeForTextMarkers:", v7);
  v13 = objc_msgSend(v8, "isVisibleTextRange:", v11, v12) ^ 1;
  ((void (**)(_QWORD, _QWORD, void *, uint64_t))v9)[2](v9, 0, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *, uint64_t))v9)[2](v9, 1, v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reverseObjectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __87__CACEditingModeOverlayManager__webVisibleLineRangesForElement_lineFetchingGeneration___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  uint64_t v27;
  int v28;
  void *context;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v26 = v9;
  if (v9)
  {
    v10 = 0;
    v11 = v9;
    v28 = a2;
    v27 = 0;
    do
    {
      v12 = v11;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) != *(_QWORD *)(a1 + 48))
        break;
      context = (void *)MEMORY[0x22E2D5B84](v9);
      v13 = *(void **)(a1 + 40);
      if (a2)
      {
        objc_msgSend(v13, "textLineEndMarker:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "textLineStartMarker:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14;
      }
      else
      {
        objc_msgSend(v13, "textLineStartMarker:", v11, v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "textLineEndMarker:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
      }
      v11 = v14;

      if ((_DWORD)a4 && !objc_msgSend(v8, "count"))
      {
        if ((unint64_t)++v27 > 0x64)
        {
LABEL_21:

          objc_autoreleasePoolPop(context);
          break;
        }
      }
      else if ((unint64_t)++v10 > 6)
      {
        goto LABEL_21;
      }
      if (v15 && v16)
      {
        v17 = a4;
        v18 = v8;
        v19 = *(void **)(a1 + 40);
        v30[0] = v15;
        v30[1] = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "rangeForTextMarkers:", v20);
        v23 = v22;

        if (objc_msgSend(*(id *)(a1 + 40), "isVisibleTextRange:", v21, v23))
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v21, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v18;
          if ((objc_msgSend(v18, "containsObject:", v24) & 1) == 0)
          {
            objc_msgSend(v18, "addObject:", v24);
            v10 = 0;
          }

        }
        else
        {
          v8 = v18;
        }
        a4 = v17;
        a2 = v28;
      }

      objc_autoreleasePoolPop(context);
    }
    while (v11);
  }
  else
  {
    v11 = 0;
  }

  return v8;
}

- (id)_visibleLineRangesForElement:(id)a3 lineFetchingGeneration:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  CACEditingModeOverlayManager *v22;
  unint64_t v23;
  void *v24;
  char v25;
  void *v26;
  id v28;
  void *v29;

  v6 = a3;
  if (objc_msgSend(v6, "hasAnyTraits:", *MEMORY[0x24BDFF128]))
  {
    -[CACEditingModeOverlayManager _webVisibleLineRangesForElement:lineFetchingGeneration:](self, "_webVisibleLineRangesForElement:lineFetchingGeneration:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uiElement");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "selectedTextRange");
    v29 = (void *)v8;
    if (v8 && self->_lineFetchingGeneration == a4)
    {
      v10 = 0;
      v11 = 10000;
      if (v9 > 10000)
        v11 = v9;
      v12 = v9 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFF;
      v13 = v11 - 10000;
      if (v12)
        v14 = 0;
      else
        v14 = v13;
      v28 = v6;
      while (1)
      {
        v15 = (void *)MEMORY[0x22E2D5B84]();
        v16 = -[CACEditingModeOverlayManager rangeForLineNumber:forElement:](self, "rangeForLineNumber:forElement:", v14, v6);
        if (v16 + v17 <= (unint64_t)(v14 + 1))
          ++v14;
        else
          v14 = v16 + v17;
        if (v10 >> 5 > 0x270)
          break;
        v18 = v16;
        v19 = v17;
        v20 = objc_msgSend(v7, "count");
        v21 = v10 <= 4 || v20 == 0;
        if (!v21 || v18 == 0x7FFFFFFF || !(v19 | v18))
          break;
        if (objc_msgSend(v6, "isVisibleTextRange:", v18, v19))
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v18, v19);
          v22 = self;
          v23 = a4;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v7, "containsObject:", v24);

          a4 = v23;
          self = v22;
          v6 = v28;
          if ((v25 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v18, v19);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v26);

            v10 = 0;
          }
        }
        ++v10;
        objc_autoreleasePoolPop(v15);
        if (self->_lineFetchingGeneration != a4)
          goto LABEL_31;
      }
      objc_autoreleasePoolPop(v15);
    }
LABEL_31:

  }
  return v7;
}

- (CGRect)_interfaceOrientedFrameForElement:(id)a3 axFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = objc_msgSend(a3, "windowDisplayId");
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overlayViewForDisplayID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "carPlayConnected");

    objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v13, "elementsForAttribute:", 1009);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    objc_msgSend(v10, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertRect:toContextId:displayId:", objc_msgSend(v17, "_contextId"), v8, x, y, width, height);
    x = v18;
    y = v19;
    width = v20;
    height = v21;

  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)_showOverlayElementsForElement:(id)a3 textUnit:(unint64_t)a4 startIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t lineFetchingGeneration;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSUInteger location;
  NSUInteger v34;
  NSUInteger length;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  BOOL IsNull;
  char v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  NSUInteger v54;
  NSUInteger v55;
  NSUInteger v56;
  double v57;
  double v58;
  CGFloat v59;
  NSUInteger v60;
  NSRange v61;
  double v62;
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  unint64_t v74;
  NSArray **p_overlayElements;
  NSArray *v76;
  CGFloat v77;
  double v78;
  double v79;
  double v80;
  double v81;
  unint64_t v82;
  unint64_t v83;
  CGFloat v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  double v104;
  _QWORD v105[4];
  id v106;
  CACEditingModeOverlayManager *v107;
  unint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint64_t v114;
  NSRange v115;
  NSRange v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;

  v114 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_lineFetchingGeneration;
  objc_msgSend(v7, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elementForAttribute:", 2076);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v101 = v12;
  v102 = v11;
  v99 = v14;
  v100 = v13;

  lineFetchingGeneration = self->_lineFetchingGeneration;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  -[CACEditingModeOverlayManager _visibleLineRangesForElement:lineFetchingGeneration:](self, "_visibleLineRangesForElement:lineFetchingGeneration:", v7, lineFetchingGeneration);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
  if (v88)
  {
    v87 = *(_QWORD *)v110;
    v80 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v81 = *MEMORY[0x24BDBF070];
    v78 = *(double *)(MEMORY[0x24BDBF070] + 24);
    v79 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v83 = a4;
    v82 = lineFetchingGeneration;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v110 != v87)
        objc_enumerationMutation(obj);
      if (lineFetchingGeneration != self->_lineFetchingGeneration)
        break;
      v17 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v16);
      v18 = objc_msgSend(v17, "rangeValue");
      objc_msgSend(v7, "rectForRange:", v18, v19);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[CACEditingModeOverlayManager _interfaceOrientedFrameForElement:axFrame:](self, "_interfaceOrientedFrameForElement:axFrame:", v7);
      v93 = v28;
      v95 = v29;
      v91 = v30;
      v103 = v31;
      objc_msgSend(v7, "frame");
      -[CACEditingModeOverlayManager _interfaceOrientedFrameForElement:axFrame:](self, "_interfaceOrientedFrameForElement:axFrame:", v7);
      v89 = v32;
      location = objc_msgSend(v17, "rangeValue");
      length = v34;
      v117.origin.x = v102;
      v117.origin.y = v101;
      v117.size.width = v100;
      v117.size.height = v99;
      v97 = v23;
      v98 = v21;
      v126.origin.x = v21;
      v126.origin.y = v23;
      v96 = v25;
      v126.size.width = v25;
      v104 = v27;
      v126.size.height = v27;
      v118 = CGRectIntersection(v117, v126);
      x = v118.origin.x;
      y = v118.origin.y;
      width = v118.size.width;
      height = v118.size.height;
      v118.origin.x = v102;
      v118.origin.y = v101;
      v118.size.width = v100;
      v118.size.height = v99;
      if (CGRectIsEmpty(v118)
        || (v119.origin.y = v101,
            v119.origin.x = v102,
            v119.size.height = v99,
            v119.size.width = v100,
            CGRectIsNull(v119)))
      {
        if (a4 == 2)
          goto LABEL_16;
      }
      else
      {
        v120.origin.x = x;
        v120.origin.y = y;
        v120.size.width = width;
        v120.size.height = height;
        IsNull = CGRectIsNull(v120);
        v41 = height < v104 * 0.5 || IsNull;
        if (a4 == 2 && (v41 & 1) != 0)
        {
LABEL_16:
          if (v93 - v89 <= 0.0)
            v42 = -0.0;
          else
            v42 = v93 - v89;
          v44 = v80;
          v43 = v81;
          v46 = v78;
          v45 = v79;
          if (objc_msgSend(v8, "count"))
          {
            objc_msgSend(v8, "lastObject");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "axFrame");
            v43 = v48;
            v44 = v49;
            v45 = v50;
            v46 = v51;

          }
          v52 = v95;
          if (objc_msgSend(v8, "count"))
          {
            objc_msgSend(v8, "lastObject");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "range");
            v56 = v55;

          }
          else
          {
            v56 = 0;
            v54 = 0x7FFFFFFFFFFFFFFFLL;
          }
          v121.size.width = v91 + v42;
          v57 = v93 - fmax(v93 - v89, 0.0);
          v121.origin.x = v57;
          v121.origin.y = v95;
          v94 = v91 + v42;
          v58 = v103;
          v121.size.height = v103;
          v127.origin.x = v43;
          v127.origin.y = v44;
          v127.size.width = v45;
          v127.size.height = v46;
          v122 = CGRectUnion(v121, v127);
          v59 = v122.origin.x;
          v90 = v122.size.height;
          v92 = v122.origin.y;
          v85 = v122.size.width;
          v116.location = objc_msgSend(v17, "rangeValue");
          v116.length = v60;
          v115.location = v54;
          v115.length = v56;
          v61 = NSUnionRange(v115, v116);
          v123.origin.x = v43;
          v123.origin.y = v44;
          v123.size.width = v45;
          v123.size.height = v46;
          if (CGRectIsNull(v123) || v54 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v72 = v97;
            v71 = v98;
            v73 = v96;
          }
          else
          {
            v77 = v59;
            v124.size.height = v103;
            v124.size.width = v94;
            v62 = vabdd_f64(v92, v95);
            v124.origin.x = v57;
            v124.origin.y = v95;
            v128.origin.x = v43;
            v128.origin.y = v44;
            v128.size.width = v45;
            v128.size.height = v46;
            v125 = CGRectIntersection(v124, v128);
            if (vabdd_f64(v90, v103) < 10.0 && v62 < 10.0)
            {
              v65 = v125.size.height <= 0.0 || v61.location == 0x7FFFFFFFFFFFFFFFLL || v61.length == 0;
              v72 = v97;
              v71 = v98;
              v73 = v96;
              v58 = v103;
              if (!v65)
              {
                objc_msgSend(v8, "removeLastObject");
                v57 = v77;
                v58 = v90;
                v52 = v92;
                v94 = v85;
                location = v61.location;
                length = v61.length;
              }
            }
            else
            {
              v72 = v97;
              v71 = v98;
              v73 = v96;
              v58 = v103;
            }
          }
          v66 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count") + a5);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "stringValue");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setLabel:", v68);

          objc_msgSend(v66, "setAxFrame:", v71, v72, v73, v104);
          objc_msgSend(v66, "setInterfaceOrientedFrame:", v57, v52, v94, v58);
          objc_msgSend(v66, "setRange:", location, length);
          objc_msgSend(v7, "value");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "substringWithRange:", location, length);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setRepresentedText:", v70);

          objc_msgSend(v66, "setTextUnit:", 2);
          objc_msgSend(v8, "addObject:", v66);

          a4 = v83;
          lineFetchingGeneration = v82;
        }
      }
      if (v88 == ++v16)
      {
        v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
        if (v88)
          goto LABEL_3;
        break;
      }
    }
  }

  v74 = objc_msgSend(v8, "count");
  p_overlayElements = &self->_overlayElements;
  if (v74 > 1)
  {
    objc_storeStrong((id *)p_overlayElements, v8);
    v105[0] = MEMORY[0x24BDAC760];
    v105[1] = 3221225472;
    v105[2] = __83__CACEditingModeOverlayManager__showOverlayElementsForElement_textUnit_startIndex___block_invoke_2;
    v105[3] = &unk_24F2AC0F0;
    v107 = self;
    v108 = a4;
    v106 = v8;
    -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", &__block_literal_global_20, v105);

  }
  else
  {
    v76 = *p_overlayElements;
    *p_overlayElements = (NSArray *)MEMORY[0x24BDBD1A8];

    -[CACSimpleContentViewManager hideAnimated:completion:](self, "hideAnimated:completion:", 1, 0);
  }

}

CACEditingModeOverlayViewController *__83__CACEditingModeOverlayManager__showOverlayElementsForElement_textUnit_startIndex___block_invoke()
{
  return objc_alloc_init(CACEditingModeOverlayViewController);
}

void __83__CACEditingModeOverlayManager__showOverlayElementsForElement_textUnit_startIndex___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setElements:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 <= 4)
    objc_msgSend(v4, "setOverlayType:", qword_229AD41E8[v3]);
  objc_msgSend(*(id *)(a1 + 40), "setEditingModeOverlayViewController:", v4);

}

- (void)showWordsForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  -[CACEditingModeOverlayManager _showPopoverForElement:targetRange:startIndex:type:](self, "_showPopoverForElement:targetRange:startIndex:type:", a3, a4.location, a4.length, a5, 1);
}

- (void)hide
{
  objc_super v2;

  ++self->_lineFetchingGeneration;
  v2.receiver = self;
  v2.super_class = (Class)CACEditingModeOverlayManager;
  -[CACSimpleContentViewManager hide](&v2, sel_hide);
}

- (void)hideWithoutAnimation
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  objc_super v7;

  ++self->_lineFetchingGeneration;
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CACSimpleContentViewManager viewController](self, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerInPopover");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPopoverShowing:", 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)CACEditingModeOverlayManager;
  -[CACSimpleContentViewManager hideWithoutAnimation](&v7, sel_hideWithoutAnimation);
}

- (void)_showPopoverForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5 type:(int64_t)a6
{
  NSUInteger length;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  NSArray *overlayElements;
  void *v37;
  int v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v43;
  NSUInteger location;
  void *v45;
  CACEditingModeOverlayManager *v46;
  id obj;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  int64_t v51;
  unint64_t v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  _QWORD v57[5];
  id v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void *v70;
  NSUInteger v71;
  NSUInteger v72;
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;
  CGRect v76;

  length = a4.length;
  location = a4.location;
  v74 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v46 = self;
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if ((self & 1) != 0)
  {
    -[CACSimpleContentViewManager viewController](v46, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerInPopover");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPopoverShowing:", 0);

  }
  v67 = 0;
  v68 = &v67;
  v69 = 0x3010000000;
  v70 = &unk_229AE1DD3;
  v71 = location;
  v72 = length;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    v15 = v68;
    v68[4] = 0;
    v15[5] = v14;

  }
  objc_msgSend(v9, "value");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "substringWithRange:", location, length);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC0D48], "textSegmentModelsForText:type:start:", v43, a6, a5);
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  v17 = *MEMORY[0x24BDBF090];
  v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v19 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (v16)
  {
    v21 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v64 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if ((objc_msgSend(v23, "isWhiteSpace") & 1) == 0)
        {
          v24 = (void *)objc_opt_new();
          objc_msgSend(v23, "label");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "string");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setLabel:", v26);

          objc_msgSend(v23, "representedText");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "string");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setRepresentedText:", v28);

          if ((unint64_t)a6 < 2)
            objc_msgSend(v24, "setTextUnit:", a6);
          v29 = objc_msgSend(v23, "nsRange");
          objc_msgSend(v23, "nsRange");
          v31 = v30;
          objc_msgSend(v9, "rectForRange:", v29 + location, v30);
          objc_msgSend(v24, "setAxFrame:");
          objc_msgSend(v24, "axFrame");
          -[CACEditingModeOverlayManager _interfaceOrientedFrameForElement:axFrame:](v46, "_interfaceOrientedFrameForElement:axFrame:", v9);
          objc_msgSend(v24, "setInterfaceOrientedFrame:");
          objc_msgSend(v24, "setRange:", v29 + location, v31);
          objc_msgSend(v45, "addObject:", v24);
          objc_msgSend(v24, "axFrame");
          if (v20 != 0.0)
          {
            v76.origin.x = v32;
            v76.origin.y = v33;
            v76.size.width = v34;
            v76.size.height = v35;
            v75.origin.x = v17;
            v75.origin.y = v18;
            v75.size.width = v19;
            v75.size.height = v20;
            *(CGRect *)&v32 = CGRectUnion(v75, v76);
          }
          v17 = v32;
          v18 = v33;
          v19 = v34;
          v20 = v35;

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v16);
  }

  if ((unint64_t)objc_msgSend(v45, "count") > 1)
  {
    -[CACSimpleContentViewManager viewController](v46, "viewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isBeingPresented"))
    {
      v40 = -[NSArray isEqualToArray:](v46->_overlayElements, "isEqualToArray:", v45);

      if (v40)
        goto LABEL_26;
    }
    else
    {

    }
    objc_storeStrong((id *)&v46->_overlayElements, v45);
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_2;
    v57[3] = &unk_24F2AC1E0;
    v57[4] = v46;
    v58 = &__block_literal_global_253;
    v59 = v17;
    v60 = v18;
    v61 = v19;
    v62 = v20;
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_7;
    v48[3] = &unk_24F2AC208;
    v49 = v41;
    v50 = &v67;
    v51 = a6;
    v52 = a5;
    v53 = v17;
    v54 = v18;
    v55 = v19;
    v56 = v20;
    -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](v46, "showViewControllerWithCreationHandler:updateHandler:", v57, v48);

  }
  else
  {
    overlayElements = v46->_overlayElements;
    v46->_overlayElements = (NSArray *)MEMORY[0x24BDBD1A8];

    -[CACSimpleContentViewManager viewController](v46, "viewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isBeingPresented");

    if (v38)
      -[CACSimpleContentViewManager hideAnimated:completion:](v46, "hideAnimated:completion:", 1, 0);
  }
LABEL_26:

  _Block_object_dispose(&v67, 8);
}

id __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[16];

  v60[14] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v3 = objc_alloc(MEMORY[0x24BEBDB00]);
    v4 = *MEMORY[0x24BDBF090];
    v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v8 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
    +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, v4, v5, v6, v7);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v2);
    +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contrastedCopy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);
    objc_msgSend(v8, "addSubview:", v9);
    objc_msgSend(v8, "addSubview:", v56);
    objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v40 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v56, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v57;
    objc_msgSend(v56, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v53;
    objc_msgSend(v56, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v50;
    objc_msgSend(v56, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v47;
    objc_msgSend(v9, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v44;
    objc_msgSend(v9, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v41;
    objc_msgSend(v9, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v60[6] = v36;
    objc_msgSend(v9, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v60[7] = v32;
    objc_msgSend(v10, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v60[8] = v29;
    objc_msgSend(v10, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60[9] = v26;
    objc_msgSend(v10, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v9;
    objc_msgSend(v9, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60[10] = v23;
    v11 = v10;
    v33 = v10;
    objc_msgSend(v10, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v60[11] = v12;
    objc_msgSend(v2, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60[12] = v15;
    objc_msgSend(v2, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v60[13] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v19);

  }
  else
  {
    v8 = v2;
  }

  return v8;
}

CACEditingOverlayPopoverPresentingViewController *__83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_2(uint64_t a1)
{
  CACEditingOverlayPopoverPresentingViewController *v2;
  uint64_t v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = objc_alloc_init(CACEditingOverlayPopoverPresentingViewController);
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_3;
  v11[3] = &unk_24F2AC158;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEC0D40], "setRightBadgeViewForText:", v11);
  objc_msgSend(MEMORY[0x24BEC0D40], "setRightBadgeSizeForDigits:", &__block_literal_global_261);
  v6 = v3;
  v7 = 3221225472;
  v8 = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_5;
  v9 = &unk_24F2AC158;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEC0D40], "setDownBadgeViewForText:", &v6);
  objc_msgSend(MEMORY[0x24BEC0D40], "setDownBadgeSizeForDigits:", &__block_literal_global_262, v6, v7, v8, v9);
  v4 = objc_alloc_init(MEMORY[0x24BEC0D48]);
  -[CACPopoverPresentingViewController setPopoverPresentationDelegate:](v2, "setPopoverPresentationDelegate:", *(_QWORD *)(a1 + 32));
  -[CACPopoverPresentingViewController setViewControllerInPopover:](v2, "setViewControllerInPopover:", v4);
  -[CACPopoverPresentingViewController setPortraitUpSourceRect:](v2, "setPortraitUpSourceRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  -[CACPopoverPresentingViewController setPermittedArrowDirections:](v2, "setPermittedArrowDirections:", 1);
  objc_msgSend(v4, "setPopoverShowing:", 1);

  return v2;
}

id __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  CACLabeledBadgeView *v4;
  CACLabeledBadgeView *v5;
  void *v6;

  v3 = a2;
  v4 = [CACLabeledBadgeView alloc];
  v5 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v4, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v3, 1, 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:contrasted:](CACLabeledBadgeView, "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:contrasted:", a2, 1, 0, 0, UIAccessibilityDarkerSystemColorsEnabled());
}

id __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  CACLabeledBadgeView *v4;
  CACLabeledBadgeView *v5;
  void *v6;

  v3 = a2;
  v4 = [CACLabeledBadgeView alloc];
  v5 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v4, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v3, 2, 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:contrasted:](CACLabeledBadgeView, "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:contrasted:", a2, 2, 0, 0, UIAccessibilityDarkerSystemColorsEnabled());
}

void __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  id v14;
  _QWORD block[4];
  id v16;
  CGRect v17;
  CGRect v18;

  v3 = a2;
  objc_msgSend(v3, "viewControllerInPopover");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(v4, "setType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setStartIndex:", *(_QWORD *)(a1 + 56));
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  objc_msgSend(v3, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v6 - v9 * 0.5;

  objc_msgSend(v3, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bounds");
  v13 = v7 - (v12 * 0.5 + 15.0);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_8;
  block[3] = &unk_24F2AA860;
  v16 = v4;
  v14 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v17.size.width = *(CGFloat *)(a1 + 80);
  v17.size.height = *(CGFloat *)(a1 + 88);
  v17.origin.x = v10;
  v17.origin.y = v13;
  v18 = CGRectInset(v17, 0.0, 4.0);
  objc_msgSend(v14, "setFocusRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

}

uint64_t __83__CACEditingModeOverlayManager__showPopoverForElement_targetRange_startIndex_type___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPopoverShowing:", 1);
}

- (void)showLinesForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 1;
  -[CACEditingModeOverlayManager _showOverlayElementsForElement:textUnit:startIndex:](self, "_showOverlayElementsForElement:textUnit:startIndex:", a3, 2, a5);
}

- (void)showParagraphsForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 2;
  -[CACEditingModeOverlayManager _showOverlayElementsForElement:textUnit:startIndex:](self, "_showOverlayElementsForElement:textUnit:startIndex:", a3, 4, a5);
}

- (void)showSentencesForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 3;
  -[CACEditingModeOverlayManager _showOverlayElementsForElement:textUnit:startIndex:](self, "_showOverlayElementsForElement:textUnit:startIndex:", a3, 3, a5);
}

- (void)showCharactersForElement:(id)a3 targetRange:(_NSRange)a4 startIndex:(unint64_t)a5
{
  self->_overlayType = 4;
  -[CACEditingModeOverlayManager _showPopoverForElement:targetRange:startIndex:type:](self, "_showPopoverForElement:targetRange:startIndex:type:", a3, a4.location, a4.length, a5, 0);
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)startDelayedDimmingOfNumbers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  dispatch_time_t v8;
  _QWORD block[5];

  -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
  -[CACSimpleContentViewManager setActiveDimmingTransactionID:](self, "setActiveDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID"));
  -[CACEditingModeOverlayManager editingModeOverlayViewController](self, "editingModeOverlayViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[CACEditingModeOverlayManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isOverlayFadingEnabledForEditingModeOverlayManager:", self);

  if ((_DWORD)v4)
  {
    -[CACEditingModeOverlayManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlayFadeDelayForEditingModeOverlayManager:", self);
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);

  }
}

void __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activeDimmingTransactionID");
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "pendingDimmingTransactionID"))
  {
    objc_msgSend(*(id *)(a1 + 32), "editingModeOverlayViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
      v4[3] = &unk_24F2AA860;
      v4[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v4, 0, 1.0);
    }
  }
}

void __60__CACEditingModeOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  float v2;
  double v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlayFadeOpacityForEditingModeOverlayManager:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "editingModeOverlayViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

- (void)stopDelayedDimmingOfNumbers
{
  void *v3;
  id v4;

  -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
  -[CACEditingModeOverlayManager editingModeOverlayViewController](self, "editingModeOverlayViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (CACEditingModeOverlayManagerDelegate)delegate
{
  return (CACEditingModeOverlayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)overlayElements
{
  return self->_overlayElements;
}

- (void)setOverlayElements:(id)a3
{
  objc_storeStrong((id *)&self->_overlayElements, a3);
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (CACEditingModeOverlayViewController)editingModeOverlayViewController
{
  return self->_editingModeOverlayViewController;
}

- (void)setEditingModeOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_editingModeOverlayViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingModeOverlayViewController, 0);
  objc_storeStrong((id *)&self->_overlayElements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineFetchingQueue, 0);
}

@end
