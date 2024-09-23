@implementation UIKeyboardCandidateViewStyle

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 5, self->_candidateFont);
  objc_storeStrong(v4 + 8, self->_candidateFont);
  objc_storeStrong(v4 + 7, self->_annotationTextFont);
  objc_storeStrong(v4 + 9, self->_candidateNumberFont);
  objc_storeStrong(v4 + 10, self->_sortControlFont);
  objc_storeStrong(v4 + 11, self->_textColor);
  objc_storeStrong(v4 + 12, self->_highlightedTextColor);
  objc_storeStrong(v4 + 13, self->_alternativeTextColor);
  objc_storeStrong(v4 + 14, self->_highlightedAlternativeTextColor);
  objc_storeStrong(v4 + 15, self->_candidateNumberColor);
  objc_storeStrong(v4 + 16, self->_highlightedCandidateNumberColor);
  objc_storeStrong(v4 + 18, self->_cellBackgroundColor);
  objc_storeStrong(v4 + 17, self->_backgroundColor);
  objc_storeStrong(v4 + 19, self->_arrowButtonBackgroundColor);
  *((_BYTE *)v4 + 8) = self->_arrowButtonBackgroundHidden;
  objc_storeStrong(v4 + 20, self->_arrowButtonColor);
  objc_storeStrong(v4 + 21, self->_gridBackgroundColor);
  objc_storeStrong(v4 + 22, self->_highlightedBackgroundColor);
  objc_storeStrong(v4 + 24, self->_groupHeaderBackgroundColor);
  objc_storeStrong(v4 + 26, self->_lineColor);
  objc_storeStrong(v4 + 27, self->_sortControlColor);
  objc_storeStrong(v4 + 28, self->_sortControlBackgroundColor);
  v5 = -[NSString copy](self->_arrowButtonImageName, "copy");
  v6 = v4[29];
  v4[29] = (id)v5;

  objc_storeStrong(v4 + 30, self->_cellSeparatorImage);
  objc_storeStrong(v4 + 31, self->_slottedCellSeparatorImage);
  objc_storeStrong(v4 + 32, self->_leftEdgeSeparatorImage);
  objc_storeStrong(v4 + 33, self->_rightEdgeSeparatorImage);
  objc_storeStrong(v4 + 29, self->_arrowButtonImageName);
  objc_storeStrong(v4 + 35, self->_leftEdgeMaskImage);
  objc_storeStrong(v4 + 36, self->_rightEdgeMaskImage);
  objc_storeStrong(v4 + 37, self->_cellBackgroundImage);
  objc_storeStrong(v4 + 38, self->_highlightedCellBackgroundImage);
  v4[40] = *(id *)&self->_rowHeight;
  v4[42] = *(id *)&self->_cornerRadius;
  v4[44] = (id)self->_maskedCorners;
  v4[46] = *(id *)&self->_foregroundOpacity;
  v4[47] = *(id *)&self->_backgroundOpacity;
  *((_BYTE *)v4 + 10) = self->_hasShadow;
  *((_BYTE *)v4 + 11) = self->_roundsArrowButtonEdge;
  v4[48] = (id)self->_layoutOrientation;
  v4[49] = (id)self->_columnsCount;
  v4[50] = (id)self->_maxNumberOfProactiveCells;
  v4[51] = *(id *)&self->_minimumCellPadding;
  v4[52] = *(id *)&self->_minimumCellWidth;
  v4[53] = *(id *)&self->_minimumInterItemSpacing;
  v4[54] = *(id *)&self->_maximumIconWidth;
  *((_BYTE *)v4 + 12) = self->_shouldJustifyRow;
  v4[55] = *(id *)&self->_singleSlottedCellMargin;
  v7 = *(_OWORD *)&self->_extraCellPadding.bottom;
  *((_OWORD *)v4 + 36) = *(_OWORD *)&self->_extraCellPadding.top;
  *((_OWORD *)v4 + 37) = v7;
  v8 = *(_OWORD *)&self->_gridPadding.bottom;
  *((_OWORD *)v4 + 40) = *(_OWORD *)&self->_gridPadding.top;
  *((_OWORD *)v4 + 41) = v8;
  v9 = *(_OWORD *)&self->_gridLinePadding.bottom;
  *((_OWORD *)v4 + 42) = *(_OWORD *)&self->_gridLinePadding.top;
  *((_OWORD *)v4 + 43) = v9;
  *((_OWORD *)v4 + 35) = self->_gridLineOffset;
  v10 = *(_OWORD *)&self->_sortControlPadding.bottom;
  *((_OWORD *)v4 + 44) = *(_OWORD *)&self->_sortControlPadding.top;
  *((_OWORD *)v4 + 45) = v10;
  v4[56] = (id)self->_cellTextAlignment;
  v4[58] = (id)self->_lineBreakMode;
  *((_BYTE *)v4 + 13) = self->_darkBackdrop;
  *((_BYTE *)v4 + 14) = self->_scrollDisabled;
  *((_BYTE *)v4 + 15) = self->_dragGestureDisabled;
  *((_BYTE *)v4 + 17) = self->_showsIndex;
  *((_BYTE *)v4 + 20) = self->_dontSelectLastItemByBackwardMoving;
  *((_BYTE *)v4 + 21) = self->_showOneMoreCandidate;
  *((_BYTE *)v4 + 22) = self->_disableSwitchingSortingMethodByTabKey;
  *((_BYTE *)v4 + 23) = self->_skipInlineCandidate;
  *((_BYTE *)v4 + 24) = self->_hidesPartialCandidates;
  v4[59] = (id)self->_minimumNumberOfCandidates;
  v4[60] = *(id *)&self->_widthOfGridGradient;
  *((_BYTE *)v4 + 25) = self->_showCellBorderForSpaceConfirmationCandidate;
  *((_BYTE *)v4 + 26) = self->_performScalingAnimationOnCellHighlight;
  *((_BYTE *)v4 + 27) = self->_arrowButtonHighlightBackgroundHidden;
  objc_storeStrong(v4 + 61, self->_arrowButtonConfig);
  objc_storeStrong(v4 + 62, self->_spaceConfirmationCandidateCellBackgroundColor);
  *((_BYTE *)v4 + 28) = self->_hideLinesOnDisambiguationGridEdges;
  *((_BYTE *)v4 + 29) = self->_maximizeSortControlWidthWithPadding;
  v4[63] = *(id *)&self->_alternativeTextLeftSpacing;
  v11 = *(_OWORD *)&self->_groupHeaderPadding.bottom;
  *((_OWORD *)v4 + 46) = *(_OWORD *)&self->_groupHeaderPadding.top;
  *((_OWORD *)v4 + 47) = v11;
  v4[64] = *(id *)&self->_interRowSpacing;
  *((_BYTE *)v4 + 30) = self->_applyCornerRadiusToAllCandidates;
  objc_storeStrong(v4 + 65, self->_autofillExtraCandidateImage);
  v4[66] = *(id *)&self->_slottedCandidatesIterItemSpacing;
  objc_storeStrong(v4 + 67, self->_suggestionCandidateHeaderFontAttributes);
  objc_storeStrong(v4 + 68, self->_suggestionCandidateBodyFontAttributes);
  *((_BYTE *)v4 + 31) = self->_shouldUpdateCollectionViewWidthForArrowButtonVisibility;
  *((_BYTE *)v4 + 32) = self->_hideSlottedCellSeparators;
  objc_storeStrong(v4 + 69, self->_proactiveCandidateContentsGravity);
  *((_BYTE *)v4 + 33) = self->_shouldScrollIfShowingLastVisibleRow;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UIKeyboardCandidateViewStyle *v4;
  UIKeyboardCandidateViewStyle *v5;
  UIKeyboardCandidateViewStyle *v6;
  UIFont *candidateFont;
  char v8;
  char v9;
  UIFont *alternativeTextFont;
  char v11;
  char v12;
  UIFont *annotationTextFont;
  char v14;
  char v15;
  UIFont *candidateNumberFont;
  char v17;
  char v18;
  UIFont *sortControlFont;
  char v20;
  char v21;
  UIColor *textColor;
  char v23;
  char v24;
  UIColor *highlightedTextColor;
  char v26;
  char v27;
  UIColor *alternativeTextColor;
  char v29;
  char v30;
  UIColor *highlightedAlternativeTextColor;
  char v32;
  char v33;
  UIColor *candidateNumberColor;
  char v35;
  char v36;
  UIColor *highlightedCandidateNumberColor;
  char v38;
  char v39;
  UIColor *backgroundColor;
  char v41;
  char v42;
  UIColor *arrowButtonBackgroundColor;
  char v44;
  char v45;
  UIColor *arrowButtonColor;
  char v47;
  char v48;
  UIColor *cellBackgroundColor;
  char v50;
  char v51;
  UIColor *gridBackgroundColor;
  char v53;
  char v54;
  UIColor *highlightedBackgroundColor;
  char v56;
  char v57;
  UIColor *groupHeaderBackgroundColor;
  char v59;
  char v60;
  UIColor *lineColor;
  char v62;
  char v63;
  UIColor *sortControlColor;
  char v65;
  char v66;
  UIColor *sortControlBackgroundColor;
  char v68;
  char v69;
  NSString *arrowButtonImageName;
  char v71;
  NSString *v72;
  char v73;
  BOOL v74;
  BOOL v75;
  BOOL v76;
  BOOL v77;
  BOOL v78;
  BOOL v79;
  BOOL v80;
  BOOL v81;
  char v82;
  char v83;
  UIButtonConfiguration *arrowButtonConfig;
  char v85;
  char v86;
  UIColor *spaceConfirmationCandidateCellBackgroundColor;
  char v88;
  char v89;
  BOOL v90;
  char v91;
  char v92;
  NSDictionary *suggestionCandidateHeaderFontAttributes;
  char v94;
  char v95;
  NSDictionary *suggestionCandidateBodyFontAttributes;
  char v97;
  char v98;
  char v99;
  NSString *proactiveCandidateContentsGravity;
  char v101;

  v4 = (UIKeyboardCandidateViewStyle *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    candidateFont = self->_candidateFont;
    if (candidateFont == v6->_candidateFont)
      v8 = 1;
    else
      v8 = -[UIFont isEqual:](candidateFont, "isEqual:");
    alternativeTextFont = self->_alternativeTextFont;
    if (alternativeTextFont == v6->_alternativeTextFont)
      v11 = 1;
    else
      v11 = -[UIFont isEqual:](alternativeTextFont, "isEqual:");
    v12 = v8 & v11;
    annotationTextFont = self->_annotationTextFont;
    if (annotationTextFont == v6->_annotationTextFont)
      v14 = 1;
    else
      v14 = -[UIFont isEqual:](annotationTextFont, "isEqual:");
    v15 = v12 & v14;
    candidateNumberFont = self->_candidateNumberFont;
    if (candidateNumberFont == v6->_candidateNumberFont)
      v17 = 1;
    else
      v17 = -[UIFont isEqual:](candidateNumberFont, "isEqual:");
    v18 = v15 & v17;
    sortControlFont = self->_sortControlFont;
    if (sortControlFont == v6->_sortControlFont)
      v20 = 1;
    else
      v20 = -[UIFont isEqual:](sortControlFont, "isEqual:");
    v21 = v18 & v20;
    textColor = self->_textColor;
    if (textColor == v6->_textColor)
      v23 = 1;
    else
      v23 = -[UIColor isEqual:](textColor, "isEqual:");
    v24 = v21 & v23;
    highlightedTextColor = self->_highlightedTextColor;
    if (highlightedTextColor == v6->_highlightedTextColor)
      v26 = 1;
    else
      v26 = -[UIColor isEqual:](highlightedTextColor, "isEqual:");
    v27 = v24 & v26;
    alternativeTextColor = self->_alternativeTextColor;
    if (alternativeTextColor == v6->_alternativeTextColor)
      v29 = 1;
    else
      v29 = -[UIColor isEqual:](alternativeTextColor, "isEqual:");
    v30 = v27 & v29;
    highlightedAlternativeTextColor = self->_highlightedAlternativeTextColor;
    if (highlightedAlternativeTextColor == v6->_highlightedAlternativeTextColor)
      v32 = 1;
    else
      v32 = -[UIColor isEqual:](highlightedAlternativeTextColor, "isEqual:");
    v33 = v30 & v32;
    candidateNumberColor = self->_candidateNumberColor;
    if (candidateNumberColor == v6->_candidateNumberColor)
      v35 = 1;
    else
      v35 = -[UIColor isEqual:](candidateNumberColor, "isEqual:");
    v36 = v33 & v35;
    highlightedCandidateNumberColor = self->_highlightedCandidateNumberColor;
    if (highlightedCandidateNumberColor == v6->_highlightedCandidateNumberColor)
      v38 = 1;
    else
      v38 = -[UIColor isEqual:](highlightedCandidateNumberColor, "isEqual:");
    v39 = v36 & v38;
    backgroundColor = self->_backgroundColor;
    if (backgroundColor == v6->_backgroundColor)
      v41 = 1;
    else
      v41 = -[UIColor isEqual:](backgroundColor, "isEqual:");
    v42 = v39 & v41;
    arrowButtonBackgroundColor = self->_arrowButtonBackgroundColor;
    if (arrowButtonBackgroundColor == v6->_arrowButtonBackgroundColor)
      v44 = 1;
    else
      v44 = -[UIColor isEqual:](arrowButtonBackgroundColor, "isEqual:");
    if (self->_arrowButtonBackgroundHidden == v6->_arrowButtonBackgroundHidden)
      v45 = v42 & v44;
    else
      v45 = 0;
    arrowButtonColor = self->_arrowButtonColor;
    if (arrowButtonColor == v6->_arrowButtonColor)
      v47 = 1;
    else
      v47 = -[UIColor isEqual:](arrowButtonColor, "isEqual:");
    v48 = v45 & v47;
    cellBackgroundColor = self->_cellBackgroundColor;
    if (cellBackgroundColor == v6->_cellBackgroundColor)
      v50 = 1;
    else
      v50 = -[UIColor isEqual:](cellBackgroundColor, "isEqual:");
    v51 = v48 & v50;
    gridBackgroundColor = self->_gridBackgroundColor;
    if (gridBackgroundColor == v6->_gridBackgroundColor)
      v53 = 1;
    else
      v53 = -[UIColor isEqual:](gridBackgroundColor, "isEqual:");
    v54 = v51 & v53;
    highlightedBackgroundColor = self->_highlightedBackgroundColor;
    if (highlightedBackgroundColor == v6->_highlightedBackgroundColor)
      v56 = 1;
    else
      v56 = -[UIColor isEqual:](highlightedBackgroundColor, "isEqual:");
    v57 = v54 & v56;
    groupHeaderBackgroundColor = self->_groupHeaderBackgroundColor;
    if (groupHeaderBackgroundColor == v6->_groupHeaderBackgroundColor)
      v59 = 1;
    else
      v59 = -[UIColor isEqual:](groupHeaderBackgroundColor, "isEqual:");
    v60 = v57 & v59;
    lineColor = self->_lineColor;
    if (lineColor == v6->_lineColor)
      v62 = 1;
    else
      v62 = -[UIColor isEqual:](lineColor, "isEqual:");
    v63 = v60 & v62;
    sortControlColor = self->_sortControlColor;
    if (sortControlColor == v6->_sortControlColor)
      v65 = 1;
    else
      v65 = -[UIColor isEqual:](sortControlColor, "isEqual:");
    v66 = v63 & v65;
    sortControlBackgroundColor = self->_sortControlBackgroundColor;
    if (sortControlBackgroundColor == v6->_sortControlBackgroundColor)
      v68 = 1;
    else
      v68 = -[UIColor isEqual:](sortControlBackgroundColor, "isEqual:");
    v69 = v66 & v68;
    arrowButtonImageName = self->_arrowButtonImageName;
    if (arrowButtonImageName == v6->_arrowButtonImageName)
    {
      v71 = 1;
      v72 = self->_arrowButtonImageName;
    }
    else
    {
      v71 = -[NSString isEqual:](arrowButtonImageName, "isEqual:");
      v72 = self->_arrowButtonImageName;
      arrowButtonImageName = v6->_arrowButtonImageName;
    }
    v73 = v69 & v71;
    if (self->_cellSeparatorImage != v6->_cellSeparatorImage)
      v73 = 0;
    if (self->_slottedCellSeparatorImage != v6->_slottedCellSeparatorImage)
      v73 = 0;
    if (self->_leftEdgeSeparatorImage != v6->_leftEdgeSeparatorImage)
      v73 = 0;
    if (self->_rightEdgeSeparatorImage != v6->_rightEdgeSeparatorImage)
      v73 = 0;
    if (self->_leftEdgeMaskImage != v6->_leftEdgeMaskImage)
      v73 = 0;
    if (self->_rightEdgeMaskImage != v6->_rightEdgeMaskImage)
      v73 = 0;
    if (v72 != arrowButtonImageName)
      v73 = 0;
    if (self->_cellBackgroundImage != v6->_cellBackgroundImage)
      v73 = 0;
    if (self->_highlightedCellBackgroundImage != v6->_highlightedCellBackgroundImage)
      v73 = 0;
    if (self->_rowHeight != v6->_rowHeight)
      v73 = 0;
    if (self->_cornerRadius != v6->_cornerRadius)
      v73 = 0;
    if (self->_maskedCorners != v6->_maskedCorners)
      v73 = 0;
    if (self->_foregroundOpacity != v6->_foregroundOpacity)
      v73 = 0;
    if (self->_backgroundOpacity != v6->_backgroundOpacity)
      v73 = 0;
    if (self->_hasShadow != v6->_hasShadow)
      v73 = 0;
    if (self->_roundsArrowButtonEdge != v6->_roundsArrowButtonEdge)
      v73 = 0;
    if (self->_layoutOrientation != v6->_layoutOrientation)
      v73 = 0;
    if (self->_columnsCount != v6->_columnsCount)
      v73 = 0;
    if (self->_maxNumberOfProactiveCells != v6->_maxNumberOfProactiveCells)
      v73 = 0;
    if (self->_minimumCellPadding != v6->_minimumCellPadding)
      v73 = 0;
    if (self->_minimumCellWidth != v6->_minimumCellWidth)
      v73 = 0;
    if (self->_minimumInterItemSpacing != v6->_minimumInterItemSpacing)
      v73 = 0;
    if (self->_maximumIconWidth != v6->_maximumIconWidth)
      v73 = 0;
    if (self->_shouldJustifyRow != v6->_shouldJustifyRow)
      v73 = 0;
    if (self->_singleSlottedCellMargin != v6->_singleSlottedCellMargin)
      v73 = 0;
    v74 = self->_extraCellPadding.left == v6->_extraCellPadding.left;
    if (self->_extraCellPadding.top != v6->_extraCellPadding.top)
      v74 = 0;
    if (self->_extraCellPadding.right != v6->_extraCellPadding.right)
      v74 = 0;
    if (self->_extraCellPadding.bottom != v6->_extraCellPadding.bottom)
      v74 = 0;
    v75 = self->_gridPadding.left == v6->_gridPadding.left;
    if (self->_gridPadding.top != v6->_gridPadding.top)
      v75 = 0;
    if (self->_gridPadding.right != v6->_gridPadding.right)
      v75 = 0;
    if (self->_gridPadding.bottom != v6->_gridPadding.bottom)
      v75 = 0;
    v76 = v74 && v75;
    v77 = self->_gridLinePadding.left == v6->_gridLinePadding.left;
    if (self->_gridLinePadding.top != v6->_gridLinePadding.top)
      v77 = 0;
    if (self->_gridLinePadding.right != v6->_gridLinePadding.right)
      v77 = 0;
    if (self->_gridLinePadding.bottom != v6->_gridLinePadding.bottom)
      v77 = 0;
    v78 = v76 && v77;
    v79 = self->_gridLineOffset.x == v6->_gridLineOffset.x;
    if (self->_gridLineOffset.y != v6->_gridLineOffset.y)
      v79 = 0;
    v80 = v78 && v79;
    v81 = self->_sortControlPadding.left == v6->_sortControlPadding.left;
    if (self->_sortControlPadding.top != v6->_sortControlPadding.top)
      v81 = 0;
    if (self->_sortControlPadding.right != v6->_sortControlPadding.right)
      v81 = 0;
    if (self->_sortControlPadding.bottom != v6->_sortControlPadding.bottom)
      v81 = 0;
    v82 = v73 & (v80 && v81);
    if (self->_cellTextAlignment != v6->_cellTextAlignment)
      v82 = 0;
    if (self->_lineBreakMode != v6->_lineBreakMode)
      v82 = 0;
    if (self->_darkBackdrop != v6->_darkBackdrop)
      v82 = 0;
    if (self->_scrollDisabled != v6->_scrollDisabled)
      v82 = 0;
    if (self->_dragGestureDisabled != v6->_dragGestureDisabled)
      v82 = 0;
    if (self->_showsIndex != v6->_showsIndex)
      v82 = 0;
    if (self->_dontSelectLastItemByBackwardMoving != v6->_dontSelectLastItemByBackwardMoving)
      v82 = 0;
    if (self->_showOneMoreCandidate != v6->_showOneMoreCandidate)
      v82 = 0;
    if (self->_disableSwitchingSortingMethodByTabKey != v6->_disableSwitchingSortingMethodByTabKey)
      v82 = 0;
    if (self->_skipInlineCandidate != v6->_skipInlineCandidate)
      v82 = 0;
    if (self->_hidesPartialCandidates != v6->_hidesPartialCandidates)
      v82 = 0;
    if (self->_minimumNumberOfCandidates != v6->_minimumNumberOfCandidates)
      v82 = 0;
    if (self->_widthOfGridGradient != v6->_widthOfGridGradient)
      v82 = 0;
    if (self->_showCellBorderForSpaceConfirmationCandidate != v6->_showCellBorderForSpaceConfirmationCandidate)
      v82 = 0;
    if (self->_performScalingAnimationOnCellHighlight != v6->_performScalingAnimationOnCellHighlight)
      v82 = 0;
    if (self->_arrowButtonHighlightBackgroundHidden == v6->_arrowButtonHighlightBackgroundHidden)
      v83 = v82;
    else
      v83 = 0;
    arrowButtonConfig = self->_arrowButtonConfig;
    if (arrowButtonConfig == v6->_arrowButtonConfig)
      v85 = 1;
    else
      v85 = -[UIButtonConfiguration isEqual:](arrowButtonConfig, "isEqual:");
    v86 = v83 & v85;
    spaceConfirmationCandidateCellBackgroundColor = self->_spaceConfirmationCandidateCellBackgroundColor;
    if (spaceConfirmationCandidateCellBackgroundColor == v6->_spaceConfirmationCandidateCellBackgroundColor)
      v88 = 1;
    else
      v88 = -[UIColor isEqual:](spaceConfirmationCandidateCellBackgroundColor, "isEqual:");
    v89 = v86 & v88;
    if (self->_hideLinesOnDisambiguationGridEdges != v6->_hideLinesOnDisambiguationGridEdges)
      v89 = 0;
    if (self->_maximizeSortControlWidthWithPadding != v6->_maximizeSortControlWidthWithPadding)
      v89 = 0;
    if (self->_alternativeTextLeftSpacing != v6->_alternativeTextLeftSpacing)
      v89 = 0;
    v90 = self->_groupHeaderPadding.left == v6->_groupHeaderPadding.left;
    if (self->_groupHeaderPadding.top != v6->_groupHeaderPadding.top)
      v90 = 0;
    if (self->_groupHeaderPadding.right != v6->_groupHeaderPadding.right)
      v90 = 0;
    if (self->_groupHeaderPadding.bottom != v6->_groupHeaderPadding.bottom)
      v90 = 0;
    v91 = v89 & v90;
    if (self->_interRowSpacing != v6->_interRowSpacing)
      v91 = 0;
    if (self->_applyCornerRadiusToAllCandidates != v6->_applyCornerRadiusToAllCandidates)
      v91 = 0;
    if (self->_autofillExtraCandidateImage != v6->_autofillExtraCandidateImage)
      v91 = 0;
    if (self->_slottedCandidatesIterItemSpacing == v6->_slottedCandidatesIterItemSpacing)
      v92 = v91;
    else
      v92 = 0;
    suggestionCandidateHeaderFontAttributes = self->_suggestionCandidateHeaderFontAttributes;
    if (suggestionCandidateHeaderFontAttributes == v6->_suggestionCandidateHeaderFontAttributes)
      v94 = 1;
    else
      v94 = -[NSDictionary isEqual:](suggestionCandidateHeaderFontAttributes, "isEqual:");
    v95 = v92 & v94;
    suggestionCandidateBodyFontAttributes = self->_suggestionCandidateBodyFontAttributes;
    if (suggestionCandidateBodyFontAttributes == v6->_suggestionCandidateBodyFontAttributes)
      v97 = 1;
    else
      v97 = -[NSDictionary isEqual:](suggestionCandidateBodyFontAttributes, "isEqual:");
    v98 = v95 & v97;
    if (self->_shouldUpdateCollectionViewWidthForArrowButtonVisibility != v6->_shouldUpdateCollectionViewWidthForArrowButtonVisibility)
      v98 = 0;
    if (self->_hideSlottedCellSeparators == v6->_hideSlottedCellSeparators)
      v99 = v98;
    else
      v99 = 0;
    proactiveCandidateContentsGravity = self->_proactiveCandidateContentsGravity;
    if (proactiveCandidateContentsGravity == v6->_proactiveCandidateContentsGravity)
      v101 = 1;
    else
      v101 = -[NSString isEqual:](proactiveCandidateContentsGravity, "isEqual:");
    if (self->_shouldScrollIfShowingLastVisibleRow == v6->_shouldScrollIfShowingLastVisibleRow)
      v9 = v99 & v101;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)lightKeyboardStyle
{
  UIKeyboardCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIFont *alternativeTextFont;
  uint64_t v7;
  UIFont *annotationTextFont;
  uint64_t v9;
  UIFont *candidateNumberFont;
  uint64_t v11;
  UIFont *sortControlFont;
  uint64_t v13;
  UIColor *textColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  uint64_t v17;
  UIColor *alternativeTextColor;
  uint64_t v19;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v21;
  UIColor *candidateNumberColor;
  uint64_t v23;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v25;
  UIColor *backgroundColor;
  uint64_t v27;
  UIColor *cellBackgroundColor;
  uint64_t v29;
  UIColor *arrowButtonBackgroundColor;
  uint64_t v31;
  UIColor *arrowButtonColor;
  uint64_t v33;
  UIColor *gridBackgroundColor;
  uint64_t v35;
  UIColor *highlightedBackgroundColor;
  uint64_t v37;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v39;
  UIColor *lineColor;
  uint64_t v41;
  UIColor *sortControlColor;
  uint64_t v43;
  UIColor *sortControlBackgroundColor;

  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 20.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v5 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v7 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v9 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v11 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  +[UIColor blackColor](UIColor, "blackColor");
  v13 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  -[UIKeyboardCandidateViewStyle textColor](v2, "textColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha35")));
  v17 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  -[UIKeyboardCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v19 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBLegacyCandidateGridPadCellCandidateNumber")));
  v21 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  -[UIKeyboardCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  +[UIColor clearColor](UIColor, "clearColor");
  v25 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  +[UIColor clearColor](UIColor, "clearColor");
  v27 = objc_claimAutoreleasedReturnValue();
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  +[UIColor clearColor](UIColor, "clearColor");
  v29 = objc_claimAutoreleasedReturnValue();
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  +[UIColor blackColor](UIColor, "blackColor");
  v31 = objc_claimAutoreleasedReturnValue();
  arrowButtonColor = v2->_arrowButtonColor;
  v2->_arrowButtonColor = (UIColor *)v31;

  +[UIColor clearColor](UIColor, "clearColor");
  v33 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v33;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBLightCandidateBarCellHighlightedBackground")));
  v35 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v35;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorCandidateCellGroupHeaderLight")));
  v37 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v37;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorGray_Percent55")));
  v39 = objc_claimAutoreleasedReturnValue();
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v39;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorKeyGrayKeyLightBackground")));
  v41 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v41;

  +[UIColor clearColor](UIColor, "clearColor");
  v43 = objc_claimAutoreleasedReturnValue();
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v43;

  v2->_rowHeight = 44.0;
  v2->_maskedCorners = 15;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  *(_OWORD *)&v2->_maximumIconWidth = xmmword_18667F590;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 0x10000;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)darkKeyboardStyle
{
  UIKeyboardCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIFont *alternativeTextFont;
  uint64_t v7;
  UIFont *annotationTextFont;
  uint64_t v9;
  UIFont *candidateNumberFont;
  uint64_t v11;
  UIFont *sortControlFont;
  uint64_t v13;
  UIColor *textColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  uint64_t v17;
  UIColor *alternativeTextColor;
  uint64_t v19;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v21;
  UIColor *candidateNumberColor;
  uint64_t v23;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v25;
  UIColor *backgroundColor;
  uint64_t v27;
  UIColor *cellBackgroundColor;
  uint64_t v29;
  UIColor *arrowButtonBackgroundColor;
  uint64_t v31;
  UIColor *arrowButtonColor;
  uint64_t v33;
  UIColor *gridBackgroundColor;
  uint64_t v35;
  UIColor *highlightedBackgroundColor;
  uint64_t v37;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v39;
  UIColor *lineColor;
  uint64_t v41;
  UIColor *sortControlColor;
  uint64_t v43;
  UIColor *sortControlBackgroundColor;

  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 20.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v5 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v7 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v9 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v11 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  +[UIColor whiteColor](UIColor, "whiteColor");
  v13 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  -[UIKeyboardCandidateViewStyle textColor](v2, "textColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorWhite_Alpha35")));
  v17 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  -[UIKeyboardCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v19 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBLegacyCandidateGridPadCellCandidateNumber")));
  v21 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  -[UIKeyboardCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  +[UIColor clearColor](UIColor, "clearColor");
  v25 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  +[UIColor clearColor](UIColor, "clearColor");
  v27 = objc_claimAutoreleasedReturnValue();
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  +[UIColor clearColor](UIColor, "clearColor");
  v29 = objc_claimAutoreleasedReturnValue();
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  +[UIColor whiteColor](UIColor, "whiteColor");
  v31 = objc_claimAutoreleasedReturnValue();
  arrowButtonColor = v2->_arrowButtonColor;
  v2->_arrowButtonColor = (UIColor *)v31;

  +[UIColor clearColor](UIColor, "clearColor");
  v33 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v33;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBDarkCandidateBarCellHighlightedBackground")));
  v35 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v35;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorWhite_Alpha40")));
  v37 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v37;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha70")));
  v39 = objc_claimAutoreleasedReturnValue();
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v39;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorKeyGrayKeyDarkBackground")));
  v41 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v41;

  +[UIColor clearColor](UIColor, "clearColor");
  v43 = objc_claimAutoreleasedReturnValue();
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v43;

  v2->_rowHeight = 44.0;
  v2->_maskedCorners = 15;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  *(_OWORD *)&v2->_maximumIconWidth = xmmword_18667F590;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 16842752;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)visionInlineStyle
{
  UIKeyboardCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIFont *alternativeTextFont;
  uint64_t v7;
  UIFont *annotationTextFont;
  uint64_t v9;
  UIFont *candidateNumberFont;
  uint64_t v11;
  UIFont *sortControlFont;
  uint64_t v13;
  UIColor *textColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  uint64_t v17;
  UIColor *alternativeTextColor;
  void *v19;
  uint64_t v20;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v22;
  UIColor *candidateNumberColor;
  void *v24;
  uint64_t v25;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v27;
  UIColor *cellBackgroundColor;
  uint64_t v29;
  UIColor *arrowButtonBackgroundColor;
  uint64_t v31;
  UIColor *arrowButtonColor;
  uint64_t v33;
  UIColor *backgroundColor;
  uint64_t v35;
  UIColor *gridBackgroundColor;
  uint64_t v42;
  UIColor *highlightedBackgroundColor;
  uint64_t v44;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v46;
  UIColor *sortControlBackgroundColor;
  double v48;

  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v5 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  v7 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
  v9 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v11 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  +[UIColor labelColor](UIColor, "labelColor");
  v13 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  +[UIColor blackColor](UIColor, "blackColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v17 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  +[UIColor blackColor](UIColor, "blackColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorWithAlphaComponent:", 0.4);
  v20 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v20;

  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v22 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v22;

  +[UIColor blackColor](UIColor, "blackColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "colorWithAlphaComponent:", 0.4);
  v25 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v25;

  +[UIColor clearColor](UIColor, "clearColor");
  v27 = objc_claimAutoreleasedReturnValue();
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  +[UIColor clearColor](UIColor, "clearColor");
  v29 = objc_claimAutoreleasedReturnValue();
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  +[UIColor labelColor](UIColor, "labelColor");
  v31 = objc_claimAutoreleasedReturnValue();
  arrowButtonColor = v2->_arrowButtonColor;
  v2->_arrowButtonColor = (UIColor *)v31;

  v2->_arrowButtonBackgroundHidden = 1;
  v2->_arrowButtonHeight = 36.0;
  *(_OWORD *)&v2->_arrowButtonPadding.top = 0u;
  *(_OWORD *)&v2->_arrowButtonPadding.bottom = 0u;
  v2->_arrowButtonHighlightBackgroundHidden = 1;
  +[UIColor clearColor](UIColor, "clearColor");
  v33 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v33;

  +[UIColor clearColor](UIColor, "clearColor");
  v35 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v35;

  __asm { FMOV            V1.2D, #4.0 }
  *(_OWORD *)&v2->_sortControlPadding.top = xmmword_18667F5A0;
  *(_OWORD *)&v2->_sortControlPadding.bottom = _Q1;
  +[UIColor whiteColor](UIColor, "whiteColor");
  v42 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v42;

  +[UIColor clearColor](UIColor, "clearColor");
  v44 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v44;

  +[UIColor clearColor](UIColor, "clearColor");
  v46 = objc_claimAutoreleasedReturnValue();
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v46;

  v2->_rowHeight = 36.0;
  -[UIKeyboardCandidateViewStyle rowHeight](v2, "rowHeight");
  v2->_cellCornerRadius = v48 * 0.5;
  *(_OWORD *)&v2->_extraCellPadding.top = 0u;
  *(_OWORD *)&v2->_extraCellPadding.bottom = 0u;
  v2->_maskedCorners = 15;
  v2->_minimumCellPadding = 12.0;
  *(_OWORD *)&v2->_gridPadding.top = 0u;
  *(_OWORD *)&v2->_gridPadding.bottom = xmmword_18667F5B0;
  __asm { FMOV            V1.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q1;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 0x10000;
  v2->_scrollDisabled = 1;
  v2->_alternativeTextLeftSpacing = 4.0;
  v2->_interRowSpacing = 16.0;
  *(_OWORD *)&v2->_minimumCellWidth = xmmword_18667F5C0;
  *(_OWORD *)&v2->_maximumIconWidth = xmmword_18667F590;
  v2->_columnsCount = 9;
  return v2;
}

+ (id)lightKeyboardStyleForDisambiguation
{
  UIKeyboardCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIColor *textColor;
  uint64_t v7;
  UIColor *alternativeTextColor;
  uint64_t v9;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v11;
  UIColor *candidateNumberColor;
  uint64_t v13;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v15;
  UIColor *backgroundColor;
  uint64_t v17;
  UIColor *gridBackgroundColor;
  uint64_t v19;
  UIColor *highlightedBackgroundColor;
  UIColor *lineColor;

  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  +[UIColor blackColor](UIColor, "blackColor");
  v5 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  objc_storeStrong((id *)&v2->_highlightedTextColor, v2->_textColor);
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha35")));
  v7 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v7;

  -[UIKeyboardCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v9 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v9;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBLegacyCandidateGridPadCellCandidateNumber")));
  v11 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v11;

  -[UIKeyboardCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v13 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v13;

  +[UIColor clearColor](UIColor, "clearColor");
  v15 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v15;

  +[UIColor clearColor](UIColor, "clearColor");
  v17 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v17;

  +[UIColor clearColor](UIColor, "clearColor");
  v19 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v19;

  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_rowHeight = 32.0;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  v2->_maximumIconWidth = 20.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 0x10000;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)darkKeyboardStyleForDisambiguation
{
  UIKeyboardCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIColor *textColor;
  uint64_t v7;
  UIColor *highlightedTextColor;
  uint64_t v9;
  UIColor *alternativeTextColor;
  uint64_t v11;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v13;
  UIColor *candidateNumberColor;
  uint64_t v15;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v17;
  UIColor *backgroundColor;
  uint64_t v19;
  UIColor *cellBackgroundColor;
  uint64_t v21;
  UIColor *gridBackgroundColor;
  uint64_t v23;
  UIColor *highlightedBackgroundColor;
  UIColor *lineColor;

  v2 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  +[UIColor whiteColor](UIColor, "whiteColor");
  v5 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorWhite")));
  v7 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v7;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha35")));
  v9 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v9;

  -[UIKeyboardCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v11 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v11;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBLegacyCandidateGridPadCellCandidateNumber")));
  v13 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v13;

  -[UIKeyboardCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v15;

  +[UIColor clearColor](UIColor, "clearColor");
  v17 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v17;

  +[UIColor clearColor](UIColor, "clearColor");
  v19 = objc_claimAutoreleasedReturnValue();
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v19;

  +[UIColor clearColor](UIColor, "clearColor");
  v21 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v21;

  +[UIColor clearColor](UIColor, "clearColor");
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v23;

  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_rowHeight = 32.0;
  v2->_minimumCellPadding = 10.0;
  v2->_minimumCellWidth = 40.0;
  v2->_maximumIconWidth = 20.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v2->_foregroundOpacity = _Q0;
  v2->_cellTextAlignment = 1;
  v2->_lineBreakMode = 4;
  *(_DWORD *)&v2->_hasShadow = 16842752;
  v2->_alternativeTextLeftSpacing = 5.0;
  return v2;
}

+ (id)styleForDarkKeyboard:(BOOL)a3
{
  if (a3)
    objc_msgSend(a1, "darkKeyboardStyle");
  else
    objc_msgSend(a1, "lightKeyboardStyle");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)disambiguationStyleForDarkKeyboard:(BOOL)a3
{
  if (a3)
    objc_msgSend(a1, "darkKeyboardStyleForDisambiguation");
  else
    objc_msgSend(a1, "lightKeyboardStyleForDisambiguation");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)tvLinearStyleForDarkKeyboard:(BOOL)a3
{
  UIKeyboardCandidateViewStyle *v4;
  uint64_t v5;
  UIFont *candidateFont;
  uint64_t v7;
  UIFont *alternativeTextFont;
  uint64_t v9;
  UIFont *annotationTextFont;
  uint64_t v11;
  UIFont *candidateNumberFont;
  uint64_t v13;
  UIFont *sortControlFont;
  uint64_t v15;
  UIColor *textColor;
  uint64_t v17;
  UIColor *highlightedTextColor;
  void *v19;
  uint64_t v20;
  UIColor *alternativeTextColor;
  void *v22;
  uint64_t v23;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v25;
  UIColor *candidateNumberColor;
  uint64_t v27;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v29;
  UIColor *backgroundColor;
  uint64_t v31;
  UIColor *gridBackgroundColor;
  uint64_t v33;
  UIColor *highlightedBackgroundColor;
  uint64_t v35;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v37;
  UIColor *lineColor;
  uint64_t v39;
  UIColor *sortControlColor;

  v4 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 36.0);
  v5 = objc_claimAutoreleasedReturnValue();
  candidateFont = v4->_candidateFont;
  v4->_candidateFont = (UIFont *)v5;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v7 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v4->_alternativeTextFont;
  v4->_alternativeTextFont = (UIFont *)v7;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v9 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v4->_annotationTextFont;
  v4->_annotationTextFont = (UIFont *)v9;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v11 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v4->_candidateNumberFont;
  v4->_candidateNumberFont = (UIFont *)v11;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v13 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v4->_sortControlFont;
  v4->_sortControlFont = (UIFont *)v13;

  if (a3)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v15 = objc_claimAutoreleasedReturnValue();
  textColor = v4->_textColor;
  v4->_textColor = (UIColor *)v15;

  +[UIColor blackColor](UIColor, "blackColor");
  v17 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v4->_highlightedTextColor;
  v4->_highlightedTextColor = (UIColor *)v17;

  -[UIKeyboardCandidateViewStyle textColor](v4, "textColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorWithAlphaComponent:", 0.4);
  v20 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v4->_alternativeTextColor;
  v4->_alternativeTextColor = (UIColor *)v20;

  -[UIKeyboardCandidateViewStyle highlightedTextColor](v4, "highlightedTextColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "colorWithAlphaComponent:", 0.4);
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v4->_highlightedAlternativeTextColor;
  v4->_highlightedAlternativeTextColor = (UIColor *)v23;

  +[UIColor clearColor](UIColor, "clearColor");
  v25 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v4->_candidateNumberColor;
  v4->_candidateNumberColor = (UIColor *)v25;

  -[UIKeyboardCandidateViewStyle candidateNumberColor](v4, "candidateNumberColor");
  v27 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v4->_highlightedCandidateNumberColor;
  v4->_highlightedCandidateNumberColor = (UIColor *)v27;

  +[UIColor clearColor](UIColor, "clearColor");
  v29 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v4->_backgroundColor;
  v4->_backgroundColor = (UIColor *)v29;

  +[UIColor clearColor](UIColor, "clearColor");
  v31 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v4->_gridBackgroundColor;
  v4->_gridBackgroundColor = (UIColor *)v31;

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9);
  v33 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v4->_highlightedBackgroundColor;
  v4->_highlightedBackgroundColor = (UIColor *)v33;

  +[UIColor clearColor](UIColor, "clearColor");
  v35 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v4->_groupHeaderBackgroundColor;
  v4->_groupHeaderBackgroundColor = (UIColor *)v35;

  +[UIColor clearColor](UIColor, "clearColor");
  v37 = objc_claimAutoreleasedReturnValue();
  lineColor = v4->_lineColor;
  v4->_lineColor = (UIColor *)v37;

  +[UIColor clearColor](UIColor, "clearColor");
  v39 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v4->_sortControlColor;
  v4->_sortControlColor = (UIColor *)v39;

  v4->_columnsCount = 6;
  v4->_minimumCellPadding = 20.0;
  v4->_minimumCellWidth = 60.0;
  v4->_maximumIconWidth = 20.0;
  v4->_cellCornerRadius = 12.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v4->_foregroundOpacity = _Q0;
  v4->_cellTextAlignment = 1;
  v4->_lineBreakMode = 5;
  v4->_rowHeight = 75.0;
  *(_DWORD *)&v4->_hasShadow = 0;
  v4->_alternativeTextLeftSpacing = 5.0;
  return v4;
}

+ (id)tvGridStyleForDarkKeyboard:(BOOL)a3
{
  UIKeyboardCandidateViewStyle *v4;
  uint64_t v5;
  UIFont *candidateFont;
  uint64_t v7;
  UIFont *alternativeTextFont;
  uint64_t v9;
  UIFont *annotationTextFont;
  uint64_t v11;
  UIFont *candidateNumberFont;
  uint64_t v13;
  UIFont *sortControlFont;
  uint64_t v15;
  UIColor *textColor;
  uint64_t v17;
  UIColor *highlightedTextColor;
  void *v19;
  uint64_t v20;
  UIColor *alternativeTextColor;
  void *v22;
  uint64_t v23;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v25;
  UIColor *candidateNumberColor;
  uint64_t v27;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v29;
  UIColor *backgroundColor;
  uint64_t v31;
  UIColor *gridBackgroundColor;
  uint64_t v33;
  UIColor *highlightedBackgroundColor;
  uint64_t v35;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v37;
  UIColor *lineColor;
  uint64_t v39;
  UIColor *sortControlColor;

  v4 = objc_alloc_init(UIKeyboardCandidateViewStyle);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 34.0);
  v5 = objc_claimAutoreleasedReturnValue();
  candidateFont = v4->_candidateFont;
  v4->_candidateFont = (UIFont *)v5;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v7 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v4->_alternativeTextFont;
  v4->_alternativeTextFont = (UIFont *)v7;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 10.0);
  v9 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v4->_annotationTextFont;
  v4->_annotationTextFont = (UIFont *)v9;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v11 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v4->_candidateNumberFont;
  v4->_candidateNumberFont = (UIFont *)v11;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v13 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v4->_sortControlFont;
  v4->_sortControlFont = (UIFont *)v13;

  if (a3)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v15 = objc_claimAutoreleasedReturnValue();
  textColor = v4->_textColor;
  v4->_textColor = (UIColor *)v15;

  +[UIColor blackColor](UIColor, "blackColor");
  v17 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v4->_highlightedTextColor;
  v4->_highlightedTextColor = (UIColor *)v17;

  -[UIKeyboardCandidateViewStyle textColor](v4, "textColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorWithAlphaComponent:", 0.4);
  v20 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v4->_alternativeTextColor;
  v4->_alternativeTextColor = (UIColor *)v20;

  -[UIKeyboardCandidateViewStyle highlightedTextColor](v4, "highlightedTextColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "colorWithAlphaComponent:", 0.4);
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v4->_highlightedAlternativeTextColor;
  v4->_highlightedAlternativeTextColor = (UIColor *)v23;

  +[UIColor clearColor](UIColor, "clearColor");
  v25 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v4->_candidateNumberColor;
  v4->_candidateNumberColor = (UIColor *)v25;

  -[UIKeyboardCandidateViewStyle candidateNumberColor](v4, "candidateNumberColor");
  v27 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v4->_highlightedCandidateNumberColor;
  v4->_highlightedCandidateNumberColor = (UIColor *)v27;

  +[UIColor clearColor](UIColor, "clearColor");
  v29 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v4->_backgroundColor;
  v4->_backgroundColor = (UIColor *)v29;

  +[UIColor clearColor](UIColor, "clearColor");
  v31 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v4->_gridBackgroundColor;
  v4->_gridBackgroundColor = (UIColor *)v31;

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9);
  v33 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v4->_highlightedBackgroundColor;
  v4->_highlightedBackgroundColor = (UIColor *)v33;

  +[UIColor clearColor](UIColor, "clearColor");
  v35 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v4->_groupHeaderBackgroundColor;
  v4->_groupHeaderBackgroundColor = (UIColor *)v35;

  +[UIColor clearColor](UIColor, "clearColor");
  v37 = objc_claimAutoreleasedReturnValue();
  lineColor = v4->_lineColor;
  v4->_lineColor = (UIColor *)v37;

  +[UIColor clearColor](UIColor, "clearColor");
  v39 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v4->_sortControlColor;
  v4->_sortControlColor = (UIColor *)v39;

  v4->_columnsCount = 5;
  v4->_minimumCellPadding = 9.0;
  *(_OWORD *)&v4->_minimumCellWidth = xmmword_18667F5D0;
  v4->_cellCornerRadius = 12.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v4->_foregroundOpacity = _Q0;
  v4->_gridPadding.top = 0.0;
  *(_OWORD *)&v4->_gridPadding.left = 0u;
  v4->_gridPadding.right = 20.0;
  *(_OWORD *)&v4->_gridLinePadding.top = 0u;
  *(_OWORD *)&v4->_gridLinePadding.bottom = xmmword_18667F5E0;
  v4->_cellTextAlignment = 1;
  v4->_lineBreakMode = 5;
  v4->_rowHeight = 64.0;
  v4->_darkBackdrop = 0;
  v4->_alternativeTextLeftSpacing = 5.0;
  *(_DWORD *)&v4->_doNotClipToBounds = 1;
  return v4;
}

- (UIFont)candidateFont
{
  return self->_candidateFont;
}

- (void)setCandidateFont:(id)a3
{
  objc_storeStrong((id *)&self->_candidateFont, a3);
}

- (UIFont)supplementalLexiconCandidateFont
{
  return self->_supplementalLexiconCandidateFont;
}

- (void)setSupplementalLexiconCandidateFont:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalLexiconCandidateFont, a3);
}

- (UIFont)annotationTextFont
{
  return self->_annotationTextFont;
}

- (void)setAnnotationTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_annotationTextFont, a3);
}

- (UIFont)alternativeTextFont
{
  return self->_alternativeTextFont;
}

- (void)setAlternativeTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTextFont, a3);
}

- (UIFont)candidateNumberFont
{
  return self->_candidateNumberFont;
}

- (void)setCandidateNumberFont:(id)a3
{
  objc_storeStrong((id *)&self->_candidateNumberFont, a3);
}

- (UIFont)sortControlFont
{
  return self->_sortControlFont;
}

- (void)setSortControlFont:(id)a3
{
  objc_storeStrong((id *)&self->_sortControlFont, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextColor, a3);
}

- (UIColor)alternativeTextColor
{
  return self->_alternativeTextColor;
}

- (void)setAlternativeTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTextColor, a3);
}

- (UIColor)highlightedAlternativeTextColor
{
  return self->_highlightedAlternativeTextColor;
}

- (void)setHighlightedAlternativeTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedAlternativeTextColor, a3);
}

- (UIColor)candidateNumberColor
{
  return self->_candidateNumberColor;
}

- (void)setCandidateNumberColor:(id)a3
{
  objc_storeStrong((id *)&self->_candidateNumberColor, a3);
}

- (UIColor)highlightedCandidateNumberColor
{
  return self->_highlightedCandidateNumberColor;
}

- (void)setHighlightedCandidateNumberColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedCandidateNumberColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
}

- (UIColor)arrowButtonBackgroundColor
{
  return self->_arrowButtonBackgroundColor;
}

- (void)setArrowButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButtonBackgroundColor, a3);
}

- (BOOL)arrowButtonBackgroundHidden
{
  return self->_arrowButtonBackgroundHidden;
}

- (void)setArrowButtonBackgroundHidden:(BOOL)a3
{
  self->_arrowButtonBackgroundHidden = a3;
}

- (UIColor)arrowButtonColor
{
  return self->_arrowButtonColor;
}

- (void)setArrowButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButtonColor, a3);
}

- (UIColor)gridBackgroundColor
{
  return self->_gridBackgroundColor;
}

- (void)setGridBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_gridBackgroundColor, a3);
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (UIColor)highlightedRowBackgroundColor
{
  return self->_highlightedRowBackgroundColor;
}

- (void)setHighlightedRowBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedRowBackgroundColor, a3);
}

- (UIColor)groupHeaderBackgroundColor
{
  return self->_groupHeaderBackgroundColor;
}

- (void)setGroupHeaderBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_groupHeaderBackgroundColor, a3);
}

- (UIColor)transliterationCandidateBackgroundColor
{
  return self->_transliterationCandidateBackgroundColor;
}

- (void)setTransliterationCandidateBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundColor, a3);
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (UIColor)sortControlColor
{
  return self->_sortControlColor;
}

- (void)setSortControlColor:(id)a3
{
  objc_storeStrong((id *)&self->_sortControlColor, a3);
}

- (UIColor)sortControlBackgroundColor
{
  return self->_sortControlBackgroundColor;
}

- (void)setSortControlBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_sortControlBackgroundColor, a3);
}

- (NSString)arrowButtonImageName
{
  return self->_arrowButtonImageName;
}

- (void)setArrowButtonImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (UIImage)cellSeparatorImage
{
  return self->_cellSeparatorImage;
}

- (void)setCellSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_cellSeparatorImage, a3);
}

- (UIImage)slottedCellSeparatorImage
{
  return self->_slottedCellSeparatorImage;
}

- (void)setSlottedCellSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_slottedCellSeparatorImage, a3);
}

- (UIImage)leftEdgeSeparatorImage
{
  return self->_leftEdgeSeparatorImage;
}

- (void)setLeftEdgeSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_leftEdgeSeparatorImage, a3);
}

- (UIImage)rightEdgeSeparatorImage
{
  return self->_rightEdgeSeparatorImage;
}

- (void)setRightEdgeSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_rightEdgeSeparatorImage, a3);
}

- (UIImage)arrowButtonSeparatorImage
{
  return self->_arrowButtonSeparatorImage;
}

- (void)setArrowButtonSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButtonSeparatorImage, a3);
}

- (UIImage)leftEdgeMaskImage
{
  return self->_leftEdgeMaskImage;
}

- (void)setLeftEdgeMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_leftEdgeMaskImage, a3);
}

- (UIImage)rightEdgeMaskImage
{
  return self->_rightEdgeMaskImage;
}

- (void)setRightEdgeMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_rightEdgeMaskImage, a3);
}

- (UIImage)cellBackgroundImage
{
  return self->_cellBackgroundImage;
}

- (void)setCellBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundImage, a3);
}

- (UIImage)highlightedCellBackgroundImage
{
  return self->_highlightedCellBackgroundImage;
}

- (void)setHighlightedCellBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedCellBackgroundImage, a3);
}

- (UIImage)transliterationCandidateBackgroundImage
{
  return self->_transliterationCandidateBackgroundImage;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)arrowButtonHeight
{
  return self->_arrowButtonHeight;
}

- (void)setArrowButtonHeight:(double)a3
{
  self->_arrowButtonHeight = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cellCornerRadius
{
  return self->_cellCornerRadius;
}

- (void)setCellCornerRadius:(double)a3
{
  self->_cellCornerRadius = a3;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (unint64_t)gridMaskedCorners
{
  return self->_gridMaskedCorners;
}

- (void)setGridMaskedCorners:(unint64_t)a3
{
  self->_gridMaskedCorners = a3;
}

- (double)foregroundOpacity
{
  return self->_foregroundOpacity;
}

- (void)setForegroundOpacity:(double)a3
{
  self->_foregroundOpacity = a3;
}

- (double)backgroundOpacity
{
  return self->_backgroundOpacity;
}

- (void)setBackgroundOpacity:(double)a3
{
  self->_backgroundOpacity = a3;
}

- (BOOL)doNotClipToBounds
{
  return self->_doNotClipToBounds;
}

- (void)setDoNotClipToBounds:(BOOL)a3
{
  self->_doNotClipToBounds = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)roundsArrowButtonEdge
{
  return self->_roundsArrowButtonEdge;
}

- (void)setRoundsArrowButtonEdge:(BOOL)a3
{
  self->_roundsArrowButtonEdge = a3;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (unint64_t)columnsCount
{
  return self->_columnsCount;
}

- (void)setColumnsCount:(unint64_t)a3
{
  self->_columnsCount = a3;
}

- (unint64_t)maxNumberOfProactiveCells
{
  return self->_maxNumberOfProactiveCells;
}

- (void)setMaxNumberOfProactiveCells:(unint64_t)a3
{
  self->_maxNumberOfProactiveCells = a3;
}

- (double)minimumCellPadding
{
  return self->_minimumCellPadding;
}

- (void)setMinimumCellPadding:(double)a3
{
  self->_minimumCellPadding = a3;
}

- (double)minimumCellWidth
{
  return self->_minimumCellWidth;
}

- (void)setMinimumCellWidth:(double)a3
{
  self->_minimumCellWidth = a3;
}

- (double)minimumInterItemSpacing
{
  return self->_minimumInterItemSpacing;
}

- (void)setMinimumInterItemSpacing:(double)a3
{
  self->_minimumInterItemSpacing = a3;
}

- (double)maximumIconWidth
{
  return self->_maximumIconWidth;
}

- (void)setMaximumIconWidth:(double)a3
{
  self->_maximumIconWidth = a3;
}

- (BOOL)shouldJustifyRow
{
  return self->_shouldJustifyRow;
}

- (void)setShouldJustifyRow:(BOOL)a3
{
  self->_shouldJustifyRow = a3;
}

- (double)singleSlottedCellMargin
{
  return self->_singleSlottedCellMargin;
}

- (void)setSingleSlottedCellMargin:(double)a3
{
  self->_singleSlottedCellMargin = a3;
}

- (UIEdgeInsets)extraCellPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_extraCellPadding.top;
  left = self->_extraCellPadding.left;
  bottom = self->_extraCellPadding.bottom;
  right = self->_extraCellPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExtraCellPadding:(UIEdgeInsets)a3
{
  self->_extraCellPadding = a3;
}

- (UIEdgeInsets)arrowButtonPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_arrowButtonPadding.top;
  left = self->_arrowButtonPadding.left;
  bottom = self->_arrowButtonPadding.bottom;
  right = self->_arrowButtonPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setArrowButtonPadding:(UIEdgeInsets)a3
{
  self->_arrowButtonPadding = a3;
}

- (UIEdgeInsets)gridPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridPadding.top;
  left = self->_gridPadding.left;
  bottom = self->_gridPadding.bottom;
  right = self->_gridPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridPadding:(UIEdgeInsets)a3
{
  self->_gridPadding = a3;
}

- (UIEdgeInsets)gridLinePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridLinePadding.top;
  left = self->_gridLinePadding.left;
  bottom = self->_gridLinePadding.bottom;
  right = self->_gridLinePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridLinePadding:(UIEdgeInsets)a3
{
  self->_gridLinePadding = a3;
}

- (CGPoint)gridLineOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_gridLineOffset.x;
  y = self->_gridLineOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGridLineOffset:(CGPoint)a3
{
  self->_gridLineOffset = a3;
}

- (UIEdgeInsets)sortControlPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sortControlPadding.top;
  left = self->_sortControlPadding.left;
  bottom = self->_sortControlPadding.bottom;
  right = self->_sortControlPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSortControlPadding:(UIEdgeInsets)a3
{
  self->_sortControlPadding = a3;
}

- (int64_t)cellTextAlignment
{
  return self->_cellTextAlignment;
}

- (void)setCellTextAlignment:(int64_t)a3
{
  self->_cellTextAlignment = a3;
}

- (int64_t)alternativeTextAlignment
{
  return self->_alternativeTextAlignment;
}

- (void)setAlternativeTextAlignment:(int64_t)a3
{
  self->_alternativeTextAlignment = a3;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (BOOL)darkBackdrop
{
  return self->_darkBackdrop;
}

- (void)setDarkBackdrop:(BOOL)a3
{
  self->_darkBackdrop = a3;
}

- (BOOL)scrollDisabled
{
  return self->_scrollDisabled;
}

- (void)setScrollDisabled:(BOOL)a3
{
  self->_scrollDisabled = a3;
}

- (BOOL)dragGestureDisabled
{
  return self->_dragGestureDisabled;
}

- (void)setDragGestureDisabled:(BOOL)a3
{
  self->_dragGestureDisabled = a3;
}

- (BOOL)allowCandidateGridExpanding
{
  return self->_allowCandidateGridExpanding;
}

- (void)setAllowCandidateGridExpanding:(BOOL)a3
{
  self->_allowCandidateGridExpanding = a3;
}

- (BOOL)showsIndex
{
  return self->_showsIndex;
}

- (void)setShowsIndex:(BOOL)a3
{
  self->_showsIndex = a3;
}

- (BOOL)showExtraLineBeforeFirstRow
{
  return self->_showExtraLineBeforeFirstRow;
}

- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3
{
  self->_showExtraLineBeforeFirstRow = a3;
}

- (BOOL)fillGridWithLines
{
  return self->_fillGridWithLines;
}

- (void)setFillGridWithLines:(BOOL)a3
{
  self->_fillGridWithLines = a3;
}

- (BOOL)dontSelectLastItemByBackwardMoving
{
  return self->_dontSelectLastItemByBackwardMoving;
}

- (void)setDontSelectLastItemByBackwardMoving:(BOOL)a3
{
  self->_dontSelectLastItemByBackwardMoving = a3;
}

- (BOOL)showOneMoreCandidate
{
  return self->_showOneMoreCandidate;
}

- (void)setShowOneMoreCandidate:(BOOL)a3
{
  self->_showOneMoreCandidate = a3;
}

- (BOOL)disableSwitchingSortingMethodByTabKey
{
  return self->_disableSwitchingSortingMethodByTabKey;
}

- (void)setDisableSwitchingSortingMethodByTabKey:(BOOL)a3
{
  self->_disableSwitchingSortingMethodByTabKey = a3;
}

- (BOOL)skipInlineCandidate
{
  return self->_skipInlineCandidate;
}

- (void)setSkipInlineCandidate:(BOOL)a3
{
  self->_skipInlineCandidate = a3;
}

- (BOOL)hidesPartialCandidates
{
  return self->_hidesPartialCandidates;
}

- (void)setHidesPartialCandidates:(BOOL)a3
{
  self->_hidesPartialCandidates = a3;
}

- (int64_t)minimumNumberOfCandidates
{
  return self->_minimumNumberOfCandidates;
}

- (void)setMinimumNumberOfCandidates:(int64_t)a3
{
  self->_minimumNumberOfCandidates = a3;
}

- (double)widthOfGridGradient
{
  return self->_widthOfGridGradient;
}

- (void)setWidthOfGridGradient:(double)a3
{
  self->_widthOfGridGradient = a3;
}

- (BOOL)showCellBorderForSpaceConfirmationCandidate
{
  return self->_showCellBorderForSpaceConfirmationCandidate;
}

- (void)setShowCellBorderForSpaceConfirmationCandidate:(BOOL)a3
{
  self->_showCellBorderForSpaceConfirmationCandidate = a3;
}

- (BOOL)performScalingAnimationOnCellHighlight
{
  return self->_performScalingAnimationOnCellHighlight;
}

- (void)setPerformScalingAnimationOnCellHighlight:(BOOL)a3
{
  self->_performScalingAnimationOnCellHighlight = a3;
}

- (BOOL)arrowButtonHighlightBackgroundHidden
{
  return self->_arrowButtonHighlightBackgroundHidden;
}

- (void)setArrowButtonHighlightBackgroundHidden:(BOOL)a3
{
  self->_arrowButtonHighlightBackgroundHidden = a3;
}

- (UIButtonConfiguration)arrowButtonConfig
{
  return self->_arrowButtonConfig;
}

- (void)setArrowButtonConfig:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButtonConfig, a3);
}

- (UIColor)spaceConfirmationCandidateCellBackgroundColor
{
  return self->_spaceConfirmationCandidateCellBackgroundColor;
}

- (void)setSpaceConfirmationCandidateCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_spaceConfirmationCandidateCellBackgroundColor, a3);
}

- (BOOL)hideLinesOnDisambiguationGridEdges
{
  return self->_hideLinesOnDisambiguationGridEdges;
}

- (void)setHideLinesOnDisambiguationGridEdges:(BOOL)a3
{
  self->_hideLinesOnDisambiguationGridEdges = a3;
}

- (BOOL)maximizeSortControlWidthWithPadding
{
  return self->_maximizeSortControlWidthWithPadding;
}

- (void)setMaximizeSortControlWidthWithPadding:(BOOL)a3
{
  self->_maximizeSortControlWidthWithPadding = a3;
}

- (double)alternativeTextLeftSpacing
{
  return self->_alternativeTextLeftSpacing;
}

- (void)setAlternativeTextLeftSpacing:(double)a3
{
  self->_alternativeTextLeftSpacing = a3;
}

- (UIEdgeInsets)groupHeaderPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_groupHeaderPadding.top;
  left = self->_groupHeaderPadding.left;
  bottom = self->_groupHeaderPadding.bottom;
  right = self->_groupHeaderPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGroupHeaderPadding:(UIEdgeInsets)a3
{
  self->_groupHeaderPadding = a3;
}

- (double)interRowSpacing
{
  return self->_interRowSpacing;
}

- (void)setInterRowSpacing:(double)a3
{
  self->_interRowSpacing = a3;
}

- (BOOL)applyCornerRadiusToAllCandidates
{
  return self->_applyCornerRadiusToAllCandidates;
}

- (void)setApplyCornerRadiusToAllCandidates:(BOOL)a3
{
  self->_applyCornerRadiusToAllCandidates = a3;
}

- (UIImage)autofillExtraCandidateImage
{
  return self->_autofillExtraCandidateImage;
}

- (void)setAutofillExtraCandidateImage:(id)a3
{
  objc_storeStrong((id *)&self->_autofillExtraCandidateImage, a3);
}

- (double)slottedCandidatesIterItemSpacing
{
  return self->_slottedCandidatesIterItemSpacing;
}

- (void)setSlottedCandidatesIterItemSpacing:(double)a3
{
  self->_slottedCandidatesIterItemSpacing = a3;
}

- (NSDictionary)suggestionCandidateHeaderFontAttributes
{
  return self->_suggestionCandidateHeaderFontAttributes;
}

- (void)setSuggestionCandidateHeaderFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionCandidateHeaderFontAttributes, a3);
}

- (NSDictionary)suggestionCandidateBodyFontAttributes
{
  return self->_suggestionCandidateBodyFontAttributes;
}

- (void)setSuggestionCandidateBodyFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionCandidateBodyFontAttributes, a3);
}

- (BOOL)shouldUpdateCollectionViewWidthForArrowButtonVisibility
{
  return self->_shouldUpdateCollectionViewWidthForArrowButtonVisibility;
}

- (void)setShouldUpdateCollectionViewWidthForArrowButtonVisibility:(BOOL)a3
{
  self->_shouldUpdateCollectionViewWidthForArrowButtonVisibility = a3;
}

- (BOOL)hideSlottedCellSeparators
{
  return self->_hideSlottedCellSeparators;
}

- (void)setHideSlottedCellSeparators:(BOOL)a3
{
  self->_hideSlottedCellSeparators = a3;
}

- (NSString)proactiveCandidateContentsGravity
{
  return self->_proactiveCandidateContentsGravity;
}

- (void)setProactiveCandidateContentsGravity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (BOOL)shouldScrollIfShowingLastVisibleRow
{
  return self->_shouldScrollIfShowingLastVisibleRow;
}

- (void)setShouldScrollIfShowingLastVisibleRow:(BOOL)a3
{
  self->_shouldScrollIfShowingLastVisibleRow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveCandidateContentsGravity, 0);
  objc_storeStrong((id *)&self->_suggestionCandidateBodyFontAttributes, 0);
  objc_storeStrong((id *)&self->_suggestionCandidateHeaderFontAttributes, 0);
  objc_storeStrong((id *)&self->_autofillExtraCandidateImage, 0);
  objc_storeStrong((id *)&self->_spaceConfirmationCandidateCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_arrowButtonConfig, 0);
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundImage, 0);
  objc_storeStrong((id *)&self->_highlightedCellBackgroundImage, 0);
  objc_storeStrong((id *)&self->_cellBackgroundImage, 0);
  objc_storeStrong((id *)&self->_rightEdgeMaskImage, 0);
  objc_storeStrong((id *)&self->_leftEdgeMaskImage, 0);
  objc_storeStrong((id *)&self->_arrowButtonSeparatorImage, 0);
  objc_storeStrong((id *)&self->_rightEdgeSeparatorImage, 0);
  objc_storeStrong((id *)&self->_leftEdgeSeparatorImage, 0);
  objc_storeStrong((id *)&self->_slottedCellSeparatorImage, 0);
  objc_storeStrong((id *)&self->_cellSeparatorImage, 0);
  objc_storeStrong((id *)&self->_arrowButtonImageName, 0);
  objc_storeStrong((id *)&self->_sortControlBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sortControlColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_groupHeaderBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedRowBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gridBackgroundColor, 0);
  objc_storeStrong((id *)&self->_arrowButtonColor, 0);
  objc_storeStrong((id *)&self->_arrowButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedCandidateNumberColor, 0);
  objc_storeStrong((id *)&self->_candidateNumberColor, 0);
  objc_storeStrong((id *)&self->_highlightedAlternativeTextColor, 0);
  objc_storeStrong((id *)&self->_alternativeTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_sortControlFont, 0);
  objc_storeStrong((id *)&self->_candidateNumberFont, 0);
  objc_storeStrong((id *)&self->_alternativeTextFont, 0);
  objc_storeStrong((id *)&self->_annotationTextFont, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconCandidateFont, 0);
  objc_storeStrong((id *)&self->_candidateFont, 0);
}

@end
