@implementation PKPassGroupStackView

- (void)layoutHeaderFootersAnimated:(BOOL)a3
{
  uint64_t v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  PKPGSVTransitionInterstitialController *interstitialController;
  PKPGSVTransitionInterstitialController *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  double v23;
  PKPGSVSectionHeaderContext *paymentHeaderContext;
  double top;
  double bottom;
  double v27;
  double v28;
  PKPGSVSectionHeaderContext *passHeaderContext;
  CGFloat v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  PKPGSVSectionHeaderContext *v37;
  PKPGSVSectionHeaderContext *v38;
  PKPGSVSectionHeaderContext *v39;
  PKPGSVSectionHeaderContext *v40;
  PKPGSVSectionHeaderContext *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  char v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double y;
  double x;
  double width;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double footerViewMinimumHeight;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  CGFloat v86;
  CGFloat height;
  double v88;
  id rect;
  CGFloat recta;
  double rect_8;
  void *rect_16;
  double rect_24;
  CGRect remainder;
  CGRect slice;
  _QWORD v96[5];
  id v97;
  id v98;
  uint64_t *v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  BOOL v104;
  _QWORD v105[6];
  BOOL v106;
  char v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  BOOL v111;
  _QWORD aBlock[6];
  char v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v3 = a3;
  -[PKPassGroupStackView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  rect_24 = v11;
  v12 = 30;
  if (!self->_transitionCanceller)
    v12 = 7;
  v13 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR___PKPassGroupStackView__staggerPileAnimations[v12]);
  v114 = 0;
  v115 = &v114;
  v116 = 0x2020000000;
  v117 = 0;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke;
  aBlock[3] = &unk_1E3E6E370;
  v113 = v3;
  aBlock[4] = self;
  aBlock[5] = &v114;
  v15 = _Block_copy(aBlock);
  interstitialController = self->_interstitialController;
  if (interstitialController
    && -[PKPGSVTransitionInterstitialController isInvalidated](interstitialController, "isInvalidated"))
  {
    v17 = self->_interstitialController;
    self->_interstitialController = 0;

  }
  v18 = v13 != 7 || (*((_WORD *)&self->_layoutState + 32) & 0xC000) != 0;
  v108 = 0;
  v109 = &v108;
  v110 = 0x2020000000;
  v111 = self->_interstitialController == 0;
  v105[0] = v14;
  v105[1] = 3221225472;
  v105[2] = __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_2;
  v105[3] = &unk_1E3E6E398;
  v106 = v18;
  v105[4] = self;
  v105[5] = &v108;
  v107 = v3;
  v19 = _Block_copy(v105);
  v20 = v19;
  if (v18 && v13 != 4)
    (*((void (**)(void *, _QWORD, double))v19 + 2))(v19, 0, 0.0);
  v96[0] = v14;
  v96[1] = 3221225472;
  v96[2] = __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_3;
  v96[3] = &unk_1E3E6E3C0;
  v104 = v13 == 4;
  v96[4] = self;
  v100 = v6;
  v101 = v8;
  v102 = v10;
  v103 = rect_24;
  v21 = v15;
  v97 = v21;
  v99 = &v108;
  v22 = v20;
  v98 = v22;
  rect_16 = _Block_copy(v96);
  v118.origin.x = v6;
  v118.origin.y = v8;
  v118.size.width = v10;
  v118.size.height = rect_24;
  v23 = CGRectGetMaxY(v118) + 40.0;
  paymentHeaderContext = self->_paymentHeaderContext;
  if (paymentHeaderContext)
  {
    top = paymentHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)self->_paymentHeaderContext);
    bottom = paymentHeaderContext->_headerMargins.bottom;
    v28 = -[PKPGSVSectionHeaderContext _subheadersHeight]((uint64_t)paymentHeaderContext) + top + v27 + bottom;
    if (v13 != 2
      && __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_4((uint64_t)self->_paymentHeaderContext))
    {
      v119.origin.x = v6;
      v119.origin.y = v8;
      v119.size.width = v10;
      v119.size.height = rect_24;
      v23 = CGRectGetMinY(v119) + -40.0 - v28;
    }
    (*((void (**)(void *, PKPGSVSectionHeaderContext *, _QWORD, _QWORD, uint64_t, double))rect_16 + 2))(rect_16, self->_paymentHeaderContext, 0, 0, 1, v23);
    v23 = v28 + v23;
  }
  passHeaderContext = self->_passHeaderContext;
  if (passHeaderContext)
  {
    rect = v22;
    v30 = v8;
    v31 = v3;
    v32 = passHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)passHeaderContext);
    v34 = v33;
    v35 = passHeaderContext->_headerMargins.bottom;
    v36 = -[PKPGSVSectionHeaderContext _subheadersHeight]((uint64_t)passHeaderContext);
    if (v13 != 2)
    {
      v37 = self->_paymentHeaderContext;
      if (v37)
      {
        v38 = self->_passHeaderContext;
LABEL_23:
        v37 = (PKPGSVSectionHeaderContext *)v37->_headerView;
LABEL_24:
        v39 = v37;
        v40 = self->_paymentHeaderContext;
        if (v40)
          v40 = (PKPGSVSectionHeaderContext *)v40->_subheaderContexts;
        v41 = v40;
        -[PKPGSVSectionHeaderContext lastObject](v41, "lastObject");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        if (v42)
          v44 = *(void **)(v42 + 8);
        else
          v44 = 0;
        v45 = v44;
        (*((void (**)(void *, PKPGSVSectionHeaderContext *, PKPGSVSectionHeaderContext *, id, BOOL, double))rect_16
         + 2))(rect_16, v38, v39, v45, self->_paymentHeaderContext == 0, v23);

        v3 = v31;
        v8 = v30;
        v22 = rect;
        goto LABEL_29;
      }
      v85 = v36;
      if (__52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_4((uint64_t)self->_passHeaderContext))
      {
        v124.origin.x = v6;
        v124.origin.y = v30;
        v124.size.width = v10;
        v124.size.height = rect_24;
        v23 = CGRectGetMinY(v124) + -40.0 - (v85 + v32 + v34 + v35);
      }
    }
    v37 = self->_paymentHeaderContext;
    v38 = self->_passHeaderContext;
    if (!v37)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_29:
  if (!*((_BYTE *)v109 + 24))
    (*((void (**)(id, _QWORD, double))v22 + 2))(v22, 0, 0.0);
  v115[3] = *(_QWORD *)&self->_footerAnimationDelay;
  if (self->_footerView)
  {
    if (v13 == 4)
      v46 = !-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
    else
      v46 = 0;
    -[PKPassGroupStackView contentSize](self, "contentSize");
    v48 = v47;
    -[UIImageView image](self->_footerPocketBackgroundShadow, "image");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "size");
    v51 = v50;
    recta = v6;

    -[UIImageView image](self->_footerPocketForegroundShadow, "image");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "size");
    v88 = v53;
    v54 = *MEMORY[0x1E0C9D538];
    v55 = *(double *)(MEMORY[0x1E0C9D538] + 8);

    memset(&slice, 0, sizeof(slice));
    remainder.origin.x = v54;
    remainder.origin.y = v55;
    remainder.size.width = v10;
    remainder.size.height = fmax(v48, rect_24);
    v120.origin.x = v54;
    v120.origin.y = v55;
    v120.size.width = v10;
    height = remainder.size.height;
    v120.size.height = remainder.size.height;
    CGRectDivide(v120, &slice, &remainder, self->_lastBoundsInsets.bottom, CGRectMaxYEdge);
    CGRectDivide(remainder, &slice, &remainder, self->_footerViewMinimumHeight, CGRectMaxYEdge);
    y = slice.origin.y;
    rect_8 = v10;
    if ((v46 & 1) == 0)
    {
      v121.origin.x = recta;
      v121.origin.y = v8;
      v121.size.width = v10;
      v121.size.height = rect_24;
      y = fmax(v51, v88)
        + 40.0
        + fmax(slice.origin.y + self->_footerViewMinimumHeight + self->_lastBoundsInsets.bottom, CGRectGetMaxY(v121));
      slice.origin.y = y;
    }
    x = slice.origin.x;
    width = slice.size.width;
    -[UIImageView layer](self->_footerPocketBackgroundShadow, "layer", *(_QWORD *)&v8);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "anchorPoint");
    v61 = v60;
    v63 = v62;

    (*((void (**)(id, UIImageView *, PKPassGroupStackView *, _QWORD, _QWORD, _QWORD, double, double, double, double, double, double, double))v21
     + 2))(v21, self->_footerPocketBackgroundShadow, self, 0, 0, 0, x + v61 * width, y - v51 + v63 * v51, v54, v55, width, v51, 1.0);
    v3 = v3;
    -[PKPassGroupStackView _xFrameForGroupViewInState:](self, "_xFrameForGroupViewInState:", 4);
    v65 = v64;
    v67 = v66;
    v68 = slice.origin.y;
    -[UIImageView layer](self->_footerPocketForegroundShadow, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "anchorPoint");
    v71 = v70;
    v73 = v72;

    (*((void (**)(id, UIImageView *, PKPassGroupStackView *, PKPassthroughView *, _QWORD, _QWORD, double, double, double, double, double, double, double))v21
     + 2))(v21, self->_footerPocketForegroundShadow, self, self->_passContainerView, 0, 0, v65 + v71 * v67, v68 - v88 + v73 * v88, v54, v55, v67, v88, self->_footerPocketForegroundShadowAlpha);
    footerViewMinimumHeight = self->_footerViewMinimumHeight;
    v75 = self->_lastBoundsInsets.bottom;
    v122.origin.x = recta;
    v122.size.width = rect_8;
    v122.origin.y = v86;
    v122.size.height = rect_24;
    CGRectGetMaxY(v122);
    v123.origin.x = v54;
    v123.origin.y = v55;
    v123.size.width = rect_8;
    v123.size.height = height;
    CGRectGetMaxY(v123);
    PKFloatCeilToPixel();
    v77 = v76;
    -[UIView layer](self->_footerView, "layer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "anchorPoint");
    v80 = v79;
    v82 = v81;

    v83 = slice.origin.x;
    PKFloatFloorToPixel();
    (*((void (**)(id, UIView *, PKPassGroupStackView *, PKPassthroughView *, _QWORD, _QWORD, double, CGFloat, double, double, double, double, double))v21
     + 2))(v21, self->_footerView, self, self->_passContainerView, 0, 0, v83 + v84 + v80 * rect_8, slice.origin.y + v82 * (footerViewMinimumHeight + v75 + v77), v54, v55, rect_8, footerViewMinimumHeight + v75 + v77, 1.0);
  }
  -[PKPassGroupStackView _updateTopContentSeparatorVisibilityAnimated:](self, "_updateTopContentSeparatorVisibilityAnimated:", v3);
  -[PKPassGroupStackView _updateBottomContentSeparatorVisibilityAnimated:](self, "_updateBottomContentSeparatorVisibilityAnimated:", v3);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);
}

- (CGPoint)_positionForGroupView:(id)a3 atIndex:(unint64_t)a4 forState:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PKPassthroughView *v13;
  PKPassthroughView *passContainerView;
  PKPassthroughView *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  v8 = a3;
  -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", a4, a5);
  v10 = v9;
  -[PKPassGroupStackView _xPositionForGroupView:forState:](self, "_xPositionForGroupView:forState:", v8, a5);
  v12 = v11;
  objc_msgSend(v8, "superview");
  v13 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
  passContainerView = self->_passContainerView;

  if (v13 != passContainerView)
  {
    v15 = self->_passContainerView;
    objc_msgSend(v8, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassthroughView convertPoint:toView:](v15, "convertPoint:toView:", v16, v12, v10);
    v12 = v17;
    v10 = v18;

  }
  v19 = v12;
  v20 = v10;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)_yPositionForGroupAtIndex:(unint64_t)a3 forState:(int64_t)a4
{
  double v6;
  double result;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  PKPassGroupView *modallyPresentedGroupView;
  void *v19;
  void *v20;
  PKPassGroupView *v21;
  double v22;
  double v23;
  PKPassGroupView *v24;
  PKPassGroupView *v25;
  PKPassGroupView *v26;
  PKPassGroupView *v27;
  PKPassGroupView *v28;
  PKPassGroupView *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  double MaxY;
  void *v40;
  void *v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  switch(a4)
  {
    case 1:
    case 2:
      goto LABEL_2;
    case 3:
      if (self->_modalGroupIndex != a3
        && self->_layoutState.groups.count != 1
        && !-[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", a3))
      {
        goto LABEL_2;
      }
      -[PKPassGroupStackView bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[PKPassGroupStackView convertRect:toView:](self, "convertRect:toView:", 0);
      v17 = v16;
      modallyPresentedGroupView = self->_modallyPresentedGroupView;
      if (!modallyPresentedGroupView)
        goto LABEL_22;
      -[PKPassGroupView frontmostPassView](modallyPresentedGroupView, "frontmostPassView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "style");

      v21 = self->_modallyPresentedGroupView;
      if (v21)
      {
        -[PKPassGroupView bounds](v21, "bounds");
        v23 = v22;
      }
      else
      {
LABEL_22:
        PKPassFrontFaceContentSize();
        v23 = v30;
      }
      v45.origin.x = v9;
      v45.origin.y = v11;
      v45.size.width = v13;
      v45.size.height = v15;
      v31 = CGRectGetMinY(v45) - v17 - v23;
      PKPassFaceShadowInsets();
      v33 = v31 - v32;
      PKPassFaceShadowInsets();
      return v33 - v34;
    case 4:
      -[PKPassGroupStackView _yForGroupInTableAtIndex:](self, "_yForGroupInTableAtIndex:", a3);
      return result;
    case 5:
      v24 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
      v25 = self->_modallyPresentedGroupView;

      if (v24 == v25)
      {
        -[PKPassGroupStackView _yForModallyPresentedGroup](self, "_yForModallyPresentedGroup");
        return result;
      }
      if (-[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", a3))
      {
        -[PKPassGroupStackView _yForGroupInModalPileAtIndex:](self, "_yForGroupInModalPileAtIndex:", a3);
        return result;
      }
      v36 = -[PKPassGroupStackView _rangeOfVisibleIndexesIgnoringBottomInset:](self, "_rangeOfVisibleIndexesIgnoringBottomInset:", 1);
      v37 = v35;
      if (a3 >= v36 && a3 - v36 < v35)
      {
        -[PKPassGroupStackView _yForGroupInPileAtIndex:](self, "_yForGroupInPileAtIndex:", a3);
        return result;
      }
      v38 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
      -[PKPassGroupStackView bounds](self, "bounds");
      MaxY = CGRectGetMaxY(v46);
      objc_msgSend(v38, "frontmostPassView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "pass");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "style");
      PKPassFaceShadowInsets();
      v6 = MaxY + v42;

      if (v36 + v37 <= a3)
      {
        -[PKPassGroupStackView _pileAscenderHeight](self, "_pileAscenderHeight");
        v6 = v6 + v43;
      }

      return v6;
    case 6:
      v26 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
      v27 = self->_modallyPresentedGroupView;

      if (v26 == v27)
        -[PKPassGroupStackView _yForSingleGroupView:](self, "_yForSingleGroupView:", self->_modallyPresentedGroupView);
      else
        -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", a3, 2);
      return result;
    case 7:
      v28 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
      v29 = self->_modallyPresentedGroupView;

      if (v28 == v29)
      {
        -[PKPassGroupStackView _yForExternalModallyPresentedGroup](self, "_yForExternalModallyPresentedGroup");
      }
      else if (-[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", a3))
      {
        -[PKPassGroupStackView _yForExternalModallyPresentedGroup](self, "_yForExternalModallyPresentedGroup");
        -[PKPassGroupStackView _yForGroupInExternalModalPileWithModalGroupY:](self, "_yForGroupInExternalModalPileWithModalGroupY:");
      }
      else
      {
LABEL_2:
        -[PKPassGroupStackView bounds](self, "bounds");
        return CGRectGetMaxY(v44) + 40.0;
      }
      return result;
    default:
      return (double)a3 * self->_layoutState.groupCellHeight + -3.0;
  }
}

- (double)_xPositionForGroupView:(id)a3 forState:(int64_t)a4
{
  double v4;
  double v5;

  -[PKPassGroupStackView _xFrameForGroupViewInState:](self, "_xFrameForGroupViewInState:", a4);
  return v4 + v5 * 0.5;
}

- (CGRect)_xFrameForGroupViewInState:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  PKPassFrontFaceContentSize();
  -[PKPassGroupStackView bounds](self, "bounds");
  PKSizeAlignedInRect();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

void __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, int a5, double a6)
{
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double *v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __n128 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id *v45;
  id *v46;
  BOOL v47;
  id v48;
  double v49;
  uint64_t v50;
  __n128 v51;
  __n128 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  double *v63;
  double *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  if (v11)
    v14 = (void *)v11[5];
  else
    v14 = 0;
  v15 = v14;
  v16 = *(void **)(a1 + 32);
  v17 = *(double *)(a1 + 64);
  v18 = *(double *)(a1 + 72);
  v19 = *(double *)(a1 + 80);
  v20 = *(double *)(a1 + 88);
  if (*(_BYTE *)(a1 + 96))
    v21 = (double *)objc_msgSend(v16, "_layoutStateForHeaderContext:inTableWithBounds:", v11, v17, v18, v19, v20);
  else
    v21 = (double *)objc_msgSend(v16, "_layoutStateForHeaderContext:offscreenWithBounds:offset:", v11, v17, v18, v19, v20, a6);
  v22 = v21;
  if (v15)
  {
    if (a5 && !*(_BYTE *)(a1 + 96))
    {
      v63 = (double *)objc_msgSend(*(id *)(a1 + 32), "_layoutStateForHeaderContext:inTableWithBounds:", v11, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      if (v63)
      {
        v24 = v63[4];
        v23 = v63[5];
        v25 = v63[6];
      }
      else
      {
        v23 = 0.0;
        v25 = 0.0;
        v24 = 0.0;
      }

    }
    else if (v21)
    {
      v24 = v21[4];
      v23 = v21[5];
      v25 = v21[6];
    }
    else
    {
      v24 = 0.0;
      v23 = 0.0;
      v25 = 0.0;
    }
    v26 = *(_QWORD *)(a1 + 40);
    v27 = -[PKPGSVSectionHeaderContext positionForHeaderViewInContainerFrame:]((uint64_t)v11, v24, v23, v25);
    v29 = v28;
    -[PKPGSVSectionHeaderContext boundsForHeaderViewInContainerFrame:]((uint64_t)v11, v24, v23, v25);
    if (v22)
      v34.n128_f64[0] = v22[2];
    else
      v34.n128_u64[0] = 0;
    (*(void (**)(uint64_t, id, _QWORD, id, _QWORD, _QWORD, double, double, double, double, double, double, __n128))(v26 + 16))(v26, v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2568), v12, 0, 0, v27, v29, v30, v31, v32, v33, v34);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(v15, "interstitialProvider");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_msgSend(v15, "layoutIfNeeded");
        v36 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v15, "alpha");
        (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v35);
      }

    }
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = v12;
  v67 = v11;
  v64 = v22;
  v65 = v15;
  if (v22)
    v37 = (void *)*((_QWORD *)v22 + 3);
  else
    v37 = 0;
  v38 = v37;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v69;
    do
    {
      v42 = 0;
      v43 = v13;
      do
      {
        if (*(_QWORD *)v69 != v41)
          objc_enumerationMutation(v38);
        v44 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v42);
        if (v44)
        {
          v45 = (id *)*(id *)(v44 + 8);
          v46 = v45;
          v47 = v45 == 0;
          if (v45)
            v48 = v45[1];
          else
            v48 = 0;
          v13 = v48;
          v49 = *(double *)(v44 + 16);
        }
        else
        {
          v13 = 0;
          v46 = 0;
          v47 = 1;
          v49 = 0.0;
        }
        v50 = *(_QWORD *)(a1 + 40);
        v53 = -[PKPGSVSectionSubheaderContext positionForViewInContainerFrame:]((uint64_t)v46, v49);
        v55 = v54;
        if (v47)
        {
          v52.n128_u64[0] = 0;
          v51.n128_u64[0] = 0;
          v59 = 0.0;
          v57 = 0.0;
        }
        else
        {
          objc_msgSend(v46[1], "bounds", v64, v65, v66, v67, (_QWORD)v68);
          v57 = v56;
          v59 = v58;
          v51.n128_u64[0] = v60;
          v52.n128_u64[0] = v61;
        }
        (*(void (**)(uint64_t, id, _QWORD, void *, uint64_t, BOOL, double, double, double, double, __n128, __n128, double))(v50 + 16))(v50, v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2576), v43, 1, a6 < 0.0, v53, v55, v57, v59, v51, v52, 1.0);

        ++v42;
        v43 = v13;
      }
      while (v40 != v42);
      v62 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      v40 = v62;
    }
    while (v62);
  }

}

- (_NSRange)_rangeOfVisibleIndexesIgnoringBottomInset:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  double MaxY;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  NSUInteger v11;
  PKPassGroupView *reorderedGroupView;
  void *v13;
  unint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;
  CGRect v18;

  v3 = a3;
  v5 = -[PKPassGroupStackView _startVisibleIndex](self, "_startVisibleIndex");
  -[PKPassGroupStackView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v18);
  if (v3)
    MaxY = MaxY - self->_lastBoundsInsets.bottom;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = v5 + v7;
    if (!v9)
      break;
    if (v9 - 1 >= self->_layoutState.groups.count)
      break;
    -[PKPassGroupStackView _yForGroupInTableAtIndex:](self, "_yForGroupInTableAtIndex:");
    v7 = v8 + 1;
  }
  while (v10 < MaxY);
  v11 = v8 - 1;
  if ((*(_BYTE *)&self->_reorderingFlags & 1) != 0)
  {
    reorderedGroupView = self->_reorderedGroupView;
    if (reorderedGroupView)
    {
      -[PKPassGroupView layer](reorderedGroupView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "position");
      v14 = -[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 1);

      if (v14 >= 2)
      {
        if (v14 - 1 >= v5)
        {
          if (v14 - 1 >= v11 + v5)
            v11 = v14 - v5;
        }
        else
        {
          v11 = v5 - v14 + v8;
          v5 = v14 - 1;
        }
      }
    }
  }
  v15 = v5;
  v16 = v11;
  result.length = v16;
  result.location = v15;
  return result;
}

- (double)_yForGroupInTableAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;
  double MaxY;
  double v15;
  double v16;
  double v17;
  PKPGSVSectionHeaderContext *paymentHeaderContext;
  NSArray *v19;
  _BOOL8 v20;
  PKPGSVSectionHeaderContext *passHeaderContext;
  NSArray *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t separatorIndex;
  BOOL v26;

  -[PKPassGroupStackView bounds](self, "bounds");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  if (self->_layoutState.groups.count <= a3)
  {
    MaxY = CGRectGetMaxY(*(CGRect *)&v5);
    PKPassFaceShadowInsets();
    return MaxY + v15;
  }
  else if (-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
  {
    -[PKPassGroupStackView _yForModallyPresentedGroup](self, "_yForModallyPresentedGroup");
  }
  else
  {
    -[PKPassGroupStackView _nativeYForGroupInTableAtIndex:](self, "_nativeYForGroupInTableAtIndex:", a3);
    v17 = v16;
    paymentHeaderContext = self->_paymentHeaderContext;
    if (paymentHeaderContext)
    {
      v19 = paymentHeaderContext->_subheaderContexts;
      v20 = v19 != 0;

    }
    else
    {
      v20 = 0;
    }
    passHeaderContext = self->_passHeaderContext;
    if (passHeaderContext)
    {
      v22 = passHeaderContext->_subheaderContexts;
      v23 = v22 != 0;

    }
    else
    {
      v23 = 0;
    }
    v24 = v20 + a3;
    separatorIndex = self->_layoutState.groups.separatorIndex;
    v26 = separatorIndex == 0x7FFFFFFFFFFFFFFFLL || separatorIndex >= a3;
    if (!v26 || (*((_BYTE *)&self->_layoutState.groups + 16) & 2) == 0)
      v24 += v23;
    -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", v24, v17, v9, v10, v11, v12);
    if (self->_pressedGroupViewIndex == a3)
      return result + -15.0;
  }
  return result;
}

- (BOOL)isTableModalPresentation
{
  if (self->_layoutState.groups.count == 1)
    return !-[PKPassGroupStackView _isModalPresentationAllowedForSingleGroup](self, "_isModalPresentationAllowedForSingleGroup");
  else
    return 0;
}

- (double)_transformedYForNativeYInTable:(double)a3 withBounds:(CGRect)a4 index:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double MaxY;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a5 || a4.origin.y < 0.0)
  {
    PKPassStackScrollingAdjustedPosition();
    v10 = v11;
  }
  else
  {
    v10 = fmax(a3, a4.origin.y);
  }
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxY = CGRectGetMaxY(v16);
  PKPassFaceShadowInsets();
  v14 = fmin(v10, MaxY + v13 + self->_layoutState.groupCellHeight);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  return fmax(v14, CGRectGetMinY(v17));
}

- (double)_nativeYForGroupInTableAtIndex:(unint64_t)a3
{
  double v5;
  unint64_t separatorIndex;
  double v7;
  double separationPadding;

  v5 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext)
     + (double)a3 * self->_layoutState.groupCellHeight;
  separatorIndex = self->_layoutState.groups.separatorIndex;
  if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((*((_BYTE *)&self->_layoutState.groups + 16) & 6) == 4)
    {
      v7 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
      return v5 + v7;
    }
  }
  else if (separatorIndex < a3)
  {
    separationPadding = self->_layoutState.separationPadding;
    v7 = separationPadding + -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
    return v5 + v7;
  }
  return v5;
}

- (unint64_t)_startVisibleIndex
{
  -[PKPassGroupStackView contentOffset](self, "contentOffset");
  -[PKPassGroupStackView _nativePositionForPositionInTable:](self, "_nativePositionForPositionInTable:");
  return -[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 0);
}

- (CGPoint)_nativePositionForPositionInTable:(CGPoint)a3
{
  CGFloat x;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  x = a3.x;
  PKPassStackScrollingStretchRegionLowerBoundary();
  v5 = fmax(v4, 0.0);
  v6 = x;
  result.y = v5;
  result.x = v6;
  return result;
}

- (unint64_t)_indexForNativePositionInTable:(CGPoint)a3 roundToClosestIndex:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  __int16 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;

  v4 = a4;
  y = a3.y;
  p_layoutState = &self->_layoutState;
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKPassGroupStackView _nativeYForGroupInTableAtIndex:](self, "_nativeYForGroupInTableAtIndex:", a3.x);
    if (y >= v8)
    {
      v9 = v8;
      v10 = v8 + p_layoutState->groupCellHeight;
      -[PKPassGroupStackView _nativeYForGroupInTableAtIndex:](self, "_nativeYForGroupInTableAtIndex:", p_layoutState->groups.separatorIndex + 1);
      v12 = fmax(v10, v11);
      if (y >= v12)
      {
        y = y - (v12 - v10);
      }
      else
      {
        -[PKPassGroupStackView contentOffset](self, "contentOffset");
        -[PKPassGroupStackView _nativePositionForPositionInTable:](self, "_nativePositionForPositionInTable:");
        if (v13 > v12 || v13 <= v9)
          v15 = v9;
        else
          v15 = v13;
        y = v10 * ((y - v15) / (v12 - v15)) + (1.0 - (y - v15) / (v12 - v15)) * v9;
      }
    }
  }
  v16 = *((_WORD *)p_layoutState + 32);
  if ((v16 & 2) == 0)
  {
    v17 = 0.0;
    if ((v16 & 4) == 0)
      goto LABEL_18;
LABEL_17:
    v17 = v17 + -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
    goto LABEL_18;
  }
  v17 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext) + 0.0;
  if ((*((_BYTE *)&p_layoutState->groups + 16) & 2) == 0 && (*((_WORD *)p_layoutState + 32) & 4) != 0)
    goto LABEL_17;
LABEL_18:
  v18 = fmax(y - v17, 0.0) / p_layoutState->groupCellHeight;
  v19 = round(v18);
  if (v4)
    v18 = v19;
  v20 = fmax(v18, 0.0);
  v21 = p_layoutState->groups.count - 1;
  if (!p_layoutState->groups.count)
    v21 = 0;
  if (v21 >= (unint64_t)v20)
    return (unint64_t)v20;
  else
    return v21;
}

- (id)_layoutStateForHeaderContext:(id)a3 offscreenWithBounds:(CGRect)a4 offset:(double)a5
{
  CGFloat width;
  CGFloat x;
  double *v8;
  _QWORD *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize size;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  CGSize v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGRect remainder;
  CGRect slice;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;

  width = a4.size.width;
  x = a4.origin.x;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = (double *)a3;
  v9 = -[PKPGSVSectionHeaderLayoutState initWithContext:]([PKPGSVSectionHeaderLayoutState alloc], v8);
  v10 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)v8);
  if (v8)
  {
    v11 = v8[7];
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)v8);
    v13 = v8[9] + v11 + v12;
  }
  else
  {
    v13 = 0.0;
  }
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v38.origin.x = x;
  v38.origin.y = a5;
  v38.size.width = width;
  v38.size.height = v10;
  CGRectDivide(v38, &slice, &remainder, v13, CGRectMinYEdge);
  if (v9)
  {
    size = slice.size;
    *((_OWORD *)v9 + 2) = slice.origin;
    *((CGSize *)v9 + 3) = size;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = (void *)v9[3];
  }
  else
  {
    v15 = 0;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
  }
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20);
        if (v21)
        {
          v22 = *(id *)(v21 + 8);
          v23 = (double *)v22;
          if (v22)
          {
            v24 = *((double *)v22 + 2);
            objc_msgSend(*((id *)v22 + 1), "bounds", (_QWORD)v30);
            v26 = v23[4] + v24 + v25;
            goto LABEL_13;
          }
        }
        else
        {
          v23 = 0;
        }
        v26 = 0.0;
LABEL_13:
        CGRectDivide(remainder, &slice, &remainder, v26, CGRectMinYEdge);
        if (v21)
        {
          v27 = slice.size;
          *(CGPoint *)(v21 + 16) = slice.origin;
          *(CGSize *)(v21 + 32) = v27;
        }

        ++v20;
      }
      while (v18 != v20);
      v28 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      v18 = v28;
    }
    while (v28);
  }

  return v9;
}

- (id)_loadGroupViewAtIndex:(unint64_t)a3 forState:(int64_t)a4 presentationState:(int64_t)a5 cached:(BOOL *)a6
{
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  PKPassGroupView *v15;
  BOOL v16;
  PKPassGroupView *v17;
  void *v18;
  id result;
  PKPassthroughView *v20;
  PKPassthroughView *passContainerView;
  PKPassGroupView **p_modallyPresentedGroupView;
  PKPassGroupView *modallyPresentedGroupView;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  _OWORD v34[8];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGPoint v43;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  objc_msgSend(WeakRetained, "groupAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_msgSend(v12, "groupID"), (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17 = 0;
    *a6 = 0;
LABEL_25:

    return v17;
  }
  v14 = (void *)v13;
  v15 = -[PKPassGroupStackView _groupViewWithGroupID:](self, "_groupViewWithGroupID:", v13);
  v16 = v15 != 0;
  if (v15)
  {
    v17 = v15;
    *a6 = v16;
LABEL_7:
    -[PKPassGroupView superview](v17, "superview");
    v20 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
    passContainerView = self->_passContainerView;

    if (v20 != passContainerView)
      -[PKPassGroupStackView _addGroupViewAsSubview:forIndex:](self, "_addGroupViewAsSubview:forIndex:", v17, a3);
    if (self->_modalGroupIndex != a3
      || (p_modallyPresentedGroupView = &self->_modallyPresentedGroupView,
          modallyPresentedGroupView = self->_modallyPresentedGroupView,
          modallyPresentedGroupView == v17))
    {
      v24 = 0;
    }
    else
    {
      if (modallyPresentedGroupView)
      {
        -[PKPassGroupView setModallyPresented:](modallyPresentedGroupView, "setModallyPresented:", 0);
        -[PKPassGroupStackView _removePanGestureRecognizerFromGroupView:](self, "_removePanGestureRecognizerFromGroupView:", *p_modallyPresentedGroupView);
      }
      objc_storeStrong((id *)&self->_modallyPresentedGroupView, v17);
      -[PKPassGroupStackView _updatePanGestureRecognizerForGroupView:](self, "_updatePanGestureRecognizerForGroupView:", *p_modallyPresentedGroupView);
      v24 = 1;
    }
    -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v17, a3, a4);
    v26 = v25;
    v28 = v27;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[PKPassGroupStackView _transformForGroupView:atIndex:forState:](self, "_transformForGroupView:atIndex:forState:", v17, a3, a4);
    if (self->_loanedGroupView != v17)
    {
      -[PKPassGroupView setCenter:](v17, "setCenter:", v26, v28);
      v34[4] = v39;
      v34[5] = v40;
      v34[6] = v41;
      v34[7] = v42;
      v34[0] = v35;
      v34[1] = v36;
      v34[2] = v37;
      v34[3] = v38;
      -[PKPassGroupView setTransform3D:](v17, "setTransform3D:", v34);
    }
    if (v24)
    {
      -[PKPassGroupView setModallyPresented:](self->_modallyPresentedGroupView, "setModallyPresented:", 1);
      -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setContentMode:", 5);

    }
    -[PKPassGroupStackView bounds](self, "bounds");
    if (self->_loanedGroupView != v17)
    {
      if (v31 < 0.0)
      {
        v43.x = v26;
        v43.y = v28;
        if (CGRectContainsPoint(*(CGRect *)&v30, v43))
          -[PKPassGroupView applyContentModesAnimated:](v17, "applyContentModesAnimated:", 0);
      }
      -[PKPassGroupView updatePageControlFrameAnimated:](v17, "updatePageControlFrameAnimated:", 0);
    }
    -[PKPassGroupView setHidden:](v17, "setHidden:", 0);

    goto LABEL_25;
  }
  v17 = -[PKPassGroupView initWithGroup:delegate:presentationState:]([PKPassGroupView alloc], "initWithGroup:delegate:presentationState:", v12, self, a5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupViewsByGroupID, "setObject:forKeyedSubscript:", v17, v14);
  -[PKPassGroupView sizeToFit](v17, "sizeToFit");
  -[PKPassGroupView pageControl](v17, "pageControl");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCurrentPageIndicatorTintColor:", self->_currentPageIndicatorTintColor);
  objc_msgSend(v18, "setPageIndicatorTintColor:", self->_pageIndicatorTintColor);
  -[PKPassGroupView setPresentationState:](v17, "setPresentationState:", 1);

  *a6 = v16;
  if (v17)
    goto LABEL_7;
  __break(1u);
  return result;
}

void __67__PKPassGroupStackView__layoutContentFromOffset_toOffset_animated___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  id v26;
  float v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  CATransform3D v35;
  CATransform3D a;
  CATransform3D v37;
  CATransform3D v38;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(id *)(v6 + 2624) != v5 || *(unsigned __int16 *)(v6 + 2280) >= 0x4000u)
  {
    if (*(_BYTE *)(a1 + 96) && *(_BYTE *)(a1 + 97) && *(_QWORD *)(a1 + 56) > a3)
      v7 = (id *)(a1 + 40);
    else
      v7 = (id *)(a1 + 48);
    v8 = *v7;
    objc_msgSend(v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "position");
    v11 = v10 + *(double *)(a1 + 64) - *(double *)(a1 + 80);
    v13 = v12 + *(double *)(a1 + 72) - *(double *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "_positionForGroupView:atIndex:forState:", v5, a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2112));
    v16 = v15;
    v17 = v14;
    if (v15 != v11 || v14 != v13)
    {
      objc_msgSend(v8, "highFrameRateSpringAnimationForView:withKeyPath:reason:", v5, CFSTR("position"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v11, v13, v16, v17);
        v21 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v20);
      }

    }
    objc_msgSend(v9, "setPosition:", v16, v17);
    v22 = 0uLL;
    memset(&v38, 0, sizeof(v38));
    if (v9)
    {
      objc_msgSend(v9, "transform");
      v22 = 0uLL;
    }
    *(_OWORD *)&v37.m41 = v22;
    *(_OWORD *)&v37.m43 = v22;
    *(_OWORD *)&v37.m31 = v22;
    *(_OWORD *)&v37.m33 = v22;
    *(_OWORD *)&v37.m21 = v22;
    *(_OWORD *)&v37.m23 = v22;
    *(_OWORD *)&v37.m11 = v22;
    *(_OWORD *)&v37.m13 = v22;
    v23 = *(_QWORD **)(a1 + 32);
    if (v23)
      objc_msgSend(v23, "_transformForGroupView:atIndex:forState:", v5, a3, v23[264]);
    a = v38;
    v35 = v37;
    if (!CATransform3DEqualToTransform(&a, &v35))
    {
      objc_msgSend(v8, "highFrameRateSpringAnimationForView:withKeyPath:reason:", v5, CFSTR("transform"), 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        a = v38;
        v35 = v37;
        objc_msgSend(v24, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v35);
        v26 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v25);
      }
      a = v37;
      objc_msgSend(v9, "setTransform:", &a);

    }
    objc_msgSend(v9, "opacity");
    v28 = v27;
    objc_msgSend(*(id *)(a1 + 32), "_opacityForGroupAtIndex:withGroupView:forState:", a3, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2112));
    if (v29 != v28)
    {
      v30 = v29;
      objc_msgSend(*(id *)(a1 + 48), "springAnimationForView:withKeyPath:", v5, CFSTR("opacity"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v31;
      if (v31)
      {
        objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v28, v30);
        v34 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v33);
      }
      *(float *)&v32 = v30;
      objc_msgSend(v9, "setOpacity:", v32);

    }
  }

}

- (CATransform3D)_transformForGroupView:(SEL)a3 atIndex:(id)a4 forState:(unint64_t)a5
{
  CGFloat v7;

  -[PKPassGroupStackView _scaleForGroupView:atIndex:forState:](self, "_scaleForGroupView:atIndex:forState:", a4, a5, a6);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  return CATransform3DMakeScale(retstr, v7, v7, 1.0);
}

- (double)_scaleForGroupView:(id)a3 atIndex:(unint64_t)a4 forState:(int64_t)a5
{
  PKPassGroupView *v8;
  PKPassGroupView *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  CGRect v15;

  v8 = (PKPassGroupView *)a3;
  v9 = v8;
  if (a5 == 7)
  {
    if (self->_modallyPresentedGroupView == v8)
    {
      -[PKPassGroupStackView _scaleForModallyPresentedGroupInExternalPresentation](self, "_scaleForModallyPresentedGroupInExternalPresentation");
      goto LABEL_17;
    }
    if (!-[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", a4))
    {
      -[PKPassGroupStackView _scaleForStackGroupInExternalPresentation](self, "_scaleForStackGroupInExternalPresentation");
      goto LABEL_17;
    }
LABEL_14:
    -[PKPassGroupStackView _scaleForModalPileGroup](self, "_scaleForModalPileGroup");
LABEL_17:
    v12 = v13;
    goto LABEL_18;
  }
  if (a5 != 5 || self->_modallyPresentedGroupView == v8)
    goto LABEL_10;
  if (-[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", a4))
    goto LABEL_14;
  v10 = -[NSMutableArray indexOfObject:](self->_passPileViews, "indexOfObject:", v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    v12 = (float)((float)v10 * -0.01) + 1.0;
    goto LABEL_18;
  }
  -[PKPassGroupStackView bounds](self, "bounds");
  v11 = 0.0;
  if (-[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 0, 0.0, CGRectGetMaxY(v15)) <= a4)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if ((unint64_t)-[NSMutableArray count](self->_passPileViews, "count") >= 2)
    v11 = (float)((float)(unint64_t)(-[NSMutableArray count](self->_passPileViews, "count") - 1) * 0.01);
  v12 = 1.0 - v11;
LABEL_18:

  return v12;
}

- (_NSRange)_rangeOfVisibleIndexes
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[PKPassGroupStackView _rangeOfVisibleIndexesIgnoringBottomInset:](self, "_rangeOfVisibleIndexesIgnoringBottomInset:", 0);
  result.length = v3;
  result.location = v2;
  return result;
}

void __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5, int a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  double v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  uint64_t v47;
  double MinY;
  double v52;
  double v53;
  double MaxY;
  double v55;
  id v56;
  double v57;
  double v58;
  double v59;
  id v60;

  v60 = a2;
  v25 = a3;
  v26 = a4;
  if (v60)
  {
    objc_msgSend(v60, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), a7, a8);
    v29 = v28;
    v31 = v30;
    objc_msgSend(v60, "superview");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      if (!*(_BYTE *)(a1 + 48))
        goto LABEL_20;
      v58 = a9;
      v59 = a12;
      v33 = a10;
      v34 = a11;
      objc_msgSend(v27, "position");
      v36 = v35;
      v38 = v37;
      objc_msgSend(v27, "opacity");
      v40 = v39;
      if (v36 != v29 || v38 != v31)
      {
        objc_msgSend(MEMORY[0x1E0D676D0], "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("position"), 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v36, v38, v29, v31);
        objc_msgSend(v41, "setBeginTime:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        v42 = (id)objc_msgSend(v27, "pkui_addAdditiveAnimation:", v41);

      }
      a11 = v34;
      a10 = v33;
      a9 = v58;
      a12 = v59;
      if (v40 == a13)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v40, a13);
    }
    else
    {
      if (v26
        && (objc_msgSend(v26, "superview"), v44 = (id)objc_claimAutoreleasedReturnValue(), v44, v44 == v25))
      {
        objc_msgSend(v25, "insertSubview:aboveSubview:", v60, v26);
      }
      else
      {
        objc_msgSend(v25, "insertSubview:atIndex:", v60, 0);
      }
      if (!*(_BYTE *)(a1 + 48))
        goto LABEL_20;
      LODWORD(v45) = 0;
      objc_msgSend(v27, "setOpacity:", v45);
      objc_msgSend(v27, "pkui_animateToOpacity:withCompletion:", 0, a13);
      if (!a5)
        goto LABEL_20;
      v46 = a9;
      objc_msgSend(v25, "bounds");
      if (a6)
      {
        MinY = CGRectGetMinY(*(CGRect *)&v47);
        objc_msgSend(v27, "anchorPoint");
        v53 = MinY - v52 * a12;
      }
      else
      {
        MaxY = CGRectGetMaxY(*(CGRect *)&v47);
        objc_msgSend(v27, "anchorPoint");
        v53 = MaxY + v55 * a12;
      }
      objc_msgSend(MEMORY[0x1E0D676D0], "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("position"), 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v29, v53, v29, v31);
      objc_msgSend(v43, "setBeginTime:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      a9 = v46;
    }
    v56 = (id)objc_msgSend(v27, "pkui_addAdditiveAnimation:", v43);

LABEL_20:
    objc_msgSend(v27, "setPosition:", v29, v31);
    objc_msgSend(v27, "setBounds:", a9, a10, a11, a12);
    *(float *)&v57 = a13;
    objc_msgSend(v27, "setOpacity:", v57);

  }
}

- (void)_enumerateLoadedGroupViews:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, id);
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, id))a3;
  v19 = 0;
  v5 = -[PKPassGroupStackView _createSortedGroupViewIndexesWithMap:](self, "_createSortedGroupViewIndexesWithMap:", &v19);
  v6 = (void *)MEMORY[0x1A1AE621C]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", v12, (_QWORD)v15);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          __break(1u);
        v14 = (void *)v13;
        v4[2](v4, v13, objc_msgSend(v12, "unsignedIntegerValue"), v7);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(v6);
}

- (id)_groupViewAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  objc_msgSend(WeakRetained, "groupAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPassGroupStackView _groupViewWithGroup:](self, "_groupViewWithGroup:", v6);

  return v7;
}

- (PKPassGroupStackViewDatasource)datasource
{
  return (PKPassGroupStackViewDatasource *)objc_loadWeakRetained((id *)&self->_datasource);
}

- (id)_groupViewWithGroup:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPassGroupStackView _groupViewWithGroupID:](self, "_groupViewWithGroupID:", v4);

  return v5;
}

void __38__PKPassGroupStackView__arrangeGroups__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isLoaned"))
  {
    objc_msgSend(v6, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && v5 != *(void **)(*(_QWORD *)(a1 + 32) + 2584))
    {

      goto LABEL_6;
    }

  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 2584);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend(v4, "insertSubview:aboveSubview:", v6);
  else
    objc_msgSend(v4, "insertSubview:atIndex:", v6);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
LABEL_6:

}

void __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  _QWORD *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  _BOOL8 v19;
  _OWORD v20[8];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3) & 1) == 0)
  {
    v6 = *(_QWORD **)(a1 + 40);
    if ((id)v6[302] != v5 && (id)v6[328] != v5)
    {
      objc_msgSend(v6, "_positionForGroupView:atIndex:forState:", v5, a3, *(_QWORD *)(a1 + 72));
      v8 = v7;
      v10 = v9;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = *(void **)(a1 + 40);
      if (v11)
        objc_msgSend(v11, "_transformForGroupView:atIndex:forState:", v5, a3, *(_QWORD *)(a1 + 72));
      objc_msgSend(v5, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPosition:", v8, v10);
      v20[4] = v25;
      v20[5] = v26;
      v20[6] = v27;
      v20[7] = v28;
      v20[0] = v21;
      v20[1] = v22;
      v20[2] = v23;
      v20[3] = v24;
      objc_msgSend(v12, "setTransform:", v20);

    }
    if (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a3))
    {
      v13 = *(void **)(a1 + 56);
      objc_msgSend(v5, "group");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "groupID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

      v19 = (objc_msgSend(*(id *)(a1 + 64), "containsIndex:", a3) & 1) == 0
         && ((v16 = *(_QWORD *)(a1 + 80), v17 = a3 >= v16, v18 = a3 - v16, !v17) || v18 >= *(_QWORD *)(a1 + 88))
         && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2416) != (_QWORD)v5;
      objc_msgSend(v5, "setHidden:", v19);
    }
  }

}

- (id)_layoutStateForHeaderContext:(id)a3 inTableWithBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  PKPGSVSectionHeaderContext *v9;
  CGFloat *v10;
  PKPGSVSectionHeaderContext *paymentHeaderContext;
  double v12;
  uint64_t v13;
  int v14;
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;
  double v16;
  __int16 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  double v36;
  int v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  id v42;
  void *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  void *v47;
  id v48;
  double *v49;
  double v50;
  int v51;
  double v52;
  PKPGSVSectionHeaderContext *v53;
  double v54;
  PKPGSVSectionHeaderContext *v55;
  double top;
  double v57;
  double v58;
  double v59;
  double v60;
  unint64_t separatorIndex;
  unint64_t count;
  double v64;
  double separationPadding;
  double v66;
  double v67;
  int v68;
  double v69;
  double *v70;
  double rect;
  CGFloat v72;
  CGFloat v73;
  CGSize size;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGRect remainder;
  CGRect slice;
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v82 = *MEMORY[0x1E0C80C00];
  v9 = (PKPGSVSectionHeaderContext *)a3;
  v10 = (CGFloat *)-[PKPGSVSectionHeaderLayoutState initWithContext:]([PKPGSVSectionHeaderLayoutState alloc], v9);
  paymentHeaderContext = self->_paymentHeaderContext;
  if (paymentHeaderContext == v9)
  {
    v12 = 0.0;
    v13 = 0;
    if ((*((_BYTE *)&self->_layoutState.groups + 16) & 2) != 0)
      v14 = 1;
    else
      v14 = (*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1;
    v68 = v14;
    goto LABEL_10;
  }
  v12 = 0.0;
  if (self->_passHeaderContext != v9)
  {
    v68 = 0;
LABEL_7:
    v13 = 0;
LABEL_10:
    v16 = 0.0;
    goto LABEL_11;
  }
  p_layoutState = &self->_layoutState;
  v68 = (*((unsigned __int8 *)&self->_layoutState.groups + 16) >> 2) & 1;
  if ((*((_WORD *)&self->_layoutState + 32) & 2) == 0)
    goto LABEL_7;
  if (paymentHeaderContext)
    paymentHeaderContext = (PKPGSVSectionHeaderContext *)paymentHeaderContext->_subheaderContexts;
  v53 = paymentHeaderContext;

  v13 = v53 != 0;
  if ((*((_BYTE *)&self->_layoutState.groups + 16) & 2) != 0)
  {
    separatorIndex = self->_layoutState.groups.separatorIndex;
    if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      count = p_layoutState->groups.count;
      separatorIndex = p_layoutState->groups.count - 1;
    }
    else
    {
      count = separatorIndex + 1;
    }
    -[PKPassGroupStackView _nativeYForGroupInTableAtIndex:](self, "_nativeYForGroupInTableAtIndex:", separatorIndex);
    v16 = v64;
    v13 += count;
    separationPadding = self->_layoutState.separationPadding;
    if (separationPadding > 0.0)
      v12 = separationPadding + self->_layoutState.groupCellHeight;
  }
  else
  {
    v54 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext);
    v55 = self->_paymentHeaderContext;
    if (v55)
    {
      top = v55->_headerMargins.top;
      -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)self->_paymentHeaderContext);
      v16 = v55->_headerMargins.bottom + top + v57;
    }
    else
    {
      v16 = 0.0;
    }
    v12 = v54 - v16;
  }
LABEL_11:
  v17 = *((_WORD *)&self->_layoutState + 32);
  rect = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)v9);
  v66 = v12;
  v67 = v16;
  v18 = v12 + v16;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v19 = 0.0;
  if (v9)
  {
    v20 = v9->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)v9);
    v19 = v9->_headerMargins.bottom + v20 + v21;
  }
  v22 = v17 & 6;
  v83.origin.x = x;
  v83.origin.y = v18;
  v83.size.width = width;
  v83.size.height = rect;
  CGRectDivide(v83, &slice, &remainder, v19, CGRectMinYEdge);
  v23 = 0.0;
  if (v9)
    v23 = v9->_headerMargins.top;
  v24 = slice.size.height;
  v72 = slice.origin.x;
  v73 = slice.size.width;
  if (v22 == 6)
    -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", v13, slice.origin.y, x, y, width, height, *(_QWORD *)&v12);
  else
    v25 = y;
  v70 = v10;
  if (v10)
  {
    v26 = v25 - fmin(fmax(y, 0.0), v23);
    v10[4] = v72;
    v10[5] = v26;
    v69 = v26;
    v10[6] = v73;
    v10[7] = v24;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v27 = (void *)*((_QWORD *)v10 + 3);
  }
  else
  {
    v27 = 0;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v24 = 0.0;
    v72 = 0.0;
    v73 = 0.0;
    v69 = 0.0;
  }
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v76;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v76 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v32);
        if (v33)
        {
          v34 = *(id *)(v33 + 8);
          v35 = v34;
          if (v34)
          {
            v36 = *((double *)v34 + 2);
            objc_msgSend(*((id *)v34 + 1), "bounds");
            v37 = 0;
            v39 = *((double *)v35 + 4) + v36 + v38;
            goto LABEL_28;
          }
        }
        else
        {
          v35 = 0;
        }
        v39 = 0.0;
        v37 = 1;
LABEL_28:
        CGRectDivide(remainder, &slice, &remainder, v39, CGRectMinYEdge);
        v40 = slice.origin.x;
        v41 = slice.origin.y;
        size = slice.size;
        if (v37)
        {
          v43 = 0;
LABEL_33:
          -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", v13, v41, x, y, width, height, *(_QWORD *)&v66);
          v41 = v45;
          goto LABEL_34;
        }
        v42 = *((id *)v35 + 1);
        v43 = v42;
        if (!v42)
          goto LABEL_33;
        v44 = objc_msgSend(v42, "scrollType");
        if (!v44 || v44 == 1 && y < 0.0)
          goto LABEL_33;
LABEL_34:
        if (v33)
        {
          *(CGFloat *)(v33 + 16) = v40;
          *(double *)(v33 + 24) = v41;
          *(CGSize *)(v33 + 32) = size;
        }

        ++v32;
      }
      while (v30 != v32);
      v46 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      v30 = v46;
    }
    while (v46);
  }

  if (v70)
    v47 = (void *)*((_QWORD *)v70 + 3);
  else
    v47 = 0;
  v48 = v47;
  objc_msgSend(v48, "firstObject");
  v49 = (double *)objc_claimAutoreleasedReturnValue();

  v50 = 1.0;
  if (y >= 0.0)
  {
    v51 = v49 ? 1 : v68;
    if (v51 == 1)
    {
      v52 = v49 ? v49[3] : v18 + rect;
      -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", 0, v52, x, y, width, height, *(_QWORD *)&v66);
      v84.origin.x = v72;
      v84.size.width = v73;
      v84.origin.y = v69;
      v84.size.height = v24;
      CGRectGetMaxY(v84);
      v58 = v9 ? v9->_headerMargins.top : 0.0;
      if (v24 - v58 + -8.0 != 0.0)
      {
        PKSpringAnimationSolveForInput();
        v50 = fmin(v59, 1.0);
      }
    }
  }
  if (v18 > 0.0)
  {
    -[PKPassGroupStackView _transformedYForNativeYInTable:withBounds:index:](self, "_transformedYForNativeYInTable:withBounds:index:", 0, v67, x, y, width, height);
    if (v24 != 0.0)
      v50 = fmin(1.0 - fmin(fmax(v66 + v60 - v69, 0.0), v24) / v24, v50);
  }
  if (v70)
    v70[2] = v50;

  return v70;
}

void __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  char v13;
  id v14;

  v5 = a2;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v7 + 24))
  {
    v14 = v5;
    *(_BYTE *)(v7 + 24) = 1;
    v8 = *(unsigned __int8 *)(a1 + 48);
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2144), "context");
    v10 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      if (v9 != v10)
      {
        objc_msgSend(*(id *)(v10 + 2144), "pushProvider:withContainerAlpha:context:", v14, a3);
LABEL_15:
        v6 = v14;
        goto LABEL_16;
      }
      if (!*(_BYTE *)(a1 + 49))
      {
        v13 = objc_msgSend(*(id *)(v9 + 2144), "isCurrentProvider:", v14);
        v9 = *(_QWORD *)(a1 + 32);
        if ((v13 & 1) != 0)
        {
LABEL_12:
          objc_msgSend(*(id *)(v9 + 2144), "updateExistingViewsForCurrentProviderAnimated:withContainerAlpha:", *(unsigned __int8 *)(a1 + 49), a3);
          goto LABEL_15;
        }
      }
      v12 = *(void **)(v9 + 2144);
      v6 = v14;
      goto LABEL_14;
    }
    v6 = v14;
    if (v9 == v10)
    {
      if (!*(_BYTE *)(a1 + 49))
      {
        v11 = objc_msgSend(*(id *)(v9 + 2144), "isCurrentProvider:", v14);
        v9 = *(_QWORD *)(a1 + 32);
        if ((v11 & 1) != 0)
          goto LABEL_12;
        v6 = v14;
      }
      v12 = *(void **)(v9 + 2144);
LABEL_14:
      objc_msgSend(v12, "updateCurrentProvider:withContainerAlpha:", v6, a3);
      goto LABEL_15;
    }
  }
LABEL_16:

}

uint64_t __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGroupStateForGroupViewInStackPresentation:animated:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __52__PKPassGroupStackView_layoutHeaderFootersAnimated___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (a1)
    v1 = *(void **)(a1 + 48);
  else
    v1 = 0;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v6)
          v6 = (_QWORD *)v6[1];
        v7 = v6;
        v8 = objc_msgSend(v7, "scrollType", (_QWORD)v10);

        if (v8 == 1)
        {
          v3 = 1;
          goto LABEL_15;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_15:

  return v3;
}

uint64_t __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGroupView:toPresentationState:withSpringFactory:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2112), *(_QWORD *)(a1 + 40));
}

- (void)_updateGroupStateForGroupViewInStackPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (!-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
  {
    objc_msgSend(v6, "setPresentationState:animated:", 1, v4);
    if (!v4)
      goto LABEL_6;
LABEL_5:
    objc_msgSend(v6, "setHidden:", 0);
    goto LABEL_6;
  }
  objc_msgSend(v6, "setPresentationState:animated:", 3, v4);
  if (v4)
    goto LABEL_5;
  objc_msgSend(v6, "sizeToFit");
LABEL_6:

}

- (void)setPresentationState:(int64_t)a3 animated:(BOOL)a4
{
  -[PKPassGroupStackView setPresentationState:withContext:animated:completion:](self, "setPresentationState:withContext:animated:completion:", a3, 0, a4, 0);
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKPassGroupStackView _updatePausedState](self, "_updatePausedState");
  }
}

- (void)setFooterSuppressed:(BOOL)a3 withContext:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (((!self->_footerSuppressed ^ v4) & 1) == 0)
  {
    self->_footerSuppressed = v4;
    v9 = v6;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pkui_resetSharedRootAuthenticationContext");

    }
    -[PKPassGroupStackView _updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:](self, "_updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:", v9, 0.0);
    v7 = v9;
  }

}

- (void)setExternalFooterSuppressed:(BOOL)a3
{
  id WeakRetained;

  self->_externalFooterSuppressed = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC);
  objc_msgSend(WeakRetained, "setFooterSuppressed:", self->_externalFooterSuppressed);

}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (unint64_t)modalGroupIndex
{
  return self->_modalGroupIndex;
}

- (unint64_t)groupViewPassesSuppressedContent:(id)a3
{
  PKPassGroupView *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (PKPassGroupView *)a3;
  -[PKPassGroupStackView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "suppressedContent");

  if (self->_loanedGroupView == v4 && -[PKPassGroupView isLoaned](v4, "isLoaned"))
  {
    -[PKPassGroupView frontmostPassView](self->_loanedGroupView, "frontmostPassView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secureElementPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "hasAssociatedPeerPaymentAccount"))
      v6 ^= 0x400uLL;

  }
  return v6;
}

- (void)_updateTopContentSeparatorVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  double lastTopContentSeparatorHeight;
  double v7;
  int64_t presentationState;
  char v10;
  uint64_t v11;
  double (**v12)(void *, void *);
  PKPassGroupView *modallyPresentedGroupView;
  void *v14;
  double v15;
  PKPassGroupView *reorderedGroupView;
  void *v17;
  double v18;
  void (**v19)(void *, PKPGSVSectionHeaderContext *);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  double (**v25)(void *, void *);
  uint64_t *v26;
  _QWORD aBlock[4];
  CGRect v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  CGRect remainder;
  CGRect slice;
  CGRect v35;

  if (self->_delegateWantsTopContentSeparation)
  {
    v3 = a3;
    -[PKPassGroupStackView bounds](self, "bounds");
    memset(&slice, 0, sizeof(slice));
    remainder = v35;
    v5 = 1;
    CGRectDivide(v35, &slice, &remainder, self->_lastBoundsInsets.top, CGRectMinYEdge);
    lastTopContentSeparatorHeight = self->_lastTopContentSeparatorHeight;
    v7 = lastTopContentSeparatorHeight + slice.size.height;
    slice.origin.y = slice.origin.y - lastTopContentSeparatorHeight;
    slice.size.height = lastTopContentSeparatorHeight + slice.size.height;
    presentationState = self->_presentationState;
    if (presentationState != 7 && presentationState != 5)
    {
      if (presentationState == 4)
      {
        v5 = -[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
        presentationState = self->_presentationState;
      }
      else
      {
        v5 = 0;
      }
    }
    v10 = presentationState != 4 || v5;
    v29 = 0;
    v30 = (double *)&v29;
    v31 = 0x2020000000;
    v32 = 0;
    if (v7 > 0.0)
    {
      v11 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke;
      aBlock[3] = &__block_descriptor_64_e17_d16__0__CALayer_8l;
      v28 = slice;
      v12 = (double (**)(void *, void *))_Block_copy(aBlock);
      if (v5)
      {
        modallyPresentedGroupView = self->_modallyPresentedGroupView;
        if (modallyPresentedGroupView)
        {
          -[PKPassGroupView layer](modallyPresentedGroupView, "layer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v12[2](v12, v14);
          v30[3] = fmax(v15, v30[3]);

        }
      }
      if ((v10 & 1) == 0)
      {
        reorderedGroupView = self->_reorderedGroupView;
        if (reorderedGroupView)
        {
          -[PKPassGroupView layer](reorderedGroupView, "layer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v12[2](v12, v17);
          v30[3] = fmax(v18, v30[3]);

        }
        v21 = v11;
        v22 = 3221225472;
        v23 = __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke_2;
        v24 = &unk_1E3E6E408;
        v26 = &v29;
        v25 = v12;
        v19 = (void (**)(void *, PKPGSVSectionHeaderContext *))_Block_copy(&v21);
        v19[2](v19, self->_paymentHeaderContext);
        v19[2](v19, self->_passHeaderContext);

      }
    }
    -[PKPassGroupStackView delegate](self, "delegate", v21, v22, v23, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKSpringAnimationSolveForInput();
    objc_msgSend(v20, "groupStackView:wantsTopContentSeparatorWithVisibility:animated:", self, v3);

    _Block_object_dispose(&v29, 8);
  }
}

void __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (a2)
    v3 = *(void **)(a2 + 48);
  else
    v3 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (v9)
          v9 = (_QWORD *)v9[1];
        v10 = v9;
        if (objc_msgSend(v10, "scrollType", (_QWORD)v13) == 1)
        {
          v11 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v10, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fmax((*(double (**)(uint64_t, void *))(v11 + 16))(v11, v12), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 24));

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  char v16;
  _BOOL8 v17;
  char v18;

  v18 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_loadGroupViewAtIndex:forState:presentationState:cached:", a2, *(_QWORD *)(a1 + 64), 1, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  v8 = *(_QWORD *)(a1 + 72);
  v10 = a2 >= v8;
  v9 = a2 - v8;
  v10 = !v10 || v9 >= *(_QWORD *)(a1 + 80);
  if (!v10 && (!v18 || *(_BYTE *)(a1 + 112)))
  {
    v11 = *(_QWORD *)(a1 + 88);
    v10 = a2 >= v11;
    v12 = a2 - v11;
    if (v10 && v12 < *(_QWORD *)(a1 + 96))
      objc_msgSend(v4, "setPresentationState:withContext:animated:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), 0);
  }
  v14 = *(_QWORD *)(a1 + 88);
  v13 = *(_QWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "_opacityForGroupAtIndex:withGroupView:forState:", a2, v4, *(_QWORD *)(a1 + 64));
  v15 = a2 >= v14 && a2 - v14 < v13 || *(_QWORD *)(a1 + 96) + *(_QWORD *)(a1 + 88) == a2;
  objc_msgSend(v4, "setAlpha:");
  v16 = objc_msgSend(*(id *)(a1 + 56), "containsIndex:", a2);
  v17 = 0;
  if ((v16 & 1) == 0 && !v15)
    v17 = v4 != *(void **)(*(_QWORD *)(a1 + 32) + 2416);
  objc_msgSend(v4, "setHidden:", v17);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 2216) - 1 == a2)
    objc_msgSend(v4, "applyContentModesAnimated:", 0);

}

- (int64_t)groupViewContentModeForFrontmostPassWhenStacked:(id)a3
{
  PKPassGroupView *v4;
  void (**v5)(void *, uint64_t);
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t count;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t separatorIndex;
  BOOL v27;
  unint64_t previousIndexOfReorderedGroup;
  BOOL v29;
  unint64_t v30;
  int64_t v31;
  _QWORD aBlock[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  CGRect v38;

  v4 = (PKPassGroupView *)a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassGroupStackView_groupViewContentModeForFrontmostPassWhenStacked___block_invoke;
  aBlock[3] = &unk_1E3E6E958;
  aBlock[4] = &v34;
  v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[PKPassGroupStackView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[PKPassGroupStackView _lastIndex](self, "_lastIndex");
  v15 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v4);
  count = self->_layoutState.groups.count;
  if (count <= -[PKPassGroupStackView _tablePresentationNumberOfCellsBeforeStacking](self, "_tablePresentationNumberOfCellsBeforeStacking"))v5[2](v5, 5);
  if (v9 < 0.0 && v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKPassGroupStackView _yForGroupInTableAtIndex:](self, "_yForGroupInTableAtIndex:", v15);
    v18 = v17;
    v38.origin.x = v7;
    v38.origin.y = v9;
    v38.size.width = v11;
    v38.size.height = v13;
    if (v18 + 69.0 < CGRectGetMaxY(v38))
    {
      -[PKPassGroupStackView _yForGroupInTableAtIndex:](self, "_yForGroupInTableAtIndex:", v15 + 1);
      if (v19 - v18 > 69.0)
      {
        -[PKPassGroupView frontmostPassView](v4, "frontmostPassView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "frontFaceBodyContentCreated"))
          v21 = 4;
        else
          v21 = 3;
        v5[2](v5, v21);

      }
    }
  }
  -[PKPassGroupView frontmostPassView](v4, "frontmostPassView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "passType") == 1)
  {
    objc_msgSend(v23, "dynamicLayerConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      v5[2](v5, 4);
  }
  separatorIndex = self->_layoutState.groups.separatorIndex;
  if (self->_modallyPresentedGroupView == v4)
  {
    v27 = v15 == 0x7FFFFFFFFFFFFFFFLL || v15 != v14;
    if (self->_layoutState.groups.count == 1 || !v27)
      goto LABEL_29;
  }
  else if (v15 != 0x7FFFFFFFFFFFFFFFLL && v15 == v14)
  {
LABEL_29:
    v5[2](v5, 5);
    goto LABEL_30;
  }
  if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL && v15 == separatorIndex || self->_reorderedGroupView == v4)
    goto LABEL_29;
LABEL_30:
  if ((*(_BYTE *)&self->_reorderingFlags & 1) != 0 && v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL
      && separatorIndex
      && self->_previousIndexOfReorderedGroup == separatorIndex
      && v15 == separatorIndex - 1)
    {
      v5[2](v5, 5);
    }
    previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
    if (v14 && previousIndexOfReorderedGroup == v14 && v15 == v14 - 1)
    {
      v5[2](v5, 5);
      previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
    }
    v29 = previousIndexOfReorderedGroup != 0;
    v30 = previousIndexOfReorderedGroup - 1;
    if (v29 && v15 == v30)
      v5[2](v5, 3);
  }
  v31 = v35[3];

  _Block_object_dispose(&v34, 8);
  return v31;
}

- (unint64_t)_indexOfGroupView:(id)a3
{
  PKPassGroupStackViewDatasource **p_datasource;
  id v4;
  id WeakRetained;
  void *v6;
  unint64_t v7;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  p_datasource = &self->_datasource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_datasource);
  objc_msgSend(v4, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(WeakRetained, "indexOfGroup:", v6);
  return v7;
}

uint64_t __72__PKPassGroupStackView_groupViewContentModeForFrontmostPassWhenStacked___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v2 + 24) < a2)
    *(_QWORD *)(v2 + 24) = a2;
  return result;
}

- (unint64_t)_lastIndex
{
  unint64_t count;
  BOOL v3;
  unint64_t v4;

  count = self->_layoutState.groups.count;
  v3 = count != 0;
  v4 = count - 1;
  if (v3)
    return v4;
  else
    return 0;
}

- (unint64_t)_tablePresentationNumberOfCellsBeforeStacking
{
  double v3;
  double separationPadding;

  -[PKPassGroupStackView bounds](self, "bounds");
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    separationPadding = self->_layoutState.separationPadding;
    if (separationPadding > 0.0)
      v3 = v3 - separationPadding;
  }
  return vcvtpd_u64_f64(v3 / 55.0);
}

- (id)groupViewReusablePassViewQueue:(id)a3
{
  return self->_reusableCardViewQueue;
}

- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5
{
  -[PKPassGroupStackView _updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:](self, "_updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:", a5, a4, 0.0);
  -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");
}

- (void)_updatePassFooterViewIfNecessaryWithContext:(id)a3 becomeVisibleDelay:(double)a4
{
  PKPassGroupView *modallyPresentedGroupView;
  id v7;
  id v8;
  id v9;

  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  v7 = a3;
  -[PKPassGroupView frontmostPassView](modallyPresentedGroupView, "frontmostPassView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPassGroupStackView _createPassFooterConfigurationForPassView:withContext:](self, "_createPassFooterConfigurationForPassView:withContext:", v9, v7);
  -[PKPassGroupStackView _updatePassFooterViewWithConfiguration:context:animated:reload:delay:](self, "_updatePassFooterViewWithConfiguration:context:animated:reload:delay:", v8, v7, 1, 0, a4);

}

- (id)_createPassFooterConfigurationForPassView:(id)a3 withContext:(id)a4
{
  id v6;
  PKPassFooterViewConfiguration *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;

  v6 = a4;
  v7 = 0;
  if (a3 && !self->_invalidated)
  {
    v8 = a3;
    objc_msgSend(v8, "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "passType") != 1)
    {
      if (PKValueAddedServicesEnabledForPass())
      {
        if (-[PKSecureElement isInRestrictedMode](self->_secureElement, "isInRestrictedMode"))
          v11 = 3;
        else
          v11 = 2;
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_42;
    }
    v10 = v9;
    if ((-[PKSecureElement isInRestrictedMode](self->_secureElement, "isInRestrictedMode") & 1) != 0)
    {
      v11 = 3;
LABEL_41:

LABEL_42:
      v7 = -[PKPassFooterViewConfiguration initWithPassView:state:]([PKPassFooterViewConfiguration alloc], "initWithPassView:state:", v8, v11);

      goto LABEL_43;
    }
    if ((objc_msgSend(v6, "isPostPayment") & 1) != 0)
    {
      v11 = 4;
      goto LABEL_41;
    }
    if (!objc_msgSend(v10, "hasAssociatedPeerPaymentAccount")
      || objc_msgSend(v10, "effectiveContactlessPaymentApplicationState") == 7)
    {
      v11 = 1;
      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "state");
    objc_msgSend(v13, "associatedPassUniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v16;
    if (v17 == v18)
    {

    }
    else
    {
      v19 = v18;
      if (!v17 || !v18)
      {

LABEL_34:
        v11 = 1;
LABEL_40:

        goto LABEL_41;
      }
      v20 = objc_msgSend(v17, "isEqualToString:", v18);

      if ((v20 & 1) == 0)
        goto LABEL_34;
    }
    v21 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
    v22 = objc_msgSend(v10, "activationState");
    if ((unint64_t)(v14 - 1) >= 2 || v22 == 4)
    {
      if (v21)
      {
        if (v21 != 5)
        {
          objc_msgSend(v10, "paymentPass");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "activationState");

          if (v25 != 3)
          {
            v11 = 5;
            goto LABEL_40;
          }
        }
      }
    }
    if (v14 == 1)
    {
      objc_msgSend(v13, "currentBalance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "amount");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "compare:", v28))
      {

      }
      else
      {
        v29 = PKRunningInViewService();

        if ((v29 & 1) != 0)
        {
          v11 = 6;
          goto LABEL_40;
        }
      }
    }
    if (objc_msgSend(v13, "isParticipantAccountLockedByOwner"))
      v11 = 7;
    else
      v11 = 1;
    goto LABEL_40;
  }
LABEL_43:

  return v7;
}

- (void)_refreshBacklightForFrontmostPassGroup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPassGroupStackView _shouldRampForFrontmostPassView:](self, "_shouldRampForFrontmostPassView:", v3))
  {
LABEL_13:
    objc_msgSend(v4, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass uniqueID](self->_passToBeDeletedExternally, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    v14 = v13;
    v15 = v14;
    if (v6 == v14)
    {

    }
    else
    {
      if (v6)
        v16 = v14 == 0;
      else
        v16 = 1;
      if (v16)
      {

        v11 = 1;
        v17 = v6;
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      v18 = objc_msgSend(v6, "isEqualToString:", v14);

      if (!v18)
      {
        v11 = 1;
        goto LABEL_24;
      }
    }
    -[PKPassGroupView group](self->_modallyPresentedGroupView, "group");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unint64_t)objc_msgSend(v17, "passCount") > 1;
    goto LABEL_23;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PKPassGroupView group](self->_modallyPresentedGroupView, "group", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passes");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        if (*(void **)(*((_QWORD *)&v19 + 1) + 8 * i) != v4
          && -[PKPassGroupStackView _shouldRampForPass:](self, "_shouldRampForPass:"))
        {

          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_25:

  -[PKPassGroupStackView _rampBacklightIfNecessary:](self, "_rampBacklightIfNecessary:", v11);
}

- (void)_rampBacklightIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_wantsBacklightRamping != a3)
  {
    v3 = a3;
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "beginRequestingBacklightRamping:", self);
    else
      objc_msgSend(v5, "endRequestingBacklightRamping:", self);

    self->_wantsBacklightRamping = v3;
  }
}

- (BOOL)_shouldRampForFrontmostPassView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPassGroupStackView _shouldRampForPass:](self, "_shouldRampForPass:", v5))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v5, "secureElementPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "supportsBarcodePayment"))
      v6 = objc_msgSend(v4, "isFrontFaceExpanded");
    else
      v6 = 0;

  }
  return v6;
}

- (BOOL)_shouldRampForPass:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "barcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = PKValueAddedServicesEnabledForPass();

    if (v5)
    {
      LOBYTE(v4) = 0;
    }
    else if (objc_msgSend(v3, "passType") == 1)
    {
      objc_msgSend(v3, "secureElementPass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = objc_msgSend(v6, "isAccessPass") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }

  return (char)v4;
}

- (void)_addGroupViewAsSubview:(id)a3 forIndex:(unint64_t)a4
{
  PKPassGroupView *v6;
  PKPassthroughView *passContainerView;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = (PKPassGroupView *)a3;
  if (self->_loanedGroupView != v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__30;
    v19 = __Block_byref_object_dispose__30;
    v20 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__30;
    v13 = __Block_byref_object_dispose__30;
    v14 = 0;
    if ((*(_BYTE *)&self->_reorderingFlags & 1) != 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__PKPassGroupStackView__addGroupViewAsSubview_forIndex___block_invoke;
      v8[3] = &unk_1E3E6E5C8;
      v8[4] = self;
      v8[5] = &v15;
      v8[6] = &v9;
      v8[7] = a4;
      -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v8);
      if (v10[5])
      {
        -[PKPassthroughView insertSubview:belowSubview:](self->_passContainerView, "insertSubview:belowSubview:", v6);
        goto LABEL_9;
      }
      passContainerView = self->_passContainerView;
      if (v16[5])
      {
        -[PKPassthroughView insertSubview:aboveSubview:](passContainerView, "insertSubview:aboveSubview:", v6);
        goto LABEL_9;
      }
    }
    else
    {
      passContainerView = self->_passContainerView;
    }
    -[PKPassthroughView addSubview:](passContainerView, "addSubview:", v6);
    -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups");
LABEL_9:
    -[PKPassGroupView setPaused:](v6, "setPaused:", -[PKPassGroupStackView _pauseStateForGroupView:atIndex:](self, "_pauseStateForGroupView:atIndex:", v6, a4));
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }

}

void __42__PKPassGroupStackView__updatePausedState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  id v5;

  v3 = *(_QWORD **)(a1 + 32);
  if ((void *)v3[328] != a2)
  {
    v5 = a2;
    objc_msgSend(v5, "setPaused:", objc_msgSend(v3, "_pauseStateForGroupView:atIndex:", v5, a3));

  }
}

- (BOOL)_pauseStateForGroupView:(id)a3 atIndex:(unint64_t)a4
{
  PKPassGroupView *v6;
  PKPassGroupView *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t presentationState;
  unint64_t separatorIndex;
  unint64_t modalGroupIndex;
  BOOL v16;

  v6 = (PKPassGroupView *)a3;
  v7 = v6;
  if (self->_loanedGroupView == v6 && !self->_invalidated)
  {
    v8 = 0;
  }
  else if (self->_effectivePaused)
  {
    v8 = 1;
  }
  else
  {
    -[PKPassGroupView frontmostPassView](v6, "frontmostPassView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "passType") == 1
      && (objc_msgSend(v10, "dynamicLayerConfiguration"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11)
      && (presentationState = self->_presentationState, presentationState != 5))
    {
      separatorIndex = self->_layoutState.groups.separatorIndex;
      if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (presentationState == 4)
          modalGroupIndex = self->_layoutState.groups.count - 1;
        else
          modalGroupIndex = self->_modalGroupIndex;
        v16 = modalGroupIndex == a4;
      }
      else
      {
        v16 = separatorIndex == a4;
      }
      v8 = !v16;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (double)_layoutContentFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  void *v11;
  void *v12;
  void *v13;
  int64_t presentationState;
  int v15;
  unint64_t modalGroupIndex;
  double v17;
  void *v18;
  double v19;
  int64_t pilingMode;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v28[5];
  id v29;
  id v30;
  unint64_t v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  char v36;
  BOOL v37;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v11 = (void *)MEMORY[0x1A1AE621C](self, a2);
  if (!v5)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
  if ((*((_WORD *)&self->_layoutState + 32) & 0x4000) == 0)
  {
LABEL_7:
    v13 = 0;
    LOBYTE(v15) = 0;
    presentationState = self->_presentationState;
    goto LABEL_8;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
  presentationState = self->_presentationState;
  if (v13)
  {
    if (presentationState == 7)
      LOBYTE(v15) = 1;
    else
      v15 = (*((unsigned __int16 *)&self->_layoutState + 32) >> 14) & 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }
LABEL_8:
  if ((*((_WORD *)&self->_layoutState + 32) & 0x4000) == 0)
  {
    modalGroupIndex = self->_modalGroupIndex;
    v17 = 0.0;
    v18 = v12;
    if (presentationState == 4)
      goto LABEL_18;
    goto LABEL_14;
  }
  modalGroupIndex = self->_layoutState.externalToTableTransitionModalGroupIndex;
  if (presentationState != 4)
  {
LABEL_14:
    v17 = 0.0;
    if ((*((_WORD *)&self->_layoutState + 32) & 0x2000) != 0)
    {
      pilingMode = self->_layoutState.pilingMode;
      -[PKPassGroupStackView _setupSpringFactoryForPileAnimations:withMaximumAcceleration:reverse:](self, "_setupSpringFactoryForPileAnimations:withMaximumAcceleration:reverse:", v12, pilingMode != 0, 0.0);
      if (pilingMode)
        v17 = v21;
    }
    goto LABEL_17;
  }
  v17 = 0.0;
  if (!v12)
  {
    v18 = 0;
    goto LABEL_18;
  }
  -[PKPassGroupStackView _setupSpringFactoryForExternalToTableAnimations:](self, "_setupSpringFactoryForExternalToTableAnimations:", v12);
  self->_footerAnimationDelay = fmax(v19, self->_footerAnimationDelay);
LABEL_17:
  v18 = v12;
LABEL_18:
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __67__PKPassGroupStackView__layoutContentFromOffset_toOffset_animated___block_invoke;
  v28[3] = &unk_1E3E6E7D8;
  v36 = v15;
  v37 = modalGroupIndex != 0x7FFFFFFFFFFFFFFFLL;
  v31 = modalGroupIndex;
  v28[4] = self;
  v29 = v13;
  v22 = v18;
  v30 = v12;
  v32 = x;
  v33 = y;
  v34 = v9;
  v35 = v8;
  -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v28);
  objc_msgSend(v12, "duration");
  v24 = v23;
  objc_msgSend(v12, "maximumVendedDelay");
  v26 = v24 + v25;

  -[PKPassGroupStackView _layoutFooterAnimated:withAnimationDelay:](self, "_layoutFooterAnimated:withAnimationDelay:", v5, v17);
  -[PKPassGroupView updatePageControlFrameAnimated:](self->_modallyPresentedGroupView, "updatePageControlFrameAnimated:", v5);

  objc_autoreleasePoolPop(v11);
  return v26;
}

- (void)_updatePassFooterViewWithConfiguration:(id)a3 context:(id)a4 animated:(BOOL)a5 reload:(BOOL)a6 delay:(double)a7
{
  int v8;
  _BOOL8 v9;
  id v12;
  id v13;
  double v14;
  int64_t presentationState;
  int v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  int v21;
  unsigned int passFooterViewVisibilityToken;
  PKPassFooterView *v23;
  PKPassFooterView *passFooterView;
  NSObject *v25;
  PKPassFooterView *v26;
  _BOOL8 v27;
  uint64_t v28;
  PKPassFooterView *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void (**v34)(void *, PKPassGroupStackView *, void *);
  void *v35;
  dispatch_time_t v36;
  void *v37;
  void *v38;
  int passFooterViewVisible;
  _QWORD block[4];
  id v41;
  void (**v42)(void *, PKPassGroupStackView *, void *);
  id v43;
  _QWORD v44[4];
  id v45;
  id v46[2];
  unsigned int v47;
  _QWORD aBlock[4];
  unsigned int v49;
  BOOL v50;
  char v51;
  BOOL v52;
  uint8_t buf[4];
  PKPassGroupStackView *v54;
  __int16 v55;
  PKPassFooterView *v56;
  uint64_t v57;

  v8 = a6;
  v9 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = 0.0;
  if (self->_invalidated
    || !-[PKPassGroupStackView isPresentingPassViewFront](self, "isPresentingPassViewFront")
    || (*((_WORD *)&self->_layoutState + 32) & 0x100) != 0
    || !self->_modallyPresentedGroupView
    || self->_footerSuppressed
    || ((presentationState = self->_presentationState, presentationState == 7) ? (v14 = 0.0) : (v14 = 1.0),
        presentationState == 7))
  {

    v16 = 0;
    v8 = 0;
    v38 = 0;
    v12 = 0;
  }
  else
  {
    v16 = 1;
    v38 = v13;
    if (v13 && (v8 & 1) == 0)
      v8 = objc_msgSend(v13, "wantsPersistentCardEmulation");
  }
  passFooterViewVisible = self->_passFooterViewVisible;
  -[PKPassFooterView alpha](self->_passFooterView, "alpha");
  v18 = v17;
  -[PKPassFooterView configuration](self->_passFooterView, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = PKEqualObjects();

  v21 = v20 ^ 1;
  if ((v16 & v8 & 1) != 0 || passFooterViewVisible != v16 || (v21 & 1) != 0 || v18 != v14)
  {
    self->_passFooterViewVisible = v16;
    self->_passFooterViewAlpha = v14;
    passFooterViewVisibilityToken = self->_passFooterViewVisibilityToken;
    if (passFooterViewVisible != v16)
      self->_passFooterViewVisibilityToken = ++passFooterViewVisibilityToken;
    if (v16)
    {
      if (!self->_passFooterView)
      {
        v23 = objc_alloc_init(PKPassFooterView);
        passFooterView = self->_passFooterView;
        self->_passFooterView = v23;

        -[PKPassFooterView setDelegate:](self->_passFooterView, "setDelegate:", self);
        -[PKPassFooterView setAlpha:](self->_passFooterView, "setAlpha:", 0.0);
        -[PKPassGroupStackView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_passFooterView, 0);
      }
      if ((v21 | v8) == 1)
      {
        PKLogFacilityTypeGetObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = self->_passFooterView;
          *(_DWORD *)buf = 134349312;
          v54 = self;
          v55 = 2050;
          v56 = v26;
          _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p): configuring PKPassFooterView %{public}p.", buf, 0x16u);
        }

        if (v9)
          v27 = passFooterViewVisible && v18 > 0.0 || self->_passFooterViewOutstandingAnimations != 0;
        else
          v27 = 0;
        v28 = 2;
        if (!v8)
          v28 = 0;
        -[PKPassFooterView configureWithConfiguration:context:options:](self->_passFooterView, "configureWithConfiguration:context:options:", v12, v38, v27 | v28);
      }
    }
    -[PKPassFooterView configuration](self->_passFooterView, "configuration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (-[PKPassFooterView requestPileSuppression](self->_passFooterView, "requestPileSuppression"))
        -[PKPassGroupStackView setPilingMode:](self, "setPilingMode:", 1);
      v29 = self->_passFooterView;
      objc_msgSend(v37, "passView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassGroupStackView _frameForFooterViewForPassView:](self, "_frameForFooterViewForPassView:", v30);
      -[PKPassFooterView setFrame:](v29, "setFrame:");

      -[PKPassFooterView layoutIfNeeded](self->_passFooterView, "layoutIfNeeded");
      if (passFooterViewVisible != v16)
        -[PKPassFooterView willBecomeVisibleAnimated:](self->_passFooterView, "willBecomeVisibleAnimated:", v9);
    }
    else if (passFooterViewVisible)
    {
      -[PKPassFooterView willBecomeHiddenAnimated:](self->_passFooterView, "willBecomeHiddenAnimated:", v9);
    }
    v31 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke;
    aBlock[3] = &__block_descriptor_39_e33_v20__0__PKPassGroupStackView_8B16l;
    v50 = passFooterViewVisible != v16;
    v49 = passFooterViewVisibilityToken;
    v51 = v16;
    v52 = v9;
    v32 = _Block_copy(aBlock);
    objc_initWeak((id *)buf, self);
    v44[0] = v31;
    v44[1] = 3221225472;
    v44[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_2;
    v44[3] = &unk_1E3E6E6B0;
    v47 = passFooterViewVisibilityToken;
    v46[1] = *(id *)&v14;
    objc_copyWeak(v46, (id *)buf);
    v33 = v32;
    v45 = v33;
    v34 = (void (**)(void *, PKPassGroupStackView *, void *))_Block_copy(v44);
    if (v9 && v18 != v14)
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D676D0]), "initWithMass:stiffness:damping:", 0.35, dbl_19DF165F0[self->_presentationState == 3], dbl_19DF165E0[self->_presentationState == 3]);
    else
      v35 = 0;
    ++self->_passFooterViewOutstandingAnimations;
    if (a7 <= 0.0)
    {
      v34[2](v34, self, v35);
    }
    else
    {
      v36 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
      block[0] = v31;
      block[1] = 3221225472;
      block[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_4;
      block[3] = &unk_1E3E61478;
      objc_copyWeak(&v43, (id *)buf);
      v42 = v34;
      v41 = v35;
      dispatch_after(v36, MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v43);
    }
    if (PKUserIntentIsAvailable())
      -[PKPassGroupStackView passFooterViewDidChangePhysicalButtonRequirement:withContext:](self, "passFooterViewDidChangePhysicalButtonRequirement:withContext:", self->_passFooterView, v38);
    if (passFooterViewVisible != v16)
      -[PKPassGroupStackView _updateCoachingState](self, "_updateCoachingState");

    objc_destroyWeak(v46);
    objc_destroyWeak((id *)buf);

    v12 = v37;
  }
  else
  {
    -[PKPassGroupStackView _layoutFooterAnimated:withAnimationDelay:](self, "_layoutFooterAnimated:withAnimationDelay:", v9, 0.0);
  }

}

- (void)_layoutFooterAnimated:(BOOL)a3 withAnimationDelay:(double)a4
{
  PKPassFooterView *passFooterView;
  _BOOL4 v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  double v47;
  double v48;
  _QWORD v49[5];
  _QWORD v50[4];
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;

  if ((*((_WORD *)&self->_layoutState + 32) & 0x1000) == 0)
  {
    passFooterView = self->_passFooterView;
    if (passFooterView)
    {
      v6 = a3;
      -[PKPassFooterView alpha](passFooterView, "alpha");
      if (v7 <= 0.0 || !v6)
        v9 = 0;
      else
        v9 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
      -[PKPassFooterView layer](self->_passFooterView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassFooterView configuration](self->_passFooterView, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "passView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassGroupStackView _frameForFooterViewForPassView:](self, "_frameForFooterViewForPassView:", v12);
      v47 = v13;
      v48 = v14;
      v16 = v15;
      v18 = v17;

      v19 = *MEMORY[0x1E0C9D538];
      v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v10, "bounds");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v10, "position");
      v26 = v25;
      v28 = v27;
      v29 = v18 == v24 && v16 == v22;
      if (!v29)
      {
        -[PKPassFooterView layoutIfNeeded](self->_passFooterView, "layoutIfNeeded");
        objc_msgSend(v9, "springAnimationWithKeyPath:", CFSTR("bounds.size.width"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = (_QWORD *)MEMORY[0x1E0CD2950];
        if (v30)
        {
          objc_msgSend(v30, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
          objc_msgSend(v31, "setBeginTime:", a4);
          objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v22, v16);
          v33 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v31);
        }
        objc_msgSend(v9, "springAnimationWithKeyPath:", CFSTR("bounds.size.height"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v34, "setBeginTimeMode:", *v32);
          objc_msgSend(v34, "setBeginTime:", a4);
          objc_msgSend(v34, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v24, v18);
          v35 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v34);
        }
        v36 = (void *)MEMORY[0x1E0DC3F10];
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke;
        v50[3] = &unk_1E3E62900;
        v51 = v10;
        v52 = v19;
        v53 = v20;
        v54 = v16;
        v55 = v18;
        objc_msgSend(v36, "performWithoutAnimation:", v50);

      }
      objc_msgSend(v10, "anchorPoint");
      v38 = v47 + v19 + v37 * v16;
      v40 = v48 + v20 + v39 * v18;
      if (v38 != v26 || v40 != v28)
      {
        objc_msgSend(v9, "springAnimationWithKeyPath:", CFSTR("position"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v42)
        {
          objc_msgSend(v42, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v26, v28, v38, v40);
          v44 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v43);
        }
        objc_msgSend(v10, "setPosition:", v38, v40);

      }
      if (!v29)
      {
        if (v6)
        {
          v45 = (void *)MEMORY[0x1E0DC3F10];
          objc_msgSend(v9, "duration");
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke_2;
          v49[3] = &unk_1E3E612E8;
          v49[4] = self;
          objc_msgSend(v45, "_animateWithDuration:delay:options:factory:animations:completion:", 6, v9, v49, 0);
        }
        else
        {
          -[PKPassFooterView layoutIfNeeded](self->_passFooterView, "layoutIfNeeded");
        }
      }

    }
  }
}

- (BOOL)isPresentingPassViewFront
{
  int64_t presentationState;
  BOOL v3;

  presentationState = self->_presentationState;
  if (presentationState == 4)
    return -[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
  v3 = presentationState == 7 || presentationState == 5;
  return v3 && self->_layoutState.groups.count && self->_modalGroupIndex != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassGroupStackView;
  -[PKPassGroupStackView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PKPassGroupStackView setNeedsLayout](self, "setNeedsLayout");
  -[PKPassGroupStackView layoutIfNeeded](self, "layoutIfNeeded");
  -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self, "layoutContentForCurrentPresentationState:", 0);
}

- (void)setTopContentSeparatorHeight:(double)a3
{
  if (self->_topContentSeparatorHeight != a3)
  {
    self->_topContentSeparatorHeight = a3;
    -[PKPassGroupStackView setNeedsLayout](self, "setNeedsLayout");
    -[PKPassGroupStackView layoutIfNeeded](self, "layoutIfNeeded");
    -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self, "layoutContentForCurrentPresentationState:", 0);
  }
}

- (void)layoutContentForCurrentPresentationState:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;

  v3 = a3;
  -[PKPassGroupStackView contentOffset](self, "contentOffset");
  -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", v3, v5, v6, v5, v6);
}

- (void)updatePeerPaymentFooterViewIfNecessary
{
  void *v3;
  id v4;

  -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "passType") == 1 && objc_msgSend(v4, "hasAssociatedPeerPaymentAccount"))
    -[PKPassGroupStackView _updatePassFooterViewWithContext:](self, "_updatePassFooterViewWithContext:", 0);

}

- (void)setGroupsController:(id)a3
{
  objc_storeStrong((id *)&self->_groupsController, a3);
}

- (void)setDiscoveryDatasource:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryDatasource, a3);
}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupStackView;
  v4 = a3;
  -[PKPassGroupStackView setDelegate:](&v6, sel_setDelegate_, v4);
  self->_delegateWantsTopContentSeparation = objc_opt_respondsToSelector() & 1;
  v5 = objc_opt_respondsToSelector();

  self->_delegateWantsBottomContentSeparation = v5 & 1;
}

- (void)setDatasource:(id)a3
{
  objc_storeWeak((id *)&self->_datasource, a3);
}

- (PKPassGroupStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  PKPassGroupStackView *v5;
  PKPassGroupStackView *v6;
  uint64_t v7;
  NSMutableDictionary *groupViewsByGroupID;
  NSMutableDictionary *v9;
  NSMutableDictionary *animatorsByGroupID;
  NSMutableDictionary *v11;
  NSMutableDictionary *groupViewsInFlightByGroupID;
  uint64_t v13;
  NSMutableArray *transitionCompletionHandlers;
  uint64_t v15;
  NSMutableArray *suspendedTransitionCompletionHandlers;
  PKReusablePassViewQueue *v17;
  PKReusablePassViewQueue *reusableCardViewQueue;
  uint64_t v19;
  PKPaymentService *paymentService;
  PKPassthroughView *v21;
  double v22;
  double v23;
  uint64_t v24;
  PKPassthroughView *headerContainerView;
  PKPassthroughView *v26;
  PKPassthroughView *subheaderContainerView;
  PKPassthroughView *v28;
  PKPassthroughView *passContainerView;
  PKBackdropView *v30;
  PKBackdropView *backdropView;
  PKBackdropView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  UIImageView *footerPocketBackgroundShadow;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  UIImageView *footerPocketForegroundShadow;
  void *v48;
  PKSecureElement *v49;
  PKSecureElement *secureElement;
  uint64_t v51;
  UIColor *currentPageIndicatorTintColor;
  uint64_t v53;
  UIColor *pageIndicatorTintColor;
  void *v55;
  void *v56;
  objc_super v58;

  height = a3.size.height;
  width = a3.size.width;
  v58.receiver = self;
  v58.super_class = (Class)PKPassGroupStackView;
  v5 = -[PKPassGroupStackView initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[PKPassGroupStackView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    -[PKPassGroupStackView setAlwaysBounceVertical:](v6, "setAlwaysBounceVertical:", 1);
    -[PKPassGroupStackView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
    -[PKPassGroupStackView _setContentInsetAdjustmentBehavior:](v6, "_setContentInsetAdjustmentBehavior:", 2);
    v6->_staggerPileAnimations = 1;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (unint64_t)(height / 55.0));
    groupViewsByGroupID = v6->_groupViewsByGroupID;
    v6->_groupViewsByGroupID = (NSMutableDictionary *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animatorsByGroupID = v6->_animatorsByGroupID;
    v6->_animatorsByGroupID = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupViewsInFlightByGroupID = v6->_groupViewsInFlightByGroupID;
    v6->_groupViewsInFlightByGroupID = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    transitionCompletionHandlers = v6->_transitionCompletionHandlers;
    v6->_transitionCompletionHandlers = (NSMutableArray *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    suspendedTransitionCompletionHandlers = v6->_suspendedTransitionCompletionHandlers;
    v6->_suspendedTransitionCompletionHandlers = (NSMutableArray *)v15;

    v17 = -[PKReusablePassViewQueue initWithCount:]([PKReusablePassViewQueue alloc], "initWithCount:", 0);
    reusableCardViewQueue = v6->_reusableCardViewQueue;
    v6->_reusableCardViewQueue = v17;

    v6->_presentationState = 1;
    v6->_modalGroupIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6->_layoutState.groups.separatorIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (PKSecureElementIsAvailable())
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v6);
      paymentService = v6->_paymentService;
      v6->_paymentService = (PKPaymentService *)v19;

    }
    v21 = [PKPassthroughView alloc];
    v22 = *MEMORY[0x1E0C9D538];
    v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v24 = -[PKPassthroughView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D538], v23, width, height);
    headerContainerView = v6->_headerContainerView;
    v6->_headerContainerView = (PKPassthroughView *)v24;

    -[PKPassGroupStackView addSubview:](v6, "addSubview:", v6->_headerContainerView);
    v26 = -[PKPassthroughView initWithFrame:]([PKPassthroughView alloc], "initWithFrame:", v22, v23, width, height);
    subheaderContainerView = v6->_subheaderContainerView;
    v6->_subheaderContainerView = v26;

    -[PKPassGroupStackView addSubview:](v6, "addSubview:", v6->_subheaderContainerView);
    v28 = -[PKPassthroughView initWithFrame:]([PKPassthroughView alloc], "initWithFrame:", v22, v23, width, height);
    passContainerView = v6->_passContainerView;
    v6->_passContainerView = v28;

    -[PKPassGroupStackView addSubview:](v6, "addSubview:", v6->_passContainerView);
    v30 = -[PKBackdropView initWithFrame:]([PKBackdropView alloc], "initWithFrame:", v22, v23, width, height);
    backdropView = v6->_backdropView;
    v6->_backdropView = v30;

    -[PKPassGroupStackView _updateBackdropViewFilters](v6, "_updateBackdropViewFilters");
    -[PKBackdropView setAlpha:](v6->_backdropView, "setAlpha:", 0.0);
    v32 = v6->_backdropView;
    objc_msgSend((id)objc_opt_class(), "backdropStartBackgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBackdropView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v6, sel__updateBackdropViewFilters, *MEMORY[0x1E0DC45B8], 0);

    v6->_pressedGroupViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v35 = (void *)MEMORY[0x1E0DC3870];
    PKPassKitUIBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "imageNamed:inBundle:", CFSTR("StackPocketBackgroundShadow"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pkui_resizableImageByTilingHorizontally");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v38);
    footerPocketBackgroundShadow = v6->_footerPocketBackgroundShadow;
    v6->_footerPocketBackgroundShadow = (UIImageView *)v39;

    -[UIImageView layer](v6->_footerPocketBackgroundShadow, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAnchorPoint:", 0.5, 1.0);

    -[UIImageView setAlpha:](v6->_footerPocketBackgroundShadow, "setAlpha:", 0.0);
    v42 = (void *)MEMORY[0x1E0DC3870];
    PKPassKitUIBundle();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "imageNamed:inBundle:", CFSTR("StackPocketForegroundShadow"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "pkui_resizableImageByTilingHorizontally");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v45);
    footerPocketForegroundShadow = v6->_footerPocketForegroundShadow;
    v6->_footerPocketForegroundShadow = (UIImageView *)v46;

    -[UIImageView layer](v6->_footerPocketForegroundShadow, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAnchorPoint:", 0.5, 1.0);

    -[UIImageView setAlpha:](v6->_footerPocketForegroundShadow, "setAlpha:", 0.0);
    v49 = (PKSecureElement *)objc_alloc_init(MEMORY[0x1E0D67630]);
    secureElement = v6->_secureElement;
    v6->_secureElement = v49;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v51 = objc_claimAutoreleasedReturnValue();
    currentPageIndicatorTintColor = v6->_currentPageIndicatorTintColor;
    v6->_currentPageIndicatorTintColor = (UIColor *)v51;

    -[UIColor colorWithAlphaComponent:](v6->_currentPageIndicatorTintColor, "colorWithAlphaComponent:", 0.3);
    v53 = objc_claimAutoreleasedReturnValue();
    pageIndicatorTintColor = v6->_pageIndicatorTintColor;
    v6->_pageIndicatorTintColor = (UIColor *)v53;

    -[PKPassGroupStackView panGestureRecognizer](v6, "panGestureRecognizer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addTarget:action:", v6, sel__handleScrollViewPanGesture_);

    if ((PKRunningInRemoteContext() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObserver:selector:name:object:", v6, sel__paymentDidReceiveSuccessfulTransactionNotification_, *MEMORY[0x1E0D6AD00], 0);

    }
  }
  return v6;
}

- (void)setPresentationState:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  __int16 v10;
  char v11;
  unint64_t modalGroupIndex;
  BOOL v13;
  __int16 v14;
  char v15;
  void (**transitionCanceller)(void);
  id v17;
  int64_t presentationState;
  void *v19;
  id v20;
  int v21;
  _BOOL4 v22;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  id v34;
  void (**v35)(_QWORD);
  NSMutableArray *transitionCompletionHandlers;
  void *v37;
  _BOOL8 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  PKPassGroupView *modallyPresentedGroupView;
  void *v48;
  id WeakRetained;
  void *v50;
  void *v51;
  PKPassGroupView *loanedGroupView;
  id v53;
  void *v54;
  _BOOL4 v55;
  PKPassGroupView *v56;
  int64_t v57;
  PKPassGroupView *v58;
  PKPassGroupView *v59;
  __int16 v60;
  __int16 v61;
  void *v62;
  uint64_t v63;
  void *context;
  char v65;
  _BOOL4 v66;
  id v67;
  id v68;
  _QWORD v69[5];
  _QWORD v70[4];
  id v71;
  PKPassGroupStackView *v72;
  _QWORD *v73;
  BOOL v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[5];
  _QWORD v82[3];
  char v83;
  _BYTE v84[128];
  uint64_t v85;

  v7 = a5;
  v85 = *MEMORY[0x1E0C80C00];
  v67 = a4;
  v68 = a6;
  context = (void *)MEMORY[0x1A1AE621C]();
  if (a3 == 7)
  {
    modalGroupIndex = self->_modalGroupIndex;
    if (modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
      v10 = *((_WORD *)&self->_layoutState + 32) & 0xFFFE;
      *((_WORD *)&self->_layoutState + 32) = v10;
      a3 = 4;
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  if (a3 == 5)
  {
    modalGroupIndex = self->_modalGroupIndex;
LABEL_8:
    if (modalGroupIndex || !-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
    {
      v10 = *((_WORD *)&self->_layoutState + 32) & 0xFFFE;
      *((_WORD *)&self->_layoutState + 32) = v10;
    }
    else
    {
      v10 = *((_WORD *)&self->_layoutState + 32);
      if ((v10 & 1) == 0)
      {
        -[PKPassGroupStackView setModalGroupIndex:](self, "setModalGroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
        v11 = 0;
        v10 = *((_WORD *)&self->_layoutState + 32);
        a3 = 4;
        goto LABEL_16;
      }
    }
LABEL_15:
    v10 &= ~0x4000u;
    *((_WORD *)&self->_layoutState + 32) = v10;
    v11 = 1;
    if ((a3 | 2) == 7)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (a3 != 3)
  {
    v10 = *((_WORD *)&self->_layoutState + 32) & 0xFFFE;
    *((_WORD *)&self->_layoutState + 32) = v10;
    if (a3 == 4)
    {
      v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v10 = *((_WORD *)&self->_layoutState + 32) & 0xBFFF;
  *((_WORD *)&self->_layoutState + 32) = v10;
  v11 = 1;
LABEL_16:
  *((_WORD *)&self->_layoutState + 32) = v10 & 0x7FFF;
LABEL_17:
  v13 = -[PKPassGroupStackView isPresentingPassViewFront](self, "isPresentingPassViewFront");
  v14 = *((_WORD *)&self->_layoutState + 32);
  if (!v13)
  {
    v14 &= ~0x200u;
    *((_WORD *)&self->_layoutState + 32) = v14;
  }
  *((_WORD *)&self->_layoutState + 32) = v14 | 0x1000;
  self->_footerAnimationDelay = 0.0;
  v15 = v11 ^ 1;
  if ((*(_BYTE *)&self->_reorderingFlags & 1) == 0)
    v15 = 1;
  if ((v15 & 1) == 0)
    -[PKPassGroupStackView groupViewPanDidEnd:](self, "groupViewPanDidEnd:", self->_reorderedGroupView);
  transitionCanceller = (void (**)(void))self->_transitionCanceller;
  if (transitionCanceller)
  {
    if (self->_nextState == a3)
    {
      transitionCanceller[2]();
      v17 = self->_transitionCanceller;
      self->_transitionCanceller = 0;

      goto LABEL_31;
    }
    -[PKPassGroupStackView _cancelTransition](self, "_cancelTransition");
  }
  if (self->_hasSuspendedTransition)
  {
    if (self->_suspendedNextState == a3)
      -[PKPassGroupStackView _resumeSuspendedTransition](self, "_resumeSuspendedTransition");
    else
      -[PKPassGroupStackView _cancelSuspendedTransition](self, "_cancelSuspendedTransition");
  }
LABEL_31:
  v65 = v11;
  v66 = v7;
  ++self->_externalPresentationTag;
  presentationState = self->_presentationState;
  self->_nextState = a3;
  self->_priorState = self->_presentationState;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v83 = 0;
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke;
  v81[3] = &unk_1E3E62060;
  v81[4] = v82;
  v19 = (void *)objc_msgSend(v81, "copy", 2152);
  v20 = self->_transitionCanceller;
  self->_transitionCanceller = v19;

  if (a3 == 7 || (*((_WORD *)&self->_layoutState + 32) & 0xC000) != 0)
  {
    v21 = 1;
    v22 = 1;
  }
  else
  {
    v21 = 0;
    v22 = a3 == 5 && presentationState != 5;
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = v24;
  if (v22)
  {
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_2;
    v79[3] = &unk_1E3E6E430;
    v80 = v24;
    -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v79);
    v26 = v80;
LABEL_42:

    goto LABEL_47;
  }
  if (self->_modallyPresentedGroupView)
    objc_msgSend(v24, "addObject:");
  v27 = self->_modalGroupIndex;
  if (v27 && v27 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v53 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", v27 - 1);
    v26 = v53;
    if (v53)
    {
      objc_msgSend(v53, "frontmostPassView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "contentMode") > 3;

      if (v55)
        objc_msgSend(v25, "addObject:", v26);
    }
    goto LABEL_42;
  }
LABEL_47:
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v28 = v25;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v76 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v32, "beginPinningFrontFaceContentMode");
        if (v21)
        {
          objc_msgSend(v32, "frontmostPassView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "contentMode") <= 2)
            objc_msgSend(v33, "setContentMode:", 3);

        }
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v29);
  }

  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_3;
  v70[3] = &unk_1E3E6E458;
  v34 = v28;
  v72 = self;
  v73 = v82;
  v71 = v34;
  v74 = v66;
  v35 = (void (**)(_QWORD))objc_msgSend(v70, "copy");
  if (v68)
  {
    transitionCompletionHandlers = self->_transitionCompletionHandlers;
    v37 = (void *)objc_msgSend(v68, "copy");
    -[NSMutableArray addObject:](transitionCompletionHandlers, "addObject:", v37);

  }
  if (self->_layoutState.pilingMode == 1 && self->_nextState == 4)
    self->_layoutState.pilingMode = 0;
  -[PKPassGroupStackView bounds](self, "bounds");
  v38 = v66;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[PKPassGroupStackView _recomputeLayoutState](self, "_recomputeLayoutState");
  -[PKPassGroupStackView _updateHeaderFooterStateAnimated:layout:](self, "_updateHeaderFooterStateAnimated:layout:", v66, 0);
  -[PKPassGroupStackView _updateContentSizeAndLayout:](self, "_updateContentSizeAndLayout:", 1);
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    -[PKPassGroupView presentDiff:completion:](modallyPresentedGroupView, "presentDiff:completion:", 0, 0);
    if (a3 == 5)
      goto LABEL_71;
    if ((v65 & 1) != 0 || !-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
    {
      -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "isFrontFaceExpanded"))
        objc_msgSend(v48, "setFrontFaceExpanded:animated:", 0, 1);

      v38 = v66;
    }
  }
  if (a3 == 7)
  {
LABEL_86:
    v57 = self->_presentationState;
    if (v57 == 1)
    {
      self->_presentationState = a3;
      -[PKPassGroupStackView reloadData](self, "reloadData");
    }
    else if ((unint64_t)(v57 - 1) <= 2)
    {
      -[PKPassGroupStackView _tileGroupsForState:eager:withContext:](self, "_tileGroupsForState:eager:withContext:");
    }
    -[PKPassGroupStackView _setScrollEnabled:](self, "_setScrollEnabled:", 0);
    v58 = self->_modallyPresentedGroupView;
    if (v58
      || (-[PKPassGroupStackView _loadModalGroupViewAndPresentOffscreenIfNotCached:](self, "_loadModalGroupViewAndPresentOffscreenIfNotCached:", 1), (v58 = self->_modallyPresentedGroupView) != 0))
    {
      -[PKPassGroupView setHidden:](v58, "setHidden:", 0);
      v59 = self->_modallyPresentedGroupView;
    }
    else
    {
      v59 = 0;
    }
    -[PKPassGroupStackView _presentModalGroupView:withState:animated:context:completion:](self, "_presentModalGroupView:withState:animated:context:completion:", v59, a3, v38, v67, v35);
    goto LABEL_94;
  }
LABEL_71:
  if ((*((_WORD *)&self->_layoutState + 32) & 0xC000) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC);
    v50 = WeakRetained;
    if (WeakRetained)
    {
      ViewControllerPresentingViewController(WeakRetained);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        loanedGroupView = self->_loanedGroupView;
        if (loanedGroupView)
        {
          -[PKPassGroupStackView _acquireGroupView:resetExternalVC:](self, "_acquireGroupView:resetExternalVC:", loanedGroupView, 1);
        }
        else
        {
          objc_storeWeak((id *)&self->_externalVC, 0);
          objc_msgSend(v50, "setReceiver:", 0);
          objc_msgSend(v50, "setPassDashboardDelegate:", 0);
          objc_msgSend(v50, "invalidate");
          objc_msgSend(v51, "dismissViewControllerAnimated:completion:", 0, 0);
        }
      }

    }
    else
    {
      v56 = self->_loanedGroupView;
      if (v56)
        -[PKPassGroupStackView _acquireGroupView:resetExternalVC:](self, "_acquireGroupView:resetExternalVC:", v56, 1);
    }

    v38 = v66;
  }
  switch(a3)
  {
    case 2:
    case 3:
      -[PKPassGroupStackView _setScrollEnabled:](self, "_setScrollEnabled:", 0);
      -[PKPassGroupStackView _presentOffscreenAnimated:split:withCompletionHandler:](self, "_presentOffscreenAnimated:split:withCompletionHandler:", v38, a3 == 3, v35);
      break;
    case 4:
      if ((unint64_t)(self->_presentationState - 1) <= 2)
        -[PKPassGroupStackView _tileGroupsForState:eager:withContext:](self, "_tileGroupsForState:eager:withContext:");
      -[PKPassGroupStackView _presentGroupStackViewWithAnimation:priorBounds:completionHandler:](self, "_presentGroupStackViewWithAnimation:priorBounds:completionHandler:", v38, v35, v40, v42, v44, v46);
      break;
    case 5:
      goto LABEL_86;
    case 6:
      -[PKPassGroupStackView _presentPassIngestionWithAnimation:withCompletionHandler:](self, "_presentPassIngestionWithAnimation:withCompletionHandler:", v38, v35);
      -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");
      break;
    default:
      -[PKPassGroupStackView _cancelTransition](self, "_cancelTransition");
      if (v35)
        v35[2](v35);
      break;
  }
LABEL_94:
  -[PKPassGroupStackView _updatePanGestureRecognizerForGroupView:](self, "_updatePanGestureRecognizerForGroupView:", self->_modallyPresentedGroupView);
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_4;
  v69[3] = &unk_1E3E6E430;
  v69[4] = self;
  -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v69);
  -[PKPassGroupStackView layoutHeaderFootersAnimated:](self, "layoutHeaderFootersAnimated:", v38);
  -[PKPassGroupStackView _updateTopContentSeparatorVisibilityAnimated:](self, "_updateTopContentSeparatorVisibilityAnimated:", v38);
  -[PKPassGroupStackView _updateBottomContentSeparatorVisibilityAnimated:](self, "_updateBottomContentSeparatorVisibilityAnimated:", v38);
  v60 = *((_WORD *)&self->_layoutState + 32);
  *((_WORD *)&self->_layoutState + 32) = v60 & 0xEFFF;
  if ((v60 & 0x800) != 0)
  {
    *((_WORD *)&self->_layoutState + 32) = v60 & 0xE7FF;
    -[PKPassGroupStackView _updatePassFooterViewWithContext:](self, "_updatePassFooterViewWithContext:", v67);
  }
  else
  {
    -[PKPassGroupStackView _updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:](self, "_updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:", v67, 0.05);
  }
  v61 = *((_WORD *)&self->_layoutState + 32);
  if ((v61 & 0x4000) != 0)
  {
    *((_WORD *)&self->_layoutState + 32) = v61 & 0xBFFF;
    *(Class *)((char *)&self->super.super.super.super.isa + v63) = 0;
    v61 = *((_WORD *)&self->_layoutState + 32);
  }
  if (v61 < 0 && self->_presentationState != 7)
    *((_WORD *)&self->_layoutState + 32) = v61 & 0x7FFF;
  -[PKPassGroupStackView _updateCoachingState](self, "_updateCoachingState");
  -[PKPassGroupStackView _updatePausedState](self, "_updatePausedState");
  -[PKPassGroupStackView delegate](self, "delegate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v62, "groupStackView:transitioningToState:animated:", self, self->_presentationState, v38);

  _Block_object_dispose(v82, 8);
  objc_autoreleasePoolPop(context);

}

- (void)_updateBottomContentSeparatorVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  int64_t presentationState;
  _BOOL4 v19;
  int64_t v20;
  double v21;
  PKPassGroupView *modallyPresentedGroupView;
  void *v23;
  double v24;
  double v25;
  NSObject *bottomContentSeparatorVisibilityTimer;
  OS_dispatch_source *v27;
  OS_dispatch_source *v28;
  OS_dispatch_source *v29;
  NSObject *v30;
  dispatch_time_t v31;
  NSObject *v32;
  void *v33;
  _QWORD handler[5];
  id v35;
  BOOL v36;
  CATransform3D v37;
  CGAffineTransform v38;
  CGRect v39;
  CGRect v40;
  CGRect remainder;
  CGRect slice;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  if (!self->_delegateWantsBottomContentSeparation)
    return;
  v3 = a3;
  -[PKPassGroupStackView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKPassGroupStackView contentSize](self, "contentSize");
  v14 = v13;
  v16 = v15;
  presentationState = self->_presentationState;
  if (presentationState == 7 || presentationState == 5)
    v19 = 1;
  else
    v19 = presentationState == 4 && -[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
  memset(&slice, 0, sizeof(slice));
  remainder.origin = (CGPoint)*MEMORY[0x1E0C9D538];
  remainder.size.width = v14;
  remainder.size.height = v16;
  v43.origin.x = remainder.origin.x;
  v43.origin.y = remainder.origin.y;
  v43.size.width = v14;
  v43.size.height = v16;
  CGRectDivide(v43, &slice, &remainder, self->_lastBoundsInsets.bottom, CGRectMaxYEdge);
  v40 = slice;
  remainder.origin.x = v6;
  remainder.origin.y = v8;
  remainder.size.width = v10;
  remainder.size.height = v12;
  v44.origin.x = v6;
  v44.origin.y = v8;
  v44.size.width = v10;
  v44.size.height = v12;
  CGRectDivide(v44, &slice, &remainder, self->_lastBoundsInsets.bottom, CGRectMaxYEdge);
  v39 = slice;
  v20 = self->_presentationState;
  if (v20 == 4)
  {
    v21 = 0.0;
    if (!v19)
    {
      slice = v40;
      if (self->_footerView && slice.size.height > 0.0)
      {
        v24 = self->_footerViewMinimumHeight * 0.25;
        slice.origin.y = slice.origin.y - v24;
        slice.size.height = slice.size.height + v24;
        v45.origin.x = v6;
        v45.origin.y = v8;
        v45.size.width = v10;
        v45.size.height = v12;
        CGRectGetMaxY(v45);
      }
      slice = v39;
      goto LABEL_31;
    }
  }
  else
  {
    if (v20 == 7 || (v21 = 0.0, v20 == 5))
    {
      if (-[NSMutableArray count](self->_passPileViews, "count"))
        v21 = 1.0;
      else
        v21 = 0.0;
    }
    slice = v39;
    if (!v19)
      goto LABEL_31;
  }
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView && slice.size.height > 0.0 && v21 < 1.0)
  {
    -[PKPassGroupView layer](modallyPresentedGroupView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "anchorPoint");
    objc_msgSend(v23, "position");
    objc_msgSend(v23, "bounds");
    memset(&v38, 0, sizeof(v38));
    if (v23)
      objc_msgSend(v23, "transform");
    else
      memset(&v37, 0, sizeof(v37));
    CATransform3DGetAffineTransform(&v38, &v37);
    slice.origin.y = slice.origin.y - slice.size.height * 0.25;
    slice.size.height = slice.size.height + slice.size.height * 0.25;

  }
LABEL_31:
  PKSpringAnimationSolveForInput();
  if (self->_bottomContentSeparatorVisibility != v25)
  {
    self->_bottomContentSeparatorVisibility = v25;
    bottomContentSeparatorVisibilityTimer = self->_bottomContentSeparatorVisibilityTimer;
    if (bottomContentSeparatorVisibilityTimer)
    {
      dispatch_source_cancel(bottomContentSeparatorVisibilityTimer);
      v27 = self->_bottomContentSeparatorVisibilityTimer;
      self->_bottomContentSeparatorVisibilityTimer = 0;

    }
    if (self->_footerAnimationDelay <= 0.0)
    {
      -[PKPassGroupStackView delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "groupStackView:wantsBottomContentSeparatorWithVisibility:animated:", self, v3, self->_bottomContentSeparatorVisibility);

    }
    else
    {
      v28 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v29 = self->_bottomContentSeparatorVisibilityTimer;
      self->_bottomContentSeparatorVisibilityTimer = v28;

      v30 = self->_bottomContentSeparatorVisibilityTimer;
      v31 = dispatch_time(0, (uint64_t)(self->_footerAnimationDelay * 1000000000.0));
      dispatch_source_set_timer(v30, v31, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      objc_initWeak((id *)&v38, self);
      v32 = self->_bottomContentSeparatorVisibilityTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __72__PKPassGroupStackView__updateBottomContentSeparatorVisibilityAnimated___block_invoke;
      handler[3] = &unk_1E3E67148;
      objc_copyWeak(&v35, (id *)&v38);
      handler[4] = self;
      v36 = v3;
      dispatch_source_set_event_handler(v32, handler);
      dispatch_resume((dispatch_object_t)self->_bottomContentSeparatorVisibilityTimer);
      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)&v38);
    }
  }
}

- (void)_updateContentSizeAndLayout:(BOOL)a3
{
  -[PKPassGroupStackView _updateContentSizeAndLayout:forceUpdate:](self, "_updateContentSizeAndLayout:forceUpdate:", a3, 0);
}

- (void)updateHeaderAndSubheaderViewsIfNecessary
{
  -[PKPassGroupStackView _recomputeLayoutState](self, "_recomputeLayoutState");
  if (-[PKPassGroupStackView _updateHeaderFooterStateAnimated:layout:](self, "_updateHeaderFooterStateAnimated:layout:", 1, 0))
  {
    -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", self->_presentationState, 1);
  }
  else
  {
    -[PKPassGroupStackView _updateContentSizeAndLayout:forceUpdate:](self, "_updateContentSizeAndLayout:forceUpdate:", 1, 1);
  }
}

- (BOOL)_updateHeaderFooterStateAnimated:(BOOL)a3 layout:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;
  int v8;
  double v9;
  double v10;
  unsigned int v11;
  id *v12;
  PKPGSVSectionHeaderContext *paymentHeaderContext;
  BOOL v14;
  unsigned int v15;
  id *v16;
  PKPGSVSectionHeaderContext *passHeaderContext;
  BOOL v18;
  id *p_footerView;
  UIView *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  id WeakRetained;
  char v31;
  id v32;
  double v33;
  void *v34;
  _BOOL4 v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  _BYTE v41[7];
  __int128 v42;
  uint64_t v43;

  v4 = a4;
  v5 = a3;
  p_layoutState = &self->_layoutState;
  v42 = *(_OWORD *)&self->_layoutState.groups.count;
  v43 = *((_QWORD *)&self->_layoutState.groups + 2);
  v8 = (*((unsigned __int8 *)&self->_layoutState + 64) >> 1) & 3;
  -[PKPassGroupStackView frame](self, "frame");
  v10 = v9;
  v11 = *((unsigned __int16 *)p_layoutState + 32);
  if ((v11 & 2) != 0)
  {
    paymentHeaderContext = self->_paymentHeaderContext;
    v38 = v42;
    v39 = v43;
    v40 = v8;
    memset(v41, 0, sizeof(v41));
    v12 = +[PKPGSVSectionHeaderContext createUpdatedHeaderContextForGroupStackView:passType:withState:currentContext:allowHeader:allowSubheaders:containerWidth:](v9, (uint64_t)PKPGSVSectionHeaderContext, self, 1, (uint64_t)&v38, paymentHeaderContext, (v11 >> 3) & 1, (v11 >> 5) & 1);
  }
  else
  {
    v12 = 0;
  }
  v14 = -[PKPassGroupStackView _updateHeaderContext:toContext:animated:](self, "_updateHeaderContext:toContext:animated:", &self->_paymentHeaderContext, v12, v5);

  v15 = *((unsigned __int16 *)p_layoutState + 32);
  if ((v15 & 4) != 0)
  {
    passHeaderContext = self->_passHeaderContext;
    v38 = v42;
    v39 = v43;
    v40 = v8;
    memset(v41, 0, sizeof(v41));
    v16 = +[PKPGSVSectionHeaderContext createUpdatedHeaderContextForGroupStackView:passType:withState:currentContext:allowHeader:allowSubheaders:containerWidth:](v10, (uint64_t)PKPGSVSectionHeaderContext, self, 0, (uint64_t)&v38, passHeaderContext, (v15 >> 4) & 1, (v15 >> 6) & 1);
  }
  else
  {
    v16 = 0;
  }
  v18 = -[PKPassGroupStackView _updateHeaderContext:toContext:animated:](self, "_updateHeaderContext:toContext:animated:", &self->_passHeaderContext, v16, v5);
  p_footerView = (id *)&self->_footerView;
  v20 = self->_footerView;
  v21 = v20;
  if ((*((_WORD *)p_layoutState + 32) & 0x80) == 0)
  {
    if (!v20)
      goto LABEL_16;
    v22 = *p_footerView;
    *p_footerView = 0;

    objc_msgSend(v21, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __64__PKPassGroupStackView__updateHeaderFooterStateAnimated_layout___block_invoke;
    v36[3] = &unk_1E3E62288;
    v21 = v21;
    v37 = v21;
    objc_msgSend(v23, "pkui_animateToOpacity:withCompletion:", v36, 0.0);

    -[UIImageView layer](self->_footerPocketBackgroundShadow, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

    -[UIImageView layer](self->_footerPocketForegroundShadow, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pkui_animateToOpacity:withCompletion:", 0, 0.0);

    v26 = v37;
    goto LABEL_15;
  }
  if (v20)
  {
LABEL_11:
    v27 = 0.0;
    if ((*((_BYTE *)&p_layoutState->groups + 16) & 4) != 0 && p_layoutState->groups.count > 1)
      v27 = 1.0;
    self->_footerPocketForegroundShadowAlpha = v27;
    -[UIImageView layer](self->_footerPocketBackgroundShadow, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pkui_animateToOpacity:withCompletion:", 0, 1.0);

    -[UIImageView layer](self->_footerPocketForegroundShadow, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pkui_animateToOpacity:withCompletion:", 0, self->_footerPocketForegroundShadowAlpha);
LABEL_15:

    goto LABEL_16;
  }
  v35 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    v32 = objc_loadWeakRetained((id *)&self->_datasource);
    objc_msgSend(v32, "footerForGroupStackView:", self);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_footerView, v21);

    objc_msgSend(v21, "frame");
    self->_footerViewMinimumHeight = v33;
    objc_msgSend(*p_footerView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAnchorPoint:", 0.5, 0.0);

    v4 = v35;
    if (v21)
      goto LABEL_11;
  }
  else
  {
    v21 = 0;
    v4 = v35;
  }
LABEL_16:
  if (v4)
    -[PKPassGroupStackView layoutHeaderFootersAnimated:](self, "layoutHeaderFootersAnimated:", v5);

  return v18 || v14;
}

- (BOOL)_updateHeaderContext:(id *)a3 toContext:(id)a4 animated:(BOOL)a5
{
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  void (**v11)(void *, id);
  void *v12;
  id v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  _QWORD *v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD aBlock[4];
  BOOL v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a3)
  {
    v9 = *a3;
    if ((PKEqualObjects() & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke;
      aBlock[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
      v49 = a5;
      v11 = (void (**)(void *, id))_Block_copy(aBlock);
      if (v9)
        v12 = (void *)v9[5];
      else
        v12 = 0;
      v13 = v12;
      if (v8)
        v14 = (void *)v8[5];
      else
        v14 = 0;
      v15 = v14;
      v16 = v13 != v15;

      if (v13 && v13 != v15)
        v11[2](v11, v13);
      if (v9)
        v17 = (void *)v9[6];
      else
        v17 = 0;
      v18 = v17;
      v36 = (void *)objc_msgSend(v18, "pk_createArrayByApplyingBlock:", &__block_literal_global_109_0);

      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v38 = a4;
      v39 = v9;
      v37 = v13;
      if (v8)
        v20 = (void *)v8[6];
      else
        v20 = 0;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v45 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD **)(*((_QWORD *)&v44 + 1) + 8 * i);
            if (v26)
              v26 = (_QWORD *)v26[1];
            v27 = v26;
            objc_msgSend(v19, "addObject:", v27);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v23);
      }

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v28 = v36;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v41 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
            v34 = objc_msgSend(v19, "indexOfObjectIdenticalTo:", v33);
            if (v34 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v11[2](v11, v33);
              v16 = 1;
            }
            else
            {
              objc_msgSend(v19, "removeObjectAtIndex:", v34);
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v30);
      }

      v10 = objc_msgSend(v19, "count") != 0 || v16;
      objc_storeStrong(a3, v38);

      v9 = v39;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  int v19;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKPassGroupStackView;
  -[PKPassGroupStackView layoutSubviews](&v22, sel_layoutSubviews);
  -[PKPassGroupStackView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPassGroupStackView safeAreaInsets](self, "safeAreaInsets");
  v15 = v8 == self->_lastBoundsSize.width && v10 == self->_lastBoundsSize.height;
  if (v15
    && (v12 == self->_lastBoundsInsets.left ? (v16 = v11 == self->_lastBoundsInsets.top) : (v16 = 0),
        v16 ? (v17 = v14 == self->_lastBoundsInsets.right) : (v17 = 0),
        v17 ? (v18 = v13 == self->_lastBoundsInsets.bottom) : (v18 = 0),
        v18 && self->_lastTopContentSeparatorHeight == self->_topContentSeparatorHeight))
  {
    v19 = 0;
  }
  else
  {
    self->_lastBoundsSize.width = v8;
    self->_lastBoundsSize.height = v10;
    self->_lastBoundsInsets.top = v11;
    self->_lastBoundsInsets.left = v12;
    self->_lastBoundsInsets.bottom = v13;
    self->_lastBoundsInsets.right = v14;
    self->_lastTopContentSeparatorHeight = self->_topContentSeparatorHeight;
    -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self, "updateHeaderAndSubheaderViewsIfNecessary");
    v19 = 1;
  }
  -[PKPassthroughView setFrame:](self->_headerContainerView, "setFrame:", v4, v6, v8, v10);
  -[PKPassthroughView setFrame:](self->_subheaderContainerView, "setFrame:", v4, v6, v8, v10);
  -[PKBackdropView setFrame:](self->_backdropView, "setFrame:", v4, v6 - self->_lastTopContentSeparatorHeight, v8, v10 + self->_lastTopContentSeparatorHeight);
  -[PKPassGroupStackView contentSize](self, "contentSize");
  -[PKPassthroughView setFrame:](self->_passContainerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), fmax(v8, v20), fmax(v10, v21));
  -[PKPassGroupStackView layoutHeaderFootersAnimated:](self, "layoutHeaderFootersAnimated:", 0);
  if (v19)
    -[PKPassGroupStackView _updateContentSizeAndLayout:](self, "_updateContentSizeAndLayout:", 0);
}

- (void)_updateContentSizeAndLayout:(BOOL)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  _OWORD v7[2];
  _OWORD v8[2];

  v4 = a4;
  v5 = a3;
  memset(v8, 0, sizeof(v8));
  memset(v7, 0, sizeof(v7));
  if (-[PKPassGroupStackView _updateContentSizeWithPriorBounds:bounds:](self, "_updateContentSizeWithPriorBounds:bounds:", v8, v7)|| v4)
  {
    -[PKPassGroupStackView layoutHeaderFootersAnimated:](self, "layoutHeaderFootersAnimated:", v5);
    -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", v5, v8[0], v7[0]);
    -[PKPassGroupStackView tilePassesEagerly:](self, "tilePassesEagerly:", 0);
    if (!v5)
      -[PKPassGroupStackView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (BOOL)_updateContentSizeWithPriorBounds:(CGRect *)a3 bounds:(CGRect *)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;

  -[PKPassGroupStackView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  self->_lastBoundsSize.width = v11;
  self->_lastBoundsSize.height = v13;
  -[PKPassGroupStackView contentSize](self, "contentSize");
  v16 = v15;
  v18 = v17;
  -[PKPassGroupStackView _contentSize](self, "_contentSize");
  v21 = v18 != v20 || v16 != v19;
  if (v21)
    -[PKPassGroupStackView setContentSize:](self, "setContentSize:");
  if (a3)
  {
    a3->origin.x = v8;
    a3->origin.y = v10;
    a3->size.width = v12;
    a3->size.height = v14;
  }
  if (a4)
  {
    if (v21)
    {
      -[PKPassGroupStackView bounds](self, "bounds");
      v8 = v22;
      v10 = v23;
      v12 = v24;
      v14 = v25;
    }
    a4->origin.x = v8;
    a4->origin.y = v10;
    a4->size.width = v12;
    a4->size.height = v14;
  }
  return v21;
}

- (BOOL)_recomputeLayoutState
{
  PKPassGroupStackViewDatasource **p_datasource;
  id WeakRetained;
  _BOOL4 v5;
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;
  unint64_t count;
  unsigned __int8 v8;
  double separationPadding;
  double groupCellHeight;
  unint64_t v11;
  uint64_t v12;
  unint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  unint64_t v17;
  char v18;
  id v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  char v28;
  __int16 v29;
  int v30;
  unsigned int v31;
  char v32;
  int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  int v38;
  BOOL v39;
  __int16 v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;
  __int16 v44;
  UIView *footerView;
  uint64_t v46;
  double v47;
  void *v48;
  __n128 v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  __int16 v53;
  int v54;
  _BOOL4 v56;
  int v57;
  __int16 v58;
  unint64_t separatorIndex;
  _QWORD aBlock[5];
  __int128 v61;
  uint64_t v62;
  char v63;
  _BYTE v64[7];
  __int128 v65;
  uint64_t v66;

  p_datasource = &self->_datasource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  v5 = -[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
  p_layoutState = &self->_layoutState;
  count = self->_layoutState.groups.count;
  separatorIndex = self->_layoutState.groups.separatorIndex;
  v8 = *((_BYTE *)&self->_layoutState.groups + 16);
  v56 = v5;
  v57 = *((unsigned __int8 *)&self->_layoutState + 24);
  groupCellHeight = self->_layoutState.groupCellHeight;
  separationPadding = self->_layoutState.separationPadding;
  v58 = *((_WORD *)&self->_layoutState + 32);
  v11 = objc_msgSend(WeakRetained, "numberOfGroups");
  v12 = objc_msgSend(WeakRetained, "indexOfSeparationGroup");
  if (v12 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0)
    v14 = 0;
  else
    v14 = v12 + 1;
  v15 = v14 != 0;
  v16 = v11 > v14;
  if (v15 && v16)
    v17 = v12;
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = objc_msgSend(WeakRetained, "areGroupsSeparated");
  p_layoutState->groups.count = v11;
  self->_layoutState.groups.separatorIndex = v17;
  *((_BYTE *)&self->_layoutState.groups + 16) = v18 | (2 * v15) | (4 * v16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)p_datasource);
    v20 = objc_msgSend(v19, "groupStackViewShouldShowHeaderViews:", self);

    if (v20)
    {
      v21 = objc_opt_respondsToSelector();
      v22 = *((unsigned __int8 *)&self->_layoutState.groups + 16);
      v23 = (v22 >> 1) & 1;
      v24 = v21 ^ 1;
      if ((v22 & 2) == 0 && (v24 & 1) == 0)
      {
        v61 = *(_OWORD *)&p_layoutState->groups.count;
        v62 = *((_QWORD *)&self->_layoutState.groups + 2);
        v23 = objc_msgSend(WeakRetained, "groupStackView:requiresHeaderForPassType:withState:", self, 1, &v61);
        v22 = *((unsigned __int8 *)&self->_layoutState.groups + 16);
      }
      if (v23)
        v25 = 2;
      else
        v25 = 0;
      v26 = *((_WORD *)&self->_layoutState + 32) & 0xFFFD | v25;
      *((_WORD *)&self->_layoutState + 32) = v26;
      if (((v24 | ((v22 & 4) >> 2)) & 1) != 0)
      {
        v27 = (v22 >> 2) & 1;
      }
      else
      {
        v61 = *(_OWORD *)&p_layoutState->groups.count;
        v62 = *((_QWORD *)&self->_layoutState.groups + 2);
        v27 = objc_msgSend(WeakRetained, "groupStackView:requiresHeaderForPassType:withState:", self, 0, &v61);
        v26 = *((unsigned __int16 *)&self->_layoutState + 32);
      }
      if (v27)
        v29 = 4;
      else
        v29 = 0;
      *((_WORD *)&self->_layoutState + 32) = v29 | v26 & 0xFFFB;
      v65 = *(_OWORD *)&p_layoutState->groups.count;
      v66 = *((_QWORD *)&self->_layoutState.groups + 2);
      if (v27)
        v30 = 2;
      else
        v30 = 0;
      v31 = v30 & 0xFFFFFFFE | (v26 >> 1) & 1;
      v32 = objc_opt_respondsToSelector();
      v33 = *((unsigned __int16 *)&self->_layoutState + 32);
      if ((v32 & 1) != 0)
      {
        if ((v33 & 2) != 0)
        {
          v61 = v65;
          v62 = v66;
          v63 = v31;
          memset(v64, 0, sizeof(v64));
          if (objc_msgSend(WeakRetained, "groupStackView:willHaveHeaderViewForPassType:withState:", self, 1, &v61))v34 = 8;
          else
            v34 = 0;
          v33 = *((unsigned __int16 *)&self->_layoutState + 32);
        }
        else
        {
          v34 = 0;
        }
        v36 = v33 & 0xFFFFFFF7 | v34;
        *((_WORD *)&self->_layoutState + 32) = v36;
        if ((v33 & 4) != 0)
        {
          v61 = v65;
          v62 = v66;
          v63 = v31;
          memset(v64, 0, sizeof(v64));
          if (objc_msgSend(WeakRetained, "groupStackView:willHaveHeaderViewForPassType:withState:", self, 0, &v61))v37 = 16;
          else
            v37 = 0;
          v36 = *((unsigned __int16 *)&self->_layoutState + 32);
        }
        else
        {
          v37 = 0;
        }
        v35 = v36 & 0xFFFFFFEF | v37;
      }
      else
      {
        v35 = v33 & 0xFFE7;
      }
      *((_WORD *)&self->_layoutState + 32) = v35;
      if (((v35 >> 1) & 1) != (__int16)((_WORD)v35 << 13) >> 15)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v61 = v65;
          v62 = v66;
          v63 = v31;
          memset(v64, 0, sizeof(v64));
          v38 = objc_msgSend(WeakRetained, "groupStackView:willHaveSubheaderViewsWithState:", self, &v61);
          LOWORD(v35) = *((_WORD *)&self->_layoutState + 32);
          if ((v35 & 2) != 0)
          {
            v39 = v38 == 0;
            v40 = 32;
            goto LABEL_75;
          }
          if ((v35 & 4) != 0)
          {
            v39 = v38 == 0;
            v40 = 64;
LABEL_75:
            if (v39)
              v40 = 0;
            v41 = v35 & 0xFF9F | v40;
            goto LABEL_50;
          }
        }
        else
        {
          LOWORD(v35) = *((_WORD *)&self->_layoutState + 32);
        }
      }
      v41 = v35 & 0xFF9F;
LABEL_50:
      *((_WORD *)&self->_layoutState + 32) = v41;
      v28 = 1;
      goto LABEL_51;
    }
  }
  v28 = 0;
  *((_WORD *)&self->_layoutState + 32) &= 0xFF81u;
LABEL_51:
  if (PKExpiredPassesRefreshEnabled())
  {
    v43 = -[PKGroupsController expiredSectionPassesCount](self->_groupsController, "expiredSectionPassesCount");
    v44 = (v28 & (v43 > 0)) != 0 ? 128 : 0;
    *((_WORD *)&self->_layoutState + 32) = v44 | *((_WORD *)&self->_layoutState + 32) & 0xFF7F;
    if ((v28 & (v43 > 0)) == 1)
    {
      v42 = v43;
      footerView = self->_footerView;
      if (footerView)
        -[UIView setExpiredSectionCount:](footerView, "setExpiredSectionCount:", v42);
    }
  }
  *((_BYTE *)&self->_layoutState + 24) = *((_BYTE *)&self->_layoutState + 24) & 0xFE | objc_msgSend(WeakRetained, "supportsExternalPresentation", v42);
  -[PKPassGroupStackView _groupCellHeight](self, "_groupCellHeight");
  v46 = MEMORY[0x1E0C809B0];
  self->_layoutState.groupCellHeight = v47;
  aBlock[0] = v46;
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKPassGroupStackView__recomputeLayoutState__block_invoke;
  aBlock[3] = &unk_1E3E6E7B0;
  aBlock[4] = self;
  v48 = _Block_copy(aBlock);
  v50 = v48;
  v51 = self->_layoutState.groups.separatorIndex;
  if (v51 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_62;
  v52 = p_layoutState->groups.count;
  v49.n128_u64[0] = 0;
  if ((*((_WORD *)&self->_layoutState + 32) & 6) == 2 && v52)
  {
    v51 = v52 - 1;
LABEL_62:
    (*((void (**)(void *, unint64_t, __n128))v48 + 2))(v48, v51, v49);
    v52 = p_layoutState->groups.count;
  }
  *(_QWORD *)&self->_layoutState.separationPadding = v49.n128_u64[0];
  if (count != v52
    || ((*((_BYTE *)&self->_layoutState.groups + 16) ^ v8) & 6) != 0
    || separatorIndex != self->_layoutState.groups.separatorIndex
    || (v53 = *((_WORD *)&self->_layoutState + 32), ((v53 ^ v58) & 0x7E) != 0)
    || ((*((unsigned __int8 *)&self->_layoutState + 24) ^ v57) & 1) != 0)
  {
    LOBYTE(v54) = 1;
  }
  else
  {
    LOBYTE(v54) = 1;
    if (groupCellHeight == self->_layoutState.groupCellHeight && separationPadding == v49.n128_f64[0])
    {
      if ((v53 & 6) == 4)
        v54 = v56 ^ -[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
      else
        LOBYTE(v54) = 0;
    }
  }

  return v54;
}

- (CGSize)_contentSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize *p_lastBoundsSize;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  CGSize result;

  v3 = -[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
  -[PKPassGroupStackView _groupCellHeight](self, "_groupCellHeight");
  v5 = self->_layoutState.separationPadding + v4 * (double)self->_layoutState.groups.count;
  if (v3)
  {
    p_lastBoundsSize = &self->_lastBoundsSize;
    v7 = fmax(self->_lastBoundsSize.height, v5);
  }
  else
  {
    v8 = -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_paymentHeaderContext);
    v9 = v5 + v8 + -[PKPGSVSectionHeaderContext totalHeight]((uint64_t)self->_passHeaderContext);
    if ((*((_BYTE *)&self->_layoutState.groups + 16) & 4) != 0)
    {
      -[PKPassGroupStackView _lastBarcodePassGroupCellHeight](self, "_lastBarcodePassGroupCellHeight");
      PKFloatRoundToPixel();
      v9 = v9 + v12;
    }
    else if ((*((_WORD *)&self->_layoutState + 32) & 6) == 2)
    {
      PKGetMaxPassWidth();
      PKFloatRoundToPixel();
      v11 = fmax(v10, 0.0);
      if (v11 <= 0.0)
        v11 = 8.0;
      v9 = v9 + v11;
    }
    p_lastBoundsSize = &self->_lastBoundsSize;
    v7 = fmax(self->_lastBoundsSize.height, v9 + self->_lastBoundsInsets.bottom);
    if (self->_footerView)
      v7 = v7 + self->_footerViewMinimumHeight;
  }
  width = p_lastBoundsSize->width;
  result.height = v7;
  result.width = width;
  return result;
}

- (double)_groupCellHeight
{
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;
  int v3;
  double v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  PKPGSVSectionHeaderContext *paymentHeaderContext;
  double v16;
  double v17;
  double top;
  double v19;
  PKPGSVSectionHeaderContext *passHeaderContext;
  double v21;
  double v22;
  double v23;
  double v24;

  p_layoutState = &self->_layoutState;
  v3 = *((unsigned __int8 *)&self->_layoutState.groups + 16);
  if ((~v3 & 3) == 0
    || self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL
    || ((*((unsigned __int16 *)&self->_layoutState + 32) >> 1) & 1)
     + ((*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1u) > 1)
  {
    return 55.0;
  }
  if ((v3 & 1) != 0)
  {
    v5 = 0.0;
    if ((v3 & 2) != 0)
    {
      PKPassFrontFaceContentSize();
      v5 = v10;
    }
  }
  else
  {
    v5 = 0.0;
    if (p_layoutState->groups.count)
    {
      v6 = 0;
      while (1)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
        objc_msgSend(WeakRetained, "groupAtIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "passCount"))
          break;

        if (++v6 >= p_layoutState->groups.count)
          goto LABEL_16;
      }
      objc_msgSend(v8, "passAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0.0;
      if (objc_msgSend(v11, "style") == 6)
      {
        PKPassFrontFaceContentSize();
        v5 = v12;
      }

    }
  }
LABEL_16:
  -[PKPassGroupStackView bounds](self, "bounds");
  v14 = v13;
  paymentHeaderContext = self->_paymentHeaderContext;
  v16 = 0.0;
  v17 = 0.0;
  if (paymentHeaderContext)
  {
    top = paymentHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)self->_paymentHeaderContext);
    v17 = paymentHeaderContext->_headerMargins.bottom + top + v19;
  }
  passHeaderContext = self->_passHeaderContext;
  if (passHeaderContext)
  {
    v21 = passHeaderContext->_headerMargins.top;
    -[PKPGSVSectionHeaderContext _headerViewSize]((uint64_t)passHeaderContext);
    v16 = passHeaderContext->_headerMargins.bottom + v21 + v22;
  }
  if (p_layoutState->groups.count)
    v23 = floor((v14 - (v17 + v16)) / (double)p_layoutState->groups.count);
  else
    v23 = 0.0;
  if (v5 <= 0.0)
    v24 = 1.79769313e308;
  else
    PKFloatRoundToPixel();
  return fmax(fmin(v23, v24), 55.0);
}

- (double)_lastBarcodePassGroupCellHeight
{
  double result;

  PKRunningInRemoteContext();
  PKFloatRoundToPixel();
  return result;
}

double __45__PKPassGroupStackView__recomputeLayoutState__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "_groupViewAtIndexWhileEnsuringVisible:withContentMode:", a2, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frontmostPassView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeOfFrontFace");
  v6 = v5;
  objc_msgSend(v3, "offsetForFrontmostPassWhileStacked");
  v8 = v6 + v7 - *(double *)(*(_QWORD *)(a1 + 32) + 2248);

  return v8;
}

- (id)_groupViewAtIndexWhileEnsuringVisible:(unint64_t)a3 withContentMode:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v13;

  v7 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:");
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isHidden"))
  {
    v13 = 0;
    -[PKPassGroupStackView _loadGroupViewAtIndex:forState:presentationState:cached:](self, "_loadGroupViewAtIndex:forState:presentationState:cached:", a3, self->_presentationState, 1, &v13);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(v8, "frontmostPassView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "contentMode") < a4)
    objc_msgSend(v11, "setContentMode:", a4);

  return v8;
}

- (void)tilePassesEagerly:(BOOL)a3
{
  if (self->_presentationState == 4)
  {
    -[PKPassGroupStackView _tileGroupsForState:eager:withContext:](self, "_tileGroupsForState:eager:withContext:", 4, a3, 0);
    -[PKPassGroupStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updatePausedState
{
  BOOL v2;
  int64_t presentationState;
  _QWORD v5[5];

  if (self->_invalidated || self->_paused)
  {
    v2 = 1;
  }
  else
  {
    presentationState = self->_presentationState;
    v2 = presentationState == 2 || presentationState == 7;
  }
  self->_effectivePaused = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PKPassGroupStackView__updatePausedState__block_invoke;
  v5[3] = &unk_1E3E6E430;
  v5[4] = self;
  -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v5);
}

- (void)_updateCoachingState
{
  int64_t v3;
  id v4;

  if (-[PKPassGroupStackView isPresentingPassViewFront](self, "isPresentingPassViewFront")
    && self->_passFooterViewVisible)
  {
    v3 = -[PKPassFooterView coachingState](self->_passFooterView, "coachingState");
  }
  else
  {
    v3 = 0;
  }
  if (self->_coachingState != v3)
  {
    self->_coachingState = v3;
    -[PKPassGroupStackView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "groupStackViewDidChangeCoachingState:", self);

  }
}

- (void)_tileGroupsForState:(int64_t)a3 eager:(BOOL)a4 withContext:(id)a5
{
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  void *context;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  PKPassGroupStackView *v46;
  id v47;
  id v48;
  id v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  _BYTE v64[128];
  uint64_t v65;

  v5 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v34 = a5;
  context = (void *)MEMORY[0x1A1AE621C]();
  v7 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
  v9 = v8;
  v10 = -[PKPassGroupStackView _rangeOfEagerLoadedIndexes](self, "_rangeOfEagerLoadedIndexes");
  v35 = v5;
  v36 = v11;
  v37 = v10;
  if (v5)
    v12 = v11;
  else
    v12 = v9;
  if (v5)
    v13 = v10;
  else
    v13 = v7;
  v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v14, "addIndexesInRange:", v13, v12);
  if (v7 + v9 < self->_layoutState.groups.count)
    objc_msgSend(v14, "addIndex:");
  v15 = -[PKPassGroupStackView _createStackedIndices](self, "_createStackedIndices");
  objc_msgSend(v14, "addIndexes:", v15);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
    v17 = 3;
  else
    v17 = 1;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke;
  v53[3] = &unk_1E3E6E550;
  v53[4] = self;
  v57 = a3;
  v18 = v16;
  v54 = v18;
  v58 = v13;
  v59 = v12;
  v63 = v35;
  v60 = v7;
  v61 = v9;
  v62 = v17;
  v19 = v34;
  v55 = v19;
  v20 = v15;
  v56 = v20;
  objc_msgSend(v14, "enumerateIndexesUsingBlock:", v53);
  v21 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v21, "addIndex:", -[PKPassGroupStackView _lastIndex](self, "_lastIndex"));
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v21, "addIndex:");
  objc_msgSend(v21, "addIndexesInRange:", v37, v36);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __62__PKPassGroupStackView__tileGroupsForState_eager_withContext___block_invoke_2;
  v44[3] = &unk_1E3E6E578;
  v22 = v14;
  v45 = v22;
  v46 = self;
  v50 = a3;
  v23 = v21;
  v47 = v23;
  v24 = v18;
  v48 = v24;
  v25 = v20;
  v49 = v25;
  v51 = v7;
  v52 = v9;
  -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v44);
  -[NSMutableDictionary allKeys](self->_groupViewsByGroupID, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");

  objc_msgSend(v24, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeObjectsInArray:", v28);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v29 = v27;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v41 != v32)
          objc_enumerationMutation(v29);
        -[PKPassGroupStackView _removeGroupViewAsSubviewWithGroupID:](self, "_removeGroupViewAsSubviewWithGroupID:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
    }
    while (v31);
  }

  -[PKPassGroupStackView _layoutFooterAnimated:withAnimationDelay:](self, "_layoutFooterAnimated:withAnimationDelay:", 0, 0.0);
  objc_autoreleasePoolPop(context);

}

- (_NSRange)_rangeOfEagerLoadedIndexes
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t count;
  NSUInteger v8;
  NSUInteger v9;
  BOOL v10;
  NSUInteger v11;
  _NSRange result;

  v3 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
  v5 = v4 + 12;
  if (v3 >= 7)
    v6 = v3 - 6;
  else
    v6 = 0;
  count = self->_layoutState.groups.count;
  v8 = v6 + v5 - count;
  if (v6 + v5 >= count)
  {
    v9 = count - v5;
    if (v6 < v8)
      v9 = 0;
    v10 = v8 >= v6;
    v11 = v8 - v6;
    if (!v10)
      v11 = 0;
    v5 -= v11;
    v6 = v9;
  }
  result.length = v5;
  result.location = v6;
  return result;
}

- (id)_createStackedIndices
{
  id v3;
  unint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v4 = -[PKPassGroupStackView _startVisibleIndex](self, "_startVisibleIndex");
  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  objc_msgSend(WeakRetained, "groupAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (-[PKPassGroupStackView _separatorGroup](self, "_separatorGroup"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6 == v7))
  {
    v11 = 0;
    v10 = 0;
    if (!v4)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(v6, "passAtIndex:", objc_msgSend(v6, "frontmostPassIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "style");

    v10 = -[PKPassGroupStackView _edgeStylesObscuredByTopMiddleOfPassStyle:](self, "_edgeStylesObscuredByTopMiddleOfPassStyle:", v9);
    v11 = -[PKPassGroupStackView _edgeStylesObscuredByTopCornersOfPassStyle:](self, "_edgeStylesObscuredByTopCornersOfPassStyle:", v9);
    if (!v4)
      goto LABEL_16;
  }
  while (1)
  {
    --v4;
    v12 = objc_loadWeakRetained((id *)&self->_datasource);
    objc_msgSend(v12, "groupAtIndex:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "passAtIndex:", objc_msgSend(v13, "frontmostPassIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "style");

    v16 = -[PKPassGroupStackView _edgeStylesObscuredByTopMiddleOfPassStyle:](self, "_edgeStylesObscuredByTopMiddleOfPassStyle:", v15) | v10;
    v17 = -[PKPassGroupStackView _edgeStylesObscuredByTopCornersOfPassStyle:](self, "_edgeStylesObscuredByTopCornersOfPassStyle:", v15) | v11;
    if (v10 != v16 || v11 != v17)
    {
      objc_msgSend(v3, "addIndex:", v4);
      v11 = v17;
      v10 = v16;
    }
    if (!v4 || v11 == 94 && v10 == 94)
      break;

  }
LABEL_16:
  v19 = (void *)objc_msgSend(v3, "copy");

  return v19;
}

- (id)_separatorGroup
{
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;
  unint64_t separatorIndex;
  BOOL v4;
  id WeakRetained;
  void *v6;

  p_layoutState = &self->_layoutState;
  separatorIndex = self->_layoutState.groups.separatorIndex;
  if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL
    || (p_layoutState->groups.count ? (v4 = separatorIndex >= p_layoutState->groups.count - 1) : (v4 = 1), v4))
  {
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
    objc_msgSend(WeakRetained, "groupAtIndex:", p_layoutState->groups.separatorIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)_edgeStylesObscuredByTopMiddleOfPassStyle:(int64_t)a3
{
  uint64_t v3;

  v3 = PKPassFrontFaceEdgeStyle();
  if ((unint64_t)(v3 - 1) > 5)
    return 0;
  else
    return qword_19DF16578[v3 - 1];
}

- (unint64_t)_edgeStylesObscuredByTopCornersOfPassStyle:(int64_t)a3
{
  uint64_t v3;

  v3 = PKPassFrontFaceEdgeStyle();
  if ((unint64_t)(v3 - 1) > 5)
    return 0;
  else
    return qword_19DF165A8[v3 - 1];
}

- (void)_setScrollEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[PKPassGroupStackView isScrollEnabled](self, "isScrollEnabled") != a3)
  {
    if (v3)
      -[PKPassGroupStackView setScrollEnabled:](self, "setScrollEnabled:", 1);
    else
      -[PKPassGroupStackView _disableScrollingAndNormalizeContentOffset](self, "_disableScrollingAndNormalizeContentOffset");
  }
}

+ (id)backdropStartBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

- (void)_updateBackdropViewFilters
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PKBackdropView backdropLayer](self->_backdropView, "backdropLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v2, "setFilters:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v3, "setValue:forKey:", &unk_1E3FACAD0, CFSTR("inputRadius"));
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFilters:", v4);

    objc_msgSend(v2, "setScale:", 0.2);
  }

}

- (void)_presentGroupStackViewWithAnimation:(BOOL)a3 priorBounds:(CGRect)a4 completionHandler:(id)a5
{
  double y;
  double x;
  _BOOL8 v7;
  void (**v9)(_QWORD);
  uint64_t v10;
  id v11;
  NSMutableArray *passPileViews;
  void *v13;
  NSMutableArray *v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[5];
  BOOL v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);

  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[PKPassGroupView presentDiff:completion:](self->_modallyPresentedGroupView, "presentDiff:completion:", 0, 0);
  v10 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    if ((*((_WORD *)&self->_layoutState + 32) & 0x4000) != 0)
      v11 = -[PKPassGroupStackView _dismissModalGroupViewFromExternalToState:](self, "_dismissModalGroupViewFromExternalToState:", 4);
    passPileViews = self->_passPileViews;
    self->_passPileViews = 0;

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v13 = (void *)MEMORY[0x1E0CD28B0];
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke;
    v27[3] = &unk_1E3E61590;
    v28 = v9;
    objc_msgSend(v13, "setCompletionBlock:", v27);

  }
  else
  {
    v14 = self->_passPileViews;
    self->_passPileViews = 0;

  }
  self->_presentationState = 4;
  -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups");
  if (-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
  {
    v15 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", 0);
    if (objc_msgSend(v15, "presentationState") != 3)
    {
      objc_msgSend(v15, "setPresentationState:animated:", 3, v7);
      objc_msgSend(v15, "sizeToFit");
    }
  }
  else
  {
    v15 = 0;
  }
  -[PKPassGroupStackView _setModalGroupView:](self, "_setModalGroupView:", v15);
  if (-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
  {
    objc_msgSend(v15, "frontmostPassView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKPassGroupStackView _shouldRampForPass:](self, "_shouldRampForPass:", v17);

  }
  else
  {
    v18 = 0;
  }
  v19 = -[PKPassGroupStackView _rampBacklightIfNecessary:](self, "_rampBacklightIfNecessary:", v18);
  if (v7)
  {
    v20 = (void *)MEMORY[0x1A1AE621C](v19);
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke_2;
    v25[3] = &unk_1E3E6E668;
    v25[4] = self;
    v26 = v7;
    -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v25);
    objc_autoreleasePoolPop(v20);
    -[PKPassGroupStackView bounds](self, "bounds");
    -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", 1, x, y, v21, v22);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    -[PKPassGroupStackView bounds](self, "bounds");
    -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", 0, x, y, v23, v24);
  }
  -[PKPassGroupStackView _setScrollEnabled:](self, "_setScrollEnabled:", -[PKPassGroupStackView _shouldTablePresentationScroll](self, "_shouldTablePresentationScroll"));
  if (v9 && !v7)
    v9[2](v9);

}

- (void)setModalGroupIndex:(unint64_t)a3
{
  PKPassGroupView *v5;
  PKPassGroupView *modallyPresentedGroupView;
  PKPassGroupView *v7;
  PKPassGroupView *v8;
  PKPassGroupView *v9;

  if (self->_modalGroupIndex != a3)
  {
    self->_modalGroupIndex = a3;
    if (self->_layoutState.pilingMode == 1)
      self->_layoutState.pilingMode = 0;
  }
  v9 = self->_modallyPresentedGroupView;
  v5 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  self->_modallyPresentedGroupView = v5;

  v7 = v9;
  v8 = self->_modallyPresentedGroupView;
  if (v9 != v8)
  {
    if (v9)
    {
      -[PKPassGroupView setModallyPresented:](v9, "setModallyPresented:", 0);
      -[PKPassGroupStackView _removePanGestureRecognizerFromGroupView:](self, "_removePanGestureRecognizerFromGroupView:", v9);
      v7 = v9;
      v8 = self->_modallyPresentedGroupView;
    }
    if (v8)
    {
      -[PKPassGroupView setModallyPresented:](v8, "setModallyPresented:", 1);
      -[PKPassGroupStackView _updatePanGestureRecognizerForGroupView:](self, "_updatePanGestureRecognizerForGroupView:", self->_modallyPresentedGroupView);
      v7 = v9;
    }
  }

}

- (void)_removePanGestureRecognizerFromGroupView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "group");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupID");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_animatorsByGroupID, "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_animatorsByGroupID, "setObject:forKeyedSubscript:", 0, v6);
      -[PKPassGroupViewVerticalPanAnimator invalidate]((uint64_t)v5);
    }

  }
}

- (void)_addPanGestureRecognizerToGroupView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, __int128 *, double, double);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4 && !self->_invalidated)
  {
    objc_msgSend(v4, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_animatorsByGroupID, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handleModalGroupGesture_);
      v8 = -[PKPassGroupViewVerticalPanAnimator initWithGroupView:gestureRecognizer:]((id *)[PKPassGroupViewVerticalPanAnimator alloc], v5, v9);
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke;
      v14 = &unk_1E3E6E700;
      objc_copyWeak(&v15, &location);
      if (v8)
        objc_setProperty_nonatomic_copy(v8, v10, &v11, 80);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_animatorsByGroupID, "setObject:forKeyedSubscript:", v8, v7, v11, v12, v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
  }

}

- (void)_arrangeGroups
{
  PKPassthroughView *v3;
  PKPassthroughView *passContainerView;
  void *v5;
  void *v6;
  PKPassthroughView *v7;
  PKPassthroughView *v8;
  _QWORD v9[6];
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  ++self->_reorderActionTag;
  -[NSMutableArray removeAllObjects](self->_reorderActions, "removeAllObjects");
  v10 = 0;
  v11 = (id *)&v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__30;
  v14 = __Block_byref_object_dispose__30;
  v15 = 0;
  -[PKBackdropView superview](self->_backdropView, "superview");
  v3 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
  passContainerView = self->_passContainerView;

  if (v3 == passContainerView)
    -[PKPassthroughView bringSubviewToFront:](self->_passContainerView, "bringSubviewToFront:", self->_backdropView);
  -[PKPassGroupView pageControl](self->_modallyPresentedGroupView, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "superview");
    v7 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_passContainerView;

    if (v7 == v8)
    {
      -[PKPassthroughView sendSubviewToBack:](self->_passContainerView, "sendSubviewToBack:", v6);
      objc_storeStrong(v11 + 5, v6);
    }
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PKPassGroupStackView__arrangeGroups__block_invoke;
  v9[3] = &unk_1E3E6E5A0;
  v9[4] = self;
  v9[5] = &v10;
  -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v9);

  _Block_object_dispose(&v10, 8);
}

- (void)_executeCompletionHandlers:(id)a3 cancelled:(BOOL)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v4, "removeAllObjects");
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)_shouldTablePresentationScroll
{
  BOOL v3;
  id WeakRetained;
  void *v5;

  if (!-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation")
    || !self->_layoutState.groups.count && (*((_WORD *)&self->_layoutState + 32) & 6) != 0)
  {
    return 1;
  }
  if (!-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  objc_msgSend(WeakRetained, "groupAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "passCount") == 1;

  return v3;
}

- (void)_setModalGroupView:(id)a3
{
  -[PKPassGroupStackView setModalGroupIndex:](self, "setModalGroupIndex:", -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", a3));
}

- (void)_presentOffscreenAnimated:(BOOL)a3 split:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  int64_t v11;
  int64_t *p_presentationState;
  void *v13;
  void *v14;
  int64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (!v5)
    -[PKPassGroupStackView setModalGroupIndex:](self, "setModalGroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
  v9 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v10 = (void *)MEMORY[0x1E0CD28B0];
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E3E61590;
    v20 = v8;
    objc_msgSend(v10, "setCompletionBlock:", v19);

    v11 = 2;
    if (v5)
      v11 = 3;
    p_presentationState = &self->_presentationState;
    self->_presentationState = v11;
    v13 = (void *)MEMORY[0x1A1AE621C]();
    v14 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
  }
  else
  {
    v15 = 2;
    if (v5)
      v15 = 3;
    p_presentationState = &self->_presentationState;
    self->_presentationState = v15;
    v13 = (void *)MEMORY[0x1A1AE621C]();
    v14 = 0;
  }
  -[PKPassGroupStackView _setupSpringFactory:forPileAnimationToPresentationState:reverse:](self, "_setupSpringFactory:forPileAnimationToPresentationState:reverse:", v14, *p_presentationState, 1);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E3E6E5F0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v17);

  objc_autoreleasePoolPop(v13);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else if (v8)
  {
    v8[2](v8);
  }

}

void __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "endPinningFrontFaceContentMode", (_QWORD)v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 40), "_transitionSuccessful:", *(unsigned __int8 *)(a1 + 56));
}

- (void)_transitionSuccessful:(BOOL)a3
{
  _BOOL8 v3;
  void (**transitionCanceller)(void);
  id v6;

  v3 = a3;
  if ((self->_presentationState | 2) == 7)
    -[PKPassGroupStackView _presentModalGroupViewPostAnimationActions](self, "_presentModalGroupViewPostAnimationActions");
  transitionCanceller = (void (**)(void))self->_transitionCanceller;
  if (transitionCanceller)
  {
    transitionCanceller[2]();
    v6 = self->_transitionCanceller;
    self->_transitionCanceller = 0;

  }
  -[PKPassGroupStackView _executeCompletionHandlers:cancelled:](self, "_executeCompletionHandlers:cancelled:", self->_transitionCompletionHandlers, 0);
  -[PKPassGroupStackView _notifyDelegateOfStateChange:](self, "_notifyDelegateOfStateChange:", v3);
}

- (double)_setupSpringFactory:(id)a3 forPileAnimationToPresentationState:(int64_t)a4 reverse:(BOOL)a5
{
  double result;

  -[PKPassGroupStackView _setupSpringFactory:forPileAnimationFromPresentationState:toPresentationState:reverse:](self, "_setupSpringFactory:forPileAnimationFromPresentationState:toPresentationState:reverse:", a3, self->_priorState, a4, a5);
  return result;
}

- (double)_setupSpringFactory:(id)a3 forPileAnimationFromPresentationState:(int64_t)a4 toPresentationState:(int64_t)a5 reverse:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  double v10;
  int64_t priorState;
  double v12;

  v6 = a6;
  v9 = a3;
  v10 = 0.0;
  if (self->_staggerPileAnimations)
  {
    priorState = self->_priorState;
    if (a5 == 3)
    {
      if (priorState != 5)
        goto LABEL_8;
    }
    else if (a5 != 5 || priorState != 3)
    {
      goto LABEL_8;
    }
    -[PKPassGroupStackView _setupSpringFactoryForPileAnimations:withMaximumAcceleration:reverse:](self, "_setupSpringFactoryForPileAnimations:withMaximumAcceleration:reverse:", v9, v6, 0.005);
    v10 = v12;
  }
LABEL_8:

  return v10;
}

- (void)_notifyDelegateOfStateChange:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PKPassGroupStackView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "groupStackView:didTransitionToState:animated:", self, self->_presentationState, v3);

}

- (void)_cancelTransition
{
  void (**transitionCanceller)(id, SEL);
  id v4;

  transitionCanceller = (void (**)(id, SEL))self->_transitionCanceller;
  if (transitionCanceller)
  {
    transitionCanceller[2](transitionCanceller, a2);
    v4 = self->_transitionCanceller;
    self->_transitionCanceller = 0;

    -[PKPassGroupStackView _executeCompletionHandlers:cancelled:](self, "_executeCompletionHandlers:cancelled:", self->_transitionCompletionHandlers, 1);
  }
}

uint64_t __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_updateGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[PKPassGroupStackView _updateGroupView:toPresentationState:withSpringFactory:atIndex:](self, "_updateGroupView:toPresentationState:withSpringFactory:atIndex:", v9, a4, v8, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v9));

}

- (void)_updateGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5 atIndex:(unint64_t)a6
{
  PKPassGroupView *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  float v28;
  double v29;
  void *v30;
  id v31;
  double v32;
  CATransform3D v33;
  CATransform3D a;
  CATransform3D v35[2];

  v10 = (PKPassGroupView *)a3;
  v11 = a5;
  if (self->_loanedGroupView != v10 || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v10, a6, a4);
    v13 = v12;
    v15 = v14;
    memset(&v35[1], 0, sizeof(CATransform3D));
    -[PKPassGroupStackView _transformForGroupView:atIndex:forState:](self, "_transformForGroupView:atIndex:forState:", v10, a6, a4);
    -[PKPassGroupStackView _opacityForGroupAtIndex:withGroupView:forState:](self, "_opacityForGroupAtIndex:withGroupView:forState:", a6, v10, a4);
    v17 = v16;
    -[PKPassGroupView layer](v10, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v11)
    {
      objc_msgSend(v18, "position");
      v22 = v21;
      v23 = v20;
      if (v21 != v13 || v20 != v15)
      {
        objc_msgSend(v11, "highFrameRateSpringAnimationForView:withKeyPath:reason:", v10, CFSTR("position"), 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v22, v23, v13, v15);
        v25 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v24);

      }
      memset(v35, 0, 128);
      if (v19)
        objc_msgSend(v19, "transform");
      a = v35[0];
      v33 = v35[1];
      if (!CATransform3DEqualToTransform(&a, &v33))
      {
        objc_msgSend(v11, "highFrameRateSpringAnimationForView:withKeyPath:reason:", v10, CFSTR("transform"), 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        a = v35[0];
        v33 = v35[1];
        objc_msgSend(v26, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v33);
        v27 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v26);

      }
      objc_msgSend(v19, "opacity");
      v29 = v28;
      if (v17 != v28)
      {
        objc_msgSend(v11, "springAnimationForView:withKeyPath:", v10, CFSTR("opacity"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v29, v17);
        v31 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v30);

      }
    }
    objc_msgSend(v19, "setPosition:", v13, v15);
    v35[0] = v35[1];
    objc_msgSend(v19, "setTransform:", v35);
    *(float *)&v32 = v17;
    objc_msgSend(v19, "setOpacity:", v32);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *bottomContentSeparatorVisibilityTimer;
  OS_dispatch_source *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_wantsBacklightRamping)
  {
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endRequestingBacklightRamping:", self);

  }
  if (self->_transitionCanceller)
    -[PKPassGroupStackView _cancelTransition](self, "_cancelTransition");
  if (self->_hasSuspendedTransition)
    -[PKPassGroupStackView _cancelSuspendedTransition](self, "_cancelSuspendedTransition");
  -[NSMutableArray removeAllObjects](self->_reorderActions, "removeAllObjects");
  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  -[PKPassGroupStackView _executeCompletionHandlers:cancelled:](self, "_executeCompletionHandlers:cancelled:", self->_transitionCompletionHandlers, 1);
  bottomContentSeparatorVisibilityTimer = self->_bottomContentSeparatorVisibilityTimer;
  if (bottomContentSeparatorVisibilityTimer)
  {
    dispatch_source_cancel(bottomContentSeparatorVisibilityTimer);
    v6 = self->_bottomContentSeparatorVisibilityTimer;
    self->_bottomContentSeparatorVisibilityTimer = 0;

  }
  if (!self->_invalidated)
    -[PKPassGroupStackView invalidate](self, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)PKPassGroupStackView;
  -[PKPassGroupStackView dealloc](&v7, sel_dealloc);
}

double __69__PKPassGroupStackView__updateTopContentSeparatorVisibilityAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CATransform3D v14;
  CGAffineTransform v15;

  v3 = a2;
  objc_msgSend(v3, "anchorPoint");
  v5 = v4;
  objc_msgSend(v3, "position");
  v7 = v6;
  objc_msgSend(v3, "bounds");
  v9 = v8;
  v11 = v10;
  memset(&v15, 0, sizeof(v15));
  if (v3)
    objc_msgSend(v3, "transform");
  else
    memset(&v14, 0, sizeof(v14));
  CATransform3DGetAffineTransform(&v15, &v14);
  v12 = 1.0
      - fmin((fmax(v7 - v5 * (v11 * v15.d + v15.b * v9), *(double *)(a1 + 40)) - *(double *)(a1 + 40))/ *(double *)(a1 + 56), 1.0);

  return v12;
}

void __72__PKPassGroupStackView__updateBottomContentSeparatorVisibilityAnimated___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject **v7;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[276];
    v7 = v3;
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v7[276];
      v7[276] = 0;

      v3 = v7;
    }
    objc_msgSend(v3, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupStackView:wantsBottomContentSeparatorWithVisibility:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *((double *)v7 + 275));

    v3 = v7;
  }

}

- (void)setPresentationState:(int64_t)a3
{
  -[PKPassGroupStackView setPresentationState:withContext:animated:completion:](self, "setPresentationState:withContext:animated:completion:", a3, 0, 0, 0);
}

uint64_t __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __77__PKPassGroupStackView_setPresentationState_withContext_animated_completion___block_invoke_4(uint64_t result, void *a2)
{
  if (*(void **)(*(_QWORD *)(result + 32) + 2624) != a2)
    return objc_msgSend(a2, "updatePageControlFrameAnimated:", 1);
  return result;
}

- (void)stageGroupInPresentationState:(int64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  char v10;

  v7 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
  if (a4 >= v7 && a4 - v7 < v8)
  {
    v10 = 0;
    v9 = -[PKPassGroupStackView _loadGroupViewAtIndex:forState:presentationState:cached:](self, "_loadGroupViewAtIndex:forState:presentationState:cached:", a4, a3, 1, &v10);
    -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups");
  }
}

- (PKPass)modalGroupFrontmostPass
{
  id v3;
  void *v4;
  void *v5;

  if (-[PKPassGroupStackView isPresentingPassViewFront](self, "isPresentingPassViewFront"))
  {
    v3 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", self->_modalGroupIndex);
    objc_msgSend(v3, "frontmostPassView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (PKPass *)v5;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PKPassGroupStackView updateHeaderAndSubheaderViewsIfNecessary](self, "updateHeaderAndSubheaderViewsIfNecessary");
  -[NSMutableDictionary allKeys](self->_groupViewsByGroupID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_layoutState.groups.count)
  {
    v5 = -[PKPassGroupStackView _lastIndex](self, "_lastIndex");
    v6 = (void *)MEMORY[0x1E0CB3788];
    v7 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
    objc_msgSend(v6, "indexSetWithIndexesInRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndex:", v5);
    if (self->_modallyPresentedGroupView)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
      -[PKPassGroupView group](self->_modallyPresentedGroupView, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(WeakRetained, "indexOfGroup:", v11);

      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v9, "addIndex:", v12);
    }
    v13 = objc_loadWeakRetained((id *)&self->_datasource);
    objc_msgSend(v13, "groupAtIndex:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_loadWeakRetained((id *)&self->_datasource);
      v16 = objc_msgSend(v15, "indexOfGroup:", v14);

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v9, "addIndex:", v16);
    }
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __34__PKPassGroupStackView_reloadData__block_invoke;
    v27[3] = &unk_1E3E6E480;
    v27[4] = self;
    v28 = v14;
    v29 = v4;
    v17 = v14;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v27);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v4;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[PKPassGroupStackView _removeGroupViewAsSubviewWithGroupID:](self, "_removeGroupViewAsSubviewWithGroupID:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v20);
  }

  if (self->_modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL && (self->_presentationState | 2) == 7)
  {
    -[PKPassGroupStackView setPresentationState:](self, "setPresentationState:", 4);
  }
  else
  {
    -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups", (_QWORD)v23);
    -[PKPassGroupStackView _updateContentSize](self, "_updateContentSize");
  }

}

void __34__PKPassGroupStackView_reloadData__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 2704));
  objc_msgSend(WeakRetained, "groupAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(v5, "passAtIndex:", objc_msgSend(v5, "frontmostPassIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == *(void **)(a1 + 40))
  {
    objc_msgSend(v6, "loadImageSetSync:preheat:", 0, 1);
  }
  else
  {
    objc_msgSend(v6, "loadImageSetSync:preheat:", 2, 0);
    objc_msgSend(v7, "loadContentSync");
  }
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "_loadGroupViewAtIndex:forState:presentationState:cached:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2112), 1, &v11);
  v9 = *(void **)(a1 + 48);
  objc_msgSend(v5, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v10);

}

- (void)deleteGroup:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableDictionary *groupViewsByGroupID;
  id v7;
  void *v8;
  PKPassGroupView *v9;
  PKPassGroupView *modallyPresentedGroupView;
  BOOL v11;
  NSObject *v12;
  PKPassFooterView *passFooterView;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  PKPassGroupStackView *v20;
  __int16 v21;
  PKPassFooterView *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  groupViewsByGroupID = self->_groupViewsByGroupID;
  v7 = a3;
  objc_msgSend(v7, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](groupViewsByGroupID, "objectForKey:", v8);
  v9 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();

  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
    v11 = modallyPresentedGroupView == v9;
  else
    v11 = 0;
  if (v11)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      passFooterView = self->_passFooterView;
      v19 = 134349312;
      v20 = self;
      v21 = 2050;
      v22 = passFooterView;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p): suppressing PKPassFooterView %{public}p - group deleted.", (uint8_t *)&v19, 0x16u);
    }

    -[PKPassGroupStackView _updatePassFooterViewWithConfiguration:context:animated:reload:delay:](self, "_updatePassFooterViewWithConfiguration:context:animated:reload:delay:", 0, 0, 1, 0, 0.0);
  }
  -[PKPassGroupView markGroupDeleted](v9, "markGroupDeleted");
  -[PKPassGroupView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
  if (a4)
  {
    v14 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a4 - 1);
    objc_msgSend(v14, "frontmostPassView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "frontFaceBodyContentCreated"))
      v16 = objc_msgSend(v15, "contentMode");
    else
      v16 = 3;
    objc_msgSend(v15, "setContentMode:", v16);

  }
  -[UIView addDefaultTransformSpringWithStartTime:](v9, "addDefaultTransformSpringWithStartTime:", CACurrentMediaTime());
  -[PKPassGroupView layer](v9, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v9, a4, 1);
  objc_msgSend(v17, "setPosition:");

  objc_msgSend(v7, "groupID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassGroupStackView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__removeGroupViewAsSubviewWithGroupID_, v18, 1.0);
  -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", self->_presentationState, 1);

}

- (void)moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  dispatch_time_t v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  PKPassGroupStackView *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  CGRect v35;

  v8 = a3;
  if (self->_presentationState == 4)
  {
    -[PKPassGroupStackView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    -[PKPassGroupStackView contentOffset](self, "contentOffset");
    -[PKPassGroupStackView setContentOffset:animated:](self, "setContentOffset:animated:", 0);
    ++self->_userInteractionCounter;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
    v10 = (void *)MEMORY[0x1A1AE621C]();
    v11 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke;
    v32[3] = &unk_1E3E6E4A8;
    v32[4] = self;
    v33 = v8;
    v12 = v9;
    v34 = v12;
    -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v32);

    objc_autoreleasePoolPop(v10);
    v13 = -[PKPassGroupStackView _createStackedIndices](self, "_createStackedIndices");
    v15 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
    v16 = v14;
    if (a4 >= v15 && a4 - v15 < v14 || objc_msgSend(v13, "containsIndex:", a4))
    {
      v17 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a5);
      if (v17)
      {
        if ((*((_BYTE *)&self->_layoutState.groups + 16) & 2) != 0 && self->_layoutState.groups.separatorIndex >= a5)
        {
          -[PKPassGroupStackView _maxYOfPassFrontFaceAtIndex:](self, "_maxYOfPassFrontFaceAtIndex:");
          v19 = v18;
          -[PKPassGroupStackView bounds](self, "bounds");
          fmin(v19, CGRectGetMaxY(v35));
        }
        else
        {
          -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", a5, 1);
        }
        -[PKPassGroupStackView _updateTransformForGroupView:toPresentationState:withSpringFactory:](self, "_updateTransformForGroupView:toPresentationState:withSpringFactory:", v17, 1, v12);
        -[PKPassGroupStackView _xPositionForGroupView:forState:](self, "_xPositionForGroupView:forState:", v17, 1);
        -[PKPassGroupStackView _updatePositionForGroupView:toPosition:withSpringFactory:](self, "_updatePositionForGroupView:toPosition:withSpringFactory:", v17, v12);
        objc_msgSend(v17, "group");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "groupID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          -[NSMutableDictionary setObject:forKey:](self->_groupViewsInFlightByGroupID, "setObject:forKey:", v17, v21);
        if (a5)
        {
          v22 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a5 - 1);
          objc_msgSend(v22, "frontmostPassView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setContentMode:", 3);

        }
      }

    }
    else if (a5 >= v15 && a5 - v15 < v16)
    {
      -[PKPassGroupStackView stageGroupInPresentationState:atIndex:](self, "stageGroupInPresentationState:atIndex:", 1, a5);
    }
    v24 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a5);
    v25 = dispatch_time(0, 250000000);
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke_2;
    v28[3] = &unk_1E3E61400;
    v29 = v24;
    v30 = self;
    v31 = v12;
    v26 = v12;
    v27 = v24;
    dispatch_after(v25, MEMORY[0x1E0C80D38], v28);

  }
}

void __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 2504);
  objc_msgSend(v3, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    v7 = *(void **)(a1 + 40);

    if (v3 != v7)
      objc_msgSend(*(id *)(a1 + 32), "_updateGroupView:toPresentationState:withSpringFactory:", v8, 4, *(_QWORD *)(a1 + 48));
  }

}

void __52__PKPassGroupStackView_moveGroup_fromIndex_toIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  _BOOL8 v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupID");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 2112) == 4)
  {
    v4 = objc_msgSend((id)v3, "_indexOfGroupView:", *(_QWORD *)(a1 + 32));
    v5 = objc_msgSend(*(id *)(a1 + 40), "_rangeOfVisibleIndexes");
    v7 = v6;
    v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "_createStackedIndices");
    v9 = v8;
    v10 = v4 < v5 || v4 - v5 >= v7;
    if (v10 && !objc_msgSend(v8, "containsIndex:", v4))
    {
      objc_msgSend(*(id *)(a1 + 40), "_removeGroupViewAsSubviewWithGroupID:", v13);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_arrangeGroups");
      v11 = *(void **)(a1 + 32);
      if (v11)
      {
        objc_msgSend(v11, "applyContentModesAnimated:", 0);
        objc_msgSend(*(id *)(a1 + 40), "_updateGroupStateForGroupViewInStackPresentation:animated:", *(_QWORD *)(a1 + 32), 1);
        objc_msgSend(*(id *)(a1 + 40), "_updateGroupView:toPresentationState:withSpringFactory:", *(_QWORD *)(a1 + 32), 4, *(_QWORD *)(a1 + 48));
      }
    }

    v3 = *(_QWORD *)(a1 + 40);
  }
  if (v13)
  {
    objc_msgSend(*(id *)(v3 + 2504), "removeObjectForKey:", v13);
    v3 = *(_QWORD *)(a1 + 40);
  }
  v12 = (*(_DWORD *)(v3 + 2512))-- == 1;
  objc_msgSend((id)v3, "setUserInteractionEnabled:", v12);

}

- (void)presentPassWithUniqueID:(id)a3
{
  -[PKPassGroupStackView presentPassWithUniqueID:withContext:animated:](self, "presentPassWithUniqueID:withContext:animated:", a3, 0, 1);
}

- (void)presentPassWithUniqueID:(id)a3 withContext:(id)a4 animated:(BOOL)a5
{
  -[PKPassGroupView presentPassWithUniqueID:withContext:animated:](self->_modallyPresentedGroupView, "presentPassWithUniqueID:withContext:animated:", a3, a4, a5);
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
  -[PKPassGroupView presentDiff:completion:](self->_modallyPresentedGroupView, "presentDiff:completion:", a3, a4);
}

- (void)setTableModalPresentationEnabled:(BOOL)a3 animated:(BOOL)a4
{
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;
  _BOOL8 v5;
  _BOOL4 v6;
  __int16 v8;
  PKPassGroupStackView *v9;
  uint64_t v10;

  p_layoutState = &self->_layoutState;
  if (self->_layoutState.groups.count
    && (v5 = a4, v6 = a3, -[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation")))
  {
    v8 = *((_WORD *)p_layoutState + 32);
    if (v6)
    {
      *((_WORD *)p_layoutState + 32) = v8 & 0xFFFE;
      if ((self->_presentationState | 2) == 7)
      {
        -[PKPassGroupStackView setModalGroupIndex:](self, "setModalGroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
        v9 = self;
        v10 = 4;
LABEL_10:
        -[PKPassGroupStackView setPresentationState:animated:](v9, "setPresentationState:animated:", v10, v5);
      }
    }
    else
    {
      *((_WORD *)p_layoutState + 32) = v8 | 1;
      if (self->_presentationState == 4)
      {
        -[PKPassGroupStackView setModalGroupIndex:](self, "setModalGroupIndex:", 0);
        v9 = self;
        v10 = 5;
        goto LABEL_10;
      }
    }
  }
  else
  {
    *((_WORD *)p_layoutState + 32) &= ~1u;
  }
}

- (id)headerForPassType:(unint64_t)a3
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  -[PKPassGroupStackView _headerContextForPassType:](self, "_headerContextForPassType:", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v3 = (_QWORD *)v3[5];
  v5 = v3;

  return v5;
}

- (void)setFooterSuppressed:(BOOL)a3
{
  -[PKPassGroupStackView setFooterSuppressed:withContext:](self, "setFooterSuppressed:withContext:", a3, 0);
}

- (int64_t)pilingMode
{
  return self->_layoutState.pilingMode;
}

- (void)setPilingMode:(int64_t)a3
{
  $B585109F6414F8074A2AA9417DEEF571 *p_layoutState;

  p_layoutState = &self->_layoutState;
  if (self->_layoutState.pilingMode != a3)
  {
    self->_layoutState.pilingMode = a3;
    *((_WORD *)&self->_layoutState + 32) |= 0x2000u;
    -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self, "layoutContentForCurrentPresentationState:", 1);
    *((_WORD *)p_layoutState + 32) &= ~0x2000u;
  }
}

- (double)pileHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSNumber *featuredGroupID;
  PKPassGroupView *modallyPresentedGroupView;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;

  -[PKPassGroupStackView _pileAscenderHeight](self, "_pileAscenderHeight");
  v4 = v3;
  -[PKPassGroupStackView _pileBaseHeight](self, "_pileBaseHeight");
  v6 = v4 + v5;
  featuredGroupID = self->_featuredGroupID;
  if (featuredGroupID)
  {
    modallyPresentedGroupView = self->_modallyPresentedGroupView;
    if (modallyPresentedGroupView)
    {
      -[PKPassGroupView group](modallyPresentedGroupView, "group");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "groupID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSNumber isEqual:](featuredGroupID, "isEqual:", v10);

      if ((v11 & 1) == 0)
      {
        -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pass");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "style");

        if (v14 == 6)
        {
          -[PKPassGroupStackView _pileSeparationHeight](self, "_pileSeparationHeight");
          return v6 - v15 + 44.0;
        }
      }
    }
  }
  return v6;
}

- (BOOL)isModallyPresentedPassAuthorized
{
  return -[PKPassFooterView isPassAuthorized](self->_passFooterView, "isPassAuthorized");
}

- (BOOL)isReordering
{
  return *(_BYTE *)&self->_reorderingFlags & 1;
}

- (BOOL)isViewCurrentlyPresentedFooterView:(id)a3
{
  return -[PKPassFooterView isViewCurrentContentView:](self->_passFooterView, "isViewCurrentContentView:", a3);
}

- (void)updateFooterViewIfNecessary
{
  UIView *footerView;
  PKGroupsController *groupsController;
  UIView *v5;
  uint64_t v6;

  footerView = self->_footerView;
  if (footerView)
  {
    groupsController = self->_groupsController;
    v5 = footerView;
    v6 = -[PKGroupsController expiredSectionPassesCount](groupsController, "expiredSectionPassesCount");
    -[UIView setExpiredSectionCount:](v5, "setExpiredSectionCount:", v6);

    if (!v6)
      -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", self->_presentationState, 1);
  }
}

- (void)invalidate
{
  NSObject *v3;
  PKPassFooterView *passFooterView;
  PKPassFooterView *v5;
  PKPassFooterView *v6;
  int v7;
  PKPassGroupStackView *v8;
  __int16 v9;
  PKPassFooterView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      passFooterView = self->_passFooterView;
      v7 = 134349312;
      v8 = self;
      v9 = 2050;
      v10 = passFooterView;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p:%{public}p): invalidated.", (uint8_t *)&v7, 0x16u);
    }

    self->_invalidated = 1;
    v5 = self->_passFooterView;
    if (v5)
    {
      -[PKPassFooterView setDelegate:](v5, "setDelegate:", 0);
      -[PKPassFooterView invalidate](self->_passFooterView, "invalidate");
      -[PKPassFooterView removeFromSuperview](self->_passFooterView, "removeFromSuperview");
      v6 = self->_passFooterView;
      self->_passFooterView = 0;

    }
    if (-[NSMutableDictionary count](self->_groupViewsByGroupID, "count"))
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_groupViewsByGroupID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_73);
    if (-[NSMutableDictionary count](self->_animatorsByGroupID, "count"))
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_animatorsByGroupID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_75_0);
  }
}

uint64_t __34__PKPassGroupStackView_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

void __34__PKPassGroupStackView_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[PKPassGroupViewVerticalPanAnimator invalidate](a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[PKPassGroupStackView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassGroupStackView;
    -[PKPassGroupStackView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_loadModalGroupViewAndPresentOffscreenIfNotCached:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  int64_t presentationState;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  objc_msgSend(WeakRetained, "groupAtIndex:", self->_modalGroupIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[PKPassGroupStackView _groupViewWithGroup:](self, "_groupViewWithGroup:", v6);
    if (!v7)
    {
      v9 = 0;
      if (a3)
        presentationState = 2;
      else
        presentationState = self->_presentationState;
      -[PKPassGroupStackView _loadGroupViewAtIndex:forState:presentationState:cached:](self, "_loadGroupViewAtIndex:forState:presentationState:cached:", self->_modalGroupIndex, presentationState, 1, &v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "applyContentModesAnimated:", 0);

  }
}

void __56__PKPassGroupStackView__addGroupViewAsSubview_forIndex___block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  void *v6;
  void *v7;
  unint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1[4] + 2584);

  if (v6 == v7)
  {
    v8 = a1[7];
    if (v8 > a3)
    {
      v9 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
LABEL_4:
      objc_storeStrong(v9, a2);
      goto LABEL_7;
    }
    if (v8 < a3)
    {
      v10 = *(_QWORD *)(a1[6] + 8);
      v11 = *(_QWORD *)(v10 + 40);
      v9 = (id *)(v10 + 40);
      if (!v11)
        goto LABEL_4;
    }
  }
LABEL_7:

}

- (void)_removeGroupViewAsSubviewWithGroupID:(id)a3
{
  id v4;
  PKPassGroupView *v5;
  PKPassGroupView *modallyPresentedGroupView;
  BOOL v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupViewsByGroupID, "objectForKeyedSubscript:", v4);
    v5 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      modallyPresentedGroupView = self->_modallyPresentedGroupView;
      -[PKPassGroupStackView _removePanGestureRecognizerFromGroupView:](self, "_removePanGestureRecognizerFromGroupView:", v5);
      -[PKPassGroupView removeFromSuperview](v5, "removeFromSuperview");
      -[NSMutableDictionary removeObjectForKey:](self->_groupViewsByGroupID, "removeObjectForKey:", v8);
      if (modallyPresentedGroupView)
        v7 = v5 == modallyPresentedGroupView;
      else
        v7 = 0;
      if (v7)
        -[PKPassGroupStackView setModalGroupIndex:](self, "setModalGroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }

    v4 = v8;
  }

}

- (void)_generateModalGroupPileWithVisibleIndexes:(_NSRange)a3 reservePlaceForModalGroup:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  NSUInteger location;
  NSMutableArray *v8;
  NSMutableArray *passPileViews;
  PKPassGroupView *v10;
  PKPassGroupView *v11;
  NSMutableArray *v12;
  PKPassGroupView *v13;
  id WeakRetained;
  char v15;
  void *v16;
  void *v17;
  NSNumber *v18;
  NSNumber *featuredGroupID;
  PKPassGroupView *v20;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  passPileViews = self->_passPileViews;
  self->_passPileViews = v8;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();
  if (location < location + length)
  {
    while (-[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", location))
    {
LABEL_10:
      ++location;
      if (!--length)
        goto LABEL_11;
    }
    v10 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", location);
    v11 = v10;
    if (!v10 || v10 == self->_modallyPresentedGroupView)
    {
      if (!v4)
      {
LABEL_9:

        goto LABEL_10;
      }
      v12 = self->_passPileViews;
      v13 = v20;
    }
    else
    {
      v12 = self->_passPileViews;
      v13 = v11;
    }
    -[NSMutableArray insertObject:atIndex:](v12, "insertObject:atIndex:", v13, 0);
    goto LABEL_9;
  }
LABEL_11:
  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)&self->_datasource);
    objc_msgSend(v16, "featuredGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "groupID");
    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    featuredGroupID = self->_featuredGroupID;
    self->_featuredGroupID = v18;

  }
  else
  {
    v16 = self->_featuredGroupID;
    self->_featuredGroupID = 0;
  }

}

uint64_t __78__PKPassGroupStackView__presentOffscreenAnimated_split_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentModalGroupView:(id)a3 withState:(int64_t)a4 animated:(BOOL)a5 context:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSMutableArray *passPileViews;
  id WeakRetained;
  uint64_t v16;
  uint64_t v17;
  PKPassGroupView *modallyPresentedGroupView;
  id v19;
  PKPassGroupView **p_loanedGroupView;
  BOOL v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  PKPassPresentationContext *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  PKNavigationDashboardPassViewController *v36;
  PKNavigationDashboardPassViewController *v37;
  void *v38;
  unsigned int externalPresentationTag;
  uint64_t v40;
  void (**v41)(void *, void *);
  void *v42;
  void *v43;
  void *v44;
  PKPGSVTransitionInterstitialController *interstitialController;
  PKPGSVTransitionInterstitialController *v46;
  PKPGSVTransitionInterstitialController *v47;
  PKPGSVTransitionInterstitialController *v48;
  PKPassGroupView *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  float v55;
  float v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  float v62;
  double v63;
  uint64_t v67;
  id v68;
  dispatch_time_t v69;
  id v70;
  __objc2_class *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  void (**v75)(void *, void *);
  id v76;
  void *v77;
  void *v78;
  _QWORD block[4];
  id v80;
  _QWORD v81[4];
  id v82;
  unsigned int v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD aBlock[6];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  id location;
  _QWORD v102[5];
  PKPassPresentationContext *v103;
  id v104;
  id v105;
  int64_t v106;
  BOOL v107;
  BOOL v108;
  BOOL v109;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  v76 = a7;
  -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");
  -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups");
  self->_presentationState = a4;
  v77 = v12;
  -[PKPassGroupStackView _setModalGroupView:](self, "_setModalGroupView:", v12);
  if (a4 == 7)
  {
    passPileViews = self->_passPileViews;
    self->_passPileViews = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
    objc_msgSend(WeakRetained, "beginPinningExternalPresentationNavigationHeight");

  }
  else
  {
    v16 = -[PKPassGroupStackView _rangeOfVisibleIndexesIgnoringBottomInset:](self, "_rangeOfVisibleIndexesIgnoringBottomInset:", 1);
    -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v16, v17, 0);
  }
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView
    && -[PKPassGroupView presentationState](modallyPresentedGroupView, "presentationState") != 3
    && (*((_WORD *)&self->_layoutState + 32) & 0x400) == 0)
  {
    -[PKPassGroupView setPresentationState:withContext:animated:](self->_modallyPresentedGroupView, "setPresentationState:withContext:animated:", 3, v13, v9);
    -[PKPassGroupView sizeToFit](self->_modallyPresentedGroupView, "sizeToFit");
  }
  v19 = 0;
  p_loanedGroupView = &self->_loanedGroupView;
  v21 = self->_loanedGroupView != self->_modallyPresentedGroupView;
  if (a4 == 7 && v9)
    v19 = -[PKPassGroupStackView _createFactoryForExternalPresentation](self, "_createFactoryForExternalPresentation");
  if (v9)
    v22 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
  else
    v22 = 0;
  v23 = (void *)MEMORY[0x1A1AE621C]();
  if (a4 == 7)
  {
    -[PKPassGroupStackView _setupSpringFactoryForTableToExternalAnimations:](self, "_setupSpringFactoryForTableToExternalAnimations:", v22);
  }
  else if ((*((__int16 *)&self->_layoutState + 32) & 0x80000000) == 0)
  {
    -[PKPassGroupStackView _setupSpringFactory:forPileAnimationToPresentationState:reverse:](self, "_setupSpringFactory:forPileAnimationToPresentationState:reverse:", v22, 5, 0);
    v25 = v24;
    goto LABEL_19;
  }
  v25 = 0.0;
LABEL_19:
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke;
  v102[3] = &unk_1E3E6E618;
  v102[4] = self;
  v106 = a4;
  v107 = v9;
  v26 = (PKPassPresentationContext *)v13;
  v103 = v26;
  v108 = a4 == 7;
  v109 = v21;
  v27 = v19;
  v104 = v27;
  v28 = v22;
  v105 = v28;
  -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v102);

  objc_autoreleasePoolPop(v23);
  objc_msgSend(v27, "setAnimationDelayHandler:", 0);
  objc_msgSend(v27, "duration");
  v30 = v29;
  objc_msgSend(v28, "duration");
  v32 = v25 + fmax(v30, v31);
  -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "updateValidityDisplay");
  -[PKPassGroupView layer](self->_modallyPresentedGroupView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pkui_remainingDurationForAnimationWithKey:", CFSTR("modalPanGestureRecovery"));
  v35 = v34;

  if (v32 > v35)
    v35 = v32;
  v36 = (PKNavigationDashboardPassViewController *)objc_loadWeakRetained((id *)&self->_externalVC);
  v37 = v36;
  if (a4 != 7 || v36)
  {
    v40 = MEMORY[0x1E0C809B0];
    if (a4 != 7)
      goto LABEL_68;
    goto LABEL_67;
  }
  -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
    v26 = objc_alloc_init(PKPassPresentationContext);
  v37 = -[PKNavigationDashboardPassViewController initWithPassGroupView:groupsController:groupViewReceiver:context:]([PKNavigationDashboardPassViewController alloc], "initWithPassGroupView:groupsController:groupViewReceiver:context:", self->_modallyPresentedGroupView, self->_groupsController, self, v26);
  -[PKNavigationDashboardPassViewController setPassDashboardDelegate:](v37, "setPassDashboardDelegate:", self);
  objc_storeWeak((id *)&self->_externalVC, v37);
  -[PKPassGroupView setLoaned:](*p_loanedGroupView, "setLoaned:", 0);
  if (v38 && v37)
  {
    externalPresentationTag = self->_externalPresentationTag;
    objc_storeStrong((id *)&self->_loanedGroupView, self->_modallyPresentedGroupView);
    -[PKPassGroupView setLoaned:](*p_loanedGroupView, "setLoaned:", 1);
    -[PKPassGroupStackView reloadSuppressedContentForGroupView:](self, "reloadSuppressedContentForGroupView:", *p_loanedGroupView);
    if (v9)
    {
      objc_initWeak(&location, self);
      v95 = 0;
      v96 = &v95;
      v97 = 0x3032000000;
      v98 = __Block_byref_object_copy__30;
      v99 = __Block_byref_object_dispose__30;
      v100 = 0;
      v89 = 0;
      v90 = &v89;
      v91 = 0x3032000000;
      v92 = __Block_byref_object_copy__30;
      v93 = __Block_byref_object_dispose__30;
      v94 = 0;
      v40 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_2;
      aBlock[3] = &unk_1E3E6E640;
      aBlock[4] = &v89;
      aBlock[5] = &v95;
      v41 = (void (**)(void *, void *))_Block_copy(aBlock);
      -[PKPassGroupStackView headerForPassType:](self, "headerForPassType:", 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2](v41, v42);
      v75 = v41;

      if (!v90[5])
      {
        -[PKPassGroupStackView headerForPassType:](self, "headerForPassType:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2](v41, v43);

      }
      objc_msgSend((id)v96[5], "superview");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      interstitialController = self->_interstitialController;
      v74 = externalPresentationTag;
      if (!interstitialController)
        goto LABEL_41;
      if (-[PKPGSVTransitionInterstitialController isInvalidated](interstitialController, "isInvalidated"))
      {
        v46 = self->_interstitialController;
        self->_interstitialController = 0;

      }
      v47 = self->_interstitialController;
      if (v47)
      {
        v48 = v47;
        if (v44)
        {
          v86[0] = v40;
          v86[1] = 3221225472;
          v86[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_3;
          v86[3] = &unk_1E3E68738;
          objc_copyWeak(&v87, &location);
          -[PKPGSVTransitionInterstitialController transferToView:withDeactivationHandler:](v48, "transferToView:withDeactivationHandler:", v44, v86);
          objc_destroyWeak(&v87);
        }
      }
      else
      {
LABEL_41:
        v48 = 0;
        if (!v90[5] || !v44)
          goto LABEL_63;
        v73 = v44;
        objc_msgSend(v44, "layer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "presentationLayer");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = (void *)v51;
        if (v51)
          v53 = (void *)v51;
        else
          v53 = v50;
        v54 = v53;

        v72 = v54;
        objc_msgSend(v54, "opacity");
        v56 = v55;
        objc_msgSend((id)v96[5], "layer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "presentationLayer");
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v58;
        if (v58)
          v60 = (void *)v58;
        else
          v60 = v57;
        v61 = v60;

        objc_msgSend(v61, "opacity");
        v63 = v56 * v62;

        v48 = 0;
        if ((*(uint64_t *)&v63 <= -1 || ((*(_QWORD *)&v63 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
          && (unint64_t)(*(_QWORD *)&v63 - 1) >= 0xFFFFFFFFFFFFFLL
          && (*(_QWORD *)&v63 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        {
          v44 = v73;
LABEL_63:
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[PKNavigationDashboardPassViewController setTransitionDuration:](v37, "setTransitionDuration:", v35);
          v81[0] = v40;
          v81[1] = 3221225472;
          v81[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_5;
          v81[3] = &unk_1E3E69140;
          objc_copyWeak(&v82, &location);
          v83 = v74;
          objc_msgSend(v38, "presentViewController:animated:completion:", v37, 1, v81);
          objc_destroyWeak(&v82);

          _Block_object_dispose(&v89, 8);
          _Block_object_dispose(&v95, 8);

          objc_destroyWeak(&location);
          goto LABEL_66;
        }
        v44 = v73;
        if (v63 > 1.0)
          goto LABEL_63;
        v71 = PKPGSVTransitionInterstitialController;
        v67 = v90[5];
        v84[0] = v40;
        v84[1] = 3221225472;
        v84[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_4;
        v84[3] = &unk_1E3E68738;
        objc_copyWeak(&v85, &location);
        v48 = +[PKPGSVTransitionInterstitialController createInView:withProvider:containerAlpha:deactivationHandler:](PKPGSVTransitionInterstitialController, "createInView:withProvider:containerAlpha:deactivationHandler:", v73, v67, v84, v63);
        objc_destroyWeak(&v85);
        v44 = v73;
        if (!v48)
          goto LABEL_63;
      }
      -[PKNavigationDashboardPassViewController interstitialControllerAvailable:](v37, "interstitialControllerAvailable:", v48, v71);
      goto LABEL_63;
    }
    -[PKNavigationDashboardPassViewController groupViewIsAvailable:](v37, "groupViewIsAvailable:", self->_modallyPresentedGroupView);
    objc_msgSend(v38, "presentViewController:animated:completion:", v37, 0, 0);
  }
  else
  {
    v49 = *p_loanedGroupView;
    *p_loanedGroupView = 0;

  }
  v40 = MEMORY[0x1E0C809B0];
LABEL_66:

LABEL_67:
  v68 = objc_loadWeakRetained((id *)&self->_datasource);
  objc_msgSend(v68, "endPinningExternalPresentationNavigationHeight");

LABEL_68:
  v69 = dispatch_time(0, (uint64_t)(v35 * 1000000000.0));
  block[0] = v40;
  block[1] = 3221225472;
  block[2] = __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_6;
  block[3] = &unk_1E3E61590;
  v80 = v76;
  v70 = v76;
  dispatch_after(v69, MEMORY[0x1E0C80D38], block);

}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  BOOL v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateGroupStateForGroupViewInModalPresentation:withState:animated:withContext:", v10, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40));
  v3 = v10;
  v4 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 73) && (id)v4[259] == v10)
  {
    if (!*(_BYTE *)(a1 + 74))
      goto LABEL_12;
    objc_msgSend(v4, "_updateModalGroupViewFromTableToExternalPresentationWithFactory:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = objc_msgSend(v4, "_indexOfGroupView:", v10);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD **)(a1 + 32);
    if (!v6 || ((v8 = v7[261], v8 != 0x7FFFFFFFFFFFFFFFLL) ? (v9 = v5 >= v8) : (v9 = 1), v9))
      v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "_updateGroupView:toPresentationState:withSpringFactory:atIndex:", v10, *(_QWORD *)(a1 + 64), v6, v5);
  }
  v3 = v10;
LABEL_12:

}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a2;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "interstitialProvider");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = v8;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v4 = v8;
    }
  }

}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 268) == v5)
  {
    *((_QWORD *)WeakRetained + 268) = 0;

  }
}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 268) == v5)
  {
    *((_QWORD *)WeakRetained + 268) = 0;

  }
}

void __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_5(uint64_t a1)
{
  _DWORD *WeakRetained;
  _DWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[596] == *(_DWORD *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_hideBackdropViewAnimated:delay:", 0, 0.0);
    WeakRetained = v3;
  }

}

uint64_t __85__PKPassGroupStackView__presentModalGroupView_withState_animated_context_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentModalGroupViewPostAnimationActions
{
  if ((*((_WORD *)&self->_layoutState + 32) & 0x200) == 0)
    -[PKPassthroughView bringSubviewToFront:](self->_passContainerView, "bringSubviewToFront:", self->_modallyPresentedGroupView);
  -[PKPassGroupStackView tilePassesEagerly:](self, "tilePassesEagerly:", 0);
}

uint64_t __90__PKPassGroupStackView__presentGroupStackViewWithAnimation_priorBounds_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_createFactoryForExternalPresentation
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", self->_modallyPresentedGroupView, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", self->_modallyPresentedGroupView), 7);
  v4 = v3;
  -[PKPassGroupView layer](self->_modallyPresentedGroupView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "position");
  v7 = vabdd_f64(v4, v6);
  v8 = fmin(fmax((v7 + -100.0) / 500.0, 0.0), 1.0);
  v9 = fmin(fmax((v7 + -50.0) / 550.0, 0.0), 1.0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 1.0, (v8 * 0.85 + (1.0 - v8) * 1.05) * 178.85569, (1.0 - v9 + v9 * 1.15) * 18.18598);

  return v10;
}

- (void)_updateModalGroupViewFromTableToExternalPresentationWithFactory:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  float v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  CATransform3D v27;
  CATransform3D a;
  CATransform3D v29[2];

  v4 = a3;
  v5 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", self->_modallyPresentedGroupView);
  -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", self->_modallyPresentedGroupView, v5, 7);
  v7 = v6;
  v9 = v8;
  -[PKPassGroupStackView _transformForGroupView:atIndex:forState:](self, "_transformForGroupView:atIndex:forState:", self->_modallyPresentedGroupView, v5, 7);
  -[PKPassGroupView layer](self->_modallyPresentedGroupView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "position");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("position"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v12, v14, v7, v9);
  v16 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v15);
  memset(v29, 0, sizeof(v29));
  if (v10)
    objc_msgSend(v10, "transform");
  a = v29[0];
  v27 = v29[1];
  if (!CATransform3DEqualToTransform(&a, &v27))
  {
    objc_msgSend(v4, "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("transform"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    a = v29[0];
    v27 = v29[1];
    objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v27);
    objc_msgSend(v17, "setBeginTime:", 0.13);
    v18 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v17);

  }
  objc_msgSend(v10, "opacity");
  v20 = v19;
  -[PKPassGroupStackView _opacityForGroupAtIndex:withGroupView:forState:](self, "_opacityForGroupAtIndex:withGroupView:forState:", v5, self->_modallyPresentedGroupView, self->_presentationState);
  if (v21 != v20)
  {
    v22 = v21;
    objc_msgSend(v4, "springAnimationForView:withKeyPath:", self->_modallyPresentedGroupView, CFSTR("opacity"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    if (v23)
    {
      objc_msgSend(v23, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v20, v22);
      v26 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v25);
    }
    *(float *)&v24 = v22;
    objc_msgSend(v10, "setOpacity:", v24);

  }
  objc_msgSend(v10, "setPosition:", v7, v9);
  a = v29[1];
  objc_msgSend(v10, "setTransform:", &a);

}

- (id)_dismissModalGroupViewFromExternalToState:(int64_t)a3
{
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v18;
  id v19;
  void *v20;
  id v21;
  CATransform3D v23;
  CATransform3D a;
  CATransform3D v25[2];

  v5 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", self->_modallyPresentedGroupView);
  -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", self->_modallyPresentedGroupView, v5, a3);
  v7 = v6;
  v9 = v8;
  memset(&v25[1], 0, sizeof(CATransform3D));
  -[PKPassGroupStackView _transformForGroupView:atIndex:forState:](self, "_transformForGroupView:atIndex:forState:", self->_modallyPresentedGroupView, v5, a3);
  -[PKPassGroupView layer](self->_modallyPresentedGroupView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "position");
  v13 = v12;
  v14 = v11;
  if (self->_modalGroupViewDragging)
  {
    v15 = 0.0;
    if (vabdd_f64(v9, v11) > 1.0)
      v15 = self->_modalGroupViewVelocity * 0.65 / (v9 - v11);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 1.0, 178.85569, 20.004578);
    objc_msgSend(v16, "setVelocity:", v15);
  }
  else
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
  }
  if (v7 != v13 || v9 != v14)
  {
    objc_msgSend(v16, "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("position"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v13, v14, v7, v9);
    v19 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v18);

  }
  memset(v25, 0, 128);
  if (v10)
    objc_msgSend(v10, "transform");
  a = v25[0];
  v23 = v25[1];
  if (!CATransform3DEqualToTransform(&a, &v23))
  {
    objc_msgSend(MEMORY[0x1E0D676D0], "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("transform"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    a = v25[0];
    v23 = v25[1];
    objc_msgSend(v20, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &v23);
    v21 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v20);

  }
  objc_msgSend(v10, "setPosition:", v7, v9);
  a = v25[1];
  objc_msgSend(v10, "setTransform:", &a);

  return v16;
}

- (void)_presentPassIngestionWithAnimation:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  -[PKPassGroupStackView setScrollEnabled:](self, "setScrollEnabled:", 0);
  -[PKPassGroupStackView _loadModalGroupViewAndPresentOffscreenIfNotCached:](self, "_loadModalGroupViewAndPresentOffscreenIfNotCached:", 0);
  -[PKPassGroupView sizeToFit](self->_modallyPresentedGroupView, "sizeToFit");
  -[PKPassGroupView layer](self->_modallyPresentedGroupView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[PKPassGroupStackView _updateGroupView:toPresentationState:withSpringFactory:](self, "_updateGroupView:toPresentationState:withSpringFactory:", self->_modallyPresentedGroupView, 1, 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v8 = 0;
  if (v4)
    v8 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
  -[PKPassGroupStackView _updateGroupView:toPresentationState:withSpringFactory:](self, "_updateGroupView:toPresentationState:withSpringFactory:", self->_modallyPresentedGroupView, 6, v8);
  v9 = (void *)MEMORY[0x1E0CD28B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PKPassGroupStackView__presentPassIngestionWithAnimation_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E3E61590;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "setCompletionBlock:", v11);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[PKPassGroupView setPresentationState:animated:](self->_modallyPresentedGroupView, "setPresentationState:animated:", 3, 0);
  -[PKPassGroupView updatePageControlFrameAnimated:](self->_modallyPresentedGroupView, "updatePageControlFrameAnimated:", 1);
  self->_presentationState = 6;

}

uint64_t __81__PKPassGroupStackView__presentPassIngestionWithAnimation_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_acquireGroupView:(id)a3 resetExternalVC:(BOOL)a4
{
  _BOOL4 v4;
  PKPassGroupView *v6;
  PKPassGroupView *v7;
  BOOL v8;
  void *v9;
  PKPassGroupView *v10;
  PKPassthroughView *v11;
  PKPassthroughView *passContainerView;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  PKNavigationDashboardPassViewController **p_externalVC;
  id WeakRetained;
  void *v20;

  v4 = a4;
  v6 = (PKPassGroupView *)a3;
  v7 = v6;
  if (v6 && self->_loanedGroupView == v6)
  {
    self->_loanedGroupView = 0;

    ++self->_externalPresentationTag;
    -[PKPassGroupView group](v7, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPassGroupStackView _groupViewWithGroup:](self, "_groupViewWithGroup:", v9);

    -[PKPassGroupView superview](v7, "superview");
    v11 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
    passContainerView = self->_passContainerView;

    if (v10 == v7 || v11 == passContainerView)
    {
      -[PKPassGroupView setLoaned:](v7, "setLoaned:", 0);
      -[PKPassGroupView setDelegate:](v7, "setDelegate:", self);
      if (v11 != passContainerView)
      {
        -[PKPassthroughView addSubview:](self->_passContainerView, "addSubview:", v7);
        -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups");
      }
      -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v7, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v7), self->_presentationState);
      v14 = v13;
      v16 = v15;
      -[PKPassGroupView layer](v7, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPosition:", v14, v16);

      -[PKPassGroupStackView reloadSuppressedContentForGroupView:](self, "reloadSuppressedContentForGroupView:", v7);
    }
    -[PKPassGroupStackView _hideBackdropViewAnimated:delay:](self, "_hideBackdropViewAnimated:delay:", 0, 0.0);
    if (v4)
    {
      p_externalVC = &self->_externalVC;
      WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC);
      objc_storeWeak((id *)p_externalVC, 0);
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "setReceiver:", 0);
        objc_msgSend(WeakRetained, "setPassDashboardDelegate:", 0);
        objc_msgSend(WeakRetained, "invalidate");
        ViewControllerPresentingViewController(WeakRetained);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 0, 0);

      }
    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updatePassFooterViewWithContext:(id)a3
{
  PKPassGroupView *modallyPresentedGroupView;
  id v5;
  id v6;
  id v7;

  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  v5 = a3;
  -[PKPassGroupView frontmostPassView](modallyPresentedGroupView, "frontmostPassView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPassGroupStackView _createPassFooterConfigurationForPassView:withContext:](self, "_createPassFooterConfigurationForPassView:withContext:", v7, v5);
  -[PKPassGroupStackView _updatePassFooterViewWithConfiguration:context:animated:reload:delay:](self, "_updatePassFooterViewWithConfiguration:context:animated:reload:delay:", v6, v5, 1, 1, 0.0);

}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = *((_DWORD *)v3 + 640) - 1;
    *((_DWORD *)v3 + 640) = v4;
    if (*(_BYTE *)(a1 + 36))
    {
      if (*((_DWORD *)v3 + 641) == *(_DWORD *)(a1 + 32))
      {
        v7 = v3;
        v5 = (void *)*((_QWORD *)v3 + 317);
        v6 = *(_BYTE *)(a1 + 38) != 0;
        if (*(_BYTE *)(a1 + 37))
          objc_msgSend(v5, "didBecomeVisibleAnimated:", v6);
        else
          objc_msgSend(v5, "didBecomeHiddenAnimated:", v6);
        v3 = v7;
      }
      v4 = *((_DWORD *)v3 + 640);
    }
    if (!v4 && !*((_BYTE *)v3 + 2544))
    {
      v8 = v3;
      objc_msgSend(*((id *)v3 + 317), "configureWithConfiguration:context:options:", 0, 0, 0);
      v3 = v8;
    }
  }

}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v5;
  id v6;
  void *v7;
  double v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5 && *((_DWORD *)v5 + 641) == *(_DWORD *)(a1 + 56))
  {
    v7 = (void *)v5[317];
    v8 = *(double *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_3;
    v9[3] = &unk_1E3E61C30;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "pkui_setAlpha:withAnimationFactory:completion:", v6, v9, v8);

    objc_destroyWeak(&v11);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93__PKPassGroupStackView__updatePassFooterViewWithConfiguration_context_animated_reload_delay___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_animatorForGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_animatorsByGroupID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updatePanGestureRecognizerForGroupView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    if (self->_invalidated)
      goto LABEL_10;
    v6 = 30;
    if (!self->_transitionCanceller)
      v6 = 7;
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR___PKPassGroupStackView__staggerPileAnimations[v6]);
    if (v7 == 4 || v7 == 7)
LABEL_10:
      -[PKPassGroupStackView _removePanGestureRecognizerFromGroupView:](self, "_removePanGestureRecognizerFromGroupView:", v4);
    else
      -[PKPassGroupStackView _addPanGestureRecognizerToGroupView:](self, "_addPanGestureRecognizerToGroupView:", v4);
    v5 = v9;
  }

}

void __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke(uint64_t a1, void *a2, __int128 *a3, double a4, double a5)
{
  id *WeakRetained;
  double v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double *v16;
  _QWORD v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v16 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = 0.0;
    if (v16)
      v9 = v16[13];
    objc_msgSend(WeakRetained[317], "setAlpha:", *((double *)WeakRetained + 319) * (1.0 - fmax(fmin((a5 - v9) / 80.0, 1.0), 0.0)), v16);
    objc_msgSend(WeakRetained, "_yForGroupInModalPileWithModalGroupY:", a5);
    v10 = WeakRetained[264];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke_2;
    v17[3] = &unk_1E3E6E6D8;
    v17[4] = WeakRetained;
    v17[5] = v10;
    v17[6] = v11;
    v12 = a3[4];
    v23 = a3[5];
    v13 = a3[7];
    v24 = a3[6];
    v25 = v13;
    v14 = a3[1];
    v18 = *a3;
    v19 = v14;
    v15 = a3[3];
    v20 = a3[2];
    v21 = v15;
    v22 = v12;
    objc_msgSend(WeakRetained, "_enumerateLoadedGroupViews:", v17);
    objc_msgSend(WeakRetained, "_updateTopContentSeparatorVisibilityAnimated:", 0);
    objc_msgSend(WeakRetained, "_updateBottomContentSeparatorVisibilityAnimated:", 0);
  }

}

void __60__PKPassGroupStackView__addPanGestureRecognizerToGroupView___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CATransform3D v12;
  CATransform3D a;
  CATransform3D v14;
  CATransform3D v15;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isGroupAtIndexInModalPile:", a3))
  {
    memset(&v15, 0, sizeof(v15));
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v6, "_transformForGroupView:atIndex:forState:", v5, a3, *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "position");
    objc_msgSend(v7, "setPosition:");
    v8 = *(_OWORD *)(a1 + 136);
    *(_OWORD *)&a.m31 = *(_OWORD *)(a1 + 120);
    *(_OWORD *)&a.m33 = v8;
    v9 = *(_OWORD *)(a1 + 168);
    *(_OWORD *)&a.m41 = *(_OWORD *)(a1 + 152);
    *(_OWORD *)&a.m43 = v9;
    v10 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&a.m11 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&a.m13 = v10;
    v11 = *(_OWORD *)(a1 + 104);
    *(_OWORD *)&a.m21 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&a.m23 = v11;
    v12 = v15;
    CATransform3DConcat(&v14, &a, &v12);
    objc_msgSend(v7, "setTransform:", &v14);

  }
}

- (void)_handleModalGroupGesture:(id)a3
{
  void *v4;
  double *v5;
  int64_t presentationState;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x1A1AE621C]();
  -[PKPassGroupStackView _animatorForGestureRecognizer:](self, "_animatorForGestureRecognizer:", v10);
  v5 = (double *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    presentationState = self->_presentationState;
    if (presentationState == 5)
    {
      v7 = objc_msgSend(v10, "state");
      if ((unint64_t)(v7 - 3) < 2)
      {
        -[PKPassGroupStackView _endGroupPanWithAnimator:](self, "_endGroupPanWithAnimator:", v5);
        goto LABEL_9;
      }
      if (v7 == 2)
        goto LABEL_7;
      if (v7 == 1)
      {
        -[PKPassGroupStackView _beginGroupPanWithAnimator:](self, "_beginGroupPanWithAnimator:", v5);
LABEL_7:
        objc_msgSend(v10, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "translationInView:", v8);
        -[PKPassGroupViewVerticalPanAnimator layoutViewsWithY:]((uint64_t)v5, v9 + v5[13]);

      }
    }
LABEL_9:
    -[PKPassGroupViewVerticalPanAnimator updateRecognizingWithAllowed:]((uint64_t)v5, presentationState == 5);
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_handleScrollViewPanGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_presentationState == 4
    && objc_msgSend(a3, "state") == 1
    && self->_pressedGroupViewIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:");
    objc_msgSend(v6, "pressGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "setEnabled:", 0);
      objc_msgSend(v5, "setEnabled:", 1);
    }

  }
}

- (void)_beginGroupPanWithAnimator:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  PKPassGroupView *v14;
  PKPassGroupView *modallyPresentedGroupView;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PKPassGroupView *v19;
  PKPassGroupView *v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;

  v23 = (double *)a3;
  if (self->_transitionCanceller)
    -[PKPassGroupStackView _suspendTransition](self, "_suspendTransition");
  -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups");
  if (v23)
    v4 = (void *)*((_QWORD *)v23 + 8);
  else
    v4 = 0;
  v5 = v4;
  v6 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v5);
  if (v23)
  {
    -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:]((uint64_t)v23, 0);
    -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v5, v6, 5);
    *((_QWORD *)v23 + 12) = v7;
    *((_QWORD *)v23 + 13) = v8;
  }
  else
  {
    -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v5, v6, 5);
  }
  objc_msgSend(v5, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "position");
  v11 = v10;

  -[PKPassGroupStackView bounds](self, "bounds");
  if (v23)
  {
    *((_QWORD *)v23 + 14) = v11;
    v23[15] = v12 + v13;
  }
  v14 = self->_modallyPresentedGroupView;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  self->_modallyPresentedGroupView = 0;

  v16 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
  -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v16, v17, 0);
  -[PKPassGroupStackView _scaleForGroupView:atIndex:forState:](self, "_scaleForGroupView:atIndex:forState:", v14, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v14), 5);
  if (v23)
    *((_QWORD *)v23 + 11) = v18;
  v19 = self->_modallyPresentedGroupView;
  self->_modallyPresentedGroupView = v14;
  v20 = v14;

  v21 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
  -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v21, v22, 0);

}

- (void)_endGroupPanWithAnimator:(id)a3
{
  double *v4;
  double *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;

  v4 = (double *)a3;
  v5 = v4;
  if (v4)
    v6 = (void *)*((_QWORD *)v4 + 9);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "velocityInView:", self);
  v9 = v8;
  objc_msgSend(v7, "translationInView:", self);
  if (v10 < 80.0 || v9 < 0.0)
  {
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "translationInView:", v11);
    v13 = v12;

    v14 = 0.0;
    v15 = 0;
    if (v5)
    {
      v15 = *((_QWORD *)v5 + 12);
      v14 = v5[13];
    }
    v16 = v14 - (v13 + v14);
    if (v16 == 0.0)
      v17 = 0.0;
    else
      v17 = v9 / v16;
    v18 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory", 0.0);
    objc_msgSend(v18, "setVelocity:", v17);
    -[PKPassGroupStackView _yForGroupInModalPileWithModalGroupY:](self, "_yForGroupInModalPileWithModalGroupY:", v14);
    v20 = v19;
    objc_msgSend(v18, "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("position"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "highFrameRateSpringAnimationWithKeyPath:reason:", CFSTR("transform"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke;
    v30[3] = &unk_1E3E6E728;
    v33 = v15;
    v34 = v14;
    v35 = v15;
    v36 = v20;
    v30[4] = self;
    v31 = v21;
    v32 = v22;
    v23 = v22;
    v24 = v21;
    -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v30);
    if (v5)
      v25 = (void *)*((_QWORD *)v5 + 8);
    else
      v25 = 0;
    v26 = v25;
    objc_msgSend(v26, "updatePageControlFrameAnimated:", 1);
    objc_msgSend(v26, "clearPageControlAlphaOverride");
    -[PKPassGroupView setPresentationState:animated:](self->_modallyPresentedGroupView, "setPresentationState:animated:", 3, 1);
    *((_WORD *)&self->_layoutState + 32) |= 0x400u;
    -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 5, 1);
    *((_WORD *)&self->_layoutState + 32) &= ~0x400u;

  }
  else
  {
    -[PKPassGroupStackView _cancelSuspendedTransition](self, "_cancelSuspendedTransition");
    objc_initWeak(&location, self);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke_2;
    v27[3] = &unk_1E3E61C58;
    objc_copyWeak(&v28, &location);
    -[PKPassGroupViewVerticalPanAnimator dismissWithStartVelocity:completion:](v5, v27, v9);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

void __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[8];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v7 = a2;
  v8 = a4;
  v9 = (_QWORD *)a1[4];
  v10 = v7;
  if ((id)v9[259] != v7)
  {
    if (!objc_msgSend(v9, "_isGroupAtIndexInModalPile:", a3))
      goto LABEL_14;
    v10 = *(id *)(a1[4] + 2072);
  }
  v11 = v10 == v7;
  v12 = 10;
  if (v11)
    v12 = 8;
  v13 = 9;
  if (v11)
    v13 = 7;
  v14 = *(double *)&a1[v13];
  v15 = *(double *)&a1[v12];
  objc_msgSend(v7, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)a1[5];
  objc_msgSend(v16, "position");
  objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
  objc_msgSend(v16, "addAnimation:forKey:", a1[5], CFSTR("modalPanGestureRecovery"));
  objc_msgSend(v16, "setPosition:", v14, v15);
  v18 = (_QWORD *)a1[4];
  if ((id)v18[259] != v7)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v18, "_transformForGroupView:atIndex:forState:", v7, a3, v18[264]);
    v19 = (void *)a1[6];
    if (v16)
      objc_msgSend(v16, "transform");
    else
      memset(v29, 0, sizeof(v29));
    v25 = v34;
    v26 = v35;
    v27 = v36;
    v28 = v37;
    v21 = v30;
    v22 = v31;
    v23 = v32;
    v24 = v33;
    objc_msgSend(v19, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", v29, &v21);
    v20 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", a1[6]);
    v25 = v34;
    v26 = v35;
    v27 = v36;
    v28 = v37;
    v21 = v30;
    v22 = v31;
    v23 = v32;
    v24 = v33;
    objc_msgSend(v16, "setTransform:", &v21);
  }

LABEL_14:
}

void __49__PKPassGroupStackView__endGroupPanWithAnimator___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setPresentationState:animated:", 4, 1);

  }
}

void __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (*(_BYTE *)(a1 + 32))
    {
      objc_msgSend(v3, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke_2;
      v6[3] = &unk_1E3E62288;
      v7 = v3;
      objc_msgSend(v5, "pkui_animateToOpacity:withCompletion:", v6, 0.0);

    }
    else
    {
      objc_msgSend(v3, "removeFromSuperview");
    }
  }

}

uint64_t __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __64__PKPassGroupStackView__updateHeaderContext_toContext_animated___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(_QWORD *)(a2 + 8);
  else
    return 0;
}

uint64_t __64__PKPassGroupStackView__updateHeaderFooterStateAnimated_layout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (BOOL)discoveryGalleryHasWelcomeCards
{
  __int128 v3;
  uint64_t v4;
  char v5;

  v3 = *(_OWORD *)&self->_layoutState.groups.count;
  v4 = *((_QWORD *)&self->_layoutState.groups + 2);
  v5 = (*((_BYTE *)&self->_layoutState + 64) >> 1) & 3;
  return +[PKDiscoveryGalleryView isWelcomeCardVisibleForSectionsState:](PKDiscoveryGalleryView, "isWelcomeCardVisibleForSectionsState:", &v3);
}

- (BOOL)_updateContentSize
{
  return -[PKPassGroupStackView _updateContentSizeWithPriorBounds:bounds:](self, "_updateContentSizeWithPriorBounds:bounds:", 0, 0);
}

- (unint64_t)_tablePresentationNumberOfCellsBeforeHeaderHidden
{
  return 4;
}

- (unint64_t)_indexForNativePositionInTable:(CGPoint)a3
{
  return -[PKPassGroupStackView _indexForNativePositionInTable:roundToClosestIndex:](self, "_indexForNativePositionInTable:roundToClosestIndex:", 1, a3.x, a3.y);
}

- (double)_yForModallyPresentedGroup
{
  double result;

  -[PKPassGroupStackView _yForModallyPresentedGroupForExternalPresentation:ignoringCompactState:](self, "_yForModallyPresentedGroupForExternalPresentation:ignoringCompactState:", 0, 0);
  return result;
}

- (double)_yForExternalModallyPresentedGroup
{
  double result;

  -[PKPassGroupStackView _yForModallyPresentedGroupForExternalPresentation:ignoringCompactState:](self, "_yForModallyPresentedGroupForExternalPresentation:ignoringCompactState:", 1, 0);
  return result;
}

- (double)_yForModallyPresentedGroupForExternalPresentation:(BOOL)a3 ignoringCompactState:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v25;
  CGRect v26;

  v5 = a3;
  -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "passType") == 1
    || PKValueAddedServicesEnabledForPass()
    || self->_layoutState.groups.count > 1
    || -[PKPassGroupStackView _isModalPresentationAllowedForSingleGroup](self, "_isModalPresentationAllowedForSingleGroup"))
  {
    -[PKPassGroupStackView bounds](self, "bounds");
    if (self->_presentationState == 4)
      v10 = 0.0;
    else
      v10 = v9;
    if (!v5 || *((__int16 *)&self->_layoutState + 32) < 0)
    {
      if (PKUIGetMinScreenType())
        v15 = 15.0;
      else
        v15 = 5.0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
      objc_msgSend(WeakRetained, "externalPresentationNavigationHeight");
      v13 = v12;
      +[PKDashboardPassFlowLayout topMarginInFirstSection](PKDashboardPassFlowLayout, "topMarginInFirstSection");
      v15 = v13 + v14;

    }
    if (-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation")
      && (*((_WORD *)&self->_layoutState + 32) & 1) == 0)
    {
      -[PKPassGroupStackView _firstHeaderContext](self, "_firstHeaderContext");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (double *)v16;
      if (v16)
      {
        v18 = *(double *)(v16 + 56);
        -[PKPGSVSectionHeaderContext _headerViewSize](v16);
        v20 = v17[9] + v18 + v19;
      }
      else
      {
        v20 = 0.0;
      }
      v15 = fmax(v15, v20);

    }
    if (!a4 && (*((_WORD *)&self->_layoutState + 32) & 0x200) != 0)
    {
      LAUIPhysicalButtonNormalizedFrame();
      CGRectGetMaxY(v26);
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      PKFloatRoundToPixel();
      v15 = fmax(v15, v22 - self->_lastTopContentSeparatorHeight + 26.0);

    }
    v23 = v10 + v15;
  }
  else
  {
    -[PKPassGroupStackView _yForSingleGroupView:](self, "_yForSingleGroupView:", self->_modallyPresentedGroupView);
    v23 = v25;
  }

  return v23;
}

- (double)_yForSingleGroupView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  uint64_t v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v23;

  objc_msgSend(a3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = v4;
  -[PKPassGroupStackView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (self->_presentationState == 4)
    v13 = 0.0;
  else
    v13 = v6;
  v14 = v13;
  if (-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation"))
  {
    v14 = v13;
    if ((*((_WORD *)&self->_layoutState + 32) & 1) == 0)
    {
      -[PKPassGroupStackView _firstHeaderContext](self, "_firstHeaderContext");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (double *)v15;
      if (v15)
      {
        v17 = *(double *)(v15 + 56);
        -[PKPGSVSectionHeaderContext _headerViewSize](v15);
        v19 = v16[9] + v17 + v18;
      }
      else
      {
        v19 = 0.0;
      }
      v14 = v13 + v19;

    }
  }
  UIRectCenteredYInRect();
  v21 = v20;
  v23.origin.x = v8;
  v23.origin.y = v13;
  v23.size.width = v10;
  v23.size.height = v12;
  return fmax(fmin(v21, CGRectGetMaxY(v23) - v5), v14);
}

- (double)_maxYOfPassFrontFaceAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  objc_msgSend(WeakRetained, "groupAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "passAtIndex:", objc_msgSend(v6, "frontmostPassIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "style");
  -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", a3, 4);
  v10 = v9;
  PKPassFrontFaceContentSize();
  v12 = v10 + v11;

  return v12;
}

- (unint64_t)_maximumNumberOfVisiblePilePasses
{
  return 9;
}

- (double)_pileSeparationHeight
{
  unint64_t v2;

  v2 = -[NSMutableArray count](self->_passPileViews, "count");
  if (v2)
    return fmax(floor(44.0 / (double)v2), 5.0);
  else
    return 5.0;
}

- (double)_pileAscenderHeight
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  v3 = -[NSMutableArray count](self->_passPileViews, "count");
  if (v3 >= -[PKPassGroupStackView _maximumNumberOfVisiblePilePasses](self, "_maximumNumberOfVisiblePilePasses"))
    v4 = -[PKPassGroupStackView _maximumNumberOfVisiblePilePasses](self, "_maximumNumberOfVisiblePilePasses");
  else
    v4 = -[NSMutableArray count](self->_passPileViews, "count");
  if (v4 < 2)
  {
    v6 = 1;
  }
  else
  {
    v5 = -[NSMutableArray count](self->_passPileViews, "count");
    if (v5 >= -[PKPassGroupStackView _maximumNumberOfVisiblePilePasses](self, "_maximumNumberOfVisiblePilePasses"))
      v6 = -[PKPassGroupStackView _maximumNumberOfVisiblePilePasses](self, "_maximumNumberOfVisiblePilePasses");
    else
      v6 = -[NSMutableArray count](self->_passPileViews, "count");
  }
  v7 = (double)(unint64_t)(v6 - 1);
  -[PKPassGroupStackView _pileSeparationHeight](self, "_pileSeparationHeight");
  return v8 * v7;
}

- (double)_pileAscenderHeightForGroupViewInPile:(id)a3
{
  unint64_t v4;
  NSMutableArray *passPileViews;
  void *v6;
  double v7;

  v4 = -[NSMutableArray indexOfObject:](self->_passPileViews, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    passPileViews = self->_passPileViews;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[NSMutableArray indexOfObject:](passPileViews, "indexOfObject:", v6);

  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 1;
  if (v4 >= -[PKPassGroupStackView _maximumNumberOfVisiblePilePasses](self, "_maximumNumberOfVisiblePilePasses") - 1)
    v4 = -[PKPassGroupStackView _maximumNumberOfVisiblePilePasses](self, "_maximumNumberOfVisiblePilePasses") - 1;
  -[PKPassGroupStackView _pileSeparationHeight](self, "_pileSeparationHeight");
  return v7 * (double)v4;
}

- (double)_pileBaseHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  PKPassGroupView *modallyPresentedGroupView;
  double v10;
  double v11;
  double v13;
  double v14;

  if (!-[NSMutableArray count](self->_passPileViews, "count"))
    return 0.0;
  -[PKPassGroupStackView bounds](self, "bounds");
  v4 = v3;
  -[PKPassGroupView group](self->_modallyPresentedGroupView, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "passCount") <= 1)
    v6 = 7.0;
  else
    v6 = 4.0;

  -[PKPassGroupStackView _pileAscenderHeight](self, "_pileAscenderHeight");
  v8 = v7;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    -[PKPassGroupView bounds](modallyPresentedGroupView, "bounds");
    v11 = v10;
  }
  else
  {
    PKPassMaxFrontSize();
    v11 = v13;
  }
  v14 = 0.0;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
    v14 = self->_lastBoundsInsets.bottom + 30.0;
  return v14 + fmin(v4 - v11 - v6 - v14, 44.0) - v8;
}

- (double)_yForGroupInModalPileAtIndex:(unint64_t)a3
{
  double result;

  if (self->_modallyPresentedGroupView)
  {
    -[PKPassGroupStackView _yForModallyPresentedGroup](self, "_yForModallyPresentedGroup", a3);
    -[PKPassGroupStackView _yForGroupInModalPileWithModalGroupY:](self, "_yForGroupInModalPileWithModalGroupY:");
  }
  else
  {
    -[PKPassGroupStackView _yForGroupInPileAtIndex:](self, "_yForGroupInPileAtIndex:", a3);
  }
  return result;
}

- (double)_yForGroupInModalPileWithModalGroupY:(double)result
{
  double v3;
  PKPassGroupView *modallyPresentedGroupView;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v3 = result;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    -[PKPassGroupView frontmostPassView](modallyPresentedGroupView, "frontmostPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "style");

    -[PKPassGroupStackView _scaleForModalPileGroup](self, "_scaleForModalPileGroup");
    v9 = 1.0 - v8;
    PKPassFrontFaceContentSize();
    return v3 + v9 * v10 * 0.5;
  }
  return result;
}

- (double)_yForGroupInExternalModalPileWithModalGroupY:(double)result
{
  double v3;
  PKPassGroupView *modallyPresentedGroupView;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = result;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
  {
    -[PKPassGroupView frontmostPassView](modallyPresentedGroupView, "frontmostPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "style");

    -[PKPassGroupStackView _scaleForModalPileGroup](self, "_scaleForModalPileGroup");
    v9 = 1.0 - v8;
    -[PKPassGroupStackView _scaleForModallyPresentedGroupInExternalPresentation](self, "_scaleForModallyPresentedGroupInExternalPresentation");
    v11 = v10;
    PKPassFrontFaceContentSize();
    return v3 + v9 * (v11 * v12) * 0.5;
  }
  return result;
}

- (double)_yForGroupInPileAtIndex:(unint64_t)a3
{
  double result;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSNumber *featuredGroupID;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  CGRect v19;

  if (self->_layoutState.pilingMode)
  {
    -[PKPassGroupStackView _yForGroupInOffscreenPileAtIndex:](self, "_yForGroupInOffscreenPileAtIndex:", a3);
  }
  else
  {
    v5 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
    -[PKPassGroupStackView _pileBaseHeight](self, "_pileBaseHeight");
    v7 = v6;
    -[PKPassGroupStackView _pileAscenderHeightForGroupViewInPile:](self, "_pileAscenderHeightForGroupViewInPile:", v5);
    v9 = v7 + v8;
    featuredGroupID = self->_featuredGroupID;
    if (featuredGroupID)
    {
      objc_msgSend(v5, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "groupID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSNumber isEqual:](featuredGroupID, "isEqual:", v12);

      if (v13)
      {
        -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pass");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "style");

        if (v16 == 6)
        {
          -[PKPassGroupStackView _pileSeparationHeight](self, "_pileSeparationHeight");
          v9 = v9 - v17 + 44.0;
        }
      }
    }
    -[PKPassGroupStackView bounds](self, "bounds");
    v18 = CGRectGetMaxY(v19) - v9;

    return v18;
  }
  return result;
}

- (double)_yForGroupInOffscreenPileAtIndex:(unint64_t)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MaxY;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CGRect v15;

  v4 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
  -[PKPassGroupStackView _pileAscenderHeight](self, "_pileAscenderHeight");
  v6 = v5;
  -[PKPassGroupStackView _pileAscenderHeightForGroupViewInPile:](self, "_pileAscenderHeightForGroupViewInPile:", v4);
  v8 = v7;
  -[PKPassGroupStackView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v15);
  objc_msgSend(v4, "frontmostPassView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  PKPassFaceShadowInsets();
  v13 = MaxY + v12;

  return v6 - v8 + v13;
}

- (double)_opacityForGroupAtIndex:(unint64_t)a3 withGroupView:(id)a4 forState:(int64_t)a5
{
  PKPassGroupView *v8;
  PKPassGroupView *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v8 = (PKPassGroupView *)a4;
  v9 = v8;
  v10 = 1.0;
  if (a5 == 5)
  {
    if (self->_modalGroupIndex != a3 && (!v8 || self->_modallyPresentedGroupView != v8))
    {
      v15 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
      v10 = 0.0;
      if (a3 >= v15 && a3 - v15 < v16)
      {
        v10 = 1.0;
        if (-[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", a3))
        {
          -[PKPassGroupView group](v9, "group");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (v18 = v17, v19 = objc_msgSend(v17, "passCount"), v18, v19 > 1))
          {
            v20 = 1;
          }
          else
          {
            -[PKPassGroupView frontmostPassView](self->_modallyPresentedGroupView, "frontmostPassView");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "pass");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKPassGroupView frontmostPassView](v9, "frontmostPassView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "pass");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              if (v24)
              {
                objc_msgSend(v22, "style");
                objc_msgSend(v24, "style");
                PKPassFrontFaceContentSize();
                v26 = v25;
                PKPassHeightAdjustmentForStyle();
                v28 = v26 - v27;
                PKPassFrontFaceContentSize();
                v20 = v29 > v28;
              }
              else
              {
                v20 = 0;
              }
            }
            else
            {
              v20 = 1;
            }

          }
          v10 = (double)!v20;
        }
      }
    }
  }
  else if (a5 == 4)
  {
    v11 = -[PKPassGroupStackView _rangeOfVisibleIndexes](self, "_rangeOfVisibleIndexes");
    v13 = 0.0;
    if (v11 + v12 == a3)
      v13 = 1.0;
    if (v11 + v12 > a3)
      v13 = 1.0;
    if (v12)
      v10 = v13;
    else
      v10 = 1.0;
  }

  return v10;
}

- (double)_scaleForModalPileGroup
{
  return dbl_19DF16600[PKUIGetMinScreenWidthType() == 0];
}

- (double)_scaleForModallyPresentedGroupInExternalPresentation
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 0.9;
  if (v2)
    return 1.0;
  return result;
}

- (double)_scaleForStackGroupInExternalPresentation
{
  return dbl_19DF16610[PKUIGetMinScreenWidthType() == 0];
}

- (BOOL)_isGroupAtIndexInModalPile:(unint64_t)a3
{
  unint64_t modalGroupIndex;
  unint64_t separatorIndex;
  _BOOL4 v6;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  modalGroupIndex = self->_modalGroupIndex;
  if (modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if ((*((_BYTE *)&self->_layoutState + 24) & 1) != 0)
    return modalGroupIndex > a3;
  if ((*((_BYTE *)&self->_layoutState.groups + 16) & 1) == 0)
    return 0;
  separatorIndex = self->_layoutState.groups.separatorIndex;
  if (separatorIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((*((_BYTE *)&self->_layoutState.groups + 16) & 2) != 0)
      v6 = (*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1;
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = modalGroupIndex <= separatorIndex;
  }
  return modalGroupIndex > a3 && v6;
}

- (CGRect)_frameForFooterViewForPassView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double bottom;
  double v22;
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
  CGRect v35;
  CGRect v36;
  CGRect remainder;
  CGRect v38;
  CGRect result;

  v4 = a3;
  -[PKPassGroupStackView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "pass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = objc_msgSend(v13, "style");
  else
    v14 = 6;
  -[PKPassGroupStackView _yForModallyPresentedGroupForExternalPresentation:ignoringCompactState:](self, "_yForModallyPresentedGroupForExternalPresentation:ignoringCompactState:", 0, 1);
  v16 = v15;
  PKPassFrontFaceContentSize();
  v18 = 0.0;
  if (self->_presentationState != 4)
    v18 = v8;
  v19 = v17 + v16 - v18;
  if ((unint64_t)(v14 - 8) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    PKPassHeightAdjustmentForStyle();
    v19 = v19 - v20;
  }
  memset(&v36, 0, sizeof(v36));
  remainder.origin.x = v6;
  remainder.origin.y = v8;
  remainder.size.width = v10;
  remainder.size.height = v12;
  if (self->_layoutState.pilingMode)
  {
    memset(&v35, 0, sizeof(v35));
    bottom = self->_lastBoundsInsets.bottom;
  }
  else
  {
    -[PKPassGroupStackView pileHeight](self, "pileHeight", (unsigned __int128)0, (unsigned __int128)0, *(_QWORD *)&v36.origin.x, *(_QWORD *)&v36.origin.y, *(_QWORD *)&v36.size.width, *(_QWORD *)&v36.size.height);
    bottom = fmax(v22, self->_lastBoundsInsets.bottom);
  }
  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  CGRectDivide(v38, &v35, &remainder, bottom, CGRectMaxYEdge);
  CGRectDivide(remainder, &remainder, &v36, v19, CGRectMinYEdge);
  PKPassFrontFaceContentSize();
  PKSizeAlignedInRect();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)_updateGroupStateForGroupViewInModalPresentation:(id)a3 withState:(int64_t)a4 animated:(BOOL)a5 withContext:(id)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  PKPassGroupView *v12;

  v7 = a5;
  v12 = (PKPassGroupView *)a3;
  v10 = a6;
  if (self->_modallyPresentedGroupView == v12)
  {
    if (!v7)
    {
      -[PKPassGroupView setPresentationState:withContext:animated:](v12, "setPresentationState:withContext:animated:", 3, v10, 0);
      -[PKPassGroupView sizeToFit](v12, "sizeToFit");
    }
  }
  else
  {
    if (a4 == 7)
      v11 = 1;
    else
      v11 = 2;
    -[PKPassGroupView setPresentationState:animated:](v12, "setPresentationState:animated:", v11, v7);
  }

}

- (void)_updateTransformForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v8 = a3;
  v9 = a5;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PKPassGroupStackView _transformForGroupView:atIndex:forState:](self, "_transformForGroupView:atIndex:forState:", v8, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v8), a4);
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "highFrameRateSpringAnimationForView:withKeyPath:reason:", v8, CFSTR("transform"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(v21, 0, sizeof(v21));
    v17 = v26;
    v18 = v27;
    v19 = v28;
    v20 = v29;
    v13 = v22;
    v14 = v23;
    v15 = v24;
    v16 = v25;
    objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", v21, &v13);
    v12 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v11);

  }
  v17 = v26;
  v18 = v27;
  v19 = v28;
  v20 = v29;
  v13 = v22;
  v14 = v23;
  v15 = v24;
  v16 = v25;
  objc_msgSend(v10, "setTransform:", &v13);

}

- (void)_updatePositionForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[PKPassGroupStackView _updatePositionForGroupView:toPresentationState:withSpringFactory:atIndex:](self, "_updatePositionForGroupView:toPresentationState:withSpringFactory:atIndex:", v9, a4, v8, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v9));

}

- (void)_updatePositionForGroupView:(id)a3 toPresentationState:(int64_t)a4 withSpringFactory:(id)a5 atIndex:(unint64_t)a6
{
  id v10;
  id v11;

  v10 = a5;
  v11 = a3;
  -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v11, a6, a4);
  -[PKPassGroupStackView _updatePositionForGroupView:toPosition:withSpringFactory:](self, "_updatePositionForGroupView:toPosition:withSpringFactory:", v11, v10);

}

- (void)_updatePositionForGroupView:(id)a3 toPosition:(CGPoint)a4 withSpringFactory:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PKPassGroupView *v13;

  y = a4.y;
  x = a4.x;
  v13 = (PKPassGroupView *)a3;
  v9 = a5;
  if (self->_loanedGroupView != v13 || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    -[PKPassGroupView layer](v13, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "highFrameRateSpringAnimationForView:withKeyPath:reason:", v13, CFSTR("position"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "position");
      objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
      v12 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v11);

    }
    objc_msgSend(v10, "setPosition:", x, y);

  }
}

uint64_t __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __65__PKPassGroupStackView__layoutFooterAnimated_withAnimationDelay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2536), "layoutIfNeeded");
}

- (void)_animateGroupViewAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 withAnchorView:(id)a5 insertAbove:(BOOL)a6
{
  id v10;
  PKPassGroupView *v11;
  PKPassGroupView *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PKPassGroupView *v20;
  double (**v21)(void *, unint64_t);
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *reorderActionTag;
  NSMutableArray *v42;
  NSMutableArray *reorderActions;
  NSMutableArray *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  BOOL v49;
  _QWORD v50[4];
  id v51[2];
  _QWORD v52[4];
  PKPassGroupView *v53;
  id v54;
  id v55;
  BOOL v56;
  id location;
  _QWORD aBlock[5];
  PKPassGroupView *v59;
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
  v12 = v11;
  if (v11 != self->_loanedGroupView || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    v49 = a6;
    -[PKPassGroupView layer](v11, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "position");
    v15 = v14;
    v17 = v16;
    -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", a4, 4);
    if (v18 != v17)
    {
      v19 = v18;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke;
      aBlock[3] = &unk_1E3E6E800;
      aBlock[4] = self;
      v20 = v12;
      v59 = v20;
      v21 = (double (**)(void *, unint64_t))_Block_copy(aBlock);
      v22 = v21[2](v21, a3);
      -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", a3, 4);
      v24 = v23;
      v25 = v21[2](v21, a4);
      -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", a4, 4);
      v27 = v26;
      -[PKPassGroupView frontmostPassView](v20, "frontmostPassView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "contentMode") < 3;

      if (v29)
      {
        -[PKPassGroupView frontmostPassView](v20, "frontmostPassView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setContentMode:", 3);

      }
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAdditive:", 1);
      v32 = *MEMORY[0x1E0CD2950];
      objc_msgSend(v31, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
      objc_msgSend(v31, "setMass:", 1.0);
      objc_msgSend(v31, "setStiffness:", 300.0);
      objc_msgSend(v31, "setDamping:", 400.0);
      v33 = fmax(v17, v19) + fmax(v22 - v24, v25 - v27) + 15.0;
      objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v15, v17, v15, v33, v15, v19);
      v34 = *MEMORY[0x1E0CD2B60];
      objc_msgSend(v31, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v31, "durationForEpsilon:", 0.001);
      v36 = v35;
      objc_msgSend(v31, "setDuration:");
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAdditive:", 1);
      objc_msgSend(v37, "setBeginTimeMode:", v32);
      objc_msgSend(v37, "setMass:", 2.0);
      objc_msgSend(v37, "setStiffness:", 300.0);
      objc_msgSend(v37, "setDamping:", 400.0);
      objc_msgSend(v37, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v15, v33, v15, v19, v15, v33);
      objc_msgSend(v37, "setFillMode:", v34);
      objc_msgSend(v37, "durationForEpsilon:", 0.001);
      v39 = v38;
      objc_msgSend(v37, "setBeginTime:", 0.17);
      objc_msgSend(v37, "setDuration:", v39);
      PKMagicCurve();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setTimingFunction:", v40);

      reorderActionTag = (void *)self->_reorderActionTag;
      if (!self->_reorderActions)
      {
        v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        reorderActions = self->_reorderActions;
        self->_reorderActions = v42;

      }
      objc_initWeak(&location, self);
      v44 = self->_reorderActions;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_2;
      v52[3] = &unk_1E3E625C0;
      objc_copyWeak(&v55, &location);
      v56 = v49;
      v53 = v20;
      v54 = v10;
      v45 = _Block_copy(v52);
      -[NSMutableArray addObject:](v44, "addObject:", v45);

      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setDuration:", fmax(v36, v39 + 0.17));
      v60[0] = v31;
      v60[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setAnimations:", v47);

      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_3;
      v50[3] = &unk_1E3E66D38;
      objc_copyWeak(v51, &location);
      v51[1] = reorderActionTag;
      objc_msgSend(v46, "pkui_setDidStartHandler:", v50);
      v48 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v46);
      objc_msgSend(v13, "setPosition:", v15, v19);
      objc_destroyWeak(v51);

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);

    }
  }

}

double __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGRect v16;

  v3 = a2 + 1;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[277];
  if (a2 + 1 >= v5)
  {
    objc_msgSend(v4, "_maxYOfPassFrontFaceAtIndex:", v5 - 1);
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v7 = fmin(v9, CGRectGetMaxY(v16));
  }
  else
  {
    objc_msgSend(v4, "_yPositionForGroupAtIndex:forState:", a2 + 1, 4);
    v7 = v6;
  }
  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "_groupViewAtIndex:", v3);
  v11 = v10;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentationLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "position");
    v7 = fmax(v7, v14);

  }
  return v7;
}

void __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = (void *)WeakRetained[323];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v3, "insertSubview:aboveSubview:", v4, v5);
    else
      objc_msgSend(v3, "insertSubview:belowSubview:", v4, v5);
    WeakRetained = v6;
  }

}

void __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4[2];

  v2 = dispatch_time(0, 170000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_4;
  v3[3] = &unk_1E3E66D38;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __84__PKPassGroupStackView__animateGroupViewAtIndex_toIndex_withAnchorView_insertAbove___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  void (**v3)(_QWORD);
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[312] == *(id *)(a1 + 40))
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[311], "firstObject");
    v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v4[311], "removeObjectAtIndex:", 0);
      v3[2](v3);
      if (((_BYTE)v4[310] & 1) == 0 && !objc_msgSend(v4[311], "count"))
        objc_msgSend(v4, "_arrangeGroups");
    }

    WeakRetained = v4;
  }

}

- (void)_autoscrollIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double Height;
  double v7;
  NSTimer *v8;
  NSTimer *autoscrollTimer;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[PKPassGroupView layer](self->_reorderedGroupView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "position");
  v5 = v4;

  -[PKPassGroupStackView bounds](self, "bounds");
  Height = CGRectGetHeight(v10);
  -[PKPassGroupStackView contentSize](self, "contentSize");
  if (Height >= v7
    || (-[PKPassGroupStackView bounds](self, "bounds"), CGRectGetMinY(v11) + 50.0 <= v5)
    && (-[PKPassGroupStackView bounds](self, "bounds"), CGRectGetMaxY(v12) + -150.0 >= v5))
  {
    if (self->_autoscrollTimer)
      -[PKPassGroupStackView _stopAutoscrollTimer](self, "_stopAutoscrollTimer");
  }
  else if (!self->_autoscrollTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__autoscrollForReordering_, 0, 1, 0.0166666675);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    autoscrollTimer = self->_autoscrollTimer;
    self->_autoscrollTimer = v8;

  }
}

- (void)_autoscrollForReordering:(id)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  float v20;
  float v21;
  float v22;
  void *v23;
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
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[PKPassGroupStackView _contentSize](self, "_contentSize", a3);
  v5 = v4;
  -[PKPassGroupStackView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PKPassGroupView layer](self->_reorderedGroupView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "position");
  v16 = v15;

  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  v17 = CGRectGetMinY(v47) + 50.0;
  v18 = v16 <= 0.0 || v17 <= v16;
  if (!v18 && (*(_BYTE *)&self->_reorderingFlags & 4) != 0)
  {
    v50.origin.x = v7;
    v50.origin.y = v9;
    v50.size.width = v11;
    v50.size.height = v13;
    v22 = CGRectGetMinY(v50) + 50.0 - v16;
    v21 = -2.0;
    if (v22 <= 0.0)
      goto LABEL_18;
    v21 = -floorf((float)((float)((float)(v22 / 25.0) * 5.0) * (float)(v22 / 25.0)) + 2.0);
    goto LABEL_16;
  }
  v48.origin.x = v7;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  v19 = CGRectGetMaxY(v48) + -150.0 < v16 && v16 < v5;
  if (!v19 || (*(_BYTE *)&self->_reorderingFlags & 8) == 0)
    goto LABEL_17;
  v49.origin.x = v7;
  v49.origin.y = v9;
  v49.size.width = v11;
  v49.size.height = v13;
  v20 = v16 + 150.0 - CGRectGetMaxY(v49);
  v21 = 2.0;
  if (v20 > 0.0)
  {
    v21 = floorf((float)((float)((float)(v20 / 75.0) * 5.0) * (float)(v20 / 75.0)) + 2.0);
LABEL_16:
    if (v21 == 0.0)
    {
LABEL_17:
      -[PKPassGroupStackView _stopAutoscrollTimer](self, "_stopAutoscrollTimer");
      return;
    }
  }
LABEL_18:
  -[PKPassGroupView layer](self->_reorderedGroupView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "position");
  v25 = v24;
  v27 = v26;
  -[PKPassGroupStackView superview](self, "superview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupStackView convertPoint:toView:](self, "convertPoint:toView:", v28, v25, v27);
  v30 = v29;
  v32 = v31;

  -[PKPassGroupStackView contentOffset](self, "contentOffset");
  v34 = v33;
  v35 = v21;
  v37 = fmax(v36 + v21, 0.0);
  -[PKPassGroupStackView bounds](self, "bounds");
  if (v37 >= v5 - v38)
  {
    -[PKPassGroupStackView bounds](self, "bounds");
    v37 = v5 - v39;
  }
  -[PKPassGroupStackView setContentOffset:](self, "setContentOffset:", v34, v37);
  -[PKPassGroupStackView superview](self, "superview");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupStackView convertPoint:fromView:](self, "convertPoint:fromView:", v40, v30, v32);
  v42 = v41;
  v44 = v43;

  if (v44 >= v5 + -5.0)
    v45 = v5 + -5.0;
  else
    v45 = v44;
  -[PKPassGroupView layer](self->_reorderedGroupView, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPosition:", v42, v45);

  -[PKPassGroupStackView _reorderPositionChangedForReorderedGroupViewWithVelocity:](self, "_reorderPositionChangedForReorderedGroupViewWithVelocity:", 0.0, v35);
}

- (void)_stopAutoscrollTimer
{
  NSTimer *autoscrollTimer;

  -[NSTimer invalidate](self->_autoscrollTimer, "invalidate");
  autoscrollTimer = self->_autoscrollTimer;
  self->_autoscrollTimer = 0;

}

- (void)_adjustGroupViewsForReordering
{
  unint64_t previousIndexOfReorderedGroup;
  id v4;
  int64_t v5;
  id v6;

  previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
  if (previousIndexOfReorderedGroup)
  {
    v4 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", previousIndexOfReorderedGroup - 1);
    v5 = -[PKPassGroupStackView groupViewContentModeForFrontmostPassWhenStacked:](self, "groupViewContentModeForFrontmostPassWhenStacked:", v4);

    v6 = -[PKPassGroupStackView _groupViewAtIndexWhileEnsuringVisible:withContentMode:](self, "_groupViewAtIndexWhileEnsuringVisible:withContentMode:", self->_previousIndexOfReorderedGroup - 1, v5);
  }
}

- (unint64_t)_indexOfReorderedGroupView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t result;
  unint64_t separatorIndex;

  -[PKPassGroupView layer](self->_reorderedGroupView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "position");
  v5 = v4;
  v7 = v6;

  result = -[PKPassGroupStackView _indexForNativePositionInTable:](self, "_indexForNativePositionInTable:", v5, v7);
  separatorIndex = self->_layoutState.groups.separatorIndex;
  if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_previousIndexOfReorderedGroup <= separatorIndex)
    {
      if (result >= separatorIndex)
        return self->_layoutState.groups.separatorIndex;
    }
    else if (result <= separatorIndex + 1)
    {
      return separatorIndex + 1;
    }
  }
  return result;
}

- (void)_reorderPositionChangedForReorderedGroupViewWithVelocity:(CGPoint)a3
{
  unint64_t v4;
  PKPassGroupView *v5;
  id v6;
  void *v7;
  unint64_t previousIndexOfReorderedGroup;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[7];

  v4 = -[PKPassGroupStackView _indexOfReorderedGroupView](self, "_indexOfReorderedGroupView", a3.x, a3.y);
  v5 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", v4);
  if (v4)
  {
    v6 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", v4 - 1);
    objc_msgSend(v6, "frontmostPassView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "contentMode") <= 2)
      objc_msgSend(v7, "setContentMode:", 3);

  }
  if (v5 != self->_reorderedGroupView)
  {
    previousIndexOfReorderedGroup = self->_previousIndexOfReorderedGroup;
    self->_previousIndexOfReorderedGroup = v4;
    -[PKPassGroupStackView _adjustGroupViewsForReordering](self, "_adjustGroupViewsForReordering");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PKPassGroupStackView__reorderPositionChangedForReorderedGroupViewWithVelocity___block_invoke;
    aBlock[3] = &unk_1E3E6E828;
    aBlock[4] = self;
    aBlock[5] = previousIndexOfReorderedGroup;
    aBlock[6] = v4;
    v9 = _Block_copy(aBlock);
    v10 = (void *)MEMORY[0x1A1AE621C]();
    if (previousIndexOfReorderedGroup <= v4)
      -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v9);
    else
      -[PKPassGroupStackView _reverseEnumerateLoadedGroupViews:](self, "_reverseEnumerateLoadedGroupViews:", v9);
    objc_autoreleasePoolPop(v10);
    if (v4 < self->_layoutState.groups.count)
    {
      -[PKPassGroupStackView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "groupStackView:groupDidMoveFromIndex:toIndex:", self, previousIndexOfReorderedGroup, v4);

    }
  }
  -[PKPassGroupStackView _autoscrollIfNecessary](self, "_autoscrollIfNecessary");

}

void __81__PKPassGroupStackView__reorderPositionChangedForReorderedGroupViewWithVelocity___block_invoke(_QWORD *a1, void *a2, unint64_t a3, void *a4)
{
  id v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a4;
  v8 = (_QWORD *)a1[4];
  if ((id)v8[302] != v11)
  {
    v9 = a1[5];
    if (v9 < a3 && a1[6] >= a3)
    {
      v10 = -1;
      goto LABEL_8;
    }
    if (v9 > a3 && a1[6] <= a3)
    {
      v10 = 1;
LABEL_8:
      objc_msgSend(v8, "_animateGroupViewAtIndex:toIndex:withAnchorView:insertAbove:", a3, v10 + a3);
    }
  }

}

- (void)_animateGroupViewForUndo:(id)a3 toIndex:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
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
  PKPassGroupView *v21;
  PKPassGroupView *v22;
  PKPassGroupView *v23;
  PKPassGroupView *loanedGroupView;
  BOOL v25;
  unint64_t v26;
  BOOL v27;
  NSMutableArray *v28;
  NSMutableArray *reorderActions;
  NSMutableArray *v30;
  PKPassGroupView *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *reorderActionTag;
  _QWORD v46[4];
  id v47[2];
  _QWORD aBlock[4];
  PKPassGroupView *v49;
  PKPassGroupView *v50;
  id v51;
  BOOL v52;
  _QWORD v53[2];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  unint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "frontmostPassView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v55 = v9;
    v56 = 2048;
    v57 = a4;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Animate pass: %@ to index %lu", buf, 0x16u);

  }
  -[PKPassGroupView layer](self->_reorderedGroupView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "position");
  v12 = v11;
  v14 = v13;
  -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", self->_reorderedGroupView, self->_initialIndexOfReorderedGroup, 4);
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "size");
  v20 = v19;
  v21 = (PKPassGroupView *)v5;
  v22 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", self->_initialIndexOfReorderedGroup);
  v23 = v22;
  loanedGroupView = self->_loanedGroupView;
  v25 = loanedGroupView == v21 || v22 == loanedGroupView;
  if (!v25 || *((unsigned __int16 *)&self->_layoutState + 32) >= 0x4000u)
  {
    v26 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v22);
    v27 = v26 > -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v21);
    reorderActionTag = (void *)self->_reorderActionTag;
    if (!self->_reorderActions)
    {
      v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      reorderActions = self->_reorderActions;
      self->_reorderActions = v28;

    }
    objc_initWeak((id *)buf, self);
    v30 = self->_reorderActions;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke;
    aBlock[3] = &unk_1E3E625C0;
    objc_copyWeak(&v51, (id *)buf);
    v52 = v27;
    v31 = v21;
    v49 = v31;
    v50 = v23;
    v32 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](v30, "addObject:", v32);

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAdditive:", 1);
    objc_msgSend(v33, "setMass:", 1.0);
    objc_msgSend(v33, "setStiffness:", 100.0);
    objc_msgSend(v33, "setDamping:", 200.0);
    v34 = v18 - v20 + -50.0;
    objc_msgSend(v33, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v12, v14, v16, v34, v16, v18);
    v35 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v33, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v33, "durationForEpsilon:", 0.001);
    objc_msgSend(v33, "setDuration:");
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAdditive:", 1);
    objc_msgSend(v36, "setMass:", 2.0);
    objc_msgSend(v36, "setStiffness:", 100.0);
    objc_msgSend(v36, "setDamping:", 200.0);
    objc_msgSend(v36, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v16, v34, v16, v18, v16, v34);
    objc_msgSend(v36, "setFillMode:", v35);
    objc_msgSend(v36, "durationForEpsilon:", 0.001);
    v38 = v37;
    objc_msgSend(v36, "setBeginTime:", 0.17);
    objc_msgSend(v36, "setDuration:", v38);
    PKMagicCurve();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTimingFunction:", v39);

    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDuration:", v38 + 0.17);
    v53[0] = v33;
    v53[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAnimations:", v41);

    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_2;
    v46[3] = &unk_1E3E66D38;
    objc_copyWeak(v47, (id *)buf);
    v47[1] = reorderActionTag;
    objc_msgSend(v40, "pkui_setDidStartHandler:", v46);
    v42 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v40);
    objc_msgSend(v10, "setPosition:", v16, v18);
    -[PKPassGroupStackView delegate](self, "delegate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "groupStackView:groupDidMoveFromIndex:toIndex:", self, -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v31), a4);

    -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self, "layoutContentForCurrentPresentationState:", 1);
    objc_destroyWeak(v47);

    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)buf);
  }

}

void __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = (void *)WeakRetained[323];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v3, "insertSubview:aboveSubview:", v4, v5);
    else
      objc_msgSend(v3, "insertSubview:belowSubview:", v4, v5);
    WeakRetained = v6;
  }

}

void __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4[2];

  v2 = dispatch_time(0, 170000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_3;
  v3[3] = &unk_1E3E66D38;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __57__PKPassGroupStackView__animateGroupViewForUndo_toIndex___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void (**v3)(_QWORD);
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[312] == *(id *)(a1 + 40))
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[311], "firstObject");
    v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v4[311], "removeObjectAtIndex:", 0);
      v3[2](v3);
      if (((_BYTE)v4[310] & 1) == 0 && !objc_msgSend(v4[311], "count"))
        objc_msgSend(v4, "_arrangeGroups");
    }

    WeakRetained = v4;
  }

}

- (double)_setupSpringFactoryForPileAnimations:(id)a3 withMaximumAcceleration:(double)a4 reverse:(BOOL)a5
{
  id v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  PKPassGroupView *v23;
  PKPassGroupView *v24;
  _QWORD v26[4];
  id v27;
  PKPassGroupView *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;

  v8 = a3;
  v9 = 0.0;
  if (v8 && -[NSMutableArray count](self->_passPileViews, "count"))
  {
    v10 = -[PKPassGroupStackView _maximumNumberOfVisiblePilePasses](self, "_maximumNumberOfVisiblePilePasses");
    v11 = -[NSMutableArray count](self->_passPileViews, "count");
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    -[NSMutableArray subarrayWithRange:](self->_passPileViews, "subarrayWithRange:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (v11 > v10)
    {
      -[NSMutableArray subarrayWithRange:](self->_passPileViews, "subarrayWithRange:", v10 - 1, v11 - v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!a5)
    {
      objc_msgSend(v13, "reverseObjectEnumerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }
    v17 = objc_msgSend(v13, "count");
    if (!v17)
      goto LABEL_29;
    if (a4 == 0.0)
    {
      v18 = v17 - 1;
      if (v17 != 1)
      {
        v19 = 0.18 / (double)v18;
        if (v19 > 0.03)
          v19 = 0.03;
        goto LABEL_22;
      }
      v19 = 0.03;
    }
    else
    {
      v18 = v17 - 1;
      if (v17 != 1)
      {
        if (0.6 / (double)(v18 * v17) >= a4)
          v19 = a4;
        else
          v19 = 0.6 / (double)(v18 * v17);
LABEL_22:
        v20 = dbl_19DF16620[a4 != 0.0] / (double)(v18 * v17);
        goto LABEL_23;
      }
      v19 = a4;
    }
    v20 = a4;
LABEL_23:
    if (v20 < a4)
      a4 = v20;
    v21 = v19 * (double)v18;
    v22 = (v18 * v17) >> 1;
    if (a4 == 0.0)
      v9 = v21;
    else
      v9 = v19 + (double)v22 * a4;
    v23 = self->_modallyPresentedGroupView;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__PKPassGroupStackView__setupSpringFactoryForPileAnimations_withMaximumAcceleration_reverse___block_invoke;
    v26[3] = &unk_1E3E6E850;
    v30 = v19;
    v31 = a4;
    v27 = v13;
    v28 = v23;
    v33 = a5;
    v29 = v14;
    v32 = v9;
    v24 = v23;
    objc_msgSend(v8, "setAnimationDelayHandler:", v26);

LABEL_29:
  }

  return v9;
}

double __93__PKPassGroupStackView__setupSpringFactoryForPileAnimations_withMaximumAcceleration_reverse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;

  v5 = a2;
  v6 = 0.0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("position")))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", v5);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(id *)(a1 + 40) == v5
        || *(_BYTE *)(a1 + 80)
        && objc_msgSend(*(id *)(a1 + 48), "indexOfObjectIdenticalTo:", v5) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = *(double *)(a1 + 72);
      }
    }
    else
    {
      v8 = *(double *)(a1 + 56);
      v9 = *(double *)(a1 + 64);
      if (v9 == 0.0)
        v6 = v8 * (double)v7;
      else
        v6 = v8 + (double)((v7 + v7 * v7) >> 1) * v9;
    }
  }

  return v6;
}

- (double)_setupSpringFactoryForExternalToTableAnimations:(id)a3
{
  id v4;
  unint64_t externalToTableTransitionModalGroupIndex;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t separatorIndex;
  id v12;
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
  double v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  double v28;
  double v29;
  _QWORD v31[4];
  id v32;
  double v33;
  double v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  unint64_t v38;

  v4 = a3;
  if (v4)
  {
    externalToTableTransitionModalGroupIndex = self->_layoutState.externalToTableTransitionModalGroupIndex;
    v6 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", externalToTableTransitionModalGroupIndex);
    objc_msgSend(v6, "frontmostPassView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "style");

    separatorIndex = self->_layoutState.groups.separatorIndex;
    if (separatorIndex != 0x7FFFFFFFFFFFFFFFLL && separatorIndex == externalToTableTransitionModalGroupIndex)
    {
      v18 = 800.0;
    }
    else
    {
      v12 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", externalToTableTransitionModalGroupIndex + 1);
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "position");
        v16 = v15;

        -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", externalToTableTransitionModalGroupIndex + 1, 4);
        v18 = v16 - v17;
      }
      else
      {
        v18 = 800.0;
      }

    }
    v20 = fmin(fmax((v18 + -50.0) / 750.0, 0.0), 1.0);
    if (v9)
      v21 = v20 * 0.08 + (1.0 - v20) * 0.28 + 0.1;
    else
      v21 = v20 * 0.08 + (1.0 - v20) * 0.28;
    v22 = v20 * 0.8 + (1.0 - v20) * 0.6;
    objc_msgSend(v4, "stiffness");
    objc_msgSend(v4, "setStiffness:", v23 * v22);
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke;
    v36[3] = &unk_1E3E6E878;
    v38 = externalToTableTransitionModalGroupIndex;
    v26 = v24;
    v37 = v26;
    -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v36);
    v27 = objc_msgSend(v26, "count");
    if (v27)
    {
      v28 = (double)(unint64_t)(v27 - 1);
      if (v27 == 1)
      {
        v29 = 0.03;
      }
      else if (0.18 / v28 <= 0.03)
      {
        v29 = 0.18 / v28;
      }
      else
      {
        v29 = 0.03;
      }
      v31[0] = v25;
      v31[1] = 3221225472;
      v31[2] = __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke_2;
      v31[3] = &unk_1E3E6E8A0;
      v33 = v21;
      v32 = v26;
      v34 = v29;
      v35 = 0;
      objc_msgSend(v4, "setAnimationDelayHandler:", v31);
      v21 = v21 + v29 * v28;

    }
    v19 = v21 + 0.1;

  }
  else
  {
    v19 = 0.0;
  }

  return v19;
}

uint64_t __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (*(_QWORD *)(result + 40) < a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

double __72__PKPassGroupStackView__setupSpringFactoryForExternalToTableAnimations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;

  v5 = a2;
  v6 = 0.0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("position")))
  {
    v6 = *(double *)(a1 + 40);
    v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", v5);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = *(double *)(a1 + 48);
      v9 = *(double *)(a1 + 56);
      if (v9 == 0.0)
        v10 = v8 * (double)v7;
      else
        v10 = v8 + (double)((v7 + v7 * v7) >> 1) * v9;
      v6 = v6 + v10;
    }
  }

  return v6;
}

- (void)_setupSpringFactoryForTableToExternalAnimations:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PKPassGroupView *modallyPresentedGroupView;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t modalGroupIndex;
  BOOL v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  double v21;
  _QWORD v22[4];
  id v23;
  double v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  if (!v4)
    goto LABEL_27;
  -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", self->_modalGroupIndex, 4);
  v6 = v5;
  -[PKPassGroupStackView _yPositionForGroupAtIndex:forState:](self, "_yPositionForGroupAtIndex:forState:", self->_modalGroupIndex, 7);
  v8 = v7 - v6;
  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  if (modallyPresentedGroupView)
    v10 = self->_modalGroupIndex != 0x7FFFFFFFFFFFFFFFLL;
  else
    v10 = 0;
  v11 = v8 <= -75.0 && v10;
  -[PKPassGroupView frontmostPassView](modallyPresentedGroupView, "frontmostPassView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "style");

  modalGroupIndex = self->_modalGroupIndex;
  v16 = modalGroupIndex == 0x7FFFFFFFFFFFFFFFLL || v14 == 6;
  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    if (v11)
    {
LABEL_19:
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke;
      v25[3] = &unk_1E3E6E5F0;
      v25[4] = self;
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v26 = v18;
      -[PKPassGroupStackView _reverseEnumerateLoadedGroupViews:](self, "_reverseEnumerateLoadedGroupViews:", v25);

      goto LABEL_20;
    }
  }
  else if (self->_layoutState.groups.count + ~modalGroupIndex < 6 && v11)
  {
    goto LABEL_19;
  }
  v18 = 0;
LABEL_20:
  v20 = objc_msgSend(v18, "count");
  if (v20)
  {
    if (v20 == 1)
    {
      v21 = 0.016;
    }
    else
    {
      v21 = 0.016;
      if (0.12 / (double)(unint64_t)(v20 - 1) <= 0.016)
        v21 = 0.12 / (double)(unint64_t)(v20 - 1);
    }
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke_2;
    v22[3] = &unk_1E3E6E8C8;
    v23 = v18;
    v24 = v21;
    objc_msgSend(v4, "setAnimationDelayHandler:", v22);

  }
LABEL_27:

}

uint64_t __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 2088) < a3)
    return objc_msgSend(*(id *)(result + 40), "addObject:", a2);
  return result;
}

double __72__PKPassGroupStackView__setupSpringFactoryForTableToExternalAnimations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  unint64_t v9;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("position")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = 0.0;
    if (v7)
    {
      v9 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        v8 = *(double *)(a1 + 40) * (double)v9;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("transform")))
  {
    v8 = 0.13;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)_frontmostPastViewForGroupIndex:(unint64_t)a3
{
  void *v3;
  id v4;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v4 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:");
    objc_msgSend(v4, "frontmostPassView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)_isModalPresentationAllowed
{
  return !-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
}

- (BOOL)_isModalPresentationAllowedForSingleGroup
{
  if ((*((_BYTE *)&self->_layoutState + 24) & 1) != 0)
    return 1;
  if ((*((_BYTE *)&self->_layoutState.groups + 16) & 1) != 0)
    return ((*((unsigned __int16 *)&self->_layoutState + 32) >> 1) & 1)
         + ((*((unsigned __int16 *)&self->_layoutState + 32) >> 2) & 1u) > 1;
  return 0;
}

- (id)_firstHeaderContext
{
  PKPGSVSectionHeaderContext *passHeaderContext;

  passHeaderContext = self->_passHeaderContext;
  if (self->_paymentHeaderContext)
    passHeaderContext = self->_paymentHeaderContext;
  return passHeaderContext;
}

- (id)_createSortedGroupViewIndexesWithMap:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  NSMutableDictionary *groupViewsByGroupID;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableDictionary count](self->_groupViewsByGroupID, "count"));
  v6 = (void *)MEMORY[0x1A1AE621C]();
  if (a3)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  else
    v7 = 0;
  groupViewsByGroupID = self->_groupViewsByGroupID;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__PKPassGroupStackView__createSortedGroupViewIndexesWithMap___block_invoke;
  v15[3] = &unk_1E3E6E8F0;
  v15[4] = self;
  v9 = v5;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](groupViewsByGroupID, "enumerateKeysAndObjectsUsingBlock:", v15);
  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_139_0);
  if (a3)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    v12 = *a3;
    *a3 = v11;

  }
  objc_autoreleasePoolPop(v6);
  v13 = (void *)objc_msgSend(v9, "copy");

  return v13;
}

void __61__PKPassGroupStackView__createSortedGroupViewIndexesWithMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_indexOfGroupView:", v8);
  v5 = v8;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v7 = *(void **)(a1 + 48);
    if (v7)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

    v5 = v8;
  }

}

uint64_t __61__PKPassGroupStackView__createSortedGroupViewIndexesWithMap___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_reverseEnumerateLoadedGroupViews:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, id);
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, id))a3;
  v19 = 0;
  v5 = -[PKPassGroupStackView _createSortedGroupViewIndexesWithMap:](self, "_createSortedGroupViewIndexesWithMap:", &v19);
  v6 = (void *)MEMORY[0x1A1AE621C]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "reverseObjectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          __break(1u);
        v14 = (void *)v13;
        v4[2](v4, v13, objc_msgSend(v12, "unsignedIntegerValue"), v5);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(v6);
}

- (id)_groupViewWithGroupID:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groupViewsByGroupID, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isIngestingPass
{
  return self->_presentationState == 6;
}

- (void)_disableScrollingAndNormalizeContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  _BOOL4 v23;
  int v24;

  -[PKPassGroupStackView setScrollEnabled:](self, "setScrollEnabled:", 0);
  -[PKPassGroupStackView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPassGroupStackView contentInset](self, "contentInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PKPassGroupStackView contentSize](self, "contentSize");
  v20 = fmin(fmax(v4, -v14), v18 + v19 - v8);
  v22 = fmin(fmax(v6, -v12), v16 + v21 - v10);
  v23 = v6 != v22 || v4 != v20;
  v24 = -[PKPassGroupStackView isDecelerating](self, "isDecelerating");
  if (v23 || v24)
  {
    -[PKPassGroupStackView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v20, v22);
    if (v23)
      -[PKPassGroupStackView _layoutContentFromOffset:toOffset:animated:](self, "_layoutContentFromOffset:toOffset:animated:", 1, v4, v6, v20, v22);
  }
}

- (void)_setDefaultPaymentPassFromGroupView:(id)a3 reorderedGroupView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKPaymentService *paymentService;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  char v28;
  _QWORD v29[5];
  id v30;

  v6 = a4;
  objc_msgSend(a3, "frontmostPassView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "supportsBarcodePayment");
  if (objc_msgSend(v9, "supportsDefaultCardSelection") && !objc_msgSend(v9, "contactlessActivationState"))
  {
    -[PKPaymentService defaultPaymentPassUniqueIdentifier](self->_paymentService, "defaultPaymentPassUniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    paymentService = self->_paymentService;
    objc_msgSend(v9, "uniqueID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService setDefaultPaymentPassUniqueIdentifier:](paymentService, "setDefaultPaymentPassUniqueIdentifier:", v21);

    -[PKPassGroupStackView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    v22 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_2;
    block[3] = &unk_1E3E6CF10;
    block[4] = self;
    v28 = v10;
    v25 = v9;
    v26 = v19;
    v27 = v6;
    v11 = v19;
    dispatch_after(v22, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if ((v10 & 1) != 0)
        PKLocalizedAquamanString(CFSTR("DEFAULT_ACCOUNT_CHANGED_FROM_WALLET_NOT_AVAILABLE_TITLE_FORMAT"));
      else
        PKLocalizedPaymentString(CFSTR("DEFAULT_CARD_CHANGED_FROM_WALLET_NOT_AVAILABLE_TITLE_FORMAT"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("DEFAULT_CARD_CHANGED_FROM_WALLET_MESSAGE_NOT_AVAILABLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke;
      v29[3] = &unk_1E3E61D90;
      v29[4] = self;
      v30 = v6;
      objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "addAction:", v18);
      objc_msgSend(v11, "presentViewController:animated:completion:", v15, 1, 0);

    }
  }

}

uint64_t __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_undoUserReorderWithReorderedGroupView:", *(_QWORD *)(a1 + 40));
}

void __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  id v22;

  v2 = *(_BYTE **)(a1 + 32);
  if ((v2[2480] & 1) != 0)
  {
    objc_msgSend(v2, "setUserInteractionEnabled:", 1);
    return;
  }
  objc_msgSend(v2, "pkui_viewControllerFromResponderChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (*(_BYTE *)(a1 + 64))
      PKLocalizedAquamanString(CFSTR("DEFAULT_ACCOUNT_CHANGED_FROM_WALLET_TITLE_FORMAT"));
    else
      PKLocalizedPaymentString(CFSTR("DEFAULT_CARD_CHANGED_FROM_WALLET_TITLE_FORMAT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKStringWithValidatedFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "isPrivateLabel", v18))
    {
      v6 = CFSTR("DEFAULT_CARD_CHANGED_FROM_WALLET_MESSAGE_PRIVATE_LABEL");
    }
    else
    {
      if (*(_BYTE *)(a1 + 64))
      {
        PKLocalizedAquamanString(CFSTR("DEFAULT_ACCOUNT_CHANGED_FROM_WALLET_MESSAGE"));
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addAction:", v12);
        v13 = objc_msgSend(*(id *)(a1 + 40), "isPrivateLabel");
        v14 = MEMORY[0x1E0C809B0];
        if (v13)
        {
          v15 = (void *)MEMORY[0x1E0DC3448];
          PKLocalizedString(CFSTR("CANCEL"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v14;
          v20[1] = 3221225472;
          v20[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_3;
          v20[3] = &unk_1E3E61798;
          v20[4] = *(_QWORD *)(a1 + 32);
          v21 = *(id *)(a1 + 48);
          v22 = *(id *)(a1 + 56);
          objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addAction:", v17);
        }
        v19[0] = v14;
        v19[1] = 3221225472;
        v19[2] = __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_4;
        v19[3] = &unk_1E3E612E8;
        v19[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v3, "presentViewController:animated:completion:", v9, 1, v19);

        goto LABEL_17;
      }
      v6 = CFSTR("DEFAULT_CARD_CHANGED_FROM_WALLET_MESSAGE");
    }
    PKLocalizedPaymentString(&v6->isa);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
LABEL_17:

}

uint64_t __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2528), "setDefaultPaymentPassUniqueIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_undoUserReorderWithReorderedGroupView:", *(_QWORD *)(a1 + 48));
}

uint64_t __79__PKPassGroupStackView__setDefaultPaymentPassFromGroupView_reorderedGroupView___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
}

- (void)_undoUserReorderWithReorderedGroupView:(id)a3
{
  PKPassGroupView *v4;
  void *v5;
  PKPassGroupView *reorderedGroupView;
  PKPassGroupView *v7;
  PKPassGroupView *v8;
  id v9;

  v4 = (PKPassGroupView *)a3;
  -[PKPassGroupStackView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupStackViewDidBeginReordering:", self);

  reorderedGroupView = self->_reorderedGroupView;
  self->_reorderedGroupView = v4;
  v7 = v4;

  -[PKPassGroupStackView _animateGroupViewForUndo:toIndex:](self, "_animateGroupViewForUndo:toIndex:", v7, self->_initialIndexOfReorderedGroup);
  v8 = self->_reorderedGroupView;
  self->_reorderedGroupView = 0;

  -[PKPassGroupStackView delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupStackViewDidEndReordering:", self);

}

- (id)_headerContextForPassType:(unint64_t)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &OBJC_IVAR___PKPassGroupStackView__paymentHeaderContext;
  }
  else
  {
    if (a3)
      return 0;
    v3 = &OBJC_IVAR___PKPassGroupStackView__passHeaderContext;
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v3);
}

- (void)_suspendTransition
{
  id transitionCanceller;
  NSMutableArray *v4;
  NSMutableArray *suspendedTransitionCompletionHandlers;
  NSMutableArray *v6;

  if (self->_transitionCanceller)
  {
    if (self->_hasSuspendedTransition)
      -[PKPassGroupStackView _cancelSuspendedTransition](self, "_cancelSuspendedTransition");
    self->_hasSuspendedTransition = 1;
    (*((void (**)(void))self->_transitionCanceller + 2))();
    transitionCanceller = self->_transitionCanceller;
    self->_transitionCanceller = 0;

    v4 = self->_transitionCompletionHandlers;
    objc_storeStrong((id *)&self->_transitionCompletionHandlers, self->_suspendedTransitionCompletionHandlers);
    suspendedTransitionCompletionHandlers = self->_suspendedTransitionCompletionHandlers;
    self->_suspendedTransitionCompletionHandlers = v4;
    v6 = v4;

    self->_suspendedNextState = self->_nextState;
  }
}

- (void)_resumeSuspendedTransition
{
  NSMutableArray *v3;
  NSMutableArray *suspendedTransitionCompletionHandlers;
  NSMutableArray *v5;

  if (self->_hasSuspendedTransition)
  {
    if (self->_transitionCanceller)
      -[PKPassGroupStackView _cancelTransition](self, "_cancelTransition");
    v3 = self->_transitionCompletionHandlers;
    objc_storeStrong((id *)&self->_transitionCompletionHandlers, self->_suspendedTransitionCompletionHandlers);
    suspendedTransitionCompletionHandlers = self->_suspendedTransitionCompletionHandlers;
    self->_suspendedTransitionCompletionHandlers = v3;
    v5 = v3;

    self->_nextState = self->_suspendedNextState;
  }
}

- (void)_cancelSuspendedTransition
{
  if (self->_hasSuspendedTransition)
  {
    self->_hasSuspendedTransition = 0;
    -[PKPassGroupStackView _executeCompletionHandlers:cancelled:](self, "_executeCompletionHandlers:cancelled:", self->_suspendedTransitionCompletionHandlers, 1);
  }
}

- (void)paymentDeviceDidBecomeAvailable
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PKPassGroupStackView_paymentDeviceDidBecomeAvailable__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __55__PKPassGroupStackView_paymentDeviceDidBecomeAvailable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:", 0, 0.0);
}

- (void)paymentDeviceDidBecomeUnavailable
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKPassGroupStackView_paymentDeviceDidBecomeUnavailable__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__PKPassGroupStackView_paymentDeviceDidBecomeUnavailable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:", 0, 0.0);
}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPassGroupStackView_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __72__PKPassGroupStackView_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadGroupsForGroupStackView:", *(_QWORD *)(a1 + 32));

}

- (void)groupViewTapped:(id)a3
{
  PKPassGroupView *v4;
  PKPassGroupView *v5;
  int64_t presentationState;
  PKPassGroupView *loanedGroupView;
  BOOL v8;
  void *v9;
  _BOOL4 v10;
  int64_t v11;
  id WeakRetained;
  int v14;
  int v15;
  uint64_t v16;
  PKPassGroupView *v17;

  v4 = (PKPassGroupView *)a3;
  v5 = v4;
  if ((*((_WORD *)&self->_layoutState + 32) & 0x100) == 0 && (*(_BYTE *)&self->_reorderingFlags & 1) == 0)
  {
    presentationState = self->_presentationState;
    if (presentationState != 6)
    {
      if (presentationState != 7
        || ((loanedGroupView = self->_loanedGroupView) != 0 ? (v8 = loanedGroupView == v4) : (v8 = 1), v8))
      {
        v17 = v4;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_animatorsByGroupID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_167);
        v5 = v17;
        if (v17)
        {
          if ((*((_WORD *)&self->_layoutState + 32) & 1) != 0 && (self->_presentationState | 2) == 7)
          {
            objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "pkui_resetSharedRootAuthenticationContext");

            *((_WORD *)&self->_layoutState + 32) = *((_WORD *)&self->_layoutState + 32) & 0xF7FE | 0x800;
            goto LABEL_20;
          }
          v10 = -[PKPassGroupStackView _isModalPresentationAllowed](self, "_isModalPresentationAllowed");
          v5 = v17;
          if (v10)
          {
            v11 = self->_presentationState;
            if (v11 != 7 && v11 != 5)
            {
              if (v11 != 4)
                goto LABEL_22;
              WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
              v14 = objc_msgSend(WeakRetained, "isInField");
              v15 = objc_msgSend(WeakRetained, "supportsExternalPresentation");
              if (v15)
                v16 = 7;
              else
                v16 = 5;
              if (v15 && v14)
              {
                if (-[PKPassGroupStackView canPerformPaymentForGroupAtIndex:](self, "canPerformPaymentForGroupAtIndex:", -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v17)))
                {
                  v16 = 5;
                }
                else
                {
                  v16 = 7;
                }
              }
              -[PKPassGroupStackView _setModalGroupView:](self, "_setModalGroupView:", v17);
              -[PKPassGroupStackView setPresentationState:withContext:animated:completion:](self, "setPresentationState:withContext:animated:completion:", v16, 0, 1, 0);

              goto LABEL_21;
            }
LABEL_20:
            -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 4, 1);
LABEL_21:
            v5 = v17;
          }
        }
      }
    }
  }
LABEL_22:

}

void __40__PKPassGroupStackView_groupViewTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:](a3, 0);
}

- (void)groupView:(id)a3 didUpdatePassView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_passFooterViewVisible)
  {
    objc_msgSend(a4, "pass", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[PKPassFooterView configuration](self->_passFooterView, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", v8))
      -[PKPassGroupStackView _updatePassFooterViewWithContext:](self, "_updatePassFooterViewWithContext:", 0);

  }
}

- (void)groupViewPressed:(id)a3
{
  id v4;
  int64_t v5;

  if (self->_presentationState == 4)
  {
    v4 = a3;
    -[PKPassGroupStackView _unpressGroupView](self, "_unpressGroupView");
    v5 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v4);

    self->_pressedGroupViewIndex = v5;
    -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self, "layoutContentForCurrentPresentationState:", 1);
  }
}

- (void)_unpressGroupView
{
  if (self->_pressedGroupViewIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_pressedGroupViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (self->_presentationState == 4)
      -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self, "layoutContentForCurrentPresentationState:", 1);
  }
}

- (void)groupViewPanDidBegin:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  id v20;

  v5 = a3;
  if (self->_presentationState == 4 && (*(_BYTE *)&self->_reorderingFlags & 1) == 0)
  {
    v20 = v5;
    objc_storeStrong((id *)&self->_reorderedGroupView, a3);
    *(_BYTE *)&self->_reorderingFlags = *(_BYTE *)&self->_reorderingFlags & 0xF0 | 1;
    self->_panningVelocity = (CGPoint)*MEMORY[0x1E0C9D538];
    v6 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v20);
    self->_previousIndexOfReorderedGroup = v6;
    self->_initialIndexOfReorderedGroup = v6;
    -[PKPassGroupStackView _unpressGroupView](self, "_unpressGroupView");
    -[PKPassGroupStackView _adjustGroupViewsForReordering](self, "_adjustGroupViewsForReordering");
    -[PKPassGroupStackView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupStackViewDidBeginReordering:", self);

    -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v20, self->_previousIndexOfReorderedGroup, 4);
    v9 = v8;
    v11 = v10 + -15.0;
    objc_msgSend(v20, "frontmostPassView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loadContentSync");

    objc_msgSend(v12, "setContentMode:", 5);
    objc_msgSend(v20, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("position"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "position");
    objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
    v16 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v15);
    objc_msgSend(v14, "setPosition:", v9, v11);
    -[PKPassGroupStackView superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupStackView convertPoint:toView:](self, "convertPoint:toView:", v17, v9, v11);
    self->_reorderedGroupViewPositionInFrame.x = v18;
    self->_reorderedGroupViewPositionInFrame.y = v19;

    -[PKPassGroupStackView _updateTopContentSeparatorVisibilityAnimated:](self, "_updateTopContentSeparatorVisibilityAnimated:", 1);
    v5 = v20;
  }

}

- (void)groupViewPanDidEnd:(id)a3
{
  PKPassGroupView *v4;
  unint64_t v5;
  PKPassGroupView *reorderedGroupView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int8x16_t v14;
  int8x16_t v15;
  double v16;
  double v17;
  float64x2_t v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id WeakRetained;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  unint64_t initialIndexOfReorderedGroup;
  BOOL v33;
  id v35;
  id v36;
  void *v37;
  void *v38;
  PKPassGroupView *v39;

  v4 = (PKPassGroupView *)a3;
  if (self->_reorderedGroupView == v4)
  {
    v39 = v4;
    v5 = -[PKPassGroupStackView _indexOfReorderedGroupView](self, "_indexOfReorderedGroupView");
    *(_BYTE *)&self->_reorderingFlags &= ~1u;
    reorderedGroupView = self->_reorderedGroupView;
    self->_reorderedGroupView = 0;

    -[PKPassGroupView layer](v39, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPassGroupStackView _recomputeLayoutState](self, "_recomputeLayoutState"))
    {
      -[PKPassGroupStackView _updateContentSizeAndLayout:forceUpdate:](self, "_updateContentSizeAndLayout:forceUpdate:", 1, 1);
      -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v39, v5, 4);
      v9 = v8;
      v11 = v10;
    }
    else
    {
      -[PKPassGroupStackView _positionForGroupView:atIndex:forState:](self, "_positionForGroupView:atIndex:forState:", v39, v5, 4);
      v9 = v12;
      v11 = v13;
      objc_msgSend(v7, "position");
      v16 = *(double *)v14.i64;
      v17 = *(double *)v15.i64;
      if (v11 == *(double *)v15.i64)
      {
        v19 = 0.0;
      }
      else
      {
        *(double *)v14.i64 = v11 - *(double *)v15.i64;
        *(double *)v15.i64 = fmax(vabdd_f64(v11, *(double *)v15.i64), 20.0);
        v18.f64[0] = NAN;
        v18.f64[1] = NAN;
        v19 = self->_panningVelocity.y / *(double *)vbslq_s8((int8x16_t)vnegq_f64(v18), v15, v14).i64;
      }
      v20 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
      objc_msgSend(v20, "setVelocity:", v19);
      objc_msgSend(v20, "springAnimationWithKeyPath:", CFSTR("position"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v16, v17, v9, v11);
      v22 = (id)objc_msgSend(v7, "pkui_addAdditiveAnimation:", v21);

    }
    objc_msgSend(v7, "setPosition:", v9, v11);
    -[PKPassGroupStackView _stopAutoscrollTimer](self, "_stopAutoscrollTimer");
    -[PKPassGroupView frontmostPassView](v39, "frontmostPassView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "passType") == 1)
    {
      if (self->_layoutState.groups.count)
      {
        v25 = 0;
        while (1)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
          objc_msgSend(WeakRetained, "groupAtIndex:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "passAtIndex:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "passType") == 1
            && objc_msgSend(v28, "style") == 6
            && !objc_msgSend(v28, "contactlessActivationState"))
          {
            break;
          }

          if (self->_layoutState.groups.count <= ++v25)
            goto LABEL_15;
        }

        v29 = 1;
      }
      else
      {
LABEL_15:
        v29 = 0;
      }
      v30 = objc_loadWeakRetained((id *)&self->_datasource);
      v31 = objc_msgSend(v30, "indexOfSeparationGroup");

      if (v29)
      {
        initialIndexOfReorderedGroup = self->_initialIndexOfReorderedGroup;
        v33 = v5 == v31 || initialIndexOfReorderedGroup == v31;
        if (v33 && initialIndexOfReorderedGroup != v5)
        {
          v35 = objc_loadWeakRetained((id *)&self->_datasource);
          v36 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", objc_msgSend(v35, "indexOfSeparationGroup"));

          objc_msgSend(v36, "frontmostPassView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setContentMode:", 5);

          -[PKPassGroupStackView _setDefaultPaymentPassFromGroupView:reorderedGroupView:](self, "_setDefaultPaymentPassFromGroupView:reorderedGroupView:", v36, v39);
        }
      }
    }
    if (!-[NSMutableArray count](self->_reorderActions, "count"))
      -[PKPassGroupStackView _arrangeGroups](self, "_arrangeGroups");
    -[PKPassGroupStackView delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "groupStackViewDidEndReordering:", self);

    -[PKPassGroupStackView _updateTopContentSeparatorVisibilityAnimated:](self, "_updateTopContentSeparatorVisibilityAnimated:", 1);
    -[PKPassGroupStackView _updatePausedState](self, "_updatePausedState");

    v4 = v39;
  }

}

- (BOOL)groupViewShouldAllowPanning:(id)a3
{
  id v4;
  void *v5;
  unint64_t count;
  unint64_t v7;
  unint64_t separatorIndex;
  BOOL v9;

  v4 = a3;
  -[PKPassGroupStackView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v5, "groupStackViewShouldAllowReordering:", self))
  {
LABEL_10:
    v9 = 0;
    goto LABEL_12;
  }
  count = self->_layoutState.groups.count;
  if (self->_layoutState.groups.separatorIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v4);
    separatorIndex = self->_layoutState.groups.separatorIndex;
    if (v7 <= separatorIndex)
      count = separatorIndex + 1;
    else
      count += ~separatorIndex;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_reorderingFlags & 1) == 0 && count >= 2)
  {
    if (!self->_reorderedGroupView)
    {
      v9 = self->_presentationState == 4;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_12:

  return v9;
}

- (void)groupView:(id)a3 panned:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  PKPassGroupView *v9;
  char reorderingFlags;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  double v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  PKPassGroupView *v25;
  CGRect v26;
  CGRect v27;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v9 = (PKPassGroupView *)a3;
  reorderingFlags = (char)self->_reorderingFlags;
  if ((reorderingFlags & 1) != 0 && self->_reorderedGroupView == v9)
  {
    v12 = self->_reorderedGroupViewPositionInFrame.x;
    v11 = self->_reorderedGroupViewPositionInFrame.y;
    v13 = (reorderingFlags & 4) == 0 && y < 0.0;
    if (v13)
      reorderingFlags |= 4u;
    v14 = (reorderingFlags & 8) == 0 && y > 0.0;
    if (v14)
      reorderingFlags |= 8u;
    if (v13 || v14)
      *(_BYTE *)&self->_reorderingFlags = reorderingFlags;
    v15 = v7 + v11;
    v16 = reorderingFlags & 0xA;
    v25 = v9;
    if (v16 == 8)
    {
      *(_BYTE *)&self->_reorderingFlags = reorderingFlags | 2;
      v15 = v15 + 15.0;
      self->_reorderedGroupViewPositionInFrame.y = self->_reorderedGroupViewPositionInFrame.y + 15.0;
    }
    -[PKPassGroupStackView frame](self, "frame");
    if (v15 >= CGRectGetMaxY(v26) + -55.0)
    {
      -[PKPassGroupStackView frame](self, "frame");
      v15 = CGRectGetMaxY(v27) + -55.0;
    }
    -[PKPassGroupStackView superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupStackView convertPoint:fromView:](self, "convertPoint:fromView:", v17, v12, v15);
    v19 = v18;
    v21 = v20;

    -[PKPassGroupView layer](self->_reorderedGroupView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == 8)
    {
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("position"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "position");
      objc_msgSend(v23, "pkui_updateForAdditiveAnimationFromPoint:toPoint:");
      v24 = (id)objc_msgSend(v22, "pkui_addAdditiveAnimation:", v23);

    }
    objc_msgSend(v22, "setPosition:", v19, v21);
    self->_panningVelocity.x = x;
    self->_panningVelocity.y = y;
    -[PKPassGroupStackView _updateTopContentSeparatorVisibilityAnimated:](self, "_updateTopContentSeparatorVisibilityAnimated:", 0);
    if (self->_autoscrollTimer)
      -[PKPassGroupStackView _autoscrollIfNecessary](self, "_autoscrollIfNecessary");
    else
      -[PKPassGroupStackView _reorderPositionChangedForReorderedGroupViewWithVelocity:](self, "_reorderPositionChangedForReorderedGroupViewWithVelocity:", x, y);

    v9 = v25;
  }

}

- (void)reloadSuppressedContentForGroupView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "frontmostPassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "suppressedContent");

  v7 = -[PKPassGroupStackView groupViewPassesSuppressedContent:](self, "groupViewPassesSuppressedContent:", v4);
  if (v7 != v6)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PKPassGroupStackView_reloadSuppressedContentForGroupView___block_invoke;
    v10[3] = &unk_1E3E62010;
    v11 = v4;
    v12 = v8;
    objc_msgSend(v9, "pkui_animateUsingOptions:animations:completion:", 0, v10, 0);

  }
}

void __60__PKPassGroupStackView_reloadSuppressedContentForGroupView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "frontmostPassView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuppressedContent:", *(_QWORD *)(a1 + 40));

}

- (int64_t)groupViewContentModeForFrontmostPassWhenPiled:(id)a3 withDefaultContentMode:(int64_t)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;

  objc_msgSend(a3, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupStackView _separatorGroup](self, "_separatorGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    a4 = 4;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
    objc_msgSend(WeakRetained, "groupAtIndex:", -[PKPassGroupStackView _lastIndex](self, "_lastIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v9)
      a4 = 4;

  }
  return a4;
}

- (void)groupView:(id)a3 deleteButtonPressedForPass:(id)a4
{
  id v5;
  PKPassDeleteAnimationController *v6;
  void *v7;
  PKPassDeleteAnimationController *v8;
  PKPassDeleteAnimationController *deleteAnimationController;
  id v10;

  if ((*((_WORD *)&self->_layoutState + 32) & 0x100) == 0)
  {
    *((_WORD *)&self->_layoutState + 32) |= 0x100u;
    v5 = a3;
    -[PKPassGroupStackView _updatePassFooterViewWithContext:](self, "_updatePassFooterViewWithContext:", 0);
    v6 = [PKPassDeleteAnimationController alloc];
    objc_msgSend(v5, "frontmostPassView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPassDeleteAnimationController initWithPassView:groupView:](v6, "initWithPassView:groupView:", v7, v5);

    deleteAnimationController = self->_deleteAnimationController;
    self->_deleteAnimationController = v8;

    -[PKPassDeleteAnimationController setDelegate:](self->_deleteAnimationController, "setDelegate:", self);
    -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPassDeleteAnimationController showInViewController:](self->_deleteAnimationController, "showInViewController:", v10);
    -[PKPassGroupStackView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);

  }
}

- (BOOL)groupView:(id)a3 deleteButtonEnabledForPass:(id)a4
{
  return 1;
}

- (void)groupViewDidUpdatePageControlVisibility:(id)a3
{
  PKPassGroupView *v4;
  PKPassGroupView *v5;

  v4 = (PKPassGroupView *)a3;
  if (self->_modallyPresentedGroupView == v4 && (self->_presentationState | 2) == 7)
  {
    v5 = v4;
    -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self, "layoutContentForCurrentPresentationState:", 1);
    v4 = v5;
  }

}

- (void)groupViewExpandButtonTapped:(id)a3
{
  PKPassGroupView *v4;
  int64_t presentationState;
  char v7;
  PKPassGroupView *v8;
  PKPassGroupView *v9;

  v4 = (PKPassGroupView *)a3;
  presentationState = self->_presentationState;
  if (presentationState == 7 || presentationState == 5)
  {
    v7 = 0;
  }
  else
  {
    if (presentationState != 4)
      goto LABEL_12;
    v8 = v4;
    v7 = !-[PKPassGroupStackView isTableModalPresentation](self, "isTableModalPresentation");
    v4 = v8;
  }
  if (self->_modallyPresentedGroupView == v4 && (v7 & 1) == 0)
  {
    v9 = v4;
    -[PKPassFooterView showFullScreenBarcode](self->_passFooterView, "showFullScreenBarcode");
    v4 = v9;
  }
LABEL_12:

}

- (void)passFooterViewDidChangePhysicalButtonRequirement:(id)a3
{
  -[PKPassGroupStackView passFooterViewDidChangePhysicalButtonRequirement:withContext:](self, "passFooterViewDidChangePhysicalButtonRequirement:withContext:", a3, 0);
}

- (void)passFooterViewDidChangePhysicalButtonRequirement:(id)a3 withContext:(id)a4
{
  id v6;
  __int16 v7;
  _WORD *v8;
  __int16 v9;
  PKPassFooterView *v10;

  v10 = (PKPassFooterView *)a3;
  v6 = a4;
  if (-[PKPassGroupStackView isPresentingPassViewFront](self, "isPresentingPassViewFront")
    && self->_passFooterView == v10)
  {
    if (-[PKPassFooterView isPhysicalButtonRequired](v10, "isPhysicalButtonRequired"))
    {
      v8 = (_WORD *)((char *)&self->_layoutState + 64);
      v7 = *((_WORD *)&self->_layoutState + 32);
      if (self->_passFooterViewVisible == ((v7 & 0x200) == 0))
      {
        if (self->_passFooterViewVisible)
          v9 = 1536;
        else
          v9 = 1024;
        goto LABEL_10;
      }
    }
    else
    {
      v8 = (_WORD *)((char *)&self->_layoutState + 64);
      v7 = *((_WORD *)&self->_layoutState + 32);
      if ((v7 & 0x200) != 0)
      {
        v9 = 1024;
LABEL_10:
        *v8 = v9 | v7 & 0xF9FF;
        -[PKPassGroupStackView setPresentationState:withContext:animated:completion:](self, "setPresentationState:withContext:animated:completion:", 5, v6, 1, 0);
        *v8 &= ~0x400u;
      }
    }
  }

}

- (void)passFooterViewDidChangeCoachingState:(id)a3
{
  if (self->_passFooterView == a3)
    -[PKPassGroupStackView _updateCoachingState](self, "_updateCoachingState");
}

- (BOOL)isPassFooterViewInGroup:(id)a3
{
  void *v3;
  BOOL v4;

  -[PKPassGroupView group](self->_modallyPresentedGroupView, "group", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "passCount") > 1;

  return v4;
}

- (unint64_t)suppressedContentForPassFooter:(id)a3
{
  void *v3;
  unint64_t v4;

  -[PKPassGroupStackView delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suppressedContent");

  return v4;
}

- (void)passFooterViewDidChangePileSuppressionRequirement:(id)a3
{
  -[PKPassGroupStackView setPilingMode:](self, "setPilingMode:", objc_msgSend(a3, "requestPileSuppression"));
}

- (void)passFooterViewDidSucceedAtAuthorization:(id)a3
{
  PKPassGroupView *modallyPresentedGroupView;
  void *v5;
  void *v6;

  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  objc_msgSend(a3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupView setPassViewExpanded:forPass:animated:](modallyPresentedGroupView, "setPassViewExpanded:forPass:animated:", 1, v6, 1);

  -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");
}

- (void)passFooterViewDidEndAuthorization:(id)a3
{
  PKPassGroupView *modallyPresentedGroupView;
  void *v5;
  void *v6;

  modallyPresentedGroupView = self->_modallyPresentedGroupView;
  objc_msgSend(a3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupView setPassViewExpanded:forPass:animated:](modallyPresentedGroupView, "setPassViewExpanded:forPass:animated:", 0, v6, 1);

  -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");
}

- (void)deleteAnimationControllerWillBeginDeleteAnimation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "passView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "style");

  if (v6 == 6)
  {
    objc_msgSend(v13, "groupView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPassGroupStackView _indexOfGroupView:](self, "_indexOfGroupView:", v7);

    if (v8)
    {
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", v8 - 1);
        objc_msgSend(v9, "frontmostPassView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "contentMode");
        if (v11 <= 4)
          v12 = 4;
        else
          v12 = v11;
        objc_msgSend(v10, "setContentMode:", v12);

      }
    }
  }

}

- (void)deleteAnimationController:(id)a3 didComplete:(BOOL)a4
{
  _BOOL4 v4;
  PKPassDeleteAnimationController *v6;
  PKPassDeleteAnimationController *deleteAnimationController;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = self->_deleteAnimationController;
  deleteAnimationController = self->_deleteAnimationController;
  self->_deleteAnimationController = 0;

  *((_WORD *)&self->_layoutState + 32) &= ~0x100u;
  -[PKPassGroupStackView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  if (v4)
  {
    if (self->_presentationState == 4
      && -[PKPassGroupStackView _shouldTablePresentationScroll](self, "_shouldTablePresentationScroll"))
    {
      -[PKPassGroupStackView setScrollEnabled:](self, "setScrollEnabled:", 1);
    }
    -[PKPassGroupStackView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupStackView:deleteConfirmedForPass:", self, v10);

  }
  -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");

}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  unint64_t modalGroupIndex;
  id v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];

  v6 = a3;
  objc_msgSend(a4, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupView group](self->_modallyPresentedGroupView, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || ((objc_msgSend(v6, "uniqueID"),
         v9 = (void *)objc_claimAutoreleasedReturnValue(),
         v10 = objc_msgSend(v8, "indexForPassUniqueID:", v9),
         v9,
         v10 != 0x7FFFFFFFFFFFFFFFLL)
      ? (v11 = v7 == 0)
      : (v11 = 1),
        v11 || (*((_WORD *)&self->_layoutState + 32) & 0x100) != 0))
  {
    v15 = 0;
  }
  else
  {
    *((_WORD *)&self->_layoutState + 32) |= 0x100u;
    -[PKPassGroupStackView _updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:](self, "_updatePassFooterViewIfNecessaryWithContext:becomeVisibleDelay:", 0, 0.0);
    modalGroupIndex = self->_modalGroupIndex;
    if (modalGroupIndex
      && -[PKPassGroupStackView _isGroupAtIndexInModalPile:](self, "_isGroupAtIndexInModalPile:", modalGroupIndex - 1))
    {
      v13 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", self->_modalGroupIndex - 1);
      objc_msgSend(v13, "frontmostPassView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "contentMode") <= 3)
        objc_msgSend(v14, "setContentMode:", 4);

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__PKPassGroupStackView_handleDeletePassRequestWithPass_forViewController___block_invoke;
    v17[3] = &unk_1E3E612E8;
    v17[4] = self;
    v15 = 1;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v17);
  }

  return v15;
}

uint64_t __74__PKPassGroupStackView_handleDeletePassRequestWithPass_forViewController___block_invoke(uint64_t a1)
{
  PKPassDeleteAnimationController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = [PKPassDeleteAnimationController alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2072), "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPassDeleteAnimationController initWithPassView:groupView:](v2, "initWithPassView:groupView:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2072));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 2344);
  *(_QWORD *)(v5 + 2344) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2344), "setDelegate:");
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2344), "forceDeleteAnimation");
}

- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  PKPassGroupStackView *v7;
  PKPassGroupStackView *v8;
  BOOL i;
  PKPassGroupStackView *v10;
  id WeakRetained;
  int v12;
  PKPassFooterView *passFooterView;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPassFooterView isViewCurrentContentView:](self->_passFooterView, "isViewCurrentContentView:", v4))
  {
    objc_msgSend(v16, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "PKBoolForKey:", *MEMORY[0x1E0D6AD08]);

    if ((v6 & 1) == 0)
    {
      v7 = v4;
      v8 = v7;
      for (i = v7 != self; v8 && v8 != self; i = v8 != self)
      {
        v10 = v8;
        -[PKPassGroupStackView superview](v8, "superview");
        v8 = (PKPassGroupStackView *)objc_claimAutoreleasedReturnValue();

      }
      if (!i)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
        v12 = objc_msgSend(WeakRetained, "supportsExternalPresentation");

        if (v12)
        {
          -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 7, 1);
        }
        else
        {
          passFooterView = self->_passFooterView;
          if (passFooterView)
          {
            -[PKPassFooterView configuration](passFooterView, "configuration");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "state");

            if (v15 == 4)
              -[PKPassGroupStackView _updatePassFooterViewWithContext:](self, "_updatePassFooterViewWithContext:", 0);
          }
        }
      }
    }
  }

}

- (void)evaluateBrightness
{
  if (PKRunningInViewService())
    -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");
}

- (void)resetBrightness
{
  if (PKRunningInViewService())
    -[PKPassGroupStackView _resetBrightness](self, "_resetBrightness");
}

- (void)_resetBrightness
{
  void *v3;

  if (self->_wantsBacklightRamping)
  {
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endRequestingBacklightRamping:", self);

    self->_wantsBacklightRamping = 0;
  }
}

- (BOOL)presentedPassCanPerformPayment
{
  return -[PKPassGroupStackView canPerformPaymentForGroupAtIndex:](self, "canPerformPaymentForGroupAtIndex:", self->_modalGroupIndex);
}

- (BOOL)canPerformPaymentForGroupAtIndex:(unint64_t)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = -[PKPassGroupStackView _groupViewAtIndex:](self, "_groupViewAtIndex:", a3);
  objc_msgSend(v4, "frontmostPassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[PKPassGroupStackView _createPassFooterConfigurationForPassView:withContext:](self, "_createPassFooterConfigurationForPassView:withContext:", v5, 0);
    v7 = v6;
    if (v6)
    {
      v8 = 1;
      switch(objc_msgSend(v6, "state"))
      {
        case 1:
          objc_msgSend(v5, "pass");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "paymentPass");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "devicePrimaryContactlessPaymentApplication");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12
            || (objc_msgSend(v11, "effectiveContactlessPaymentApplicationState"),
                !PKPaymentApplicationStateIsPersonalized())
            || objc_msgSend(v11, "supportedRadioTechnologies") == 2)
          {
            objc_msgSend(v11, "devicePrimaryBarcodePaymentApplication");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (!v13 || (objc_msgSend(v13, "state"), !PKPaymentApplicationStateIsPersonalized()))
              v8 = 0;

          }
          break;
        case 2:
          break;
        default:
          goto LABEL_4;
      }
    }
    else
    {
LABEL_4:
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)presentedPassIsPerformingPayment
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  PKPassFooterView *passFooterView;
  unsigned int v8;
  int v10;
  PKPassGroupStackView *v11;
  __int16 v12;
  PKPassFooterView *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PKPassFooterView configuration](self->_passFooterView, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "state");
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      passFooterView = self->_passFooterView;
      v10 = 134349568;
      v11 = self;
      v12 = 2050;
      v13 = passFooterView;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassGroupStackView (%{public}p:%{public}p): in state: %lu", (uint8_t *)&v10, 0x20u);
    }

    if (v5 <= 4)
      v8 = (0x16u >> v5) & 1;
    else
      LOBYTE(v8) = 0;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)interstitialControllerAvailable:(id)a3
{
  id v5;
  PKPGSVTransitionInterstitialController **p_interstitialController;
  _BOOL4 v7;
  PKPGSVTransitionInterstitialController *v8;
  char v9;
  void *v10;
  id v11;

  v5 = a3;
  p_interstitialController = &self->_interstitialController;
  v11 = v5;
  if (*p_interstitialController)
  {
    v7 = -[PKPGSVTransitionInterstitialController isInvalidated](*p_interstitialController, "isInvalidated");
    v5 = v11;
    if (v7)
    {
      v8 = *p_interstitialController;
      *p_interstitialController = 0;

      v5 = v11;
    }
  }
  v9 = objc_msgSend(v5, "isInvalidated");
  v10 = v11;
  if ((v9 & 1) == 0 && v11 && !*p_interstitialController)
  {
    objc_storeStrong((id *)p_interstitialController, a3);
    v10 = v11;
  }

}

- (void)groupViewDidMoveToReceiver:(id)a3
{
  -[PKPassGroupStackView _presentBackdropViewAnimated:delay:](self, "_presentBackdropViewAnimated:delay:", 1, 0.0);
}

- (void)groupViewNeedsAnimating:(id)a3 withVelocity:(double)a4 dragging:(BOOL)a5
{
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  id v9;

  self->_modalGroupViewVelocity = a4;
  self->_modalGroupViewDragging = a5;
  v6 = -[PKPassGroupStackView _shouldSwitchToTableStateFromExternalDismissal](self, "_shouldSwitchToTableStateFromExternalDismissal", a3);
  v7 = *((__int16 *)&self->_layoutState + 32);
  if (v6)
  {
    *((_WORD *)&self->_layoutState + 32) = v7 | 0x4000;
    v8 = 4;
  }
  else
  {
    if ((v7 & 0x80000000) == 0)
      return;
    v8 = 5;
  }
  v9 = -[PKPassGroupStackView _dismissModalGroupViewFromExternalToState:](self, "_dismissModalGroupViewFromExternalToState:", v8);
}

- (void)groupViewWillBeAvailable:(id)a3
{
  __int16 v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  -[PKPassGroupStackView _hideBackdropViewAnimated:delay:](self, "_hideBackdropViewAnimated:delay:", 1, 0.0);
  v4 = *((_WORD *)&self->_layoutState + 32);
  if ((v4 & 0x4000) != 0
    || (v5 = -[PKPassGroupStackView _shouldSwitchToTableStateFromExternalDismissal](self, "_shouldSwitchToTableStateFromExternalDismissal"), v4 = *((_WORD *)&self->_layoutState + 32), v5))
  {
    *((_WORD *)&self->_layoutState + 32) = v4 | 0x4000;
    self->_layoutState.externalToTableTransitionModalGroupIndex = self->_modalGroupIndex;
    -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 4, 1);
  }
  else
  {
    if ((*((_WORD *)&self->_layoutState + 32) & 0x8000) != 0)
    {
      -[PKPassGroupStackView _dismissModalGroupViewFromExternalToState:](self, "_dismissModalGroupViewFromExternalToState:", 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PKPassGroupStackView _rangeOfVisibleIndexesIgnoringBottomInset:](self, "_rangeOfVisibleIndexesIgnoringBottomInset:", 1);
      -[PKPassGroupStackView _generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:](self, "_generateModalGroupPileWithVisibleIndexes:reservePlaceForModalGroup:", v7, v8, 0);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__PKPassGroupStackView_groupViewWillBeAvailable___block_invoke;
      v10[3] = &unk_1E3E6E5F0;
      v10[4] = self;
      v11 = v6;
      v9 = v6;
      -[PKPassGroupStackView _enumerateLoadedGroupViews:](self, "_enumerateLoadedGroupViews:", v10);

    }
    -[PKPassGroupStackView layoutHeaderFootersAnimated:](self, "layoutHeaderFootersAnimated:", 1);
  }
}

void __49__PKPassGroupStackView_groupViewWillBeAvailable___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a4;
  if (*(id *)(*(_QWORD *)(a1 + 32) + 2072) != v11)
  {
    v8 = (void *)MEMORY[0x1A1AE621C]();
    v9 = *(void **)(a1 + 32);
    if (objc_msgSend(v9, "_isGroupAtIndexInModalPile:", a3))
      v10 = *(_QWORD *)(a1 + 40);
    else
      v10 = 0;
    objc_msgSend(v9, "_updateGroupView:toPresentationState:withSpringFactory:atIndex:", v11, 5, v10, a3);
    objc_autoreleasePoolPop(v8);
  }

}

- (void)groupViewIsAvailable:(id)a3
{
  id v4;
  PKPGSVTransitionInterstitialController *interstitialController;
  PKPGSVTransitionInterstitialController *v6;
  id WeakRetained;
  PKPGSVTransitionInterstitialController *v8;
  PKPassthroughView *headerContainerView;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  if (-[PKPassGroupStackView _acquireGroupView:resetExternalVC:](self, "_acquireGroupView:resetExternalVC:", v4, 1))
  {
    interstitialController = self->_interstitialController;
    if (interstitialController)
    {
      if (-[PKPGSVTransitionInterstitialController isInvalidated](interstitialController, "isInvalidated"))
      {
        v6 = self->_interstitialController;
        self->_interstitialController = 0;

      }
      if (self->_interstitialController)
      {
        if (self->_presentationState != 7
          || (WeakRetained = objc_loadWeakRetained((id *)&self->_externalVC), WeakRetained, !WeakRetained))
        {
          objc_initWeak(&location, self);
          v8 = self->_interstitialController;
          headerContainerView = self->_headerContainerView;
          v10 = MEMORY[0x1E0C809B0];
          v11 = 3221225472;
          v12 = __45__PKPassGroupStackView_groupViewIsAvailable___block_invoke;
          v13 = &unk_1E3E68738;
          objc_copyWeak(&v14, &location);
          -[PKPGSVTransitionInterstitialController transferToView:withDeactivationHandler:](v8, "transferToView:withDeactivationHandler:", headerContainerView, &v10);
          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }
      }
    }
    self->_modalGroupViewDragging = 0;
    self->_modalGroupViewVelocity = 0.0;
    if (-[PKPassGroupStackView _shouldSwitchToTableStateFromExternalDismissal](self, "_shouldSwitchToTableStateFromExternalDismissal", v10, v11, v12, v13))
    {
      -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 4, 1);
    }
    -[PKPassGroupStackView _updatePausedState](self, "_updatePausedState");
  }

}

void __45__PKPassGroupStackView_groupViewIsAvailable___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 268) == v5)
  {
    *((_QWORD *)WeakRetained + 268) = 0;

  }
}

- (BOOL)_shouldSwitchToTableStateFromExternalDismissal
{
  return self->_presentationState != 4 && *((unsigned __int16 *)&self->_layoutState + 32) < 0x4000u;
}

- (void)modalPresentationIsPending
{
  *((_WORD *)&self->_layoutState + 32) |= 0x8000u;
}

- (void)willDeletePass:(id)a3
{
  objc_storeStrong((id *)&self->_passToBeDeletedExternally, a3);
  -[PKPassGroupStackView _refreshBacklightForFrontmostPassGroup](self, "_refreshBacklightForFrontmostPassGroup");
}

- (void)didDeletePass:(id)a3
{
  id v4;
  void *v5;
  PKPass *passToBeDeletedExternally;

  v4 = a3;
  -[PKPassGroupStackView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupStackView:deleteConfirmedForPass:", self, v4);

  passToBeDeletedExternally = self->_passToBeDeletedExternally;
  self->_passToBeDeletedExternally = 0;

}

- (void)dashboardPassViewController:(id)a3 didRequestPaymentForPass:(id)a4 fromButton:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  -[PKPassGroupStackView delegate](self, "delegate", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "groupStackViewWantsPaymentPresentation:fromButton:", self, v5);

}

- (void)_moveBackdropViewToFront
{
  -[PKPassthroughView addSubview:](self->_passContainerView, "addSubview:", self->_backdropView);
  -[PKPassthroughView bringSubviewToFront:](self->_passContainerView, "bringSubviewToFront:", self->_backdropView);
}

- (void)_presentBackdropViewAnimated:(BOOL)a3 delay:(double)a4
{
  _BOOL4 v5;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_isPresentingBackdropView)
  {
    v5 = a3;
    -[PKPassGroupStackView _moveBackdropViewToFront](self, "_moveBackdropViewToFront");
    if (v5)
    {
      self->_isPresentingBackdropView = 1;
      if (!self->_isHidingBackdropView)
        -[PKPassGroupStackView _resetBackdropViewToStart:](self, "_resetBackdropViewToStart:", 1);
      self->_timeBackdropViewLastPresented = CACurrentMediaTime();
      v7 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke;
      v10[3] = &unk_1E3E612E8;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.03, a4);
      v8[4] = self;
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_2;
      v9[3] = &unk_1E3E612E8;
      v9[4] = self;
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_3;
      v8[3] = &unk_1E3E62288;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v9, v8, 0.3, a4);
    }
    else
    {
      -[PKPassGroupStackView _resetBackdropViewToStart:](self, "_resetBackdropViewToStart:", 0);
    }
  }
}

uint64_t __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2672), "setAlpha:", 1.0);
}

void __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 2672);
  objc_msgSend((id)objc_opt_class(), "backdropEndBackgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

uint64_t __59__PKPassGroupStackView__presentBackdropViewAnimated_delay___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 2681) = 0;
  return result;
}

- (void)_hideBackdropViewAnimated:(BOOL)a3 delay:(double)a4
{
  double v5;
  double v6;
  double timeBackdropViewLastPresented;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  if (!self->_isHidingBackdropView)
  {
    if (a3)
    {
      v5 = a4;
      v6 = CACurrentMediaTime();
      timeBackdropViewLastPresented = self->_timeBackdropViewLastPresented;
      v8 = v6 - timeBackdropViewLastPresented;
      v9 = 0.25;
      if (v6 - timeBackdropViewLastPresented >= 0.25)
      {
        v10 = 0.15;
        v8 = 0.1;
      }
      else
      {
        v5 = 0.0;
        v10 = 0.0;
        v9 = v6 - timeBackdropViewLastPresented;
      }
      self->_isHidingBackdropView = 1;
      -[PKPassGroupStackView _moveBackdropViewToFront](self, "_moveBackdropViewToFront");
      if (!self->_isPresentingBackdropView)
        -[PKPassGroupStackView _resetBackdropViewToStart:](self, "_resetBackdropViewToStart:", 0);
      v11 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke;
      v14[3] = &unk_1E3E612E8;
      v14[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v14, 0, v8, v10);
      v12[4] = self;
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_2;
      v13[3] = &unk_1E3E612E8;
      v13[4] = self;
      v12[0] = v11;
      v12[1] = 3221225472;
      v12[2] = __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_3;
      v12[3] = &unk_1E3E62288;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v13, v12, v9, v5);
    }
    else
    {
      -[PKBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview", a4);
    }
  }
}

uint64_t __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2672), "setAlpha:", 0.0);
}

void __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 2672);
  objc_msgSend((id)objc_opt_class(), "backdropStartBackgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

uint64_t __56__PKPassGroupStackView__hideBackdropViewAnimated_delay___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 2681))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 2672), "removeFromSuperview");
    v1 = *(_QWORD *)(v2 + 32);
  }
  *(_BYTE *)(v1 + 2680) = 0;
  return result;
}

- (void)_resetBackdropViewToStart:(BOOL)a3
{
  _BOOL4 v3;
  PKBackdropView *backdropView;
  void *v6;
  void *v7;
  double v8;

  v3 = a3;
  backdropView = self->_backdropView;
  v6 = (void *)objc_opt_class();
  if (v3)
  {
    objc_msgSend(v6, "backdropStartBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "backdropEndBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1.0;
  }
  -[PKBackdropView setBackgroundColor:](backdropView, "setBackgroundColor:", v7);

  -[PKBackdropView setAlpha:](self->_backdropView, "setAlpha:", v8);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (PKDiscoveryDataSource)discoveryDatasource
{
  return self->_discoveryDatasource;
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (BOOL)footerSuppressed
{
  return self->_footerSuppressed;
}

- (BOOL)externalFooterSuppressed
{
  return self->_externalFooterSuppressed;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (UIColor)pageIndicatorTintColor
{
  return self->_pageIndicatorTintColor;
}

- (void)setPageIndicatorTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2736);
}

- (UIColor)currentPageIndicatorTintColor
{
  return self->_currentPageIndicatorTintColor;
}

- (void)setCurrentPageIndicatorTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2744);
}

- (double)topContentSeparatorHeight
{
  return self->_topContentSeparatorHeight;
}

- (BOOL)staggerPileAnimations
{
  return self->_staggerPileAnimations;
}

- (void)setStaggerPileAnimations:(BOOL)a3
{
  self->_staggerPileAnimations = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_pageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_discoveryDatasource, 0);
  objc_destroyWeak((id *)&self->_datasource);
  objc_storeStrong((id *)&self->_panningAnimation, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_passToBeDeletedExternally, 0);
  objc_storeStrong((id *)&self->_loanedGroupView, 0);
  objc_destroyWeak((id *)&self->_externalVC);
  objc_storeStrong((id *)&self->_featuredGroupID, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_passContainerView, 0);
  objc_storeStrong((id *)&self->_subheaderContainerView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_passFooterView, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_animatorsByGroupID, 0);
  objc_storeStrong((id *)&self->_groupViewsInFlightByGroupID, 0);
  objc_storeStrong((id *)&self->_reorderActions, 0);
  objc_storeStrong((id *)&self->_autoscrollTimer, 0);
  objc_storeStrong((id *)&self->_reorderedGroupView, 0);
  objc_storeStrong((id *)&self->_reusableCardViewQueue, 0);
  objc_storeStrong((id *)&self->_suspendedTransitionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
  objc_storeStrong(&self->_transitionCanceller, 0);
  objc_storeStrong((id *)&self->_deleteAnimationController, 0);
  objc_storeStrong((id *)&self->_bottomContentSeparatorVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_footerPocketForegroundShadow, 0);
  objc_storeStrong((id *)&self->_footerPocketBackgroundShadow, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_interstitialController, 0);
  objc_storeStrong((id *)&self->_passHeaderContext, 0);
  objc_storeStrong((id *)&self->_paymentHeaderContext, 0);
  objc_storeStrong((id *)&self->_groupViewsByGroupID, 0);
  objc_storeStrong((id *)&self->_passPileViews, 0);
  objc_storeStrong((id *)&self->_modallyPresentedGroupView, 0);
}

- (void)scrollNext
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t scrollingTestState;
  double v9;
  double v10;
  double v11;
  id v12;

  -[PKPassGroupStackView contentOffset](self, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[PKPassGroupStackView contentSize](self, "contentSize");
  scrollingTestState = self->_scrollingTestState;
  if (scrollingTestState == 1)
  {
    v9 = v7;
    v10 = v6 + 1.0;
    -[PKPassGroupStackView bounds](self, "bounds");
    if (v10 > v9 - v11)
    {
      scrollingTestState = self->_scrollingTestState;
      goto LABEL_5;
    }
LABEL_9:
    -[PKPassGroupStackView setContentOffset:](self, "setContentOffset:", v4, v10);
    -[PKPassGroupStackView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_scrollNext, 0, 0.0);
    return;
  }
  v10 = v6 + -1.0;
  if (v10 >= 0.0)
    goto LABEL_9;
LABEL_5:
  if (scrollingTestState == 2)
  {
    -[PKPassGroupStackView scrollDownTest](self, "scrollDownTest");
  }
  else if (scrollingTestState == 1)
  {
    if (self->_currentTestReps > 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishedTest:", CFSTR("ScrollCardList"));

    }
    else
    {
      -[PKPassGroupStackView scrollUpTest](self, "scrollUpTest");
    }
  }
}

- (void)scrollDownTest
{
  self->_scrollingTestState = 1;
  -[PKPassGroupStackView scrollNext](self, "scrollNext");
}

- (void)scrollUpTest
{
  ++self->_currentTestReps;
  self->_scrollingTestState = 2;
  -[PKPassGroupStackView scrollNext](self, "scrollNext");
}

- (void)beginScrollCardListTest
{
  self->_currentTestReps = 0;
  -[PKPassGroupStackView scrollDownTest](self, "scrollDownTest");
}

- (void)testGoModal
{
  id v3;

  -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 4, 1);
  if (self->_currentTestReps > 9)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishedTest:", CFSTR("SelectCard"));

  }
  else
  {
    -[PKPassGroupStackView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_testGroupSelection, 0, 0.5);
  }
}

- (void)testGroupSelection
{
  ++self->_currentTestReps;
  -[PKPassGroupStackView setModalGroupIndex:](self, "setModalGroupIndex:", 2);
  -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 5, 1);
  -[PKPassGroupStackView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_testGoModal, 0, 0.5);
}

- (void)beginSelectCardTest
{
  self->_currentTestReps = 0;
  -[PKPassGroupStackView testGoModal](self, "testGoModal");
}

- (void)gotoBaseTestState
{
  double v3;

  -[PKPassGroupStackView setPresentationState:animated:](self, "setPresentationState:animated:", 4, 0);
  -[PKPassGroupStackView contentSize](self, "contentSize");
  -[PKPassGroupStackView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0, 0.0, 0.0, v3, 10.0);
}

@end
