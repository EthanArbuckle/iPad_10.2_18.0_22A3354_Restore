@implementation UIScrollView

- (UIEdgeInsets)tui_revealableContentPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if ((objc_opt_respondsToSelector(self, "_revealableContentPadding") & 1) != 0)
  {
    -[UIScrollView _revealableContentPadding](self, "_revealableContentPadding");
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)tui_contentOffsetForScrollingToRect:(CGRect)a3 atScrollPosition:(unint64_t)a4 delegate:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  double MinY;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double MidY;
  double MaxY;
  double v43;
  BOOL v44;
  double v45;
  double MinX;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double MidX;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double MaxX;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  BOOL v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  CGFloat height;
  double v87;
  CGFloat y;
  double v89;
  CGFloat rect;
  CGFloat rect_8;
  double rect_16;
  double rect_24;
  CGPoint result;
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

  height = a3.size.height;
  y = a3.origin.y;
  rect = a3.origin.x;
  rect_8 = a3.size.width;
  v7 = a5;
  -[UIScrollView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIScrollView adjustedContentInset](self, "adjustedContentInset");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[UIScrollView tui_revealableContentPadding](self, "tui_revealableContentPadding");
  v84 = v25;
  v85 = v24;
  if (v7)
  {
    objc_msgSend(v7, "contentInsetsForScrollingToRectWithContentInsets:", v17, v19, v21, v23);
    v17 = v26;
    v19 = v27;
    v21 = v28;
    v23 = v29;
  }
  v31 = y;
  v30 = rect;
  rect_16 = v9 + v19;
  rect_24 = v11 + v17;
  v82 = v19;
  v32 = v13 - (v23 + v19);
  v33 = v15 - (v21 + v17);
  if ((a4 & 1) != 0)
  {
    v99.origin.x = rect;
    v99.origin.y = y;
    v99.size.width = rect_8;
    v37 = height;
    v99.size.height = height;
    MinY = CGRectGetMinY(v99);
    v34 = rect_16;
    goto LABEL_13;
  }
  if ((a4 & 2) != 0)
  {
    v100.origin.x = rect;
    v100.origin.y = y;
    v100.size.width = rect_8;
    v40 = height;
    v100.size.height = height;
    MidY = CGRectGetMidY(v100);
    v34 = rect_16;
    v101.origin.y = v11 + v17;
    v101.origin.x = rect_16;
    v101.size.width = v32;
    v101.size.height = v33;
    MinY = MidY + CGRectGetHeight(v101) * -0.5;
LABEL_12:
    v37 = v40;
    goto LABEL_13;
  }
  if ((a4 & 4) != 0)
  {
    v102.origin.x = rect;
    v102.origin.y = y;
    v102.size.width = rect_8;
    v40 = height;
    v102.size.height = height;
    MaxY = CGRectGetMaxY(v102);
    v34 = rect_16;
    v103.origin.y = v11 + v17;
    v103.origin.x = rect_16;
    v103.size.width = v32;
    v103.size.height = v33;
    MinY = MaxY - CGRectGetHeight(v103);
    goto LABEL_12;
  }
  v34 = rect_16;
  MinY = v11 + v17;
  v95.origin.x = rect_16;
  v95.origin.y = v11 + v17;
  v95.size.width = v32;
  v95.size.height = v33;
  v36 = rect_8;
  v37 = height;
  v38 = height;
  if (!CGRectContainsRect(v95, *(CGRect *)&v30))
  {
    v96.origin.x = rect;
    v96.origin.y = y;
    v96.size.width = rect_8;
    v96.size.height = height;
    v39 = CGRectGetMinY(v96);
    v97.origin.x = rect_16;
    v97.origin.y = v11 + v17;
    v97.size.width = v32;
    v97.size.height = v33;
    if (v39 >= CGRectGetMinY(v97))
    {
      v118.origin.x = rect;
      v118.origin.y = y;
      v118.size.width = rect_8;
      v118.size.height = height;
      v77 = CGRectGetMaxY(v118);
      v119.origin.x = rect_16;
      MinY = v11 + v17;
      v119.origin.y = v11 + v17;
      v119.size.width = v32;
      v119.size.height = v33;
      v78 = v77 <= CGRectGetMaxY(v119);
      v37 = height;
      if (!v78)
      {
        v120.origin.y = y;
        v120.origin.x = rect;
        v120.size.width = rect_8;
        v120.size.height = height;
        v79 = CGRectGetMaxY(v120);
        v121.origin.x = rect_16;
        v121.origin.y = v11 + v17;
        v121.size.width = v32;
        v121.size.height = v33;
        MinY = v79 - CGRectGetHeight(v121);
        v37 = height;
      }
    }
    else
    {
      v98.origin.x = rect;
      v98.origin.y = y;
      v98.size.width = rect_8;
      v98.size.height = height;
      MinY = CGRectGetMinY(v98);
      v37 = height;
    }
  }
LABEL_13:
  v43 = v17;
  if ((a4 & 8) != 0)
  {
    v49 = y;
    v47 = rect;
    v48 = rect_8;
    v50 = v37;
    goto LABEL_20;
  }
  if ((a4 & 0x10) != 0)
  {
    v107.origin.y = y;
    v107.origin.x = rect;
    v107.size.width = rect_8;
    v107.size.height = v37;
    MidX = CGRectGetMidX(v107);
    v108.origin.x = v34;
    v108.origin.y = v11 + v17;
    v108.size.width = v32;
    v108.size.height = v33;
    v45 = MidX + CGRectGetWidth(v108) * -0.5;
    goto LABEL_24;
  }
  if ((a4 & 0x20) != 0)
  {
    v53 = y;
    v52 = rect;
    v54 = rect_8;
LABEL_23:
    v55 = v37;
    MaxX = CGRectGetMaxX(*(CGRect *)&v52);
    v109.origin.x = v34;
    v109.origin.y = v11 + v17;
    v109.size.width = v32;
    v109.size.height = v33;
    v45 = MaxX - CGRectGetWidth(v109);
    goto LABEL_24;
  }
  v104.origin.x = v34;
  v104.origin.y = v11 + v17;
  v104.size.width = v32;
  v104.size.height = v33;
  v124.origin.x = rect;
  v124.origin.y = y;
  v124.size.width = rect_8;
  v124.size.height = v37;
  v44 = CGRectContainsRect(v104, v124);
  v45 = v34;
  if (v44)
    goto LABEL_24;
  v105.origin.x = rect;
  v105.origin.y = y;
  v105.size.width = rect_8;
  v105.size.height = v37;
  MinX = CGRectGetMinX(v105);
  v106.origin.x = v34;
  v106.origin.y = v11 + v17;
  v106.size.width = v32;
  v106.size.height = v33;
  if (MinX < CGRectGetMinX(v106))
  {
    v47 = rect;
    v48 = rect_8;
    v49 = y;
    v50 = height;
LABEL_20:
    v45 = CGRectGetMinX(*(CGRect *)&v47);
    goto LABEL_24;
  }
  v122.origin.x = rect;
  v122.size.width = rect_8;
  v122.origin.y = y;
  v37 = height;
  v122.size.height = height;
  v80 = CGRectGetMaxX(v122);
  v123.origin.x = v34;
  v123.origin.y = v11 + v17;
  v123.size.width = v32;
  v123.size.height = v33;
  v78 = v80 <= CGRectGetMaxX(v123);
  v45 = v34;
  v54 = rect_8;
  if (!v78)
  {
    v52 = rect;
    v53 = y;
    goto LABEL_23;
  }
LABEL_24:
  v57 = v33;
  v58 = v32;
  v59 = v45 - v82;
  v60 = MinY - v43;
  if (v7)
  {
    objc_msgSend(v7, "contentOffsetFromProposedContentOffset:atScrollPosition:", a4, v45 - v82, v60);
    v59 = v61;
    v60 = v62;
  }
  v83 = CGPointZero.y;
  -[UIScrollView contentSize](self, "contentSize", *(_QWORD *)&v80);
  v64 = v63;
  v81 = v65;
  -[UIScrollView adjustedContentInset](self, "adjustedContentInset");
  v67 = v85 + v66;
  v87 = v84 + v68;
  v110.origin.x = v34;
  v110.origin.y = rect_24;
  v110.size.width = v58;
  v110.size.height = v57;
  v89 = v67;
  v69 = v60 + CGRectGetHeight(v110) + v67;
  v111.origin.x = CGPointZero.x;
  v111.origin.y = v83;
  v111.size.width = v64;
  v111.size.height = v81;
  if (v69 > CGRectGetMaxY(v111))
  {
    v112.origin.x = CGPointZero.x;
    v112.size.width = v64;
    v112.origin.y = v83;
    v112.size.height = v81;
    v70 = CGRectGetMaxY(v112);
    v113.origin.x = rect_16;
    v113.origin.y = rect_24;
    v113.size.width = v58;
    v113.size.height = v57;
    v60 = v70 - (v89 + CGRectGetHeight(v113));
  }
  v114.origin.x = rect_16;
  v114.origin.y = rect_24;
  v114.size.width = v58;
  v114.size.height = v57;
  v71 = v87 + v59 + CGRectGetWidth(v114);
  v115.origin.x = CGPointZero.x;
  v115.size.width = v64;
  v115.origin.y = v83;
  v115.size.height = v81;
  if (v71 > CGRectGetMaxX(v115))
  {
    v116.origin.x = CGPointZero.x;
    v116.size.width = v64;
    v116.origin.y = v83;
    v116.size.height = v81;
    v72 = CGRectGetMaxX(v116);
    v117.origin.x = rect_16;
    v117.origin.y = rect_24;
    v117.size.width = v58;
    v117.size.height = v57;
    v59 = v72 - (v87 + CGRectGetWidth(v117));
  }
  if (v60 >= -v89)
    v73 = v60;
  else
    v73 = -v89;
  if (v59 >= -v87)
    v74 = v59;
  else
    v74 = -v87;

  v75 = v74;
  v76 = v73;
  result.y = v76;
  result.x = v75;
  return result;
}

- (void)tui_scrollToRect:(CGRect)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 delegate:(id)a6
{
  _BOOL8 v6;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a5;
  -[UIScrollView tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:](self, "tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v8;
  v11 = v9;
  if (v8 == 0.0 && v9 < 0.0)
  {
    -[UIScrollView _scrollToTopIfPossible:](self, "_scrollToTopIfPossible:", v6);
  }
  else if (v6)
  {
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v8, v9);
  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v10, v11);
    +[CATransaction commit](CATransaction, "commit");
  }
}

@end
