@implementation PXStoryTextResourceInfo

- (PXStoryTextResourceInfo)initWithString:(id)a3 associatedSubtitleString:(id)a4 type:(int64_t)a5 layoutScheme:(int64_t)a6 assetCollectionUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  PXStoryTextResourceInfo *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSString *associatedSubtitleString;
  id v21;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryTextResourceInfo;
  v15 = -[PXStoryTextResourceInfo init](&v22, sel_init);
  if (v15)
  {
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (PFOSVariantHasInternalUI())
    {
      v21 = v16;
      -[PXStoryTextResourceInfo _checkForForcedPositioning:](v15, "_checkForForcedPositioning:", &v21);
      v17 = v21;

      v16 = v17;
    }
    objc_storeStrong((id *)&v15->_string, v16);
    v15->_type = a5;
    v15->_layoutScheme = a6;
    v18 = objc_msgSend(v13, "copy");
    associatedSubtitleString = v15->_associatedSubtitleString;
    v15->_associatedSubtitleString = (NSString *)v18;

    objc_storeStrong((id *)&v15->_assetCollectionUUID, a7);
    v15->_lock._os_unfair_lock_opaque = 0;
    v12 = v16;
  }

  return v15;
}

- (void)_checkForForcedPositioning:(id *)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  if (objc_msgSend(*a3, "hasSuffix:", CFSTR("*")))
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 9);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*M1*"), 0);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*M2*"), 1);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*M3*"), 2);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*L1*"), 3);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*L2*"), 4);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*L3*"), 5);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*R1*"), 6);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*R2*"), 7);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", CFSTR("*R3*"), 8);
    if (objc_msgSend(v7, "count"))
    {
      v5 = 0;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*a3, "hasSuffix:", v6))
          break;

        if (++v5 >= (unint64_t)objc_msgSend(v7, "count"))
          goto LABEL_9;
      }
      objc_msgSend(*a3, "substringToIndex:", objc_msgSend(*a3, "length") - objc_msgSend(v6, "length"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryTextResourceInfo setHasForcedPositioning:](self, "setHasForcedPositioning:", 1);
      -[PXStoryTextResourceInfo setForcedPositionIndex:](self, "setForcedPositionIndex:", v5);

    }
LABEL_9:

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  int64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXStoryTextResourceInfo string](self, "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) == 0)
        goto LABEL_10;
    }
    v11 = -[PXStoryTextResourceInfo type](self, "type");
    if (v11 == objc_msgSend(v5, "type"))
    {
      -[PXStoryTextResourceInfo associatedSubtitleString](self, "associatedSubtitleString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "associatedSubtitleString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
        v10 = 1;
      else
        v10 = objc_msgSend(v12, "isEqualToString:", v13);

      goto LABEL_13;
    }
LABEL_10:
    v10 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (int64_t)drawingOptions
{
  return 33;
}

- (double)boundingRectPadding
{
  return 20.0;
}

- (int64_t)verticalAlignment
{
  return 0;
}

- (NSAttributedString)attributedString
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSAttributedString copy](self->_lock_attributedString, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSAttributedString *)v4;
}

- (CGSize)boundingSize
{
  os_unfair_lock_s *p_lock;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  CGSize result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  width = self->_lock_boundingSize.width;
  height = self->_lock_boundingSize.height;
  os_unfair_lock_unlock(p_lock);
  v6 = width;
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGPoint)origin
{
  os_unfair_lock_s *p_lock;
  CGFloat x;
  CGFloat y;
  double v6;
  double v7;
  CGPoint result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  x = self->_lock_origin.x;
  y = self->_lock_origin.y;
  os_unfair_lock_unlock(p_lock);
  v6 = x;
  v7 = y;
  result.y = v7;
  result.x = v6;
  return result;
}

- (NSStringDrawingContext)drawingContext
{
  os_unfair_lock_s *p_lock;
  NSStringDrawingContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_drawingContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)textAlignment
{
  os_unfair_lock_s *p_lock;
  int64_t lock_textAlignment;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_textAlignment = self->_lock_textAlignment;
  os_unfair_lock_unlock(p_lock);
  return lock_textAlignment;
}

- (int64_t)effectivePositionIndex
{
  os_unfair_lock_s *p_lock;
  int64_t lock_effectivePositionIndex;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_effectivePositionIndex = self->_lock_effectivePositionIndex;
  os_unfair_lock_unlock(p_lock);
  return lock_effectivePositionIndex;
}

- (double)_subtitleLineSpacingForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6 isVerticalText:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  id v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v13 = a5;
  if (v7)
    v14 = 25.0;
  else
    v14 = 30.0;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "useReferenceWidthBasedTitleLayout");

  if (v16 || a3 - 1 <= 1)
  {
    -[PXStoryTextResourceInfo _titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", a3, v13, width, height, a6);
    v18 = v14 * v17;
  }
  else
  {
    if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v13))
      v19 = 2;
    else
      v19 = 1;
    -[PXStoryTextResourceInfo _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:", v13, a6);
    v21 = v20;
    -[PXStoryTextResourceInfo _titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", v19, v13);
    v18 = width * (v14 * v22 / v21);
  }
  if (a3 == 64)
    v23 = 18.0;
  else
    v23 = v18;

  return v23;
}

- (CGSize)_occlusionSizeForSize:(CGSize)a3 kind:(unint64_t)a4 size:(CGSize)a5 containerRect:(CGRect)a6 stylePairing:(int64_t)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9 isVerticalText:(BOOL)a10 isKashida:(BOOL)a11
{
  _BOOL8 v12;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  double v19;
  double v20;
  id v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double height;
  CGSize result;

  v12 = a10;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a5.height;
  v17 = a5.width;
  v19 = a3.height;
  v20 = a3.width;
  v22 = a8;
  if (v12)
    v23 = v19;
  else
    v23 = v20;
  v24 = v23 + -40.0;
  -[PXStoryTextResourceInfo drawingContext](self, "drawingContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "baselineOffset");
  v27 = v26;

  if (!a11)
  {
    -[PXStoryTextResourceInfo _subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:](self, "_subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:", a4, v22, v12, v17, v16, a9);
    v39 = v28;
    -[PXStoryTextResourceInfo associatedSubtitleString](self, "associatedSubtitleString");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = (const __CFString *)v29;
    else
      v31 = &stru_1E5149688;
    -[PXStoryTextResourceInfo attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:](self, "attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:", v31, a4, self, v22, 0, v17, v16, x, y, width, height, a9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "second");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "CGSizeValue");
    v35 = v34;

    if (v24 < v35 + -40.0)
      v24 = v35 + -40.0;
    v27 = v27 + v39;
  }
  if (v12)
    v36 = v24;
  else
    v36 = v27;
  if (!v12)
    v27 = v24;

  v37 = v27;
  v38 = v36;
  result.height = v38;
  result.width = v37;
  return result;
}

- (CGRect)attributedStringFrameInRect:(CGRect)a3 titleCategory:(id)a4 displayAsset:(id)a5 currentAssetCropRect:(CGRect)a6 kind:(unint64_t)a7 relativeTo:(id)a8 extendedTraitCollectionSnapshot:(id)a9 fixedBottomPadding:(double)a10
{
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  id v19;
  id v20;
  id v21;
  id v22;
  double *v23;
  double *v24;
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
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  _BOOL8 v45;
  _BOOL8 v46;
  uint64_t v47;
  _BOOL8 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  _BOOL8 v57;
  int64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  int64_t v66;
  uint64_t v67;
  void *v68;
  unsigned int v69;
  id v70;
  unsigned int (**v71)(void);
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  int64_t v79;
  CGFloat v80;
  double v81;
  id v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  uint64_t v87;
  _BOOL4 v88;
  double v89;
  double v90;
  double v91;
  double v92;
  unsigned int (**v93)(void);
  void *v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  _BOOL4 v105;
  void *v106;
  char v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  CGFloat v113;
  double v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  NSAttributedString *v123;
  NSAttributedString *lock_attributedString;
  NSStringDrawingContext *lock_drawingContext;
  NSStringDrawingContext *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  _BOOL4 v136;
  unsigned int (**v137)(void);
  double v138;
  unsigned int v139;
  void *v140;
  double height;
  double width;
  double x;
  double y;
  double v145;
  NSStringDrawingContext *v146;
  id v147;
  double v148;
  id v149;
  id v150;
  void *v151;
  int64_t v152;
  _QWORD aBlock[4];
  id v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  x = a6.origin.x;
  y = a6.origin.y;
  v14 = a3.size.height;
  v15 = a3.size.width;
  v16 = a3.origin.y;
  v17 = a3.origin.x;
  v19 = a4;
  v20 = a5;
  v21 = a8;
  v22 = a9;
  v23 = (double *)MEMORY[0x1E0C9D820];
  v24 = (double *)MEMORY[0x1E0C9D538];
  if (a7 == 1)
  {
    if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v22))
      a7 = 2;
    else
      a7 = 1;
  }
  v26 = *v23;
  v25 = v23[1];
  v28 = *v24;
  v27 = v24[1];
  -[PXStoryTextResourceInfo string](self, "string");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v16;
  v29 = v16;
  v148 = v15;
  v30 = v14;
  -[PXStoryTextResourceInfo _availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:](self, "_availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:", v22, a7, v17, v29, v15, v14, a10);
  v32 = v31;
  v34 = v33;
  v35 = -[PXStoryTextResourceInfo layoutScheme](self, "layoutScheme");
  if (v35 == 1)
  {
    v58 = -[PXStoryTextResourceInfo type](self, "type");
    if (v58 == 1)
    {
      v28 = *MEMORY[0x1E0C9D648];
      v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_65;
    }
    if (!v58)
    {
      -[PXStoryTextResourceInfo associatedSubtitleString](self, "associatedSubtitleString");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "length"))
      {
        objc_msgSend(v151, "stringByAppendingFormat:", CFSTR("\n%@"), v59);
        v132 = objc_claimAutoreleasedReturnValue();

        v151 = (void *)v132;
      }
      -[PXStoryTextResourceInfo attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:", v151, objc_msgSend((id)objc_opt_class(), "stylePairingFromTitleCategory:string:kind:layoutScheme:", v19, v151, a7, -[PXStoryTextResourceInfo layoutScheme](self, "layoutScheme")), a7, v22, v32, v34, v17, v145, v148, v30,
        a10);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "first");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "second");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "CGSizeValue");
      v26 = v63;
      v25 = v64;

      -[PXStoryTextResourceInfo drawingContext](self, "drawingContext");
      v146 = (NSStringDrawingContext *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v61, "length"))
      {
        objc_msgSend(v61, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v65 = 0;
      }
      v155.origin.x = v17;
      v155.origin.y = v145;
      v155.size.width = v148;
      v155.size.height = v30;
      v28 = CGRectGetMidX(v155) + v26 * -0.5;
      v156.origin.x = v17;
      v156.origin.y = v145;
      v156.size.width = v148;
      v156.size.height = v30;
      v80 = CGRectGetMaxY(v156) - a10;
      objc_msgSend(v65, "descender");
      v27 = v80 - v81 - v25 + 20.0;

      v66 = 1;
      v67 = 2;
      goto LABEL_22;
    }
  }
  else if (!v35)
  {
    v36 = -[PXStoryTextResourceInfo type](self, "type");
    if (v36 != 1)
    {
      if (!v36)
      {
        v37 = objc_msgSend((id)objc_opt_class(), "stylePairingFromTitleCategory:string:kind:layoutScheme:", v19, v151, a7, -[PXStoryTextResourceInfo layoutScheme](self, "layoutScheme"));
        -[PXStoryTextResourceInfo attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:", v151, v37, a7, v22, v32, v34, v17, v145, v148, v30, a10);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "second");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "CGSizeValue");
        v41 = v40;
        v43 = v42;

        v135 = v38;
        objc_msgSend(v38, "first");
        v44 = objc_claimAutoreleasedReturnValue();
        -[PXStoryTextResourceInfo drawingContext](self, "drawingContext");
        v146 = (NSStringDrawingContext *)objc_claimAutoreleasedReturnValue();
        v45 = -[PXStoryTextResourceInfo _isVerticalText:](self, "_isVerticalText:", v44);
        v46 = -[PXStoryTextResourceInfo _isKashidaText:](self, "_isKashidaText:", v44);
        v47 = 2;
        if (!v46)
          v47 = 0;
        if (v45)
          v47 = 1;
        v134 = v47;
        v138 = v41;
        v25 = v43;
        v48 = v46;
        -[PXStoryTextResourceInfo _occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:](self, "_occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:", a7, v37, v22, v45, v41, v43, v32, v34, v17, v145, v148, v30, *(_QWORD *)&a10);
        v50 = v49;
        v52 = v51;
        v136 = v45;
        v140 = (void *)v44;
        if (v45)
        {
          -[PXStoryTextResourceInfo associatedSubtitleString](self, "associatedSubtitleString");
          v53 = v22;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXStoryTextResourceInfo assetCollectionUUID](self, "assetCollectionUUID");
          v55 = v21;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v54, v56) == 1;

          v21 = v55;
          v22 = v53;
        }
        else
        {
          v57 = 0;
        }
        -[PXStoryTextResourceInfo _possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:](self, "_possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:", a7, v22, v136, v57, v48, v17, v145, v148, v30, v41, v25, v50, v52, *(_QWORD *)&a10);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectAtIndexedSubscript:", 5);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "pointValue");
        v28 = v77;
        v27 = v78;

        if (a7 != 64)
        {
          if (-[PXStoryTextResourceInfo hasForcedPositioning](self, "hasForcedPositioning"))
          {
            v79 = -[PXStoryTextResourceInfo forcedPositionIndex](self, "forcedPositionIndex");
          }
          else
          {
            v79 = -[PXStoryTextResourceInfo _fullScreenTitlePositionWithTitleCategory:displayAsset:currentAssetCropRect:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:](self, "_fullScreenTitlePositionWithTitleCategory:displayAsset:currentAssetCropRect:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:", v19, v20, v21, v22, v134, x, y, width, height, a10);
            if (v79 == 0x7FFFFFFFFFFFFFFFLL)
            {
              -[PXStoryTextResourceInfo bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:](self, "bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:", v75, v20, objc_msgSend(v22, "layoutOrientation"), v134, v17, v145, v148, v30, v50, v52, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
              v28 = v95;
              v27 = v96;
              goto LABEL_47;
            }
          }
          objc_msgSend(v75, "objectAtIndexedSubscript:", v79);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "pointValue");
          v28 = v98;
          v27 = v99;

        }
LABEL_47:
        v26 = v138;
        if (v136)
        {
          objc_msgSend(v75, "objectAtIndexedSubscript:", 4);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "pointValue");
          v102 = v101;

          if (v27 != v102)
          {
            objc_msgSend(v75, "objectAtIndexedSubscript:", 5);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "pointValue");
            v105 = v27 == v104;
LABEL_50:

            v66 = 2 * v105;
LABEL_56:
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v28, v27);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = objc_msgSend(v75, "indexOfObject:", v111);

            v112 = v135;
LABEL_60:

            v61 = v140;
            goto LABEL_61;
          }
        }
        else
        {
          if (v48)
          {
            v66 = 3;
            goto LABEL_56;
          }
          +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v106, "titleUseCenterAlignment");

          if ((v107 & 1) == 0)
          {
            objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "pointValue");
            v110 = v109;

            if (v28 != v110)
            {
              objc_msgSend(v75, "objectAtIndexedSubscript:", 3);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "pointValue");
              v105 = v28 != v131;
              goto LABEL_50;
            }
          }
        }
        v66 = 1;
        goto LABEL_56;
      }
      goto LABEL_21;
    }
    if (v21)
      objc_msgSend(v21, "attributedStringFrameInRect:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:", v19, v20, a7, 0, v22, v17, v145, v148, v30, x, y, width, height, *(_QWORD *)&a10);
    objc_msgSend(v21, "attributedString");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v21, "_isVerticalText:", v68);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __170__PXStoryTextResourceInfo_attributedStringFrameInRect_titleCategory_displayAsset_currentAssetCropRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke;
    aBlock[3] = &unk_1E51282E8;
    v70 = v21;
    v154 = v70;
    v71 = (unsigned int (**)(void))_Block_copy(aBlock);
    v139 = v69;
    v137 = v71;
    if (v69 && !v71[2]())
    {
      v73 = 0;
      v74 = 1;
    }
    else
    {
      objc_msgSend(v70, "attributedString");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v70, "_isKashidaText:", v72);

      if (v73)
        v74 = 2;
      else
        v74 = 0;
    }
    v82 = v22;
    -[PXStoryTextResourceInfo attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:](self, "attributedStringBoundingSizeForSubtitle:size:containerRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:desiredInternationalStyle:", v151, a7, v70, v22, v74, v32, v34, v17, v145, v148, v30, a10);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "second");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "CGSizeValue");
    v26 = v85;
    v25 = v86;

    objc_msgSend(v83, "first");
    v87 = objc_claimAutoreleasedReturnValue();
    -[PXStoryTextResourceInfo drawingContext](self, "drawingContext");
    v146 = (NSStringDrawingContext *)objc_claimAutoreleasedReturnValue();
    v140 = (void *)v87;
    v88 = -[PXStoryTextResourceInfo _isVerticalText:](self, "_isVerticalText:", v87);
    if (v139)
    {
      v89 = x;
      v90 = y;
      if (((v73 | !v88) & 1) == 0)
      {
LABEL_40:
        LOBYTE(v133) = v88;
        v22 = v82;
        -[PXStoryTextResourceInfo _subtitlePositionInFrame:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:](self, "_subtitlePositionInFrame:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:", v19, v20, a7, v70, v82, v139, v17, v145, v148, v30, v89, v90, width, height, *(_QWORD *)&a10, v133);
        v28 = v91;
        v27 = v92;
        v152 = objc_msgSend(v70, "effectivePositionIndex");
        v93 = v137;
LABEL_59:
        v66 = objc_msgSend(v70, "textAlignment");

        v112 = v154;
        goto LABEL_60;
      }
    }
    else
    {
      v89 = x;
      v90 = y;
      if (!v73)
        goto LABEL_40;
    }
    v22 = v82;
    if (objc_msgSend(v140, "length"))
    {
      objc_msgSend(v140, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v94 = 0;
    }
    v93 = v137;
    v157.origin.x = v17;
    v157.origin.y = v145;
    v157.size.width = v148;
    v157.size.height = v30;
    v28 = CGRectGetMidX(v157) + v26 * -0.5;
    v158.origin.x = v17;
    v158.origin.y = v145;
    v158.size.width = v148;
    v158.size.height = v30;
    v113 = CGRectGetMaxY(v158) - a10;
    objc_msgSend(v94, "descender");
    v27 = v113 - v114 - v25 + -5.0;

    v152 = 2;
    goto LABEL_59;
  }
LABEL_21:
  v66 = 0;
  v146 = 0;
  v61 = 0;
  v67 = 5;
LABEL_22:
  v152 = v67;
LABEL_61:
  v149 = v20;
  v150 = v21;
  v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v61);
  v147 = v22;
  v116 = v19;
  if (objc_msgSend(v61, "length"))
  {
    objc_msgSend(v61, "attributesAtIndex:effectiveRange:", 0, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v117 = (void *)MEMORY[0x1E0C9AA70];
  }
  v118 = v61;
  v119 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v117, "valueForKey:", *MEMORY[0x1E0DC1178]);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v117);
  objc_msgSend(v120, "setAlignment:", v66);
  objc_msgSend(v121, "setValue:forKey:", v120, v119);
  v122 = (void *)objc_msgSend(v121, "copy");

  objc_msgSend(v115, "setAttributes:range:", v122, 0, objc_msgSend(v118, "length"));
  os_unfair_lock_lock(&self->_lock);
  v123 = (NSAttributedString *)objc_msgSend(v115, "copy");
  lock_attributedString = self->_lock_attributedString;
  self->_lock_attributedString = v123;

  self->_lock_boundingSize.width = v26;
  self->_lock_boundingSize.height = v25;
  self->_lock_origin.x = v28;
  self->_lock_origin.y = v27;
  lock_drawingContext = self->_lock_drawingContext;
  self->_lock_drawingContext = v146;
  self->_lock_textAlignment = v66;
  v126 = v146;

  self->_lock_effectivePositionIndex = v152;
  os_unfair_lock_unlock(&self->_lock);

  v19 = v116;
  v20 = v149;
  v21 = v150;
  v22 = v147;
LABEL_65:

  v127 = v28;
  v128 = v27;
  v129 = v26;
  v130 = v25;
  result.size.height = v130;
  result.size.width = v129;
  result.origin.y = v128;
  result.origin.x = v127;
  return result;
}

- (BOOL)_isVerticalText:(id)a3
{
  return PXStoryTitleInternationalStyleAppliedToAttributedString(a3) == 1;
}

- (BOOL)_isKashidaText:(id)a3
{
  return PXStoryTitleInternationalStyleAppliedToAttributedString(a3) == 2;
}

- (double)_sizeWidthMinimumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  double result;
  void *v13;
  double v14;

  if ((uint64_t)a3 > 63)
  {
    if (a3 == 64)
    {
      *(double *)&v5 = 100.0;
      goto LABEL_12;
    }
    if (a3 != 128)
      goto LABEL_4;
  }
  else
  {
    if (a3 == 2)
    {
      *(double *)&v5 = 200.0;
      goto LABEL_12;
    }
    if (a3 != 32)
    {
LABEL_4:
      *(double *)&v5 = 240.0;
LABEL_12:
      v6 = *(double *)&v5;
      goto LABEL_13;
    }
  }
  v4 = 170.0;
  if (a4)
    v6 = 170.0;
  else
    v6 = 240.0;
LABEL_13:
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleWidthMin");
  v9 = v8;

  if (v9 != 0.0)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleWidthMin");
    v6 = v14;

  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useReferenceWidthBasedTitleLayout");

  result = 0.0;
  if (!v11)
    return v6;
  return result;
}

- (double)_sizeWidthMaximumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  double result;
  void *v12;
  double v13;

  if (a3 == 2)
  {
    v5 = 600.0;
  }
  else if (a3 == 128 || a3 == 32)
  {
    v4 = 360.0;
    if (a4)
      v4 = 280.0;
    if (a3 == 128)
      v5 = 680.0;
    else
      v5 = v4;
  }
  else
  {
    v5 = 360.0;
  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleWidthMax");
  v8 = v7;

  if (v8 != 0.0)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleWidthMax");
    v5 = v13;

  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "useReferenceWidthBasedTitleLayout");

  result = 1.79769313e308;
  if (!v10)
    return v5;
  return result;
}

- (double)_sizeWidthScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v6 = a4;
  v7 = objc_msgSend(v6, "layoutOrientation");
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "useReferenceWidthBasedTitleLayout");

  if (v9)
  {
    v10 = dbl_1A7C0C4D0[v7 == 2];
    v11 = dbl_1A7C0C4E0[v7 == 2];
    v12 = 0.0;
    if ((uint64_t)a3 > 31)
    {
      if ((uint64_t)a3 > 255)
      {
        switch(a3)
        {
          case 0x100uLL:
            v12 = 0.6;
            goto LABEL_50;
          case 0x200uLL:
            if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v6))
            {
              v12 = v11;
            }
            else
            {
              v12 = v10;
            }
            goto LABEL_50;
          case 0x400uLL:
            v12 = 0.4;
            goto LABEL_50;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x20uLL:
LABEL_23:
            if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v6))
            {
              if (v7 == 2)
                v12 = 0.5;
              else
                v12 = 0.65;
            }
            else
            {
              v12 = dbl_1A7C0C4F0[v7 == 2];
            }
            break;
          case 0x40uLL:
LABEL_27:
            v12 = 0.8;
            break;
          case 0x80uLL:
            if (v7 == 2)
              v12 = 0.5;
            else
              v12 = 0.7;
            goto LABEL_50;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 0uLL:
          goto LABEL_27;
        case 1uLL:
          goto LABEL_39;
        case 2uLL:
          v10 = dbl_1A7C0C4E0[v7 == 2];
          goto LABEL_39;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_35;
        case 4uLL:
          goto LABEL_23;
        case 8uLL:
          break;
        default:
          if (a3 != 16)
            goto LABEL_35;
          break;
      }
      v12 = 0.4;
    }
LABEL_35:
    if ((uint64_t)a3 > 127)
    {
      if ((uint64_t)a3 > 511)
      {
        if (a3 != 512 && a3 != 1024)
          goto LABEL_56;
      }
      else if (a3 != 128 && a3 != 256)
      {
        goto LABEL_56;
      }
    }
    else
    {
      if (a3 > 0x20)
        goto LABEL_56;
      if (((1 << a3) & 0x100010110) == 0)
      {
        v10 = v12;
        if (((1 << a3) & 6) == 0)
          goto LABEL_56;
        goto LABEL_39;
      }
    }
LABEL_50:
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v7 == 2)
    {
      objc_msgSend(v22, "titleFeedLandscapeWidthScale");
      v25 = v24;

      if (v25 != 0.0)
      {
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "titleFeedLandscapeWidthScale");
        goto LABEL_55;
      }
    }
    else
    {
      objc_msgSend(v22, "titleFeedPortraitWidthScale");
      v27 = v26;

      if (v27 != 0.0)
      {
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "titleFeedPortraitWidthScale");
        goto LABEL_55;
      }
    }
    goto LABEL_56;
  }
  if (a3 != 2)
  {
    if ((a3 == 128 || a3 == 32) && v7 == 2)
      v12 = 0.76;
    else
      v12 = 0.7;
    goto LABEL_35;
  }
  v10 = 0.4;
LABEL_39:
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v7 == 2)
  {
    objc_msgSend(v13, "titleFullScreenLandscapeWidthScale");
    v16 = v15;

    v17 = v16 == 0.0;
    v12 = v10;
    if (!v17)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "titleFullScreenLandscapeWidthScale");
LABEL_55:
      v12 = v19;

    }
  }
  else
  {
    objc_msgSend(v13, "titleFullScreenPortraitWidthScale");
    v21 = v20;

    v17 = v21 == 0.0;
    v12 = v10;
    if (!v17)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "titleFullScreenPortraitWidthScale");
      goto LABEL_55;
    }
  }
LABEL_56:

  return v12;
}

- (double)_paddingLeadingMinimumForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  double result;
  BOOL v5;
  double v6;

  result = 0.0;
  if ((uint64_t)a3 > 127)
  {
    if ((uint64_t)a3 > 511)
    {
      if (a3 != 512 && a3 != 1024)
        return result;
    }
    else if (a3 != 128 && a3 != 256)
    {
      return result;
    }
    goto LABEL_16;
  }
  if ((uint64_t)a3 <= 3)
  {
    if (a3 == 1)
      return 45.0;
    if (a3 == 2)
      return 50.0;
    return result;
  }
  if (a3 != 4)
  {
    if (a3 != 32)
      return result;
LABEL_16:
    v5 = !a4;
    result = 35.0;
    v6 = 25.0;
    goto LABEL_17;
  }
  v5 = !a4;
  result = 35.0;
  v6 = 0.0;
LABEL_17:
  if (!v5)
    return v6;
  return result;
}

- (double)_paddingLeftOrRightAlignmentLeadingScaleForKind:(unint64_t)a3 orientationIsLandscape:(BOOL)a4
{
  double result;
  BOOL v5;
  double v6;

  result = 0.0;
  if ((uint64_t)a3 <= 31)
  {
    switch(a3)
    {
      case 0uLL:
        return 1.0;
      case 1uLL:
        return 0.1;
      case 2uLL:
        v5 = !a4;
        result = 0.14;
        v6 = 0.1;
        goto LABEL_13;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      case 4uLL:
        v5 = !a4;
        result = 0.1;
        v6 = 0.07;
        goto LABEL_13;
      case 8uLL:
        goto LABEL_18;
      default:
        if (a3 == 16)
LABEL_18:
          result = 0.07;
        break;
    }
    return result;
  }
  if ((uint64_t)a3 > 255)
  {
    if (a3 != 256 && a3 != 512 && a3 != 1024)
      return result;
    goto LABEL_12;
  }
  switch(a3)
  {
    case 0x20uLL:
      goto LABEL_12;
    case 0x40uLL:
      return 1.0;
    case 0x80uLL:
LABEL_12:
      v5 = !a4;
      result = 0.1;
      v6 = 0.08;
LABEL_13:
      if (!v5)
        return v6;
      break;
  }
  return result;
}

- (double)_paddingTopScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  _BOOL4 v9;
  double *v10;
  BOOL v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  double v17;
  void *v19;
  double v20;

  v6 = a4;
  v7 = objc_msgSend(v6, "layoutOrientation");
  v8 = 0.0;
  if ((uint64_t)a3 <= 31)
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_14;
      case 1uLL:
        v9 = v7 == 2;
        v10 = (double *)&unk_1A7C0C520;
        goto LABEL_13;
      case 2uLL:
        v8 = 0.14;
        goto LABEL_22;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_22;
      case 4uLL:
        v13 = v7 == 2;
        v14 = -[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v6);
        v12 = dbl_1A7C0C510[v13];
        v11 = !v14;
        goto LABEL_19;
      case 8uLL:
        goto LABEL_16;
      default:
        if (a3 == 16)
        {
LABEL_16:
          v11 = !-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v6);
          v12 = 0.2;
LABEL_19:
          if (v11)
            v8 = v12;
          else
            v8 = 0.14;
        }
        break;
    }
    goto LABEL_22;
  }
  if ((uint64_t)a3 > 255)
  {
    if (a3 != 256 && a3 != 512 && a3 != 1024)
      goto LABEL_22;
    goto LABEL_12;
  }
  switch(a3)
  {
    case 0x20uLL:
      goto LABEL_12;
    case 0x40uLL:
LABEL_14:
      v8 = 1.0;
      break;
    case 0x80uLL:
LABEL_12:
      v9 = v7 == 2;
      v10 = (double *)&unk_1A7C0C500;
LABEL_13:
      v8 = v10[v9];
      break;
  }
LABEL_22:
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "titlePaddingTopScale");
  v17 = v16;

  if (v17 != 0.0)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "titlePaddingTopScale");
    v8 = v20;

  }
  return v8;
}

- (double)_paddingBottomScaleForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4
{
  uint64_t v5;
  double result;
  void *v7;
  double v8;
  double v9;

  v5 = objc_msgSend(a4, "layoutOrientation");
  result = 0.0;
  if ((uint64_t)a3 <= 31)
  {
    switch(a3)
    {
      case 0uLL:
        return 1.0;
      case 1uLL:
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance", 0.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titleRegularPaddingBottomScale");
        v9 = v8;

        result = v9;
        break;
      case 2uLL:
        result = 0.14;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      case 4uLL:
        return dbl_1A7C0C500[v5 == 2];
      case 8uLL:
        result = 0.2;
        break;
      default:
        if (a3 == 16)
          result = 0.26;
        break;
    }
    return result;
  }
  if ((uint64_t)a3 > 255)
  {
    if (a3 != 256 && a3 != 512 && a3 != 1024)
      return result;
    return dbl_1A7C0C500[v5 == 2];
  }
  switch(a3)
  {
    case 0x20uLL:
      return dbl_1A7C0C500[v5 == 2];
    case 0x40uLL:
      return 1.0;
    case 0x80uLL:
      return dbl_1A7C0C500[v5 == 2];
  }
  return result;
}

- (double)_paddingLeftOrRightAlignmentLeadingForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5
{
  double width;
  uint64_t v8;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;

  width = a5.size.width;
  v8 = objc_msgSend(a4, "layoutOrientation", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (a3 == 64)
    return 14.0;
  v10 = v8 == 2;
  -[PXStoryTextResourceInfo _paddingLeftOrRightAlignmentLeadingScaleForKind:orientationIsLandscape:](self, "_paddingLeftOrRightAlignmentLeadingScaleForKind:orientationIsLandscape:", a3, v10);
  v12 = width * v11;
  -[PXStoryTextResourceInfo _paddingLeadingMinimumForKind:orientationIsLandscape:](self, "_paddingLeadingMinimumForKind:orientationIsLandscape:", a3, v10);
  return fmax(v12, v13);
}

- (double)_paddingTopForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5
{
  double height;
  double v8;
  double v9;
  BOOL v10;
  double v11;

  if (a3 == 64)
    return 14.0;
  height = a5.size.height;
  -[PXStoryTextResourceInfo _paddingTopScaleForKind:extendedTraitCollectionSnapshot:](self, "_paddingTopScaleForKind:extendedTraitCollectionSnapshot:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width);
  v9 = height * v8;
  v10 = a3 == 8 || a3 == 4;
  v11 = 48.0;
  if (!v10)
    v11 = 0.0;
  return fmax(v11, v9);
}

- (double)_paddingBottomForKind:(unint64_t)a3 extendedTraitCollectionSnapshot:(id)a4 rect:(CGRect)a5 fixedBottomPadding:(double)a6
{
  double height;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;

  height = a5.size.height;
  v10 = a4;
  v11 = v10;
  v12 = 14.0;
  if (a3 != 64)
  {
    if (a6 == 0.0)
    {
      -[PXStoryTextResourceInfo _paddingBottomScaleForKind:extendedTraitCollectionSnapshot:](self, "_paddingBottomScaleForKind:extendedTraitCollectionSnapshot:", a3, v10);
      v12 = height * v13;
    }
    else
    {
      v14 = objc_msgSend(v10, "layoutOrientation");
      v15 = 40.0;
      if (v14 == 2)
        v15 = 26.0;
      v12 = v15 + a6;
    }
  }

  return v12;
}

- (id)_possibleTitlePositionsForRect:(CGRect)a3 boudingSize:(CGSize)a4 occlusionSize:(CGSize)a5 kind:(unint64_t)a6 extendedTraitCollectionSnapshot:(id)a7 fixedBottomPadding:(double)a8 isTitleVertical:(BOOL)a9 isSubtitleVertical:(BOOL)a10 isKashida:(BOOL)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double width;
  double v16;
  double v17;
  double v18;
  double y;
  double x;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  BOOL v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  int v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v61;
  double height;
  double v63;

  v11 = a11;
  v12 = a10;
  v13 = a9;
  height = a5.height;
  width = a5.width;
  v16 = a4.width;
  v17 = a3.size.height;
  v18 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = a7;
  -[PXStoryTextResourceInfo _paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", a6, v22, x, y, v18, v17);
  v24 = v23;
  -[PXStoryTextResourceInfo _paddingTopForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingTopForKind:extendedTraitCollectionSnapshot:rect:", a6, v22, x, y, v18, v17);
  v61 = v25;
  -[PXStoryTextResourceInfo _paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:](self, "_paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:", a6, v22, x, y, v18, v17, a8);
  v27 = v26;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "titleUseCenterAlignment");

  if (v29)
    v30 = width <= v16 + -40.0;
  else
    v30 = 1;
  if (v30)
    v31 = v24 + -20.0;
  else
    v31 = v24 + (width - v16) * 0.5;
  if (v30)
    v32 = v18 - v16 - v24 + 20.0;
  else
    v32 = v18 - width - v24 + (width - v16) * 0.5;
  v33 = v16 * -0.5 + v18 * 0.5;
  v34 = v61 + -20.0;
  v35 = v17 - height - v27 + -20.0;
  v36 = height * -0.5 + v17 * 0.5 + -20.0;
  v37 = objc_msgSend(v22, "userInterfaceIdiom");

  v38 = a6 == 4 && v13;
  v39 = v34 + v18 * 0.05;
  if (!v38 || (unint64_t)(v37 - 1) >= 2)
    v39 = v61 + -20.0;
  v63 = v39;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 9);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v33, v34);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v41, 0);

  v43 = *MEMORY[0x1E0C9D538];
  v42 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v13)
    v44 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  else
    v44 = v36;
  if (v13)
    v45 = *MEMORY[0x1E0C9D538];
  else
    v45 = v33;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v45, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v46, 1);

  if (v13 || v11)
    v47 = v42;
  else
    v47 = v35;
  if (v13 || v11)
    v48 = v43;
  else
    v48 = v33;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v48, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v49, 2);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v31, v34);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v50, 3);

  v51 = v13 ^ v12 | v11;
  if (v51)
  {
    v36 = v42;
    v52 = v43;
  }
  else
  {
    v52 = v31;
  }
  if (v51)
    v53 = v42;
  else
    v53 = v35;
  if (v51)
    v54 = v43;
  else
    v54 = v32;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v52, v36);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v55, 4);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v52, v53);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v56, 5);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v32, v63);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v57, 6);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v54, v36);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v58, 7);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v54, v53);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:atIndexedSubscript:", v59, 8);

  return v40;
}

- (CGSize)_availableSizeForRect:(CGRect)a3 extendedTraitCollectionSnapshot:(id)a4 kind:(unint64_t)a5 fixedBottomPadding:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  _BOOL8 v14;
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
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = objc_msgSend(v13, "layoutOrientation") == 2;
  -[PXStoryTextResourceInfo _sizeWidthMinimumForKind:orientationIsLandscape:](self, "_sizeWidthMinimumForKind:orientationIsLandscape:", a5, v14);
  v16 = v15;
  -[PXStoryTextResourceInfo _sizeWidthMaximumForKind:orientationIsLandscape:](self, "_sizeWidthMaximumForKind:orientationIsLandscape:", a5, v14);
  v28 = v17;
  -[PXStoryTextResourceInfo _sizeWidthScaleForKind:extendedTraitCollectionSnapshot:](self, "_sizeWidthScaleForKind:extendedTraitCollectionSnapshot:", a5, v13);
  v19 = v18;
  -[PXStoryTextResourceInfo _paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", a5, v13, x, y, width, height);
  v27 = v20;
  -[PXStoryTextResourceInfo _paddingTopForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingTopForKind:extendedTraitCollectionSnapshot:rect:", a5, v13, x, y, width, height);
  v22 = v21;
  -[PXStoryTextResourceInfo _paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:](self, "_paddingBottomForKind:extendedTraitCollectionSnapshot:rect:fixedBottomPadding:", a5, v13, x, y, width, height, a6);
  v24 = v23;

  if (width * v19 >= v16 || width - v16 + v27 * -2.0 <= 0.0)
    v16 = fmin(width * v19, v28);
  v25 = height - v22 - v24;
  v26 = v16;
  result.height = v25;
  result.width = v26;
  return result;
}

- (CGSize)_fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:(id)a3 fixedBottomPadding:(double)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v5))
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v5, "fullScreenReferenceRect");
  -[PXStoryTextResourceInfo _availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:](self, "_availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:", v5, v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)_fullScreenTitlePositionWithTitleCategory:(id)a3 displayAsset:(id)a4 currentAssetCropRect:(CGRect)a5 relativeTo:(id)a6 extendedTraitCollectionSnapshot:(id)a7 fixedBottomPadding:(double)a8 desiredInternationalStyle:(int64_t)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
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
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  int64_t v56;
  double v58;
  double v59;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v14))
    v17 = 2;
  else
    v17 = 1;
  objc_msgSend(v14, "fullScreenReferenceRect");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[PXStoryTextResourceInfo _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:", v14, a8);
  v27 = v26;
  v29 = v28;
  v58 = v28;
  v30 = (void *)objc_opt_class();
  -[PXStoryTextResourceInfo string](self, "string");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "stylePairingFromTitleCategory:string:kind:layoutScheme:", v16, v31, v17, -[PXStoryTextResourceInfo layoutScheme](self, "layoutScheme"));

  -[PXStoryTextResourceInfo string](self, "string");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v29;
  v35 = v19;
  v36 = v21;
  -[PXStoryTextResourceInfo attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "attributedStringBoundingSizeForTitle:stylePairing:availableSize:containerRect:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:", v33, v32, v17, v14, v27, v34, v19, v21, v23, v25, a8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "second");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "CGSizeValue");
  v40 = v39;
  v42 = v41;

  v59 = a8;
  -[PXStoryTextResourceInfo _occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:](self, "_occlusionSizeForSize:kind:size:containerRect:stylePairing:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:isKashida:", v17, v32, v14, a9 == 1, a9 == 2, v40, v42, v27, v58, v35, v36, v23, v25, *(_QWORD *)&a8);
  v44 = v43;
  v46 = v45;
  if (a9 == 1)
  {
    -[PXStoryTextResourceInfo associatedSubtitleString](self, "associatedSubtitleString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTextResourceInfo assetCollectionUUID](self, "assetCollectionUUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v47, v48) == 1;

  }
  else
  {
    v49 = 0;
  }
  -[PXStoryTextResourceInfo _possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:](self, "_possibleTitlePositionsForRect:boudingSize:occlusionSize:kind:extendedTraitCollectionSnapshot:fixedBottomPadding:isTitleVertical:isSubtitleVertical:isKashida:", v17, v14, a9 == 1, v49, a9 == 2, v35, v36, v23, v25, v40, v42, v44, v46, *(_QWORD *)&v59);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTextResourceInfo bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:](self, "bestPositionInFrame:occlusionSize:possiblePositions:displayAsset:currentAssetCropRect:layoutOrientation:desiredInternationalStyle:", v50, v15, objc_msgSend(v14, "layoutOrientation"), a9, v35, v36, v23, v25, v44, v46, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
  v52 = v51;
  v54 = v53;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v52, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v50, "indexOfObject:", v55);

  return v56;
}

- (double)_titleScalingFactorForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6
{
  double width;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  width = a4.width;
  v10 = a5;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "useReferenceWidthBasedTitleLayout");

  v13 = objc_msgSend(v10, "layoutOrientation");
  v14 = v13;
  if (v12)
  {
    v15 = 0.0;
    if ((uint64_t)a3 <= 127)
    {
      if (a3 - 1 > 0x3F)
        goto LABEL_40;
      if (((1 << (a3 - 1)) & 0x8000808BLL) != 0)
        goto LABEL_5;
      if (a3 != 64)
      {
LABEL_40:
        if (a3)
          goto LABEL_43;
      }
LABEL_41:
      v15 = 1.0;
      goto LABEL_43;
    }
    if ((uint64_t)a3 > 511)
    {
      if (a3 != 512 && a3 != 1024)
        goto LABEL_43;
    }
    else if (a3 != 128)
    {
      if (a3 == 256)
      {
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        goto LABEL_6;
      }
      goto LABEL_43;
    }
LABEL_5:
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14 != 2)
    {
      objc_msgSend(v16, "titleReferenceWidthPortrait");
      goto LABEL_26;
    }
LABEL_6:
    objc_msgSend(v16, "titleReferenceWidthLandscape");
LABEL_26:
    v25 = v18;

    v15 = width / v25;
    goto LABEL_43;
  }
  v19 = v13 == 2;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "titleSizeScale");
  v22 = v21;

  if (v22 == 0.0)
    v23 = 1.5;
  else
    v23 = v22;
  if (v22 == 0.0)
    v24 = dbl_1A7C0C530[v19];
  else
    v24 = v22;
  v15 = 0.0;
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 > 255)
    {
      if (a3 != 256 && a3 != 512 && a3 != 1024)
        goto LABEL_43;
    }
    else if (a3 != 32)
    {
      if (a3 == 64)
        goto LABEL_41;
      if (a3 != 128)
        goto LABEL_43;
    }
LABEL_35:
    if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v10, dbl_1A7C0C530[v19]))
    {
      v26 = v23;
    }
    else
    {
      v26 = v24;
    }
    -[PXStoryTextResourceInfo _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:", v10, a6);
    v15 = width * (v26 / v27);
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_41;
      case 1uLL:
        v15 = v24;
        break;
      case 2uLL:
        v15 = v23;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
      case 8uLL:
        goto LABEL_35;
      default:
        if (a3 == 16)
          goto LABEL_35;
        break;
    }
  }
LABEL_43:

  return v15;
}

- (double)_subtitleScalingFactorForKind:(unint64_t)a3 size:(CGSize)a4 extendedTraitCollectionSnapshot:(id)a5 fixedBottomPadding:(double)a6
{
  double width;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  width = a4.width;
  v10 = a5;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "useReferenceWidthBasedTitleLayout");

  v13 = objc_msgSend(v10, "layoutOrientation");
  if (v12)
  {
    v14 = 0.0;
    if ((uint64_t)a3 <= 127)
    {
      if (a3 - 1 > 0x3F)
        goto LABEL_42;
      if (((1 << (a3 - 1)) & 0x8000808BLL) != 0)
        goto LABEL_5;
      if (a3 != 64)
      {
LABEL_42:
        if (a3)
          goto LABEL_45;
      }
LABEL_43:
      v14 = 1.0;
      goto LABEL_45;
    }
    if ((uint64_t)a3 > 511)
    {
      if (a3 != 512 && a3 != 1024)
        goto LABEL_45;
    }
    else if (a3 != 128)
    {
      if (a3 == 256)
      {
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        goto LABEL_6;
      }
      goto LABEL_45;
    }
LABEL_5:
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v13 != 2)
    {
      objc_msgSend(v15, "titleReferenceWidthPortrait");
      goto LABEL_28;
    }
LABEL_6:
    objc_msgSend(v15, "titleReferenceWidthLandscape");
LABEL_28:
    v24 = v17;

    v14 = width / v24;
    goto LABEL_45;
  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subtitleSizeScale");
  v20 = v19;

  v21 = 1.96;
  if (v13 != 2)
    v21 = 2.0;
  if (v20 == 0.0)
    v22 = dbl_1A7C0C530[v13 == 2];
  else
    v22 = v20;
  if (v20 == 0.0)
    v23 = v21;
  else
    v23 = v20;
  v14 = 0.0;
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 > 255)
    {
      if (a3 != 256 && a3 != 512 && a3 != 1024)
        goto LABEL_45;
    }
    else if (a3 != 32)
    {
      if (a3 == 64)
        goto LABEL_43;
      if (a3 != 128)
        goto LABEL_45;
    }
LABEL_37:
    if (-[PXStoryTextResourceInfo _isUserInterfaceIdiomPadOrMacOrTV:](self, "_isUserInterfaceIdiomPadOrMacOrTV:", v10, dbl_1A7C0C530[v13 == 2], v21))
    {
      v25 = v23;
    }
    else
    {
      v25 = v22;
    }
    -[PXStoryTextResourceInfo _fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_fullScreenAvailableSizeForExtendedTraitCollectionSnapshot:fixedBottomPadding:", v10, a6);
    v14 = width * (v25 / v26);
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_43;
      case 1uLL:
        v14 = v22;
        break;
      case 2uLL:
        v14 = v23;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
      case 8uLL:
        goto LABEL_37;
      default:
        if (a3 == 16)
          goto LABEL_37;
        break;
    }
  }
LABEL_45:

  return v14;
}

- (id)attributedStringBoundingSizeForTitle:(id)a3 stylePairing:(int64_t)a4 availableSize:(CGSize)a5 containerRect:(CGRect)a6 kind:(unint64_t)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9
{
  double height;
  double width;
  double y;
  CGFloat x;
  double v16;
  double v17;
  double v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  float v38;
  double v39;
  float v40;
  _BOOL8 v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  _BOOL4 v54;
  _BOOL4 v55;
  double v56;
  uint64_t v57;
  id v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  NSAttributedString *v77;
  NSAttributedString *lock_attributedString;
  id v79;
  void *v80;
  void *v81;
  double v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  _QWORD aBlock[4];
  id v90;
  PXStoryTextResourceInfo *v91;
  uint64_t *v92;
  int64_t v93;
  unint64_t v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a5.height;
  v17 = a5.width;
  v20 = a5.height;
  v21 = a3;
  v22 = a8;
  v83 = x;
  if ((objc_msgSend((id)objc_opt_class(), "titleShouldBeUppercasedForStylePairing:kind:", a4, a7) & 1) != 0)
  {
    objc_msgSend(v21, "localizedUppercaseString");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v21;
  }
  v24 = v23;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v23);
  -[PXStoryTextResourceInfo _titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_titleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", a7, v22, v17, v20, a9);
  v27 = v26;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __161__PXStoryTextResourceInfo_attributedStringBoundingSizeForTitle_stylePairing_availableSize_containerRect_kind_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke;
  aBlock[3] = &unk_1E5126BE8;
  v28 = v24;
  v90 = v28;
  v91 = self;
  v93 = a4;
  v94 = a7;
  v95 = v17;
  v96 = v20;
  v92 = &v97;
  v29 = _Block_copy(aBlock);
  v30 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "titleMinimumScale");
  v33 = v32;

  objc_msgSend(v30, "setMinimumScaleFactor:", v33);
  objc_msgSend(v30, "setWrapsForTruncationMode:", 1);
  objc_msgSend(v30, "setWantsBaselineOffset:", 1);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMaximumNumberOfLines:", objc_msgSend(v34, "titleMaximumNumberOfLines"));
  v85 = v22;

  v88 = v25;
  (*((void (**)(void *, id *, id, _QWORD, _QWORD, double, double, double))v29 + 2))(v29, &v88, v30, 0, 0, v27, v17, v20);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v88;

  objc_msgSend(v35, "actualScaleFactor");
  *(float *)&v37 = v37 * 10.0;
  v38 = floorf(*(float *)&v37) / 10.0;
  v39 = v27 * v38;
  v84 = v28;
  if (v38 == 1.0)
  {
    v41 = 0;
  }
  else
  {
    v40 = v33 * 10.0;
    v41 = (float)(floorf(v38 * 10.0) / 10.0) == (float)(floorf(v40) / 10.0);
    v87 = v36;
    (*((void (**)(void *, id *, void *, _BOOL8, _QWORD, double, double, double))v29 + 2))(v29, &v87, v35, v41, 0, v39, v17, v20);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v87;

    v35 = (void *)v42;
    v36 = v43;
  }
  v44 = 0;
  v45 = 0;
  if (a7 != 64 && v98[3] <= 2)
  {
    -[PXStoryTextResourceInfo assetCollectionUUID](self, "assetCollectionUUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      -[PXStoryTextResourceInfo assetCollectionUUID](self, "assetCollectionUUID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v21, v47);

      if (v44 == 2)
      {
        -[PXStoryTextResourceInfo _paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:](self, "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", a7, v85, v83, y, width, height);
        v49 = fmin(v17 * 1.25, width - (v48 + v48)) / v17;
        v50 = v17 * v49;
        v20 = v16 * v49;
        if (v98[3] == 1)
        {
          objc_msgSend(v36, "string");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = PXStoryTitleInternationalStyleKashidaMaximumWidthForTitle(v51, v50, v20);

          objc_msgSend(v35, "totalBounds");
          v54 = v52 > 0.0;
          v55 = ceil(v53) < v52;
          v56 = fmin(v52, v17);
          if (v54 && v55)
            v17 = v56;
          else
            v17 = v50;
          if (v54 && v55)
            v44 = 2;
          else
            v44 = 0;
        }
        else
        {
          v44 = 2;
          v17 = v17 * v49;
        }
      }
      v86 = v36;
      (*((void (**)(void *, id *, void *, _BOOL8, uint64_t, double, double, double))v29 + 2))(v29, &v86, v35, v41, v44, v39, v17, v20);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = v86;

      v45 = 1;
      v35 = (void *)v57;
      v36 = v58;
    }
    else
    {
      v45 = 0;
      v44 = 0;
    }
  }
  objc_msgSend(v35, "totalBounds", *(_QWORD *)&v83);
  v60 = ceil(v59);
  v62 = ceil(v61);
  v63 = v60 + 40.0;
  v64 = v62 + 40.0;
  if (v44 == 1)
    v65 = v45;
  else
    v65 = 0;
  if ((v65 & 1) != 0)
  {
    v66 = v84;
    if (v98[3] == 1
      && v60 < v16 * 0.85
      && (-[PXStoryTextResourceInfo associatedSubtitleString](self, "associatedSubtitleString"),
          v67 = (void *)objc_claimAutoreleasedReturnValue(),
          -[PXStoryTextResourceInfo assetCollectionUUID](self, "assetCollectionUUID"),
          v68 = (void *)objc_claimAutoreleasedReturnValue(),
          v69 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v67, v68),
          v68,
          v67,
          v69 == 1))
    {
      if (objc_msgSend(v36, "length"))
      {
        objc_msgSend(v36, "attributesAtIndex:effectiveRange:", 0, 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_msgSend(v70, "mutableCopy");

      }
      else
      {
        v71 = 0;
      }
      objc_msgSend(v71, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DC1250]);
      objc_msgSend(v36, "setAttributes:range:", v71, 0, objc_msgSend(v36, "length"));
      objc_msgSend(v35, "setMaximumNumberOfLines:", 1);

      v72 = v64;
    }
    else
    {
      v72 = v63;
      v63 = v64;
    }
  }
  else
  {
    v72 = v60 + 40.0;
    v63 = v62 + 40.0;
    v66 = v84;
  }
  objc_msgSend(v21, "uppercaseString");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTextResourceInfo string](self, "string");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "uppercaseString");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v73, "isEqualToString:", v75);

  if (v76)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_drawingContext, v35);
    v77 = (NSAttributedString *)objc_msgSend(v36, "copy");
    lock_attributedString = self->_lock_attributedString;
    self->_lock_attributedString = v77;

    self->_lock_boundingSize.width = v72;
    self->_lock_boundingSize.height = v63;
    os_unfair_lock_unlock(&self->_lock);
  }
  v79 = objc_alloc((Class)off_1E50B5CE0);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v72, v63);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend(v79, "initWithFirst:second:", v36, v80);

  _Block_object_dispose(&v97, 8);
  return v81;
}

- (id)attributedStringBoundingSizeForSubtitle:(id)a3 size:(CGSize)a4 containerRect:(CGRect)a5 kind:(unint64_t)a6 relativeTo:(id)a7 extendedTraitCollectionSnapshot:(id)a8 fixedBottomPadding:(double)a9 desiredInternationalStyle:(int64_t)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v19;
  double v20;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void (**v28)(void *, id *, id, _QWORD, double, double);
  void *v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int64_t v36;
  void *v37;
  id v38;
  double v39;
  __n128 v40;
  id *v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  uint64_t v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  NSAttributedString *v60;
  NSAttributedString *lock_attributedString;
  id v62;
  void *v63;
  void *v64;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  _QWORD aBlock[5];
  id v74;
  id v75;
  id v76;
  double v77;
  double v78;
  unint64_t v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v19 = a4.height;
  v20 = a4.width;
  v22 = a3;
  v23 = a7;
  v24 = a8;
  objc_msgSend(v22, "localizedUppercaseString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __179__PXStoryTextResourceInfo_attributedStringBoundingSizeForSubtitle_size_containerRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding_desiredInternationalStyle___block_invoke;
  aBlock[3] = &unk_1E5126C10;
  v77 = v20;
  v78 = v19;
  aBlock[4] = self;
  v79 = a6;
  v26 = v24;
  v74 = v26;
  v80 = x;
  v81 = y;
  v82 = width;
  v83 = height;
  v66 = v23;
  v75 = v66;
  v27 = v25;
  v76 = v27;
  v28 = (void (**)(void *, id *, id, _QWORD, double, double))_Block_copy(aBlock);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v27);
  v68 = v26;
  -[PXStoryTextResourceInfo _subtitleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:](self, "_subtitleScalingFactorForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:", a6, v26, v20, v19, a9);
  v31 = v30;
  v32 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "subtitleMinimumScale");
  objc_msgSend(v32, "setMinimumScaleFactor:");

  objc_msgSend(v32, "setWrapsForTruncationMode:", 1);
  objc_msgSend(v32, "setWantsBaselineOffset:", 1);
  objc_msgSend(v32, "setMaximumNumberOfLines:", 1);
  -[PXStoryTextResourceInfo assetCollectionUUID](self, "assetCollectionUUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID(v22, v34);

  if (v35 == a10)
    v36 = a10;
  else
    v36 = 0;
  if (v36 == 2)
  {
    v70 = v29;
    v28[2](v28, &v70, v32, 0, v31, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v70;

    objc_msgSend(v37, "totalBounds", v66);
    v40.n128_f64[0] = ceil(v39);
    v69 = v38;
    v41 = &v69;
    v42.n128_f64[0] = v31;
    ((void (*)(void (**)(void *, id *, id, _QWORD, double, double), id *, void *, uint64_t, __n128, __n128))v28[2])(v28, &v69, v37, 2, v42, v40);
  }
  else
  {
    v72 = v29;
    v28[2](v28, &v72, v32, v36, v31, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v72;

    objc_msgSend(v37, "actualScaleFactor", v66);
    v44.n128_f32[0] = v44.n128_f64[0] * 10.0;
    v44.n128_f32[0] = floorf(v44.n128_f32[0]) / 10.0;
    if (v44.n128_f32[0] == 1.0)
      goto LABEL_9;
    v44.n128_f64[0] = v31 * v44.n128_f32[0];
    v71 = v38;
    v41 = &v71;
    v43.n128_u64[0] = 0;
    ((void (*)(void (**)(void *, id *, id, _QWORD, double, double), id *, void *, int64_t, __n128, __n128))v28[2])(v28, &v71, v37, v36, v44, v43);
  }
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = *v41;

  v37 = (void *)v45;
  v38 = v46;
LABEL_9:
  objc_msgSend(v37, "totalBounds");
  v48 = ceil(v47);
  v50 = ceil(v49);
  v51 = v48 + 40.0;
  v52 = v50 + 40.0;
  if (v36 == 1)
  {
    if (objc_msgSend(v38, "length"))
    {
      objc_msgSend(v38, "attributesAtIndex:effectiveRange:", 0, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v53, "mutableCopy");

    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v54, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DC1250]);
    objc_msgSend(v38, "setAttributes:range:", v54, 0, objc_msgSend(v38, "length"));

    v55 = v51;
  }
  else
  {
    v55 = v50 + 40.0;
    v52 = v48 + 40.0;
  }
  objc_msgSend(v22, "uppercaseString");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTextResourceInfo string](self, "string");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "uppercaseString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v56, "isEqualToString:", v58);

  if (v59)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_drawingContext, v37);
    v60 = (NSAttributedString *)objc_msgSend(v38, "copy");
    lock_attributedString = self->_lock_attributedString;
    self->_lock_attributedString = v60;

    self->_lock_boundingSize.width = v52;
    self->_lock_boundingSize.height = v55;
    os_unfair_lock_unlock(&self->_lock);
  }
  v62 = objc_alloc((Class)off_1E50B5CE0);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v52, v55);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v62, "initWithFirst:second:", v38, v63);

  return v64;
}

- (CGPoint)_subtitlePositionInFrame:(CGRect)a3 titleCategory:(id)a4 displayAsset:(id)a5 currentAssetCropRect:(CGRect)a6 kind:(unint64_t)a7 relativeTo:(id)a8 extendedTraitCollectionSnapshot:(id)a9 fixedBottomPadding:(double)a10 isTitleVertical:(BOOL)a11 isSubtitleVertical:(BOOL)a12
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat rect;
  CGPoint result;
  CGRect v64;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a8;
  v20 = a9;
  v21 = objc_msgSend(v20, "layoutOrientation");
  if (v19)
  {
    -[PXStoryTextResourceInfo _availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:](self, "_availableSizeForRect:extendedTraitCollectionSnapshot:kind:fixedBottomPadding:", v20, a7, x, y, width, height, a10);
    -[PXStoryTextResourceInfo _subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:](self, "_subtitleLineSpacingForKind:size:extendedTraitCollectionSnapshot:fixedBottomPadding:isVerticalText:", a7, v20, a12);
    v23 = v22;
    objc_msgSend(v19, "origin");
    v25 = v24;
    v27 = v26;
    objc_msgSend(v19, "boundingSize");
    v29 = v28;
    v31 = v30;
    objc_msgSend(v19, "drawingContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "baselineOffset");
    v34 = v33;

    -[PXStoryTextResourceInfo drawingContext](self, "drawingContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "baselineOffset");
    v37 = v36;

    if (a12)
    {
      rect = v29;
      v38 = ceil(width * 0.0032);
      if (objc_msgSend(v19, "textAlignment"))
      {
        v39 = objc_msgSend(v19, "textAlignment");
        objc_msgSend(v19, "boundingSize");
        v41 = v40;
        -[PXStoryTextResourceInfo boundingSize](self, "boundingSize");
        v43 = v27 + v41 * 0.5 + v42 * -0.5;
        v44 = v27 + v41 - v42 - v38;
        if (v39 == 2)
          v45 = v44;
        else
          v45 = v43;
      }
      else
      {
        v45 = v38 + v27;
      }
      if ((unint64_t)(objc_msgSend(v19, "effectivePositionIndex") - 6) > 2)
      {
        v25 = v23 + v25 + v34 - v37;
      }
      else
      {
        v64.origin.x = v25;
        v64.origin.y = v27;
        v64.size.width = rect;
        v64.size.height = v31;
        v55 = v23 + v25 + v34 - v37 - CGRectGetMaxX(v64);
        -[PXStoryTextResourceInfo boundingSize](self, "boundingSize");
        v25 = v25 - v56 - v55;
      }
    }
    else
    {
      v45 = v23 + v27 + v34 - v37;
      v51 = objc_msgSend(v19, "effectivePositionIndex");
      if (v51 > 8)
      {
        v25 = 0.0;
      }
      else if (((1 << v51) & 7) != 0)
      {
        objc_msgSend(v19, "boundingSize");
        v58 = v25 + v57 * 0.5;
        -[PXStoryTextResourceInfo boundingSize](self, "boundingSize");
        v25 = v58 + v59 * -0.5;
      }
      else if (((1 << v51) & 0x38) == 0)
      {
        objc_msgSend(v19, "boundingSize");
        v53 = v25 + v52;
        -[PXStoryTextResourceInfo boundingSize](self, "boundingSize");
        v25 = v53 - v54;
      }
    }
  }
  else
  {
    v46 = v21;
    PXRectGetCenter();
    -[PXStoryTextResourceInfo boundingSize](self, "boundingSize");
    PXRectWithCenterAndSize();
    v25 = v47;
    if (v46 == 2)
      v48 = 20.0;
    else
      v48 = 30.0;
    -[PXStoryTextResourceInfo drawingContext](self, "drawingContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "baselineOffset");
    v45 = y + height - v50 + -20.0 - v48;

  }
  v60 = v25;
  v61 = v45;
  result.y = v61;
  result.x = v60;
  return result;
}

- (CGPoint)bestPositionInFrame:(CGRect)a3 occlusionSize:(CGSize)a4 possiblePositions:(id)a5 displayAsset:(id)a6 currentAssetCropRect:(CGRect)a7 layoutOrientation:(int64_t)a8 desiredInternationalStyle:(int64_t)a9
{
  id v14;
  uint64_t v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  int v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
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
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  double x;
  double y;
  void *v78;
  void (**v79)(void *, void *);
  id v80;
  double v81;
  NSPoint v82;
  double v83;
  double v84;
  uint64_t v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  PXStoryTextResourceInfo *v91;
  double v92;
  double width;
  double height;
  id obj;
  id v96;
  CGFloat aRect;
  CGFloat v99;
  CGFloat v100;
  double v101;
  double v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD aBlock[4];
  id v108;
  PXStoryTextResourceInfo *v109;
  uint64_t *v110;
  uint64_t *v111;
  SEL v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  _BYTE v125[128];
  uint64_t v126;
  NSPoint v127;
  CGPoint result;
  NSRect v129;
  NSRect v130;
  NSRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  width = a3.size.width;
  height = a3.size.height;
  v126 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v96 = a6;
  v119 = 0;
  v120 = &v119;
  v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__104892;
  v123 = __Block_byref_object_dispose__104893;
  v124 = v14;
  v113 = 0;
  v114 = &v113;
  v115 = 0x3032000000;
  v116 = __Block_byref_object_copy__104892;
  v117 = __Block_byref_object_dispose__104893;
  v118 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke;
  aBlock[3] = &unk_1E5126CA0;
  v110 = &v119;
  v80 = v124;
  v108 = v80;
  v109 = self;
  v91 = self;
  v111 = &v113;
  v112 = a2;
  v79 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (a9)
  {
    if (a9 == 2)
    {
      v79[2](v79, &unk_1E53E9660);
      v15 = 0;
    }
    else if (a9 == 1)
    {
      v15 = 3;
    }
    else
    {
      v15 = 0;
    }
  }
  else if (+[PXStoryTextResourceInfo isLemonadeUIEnabled](PXStoryTextResourceInfo, "isLemonadeUIEnabled"))
  {
    v79[2](v79, &unk_1E53E96C0);
    v15 = 2;
  }
  else if (a8 == 2)
  {
    v15 = 5;
  }
  else
  {
    v15 = 2;
  }
  objc_msgSend(v80, "objectAtIndexedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pointValue");
  v82.x = v17;
  v82.y = v18;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "titleFarthestDistanceThreshold");
  v81 = v20;
  v78 = v19;
  v21 = objc_msgSend(v19, "enableTitlePositioningLogs");
  if (v21)
  {
    -[PXStoryTextResourceInfo string](self, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[Memories Titles] title:%@, possible positions: %@\n"), v22, v80);

  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = (id)v120[5];
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
  if (v23)
  {
    v24 = *MEMORY[0x1E0C9D538];
    v101 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v89 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v90 = *MEMORY[0x1E0C9D648];
    v87 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v88 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v85 = 0x7FFFFFFFFFFFFFFFLL;
    v83 = -1.79769313e308;
    v86 = *MEMORY[0x1E0C9D820];
    v84 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v25 = *(_QWORD *)v104;
    v92 = *MEMORY[0x1E0C9D538];
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v104 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        objc_msgSend(v27, "pointValue");
        v30 = v29;
        v31 = v28;
        v33 = v29 == v24;
        v32 = v101;
        v33 = v33 && v28 == v101;
        if (!v33)
        {
          v102 = 0.0;
          PXRectNormalize();
          v35 = v34;
          v99 = v37;
          v100 = v36;
          aRect = v38;
          objc_msgSend(v96, "suggestedCropForTargetSize:withOcclusionRegion:andOutputCropScore:", &v102, width, height, v36, v37, v38, v34);
          v40 = v39;
          v42 = v41;
          v44 = v43;
          v46 = v45;
          if (v21)
          {
            -[PXStoryTextResourceInfo string](v91, "string");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v102;
            v127.x = v30;
            v127.y = v31;
            NSStringFromPoint(v127);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v129.origin.x = v30;
            v129.origin.y = v31;
            v129.size.width = a4.width;
            v129.size.height = a4.height;
            NSStringFromRect(v129);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v130.origin.y = v99;
            v130.origin.x = v100;
            v130.size.width = aRect;
            v130.size.height = v35;
            NSStringFromRect(v130);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v131.origin.x = v40;
            v131.origin.y = v42;
            v131.size.width = v44;
            v131.size.height = v46;
            NSStringFromRect(v131);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("[Memories Titles] title:%@, score: %f, position: %@, occlusionRect:%@, normalizedOcclusionRect:%@, cropRect:%@ \n"), v47, *(_QWORD *)&v48, v49, v50, v51, v52);

          }
          v32 = v102;
          if (v102 < 0.5)
            goto LABEL_45;
          v132.origin.x = v40;
          v132.origin.y = v42;
          v132.size.width = v44;
          v132.size.height = v46;
          v133 = CGRectIntersection(v132, a7);
          v134.origin.y = v89;
          v134.origin.x = v90;
          v134.size.height = v87;
          v134.size.width = v88;
          if (CGRectEqualToRect(v133, v134))
            goto LABEL_45;
          objc_msgSend((id)v114[5], "objectForKeyedSubscript:", v27);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "integerValue");

          objc_msgSend(v96, "faceAreaRect");
          v56 = v55;
          v58 = v57;
          v60 = v59;
          v62 = v61;
          objc_msgSend(v96, "acceptableCropRect");
          if (v60 == v86 && v62 == v84)
          {
            v67 = 1.0 - (v64 + v66) + v66 * 0.5;
            v32 = v63 + v65 * 0.5;
            if (v65 == v86)
            {
              v69 = v99;
              v68 = v100;
              v70 = aRect;
              if (v66 == v84)
              {
                v71 = 9.22337204e18;
                goto LABEL_35;
              }
LABEL_34:
              v32 = hypot(v68 + v70 * 0.5 - v32, v69 + v35 * 0.5 - v67);
              v71 = v32;
LABEL_35:
              if (v54 >= v85)
              {
                if (v54 > v85)
                {
                  v72 = 0;
                  if (!v21)
                    goto LABEL_43;
                  goto LABEL_42;
                }
                v67 = v83;
                v32 = v81 + v83;
                v72 = v71 > v81 + v83;
                if (v21)
                  goto LABEL_42;
              }
              else
              {
                v72 = 1;
                if (!v21)
                  goto LABEL_43;
LABEL_42:
                -[PXStoryTextResourceInfo string](v91, "string", v32, v67, v68);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("[Memories Titles] title:%@, preferenceOrder: %ti, distance: %f, isPositionBetter: %i\n"), v73, v54, *(_QWORD *)&v71, v72);

              }
LABEL_43:
              if (v72)
              {
                v85 = v54;
                v82.y = v31;
                v83 = v71;
                v82.x = v30;
              }
LABEL_45:
              v24 = v92;
              continue;
            }
          }
          else
          {
            v67 = 1.0 - (v58 + v62) + v62 * 0.5;
            v32 = v56 + v60 * 0.5;
          }
          v69 = v99;
          v68 = v100;
          v70 = aRect;
          goto LABEL_34;
        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v125, 16, v32);
    }
    while (v23);
  }

  if (v21)
  {
    -[PXStoryTextResourceInfo string](v91, "string");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromPoint(v82);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[Memories Titles] title:%@, selected position: %@\n"), v74, v75);

  }
  _Block_object_dispose(&v113, 8);

  _Block_object_dispose(&v119, 8);
  y = v82.y;
  x = v82.x;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)_isUserInterfaceIdiomPadOrMacOrTV:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "userInterfaceIdiom");
  return v3 == 4 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)setEffectivePositionIndex:(int64_t)a3
{
  self->_lock_effectivePositionIndex = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)layoutScheme
{
  return self->_layoutScheme;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)associatedSubtitleString
{
  return self->_associatedSubtitleString;
}

- (NSString)assetCollectionUUID
{
  return self->_assetCollectionUUID;
}

- (BOOL)hasForcedPositioning
{
  return self->_hasForcedPositioning;
}

- (void)setHasForcedPositioning:(BOOL)a3
{
  self->_hasForcedPositioning = a3;
}

- (int64_t)forcedPositionIndex
{
  return self->_forcedPositionIndex;
}

- (void)setForcedPositionIndex:(int64_t)a3
{
  self->_forcedPositionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionUUID, 0);
  objc_storeStrong((id *)&self->_associatedSubtitleString, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_lock_drawingContext, 0);
  objc_storeStrong((id *)&self->_lock_attributedString, 0);
}

void __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;

  v16 = a2;
  PXFlatMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_3;
  v25 = &unk_1E5126C78;
  v26 = *(id *)(a1 + 32);
  PXMap();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if ((unint64_t)objc_msgSend(v16, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_4;
    v17[3] = &unk_1E5135938;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 40);
    v18 = v9;
    v19 = v11;
    v20 = v8;
    v21 = v10;
    v12 = v8;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);
    v13 = objc_msgSend(v12, "copy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

uint64_t __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "integerValue"));
}

void __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PXStoryTextResourceInfo.m"), 1730, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("positionValue != nil"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

id __157__PXStoryTextResourceInfo_bestPositionInFrame_occlusionSize_possiblePositions_displayAsset_currentAssetCropRect_layoutOrientation_desiredInternationalStyle___block_invoke_2(int a1, id a2)
{
  return a2;
}

id __179__PXStoryTextResourceInfo_attributedStringBoundingSizeForSubtitle_size_containerRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding_desiredInternationalStyle___block_invoke(uint64_t a1, id *a2, void *a3, uint64_t a4, double a5, double a6)
{
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;

  v11 = a3;
  v13 = *(double *)(a1 + 64);
  v12 = *(double *)(a1 + 72);
  if (a4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_paddingLeftOrRightAlignmentLeadingForKind:extendedTraitCollectionSnapshot:rect:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
    v15 = fmin(v13, (*(double *)(a1 + 104) + v14 * -2.0) * 0.5);
    objc_msgSend(*(id *)(a1 + 48), "boundingSize");
    v13 = fmax(fmin(v15, (v16 + -40.0) * 0.6), a6);
  }
  v17 = *a2;
  +[PXStoryTextResourceInfo subtitleAttributesForSize:string:scale:kind:extendedTraitCollectionSnapshot:internationalStyle:](PXStoryTextResourceInfo, "subtitleAttributesForSize:string:scale:kind:extendedTraitCollectionSnapshot:internationalStyle:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), a4, v13, v12, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAttributes:range:", v18, 0, objc_msgSend(*(id *)(a1 + 56), "length"));

  objc_msgSend(*a2, "boundingRectWithSize:options:context:", objc_msgSend(*(id *)(a1 + 32), "drawingOptions"), v11, v13, v12);
  return v11;
}

id __161__PXStoryTextResourceInfo_attributedStringBoundingSizeForTitle_stylePairing_availableSize_containerRect_kind_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke(uint64_t a1, id *a2, void *a3, unsigned int a4, uint64_t a5, double a6, double a7, double a8)
{
  uint64_t v13;
  id *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  PXCTFramesetter *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id obj;
  id obja;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  +[PXStoryTextResourceInfo _rangesAndStylesForTitle:](PXStoryTextResourceInfo, "_rangesAndStylesForTitle:", *(_QWORD *)(a1 + 32));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  v14 = a2;
  if (v13)
  {
    v15 = v13;
    v16 = 0;
    v17 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v19, "second");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "integerValue");

        if (!v21)
        {
          objc_msgSend((id)objc_opt_class(), "_titlePrimaryAttributesForStylePairing:scale:kind:layoutScheme:allowHyphenation:internationalStyle:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 40), "layoutScheme"), a4, a5, a6);
          v22 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v22;
        }
        a2 = v14;
        v23 = *v14;
        objc_msgSend(v19, "first");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "rangeValue");
        objc_msgSend(v23, "setAttributes:range:", v16, v25, v26);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  if (objc_msgSend(*a2, "length"))
  {
    v27 = *MEMORY[0x1E0DC1178];
    objc_msgSend(v16, "valueForKey:", *MEMORY[0x1E0DC1178]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v28, "mutableCopy");

    objc_msgSend(obja, "setLineBreakMode:", 0);
    v29 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v29, "setValue:forKey:", obja, v27);
    v30 = objc_alloc(MEMORY[0x1E0CB3498]);
    v31 = *(_QWORD *)(a1 + 32);
    v32 = (void *)objc_msgSend(v29, "copy");
    v33 = (void *)objc_msgSend(v30, "initWithString:attributes:", v31, v32);

    v34 = -[PXCTFramesetter initWithAttributedString:context:]([PXCTFramesetter alloc], "initWithAttributedString:context:", v33, 0);
    -[PXCTFramesetter frameWithRect:maximumLineCount:allowTruncation:](v34, "frameWithRect:maximumLineCount:allowTruncation:", 5, 0, 0.0, 0.0, *(double *)(a1 + 72), *(double *)(a1 + 80));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lines");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v36, "count");
    objc_msgSend(*v14, "attributesAtIndex:effectiveRange:", 0, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    a2 = v14;
    +[PXStoryTextResourceInfo _increaseMaximumLineHeightToAvoidOverlapForLines:attributes:attributedString:](PXStoryTextResourceInfo, "_increaseMaximumLineHeightToAvoidOverlapForLines:attributes:attributedString:", v36, v37, v14);

  }
  objc_msgSend(*a2, "boundingRectWithSize:options:context:", objc_msgSend(*(id *)(a1 + 40), "drawingOptions"), v39, a7, a8);

  return v39;
}

BOOL __170__PXStoryTextResourceInfo_attributedStringFrameInRect_titleCategory_displayAsset_currentAssetCropRect_kind_relativeTo_extendedTraitCollectionSnapshot_fixedBottomPadding___block_invoke(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "effectivePositionIndex") < 3;
}

+ (BOOL)simulateLemonadeUIEnabled
{
  return _simulateLemonadeUIEnabled;
}

+ (void)setSimulateLemonadeUIEnabled:(BOOL)a3
{
  _simulateLemonadeUIEnabled = a3;
}

+ (BOOL)isLemonadeUIEnabled
{
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    return 1;
  else
    return objc_msgSend(a1, "simulateLemonadeUIEnabled");
}

+ (NSCache)titleCachedCharacterSetByStyleAndKind
{
  if (titleCachedCharacterSetByStyleAndKind_onceToken != -1)
    dispatch_once(&titleCachedCharacterSetByStyleAndKind_onceToken, &__block_literal_global_105014);
  return (NSCache *)(id)titleCachedCharacterSetByStyleAndKind_instance;
}

+ (NSCache)subtitleCachedCharacterSetByKind
{
  if (subtitleCachedCharacterSetByKind_onceToken != -1)
    dispatch_once(&subtitleCachedCharacterSetByKind_onceToken, &__block_literal_global_2_105012);
  return (NSCache *)(id)subtitleCachedCharacterSetByKind_instance;
}

+ (id)_allowedTitleCharacterSetWithStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_titleFontCacheKeyForStylePairing:kind:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "titleCachedCharacterSetByStyleAndKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(a1, "_titleFontForStylePairing:scale:kind:internationalStyle:", a3, a4, 0, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1368]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = CTFontCopyCharacterSet((CTFontRef)v10);
      if (!v9)
      {
        PLStoryGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 67109376;
          v16[1] = a3;
          v17 = 1024;
          v18 = a4;
          _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "font missing NSCharacterSet mapping for stylePairing: %d, kind: %d", (uint8_t *)v16, 0xEu);
        }

        objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(a1, "titleCachedCharacterSetByStyleAndKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v9, v7);

  }
  return v9;
}

+ (int64_t)stylePairingFromTitleCategory:(id)a3 string:(id)a4 kind:(unint64_t)a5 layoutScheme:(int64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int64_t v15;
  NSObject *v16;
  int v18;
  int64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if ((unint64_t)a6 > 1)
  {
    v11 = 0;
  }
  else if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D75A40]) & 1) != 0)
  {
    v11 = 1;
  }
  else if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D75A18]) & 1) != 0)
  {
    v11 = 2;
  }
  else if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D75A10]) & 1) != 0)
  {
    v11 = 3;
  }
  else if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D75A38]) & 1) != 0)
  {
    v11 = 4;
  }
  else if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D75A30]) & 1) != 0)
  {
    v11 = 5;
  }
  else if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D75A48]) & 1) != 0)
  {
    v11 = 6;
  }
  else
  {
    v11 = +[PXStoryTextResourceInfo isLemonadeUIEnabled](PXStoryTextResourceInfo, "isLemonadeUIEnabled") ^ 1;
  }
  objc_msgSend((id)objc_opt_class(), "_allowedTitleCharacterSetWithStylePairing:kind:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isSupersetOfSet:", v13);

  if (v14)
    v15 = v11;
  else
    v15 = 7;
  PLStoryGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134218754;
    v19 = v15;
    v20 = 2112;
    v21 = v9;
    v22 = 2048;
    v23 = a6;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "stylePairing: %ti for titleCategory: %@, layoutScheme: %ti, string: %@", (uint8_t *)&v18, 0x2Au);
  }

  return v15;
}

+ (id)_titleFontCacheKeyForStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4 == 64)
  {
    v6 = &unk_1E53ED278;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 + 2, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)titleFontDescriptorForStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint64_t v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint64_t v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[3];
  uint64_t v46;
  void *v47;
  _QWORD v48[3];
  _QWORD v49[3];
  uint64_t v50;
  void *v51;
  _QWORD v52[3];
  _QWORD v53[3];
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  if (a4 != 64)
  {
    switch(a3)
    {
      case 0:
        v26 = *MEMORY[0x1E0DC13C0];
        v24[0] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = *MEMORY[0x1E0DC1408];
        v25[0] = v4;
        v25[1] = *MEMORY[0x1E0DC1398];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v5;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v27;
        v14 = &v26;
        goto LABEL_13;
      case 1:
        v50 = *MEMORY[0x1E0DC13C0];
        v48[0] = *MEMORY[0x1E0DC1478];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8510]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v4;
        v48[1] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = *MEMORY[0x1E0DC1408];
        v15 = *MEMORY[0x1E0DC1398];
        v49[1] = v5;
        v49[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v7;
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v51;
        v10 = &v50;
        goto LABEL_3;
      case 2:
        v46 = *MEMORY[0x1E0DC13C0];
        v44[0] = *MEMORY[0x1E0DC1478];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8520]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v4;
        v44[1] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v44[2] = *MEMORY[0x1E0DC1408];
        v16 = *MEMORY[0x1E0DC1398];
        v45[1] = v5;
        v45[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v7;
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v47;
        v10 = &v46;
        goto LABEL_3;
      case 3:
        v42 = *MEMORY[0x1E0DC13C0];
        v40[0] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1428]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = *MEMORY[0x1E0DC1408];
        v41[0] = v4;
        v41[1] = *MEMORY[0x1E0DC13B0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v5;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v43;
        v14 = &v42;
        goto LABEL_13;
      case 4:
        v38 = *MEMORY[0x1E0DC13C0];
        v36[0] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1418]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = *MEMORY[0x1E0DC1408];
        v37[0] = v4;
        v37[1] = *MEMORY[0x1E0DC13A8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v5;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v39;
        v14 = &v38;
        goto LABEL_13;
      case 5:
        v34 = *MEMORY[0x1E0DC13C0];
        v32[0] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1428]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = *MEMORY[0x1E0DC1408];
        v33[0] = v4;
        v33[1] = *MEMORY[0x1E0DC13A0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v5;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v35;
        v14 = &v34;
        goto LABEL_13;
      case 6:
        v30 = *MEMORY[0x1E0DC13C0];
        v28[0] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1418]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v28[1] = *MEMORY[0x1E0DC1408];
        v29[0] = v4;
        v29[1] = *MEMORY[0x1E0DC13B0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v5;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = &v31;
        v14 = &v30;
LABEL_13:
        objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 7:
        v22 = *MEMORY[0x1E0DC13C0];
        v20[0] = *MEMORY[0x1E0DC1478];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA84F8]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v4;
        v20[1] = *MEMORY[0x1E0DC1458];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2] = *MEMORY[0x1E0DC1408];
        v19 = *MEMORY[0x1E0DC1398];
        v21[1] = v5;
        v21[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v7;
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v23;
        v10 = &v22;
        goto LABEL_3;
      default:
        v11 = 0;
        goto LABEL_15;
    }
  }
  v54 = *MEMORY[0x1E0DC13C0];
  v52[0] = *MEMORY[0x1E0DC1478];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3, *MEMORY[0x1E0CA84F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v4;
  v52[1] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = *MEMORY[0x1E0DC1408];
  v6 = *MEMORY[0x1E0DC1398];
  v53[1] = v5;
  v53[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = (void **)v55;
  v10 = &v54;
LABEL_3:
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_15:
  objc_msgSend(MEMORY[0x1E0DC1358], "fontDescriptorWithFontAttributes:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_titleFontForStylePairing:(int64_t)a3 scale:(double)a4 kind:(unint64_t)a5 internationalStyle:(int64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double *v14;

  v7 = 20.0;
  if (a5 != 64)
  {
    v6 = 28.0;
    v9 = 45.0;
    switch(a3)
    {
      case 0:
        goto LABEL_16;
      case 1:
        goto LABEL_13;
      case 2:
        v9 = 29.0;
        goto LABEL_13;
      case 3:
        v9 = 28.0;
        goto LABEL_13;
      case 4:
        v9 = 37.0;
        goto LABEL_13;
      case 5:
        *(double *)&v10 = 32.0;
        goto LABEL_12;
      case 6:
        *(double *)&v10 = 36.0;
LABEL_12:
        v9 = *(double *)&v10;
LABEL_13:
        v8 = v9 * a4;
        goto LABEL_14;
      case 7:
        v6 = 38.0;
LABEL_16:
        v8 = v6 * a4;
        goto LABEL_17;
      default:
        v7 = 0.0;
        break;
    }
  }
  v8 = v7 * a4;
  if (a3 == 7 || !a3)
  {
LABEL_17:
    if (a6 == 2)
    {
      v14 = (double *)MEMORY[0x1E0DC1440];
    }
    else if (a6 == 1)
    {
      v14 = (double *)MEMORY[0x1E0DC1448];
    }
    else
    {
      v13 = 0.0;
      if (a6)
      {
LABEL_24:
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v8, v13, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        return v12;
      }
      v14 = (double *)MEMORY[0x1E0DC1420];
    }
    v13 = *v14;
    goto LABEL_24;
  }
LABEL_14:
  objc_msgSend((id)objc_opt_class(), "titleFontDescriptorForStylePairing:kind:", a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_titlePrimaryAttributesForStylePairing:(int64_t)a3 scale:(double)a4 kind:(unint64_t)a5 layoutScheme:(int64_t)a6 allowHyphenation:(BOOL)a7 internationalStyle:(int64_t)a8
{
  _BOOL8 v9;
  void *v15;
  BOOL v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[3];
  _QWORD v31[4];

  v9 = a7;
  v31[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 64)
  {
    v16 = a3 == 7 || a3 == 0;
    v17 = 20.0;
    v18 = 0.0;
    if (v16)
      v17 = 0.0;
  }
  else
  {
    switch(a3)
    {
      case 0:
      case 7:
        v17 = 55.0;
        if (a8 != 2)
          v17 = 0.0;
        if (a8 == 1)
          v18 = 4.0;
        else
          v18 = 0.0;
        break;
      case 1:
        v18 = 1.556;
        v17 = 45.0;
        break;
      case 2:
        v18 = 1.564;
        v17 = 35.0;
        break;
      case 3:
        v18 = 2.499;
        goto LABEL_20;
      case 4:
        v18 = -0.476;
        goto LABEL_22;
      case 5:
        v18 = 0.665;
LABEL_20:
        v19 = 0x4043000000000000;
        goto LABEL_23;
      case 6:
        v18 = -0.5;
LABEL_22:
        v19 = 0x4044000000000000;
LABEL_23:
        v17 = *(double *)&v19;
        break;
      default:
        v17 = 0.0;
        v18 = 0.0;
        break;
    }
  }
  if (a6 == 1)
    a4 = a4 * 0.8;
  v20 = a4 * v17;
  objc_msgSend(a1, "_titleFontForStylePairing:scale:kind:internationalStyle:", a3, a5, a8, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  objc_msgSend(v23, "setMaximumLineHeight:", v20);
  objc_msgSend(v23, "setLineBreakMode:", 4);
  objc_msgSend(v23, "setUsesDefaultHyphenation:", v9);
  v24 = *MEMORY[0x1E0DC1140];
  v30[0] = *MEMORY[0x1E0DC1138];
  v30[1] = v24;
  v31[0] = v21;
  v31[1] = v15;
  v30[2] = *MEMORY[0x1E0DC1178];
  v31[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  if (a8 == 2)
  {
    objc_msgSend(a1, "_setKashidaToParagraphStyle:", v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4 * v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0DC1238]);

  }
  v28 = (void *)objc_msgSend(v26, "copy");

  return v28;
}

+ (void)_setKashidaToParagraphStyle:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setSpansAllLines:", 1);
  objc_msgSend(v3, "setAlignment:", 3);

}

+ (id)_subtitleFontCacheKeyForKind:(unint64_t)a3
{
  if (a3 == 64)
    return &unk_1E53ED278;
  else
    return &unk_1E53ED290;
}

+ (id)_allowedSubtitleCharacterSetWithKind:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_subtitleFontCacheKeyForKind:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subtitleCachedCharacterSetByKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(a1, "_subtitleFontForKind:scale:hasExtendedCharacterSet:internationalStyle:", a3, 0, 0, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1368]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = CTFontCopyCharacterSet((CTFontRef)v8);
      if (!v7)
      {
        PLStoryGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v14[0] = 67109120;
          v14[1] = a3;
          _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "font missing NSCharacterSet mapping for kind: %d", (uint8_t *)v14, 8u);
        }

        objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(a1, "subtitleCachedCharacterSetByKind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v7, v5);

  }
  return v7;
}

+ (id)_subtitleFontForKind:(unint64_t)a3 scale:(double)a4 hasExtendedCharacterSet:(BOOL)a5 internationalStyle:(int64_t)a6
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4 * 14.0;
  if (v6 < 10.0)
    v6 = 10.0;
  if (a3 == 64)
    v6 = 11.0;
  if (a6 == 1)
    v7 = v6 * 1.16;
  else
    v7 = v6;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v7, *MEMORY[0x1E0DC1448]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = *MEMORY[0x1E0DC13C0];
    v16[0] = *MEMORY[0x1E0DC1478];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8530]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v16[1] = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = *MEMORY[0x1E0DC1408];
    v11 = *MEMORY[0x1E0DC1398];
    v17[1] = v10;
    v17[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1358], "fontDescriptorWithFontAttributes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v14, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)subtitleAttributesForSize:(CGSize)a3 string:(id)a4 scale:(double)a5 kind:(unint64_t)a6 extendedTraitCollectionSnapshot:(id)a7 internationalStyle:(int64_t)a8
{
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  char v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0DC3658];
  v13 = a4;
  objc_msgSend(v12, "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_allowedSubtitleCharacterSetWithKind:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v15, "isSupersetOfSet:", v16);
  v18 = a6 != 64;
  v19 = v18 & v17;
  v20 = 14.0;
  if ((v18 & v17) == 0)
    v20 = 0.0;
  v21 = v20 * a5;
  objc_msgSend(a1, "_subtitleFontForKind:scale:hasExtendedCharacterSet:internationalStyle:", a6, v17 ^ 1u, a8, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v24, "setMaximumLineHeight:", v21);
  objc_msgSend(v24, "setLineBreakMode:", 4);
  v25 = *MEMORY[0x1E0DC1140];
  v33[0] = *MEMORY[0x1E0DC1138];
  v33[1] = v25;
  v34[0] = v22;
  v34[1] = v14;
  v33[2] = *MEMORY[0x1E0DC1178];
  v34[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");

  if (a8 == 2)
  {
    objc_msgSend(a1, "_setKashidaToParagraphStyle:", v24);
  }
  else
  {
    v28 = 2.0;
    if (a8 != 1)
      v28 = 0.0;
    if ((v19 & 1) != 0)
      v28 = 1.566;
    v29 = v28 * a5;
    objc_msgSend(v24, "setAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0DC1238]);

  }
  v31 = (void *)objc_msgSend(v27, "copy");

  return v31;
}

+ (void)_increaseMaximumLineHeightToAvoidOverlapForLines:(id)a3 attributes:(id)a4 attributedString:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat MinY;
  uint64_t i;
  const __CTLine *v15;
  void *v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  CGFloat v22;
  double MaxY;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  CFIndex location;
  void *v34;
  id v35;
  uint64_t v36;
  void **v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id *v44;
  id obj;
  CGFloat v46;
  CGFloat v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect BoundsWithOptions;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v44 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    v12 = *MEMORY[0x1E0DC1178];
    MinY = 1.79769313e308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        v48 = MinY;
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(obj);
        v15 = (const __CTLine *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "line", v44);
        objc_msgSend(v7, "valueForKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        BoundsWithOptions = CTLineGetBoundsWithOptions(v15, 0);
        x = BoundsWithOptions.origin.x;
        y = BoundsWithOptions.origin.y;
        width = BoundsWithOptions.size.width;
        height = BoundsWithOptions.size.height;
        v61 = CTLineGetBoundsWithOptions(v15, 8uLL);
        v21 = v61.size.width;
        v22 = v61.size.height;
        v46 = v61.origin.y;
        v47 = v61.origin.x;
        MaxY = CGRectGetMaxY(v61);
        objc_msgSend(v16, "maximumLineHeight");
        v25 = v24;
        if (v24 <= 0.0)
        {
          v62.origin.x = x;
          v62.origin.y = y;
          v62.size.width = width;
          v62.size.height = height;
          v24 = CGRectGetHeight(v62);
        }
        v26 = v48 - MaxY;
        v27 = v24 * 0.0500000007;
        v28 = roundf(v27);
        if (v48 - MaxY < v28)
        {
          if (v26 < 0.0)
            v26 = -v26;
          v29 = v26 + v28;
          if (v26 + v28 > v25)
          {
            v30 = (void *)objc_msgSend(v7, "mutableCopy");
            objc_msgSend(v16, "setMinimumLineHeight:", v29);
            objc_msgSend(v16, "setMaximumLineHeight:", v29);
            objc_msgSend(v30, "setValue:forKey:", v16, v12);
            v31 = objc_msgSend(v30, "copy");

            v7 = (id)v31;
          }
        }
        v63.origin.y = v46;
        v63.origin.x = v47;
        v63.size.width = v21;
        v63.size.height = v22;
        MinY = CGRectGetMinY(v63);
        v32 = (void *)MEMORY[0x1E0CB3B18];
        location = CTLineGetStringRange(v15).location;
        objc_msgSend(v32, "valueWithRange:", location, CTLineGetStringRange(v15).length);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v34);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v10);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = v8;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  v37 = v44;
  if (v36)
  {
    v38 = v36;
    v39 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v50 != v39)
          objc_enumerationMutation(v35);
        v41 = *v37;
        v42 = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "rangeValue", v44);
        objc_msgSend(v41, "setAttributes:range:", v7, v42, v43);
      }
      v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v38);
  }

}

+ (id)_rangesAndStylesForTitle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc((Class)off_1E50B5CE0);
  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = objc_msgSend(v4, "length");

  objc_msgSend(v7, "valueWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithFirst:second:", v9, &unk_1E53ED2A8);
  objc_msgSend(v5, "addObject:", v10);

  return v5;
}

+ (BOOL)titleShouldBeUppercasedForStylePairing:(int64_t)a3 kind:(unint64_t)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a4 == 64;
}

void __59__PXStoryTextResourceInfo_subtitleCachedCharacterSetByKind__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)subtitleCachedCharacterSetByKind_instance;
  subtitleCachedCharacterSetByKind_instance = (uint64_t)v0;

}

void __64__PXStoryTextResourceInfo_titleCachedCharacterSetByStyleAndKind__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)titleCachedCharacterSetByStyleAndKind_instance;
  titleCachedCharacterSetByStyleAndKind_instance = (uint64_t)v0;

}

@end
