@implementation NSTextLayoutFragment

- (void)layout
{
  NSOperationQueue *v3;
  _QWORD v4[5];

  if (-[NSTextLayoutFragment state](self, "state") != NSTextLayoutFragmentStateLayoutAvailable
    && -[NSTextLayoutFragment textElement](self, "textElement"))
  {
    v3 = -[NSTextLayoutFragment layoutQueue](self, "layoutQueue");
    if (v3)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __30__NSTextLayoutFragment_layout__block_invoke;
      v4[3] = &unk_1E2602FF0;
      v4[4] = self;
      -[NSOperationQueue addOperationWithBlock:](v3, "addOperationWithBlock:", v4);
    }
    else
    {
      -[NSTextLayoutFragment _layout](self, "_layout");
    }
  }
}

- (NSTextLayoutFragmentState)state
{
  return self->_state;
}

- (CGRect)layoutFragmentFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_sync_enter(self);
  x = self->_layoutFragmentFrame.origin.x;
  y = self->_layoutFragmentFrame.origin.y;
  width = self->_layoutFragmentFrame.size.width;
  height = self->_layoutFragmentFrame.size.height;
  objc_sync_exit(self);
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (NSArray)textLineFragments
{
  return (NSArray *)objc_getProperty(self, a2, 400, 1);
}

- (NSTextRange)rangeInElement
{
  NSTextRange *rangeInElement;
  id Weak;
  void *v5;
  NSTextRange *v6;

  rangeInElement = self->_rangeInElement;
  if (!rangeInElement)
  {
    Weak = objc_loadWeak((id *)&self->_textElement);
    v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(Weak, "childElements"), "firstObject"), "elementRange"), "location");
    v6 = (NSTextRange *)objc_msgSend(Weak, "elementRange");
    rangeInElement = v6;
    if (v5 && (objc_msgSend(v5, "isEqual:", -[NSTextRange location](v6, "location")) & 1) == 0)
    {
      if (objc_msgSend(-[NSTextRange location](self->_contentRange, "location"), "isEqual:", -[NSTextRange location](rangeInElement, "location"))&& objc_msgSend(-[NSTextRange endLocation](self->_contentRange, "endLocation"), "isEqual:", v5))
      {
        rangeInElement = self->_contentRange;
      }
      else
      {

        rangeInElement = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", -[NSTextRange location](rangeInElement, "location"), v5);
        self->_contentRange = rangeInElement;
      }
    }
    if (!rangeInElement)
    {
      if (rangeInElement_onceToken != -1)
        dispatch_once(&rangeInElement_onceToken, &__block_literal_global);
      return (NSTextRange *)rangeInElement_emptyRange;
    }
  }
  return rangeInElement;
}

- (NSTextParagraph)textParagraph
{
  if (self->_isTextParagraph)
    return (NSTextParagraph *)objc_loadWeak((id *)&self->_textElement);
  else
    return 0;
}

+ (BOOL)coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled
{
  if (coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken != -1)
    dispatch_once(&coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_onceToken, &__block_literal_global_28);
  return coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled;
}

- (void)setTextLayoutManager:(id)a3
{
  NSTextLayoutManager **p_textLayoutManager;

  p_textLayoutManager = &self->_textLayoutManager;
  if (objc_loadWeak((id *)&self->_textLayoutManager) != a3)
    objc_storeWeak((id *)p_textLayoutManager, a3);
}

- (NSOperationQueue)layoutQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 408, 1);
}

- (NSArray)textAttachmentViewProviders
{
  NSArray *result;

  result = -[_NSTextAttachmentLayoutContext textAttachmentViewProviders](self->_textAttachmentLayoutContext, "textAttachmentViewProviders");
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

- (CGSize)layoutSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)coreTypesetter:(id)a3 isSimpleRectangularTextContainerForStartingCharacterAtIndex:(int64_t)a4
{
  id v4;

  v4 = -[NSTextLayoutFragment _textContainerAtStringIndex:](self, "_textContainerAtStringIndex:", a4);
  if (v4)
    return objc_msgSend(v4, "isSimpleRectangularTextContainer");
  else
    return 1;
}

- (id)_textContainerAtStringIndex:(int64_t)a3
{
  NSTextLayoutManager *v5;
  NSTextLayoutManager *v6;
  NSTextRange *v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager");
  if (v5)
  {
    v6 = v5;
    v7 = -[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange");
    v8 = -[NSTextRange location](v7, "location");
    v9 = (id)v8;
    if (a3 < 1)
    {
      if (v8)
        return -[NSTextLayoutManager textContainerForLocation:](v6, "textContainerForLocation:", v9);
    }
    else
    {
      if (self->_isTextParagraph)
        v10 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](-[NSTextLayoutFragment textParagraph](self, "textParagraph"), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3, 0, 0);
      else
        v10 = -[NSTextLayoutManager locationFromLocation:withOffset:](v6, "locationFromLocation:withOffset:", v8, a3);
      v9 = v10;
      if (v10 && -[NSTextRange containsLocation:](v7, "containsLocation:", v10))
        return -[NSTextLayoutManager textContainerForLocation:](v6, "textContainerForLocation:", v9);
    }
  }
  return 0;
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke_3(uint64_t a1, void *a2, char a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGFloat updated;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CGRect v21;

  objc_msgSend(a2, "typographicBounds");
  v7 = v6;
  v9 = v8;
  v11 = *(double *)(a1 + 64) + v10;
  v13 = v12 + *(double *)(a1 + 72);
  if ((a3 & 1) != 0 && *(_BYTE *)(a1 + 96))
  {
    v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
    objc_msgSend(a2, "setIsExtra:", 1);
    if (!*(_BYTE *)(a1 + 97))
      v11 = v11 - *(double *)(a1 + 80);
    if (v14)
    {
      objc_msgSend(v14, "typographicBounds");
      v13 = v13 + CGRectGetMaxY(v21) + *(double *)(a1 + 88);
    }
  }
  if ((a3 & 2) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(a2, "setTypographicBounds:", v11, v13, v7, v9);
  objc_msgSend(a2, "setTextLayoutFragment:", objc_loadWeak((id *)(a1 + 56)));
  objc_msgSend(a2, "setRendersTextCorrectionMarkers:", *(unsigned __int8 *)(a1 + 98));
  updated = __NSTextLayoutFragmentUpdateTotalBoundsWithTypographicBounds(v11, v13, v7, v9, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(CGFloat *)(v16 + 32) = updated;
  *(_QWORD *)(v16 + 40) = v17;
  *(_QWORD *)(v16 + 48) = v18;
  *(_QWORD *)(v16 + 56) = v19;
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (void)_layout
{
  NSTextParagraph *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSTextLayoutManager *v19;
  BOOL v20;
  BOOL v21;
  char v22;
  double v23;
  double v24;
  double v25;
  NSAttributedString *v26;
  __int128 v27;
  void *v28;
  double MinX;
  id v30;
  double v31;
  double v32;
  double v33;
  _BOOL4 v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  _BOOL4 v45;
  double v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat updated;
  CGFloat *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSCoreTypesetter *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  NSArray *v71;
  CGFloat *v72;
  double v73;
  double v74;
  double *v75;
  double v76;
  void *v77;
  void *v78;
  uint64_t v79;
  _BOOL8 v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSTextRange *v87;
  id v88;
  BOOL v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  double v94;
  double v95;
  _BOOL4 v96;
  unsigned int v97;
  NSUInteger v98;
  _QWORD v99[5];
  _QWORD v100[7];
  id v101[5];
  BOOL v102;
  char v103;
  BOOL v104;
  id location;
  _QWORD v106[7];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[8];
  BOOL v112;
  uint64_t v113;
  CGFloat *v114;
  uint64_t v115;
  const char *v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  void (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  _BYTE v129[128];
  uint64_t v130;
  CGRect v131;
  CGRect v132;

  v130 = *MEMORY[0x1E0C80C00];
  if (self->_isTextParagraph
    && -[NSTextLayoutFragment state](self, "state") != NSTextLayoutFragmentStateLayoutAvailable
    && -[NSTextLayoutFragment textElement](self, "textElement"))
  {
    v3 = -[NSTextLayoutFragment textParagraph](self, "textParagraph");
    v98 = -[NSArray count](self->_textLineFragmentsExcludingExtra, "count");
    if (-[NSTextParagraph isEndOfParagraph](v3, "isEndOfParagraph"))
      v96 = -[NSTextElement isEndOfDocument](v3, "isEndOfDocument");
    else
      v96 = 0;
    v97 = objc_msgSend((id)objc_opt_class(), "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled");
    v123 = 0;
    v124 = &v123;
    v125 = 0x3052000000;
    v126 = __Block_byref_object_copy__0;
    v127 = __Block_byref_object_dispose__0;
    v128 = 0;
    if (v98)
      v4 = (id)-[NSArray mutableCopy](self->_textLineFragmentsExcludingExtra, "mutableCopy");
    else
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v128 = v4;
    v5 = -[NSTextLayoutManager textContainerForLocation:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "textContainerForLocation:", -[NSTextRange location](-[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange"), "location"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "size");
      v8 = v7;
      v10 = v9;
      v11 = objc_msgSend(v6, "layoutOrientation");
      objc_msgSend(v6, "lineFragmentPadding");
      v95 = v12;
    }
    else
    {
      v11 = 0;
      v8 = *MEMORY[0x1E0CB3440];
      v10 = *(double *)(MEMORY[0x1E0CB3440] + 8);
      v95 = 0.0;
    }
    -[NSTextLayoutFragment leadingPadding](self, "leadingPadding");
    v14 = v13;
    -[NSTextLayoutFragment trailingPadding](self, "trailingPadding");
    v16 = v15;
    -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
    v18 = v17;
    v19 = -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager");
    v88 = -[NSTextRange location](-[NSTextElement elementRange](v3, "elementRange"), "location");
    v20 = -[NSTextLayoutFragment rendersTextCorrectionMarkers](self, "rendersTextCorrectionMarkers");
    v21 = -[NSTextLayoutManager usesFontLeading](v19, "usesFontLeading");
    v22 = objc_msgSend(-[NSTextRange location](-[NSTextElement elementRange](v3, "elementRange"), "location"), "isEqual:", -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location"));
    v119 = 0;
    v120 = &v119;
    v121 = 0x2020000000;
    v122 = 0;
    -[NSTextLayoutFragment topMargin](self, "topMargin");
    v92 = v23;
    -[NSTextLayoutFragment bottomMargin](self, "bottomMargin");
    v25 = v24;
    v26 = -[NSTextParagraph attributedString](v3, "attributedString");
    v113 = 0;
    v114 = (CGFloat *)&v113;
    v115 = 0x4010000000;
    v116 = "";
    v27 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v117 = *MEMORY[0x1E0C9D648];
    v118 = v27;
    v94 = v25;
    if (v98)
    {
      if (v96)
      {
        v28 = (void *)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithAttributedString:", v26);
        v90 = objc_msgSend(v28, "length");
        objc_msgSend((id)objc_msgSend((id)v124[5], "lastObject"), "typographicBounds");
        v91 = 0;
        v18 = v18 + CGRectGetMaxY(v131);
      }
      else
      {
        v90 = 0;
        v91 = 0;
        v28 = 0;
      }
      -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
      MinX = CGRectGetMinX(v132);
      v30 = -[NSAttributedString attribute:atIndex:effectiveRange:](v26, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), 0, 0);
      v31 = MinX - v95;
      if (v30)
      {
        objc_msgSend(v30, "paragraphSpacing");
        v33 = v32;
        if (v32 != 0.0
          && -[NSTextParagraph isEndOfParagraph](v3, "isEndOfParagraph")
          && objc_msgSend(-[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextElement elementRange](v3, "elementRange"), "endLocation")))
        {
          v34 = -[NSTextElement isEndOfDocument](v3, "isEndOfDocument");
          v93 = 0;
          v35 = -0.0;
          if (!v34)
            v35 = v33;
          v94 = v25 + v35;
        }
        else
        {
          v93 = 0;
        }
      }
      else
      {
        v93 = 0;
        v33 = 0.0;
      }
    }
    else
    {
      if ((v22 & 1) != 0)
      {
        v28 = (void *)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithAttributedString:", v26);
        v93 = 0;
      }
      else
      {
        v93 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v3, "rangeForLocation:allowsTrailingEdge:", -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location"), 1);
        v28 = (void *)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithAttributedString:", -[NSAttributedString attributedSubstringFromRange:](v26, "attributedSubstringFromRange:", v93, -[NSAttributedString length](v26, "length") - v93));
      }
      v91 = objc_msgSend(v28, "length");
      objc_msgSend(v28, "beginEditing");
      v36 = objc_msgSend(v28, "length");
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __31__NSTextLayoutFragment__layout__block_invoke;
      v111[3] = &unk_1E2602F50;
      v111[4] = v3;
      v111[5] = self;
      v111[6] = v28;
      v111[7] = v19;
      v112 = v21;
      objc_msgSend(v28, "enumerateAttributesInRange:options:usingBlock:", 0, v36, 0x100000, v111);
      -[NSTextLayoutManager _prepareAttributedString:forTextLayoutFragment:](v19, "_prepareAttributedString:forTextLayoutFragment:", v28, self);
      objc_msgSend(v28, "endEditing");
      v90 = 0;
      v33 = 0.0;
      if (objc_msgSend(v28, "length"))
      {
        v37 = (void *)objc_msgSend(v28, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), 0, 0);
        v38 = v37;
        if (v37)
        {
          objc_msgSend(v37, "paragraphSpacingBefore");
          v40 = v39;
          if (v39 != 0.0
            && -[NSTextParagraph isBeginningOfParagraph](v3, "isBeginningOfParagraph")
            && objc_msgSend(v88, "isEqual:", -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location")))
          {
            v41 = -[NSTextElement isBeginningOfDocument](v3, "isBeginningOfDocument");
            v42 = -0.0;
            if (!v41)
              v42 = v40;
            v92 = v92 + v42;
          }
          objc_msgSend(v38, "paragraphSpacing");
          v44 = v43;
          if (v43 != 0.0
            && -[NSTextParagraph isEndOfParagraph](v3, "isEndOfParagraph")
            && objc_msgSend(-[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextElement elementRange](v3, "elementRange"), "endLocation")))
          {
            v45 = -[NSTextElement isEndOfDocument](v3, "isEndOfDocument");
            v46 = -0.0;
            if (!v45)
              v46 = v44;
            v94 = v25 + v46;
          }
        }
      }
      v31 = 0.0;
    }
    if (v96)
    {
      v47 = -[NSArray firstObject](-[NSTextLayoutManager textSelections](v19, "textSelections"), "firstObject");
      v48 = (void *)objc_msgSend((id)objc_msgSend(v47, "textRanges"), "firstObject");
      v49 = -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](v19, "textContentManager"), "documentRange"), "endLocation");
      if (v48)
      {
        v50 = v49;
        if (objc_msgSend(v48, "isEmpty"))
        {
          if (objc_msgSend((id)objc_msgSend(v48, "location"), "isEqual:", v50))
          {
            v51 = (void *)objc_msgSend(v47, "typingAttributes");
            if (objc_msgSend(v51, "count"))
              -[NSTextLayoutFragment setExtraLineFragmentAttributes:](self, "setExtraLineFragmentAttributes:", v51);
          }
        }
      }
    }
    if (v14 == 0.0 && v16 == 0.0 || -[NSTextLayoutFragment _baseWritingDirection](self, "_baseWritingDirection"))
    {
      v52 = v18;
      v53 = v14;
    }
    else
    {
      v52 = v18;
      v53 = v16;
      v16 = v14;
    }
    v89 = v20;
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v54 = (void *)v124[5];
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v108 != v56)
            objc_enumerationMutation(v54);
          objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "typographicBounds");
          updated = __NSTextLayoutFragmentUpdateTotalBoundsWithTypographicBounds(v58, v59, v60, v61, v114[4], v114[5], v114[6], v114[7]);
          v63 = v114;
          v114[4] = updated;
          *((_QWORD *)v63 + 5) = v64;
          *((_QWORD *)v63 + 6) = v65;
          *((_QWORD *)v63 + 7) = v66;
        }
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
      }
      while (v55);
    }
    if (v28)
    {
      v67 = objc_alloc_init(NSCoreTypesetter);
      -[NSTextLayoutManager _configureCoreTypesetter:forTextParagraph:textContainer:](v19, "_configureCoreTypesetter:forTextParagraph:textContainer:", v67, v3, v6);
      -[NSTypesetter setAttributedString:](v67, "setAttributedString:", v28);
      -[NSCoreTypesetter setCharacterRange:](v67, "setCharacterRange:", v90, v91);
      -[NSCoreTypesetter setTextContainerSize:](v67, "setTextContainerSize:", v8 - (v53 + v16), v10);
      -[NSCoreTypesetter setRequiresCTLineRef:](v67, "setRequiresCTLineRef:", -[NSTextLayoutManager requiresCTLineRef](v19, "requiresCTLineRef"));
      -[NSCoreTypesetter setWantsExtraLineFragment:](v67, "setWantsExtraLineFragment:", v96);
      if (-[NSTextLayoutFragment extraLineFragmentAttributes](self, "extraLineFragmentAttributes"))
        -[NSCoreTypesetter set_extraLineFragmentAttributes:](v67, "set_extraLineFragmentAttributes:", -[NSTextLayoutFragment extraLineFragmentAttributes](self, "extraLineFragmentAttributes"));
      -[NSCoreTypesetter setKeyframe:](v67, "setKeyframe:", -[NSTextLayoutFragment keyframe](self, "keyframe"));
      -[NSCoreTypesetter setForcedLineBreaks:](v67, "setForcedLineBreaks:", -[NSTextLayoutFragment forcedLineBreaks](self, "forcedLineBreaks"));
      v68 = objc_msgSend(v6, "maximumNumberOfLines");
      if (v68 >= 1)
      {
        if (-[NSTextLayoutManager _currentTextLayoutFragmentEnumerated](v19, "_currentTextLayoutFragmentEnumerated") == self)
        {
          v69 = -[NSTextLayoutManager _numberOfLinesToCurrentlyEnumeratedTextLayoutFragment](v19, "_numberOfLinesToCurrentlyEnumeratedTextLayoutFragment");
          v68 = v68 - v69 - objc_msgSend((id)v124[5], "count");
        }
        -[NSCoreTypesetter setMaximumNumberOfLines:](v67, "setMaximumNumberOfLines:", v68);
      }
      -[NSCoreTypesetter setContainerBreakMode:](v67, "setContainerBreakMode:", objc_msgSend(v6, "lineBreakMode"));
      -[NSCoreTypesetter setEnforcesMinimumTextLineFragment:](v67, "setEnforcesMinimumTextLineFragment:", objc_msgSend(-[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location"), "isEqual:", -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](v19, "textContentManager"), "documentRange"), "location")));
      -[NSCoreTypesetter setTypographicBoundsIncludesLineFragmentPadding:](v67, "setTypographicBoundsIncludesLineFragmentPadding:", v97);
      -[NSCoreTypesetter setLayoutOrientation:](v67, "setLayoutOrientation:", v11);
      -[NSTypesetter setLineFragmentPadding:](v67, "setLineFragmentPadding:", v95);
      -[NSTextLayoutManager delegate](v19, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __31__NSTextLayoutFragment__layout__block_invoke_2;
        v106[3] = &unk_1E2602F78;
        v106[4] = v19;
        v106[5] = v3;
        v106[6] = v88;
        v70 = v106;
      }
      else
      {
        v70 = 0;
      }
      -[NSCoreTypesetter setValidateLineBreakIndex:](v67, "setValidateLineBreakIndex:", v70);
      -[NSCoreTypesetter setDelegate:](v67, "setDelegate:", self);
      objc_initWeak(&location, self);
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __31__NSTextLayoutFragment__layout__block_invoke_3;
      v100[3] = &unk_1E2602FA0;
      v101[1] = *(id *)&v16;
      v101[2] = *(id *)&v92;
      v102 = v98 != 0;
      v103 = v97;
      v101[3] = *(id *)&v31;
      v101[4] = *(id *)&v33;
      v100[4] = &v123;
      v100[5] = &v119;
      objc_copyWeak(v101, &location);
      v104 = v89;
      v100[6] = &v113;
      -[NSCoreTypesetter setLaidOutLineFragment:](v67, "setLaidOutLineFragment:", v100);
      -[_NSTextAttachmentLayoutContext setTextContainer:](self->_textAttachmentLayoutContext, "setTextContainer:", v6);
      -[NSCoreTypesetter layoutWithYOrigin:](v67, "layoutWithYOrigin:", v52);
      v71 = -[NSTextLayoutFragment _createTruncatedTextRangesFromRanges:characterIndexDelta:](self, "_createTruncatedTextRangesFromRanges:characterIndexDelta:", -[NSCoreTypesetter truncatedRanges](v67, "truncatedRanges"), v93);

      objc_destroyWeak(v101);
      objc_destroyWeak(&location);
    }
    else
    {
      v71 = 0;
    }
    -[NSTextLayoutFragment setTextLineFragments:](self, "setTextLineFragments:", v124[5]);
    v72 = v114;
    v73 = v53 + v114[6];
    v74 = v94 + v114[7];
    v114[6] = v73;
    v72[7] = v74;
    if (v8 > 0.0)
    {
      if (v73 >= v8)
        v73 = v8;
      v72[6] = v73;
    }
    if (v10 > 0.0)
    {
      if (v74 >= v10)
        v74 = v10;
      v72[7] = v74;
    }
    if (objc_msgSend((id)v124[5], "count"))
    {
      if (v97)
      {
        v75 = v114;
        v76 = v114[4];
      }
      else
      {
        v77 = (void *)v124[5];
        v99[0] = MEMORY[0x1E0C809B0];
        v99[1] = 3221225472;
        v99[2] = __31__NSTextLayoutFragment__layout__block_invoke_4;
        v99[3] = &unk_1E2602FC8;
        v99[4] = &v113;
        objc_msgSend(v77, "enumerateObjectsUsingBlock:", v99);
        v75 = v114;
        v76 = v95 + v31 + v114[4];
        v114[4] = v76;
      }
      -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", v76, v75[5], v75[6], v75[7]);
      -[NSTextLayoutFragment setState:](self, "setState:", 3);
      if ((v97 & 1) == 0)
        -[_NSTextAttachmentLayoutContext invalidateAttachmentFrames](self->_textAttachmentLayoutContext, "invalidateAttachmentFrames");
      if (!v98)
      {
        v78 = (void *)objc_msgSend((id)v124[5], "lastObject");
        v79 = -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextLayoutManager textContentManager](v19, "textContentManager"), "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextParagraph paragraphContentRange](v3, "paragraphContentRange"), "location"), -[NSTextRange endLocation](-[NSTextParagraph paragraphContentRange](v3, "paragraphContentRange"), "endLocation"));
        if (*((_BYTE *)v120 + 24))
        {
          v80 = 1;
        }
        else
        {
          v81 = v79;
          v82 = objc_msgSend(v78, "characterRange");
          v80 = v82 + v83 < v81;
        }
        -[NSTextLayoutFragment setHasPartialLayout:](self, "setHasPartialLayout:", v80);
        if (-[NSTextLayoutFragment hasPartialLayout](self, "hasPartialLayout"))
        {
          v84 = objc_msgSend((id)objc_msgSend((id)v124[5], "lastObject"), "characterRange");
          v86 = -[NSTextParagraph locationForCharacterIndex:actualRange:](v3, "locationForCharacterIndex:actualRange:", v85 + v93 + v84, 0);
          if (v86)
          {
            v87 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location"), v86);
            -[NSTextLayoutFragment _setRangeInElement:](self, "_setRangeInElement:", v87);

          }
        }
      }
    }
    if (!-[NSTextLayoutFragment keyframe](self, "keyframe"))
      -[NSTextLayoutManager updateLayoutWithTextLayoutFragment:addition:](v19, "updateLayoutWithTextLayoutFragment:addition:", self, 1);

    self->_truncatedRanges = v71;
    _Block_object_dispose(&v113, 8);
    _Block_object_dispose(&v119, 8);
    _Block_object_dispose(&v123, 8);
  }
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (void)estimateSize
{
  NSTextLayoutManager *v3;
  id v4;
  double v5;
  double v6;
  NSTextLayoutFragmentState v7;
  NSTextLayoutFragmentState v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;

  v3 = -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager");
  v4 = -[NSTextLayoutManager textContainerForLocation:](v3, "textContainerForLocation:", -[NSTextRange location](-[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange"), "location"));
  if (v4)
  {
    objc_msgSend(v4, "size");
    v6 = v5;
  }
  else
  {
    v6 = *MEMORY[0x1E0CB3440];
  }
  v7 = -[NSTextLayoutFragment state](self, "state");
  if (v3)
  {
    v8 = v7;
    if (v7 <= NSTextLayoutFragmentStateEstimatedUsageBounds)
    {
      -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
      x = v22.origin.x;
      y = v22.origin.y;
      width = v22.size.width;
      height = v22.size.height;
      if (CGRectEqualToRect(v22, *MEMORY[0x1E0C9D648])
        || v8 == NSTextLayoutFragmentStateEstimatedUsageBounds
        && (v23.origin.x = x,
            v23.origin.y = y,
            v23.size.width = width,
            v23.size.height = height,
            CGRectGetWidth(v23) != v6)
        && !-[NSArray count](-[NSTextLayoutFragment textLineFragmentsExcludingExtra](self, "textLineFragmentsExcludingExtra"), "count"))
      {
        -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
        v14 = v13;
        -[NSTextElement estimatedIntrinsicContentSizeForTextLayoutManager:](-[NSTextLayoutFragment textElement](self, "textElement"), "estimatedIntrinsicContentSizeForTextLayoutManager:", v3);
        v16 = v15;
        v18 = v17;
        -[NSTextLayoutFragment topMargin](self, "topMargin");
        v20 = v19;
        -[NSTextLayoutFragment bottomMargin](self, "bottomMargin");
        -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", 0.0, v14, v16, v18 + v20 + v21);
      }
      -[NSTextLayoutFragment setState:](self, "setState:", 1);
    }
  }
}

- (NSTextElement)textElement
{
  return (NSTextElement *)objc_loadWeak((id *)&self->_textElement);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setLayoutFragmentFrameOrigin:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  objc_sync_enter(self);
  -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", x, y, self->_layoutFragmentFrame.size.width, self->_layoutFragmentFrame.size.height);
  objc_sync_exit(self);
}

- (void)setLayoutFragmentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_sync_enter(self);
  self->_layoutFragmentFrame.origin.x = x;
  self->_layoutFragmentFrame.origin.y = y;
  self->_layoutFragmentFrame.size.width = width;
  self->_layoutFragmentFrame.size.height = height;
  objc_sync_exit(self);
}

- (void)setTextLineFragments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (BOOL)hasPartialLayout
{
  return self->_hasPartialLayout;
}

- (CGFloat)topMargin
{
  return 0.0;
}

- (CGFloat)bottomMargin
{
  return 0.0;
}

- (void)setHasPartialLayout:(BOOL)a3
{
  self->_hasPartialLayout = a3;
}

- (BOOL)rendersTextCorrectionMarkers
{
  return self->_rendersTextCorrectionMarkers;
}

- (int64_t)_baseWritingDirection
{
  int64_t v3;
  int64_t result;

  v3 = -[NSTextLayoutManager _fallbackWritingDirection](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "_fallbackWritingDirection");
  if (!self->_isTextParagraph)
    return +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
  result = -[NSTextParagraph _resolvedBaseWritingDirectionWithFallbackDirection:](-[NSTextLayoutFragment textParagraph](self, "textParagraph"), "_resolvedBaseWritingDirectionWithFallbackDirection:", v3);
  if (result == -1)
    return +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
  return result;
}

- (CGFloat)trailingPadding
{
  return 0.0;
}

- (CGFloat)leadingPadding
{
  return 0.0;
}

- (void)setExtraLineFragmentAttributes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (void)drawAtPoint:(CGPoint)point inContext:(CGContextRef)context
{
  double y;
  double x;
  NSTextRange *rangeInElement;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  y = point.y;
  x = point.x;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[NSTextLayoutFragment textElement](self, "textElement"))
  {
    if ((unint64_t)-[NSTextLayoutFragment state](self, "state") <= NSTextLayoutFragmentStateCalculatedUsageBounds)
      -[NSTextLayoutFragment layout](self, "layout");
    rangeInElement = self->_rangeInElement;
    if (!rangeInElement)
      rangeInElement = -[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange");
    v9 = (void *)objc_msgSend(objc_loadWeak((id *)&self->_textLayoutManager), "_textAnimationContextForLocation:", -[NSTextRange location](rangeInElement, "location"));
    v10 = v9;
    if (!v9 || objc_msgSend(v9, "_hasRenderableComponentsForRange:", rangeInElement))
    {
      __NSTextLayoutFragmentConfigureForTextAnimationContext((uint64_t)self, v10);
      CGContextSaveGState(context);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments", 0);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (!v10
              || objc_msgSend(v10, "_hasRenderableComponentsForRange:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "textLineFragmentRange")))
            {
              objc_msgSend(v15, "typographicBounds");
              v17 = v16;
              objc_msgSend(v15, "typographicBounds");
              objc_msgSend(v15, "drawAtPoint:inContext:", context, x + v17, y + v18);
            }
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }
      __NSTextLayoutFragmentConfigureForTextAnimationContext((uint64_t)self, 0);
      CGContextRestoreGState(context);
    }
  }
}

- (_NSTextAttachmentLayoutContext)textAttachmentLayoutContext
{
  return (_NSTextAttachmentLayoutContext *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textElement);
  objc_destroyWeak((id *)&self->_textLayoutManager);
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke_4(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a2, "typographicBounds");
  return objc_msgSend(a2, "setTypographicBounds:", v4 - CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)), v5, v6, v7);
}

- (CGRect)renderingSurfaceBounds
{
  double v3;
  double v4;
  double v5;
  CGFloat width;
  double v7;
  CGFloat height;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat y;
  double x;
  uint64_t i;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect result;
  CGRect v50;
  CGRect v51;

  v44 = *MEMORY[0x1E0C80C00];
  -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
  v4 = v3;
  width = v5;
  height = v7;
  if (objc_msgSend((id)objc_opt_class(), "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments");
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      y = 0.0;
      x = v4;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "boundsWithType:options:", 2, 0);
          v50.origin.x = v16;
          v50.origin.y = v17;
          v50.size.width = v18;
          v50.size.height = v19;
          v45.origin.x = x;
          v45.origin.y = y;
          v45.size.width = width;
          v45.size.height = height;
          v46 = CGRectUnion(v45, v50);
          x = v46.origin.x;
          y = v46.origin.y;
          width = v46.size.width;
          height = v46.size.height;
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v11);
    }
    else
    {
      y = 0.0;
      x = v4;
    }
    v20 = x - v4;
  }
  else
  {
    v20 = *MEMORY[0x1E0CB3438];
    y = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments", 0);
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "boundsWithType:options:", 2, 0);
          v51.origin.x = v26;
          v51.origin.y = v27;
          v51.size.width = v28;
          v51.size.height = v29;
          v47.origin.x = v20;
          v47.origin.y = y;
          v47.size.width = width;
          v47.size.height = height;
          v48 = CGRectUnion(v47, v51);
          v20 = v48.origin.x;
          y = v48.origin.y;
          width = v48.size.width;
          height = v48.size.height;
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v23);
    }
  }
  v30 = v20;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)_resolvedRenderingAttributesForCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSTextParagraph *v7;
  NSTextLayoutManager *v8;
  NSTextRange *v9;
  NSTextRange *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSTextRange *v17;
  NSTextRange *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSTextContentManager *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  uint64_t v29;
  NSUInteger v30;
  BOOL v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  NSTextRange *v39;
  _QWORD v40[6];
  _QWORD v41[8];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  uint64_t v57;

  v7 = -[NSTextLayoutFragment textParagraph](self, "textParagraph");
  v8 = -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager");
  v9 = -[NSTextLayoutFragment rangeInElement](self, "rangeInElement");
  v10 = v9;
  if (v7)
    v11 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v7, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3, 0, 0);
  else
    v11 = -[NSTextLayoutManager locationFromLocation:withOffset:](v8, "locationFromLocation:withOffset:", -[NSTextRange location](v9, "location"), a3);
  v12 = v11;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3052000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  v57 = 0;
  v13 = &v46;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3052000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  v51 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  if (!v11)
    goto LABEL_26;
  v14 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke;
  v41[3] = &unk_1E2603068;
  v41[4] = v11;
  v41[5] = &v52;
  v41[6] = &v46;
  v41[7] = &v42;
  -[NSTextLayoutFragment enumerateRenderingAttributesFromLocation:reverse:usingBlock:](self, "enumerateRenderingAttributesFromLocation:reverse:usingBlock:", v11, 0, v41);
  if (a3 >= 1 && !*((_BYTE *)v43 + 24))
  {
    v40[0] = v14;
    v40[1] = 3221225472;
    v40[2] = __85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke_2;
    v40[3] = &unk_1E2603090;
    v40[4] = v10;
    v40[5] = &v46;
    -[NSTextLayoutFragment enumerateRenderingAttributesFromLocation:reverse:usingBlock:](self, "enumerateRenderingAttributesFromLocation:reverse:usingBlock:", v12, 1, v40);
  }
  v39 = v10;
  v15 = -[NSTextLayoutManager _selectionAndMarkedTextAttributesForLocation:inTextRange:effectiveTextRange:](v8, "_selectionAndMarkedTextAttributesForLocation:inTextRange:effectiveTextRange:", v12, v10, &v39);
  if (v39 && !-[NSTextRange isEmpty](v39, "isEmpty") && (objc_msgSend((id)v47[5], "isEqual:", v39) & 1) == 0)
  {
    v16 = objc_msgSend(v15, "count");
    v17 = v39;
    if (v16)
      goto LABEL_12;
    if (!-[NSTextRange isEqual:](v10, "isEqual:", v39))
    {
      v38 = (void *)v47[5];
      if (v38 && (objc_msgSend(v38, "isEmpty") & 1) == 0)
        v17 = (NSTextRange *)objc_msgSend((id)v47[5], "textRangeByIntersectingWithTextRange:", v39);
      else
        v17 = v39;
LABEL_12:
      if (v17)
      {

        v18 = v17;
        v47[5] = (uint64_t)v18;
      }
    }
  }
  if (objc_msgSend(v15, "count") && !objc_msgSend(v15, "objectForKeyedSubscript:", NSMarkedClauseSegmentAttributeName))
  {
    v19 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor"));
    if (v19)
    {
      if ((objc_msgSend(v19, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) != 0)
      {
        v19 = 0;
      }
      else
      {
        v15 = (id)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NSBackgroundColor"));
        v19 = v15;
      }
    }
    v20 = objc_msgSend((id)v53[5], "count");
    v21 = (void *)v53[5];
    if (v20)
    {
      v22 = (id)objc_msgSend(v21, "mutableCopy");
      objc_msgSend(v22, "addEntriesFromDictionary:", v15);
    }
    else
    {

      v22 = v15;
    }

    v53[5] = (uint64_t)v22;
  }
  v13 = v47;
LABEL_26:
  if (a4)
  {
    *a4 = (_NSRange)xmmword_18D6CBB80;
    v23 = (void *)v13[5];
    if (v23)
    {
      v24 = -[NSTextLayoutManager textContentManager](v8, "textContentManager");
      v25 = -[NSTextRange location](v10, "location");
      v26 = objc_msgSend(v23, "location");
      if (v7)
      {
        v27 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v7, "rangeForLocation:allowsTrailingEdge:", v26, 0);
        v28 = 0x7FFFFFFFFFFFFFFFLL;
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v7, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v23, "endLocation"), 1);
LABEL_34:
          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            v30 = 0;
          else
            v30 = v29 - v27;
          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            v28 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v28 = v27;
          goto LABEL_40;
        }
      }
      else
      {
        v27 = -[NSTextContentManager offsetFromLocation:toLocation:](v24, "offsetFromLocation:toLocation:", v25, v26);
        v28 = 0x7FFFFFFFFFFFFFFFLL;
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = -[NSTextContentManager offsetFromLocation:toLocation:](v24, "offsetFromLocation:toLocation:", v25, objc_msgSend(v23, "endLocation"));
          goto LABEL_34;
        }
      }
      v30 = 0;
LABEL_40:
      a4->location = v28;
      a4->length = v30;
      v13 = v47;
    }
  }

  if (v8)
  {
    v31 = -[NSTextLayoutManager rendersBackgroundColorAttribute](v8, "rendersBackgroundColorAttribute");
    v32 = v53;
    if (!v31)
    {
      v33 = objc_msgSend((id)v53[5], "objectForKeyedSubscript:", CFSTR("NSBackgroundColor"));
      v32 = v53;
      if (!v33)
      {
        v34 = (void *)objc_msgSend((id)v53[5], "mutableCopy");
        objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NSBackgroundColor"));

        v32 = v53;
        v53[5] = (uint64_t)v34;
      }
    }
  }
  else
  {
    v32 = v53;
  }
  v35 = (void *)v32[5];
  if (v35)
    v36 = v35;
  else
    v36 = (id)MEMORY[0x1E0C9AA70];
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  return v36;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTextLayoutFragment setTextLayoutManager:](self, "setTextLayoutManager:", 0);
  -[NSTextLayoutFragment setTextElement:](self, "setTextElement:", 0);

  objc_storeWeak((id *)&self->_layoutManager, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSTextLayoutFragment;
  -[NSTextLayoutFragment dealloc](&v3, sel_dealloc);
}

- (NSTextLayoutFragment)initWithTextElement:(NSTextElement *)textElement range:(NSTextRange *)rangeInElement
{
  NSTextLayoutFragment *v6;
  NSTextLayoutFragment *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSTextLayoutFragment;
  v6 = -[NSTextLayoutFragment init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[NSTextLayoutFragment setTextElement:](v6, "setTextElement:", textElement);
    if (rangeInElement
      && !-[NSTextRange isEqual:](rangeInElement, "isEqual:", -[NSTextElement elementRange](textElement, "elementRange")))
    {
      -[NSTextLayoutFragment _setRangeInElement:](v7, "_setRangeInElement:", rangeInElement);
    }
    v7->_rendersTextCorrectionMarkers = 1;
  }
  return v7;
}

- (void)setTextElement:(id)a3
{
  NSTextElement **p_textElement;
  id Weak;

  p_textElement = &self->_textElement;
  if (objc_loadWeak((id *)&self->_textElement) != a3)
  {
    objc_storeWeak((id *)p_textElement, a3);
    Weak = objc_loadWeak((id *)p_textElement);
    if (Weak)
    {
      objc_loadWeak((id *)p_textElement);
      objc_opt_class();
      LOBYTE(Weak) = objc_opt_isKindOfClass();
    }
    self->_isTextParagraph = Weak & 1;
    if (!a3)
    {
      -[NSTextLayoutFragment _setRangeInElement:](self, "_setRangeInElement:", 0);

      self->_contentRange = 0;
    }
  }
}

- (void)_setRangeInElement:(id)a3
{
  NSTextElement *v5;
  NSTextRange *v6;

  objc_sync_enter(self);
  if (!-[NSTextRange isEqual:](self->_rangeInElement, "isEqual:", a3))
  {
    v5 = -[NSTextLayoutFragment textElement](self, "textElement");

    v6 = (NSTextRange *)a3;
    self->_rangeInElement = v6;
    if (v6)
      self->_offsetFromElementLocation = -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextElement textContentManager](v5, "textContentManager"), "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextElement elementRange](v5, "elementRange"), "location"), -[NSTextRange location](self->_rangeInElement, "location"));
  }
  objc_sync_exit(self);
}

- (void)enumerateRenderingAttributesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  NSTextLayoutManager *v9;
  _QWORD v10[6];

  v6 = a4;
  v9 = -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__NSTextLayoutFragment_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke;
  v10[3] = &unk_1E2603018;
  v10[4] = self;
  v10[5] = a5;
  -[NSTextLayoutManager enumerateTemporaryAttributesFromLocation:reverse:usingBlock:](v9, "enumerateTemporaryAttributesFromLocation:reverse:usingBlock:", a3, v6, v10);
}

- (void)_resetLayoutFragmentFrame
{
  -[NSTextLayoutFragment invalidateLayout](self, "invalidateLayout");
  -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)invalidateLayout
{
  if ((unint64_t)-[NSTextLayoutFragment state](self, "state") >= NSTextLayoutFragmentStateCalculatedUsageBounds)
  {
    -[NSTextLayoutFragment setTextLineFragments:](self, "setTextLineFragments:", MEMORY[0x1E0C9AA60]);
    -[NSTextLayoutFragment setState:](self, "setState:", 0);
    -[_NSTextAttachmentLayoutContext reset](self->_textAttachmentLayoutContext, "reset");
    -[NSTextLayoutManager updateLayoutWithTextLayoutFragment:addition:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "updateLayoutWithTextLayoutFragment:addition:", self, 0);
    -[NSTextViewportLayoutController setNeedsLayout](-[NSTextLayoutManager textViewportLayoutController](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "textViewportLayoutController"), "setNeedsLayout");

    self->_extraLineFragmentAttributes = 0;
    self->_truncatedRanges = 0;
  }
  -[NSTextLayoutFragment setTextLineFragmentsExcludingExtra:](self, "setTextLineFragmentsExcludingExtra:", 0);
}

uint64_t __80__NSTextLayoutFragment_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled__block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "valueForKey:", CFSTR("NSTextLayoutFragmentCoordinateSystemCompatibilityFor2022AndEarlierSDKEnabled"));
  if (v0)
    result = objc_msgSend(v0, "BOOLValue");
  else
    result = dyld_program_sdk_at_least() ^ 1;
  coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled = result;
  return result;
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  uint64_t result;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a1[4], "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3, 0, 0);
  if (!*((_QWORD *)a1[5] + 11)
    && objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CTAdaptiveImageProvider"))
    && objc_msgSend((id)objc_msgSend(a1[6], "string"), "characterAtIndex:", a3) == 65532)
  {
    v15 = a1[5];
    objc_sync_enter(v15);
    objc_msgSend(a1[5], "_initializeTextAttachmentLayoutContext");
    objc_sync_exit(v15);
  }
  else
  {
    v9 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
    if (v9)
    {
      v10 = (void *)v9;
      if (objc_msgSend((id)objc_msgSend(a1[6], "string"), "characterAtIndex:", a3) == 65532)
      {
        v11 = (void *)objc_msgSend(a1[5], "_layoutInfoForTextAttachmentAtLocation:", v8);
        if (objc_msgSend(v10, "_isEmojiImage"))
        {
          v12 = a1[6];
          v13 = *MEMORY[0x1E0CA8158];
          v14 = v10;
        }
        else
        {
          v16 = objc_msgSend(v10, "adaptiveImageGlyph");
          if (v16)
          {
            v14 = (void *)v16;
            v12 = a1[6];
            v17 = (uint64_t *)MEMORY[0x1E0CA8158];
          }
          else
          {
            v18 = objc_msgSend(v11, "runDelegate");
            if (!v18)
              goto LABEL_15;
            v14 = (void *)v18;
            v12 = a1[6];
            v17 = (uint64_t *)MEMORY[0x1E0CA85C0];
          }
          v13 = *v17;
        }
        objc_msgSend(v12, "addAttribute:value:range:", v13, v14, a3, a4);
      }
    }
  }
LABEL_15:
  v19 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSLink"));
  if (v19)
  {
    v20 = (void *)objc_msgSend(a1[7], "renderingAttributesForLink:atLocation:", v19, v8);
    if (v20)
    {
      v21 = v20;
      v22 = (void *)objc_msgSend(v20, "allKeysForObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
      if (objc_msgSend(v22, "count"))
      {
        v21 = (void *)objc_msgSend(v21, "mutableCopy");
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v38 != v24)
                objc_enumerationMutation(v22);
              v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v21, "removeObjectForKey:", v26);
              objc_msgSend(a1[6], "removeAttribute:range:", v26, a3, a4);
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v23);
        }
        v27 = v21;
      }
      else
      {
        v27 = 0;
      }
      objc_msgSend(a1[6], "addAttributes:range:", v21, a3, a4);

    }
  }
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSSuperScript"));
  v29 = (void *)result;
  if (result)
  {
    if (!a2)
      goto LABEL_33;
    v30 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSFont"));
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
      v30 = (void *)objc_msgSend(v30, "verticalFont");
    if (!v30)
    {
LABEL_33:
      v30 = (void *)NSDefaultFont();
      if (!v30)
        v30 = (void *)NSDefaultFont();
    }
    objc_msgSend(v30, "_defaultLineHeightForUILayout");
    v32 = v31;
    v33 = objc_msgSend(v29, "integerValue");
    v34 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSBaselineOffset"));
    v35 = ceil((v32 + 0.0) * (double)v33 * 0.4);
    if (v34)
    {
      objc_msgSend(v34, "doubleValue");
      v35 = v35 + v36;
    }
    return objc_msgSend(a1[6], "addAttribute:value:range:", CFSTR("NSBaselineOffset"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35), a3, a4);
  }
  return result;
}

void __58__NSTextLayoutFragment__setupResolvedTextAttachmentFrames__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7)
{
  void *v12;
  NSCountableTextLocation *v13;
  void *v14;
  NSCountableTextLocation *v15;
  CGRect v16;

  v12 = *(void **)(a1 + 32);
  if (v12)
    v13 = (NSCountableTextLocation *)(id)objc_msgSend(v12, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a7, 0, 0);
  else
    v13 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", a7);
  v15 = v13;
  v14 = (void *)objc_msgSend(objc_loadWeak((id *)(a1 + 40)), "_layoutInfoForTextAttachmentAtLocation:", v13);
  if (v14)
  {
    v16.origin.x = a2 + *(double *)(a1 + 48);
    v16.origin.y = a3;
    v16.size.width = a4;
    v16.size.height = a5;
    objc_msgSend(v14, "setAttachmentFrameOrigin:", v16.origin.x, a3 + *(double *)(a1 + 56) - CGRectGetHeight(v16));
  }

}

- (id)textAttachmentViewProviderForLocation:(id)a3
{
  return (id)objc_msgSend(-[NSTextLayoutFragment _layoutInfoForTextAttachmentAtLocation:](self, "_layoutInfoForTextAttachmentAtLocation:", a3), "textAttachmentViewProvider");
}

- (void)setTextAttachmentProvider:(id)a3 forLocation:(id)a4
{
  objc_msgSend(-[NSTextLayoutFragment _layoutInfoForTextAttachmentAtLocation:](self, "_layoutInfoForTextAttachmentAtLocation:", a4), "setTextAttachmentViewProvider:", a3);
}

- (CGRect)frameForTextAttachmentAtLocation:(id)location
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = -[NSTextLayoutFragment _layoutInfoForTextAttachmentAtLocation:](self, "_layoutInfoForTextAttachmentAtLocation:", location);
  if (v4)
  {
    v5 = v4;
    -[NSTextLayoutFragment _setupResolvedTextAttachmentFrames](self, "_setupResolvedTextAttachmentFrames");
    objc_msgSend(v5, "resolvedAttachmentFrame");
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)_updateRangeInElement
{
  NSTextElement *v3;
  NSTextContentManager *v4;
  NSTextRange *v5;
  int64_t offsetFromElementLocation;
  int64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  NSTextRange *v11;

  objc_sync_enter(self);
  if (self->_rangeInElement
    && (v3 = -[NSTextLayoutFragment textElement](self, "textElement"),
        v4 = -[NSTextElement textContentManager](v3, "textContentManager"),
        v5 = -[NSTextElement elementRange](v3, "elementRange"),
        offsetFromElementLocation = self->_offsetFromElementLocation,
        (v7 = offsetFromElementLocation
            - -[NSTextContentManager offsetFromLocation:toLocation:](v4, "offsetFromLocation:toLocation:", -[NSTextRange location](v5, "location"), -[NSTextRange location](self->_rangeInElement, "location"))) != 0))
  {
    v9 = -[NSTextContentManager locationFromLocation:withOffset:](v4, "locationFromLocation:withOffset:", -[NSTextRange location](self->_rangeInElement, "location"), v7);
    v10 = -[NSTextContentManager locationFromLocation:withOffset:](v4, "locationFromLocation:withOffset:", -[NSTextRange endLocation](self->_rangeInElement, "endLocation"), v7);
    v11 = 0;
    if (v9 && v10)
      v11 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v9, v10);

    self->_rangeInElement = v11;
    self->_contentRange = 0;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (void)_setupResolvedTextAttachmentFrames
{
  NSTextParagraph *v3;
  _NSTextAttachmentLayoutContext *textAttachmentLayoutContext;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id location;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[NSTextLayoutFragment textParagraph](self, "textParagraph");
  objc_initWeak(&location, self);
  textAttachmentLayoutContext = self->_textAttachmentLayoutContext;
  if (textAttachmentLayoutContext)
  {
    if (!-[_NSTextAttachmentLayoutContext hasResolvedAttachmentFrame](textAttachmentLayoutContext, "hasResolvedAttachmentFrame"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments");
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v20 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v9, "typographicBounds");
            v11 = v10;
            objc_msgSend(v9, "typographicBounds");
            v13 = v12;
            v14 = objc_msgSend(v9, "characterRange");
            v16 = v15;
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __58__NSTextLayoutFragment__setupResolvedTextAttachmentFrames__block_invoke;
            v17[3] = &unk_1E26030E0;
            v17[4] = v3;
            objc_copyWeak(v18, &location);
            v18[1] = v11;
            v18[2] = v13;
            objc_msgSend(v9, "_enumerateTextAttachmentFramesInCharacterRange:usingBlock:", v14, v16, v17);
            objc_destroyWeak(v18);
          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v6);
      }
    }
  }
  objc_destroyWeak(&location);
}

- (id)_layoutInfoForTextAttachmentAtLocation:(id)a3
{
  NSTextRange *rangeInElement;
  NSTextParagraph *v6;
  NSTextParagraph *v7;
  uint64_t v8;
  NSDictionary *v9;
  id v10;

  rangeInElement = self->_rangeInElement;
  if (!rangeInElement)
    rangeInElement = -[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange");
  if (!-[NSTextRange containsLocation:](rangeInElement, "containsLocation:", a3))
    return 0;
  v6 = -[NSTextLayoutFragment textParagraph](self, "textParagraph");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v6, "rangeForLocation:allowsTrailingEdge:", a3, 0);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9 = -[NSAttributedString attributesAtIndex:effectiveRange:](-[NSTextParagraph attributedString](v7, "attributedString"), "attributesAtIndex:effectiveRange:", v8, 0);
  if (!-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("NSAttachment")))
    return 0;
  objc_sync_enter(self);
  -[NSTextLayoutFragment _initializeTextAttachmentLayoutContext](self, "_initializeTextAttachmentLayoutContext");
  v10 = -[_NSTextAttachmentLayoutContext textAttachmentLayoutInfoForLocation:attributes:](self->_textAttachmentLayoutContext, "textAttachmentLayoutInfoForLocation:attributes:", a3, v9);
  objc_sync_exit(self);
  return v10;
}

- (NSTextLayoutFragment)init
{
  return 0;
}

NSCountableTextRange *__38__NSTextLayoutFragment_rangeInElement__block_invoke()
{
  NSCountableTextRange *result;

  result = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", 0, 0);
  rangeInElement_emptyRange = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextLayoutFragment)initWithCoder:(NSCoder *)coder
{
  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    -[NSTextLayoutFragment setTextLayoutManager:](self, "setTextLayoutManager:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.textLayoutManager")));
    -[NSTextLayoutFragment setTextElement:](self, "setTextElement:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.textElement")));
    -[NSTextLayoutFragment _setRangeInElement:](self, "_setRangeInElement:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.rangeInElement")));
    -[NSTextLayoutFragment setLayoutQueue:](self, "setLayoutQueue:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.layoutQueue")));
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSTextElement *v5;
  NSTextElement *v6;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = -[NSTextLayoutFragment textElement](self, "textElement");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(a3, "encodeObject:forKey:", -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), CFSTR("NS.textLayoutManager"));
      objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.textElement"));
      objc_msgSend(a3, "encodeObject:forKey:", self->_rangeInElement, CFSTR("NS.rangeInElement"));
      objc_msgSend(a3, "encodeObject:forKey:", -[NSTextLayoutFragment layoutQueue](self, "layoutQueue"), CFSTR("NS.layoutQueue"));
    }
  }
}

- (NSTextLineFragment)textLineFragmentForTextLocation:(id)textLocation isUpstreamAffinity:(BOOL)isUpstreamAffinity
{
  _BOOL4 v4;
  NSArray *v7;
  unint64_t v8;
  NSTextParagraph *v9;
  NSTextLineFragment *v10;
  uint64_t v11;
  NSTextRange *v12;
  unint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  __NSScratchTextLineFragment *v23;
  unint64_t v24;
  _QWORD v25[6];
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = isUpstreamAffinity;
  v32 = *MEMORY[0x1E0C80C00];
  if (-[NSTextLayoutFragment state](self, "state") != NSTextLayoutFragmentStateLayoutAvailable)
    return 0;
  v7 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments");
  v8 = -[NSArray count](v7, "count");
  if (!-[NSTextRange containsLocation:](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "containsLocation:", textLocation))
  {
    if (v4)
    {
      if (objc_msgSend(-[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation"), "isEqual:", textLocation))
      {
        if (objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "endLocation")))
        {
          v12 = -[NSTextParagraph paragraphSeparatorRange](-[NSTextLayoutFragment textParagraph](self, "textParagraph"), "paragraphSeparatorRange");
          if (!v12 || -[NSTextRange isEmpty](v12, "isEmpty"))
            return (NSTextLineFragment *)-[NSArray lastObject](v7, "lastObject");
        }
      }
    }
    return 0;
  }
  v9 = -[NSTextLayoutFragment textParagraph](self, "textParagraph");
  v10 = (NSTextLineFragment *)v9;
  v11 = v9
      ? -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v9, "rangeForLocation:allowsTrailingEdge:", textLocation, 1): -[NSTextLayoutManager offsetFromLocation:toLocation:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "offsetFromLocation:toLocation:", objc_msgSend(-[NSTextLayoutFragment representedRange](self, "representedRange"), "location"), textLocation);
  v14 = v11;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (v8 <= 0xA)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments");
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
LABEL_18:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v10 = *(NSTextLineFragment **)(*((_QWORD *)&v27 + 1) + 8 * v19);
        v20 = -[NSTextLineFragment characterRange](v10, "characterRange");
        v22 = v14 == v20 + v21 && v4;
        if (v14 < v20 + v21 || v22)
          return v10;
        if (v17 == ++v19)
        {
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          v10 = 0;
          if (v17)
            goto LABEL_18;
          return v10;
        }
      }
    }
    return 0;
  }
  if (!v10)
    return v10;
  v23 = -[__NSScratchTextLineFragment initWithString:characterIndex:]([__NSScratchTextLineFragment alloc], "initWithString:characterIndex:", -[NSAttributedString string](-[NSTextLineFragment attributedString](v10, "attributedString"), "string"), v11);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75__NSTextLayoutFragment_textLineFragmentForTextLocation_isUpstreamAffinity___block_invoke;
  v25[3] = &unk_1E2602EE0;
  v25[4] = v23;
  v25[5] = v14;
  v26 = v4;
  v24 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v7, "indexOfObject:inSortedRange:options:usingComparator:", v23, 0, v8, 256, v25);

  v10 = 0;
  if (v24 >= v8)
    return v10;
  return (NSTextLineFragment *)-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v24);
}

uint64_t __75__NSTextLayoutFragment_textLineFragmentForTextLocation_isUpstreamAffinity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(void **)(a1 + 32);
  if (v6 == a3)
    v7 = a2;
  else
    v7 = 0;
  if (v6 == a2)
    v8 = a3;
  else
    v8 = v7;
  if (v8)
  {
    v9 = objc_msgSend(v8, "characterRange");
    v11 = *(_QWORD *)(a1 + 40);
    v12 = v11 < v9 || v11 - v9 >= v10;
    if (!v12 || *(_BYTE *)(a1 + 48) && v11 == v9 + v10)
      return 0;
  }
  v14 = objc_msgSend(a3, "characterRange");
  v15 = objc_msgSend(a2, "characterRange");
  v16 = 1;
  if (v14 - v15 >= 1)
    v16 = -1;
  if (v14 == v15)
    return 0;
  else
    return v16;
}

- (NSTextLineFragment)textLineFragmentForVerticalOffset:(CGFloat)verticalOffset requiresExactMatch:(BOOL)requiresExactMatch
{
  _BOOL4 v4;
  NSArray *v7;
  unint64_t v8;
  NSTextLineFragment *v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  __NSScratchTextLineFragment *v26;
  __NSScratchTextLineFragment *v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v31[6];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = requiresExactMatch;
  if (-[NSTextLayoutFragment state](self, "state") == NSTextLayoutFragmentStateLayoutAvailable)
  {
    v7 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments");
    v8 = -[NSArray count](v7, "count");
    if (v8 - 1 > 1)
    {
      v26 = -[__NSScratchTextLineFragment initWithVerticalOffset:]([__NSScratchTextLineFragment alloc], "initWithVerticalOffset:", verticalOffset);
      v27 = v26;
      if (v4)
        v28 = 256;
      else
        v28 = 1280;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __77__NSTextLayoutFragment_textLineFragmentForVerticalOffset_requiresExactMatch___block_invoke;
      v31[3] = &unk_1E2602F08;
      v31[4] = v26;
      *(CGFloat *)&v31[5] = verticalOffset;
      v29 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v7, "indexOfObject:inSortedRange:options:usingComparator:", v26, 0, v8, v28, v31);

      if (v29 < v8)
        return (NSTextLineFragment *)-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v29);
    }
    else
    {
      v9 = -[NSArray firstObject](v7, "firstObject");
      -[NSTextLineFragment typographicBounds](v9, "typographicBounds");
      v14 = v10;
      v15 = v11;
      v16 = v12;
      v17 = v13;
      if (!v4 && CGRectGetMinY(*(CGRect *)&v10) > verticalOffset)
        return v9;
      v32.origin.x = v14;
      v32.origin.y = v15;
      v32.size.width = v16;
      v32.size.height = v17;
      if (CGRectGetMinY(v32) <= verticalOffset)
      {
        v33.origin.x = v14;
        v33.origin.y = v15;
        v33.size.width = v16;
        v33.size.height = v17;
        if (CGRectGetMaxY(v33) > verticalOffset)
          return v9;
      }
      if (v8 >= 2)
      {
        v9 = -[NSArray lastObject](v7, "lastObject");
        -[NSTextLineFragment typographicBounds](v9, "typographicBounds");
        v22 = v18;
        v23 = v19;
        v24 = v20;
        v25 = v21;
        if (!v4 && CGRectGetMinY(*(CGRect *)&v18) > verticalOffset)
          return v9;
        v34.origin.x = v22;
        v34.origin.y = v23;
        v34.size.width = v24;
        v34.size.height = v25;
        if (CGRectGetMinY(v34) <= verticalOffset)
        {
          v35.origin.x = v22;
          v35.origin.y = v23;
          v35.size.width = v24;
          v35.size.height = v25;
          if (CGRectGetMaxY(v35) > verticalOffset)
            return v9;
        }
      }
    }
  }
  return 0;
}

uint64_t __77__NSTextLayoutFragment_textLineFragmentForVerticalOffset_requiresExactMatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double MinY;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v6 = *(void **)(a1 + 32);
  if (v6 == a3)
    v7 = a2;
  else
    v7 = 0;
  if (v6 == a2)
    v8 = a3;
  else
    v8 = v7;
  if (v8)
  {
    objc_msgSend(v8, "typographicBounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v17 = *(double *)(a1 + 40);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  if (v17 >= CGRectGetMinY(v25))
  {
    v18 = *(double *)(a1 + 40);
    v26.origin.x = v10;
    v26.origin.y = v12;
    v26.size.width = v14;
    v26.size.height = v16;
    if (v18 < CGRectGetMaxY(v26))
      return 0;
  }
  objc_msgSend(a3, "typographicBounds");
  MinY = CGRectGetMinY(v27);
  objc_msgSend(a2, "typographicBounds");
  v21 = CGRectGetMinY(v28);
  v22 = MinY - v21;
  v23 = vabdd_f64(MinY, v21);
  v24 = -1;
  if (v22 <= 0.0)
    v24 = 1;
  if (v23 <= 0.001)
    return 0;
  else
    return v24;
}

- (id)textLineFragmentForVerticalOffset:(double)a3 allowsSucceeding:(BOOL)a4
{
  return -[NSTextLayoutFragment textLineFragmentForVerticalOffset:requiresExactMatch:](self, "textLineFragmentForVerticalOffset:requiresExactMatch:", !a4, a3);
}

- (double)verticalOffsetOfTextLocation:(id)a3 withAffinity:(int64_t)a4
{
  NSTextLineFragment *v6;
  CGRect v8;

  v6 = -[NSTextLayoutFragment textLineFragmentForTextLocation:isUpstreamAffinity:](self, "textLineFragmentForTextLocation:isUpstreamAffinity:", a3, a4 == 0);
  if (v6)
    goto LABEL_2;
  if ((unint64_t)-[NSTextLayoutFragment state](self, "state") >= NSTextLayoutFragmentStateLayoutAvailable
    && -[NSArray count](-[NSTextLayoutFragment textLineFragments](self, "textLineFragments"), "count")
    && objc_msgSend(a3, "compare:", objc_msgSend(-[NSTextLayoutFragment representedRange](self, "representedRange"), "location")) != -1)
  {
    v6 = -[NSArray lastObject](-[NSTextLayoutFragment textLineFragments](self, "textLineFragments"), "lastObject");
LABEL_2:
    -[NSTextLineFragment typographicBounds](v6, "typographicBounds");
    return CGRectGetMinY(v8);
  }
  return 0.0;
}

- (id)representedRangeAtPoint:(CGPoint)a3
{
  return 0;
}

+ (NSSet)_validCoreTextRenderingAttributes
{
  if (_validCoreTextRenderingAttributes_onceToken != -1)
    dispatch_once(&_validCoreTextRenderingAttributes_onceToken, &__block_literal_global_22);
  return (NSSet *)_validCoreTextRenderingAttributes_coreTextAttributes;
}

uint64_t __57__NSTextLayoutFragment__validCoreTextRenderingAttributes__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("NSColor"), CFSTR("NSBackgroundColor"), CFSTR("NSShadow"), CFSTR("NSLink"), 0);
  _validCoreTextRenderingAttributes_coreTextAttributes = result;
  return result;
}

+ (id)layoutFragmentQueue
{
  if (layoutFragmentQueue_onceToken != -1)
    dispatch_once(&layoutFragmentQueue_onceToken, &__block_literal_global_24);
  return (id)layoutFragmentQueue_queue;
}

uint64_t __43__NSTextLayoutFragment_layoutFragmentQueue__block_invoke()
{
  layoutFragmentQueue_queue = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend((id)layoutFragmentQueue_queue, "setName:", CFSTR("com.apple.NSTextLayoutFragmentOperationQueue"));
  objc_msgSend((id)layoutFragmentQueue_queue, "setQualityOfService:", 17);
  return objc_msgSend((id)layoutFragmentQueue_queue, "setMaxConcurrentOperationCount:", 1);
}

- (CGRect)coreTypesetter:(id)a3 lineFragmentRectForProposedRect:(CGRect)a4 atIndex:(int64_t)a5 writingDirection:(int64_t)a6 remainingRect:(CGRect *)a7
{
  int64_t v9;
  double height;
  double width;
  double y;
  double x;
  id v15;
  void *v16;
  NSTextContentManager *v17;
  NSTextContentManager *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v9 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = -[NSTextLayoutFragment _textContainerAtStringIndex:](self, "_textContainerAtStringIndex:", a5);
  if (v15)
  {
    v16 = v15;
    v17 = -[NSTextLayoutManager textContentManager](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "textContentManager");
    if (v17)
    {
      v18 = v17;
      v19 = -[NSTextParagraph locationForCharacterIndex:actualRange:](-[NSTextLayoutFragment textParagraph](self, "textParagraph"), "locationForCharacterIndex:actualRange:", v9, 0);
      if (v19)
        v9 = -[NSTextContentManager offsetFromLocation:toLocation:](v18, "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextContentManager documentRange](v18, "documentRange"), "location"), v19);
    }
    objc_msgSend(v16, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", v9, a6, a7, x, y, width, height);
  }
  else
  {
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)_createTruncatedTextRangesFromRanges:(id)a3 characterIndexDelta:(int64_t)a4
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  NSTextRange *v20;
  unint64_t v22;
  NSTextContentManager *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = -[NSTextLayoutFragment textParagraph](self, "textParagraph");
  v23 = -[NSTextElement textContentManager](-[NSTextLayoutFragment textElement](self, "textElement"), "textContentManager");
  v22 = -[NSTextRange location](-[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange"), "location");
  if (!(v7 | v22))
    return 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v26;
  obj = a3;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(obj);
      v13 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "rangeValue");
      v15 = v14;
      v16 = v13 + a4;
      if (v7)
      {
        v17 = objc_msgSend((id)v7, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v16, 0, 0);
        v18 = objc_msgSend((id)v7, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v16 + v15, 0, 0);
      }
      else
      {
        v17 = -[NSTextContentManager locationFromLocation:withOffset:](v23, "locationFromLocation:withOffset:", v22, v16);
        v18 = -[NSTextContentManager locationFromLocation:withOffset:](v23, "locationFromLocation:withOffset:", v17, v15);
      }
      if (v17)
        v19 = v18 == 0;
      else
        v19 = 1;
      if (!v19)
      {
        v20 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v17, v18);
        if (!v10)
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v10, "addObject:", v20);

      }
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v9);
  return v10;
}

uint64_t __31__NSTextLayoutFragment__layout__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v8;

  v6 = *(void **)(a1 + 32);
  if (!v6)
    return 1;
  if (*(_QWORD *)(a1 + 40))
    v8 = objc_msgSend(*(id *)(a1 + 40), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a4, 0, 0);
  else
    v8 = objc_msgSend(v6, "locationFromLocation:withOffset:", *(_QWORD *)(a1 + 48));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "textLayoutManager:shouldBreakLineBeforeLocation:hyphenating:", *(_QWORD *)(a1 + 32), v8, a5);
}

uint64_t __30__NSTextLayoutFragment_layout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layout");
}

- (void)invalidateExtraLineFragment
{
  NSArray *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MaxY;
  double v12;
  CGRect v13;

  if ((unint64_t)-[NSTextLayoutFragment state](self, "state") >= NSTextLayoutFragmentStateCalculatedUsageBounds
    && !-[NSArray count](self->_truncatedRanges, "count"))
  {
    v3 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments");
    v4 = -[NSArray count](v3, "count");
    -[NSTextLayoutFragment setState:](self, "setState:", 1);
    -[NSTextLayoutManager updateLayoutWithTextLayoutFragment:addition:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "updateLayoutWithTextLayoutFragment:addition:", self, 0);
    if (v4 >= 2)
    {
      if (objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "isExtra"))
      {
        v3 = -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0, v4 - 1);
        -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
        v6 = v5;
        v8 = v7;
        v10 = v9;
        objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "typographicBounds");
        MaxY = CGRectGetMaxY(v13);
        -[NSTextLayoutFragment bottomMargin](self, "bottomMargin");
        -[NSTextLayoutFragment setLayoutFragmentFrame:](self, "setLayoutFragmentFrame:", v6, v8, v10, MaxY + v12);
      }
    }
    -[NSTextLayoutFragment setTextLineFragmentsExcludingExtra:](self, "setTextLineFragmentsExcludingExtra:", v3);
    -[NSTextLayoutFragment setTextLineFragments:](self, "setTextLineFragments:", MEMORY[0x1E0C9AA60]);
    -[NSTextViewportLayoutController setNeedsLayout](-[NSTextLayoutManager textViewportLayoutController](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "textViewportLayoutController"), "setNeedsLayout");

    self->_extraLineFragmentAttributes = 0;
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSTextRange *v5;
  NSTextLayoutFragmentState v6;
  __CFString *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  BOOL v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  NSString *v34;
  NSString *v35;
  const __CFString *v36;
  NSString *v37;
  uint64_t v39;
  NSRange v40;
  NSRect v41;
  NSRect v42;
  NSRect v43;
  NSRect v44;
  NSRect v45;

  if (-[NSTextLayoutFragment textElement](self, "textElement"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_opt_class();
    v5 = -[NSTextLayoutFragment rangeInElement](self, "rangeInElement");
    v6 = -[NSTextLayoutFragment state](self, "state");
    if (v6 >= 4)
      v7 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v6);
    else
      v7 = off_1E2603150[v6];
    if (-[NSTextLayoutFragment state](self, "state"))
    {
      -[NSTextLayoutFragment layoutFragmentFrame](self, "layoutFragmentFrame");
      v37 = NSStringFromRect(v43);
    }
    else
    {
      v37 = (NSString *)CFSTR("{}");
    }
    return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %p range=%@ layoutState=%@ frame=%@"), v4, self, v5, v7, v37, v39);
  }
  else
  {
    -[NSTextLayoutFragment sourceBoundingRect](self, "sourceBoundingRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[NSTextLayoutFragment destinationBoundingRect](self, "destinationBoundingRect");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = objc_opt_class();
    v26 = -[NSTextLayoutFragment animationType](self, "animationType");
    v27 = &stru_1E260C7D0;
    if (v26)
    {
      if ((v26 & 1) != 0)
        v28 = CFSTR("Dissolve");
      else
        v28 = &stru_1E260C7D0;
      v29 = (v26 & 6) == 0 || (v26 & 1) == 0;
      v30 = CFSTR("|");
      if (v29)
        v31 = &stru_1E260C7D0;
      else
        v31 = CFSTR("|");
      v32 = CFSTR("Translate");
      if ((v26 & 2) == 0)
        v32 = &stru_1E260C7D0;
      if ((v26 & 6) != 6)
        v30 = &stru_1E260C7D0;
      v33 = CFSTR("Resize");
      if ((v26 & 4) == 0)
        v33 = &stru_1E260C7D0;
      v27 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@%@%@%@%@]"), v28, v31, v32, v30, v33);
    }
    v40.location = -[NSTextLayoutFragment characterRange](self, "characterRange");
    v34 = NSStringFromRange(v40);
    -[NSTextLayoutFragment sourceBoundingRect](self, "sourceBoundingRect");
    v35 = NSStringFromRect(v41);
    v42.origin.x = v9;
    v42.origin.y = v11;
    v42.size.width = v13;
    v42.size.height = v15;
    v45.origin.x = v17;
    v45.origin.y = v19;
    v45.size.width = v21;
    v45.size.height = v23;
    if (NSEqualRects(v42, v45))
    {
      v36 = &stru_1E260C7D0;
    }
    else
    {
      v44.origin.x = v17;
      v44.origin.y = v19;
      v44.size.width = v21;
      v44.size.height = v23;
      v36 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" destination=%@"), NSStringFromRect(v44));
    }
    return (NSString *)objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: %p %@ range=%@ source=%@%@"), v25, self, v27, v34, v35, v36);
  }
}

- (BOOL)isCountableDataSource
{
  return -[NSTextLayoutManager isCountableDataSource](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "isCountableDataSource");
}

- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4
{
  return -[NSTextLayoutManager locationFromLocation:withOffset:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "locationFromLocation:withOffset:", a3, a4);
}

- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4
{
  return -[NSTextLayoutManager offsetFromLocation:toLocation:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "offsetFromLocation:toLocation:", a3, a4);
}

- (NSTextLocation)baseLocation
{
  return (NSTextLocation *)-[NSTextRange location](-[NSTextLayoutFragment rangeInElement](self, "rangeInElement"), "location");
}

uint64_t __84__NSTextLayoutFragment_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a4, "textRangeByIntersectingWithTextRange:", objc_msgSend(*(id *)(a1 + 32), "rangeInElement"));
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *a5 = 1;
  return result;
}

- (id)_coreTextAttributes
{
  if (!-[NSTextLayoutFragment rendersTextCorrectionMarkers](self, "rendersTextCorrectionMarkers"))
    return (id)objc_msgSend((id)objc_opt_class(), "_validCoreTextRenderingAttributes");
  -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager");
  return (id)objc_msgSend((id)objc_opt_class(), "validRenderingAttributes");
}

- (id)_textAttributesAffectingLayout
{
  if (_textAttributesAffectingLayout_onceToken != -1)
    dispatch_once(&_textAttributesAffectingLayout_onceToken, &__block_literal_global_54);
  return (id)_textAttributesAffectingLayout_coreTextAttributes;
}

uint64_t __54__NSTextLayoutFragment__textAttributesAffectingLayout__block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  result = objc_msgSend(v0, "initWithObjects:", CFSTR("NSFont"), CFSTR("NSParagraphStyle"), CFSTR("NSLigature"), CFSTR("NSKern"), CFSTR("CTTracking"), CFSTR("NSAttachment"), CFSTR("NSBaselineOffset"), CFSTR("NSObliqueness"), CFSTR("NSExpansion"), CFSTR("NSWritingDirection"), CFSTR("CTVerticalForms"), CFSTR("NSSuperScript"), NSGlyphInfoAttributeName, 0);
  _textAttributesAffectingLayout_coreTextAttributes = result;
  return result;
}

- (void)setRenderingAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5
{
  _NSTextAttributeStorage *renderingAttributesTable;

  renderingAttributesTable = self->_renderingAttributesTable;
  if (a4)
  {
    if (!renderingAttributesTable)
    {
      renderingAttributesTable = -[_NSTextRunStorage initWithDataSource:]([_NSTextAttributeStorage alloc], "initWithDataSource:", self);
      self->_renderingAttributesTable = renderingAttributesTable;
    }
  }
  else if (!renderingAttributesTable)
  {
    return;
  }
  if (-[_NSTextAttributeStorage setAttribute:value:forTextRange:](renderingAttributesTable, "setAttribute:value:forTextRange:", a3, a4, a5)&& -[NSTextLayoutFragment state](self, "state") == NSTextLayoutFragmentStateLayoutAvailable)
  {
    if (objc_msgSend(-[NSTextLayoutFragment _textAttributesAffectingLayout](self, "_textAttributesAffectingLayout"), "containsObject:", a3))-[NSTextLayoutFragment invalidateLayout](self, "invalidateLayout");
  }
}

- (void)removeRenderingAttribute:(id)a3 forTextRange:(id)a4
{
  -[NSTextLayoutFragment setRenderingAttribute:value:forTextRange:](self, "setRenderingAttribute:value:forTextRange:", a3, 0, a4);
}

- (void)setRenderingAttributes:(id)a3 forTextRange:(id)a4
{
  id v7;
  id v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!self->_renderingAttributesTable)
    self->_renderingAttributesTable = -[_NSTextRunStorage initWithDataSource:]([_NSTextAttributeStorage alloc], "initWithDataSource:", self);
  if (-[NSTextLayoutFragment state](self, "state") == NSTextLayoutFragmentStateLayoutAvailable)
  {
    v7 = -[NSTextLayoutFragment _textAttributesAffectingLayout](self, "_textAttributesAffectingLayout");
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__NSTextLayoutFragment_setRenderingAttributes_forTextRange___block_invoke;
    v9[3] = &unk_1E2603040;
    v9[4] = v7;
    v9[5] = &v10;
    objc_msgSend(a3, "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, v9);
    if (*((_BYTE *)v11 + 24))
      -[NSTextLayoutFragment invalidateLayout](self, "invalidateLayout");
    _Block_object_dispose(&v10, 8);
  }
  v8 = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", a3);
  -[_NSTextRunStorage setObject:forRange:](self->_renderingAttributesTable, "setObject:forRange:", v8, a4);

}

uint64_t __60__NSTextLayoutFragment_setRenderingAttributes_forTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)invalidateRenderingAttributesForTextRange:(id)a3
{
  -[_NSTextRunStorage invalidateElementsInRange:delta:](self->_renderingAttributesTable, "invalidateElementsInRange:delta:", a3, 0);
  -[NSTextLayoutFragment set_renderingAttributesValidated:](self, "set_renderingAttributesValidated:", 0);
}

- (void)layoutManagerDidSetTemporaryAttributes:(id)a3 forTextRange:(id)a4
{
  id v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (-[NSTextLayoutFragment state](self, "state", a3, a4) == NSTextLayoutFragmentStateLayoutAvailable)
  {
    v6 = -[NSTextLayoutFragment _textAttributesAffectingLayout](self, "_textAttributesAffectingLayout");
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__NSTextLayoutFragment_layoutManagerDidSetTemporaryAttributes_forTextRange___block_invoke;
    v7[3] = &unk_1E2603040;
    v7[4] = v6;
    v7[5] = &v8;
    objc_msgSend(a3, "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, v7);
    if (*((_BYTE *)v9 + 24))
      -[NSTextLayoutFragment invalidateLayout](self, "invalidateLayout");
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __76__NSTextLayoutFragment_layoutManagerDidSetTemporaryAttributes_forTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

NSTextRange *__85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  NSTextRange *result;

  if (objc_msgSend(a4, "containsLocation:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
    result = a4;
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    goto LABEL_6;
  }
  result = (NSTextRange *)objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a4, "location"));
  if (result == (NSTextRange *)-1)
  {
    result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(_QWORD *)(a1 + 32), objc_msgSend(a4, "location"));
    goto LABEL_5;
  }
LABEL_6:
  *a5 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

NSTextRange *__85__NSTextLayoutFragment__resolvedRenderingAttributesForCharacterIndex_effectiveRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  NSTextRange *result;

  result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(a4, "endLocation"), objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (void)_initializeTextAttachmentLayoutContext
{
  _NSTextAttachmentLayoutContext *v3;

  if (!self->_textAttachmentLayoutContext)
  {
    v3 = objc_alloc_init(_NSTextAttachmentLayoutContext);
    self->_textAttachmentLayoutContext = v3;
    -[_NSTextAttachmentLayoutContext setTextLayoutFragment:](v3, "setTextLayoutFragment:", self);
  }
}

- (BOOL)_isEnumerationGap
{
  return 0;
}

- (BOOL)supportsSubelements
{
  return -[_NSTextAttachmentLayoutContext hasViewProvider](self->_textAttachmentLayoutContext, "hasViewProvider");
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  _NSTextAttachmentLayoutContext *textAttachmentLayoutContext;
  _QWORD v10[5];

  if (-[NSTextLayoutFragment supportsSubelements](self, "supportsSubelements"))
  {
    textAttachmentLayoutContext = self->_textAttachmentLayoutContext;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__NSTextLayoutFragment_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
    v10[3] = &unk_1E26030B8;
    v10[4] = a5;
    -[_NSTextAttachmentLayoutContext enumerateViewportElementsFromLocation:options:usingBlock:](textAttachmentLayoutContext, "enumerateViewportElementsFromLocation:options:usingBlock:", a3, a4, v10);
  }
}

uint64_t __81__NSTextLayoutFragment_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)attributedStringForTruncatedRange:(id)a3 attributes:(id)a4
{
  void *v7;
  int IsVertical;
  id v9;
  const __CFString *v10;
  NSMutableDictionary *truncationTokenTable;
  id result;

  objc_sync_enter(self);
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_truncationTokenTable, "objectForKey:", a4);
  if (!v7)
  {
    if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NSFont")))
      IsVertical = CTFontIsVertical();
    else
      IsVertical = 0;
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (IsVertical)
      v10 = CFSTR("︙");
    else
      v10 = CFSTR("…");
    v7 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, a4);
    truncationTokenTable = self->_truncationTokenTable;
    if (!truncationTokenTable)
    {
      truncationTokenTable = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_truncationTokenTable = truncationTokenTable;
    }
    -[NSMutableDictionary setObject:forKey:](truncationTokenTable, "setObject:forKey:", v7, a4);

  }
  objc_sync_exit(self);
  result = -[NSTextLayoutManager attributedStringForTruncatedRange:defaultAttributedString:](-[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"), "attributedStringForTruncatedRange:defaultAttributedString:", a3, v7);
  if (!result)
    return v7;
  return result;
}

- (id)coreTypesetter:(id)a3 attributedStringForTruncatedCharacterRange:(_NSRange *)a4 attributes:(id)a5 originalLineRef:(__CTLine *)a6
{
  NSTextParagraph *v9;
  NSTextContentManager *v10;
  id v11;
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  uint64_t v15;
  NSTextRange *v16;
  id v17;

  v9 = -[NSTextLayoutFragment textParagraph](self, "textParagraph", a3, a4, a5, a6);
  v10 = -[NSTextElement textContentManager](-[NSTextLayoutFragment textElement](self, "textElement"), "textContentManager");
  v11 = -[NSTextRange location](-[NSTextElement elementRange](-[NSTextLayoutFragment textElement](self, "textElement"), "elementRange"), "location");
  if (!v10)
    return 0;
  location = a4->location;
  length = a4->length;
  if (v9)
  {
    v14 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v9, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a4->location, 0, 0);
    v15 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v9, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", length + location, 0, 0);
  }
  else
  {
    v14 = -[NSTextContentManager locationFromLocation:withOffset:](v10, "locationFromLocation:withOffset:", v11, a4->location);
    v15 = -[NSTextContentManager locationFromLocation:withOffset:](v10, "locationFromLocation:withOffset:", v14, length);
  }
  if (!v14 || !v15)
    return 0;
  v16 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v14, v15);
  v17 = -[NSTextLayoutFragment attributedStringForTruncatedRange:attributes:](self, "attributedStringForTruncatedRange:attributes:", v16, a5);

  return v17;
}

- (id)lineBreaks
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD v15[2];
  char v16;
  _BYTE v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSTextLayoutFragment layout](self, "layout");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = -[NSTextLayoutFragment textLineFragments](self, "textLineFragments");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "characterRange");
        v12 = v10 + v11;
        v13 = objc_msgSend(v9, "isHyphenated");
        v15[0] = v12;
        v15[1] = 0;
        v16 = v13;
        memset(v17, 0, sizeof(v17));
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "UIF_valueWithLineBreakContext:", v15));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSTextLayoutFragment)layoutFragmentWithKeyframe:(id)a3
{
  NSTextLayoutFragment *v5;

  v5 = -[NSTextLayoutFragment initWithTextElement:range:]([NSTextLayoutFragment alloc], "initWithTextElement:range:", -[NSTextLayoutFragment textElement](self, "textElement"), -[NSTextLayoutFragment rangeInElement](self, "rangeInElement"));
  -[NSTextLayoutFragment setKeyframe:](v5, "setKeyframe:", a3);
  -[NSTextLayoutFragment layoutFragmentFrameOrigin](self, "layoutFragmentFrameOrigin");
  -[NSTextLayoutFragment setLayoutFragmentFrameOrigin:](v5, "setLayoutFragmentFrameOrigin:");
  -[NSTextLayoutFragment setTextLayoutManager:](v5, "setTextLayoutManager:", -[NSTextLayoutFragment textLayoutManager](self, "textLayoutManager"));
  -[NSTextLayoutFragment setLayoutQueue:](v5, "setLayoutQueue:", -[NSTextLayoutFragment layoutQueue](self, "layoutQueue"));
  -[NSTextLayoutFragment setForcedLineBreaks:](v5, "setForcedLineBreaks:", -[NSTextLayoutFragment lineBreaks](self, "lineBreaks"));
  -[NSTextLayoutFragment layout](v5, "layout");
  return v5;
}

- (id)_renderingAttributesForTextAnimationContextComponent:(unint64_t)a3 range:(_NSRange)a4 attributes:(id)a5 effectiveRange:(_NSRange *)a6
{
  NSUInteger length;
  NSUInteger location;
  $6A4D90F590AF09559E5C4CC41648CD56 *p_ranges;
  NSRange v13;
  BOOL v14;
  NSUInteger v15;
  NSUInteger *p_length;
  uint64_t v17;
  NSRange v18;
  _BOOL8 v20;
  uint64_t v21;
  NSTextAnimationContext *effectiveAnimationContext;
  uint64_t v23;
  void *v24;
  _QWORD v26[5];
  NSRange v27;

  length = a4.length;
  location = a4.location;
  if (self->_textAnimationContextState._effectiveAnimationContext)
  {
    p_ranges = &self->_textAnimationContextState._ranges;
    if ((self->_textAnimationContextState._inlineAnimationRanges
       || (p_ranges = ($6A4D90F590AF09559E5C4CC41648CD56 *)p_ranges->_inline[0].location) != 0)
      && ((v13 = p_ranges->_inline[0], p_ranges->_inline[0].location == 0x7FFFFFFFFFFFFFFFLL)
        ? (v14 = v13.length == 0)
        : (v14 = 0),
          !v14))
    {
      v15 = location + a4.length;
      p_length = &p_ranges->_inline[1].length;
      v17 = 128;
      while (1)
      {
        if (v13.location >= v15)
        {
LABEL_16:
          v20 = 1;
          goto LABEL_19;
        }
        v27.location = location;
        v27.length = length;
        v18 = NSIntersectionRange(v27, v13);
        if (v18.length)
          break;
        v13 = *(NSRange *)(p_length - 1);
        p_length += 2;
        if (v13.location == 0x7FFFFFFFFFFFFFFFLL && v13.length == 0)
          goto LABEL_16;
      }
      if (v18.location == location)
        v17 = 120;
      else
        v17 = 128;
      v20 = v18.location != location;
      if (v18.location == location)
        length = v18.length;
      else
        length = v18.length - v15 + v18.location;
      if (v18.location != location)
        location = v18.location;
    }
    else
    {
      v20 = 1;
      v17 = 128;
    }
LABEL_19:
    v21 = *(uint64_t *)((char *)&self->super.isa + v17);
  }
  else
  {
    v20 = 1;
    v21 = 0xFFFFLL;
  }
  a6->location = location;
  a6->length = length;
  if ((v21 & a3) == 0)
    return 0;
  effectiveAnimationContext = self->_textAnimationContextState._effectiveAnimationContext;
  v23 = -[NSTextAnimationContext snapshotAttributeOverrides](effectiveAnimationContext, "snapshotAttributeOverrides");
  if (v23)
  {
    v24 = (void *)(*(uint64_t (**)(uint64_t, NSTextAnimationContext *, unint64_t, _BOOL8))(v23 + 16))(v23, effectiveAnimationContext, a3, v20);
    if (objc_msgSend(v24, "count"))
    {
      a5 = (id)objc_msgSend(a5, "mutableCopy");
      objc_msgSend(a5, "addEntriesFromDictionary:", v24);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __109__NSTextLayoutFragment__renderingAttributesForTextAnimationContextComponent_range_attributes_effectiveRange___block_invoke;
      v26[3] = &unk_1E2603108;
      v26[4] = a5;
      objc_msgSend(a5, "enumerateKeysAndObjectsUsingBlock:", v26);
    }
  }
  return a5;
}

uint64_t __109__NSTextLayoutFragment__renderingAttributesForTextAnimationContextComponent_range_attributes_effectiveRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (result == a3)
    return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
  return result;
}

- (void)setLayoutQueue:(NSOperationQueue *)layoutQueue
{
  objc_setProperty_atomic(self, a2, layoutQueue, 408);
}

- (BOOL)_isRenderingAttributesValidated
{
  return self->_renderingAttributesValidated;
}

- (void)set_renderingAttributesValidated:(BOOL)a3
{
  self->_renderingAttributesValidated = a3;
}

- (void)setRendersTextCorrectionMarkers:(BOOL)a3
{
  self->_rendersTextCorrectionMarkers = a3;
}

- (void)setTextAttachmentLayoutContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)extraLineFragmentAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (NSArray)truncatedRanges
{
  return (NSArray *)objc_getProperty(self, a2, 432, 1);
}

- (NSArray)textLineFragmentsExcludingExtra
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setTextLineFragmentsExcludingExtra:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSTextAnimationKeyframe)keyframe
{
  return (NSTextAnimationKeyframe *)objc_getProperty(self, a2, 224, 1);
}

- (void)setKeyframe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSArray)forcedLineBreaks
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setForcedLineBreaks:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSTextLayoutFragment)initWithLayoutManager:(id)a3 characterRange:(_NSRange)a4 animationType:(unint64_t)a5 boundingRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  NSTextParagraph *v15;
  NSTextLayoutFragment *v16;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  length = a4.length;
  location = a4.location;
  v15 = objc_alloc_init(NSTextParagraph);
  v16 = -[NSTextLayoutFragment initWithTextElement:range:](self, "initWithTextElement:range:", v15, 0);

  if (v16)
  {
    objc_storeWeak((id *)&v16->_textElement, 0);
    objc_storeWeak((id *)&v16->_layoutManager, a3);
    v16->_characterRange.location = location;
    v16->_characterRange.length = length;
    v16->_sourceBoundingRect.origin.x = x;
    v16->_sourceBoundingRect.origin.y = y;
    v16->_sourceBoundingRect.size.width = width;
    v16->_sourceBoundingRect.size.height = height;
    v16->_destinationBoundingRect.origin.x = x;
    v16->_destinationBoundingRect.origin.y = y;
    v16->_destinationBoundingRect.size.width = width;
    v16->_destinationBoundingRect.size.height = height;
    v16->_animationType = a5;
  }
  return v16;
}

- (NSLayoutManager)destinationLayoutManager
{
  return self->_destinationLayoutManager;
}

- (void)setDestinationLayoutManager:(id)a3
{
  self->_destinationLayoutManager = (NSLayoutManager *)a3;
}

- (NSTextStorage)destinationTextStorage
{
  NSTextStorage *v3;

  objc_sync_enter(self);
  v3 = self->_destinationTextStorage;
  objc_sync_exit(self);
  return v3;
}

- (void)setDestinationTextStorage:(id)a3
{
  NSTextStorage *destinationTextStorage;

  objc_sync_enter(self);
  destinationTextStorage = self->_destinationTextStorage;
  if (destinationTextStorage != a3)
  {

    self->_destinationTextStorage = (NSTextStorage *)objc_msgSend(a3, "copy");
  }
  objc_sync_exit(self);
}

- (double)destinationVerticalDelta
{
  return self->_destinationVerticalDelta;
}

- (void)setDestinationVerticalDelta:(double)a3
{
  self->_destinationVerticalDelta = a3;
}

- (_NSRange)destinationGlyphRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_destinationGlyphRange.length;
  location = self->_destinationGlyphRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setDestinationGlyphRange:(_NSRange)a3
{
  self->_destinationGlyphRange = a3;
}

- (void)setDestinationBoundingRect:(CGRect)a3
{
  self->_destinationBoundingRect = a3;
}

- (void)_setup
{
  double v3;

  -[NSTextLayoutFragment animationType](self, "animationType");
  -[NSTextLayoutFragment sourceBoundingRect](self, "sourceBoundingRect");
  self->_sourceVerticalDelta = (unint64_t)-v3;
  self->_sourceRangeDelta = 0;
}

- (void)drawAtPoint:(CGPoint)a3 contentType:(unint64_t)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  NSLayoutManager *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double sourceVerticalDelta;
  uint64_t v17;

  y = a3.y;
  x = a3.x;
  v8 = -[NSTextLayoutFragment characterRange](self, "characterRange");
  v10 = v9;
  -[NSTextLayoutFragment _setup](self, "_setup");
  v11 = -[NSTextLayoutFragment animationType](self, "animationType");
  if (a4 && (v11 & 1) != 0)
  {
    v12 = -[NSTextLayoutFragment destinationLayoutManager](self, "destinationLayoutManager");
    v13 = -[NSTextLayoutFragment destinationGlyphRange](self, "destinationGlyphRange");
    v15 = v14;
    -[NSTextLayoutFragment destinationVerticalDelta](self, "destinationVerticalDelta");
  }
  else
  {
    v12 = -[NSTextLayoutFragment layoutManager](self, "layoutManager");
    v13 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](v12, "glyphRangeForCharacterRange:actualCharacterRange:", self->_sourceRangeDelta + v8, v10, 0);
    v15 = v17;
    sourceVerticalDelta = (double)self->_sourceVerticalDelta;
  }
  -[NSLayoutManager drawGlyphsForGlyphRange:atPoint:](v12, "drawGlyphsForGlyphRange:atPoint:", v13, v15, x, y + sourceVerticalDelta);
}

- (id)layoutManager
{
  return objc_loadWeak((id *)&self->_layoutManager);
}

- (_NSRange)characterRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_characterRange.length;
  location = self->_characterRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CGRect)sourceBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceBoundingRect.origin.x;
  y = self->_sourceBoundingRect.origin.y;
  width = self->_sourceBoundingRect.size.width;
  height = self->_sourceBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)destinationBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_destinationBoundingRect.origin.x;
  y = self->_destinationBoundingRect.origin.y;
  width = self->_destinationBoundingRect.size.width;
  height = self->_destinationBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

@end
