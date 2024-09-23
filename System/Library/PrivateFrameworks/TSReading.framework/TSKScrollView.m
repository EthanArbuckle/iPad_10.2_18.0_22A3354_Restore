@implementation TSKScrollView

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double MaxX;
  double MinX;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double MaxY;
  double MinY;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  CGFloat rect;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
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

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = *MEMORY[0x24BDBF090];
  v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[TSKScrollView contentSize](self, "contentSize");
  v126.size.width = v12;
  v126.size.height = v13;
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  v126.origin.x = v10;
  v126.origin.y = v11;
  v77 = CGRectIntersection(v76, v126);
  v14 = v77.origin.y;
  v15 = v77.size.width;
  v16 = v77.size.height;
  rect = v77.origin.x;
  if (CGRectIsEmpty(v77))
    return;
  -[TSKScrollView visibleFrame](self, "visibleFrame");
  -[TSKScrollView convertRect:fromView:](self, "convertRect:fromView:", -[TSKScrollView superview](self, "superview"), v17, v18, v19, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[TSKScrollView contentOffset](self, "contentOffset");
  v73 = v29;
  v71 = v30;
  v78.origin.x = v22;
  v78.origin.y = v24;
  v78.size.width = v26;
  v78.size.height = v28;
  MaxX = CGRectGetMaxX(v78);
  v79.origin.x = rect;
  v79.origin.y = v14;
  v79.size.width = v15;
  v79.size.height = v16;
  v72 = v16;
  if (MaxX <= CGRectGetMaxX(v79))
    goto LABEL_6;
  v80.origin.x = v22;
  v80.origin.y = v24;
  v80.size.width = v26;
  v80.size.height = v28;
  MinX = CGRectGetMinX(v80);
  v81.origin.x = rect;
  v81.origin.y = v14;
  v81.size.width = v15;
  v81.size.height = v16;
  if (MinX <= CGRectGetMinX(v81))
  {
LABEL_6:
    v88.origin.x = v22;
    v88.origin.y = v24;
    v88.size.width = v26;
    v88.size.height = v28;
    v35 = CGRectGetMinX(v88);
    v89.origin.x = rect;
    v89.origin.y = v14;
    v89.size.width = v15;
    v89.size.height = v16;
    if (v35 >= CGRectGetMinX(v89))
    {
      v36 = rect;
      goto LABEL_16;
    }
    v90.origin.x = v22;
    v90.origin.y = v24;
    v90.size.width = v26;
    v90.size.height = v28;
    v64 = CGRectGetMaxX(v90);
    v91.origin.x = rect;
    v91.origin.y = v14;
    v91.size.width = v15;
    v91.size.height = v16;
    v36 = rect;
    if (v64 >= CGRectGetMaxX(v91))
      goto LABEL_16;
    v92.origin.x = rect;
    v92.origin.y = v14;
    v92.size.width = v15;
    v92.size.height = v72;
    v65 = CGRectGetMinX(v92);
    v93.origin.x = v22;
    v93.origin.y = v24;
    v93.size.width = v26;
    v93.size.height = v28;
    v66 = v65 - CGRectGetMinX(v93);
    v94.origin.x = rect;
    v94.origin.y = v14;
    v94.size.width = v15;
    v94.size.height = v72;
    v37 = CGRectGetMaxX(v94);
    v57 = v22;
    v59 = v28;
    v95.origin.x = v22;
    v38 = v24;
    v95.origin.y = v24;
    v95.size.width = v26;
    v95.size.height = v28;
    if (v66 >= v37 - CGRectGetMaxX(v95))
    {
      v100.origin.x = rect;
      v100.origin.y = v14;
      v100.size.width = v15;
      v100.size.height = v72;
      v39 = CGRectGetMaxX(v100);
      v40 = v57;
      v101.origin.x = v57;
      v101.origin.y = v24;
      v101.size.width = v26;
      v41 = v59;
      v101.size.height = v59;
      v42 = CGRectGetMaxX(v101);
    }
    else
    {
      v96.origin.x = rect;
      v96.origin.y = v14;
      v96.size.width = v15;
      v96.size.height = v72;
      v39 = CGRectGetMinX(v96);
      v40 = v57;
      v97.origin.x = v57;
      v97.origin.y = v24;
      v97.size.width = v26;
      v41 = v59;
      v97.size.height = v59;
      v42 = CGRectGetMinX(v97);
    }
    v44 = v39 - v42;
    v28 = v41;
    v24 = v38;
    v22 = v40;
    v36 = rect;
    v43 = v73 + v44;
  }
  else
  {
    v82.origin.x = v22;
    v82.origin.y = v24;
    v82.size.width = v26;
    v82.size.height = v28;
    v61 = CGRectGetMaxX(v82);
    v83.origin.x = rect;
    v83.origin.y = v14;
    v83.size.width = v15;
    v83.size.height = v16;
    v62 = v61 - CGRectGetMaxX(v83);
    v84.origin.x = v22;
    v84.origin.y = v24;
    v84.size.width = v26;
    v84.size.height = v28;
    v58 = CGRectGetMinX(v84);
    v85.origin.x = rect;
    v85.origin.y = v14;
    v85.size.width = v15;
    v85.size.height = v16;
    if (v62 >= v58 - CGRectGetMinX(v85))
    {
      v98.origin.x = v22;
      v98.origin.y = v24;
      v98.size.width = v26;
      v98.size.height = v28;
      v63 = CGRectGetMinX(v98);
      v33 = rect;
      v99.origin.x = rect;
      v99.origin.y = v14;
      v99.size.width = v15;
      v99.size.height = v16;
      v34 = CGRectGetMinX(v99);
    }
    else
    {
      v86.origin.x = v22;
      v86.origin.y = v24;
      v86.size.width = v26;
      v86.size.height = v28;
      v63 = CGRectGetMaxX(v86);
      v33 = rect;
      v87.origin.x = rect;
      v87.origin.y = v14;
      v87.size.width = v15;
      v87.size.height = v16;
      v34 = CGRectGetMaxX(v87);
    }
    v36 = v33;
    v43 = v73 - (v63 - v34);
  }
  v73 = v43;
LABEL_16:
  v74 = v24;
  v102.origin.x = v22;
  v102.origin.y = v24;
  v45 = v22;
  v102.size.width = v26;
  v102.size.height = v28;
  MaxY = CGRectGetMaxY(v102);
  v103.origin.x = v36;
  v103.origin.y = v14;
  v103.size.width = v15;
  v103.size.height = v72;
  if (MaxY <= CGRectGetMaxY(v103))
    goto LABEL_20;
  v104.origin.x = v22;
  v104.origin.y = v74;
  v104.size.width = v26;
  v104.size.height = v28;
  MinY = CGRectGetMinY(v104);
  v105.origin.x = v36;
  v105.origin.y = v14;
  v105.size.width = v15;
  v105.size.height = v72;
  if (MinY <= CGRectGetMinY(v105))
  {
LABEL_20:
    v112.origin.x = v22;
    v112.origin.y = v74;
    v112.size.width = v26;
    v112.size.height = v28;
    v51 = CGRectGetMinY(v112);
    v113.origin.x = v36;
    v113.origin.y = v14;
    v113.size.width = v15;
    v113.size.height = v72;
    if (v51 >= CGRectGetMinY(v113))
    {
      v54 = v71;
    }
    else
    {
      v114.origin.x = v22;
      v114.origin.y = v74;
      v114.size.width = v26;
      v114.size.height = v28;
      v52 = CGRectGetMaxY(v114);
      v115.origin.x = v36;
      v115.origin.y = v14;
      v115.size.width = v15;
      v115.size.height = v72;
      v53 = CGRectGetMaxY(v115);
      v54 = v71;
      if (v52 < v53)
      {
        v116.origin.x = v36;
        v116.origin.y = v14;
        v116.size.width = v15;
        v116.size.height = v72;
        v69 = CGRectGetMinY(v116);
        v117.origin.x = v22;
        v117.origin.y = v74;
        v117.size.width = v26;
        v117.size.height = v28;
        v70 = v69 - CGRectGetMinY(v117);
        v118.origin.x = v36;
        v118.origin.y = v14;
        v118.size.width = v15;
        v118.size.height = v72;
        v60 = CGRectGetMaxY(v118);
        v119.origin.x = v22;
        v119.origin.y = v74;
        v119.size.width = v26;
        v119.size.height = v28;
        if (v70 >= v60 - CGRectGetMaxY(v119))
        {
          v124.origin.x = v36;
          v124.origin.y = v14;
          v124.size.width = v15;
          v124.size.height = v72;
          v55 = CGRectGetMaxY(v124);
          v125.origin.x = v45;
          v125.origin.y = v74;
          v125.size.width = v26;
          v125.size.height = v28;
          v56 = CGRectGetMaxY(v125);
        }
        else
        {
          v120.origin.x = v36;
          v120.origin.y = v14;
          v120.size.width = v15;
          v120.size.height = v72;
          v55 = CGRectGetMinY(v120);
          v121.origin.x = v45;
          v121.origin.y = v74;
          v121.size.width = v26;
          v121.size.height = v28;
          v56 = CGRectGetMinY(v121);
        }
        v54 = v71 + v55 - v56;
      }
    }
  }
  else
  {
    v106.origin.x = v22;
    v106.origin.y = v74;
    v106.size.width = v26;
    v106.size.height = v28;
    v67 = CGRectGetMaxY(v106);
    v107.origin.x = v36;
    v107.origin.y = v14;
    v107.size.width = v15;
    v107.size.height = v72;
    v68 = v67 - CGRectGetMaxY(v107);
    v108.origin.x = v22;
    v108.origin.y = v74;
    v108.size.width = v26;
    v108.size.height = v28;
    v48 = CGRectGetMinY(v108);
    v109.origin.x = v36;
    v109.origin.y = v14;
    v109.size.width = v15;
    v109.size.height = v72;
    if (v68 >= v48 - CGRectGetMinY(v109))
    {
      v122.origin.x = v22;
      v122.origin.y = v74;
      v122.size.width = v26;
      v122.size.height = v28;
      v49 = CGRectGetMinY(v122);
      v123.origin.x = v36;
      v123.origin.y = v14;
      v123.size.width = v15;
      v123.size.height = v72;
      v50 = CGRectGetMinY(v123);
    }
    else
    {
      v110.origin.x = v22;
      v110.origin.y = v74;
      v110.size.width = v26;
      v110.size.height = v28;
      v49 = CGRectGetMaxY(v110);
      v111.origin.x = v36;
      v111.origin.y = v14;
      v111.size.width = v15;
      v111.size.height = v72;
      v50 = CGRectGetMaxY(v111);
    }
    v54 = v71 - (v49 - v50);
  }
  -[TSKScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v4, v73, v54);
}

- (BOOL)isScrolling
{
  if ((-[TSKScrollView isDragging](self, "isDragging") & 1) != 0)
    return 1;
  else
    return -[TSKScrollView isDecelerating](self, "isDecelerating");
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  -[TSKScrollView setContentOffset:animated:completionBlock:](self, "setContentOffset:animated:completionBlock:", a4, 0, a3.x, a3.y);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  double y;
  double x;
  double v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  _QWORD v13[7];
  BOOL v14;
  _QWORD v15[7];

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    -[TSKScrollView contentOffset](self, "contentOffset");
    v11 = y != v10 || x != v9;
  }
  else
  {
    v11 = 0;
  }
  -[TSKScrollView delegate](self, "delegate");
  v12 = (void *)TSUProtocolCast();
  if (v11)
  {
    if (!self->mAnimatingContentOffsetCount && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "scrollView:willAnimateToContentOffset:", self, x, y);
    ++self->mAnimatingContentOffsetCount;
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke;
  v15[3] = &unk_24D82A578;
  v15[4] = self;
  *(double *)&v15[5] = x;
  *(double *)&v15[6] = y;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke_2;
  v13[3] = &unk_24D82A958;
  v14 = v11;
  v13[4] = self;
  v13[5] = v12;
  v13[6] = a5;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v15, v13, 0.200000003, 0.0);
  }
  else
  {
    -[TSKScrollView setContentOffset:](self, "setContentOffset:", x, y);
    __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke_2((uint64_t)v13);
  }
}

uint64_t __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_9;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 2072))
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKScrollView setContentOffset:animated:completionBlock:]_block_invoke_2");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKScrollView.mm"), 131, CFSTR("imbalanced content offset animation count"));
    if (!*(_BYTE *)(a1 + 56))
      goto LABEL_9;
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 2072);
  if (v5)
  {
    *(_QWORD *)(v4 + 2072) = v5 - 1;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 2072))
      goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "scrollViewDidEndScrollingAnimation:", *(_QWORD *)(a1 + 32));
    goto LABEL_11;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_9:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "scrollViewDidScroll:", *(_QWORD *)(a1 + 32));
  }
LABEL_11:
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  -[TSKScrollView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)-[TSKScrollView delegate](self, "delegate"), "scrollView:restrictContentOffset:", self, x, y);
    x = v6;
    y = v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSKScrollView;
  -[TSKScrollView setContentOffset:](&v8, sel_setContentOffset_, x, y);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKScrollView;
  -[TSKScrollView layoutSubviews](&v3, sel_layoutSubviews);
  -[TSKScrollView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)-[TSKScrollView delegate](self, "delegate"), "scrollViewDidLayoutSubviews:", self);
}

- (void)hideScrollIndicators
{
  -[TSKScrollView setShowsHorizontalScrollIndicator:](self, "setShowsHorizontalScrollIndicator:", 0);
  -[TSKScrollView setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", 0);
}

- (BOOL)mayPassScrollEventsToNextResponder
{
  return self->_mayPassScrollEventsToNextResponder;
}

- (void)setMayPassScrollEventsToNextResponder:(BOOL)a3
{
  self->_mayPassScrollEventsToNextResponder = a3;
}

- (BOOL)shouldDisableScrollingWhenCursorIsHidden
{
  return self->_shouldDisableScrollingWhenCursorIsHidden;
}

- (void)setShouldDisableScrollingWhenCursorIsHidden:(BOOL)a3
{
  self->_shouldDisableScrollingWhenCursorIsHidden = a3;
}

- (CGRect)scrollableAreaBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollableAreaBounds.origin.x;
  y = self->_scrollableAreaBounds.origin.y;
  width = self->_scrollableAreaBounds.size.width;
  height = self->_scrollableAreaBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
