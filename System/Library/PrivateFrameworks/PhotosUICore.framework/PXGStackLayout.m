@implementation PXGStackLayout

- (PXGStackLayout)init
{
  PXGStackLayout *v2;
  PXGStackLayout *v3;
  UIEdgeInsets *p_faultInOutsets;
  objc_class *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXGStackLayout;
  v2 = -[PXGLayout init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    p_faultInOutsets = &v2->_faultInOutsets;
    PXEdgeInsetsMake();
    *(_QWORD *)&p_faultInOutsets->top = v5;
    v3->_faultInOutsets.left = v6;
    v3->_faultInOutsets.bottom = v7;
    v3->_faultInOutsets.right = v8;
    PXEdgeInsetsMake();
    v3->_faultOutOutsets.top = v9;
    v3->_faultOutOutsets.left = v10;
    v3->_faultOutOutsets.bottom = v11;
    v3->_faultOutOutsets.right = v12;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sublayoutOriginsBeforeUpdate);
  v3.receiver = self;
  v3.super_class = (Class)PXGStackLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (void)setSublayoutAlignmentDelegate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  id obj;

  obj = a3;
  v4 = objc_loadWeakRetained((id *)&self->_sublayoutAlignmentDelegate);
  if (v4 == obj)
  {

LABEL_8:
    v7 = obj;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "isEqual:", obj);

  v7 = obj;
  if ((v6 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_sublayoutAlignmentDelegate, obj);
    self->_sublayoutAlignmentDelegateRespondsTo.shouldAlignSublayoutToVisibleTopEdge = objc_opt_respondsToSelector() & 1;
    v8 = objc_opt_respondsToSelector();
    v7 = obj;
    self->_sublayoutAlignmentDelegateRespondsTo.shouldAlignSublayoutToVisibleBottomEdge = v8 & 1;
    if (!self->_isUpdatingSublayouts)
    {
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_11:
          p_updateFlags->needsUpdate = needsUpdate | 1;
          goto LABEL_12;
        }
LABEL_10:
        if ((self->_updateFlags.updated & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout setSublayoutAlignmentDelegate:]");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGStackLayout.m"), 91, CFSTR("invalidating %lu after it already has been updated"), 1);

          abort();
        }
        goto LABEL_11;
      }
      if (self->_updateFlags.isPerformingUpdate)
        goto LABEL_10;
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      if (willPerformUpdate)
        goto LABEL_12;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
  }
LABEL_12:

}

- (UIEdgeInsets)additionalSafeAreaInsetsForSublayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)invalidateAdditionalSafeAreaInsets
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout invalidateAdditionalSafeAreaInsets]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGStackLayout.m"), 105, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGStackLayout;
  -[PXGLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGStackLayout.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGStackLayout.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  uint64_t v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 isPerformingUpdate;
  unint64_t v7;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v9;
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
  void *v20;
  void *v21;
  objc_super v22;

  v3 = -[PXGLayout numberOfDescendantAnchors](self, "numberOfDescendantAnchors");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (v3 >= 1)
  {
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout update]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXGStackLayout.m"), 118, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->needsUpdate = needsUpdate;
    self->_updateFlags.willPerformUpdate = 0;
    if (!isPerformingUpdate)
      goto LABEL_5;
    goto LABEL_22;
  }
  self->_updateFlags.willPerformUpdate = 0;
  if (!needsUpdate)
    goto LABEL_12;
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout update]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGStackLayout.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.isPerformingUpdate = 1;
  self->_updateFlags.updated = 2;
  if ((needsUpdate & 2) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
    -[PXGStackLayout _updateInterlayoutSpacing](self, "_updateInterlayoutSpacing");
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGStackLayout.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
  }
  v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 1uLL;
  if ((v7 & 1) != 0)
  {
    p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFELL;
    -[PXGStackLayout _updateSublayouts](self, "_updateSublayouts");
    v7 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout update]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGStackLayout.m"), 128, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_12:
  v22.receiver = self;
  v22.super_class = (Class)PXGStackLayout;
  -[PXGLayout update](&v22, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v9 = self->_postUpdateFlags.needsUpdate;
  if (v9)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout update]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGStackLayout.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v9 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1;
    if ((v9 & 1) != 0)
    {
      p_postUpdateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFFELL;
      -[PXGStackLayout _updateFirstFloatingLayout](self, "_updateFirstFloatingLayout");
      v9 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout update]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXGStackLayout.m"), 136, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGStackLayout;
  -[PXGLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGStackLayout.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGStackLayout.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateEstimatedSublayoutContentSizes
{
  void *v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateSublayoutGeometriesUsingBlock:", &__block_literal_global_19152);

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout _invalidateEstimatedSublayoutContentSizes]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGStackLayout.m"), 150, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateInterlayoutSpacing
{
  int64_t v3;
  id v4;
  _QWORD v5[6];

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXGStackLayout axis](self, "axis");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PXGStackLayout__updateInterlayoutSpacing__block_invoke;
  v5[3] = &unk_1E5119378;
  v5[4] = self;
  v5[5] = v3;
  objc_msgSend(v4, "enumerateSublayoutGeometriesUsingBlock:", v5);

}

- (void)_updateSublayouts
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  $1AB5FA073B851C12C2339EC22442E995 *sublayoutOriginsBeforeUpdate;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  int64_t v51;
  BOOL v52;
  void *v53;
  unsigned __int16 v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void (**v63)(void *, uint64_t, uint64_t, _QWORD);
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  __int128 v76;
  double *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  $1AB5FA073B851C12C2339EC22442E995 *v90;
  double *v91;
  double var1;
  double var2;
  BOOL v94;
  id v96;
  id v97;
  id v98;
  NSSet *v99;
  NSSet *sublayoutsToAlignToVisibleTopEdge;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  id v108;
  unint64_t v109;
  int64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  double v121;
  double v122;
  _QWORD v124[4];
  id v125;
  id v126;
  _QWORD v127[4];
  id v128;
  PXGStackLayout *v129;
  id v130;
  uint64_t *v131;
  uint64_t *v132;
  int64_t v133;
  SEL v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double *v141;
  uint64_t v142;
  void *v143;
  double v144;
  double v145;
  uint64_t v146;
  _QWORD aBlock[4];
  id v148;
  PXGStackLayout *v149;
  id v150;
  id v151;
  id v152;
  uint64_t *v153;
  uint64_t *v154;
  uint64_t *v155;
  uint64_t *v156;
  SEL v157;
  int64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  double v167;
  double v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  int64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  unsigned __int16 v177;
  _QWORD v178[5];
  id v179;
  id v180;
  id v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t *v184;
  uint64_t *v185;
  double v186;
  double v187;
  int64_t v188;
  SEL v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  char v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t *v199;
  uint64_t v200;
  void *v201;
  double v202;
  double v203;
  uint64_t v204;
  uint64_t v205;
  double *v206;
  uint64_t v207;
  void *v208;
  __int128 v209;
  __int128 v210;

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (self->_isUpdatingSublayouts)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGStackLayout.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isUpdatingSublayouts"));

  }
  self->_isUpdatingSublayouts = 1;
  v5 = -[PXGStackLayout axis](self, "axis");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGStackLayout.m"), 170, CFSTR("stacking axis is undefined %@"), self);

  }
  -[PXGStackLayout padding](self, "padding");
  v121 = v6;
  v122 = v7;
  v106 = v8;
  v107 = v9;
  -[PXGLayout referenceSize](self, "referenceSize");
  v11 = v10;
  v13 = v12;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v15 = v14;
  v16 = -[PXGLayout referenceOptions](self, "referenceOptions");
  v120 = v15;
  if (v5 == 1)
  {
    v18 = v11 - (v122 + v107);
    v17 = v13;
  }
  else if (v5 == 2)
  {
    v17 = v13 - (v121 + v106);
    v18 = v11;
    v11 = v13;
  }
  else
  {
    v17 = 0.0;
    v18 = 0.0;
    v11 = 0.0;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGStackLayout.m"), 179, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  v205 = 0;
  v206 = (double *)&v205;
  v207 = 0x4010000000;
  v208 = &unk_1A7E74EE7;
  v209 = 0u;
  v210 = 0u;
  -[PXGLayout visibleRect](self, "visibleRect");
  *(_QWORD *)&v209 = v20;
  *((_QWORD *)&v209 + 1) = v21;
  *(_QWORD *)&v210 = v22;
  *((_QWORD *)&v210 + 1) = v23;
  -[PXGStackLayout faultInOutsets](self, "faultInOutsets");
  sub_1A7AE3F38();
  v118 = v24;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[PXGStackLayout faultOutOutsets](self, "faultOutOutsets");
  sub_1A7AE3F38();
  v116 = v32;
  v117 = v31;
  v115 = v33;
  v35 = v34;
  -[PXGLayout displayScale](self, "displayScale");
  v114 = v36;
  -[PXGLayout lastScrollDirection](self, "lastScrollDirection");
  v112 = v38;
  v113 = v37;
  v39 = -[PXGLayout scrollSpeedRegime](self, "scrollSpeedRegime");
  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
  _PXGArrayResize();
  v42 = objc_retainAutorelease(v3);
  v43 = objc_msgSend(v42, "geometries");
  v111 = (void *)v40;
  if (v4 >= 1)
  {
    sublayoutOriginsBeforeUpdate = self->_sublayoutOriginsBeforeUpdate;
    v45 = v43 + 48;
    v46 = v4;
    do
    {
      v47 = *(_OWORD *)v45;
      sublayoutOriginsBeforeUpdate->var2 = *(double *)(v45 + 16);
      *(_OWORD *)&sublayoutOriginsBeforeUpdate->var0 = v47;
      ++sublayoutOriginsBeforeUpdate;
      v45 += 136;
      --v46;
    }
    while (v46);
  }
  v198 = 0;
  v199 = &v198;
  v200 = 0x3810000000;
  v201 = &unk_1A7E74EE7;
  v202 = v122;
  v203 = v121;
  v204 = 0;
  v194 = 0;
  v195 = &v194;
  v196 = 0x2020000000;
  v197 = 0x7FFFFFFFFFFFFFFFLL;
  v190 = 0;
  v191 = &v190;
  v192 = 0x2020000000;
  v193 = 0;
  v48 = -[PXGLayout anchoredContentEdges](self, "anchoredContentEdges");
  v49 = v48;
  if (v48)
  {
    if ((v48 & 1) != 0)
    {
      v50 = 0;
    }
    else
    {
      if ((v48 & 4) == 0)
      {
LABEL_22:
        v52 = -[PXGLayout shouldFaultInContentAtAnchoredContentEdges](self, "shouldFaultInContentAtAnchoredContentEdges");
        *((_BYTE *)v191 + 24) = v52;
        goto LABEL_23;
      }
      v50 = v4 - 1;
    }
    v195[3] = v50;
    goto LABEL_22;
  }
  v51 = -[PXGLayout anchoredSublayoutIndex](self, "anchoredSublayoutIndex");
  if (v51 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v195[3] = v51;
    *((_BYTE *)v191 + 24) = 1;
  }
LABEL_23:
  v109 = v41;
  v110 = v39;
  -[PXGStackLayout sublayoutAlignmentDelegate](self, "sublayoutAlignmentDelegate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v16;
  v55 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v56 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v178[0] = MEMORY[0x1E0C809B0];
  v178[1] = 3221225472;
  v178[2] = __35__PXGStackLayout__updateSublayouts__block_invoke;
  v178[3] = &unk_1E51193A0;
  v182 = &v198;
  v178[4] = self;
  v186 = v18;
  v187 = v17;
  v183 = &v205;
  v184 = &v194;
  v185 = &v190;
  v188 = v5;
  v189 = a2;
  v108 = v53;
  v179 = v108;
  v57 = v55;
  v180 = v57;
  v58 = v56;
  v181 = v58;
  objc_msgSend(v42, "enumerateSublayoutGeometriesUsingBlock:", v178);
  if (v195[3] == 0x7FFFFFFFFFFFFFFFLL)
    v195[3] = v4 - 1;
  -[PXGStackLayout sublayoutFaultingDelegate](self, "sublayoutFaultingDelegate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PXGStackLayout__updateSublayouts__block_invoke_2;
  aBlock[3] = &unk_1E51193F0;
  v60 = v42;
  v148 = v60;
  v149 = self;
  v157 = a2;
  v158 = v5;
  v153 = &v198;
  v154 = &v190;
  v155 = &v194;
  v156 = &v205;
  v159 = v117;
  v160 = v116;
  v161 = v35;
  v162 = v115;
  v61 = v57;
  v150 = v61;
  v62 = v59;
  v151 = v62;
  v163 = v26;
  v164 = v28;
  v165 = v30;
  v166 = v118;
  v119 = v111;
  v152 = v119;
  v167 = v18;
  v168 = v17;
  v177 = v54;
  v169 = v120;
  v170 = v114;
  v171 = v113;
  v172 = v112;
  v173 = v110;
  v174 = v109;
  v175 = v4;
  v176 = v49;
  v63 = (void (**)(void *, uint64_t, uint64_t, _QWORD))_Block_copy(aBlock);
  v64 = v195[3];
  if ((v64 & 0x8000000000000000) == 0 && v64 < v4)
  {
    v65 = objc_retainAutorelease(v60);
    v66 = objc_msgSend(v65, "geometries");
    v67 = v195;
    v68 = v66 + 136 * v195[3];
    v69 = v199;
    v70 = *(_QWORD *)(v68 + 64);
    *((_OWORD *)v199 + 2) = *(_OWORD *)(v68 + 48);
    v69[6] = v70;
    v63[2](v63, v67[3], v4 - v67[3], 0);
    v71 = objc_msgSend(objc_retainAutorelease(v65), "geometries");
    v72 = v195;
    v73 = v71 + 136 * v195[3];
    v74 = v199;
    v75 = *(_QWORD *)(v73 + 64);
    *((_OWORD *)v199 + 2) = *(_OWORD *)(v73 + 48);
    v74[6] = v75;
    v63[2](v63, 0, v72[3], 2);
  }
  v76 = *((_OWORD *)off_1E50B8020 + 1);
  *(_OWORD *)&self->_flexibleRegionInsets.top = *(_OWORD *)off_1E50B8020;
  *(_OWORD *)&self->_flexibleRegionInsets.bottom = v76;
  v77 = (double *)v199;
  *((double *)v199 + 4) = v122;
  v77[5] = v121;
  v77[6] = 0.0;
  v140 = 0;
  v141 = (double *)&v140;
  v142 = 0x3810000000;
  v143 = &unk_1A7E74EE7;
  v144 = v122;
  v145 = v121;
  v146 = 0;
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  v79 = v78;
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __35__PXGStackLayout__updateSublayouts__block_invoke_4;
  v127[3] = &unk_1E5119418;
  v86 = v61;
  v128 = v86;
  v129 = self;
  v131 = &v140;
  v133 = v5;
  v134 = a2;
  v135 = v4;
  v87 = v58;
  v130 = v87;
  v132 = &v198;
  v136 = v79;
  v137 = v81;
  v138 = v83;
  v139 = v85;
  objc_msgSend(v60, "enumerateSublayoutGeometriesUsingBlock:", v127);
  if (v4 != objc_msgSend(v60, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGStackLayout.m"), 564, CFSTR("number of sublayouts unexpectedly changed during update pass of %@"), self);

  }
  v88 = objc_retainAutorelease(v60);
  v89 = objc_msgSend(v88, "geometries");
  if (v4 >= 1)
  {
    v90 = self->_sublayoutOriginsBeforeUpdate;
    v91 = (double *)(v89 + 64);
    while (1)
    {
      var1 = v90->var1;
      var2 = v90->var2;
      v94 = v90->var0 == *(v91 - 2) && var1 == *(v91 - 1);
      if (!v94 || var2 != *v91)
        break;
      v91 += 17;
      ++v90;
      if (!--v4)
        goto LABEL_41;
    }
    -[PXGLayout didChangeSublayoutOrigins](self, "didChangeSublayoutOrigins", v90->var0, var1, var2);
  }
LABEL_41:
  v96 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v124[0] = MEMORY[0x1E0C809B0];
  v124[1] = 3221225472;
  v124[2] = __35__PXGStackLayout__updateSublayouts__block_invoke_5;
  v124[3] = &unk_1E51460E8;
  v97 = v96;
  v125 = v97;
  v98 = v88;
  v126 = v98;
  objc_msgSend(v86, "enumerateIndexesUsingBlock:", v124);
  v99 = (NSSet *)objc_msgSend(v97, "copy");
  sublayoutsToAlignToVisibleTopEdge = self->_sublayoutsToAlignToVisibleTopEdge;
  self->_sublayoutsToAlignToVisibleTopEdge = v99;

  if (v5 == 1)
  {
    v101 = v106 + v141[5];
    v102 = v11;
    if (v101 < v121 + v106)
      v101 = v121 + v106;
  }
  else
  {
    v101 = v11;
    if (v5 == 2)
    {
      v102 = v107 + v141[4];
      if (v102 < v122 + v107)
        v102 = v122 + v107;
    }
    else
    {
      v102 = 0.0;
      v101 = 0.0;
    }
  }
  -[PXGStackLayout сontentSizeForProposedContentSize:](self, "сontentSizeForProposedContentSize:", v102, v101);
  -[PXGLayout setContentSize:](self, "setContentSize:");
  -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:", v206[4], v206[5], v206[6], v206[7]);
  self->_isUpdatingSublayouts = 0;

  _Block_object_dispose(&v140, 8);
  _Block_object_dispose(&v190, 8);
  _Block_object_dispose(&v194, 8);
  _Block_object_dispose(&v198, 8);

  _Block_object_dispose(&v205, 8);
}

- (void)_invalidateFirstFloatingLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout _invalidateFirstFloatingLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGStackLayout.m"), 606, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateFirstFloatingLayout
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[10];
  _QWORD v13[4];

  if (-[NSSet count](self->_sublayoutsToAlignToVisibleTopEdge, "count"))
  {
    -[PXGLayout visibleRect](self, "visibleRect");
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    PXEdgeInsetsInsetRect();
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__PXGStackLayout__updateFirstFloatingLayout__block_invoke;
    v12[3] = &unk_1E5119440;
    v12[6] = v4;
    v12[7] = v6;
    v12[8] = v8;
    v12[9] = v10;
    v12[4] = self;
    v12[5] = v13;
    objc_msgSend(v11, "enumerateSublayoutGeometriesUsingBlock:", v12);

    _Block_object_dispose(v13, 8);
  }
}

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v11;
  void *v12;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGStackLayout;
  -[PXGLayout insertSublayoutProvider:inRange:](&v13, sel_insertSublayoutProvider_inRange_, v7, location, length);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout insertSublayoutProvider:inRange:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGStackLayout.m"), 633, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:

}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  id v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXGStackLayout;
  -[PXGLayout didAddSublayout:atIndex:flags:](&v14, sel_didAddSublayout_atIndex_flags_, v8, a4, a5);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout didAddSublayout:atIndex:flags:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGStackLayout.m"), 641, CFSTR("invalidating %lu after it already has been updated"), 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 3;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:

}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  id v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXGStackLayout;
  -[PXGLayout willRemoveSublayout:atIndex:flags:](&v14, sel_willRemoveSublayout_atIndex_flags_, v8, a4, a5);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout willRemoveSublayout:atIndex:flags:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGStackLayout.m"), 649, CFSTR("invalidating %lu after it already has been updated"), 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 3;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:

}

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGStackLayout;
  -[PXGLayout sublayoutNeedsUpdate:](&v10, sel_sublayoutNeedsUpdate_, v4);
  if (self->_isUpdatingSublayouts)
  {
    -[PXGLayout assumeWillUpdateSublayoutInUpdatePass:](self, "assumeWillUpdateSublayoutInUpdatePass:", v4);
    goto LABEL_9;
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->needsUpdate = needsUpdate | 3;
      goto LABEL_9;
    }
LABEL_7:
    if ((self->_updateFlags.updated & 3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout sublayoutNeedsUpdate:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGStackLayout.m"), 657, CFSTR("invalidating %lu after it already has been updated"), 3);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 3;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_9:

}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGStackLayout;
  -[PXGLayout sublayoutDidChangeContentSize:](&v10, sel_sublayoutDidChangeContentSize_, v4);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout sublayoutDidChangeContentSize:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGStackLayout.m"), 667, CFSTR("invalidating %lu after it already has been updated"), 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 3;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:

}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGStackLayout;
  -[PXGLayout sublayoutDidChangeLastBaseline:](&v10, sel_sublayoutDidChangeLastBaseline_, v4);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout sublayoutDidChangeLastBaseline:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGStackLayout.m"), 675, CFSTR("invalidating %lu after it already has been updated"), 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 3;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:

}

- (void)viewEnvironmentDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  -[PXGLayout viewEnvironmentDidChange](&v8, sel_viewEnvironmentDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout viewEnvironmentDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGStackLayout.m"), 681, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
  -[PXGStackLayout _invalidateEstimatedSublayoutContentSizes](self, "_invalidateEstimatedSublayoutContentSizes");
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout referenceSizeDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGStackLayout.m"), 688, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)referenceDepthDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  -[PXGLayout referenceDepthDidChange](&v8, sel_referenceDepthDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout referenceDepthDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGStackLayout.m"), 695, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)visibleRectDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  -[PXGLayout visibleRectDidChange](&v8, sel_visibleRectDidChange);
  if (self->_isUpdatingSublayouts)
  {
    -[PXGStackLayout _invalidateFirstFloatingLayout](self, "_invalidateFirstFloatingLayout");
    return;
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_7:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout visibleRectDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGStackLayout.m"), 705, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGStackLayout.m"), 711, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)scrollSpeedRegimeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  -[PXGLayout scrollSpeedRegimeDidChange](&v8, sel_scrollSpeedRegimeDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout scrollSpeedRegimeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGStackLayout.m"), 716, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setAxis:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_axis != a3)
  {
    self->_axis = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
LABEL_8:
        -[PXGLayout setNeedsUpdateOfScrollableAxis](self, "setNeedsUpdateOfScrollableAxis");
        return;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout setAxis:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGStackLayout.m"), 724, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_7;
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_padding;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_padding = &self->_padding;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_padding->top = top;
    p_padding->left = left;
    p_padding->bottom = bottom;
    p_padding->right = right;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout setPadding:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGStackLayout.m"), 737, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setFaultInOutsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_faultInOutsets;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_faultInOutsets = &self->_faultInOutsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_faultInOutsets->top = top;
    p_faultInOutsets->left = left;
    p_faultInOutsets->bottom = bottom;
    p_faultInOutsets->right = right;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout setFaultInOutsets:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGStackLayout.m"), 745, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setInterlayoutSpacing:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    PXGAssertErrValidFloat();
    self->_interlayoutSpacing = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGStackLayout setInterlayoutSpacing:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGStackLayout.m"), 756, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (UIEdgeInsets)flexibleRegionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_flexibleRegionInsets.top;
  left = self->_flexibleRegionInsets.left;
  bottom = self->_flexibleRegionInsets.bottom;
  right = self->_flexibleRegionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)axis
{
  return self->_axis;
}

- (double)interlayoutSpacing
{
  return self->_interlayoutSpacing;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXGStackLayoutSublayoutAlignmentDelegate)sublayoutAlignmentDelegate
{
  return (PXGStackLayoutSublayoutAlignmentDelegate *)objc_loadWeakRetained((id *)&self->_sublayoutAlignmentDelegate);
}

- (PXGSublayoutFaultingDelegate)sublayoutFaultingDelegate
{
  return (PXGSublayoutFaultingDelegate *)objc_loadWeakRetained((id *)&self->_sublayoutFaultingDelegate);
}

- (void)setSublayoutFaultingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sublayoutFaultingDelegate, a3);
}

- (UIEdgeInsets)faultInOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_faultInOutsets.top;
  left = self->_faultInOutsets.left;
  bottom = self->_faultInOutsets.bottom;
  right = self->_faultInOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)faultOutOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_faultOutOutsets.top;
  left = self->_faultOutOutsets.left;
  bottom = self->_faultOutOutsets.bottom;
  right = self->_faultOutOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFaultOutOutsets:(UIEdgeInsets)a3
{
  self->_faultOutOutsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sublayoutFaultingDelegate);
  objc_destroyWeak((id *)&self->_sublayoutAlignmentDelegate);
  objc_storeStrong((id *)&self->_sublayoutsToAlignToVisibleTopEdge, 0);
}

void __44__PXGStackLayout__updateFirstFloatingLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  id v6;

  v6 = *a4;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "containsObject:"))
  {
    *(double *)(a3 + 56) = *(double *)(a1 + 56) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a3 + 40)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  }

}

void __35__PXGStackLayout__updateSublayouts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  __int128 v9;
  double *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double MaxY;
  double v27;
  uint64_t v28;
  double v29;
  double *v30;
  id v31;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(_OWORD *)(v8 + 32);
  *(_QWORD *)(a3 + 64) = *(_QWORD *)(v8 + 48);
  *(_OWORD *)(a3 + 48) = v9;
  v31 = *(id *)a4;
  v10 = (double *)(a3 + 32);
  if (PXSizeIsNull())
  {
    if (*(_QWORD *)a4)
    {
      *(_OWORD *)v10 = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48);
    }
    else
    {
      v11 = *(void **)(a4 + 8);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(double *)(a1 + 96);
      v14 = *(double *)(a1 + 104);
      v15 = v11;
      objc_msgSend(v15, "layout:estimatedContentSizeForSublayoutAtIndex:referenceSize:", v12, a2, v13, v14);
      *(_QWORD *)(a3 + 32) = v16;
      *(_QWORD *)(a3 + 40) = v17;

      PXGAssertErrValidSize();
    }
  }
  if (objc_msgSend(v31, "numberOfDescendantAnchors") >= 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_18;
  v18 = *(_QWORD *)(a1 + 112);
  switch(v18)
  {
    case 1:
      v24 = *(double *)(a3 + 56);
      if (v24 < CGRectGetMinY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32)))
      {
        v25 = *(double *)(a3 + 56) + *(double *)(a3 + 40);
        MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
        goto LABEL_16;
      }
LABEL_17:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a2;
      break;
    case 2:
      v27 = *(double *)(a3 + 48);
      if (v27 < CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32)))
      {
        v25 = *(double *)(a3 + 48) + *v10;
        MaxY = CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
LABEL_16:
        if (v25 < MaxY)
          break;
        goto LABEL_17;
      }
      goto LABEL_17;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = *(_QWORD *)(a1 + 120);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = 264;
      goto LABEL_22;
  }
LABEL_18:
  v28 = *(_QWORD *)(a1 + 112);
  switch(v28)
  {
    case 1:
      v29 = *(double *)(a3 + 40) + *(double *)(a3 + 128);
      v30 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
LABEL_25:
      *v30 = v29 + *v30;
      break;
    case 2:
      v29 = *(double *)(a3 + 32) + *(double *)(a3 + 128);
      v30 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
      goto LABEL_25;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = *(_QWORD *)(a1 + 120);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = 281;
LABEL_22:
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v21, v22, CFSTR("PXGStackLayout.m"), v23, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 920)
    && objc_msgSend(*(id *)(a1 + 40), "stackLayout:shouldAlignSublayoutToVisibleTopEdge:"))
  {
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a2);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 921)
    && objc_msgSend(*(id *)(a1 + 40), "stackLayout:shouldAlignSublayoutToVisibleBottomEdge:"))
  {
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a2);
  }

}

void __35__PXGStackLayout__updateSublayouts__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int16 v33;
  BOOL v34;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __35__PXGStackLayout__updateSublayouts__block_invoke_3;
  v16[3] = &unk_1E51193C8;
  v8 = *(void **)(a1 + 32);
  v16[4] = *(_QWORD *)(a1 + 40);
  v34 = (a4 & 2) != 0;
  v9 = *(_QWORD *)(a1 + 112);
  v22 = *(_QWORD *)(a1 + 104);
  v23 = v9;
  v10 = *(_OWORD *)(a1 + 88);
  v20 = *(_OWORD *)(a1 + 72);
  v21 = v10;
  v11 = *(_OWORD *)(a1 + 120);
  v25 = *(_OWORD *)(a1 + 136);
  v24 = v11;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 168);
  v26 = *(_OWORD *)(a1 + 152);
  v27 = v12;
  v19 = *(id *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 184);
  v33 = *(_WORD *)(a1 + 264);
  v14 = *(_OWORD *)(a1 + 200);
  v28 = v13;
  v29 = v14;
  v15 = *(_OWORD *)(a1 + 232);
  v30 = *(_OWORD *)(a1 + 216);
  v31 = v15;
  v32 = *(_OWORD *)(a1 + 248);
  objc_msgSend(v8, "enumerateSublayoutGeometriesInRange:options:usingBlock:", a2, a3, a4, v16);

}

void __35__PXGStackLayout__updateSublayouts__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2))
  {
    if (*(_QWORD *)(a1 + 72) != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));

    }
    v9 = *(double *)(a3 + 56);
    objc_msgSend(*(id *)(a1 + 40), "visibleRect");
    objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
    PXEdgeInsetsMakeWithValueForEdges();
    PXEdgeInsetsInsetRect();
    v8 = v10 - v9;
  }
  if (*(uint64_t *)(a1 + 88) >= 2 && objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a2))
  {
    if (*(_QWORD *)(a1 + 72) != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));

    }
    v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v12 = *(double *)(a3 + 40);
    v13 = *(double *)(a1 + 120);
    if (v11 + v12 < v13)
    {
      v14 = v13 - v12;
      *(double *)(*(_QWORD *)(a1 + 40) + 976) = v14 - v11;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v14;
    }
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(_QWORD *)(v15 + 48);
  *(_OWORD *)(a3 + 48) = *(_OWORD *)(v15 + 32);
  *(_QWORD *)(a3 + 64) = v16;
  *(double *)(a3 + 56) = v8 + *(double *)(a3 + 56);
  v21 = *a4;
  objc_msgSend(v21, "setFloating:", v8 > 0.0);
  objc_msgSend(v21, "setFloatingOffset:", v8);
  v17 = *(_QWORD *)(a1 + 72);
  switch(v17)
  {
    case 1:
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 40)
                                                                  + *(double *)(a3 + 40);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 40)
                                                                  + *(double *)(a3 + 128);
      break;
    case 2:
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 32)
                                                                  + *(double *)(a3 + 32);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 32)
                                                                  + *(double *)(a3 + 128);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("PXGStackLayout.m"), 550, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }

}

void __35__PXGStackLayout__updateSublayouts__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sublayoutAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __35__PXGStackLayout__updateSublayouts__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  _OWORD *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double *v18;
  uint64_t v19;
  __int128 v20;
  _BOOL4 v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  uint64_t v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  double v62;
  id v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  BOOL v68;
  double v69;
  void *v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  double *v76;
  id v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v10 = *(double *)(a3 + 32);
  v9 = *(double *)(a3 + 40);
  v8 = (_OWORD *)(a3 + 32);
  if (!*(_BYTE *)(a1 + 258))
    goto LABEL_9;
  v11 = *(_QWORD *)(a1 + 104);
  switch(v11)
  {
    case 1:
      v17 = v9 + *(double *)(a3 + 128);
      v18 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      goto LABEL_8;
    case 2:
      v17 = v10 + *(double *)(a3 + 128);
      v18 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
LABEL_8:
      *v18 = *v18 - v17;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 96);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 326;
      goto LABEL_89;
  }
LABEL_9:
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v20 = *(_OWORD *)(v19 + 32);
  *(_QWORD *)(a3 + 64) = *(_QWORD *)(v19 + 48);
  *(_OWORD *)(a3 + 48) = v20;
  if (!a4[1])
    goto LABEL_26;
  v21 = *a4 == 0;
  if (*a4)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != a2)
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v23 = *(double *)(v22 + 32);
      v24 = *(double *)(v22 + 40);
      v25 = *(double *)(a3 + 32);
      v26 = *(double *)(a3 + 40);
      PXEdgeInsetsInsetRect();
      v82.origin.x = v27;
      v82.origin.y = v28;
      v82.size.width = v29;
      v82.size.height = v30;
      v78.origin.x = v23;
      v78.origin.y = v24;
      v78.size.width = v25;
      v78.size.height = v26;
      if (!CGRectIntersectsRect(v78, v82) && (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a2) & 1) == 0)
      {
        v31 = *a4;
        if ((objc_msgSend(*(id *)(a1 + 48), "layout:shouldPreventFaultOutOfSublayout:", *(_QWORD *)(a1 + 32), v31) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "willFaultOutSublayout:atIndex:", v31, a2);
          if (*a4)
          {

            *a4 = 0;
          }
        }
        goto LABEL_36;
      }
    }
LABEL_26:
    v21 = 0;
    goto LABEL_37;
  }
  if ((!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
     || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != a2)
    && (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a2) & 1) == 0)
  {
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v33 = *(double *)(v32 + 32);
    v34 = *(double *)(v32 + 40);
    v35 = *(double *)(a3 + 32);
    v36 = *(double *)(a3 + 40);
    PXEdgeInsetsInsetRect();
    v83.origin.x = v37;
    v83.origin.y = v38;
    v83.size.width = v39;
    v83.size.height = v40;
    v79.origin.x = v33;
    v79.origin.y = v34;
    v79.size.width = v35;
    v79.size.height = v36;
    if (!CGRectIntersectsRect(v79, v83))
      goto LABEL_26;
  }
  v41 = *(_QWORD *)(a1 + 32);
  v42 = a4[1];
  objc_msgSend(v42, "layout:createSublayoutAtIndex:", v41, a2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v31 = v43;
    if (*a4 != v31)
    {

      *a4 = v31;
    }

    objc_msgSend(*(id *)(a1 + 32), "didFaultInSublayout:atIndex:fromEstimatedContentSize:", v31, a2, v10, v9);
    goto LABEL_36;
  }
  a4[1] = 0;
  if (*(_BYTE *)(a1 + 258))
  {
    v44 = *(_QWORD *)(a1 + 104);
    switch(v44)
    {
      case 1:
        v45 = -v9;
        v46 = 0.0;
        break;
      case 2:
        v46 = -v10;
        v45 = 0.0;
        break;
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = *(_QWORD *)(a1 + 96);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = 370;
        goto LABEL_89;
      default:
        goto LABEL_35;
    }
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = CGRectOffset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 32), v46, v45);
  }
LABEL_35:
  v31 = 0;
  *v8 = *MEMORY[0x1E0C9D820];
LABEL_36:

LABEL_37:
  v47 = *a4;
  v48 = v47;
  if (!v47)
    goto LABEL_62;
  objc_msgSend(v47, "setViewEnvironment:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v48, "setReferenceSize:", *(double *)(a1 + 176), *(double *)(a1 + 184));
  objc_msgSend(v48, "setReferenceDepth:", *(double *)(a1 + 192));
  objc_msgSend(v48, "setReferenceOptions:", *(unsigned __int16 *)(a1 + 256));
  v80 = CGRectOffset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32), -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(v48, "setVisibleRect:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);
  objc_msgSend(v48, "setDisplayScale:", *(double *)(a1 + 200));
  objc_msgSend(v48, "setLastScrollDirection:", *(double *)(a1 + 208), *(double *)(a1 + 216));
  objc_msgSend(v48, "setScrollSpeedRegime:", *(_QWORD *)(a1 + 224));
  objc_msgSend(v48, "setUserInterfaceDirection:", *(_QWORD *)(a1 + 232));
  objc_msgSend(*(id *)(a1 + 32), "additionalSafeAreaInsetsForSublayout:", v48);
  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  PXEdgeInsetsAdd();
  objc_msgSend(v48, "setSafeAreaInsets:");
  if (!a2)
  {
    v49 = *(_QWORD *)(a1 + 104);
    if (v49 == 1 || v49 == 2)
      goto LABEL_40;
    if (!v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 96);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 404;
      goto LABEL_89;
    }
  }
  v49 = 0;
LABEL_40:
  if (*(_QWORD *)(a1 + 240) - 1 == a2)
  {
    v50 = *(_QWORD *)(a1 + 104);
    switch(v50)
    {
      case 1:
        v49 |= 4uLL;
        break;
      case 2:
        v49 |= 8uLL;
        break;
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = *(_QWORD *)(a1 + 96);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = 417;
        goto LABEL_89;
    }
  }
  objc_msgSend(v48, "createAnchorFromSuperlayoutWithSublayoutIndex:sublayoutPositionEdges:ignoringScrollingAnimationAnchors:", a2, v49, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    v53 = (id)objc_msgSend(v51, "autoInvalidate");
  }
  else if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != a2 || *(_QWORD *)(a1 + 248))
         && !objc_msgSend(v48, "numberOfDescendantAnchors"))
  {
    if ((objc_msgSend(v48, "needsUpdate") & 1) != 0 || (objc_msgSend(v48, "contentSize"), v10 != v55) || v9 != v54)
    {
      if (!*(_QWORD *)(a1 + 248) && !*(_QWORD *)(a1 + 104))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = *(_QWORD *)(a1 + 96);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = 442;
        goto LABEL_89;
      }
      objc_msgSend(v48, "createAnchorForContentEdges:");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (id)objc_msgSend(v56, "autoInvalidate");

    }
  }
  objc_msgSend(v48, "updateIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "didUpdateSublayout:", v48);
  objc_msgSend(v48, "visibleRect");
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = CGRectOffset(v81, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 40));
  objc_msgSend(v48, "contentSize");
  *(_QWORD *)(a3 + 32) = v58;
  *(_QWORD *)(a3 + 40) = v59;
  PXGAssertErrValidSize();

LABEL_62:
  v60 = *(double *)(a3 + 128);
  v61 = *(_QWORD *)(a1 + 104);
  v62 = *(double *)(*(_QWORD *)(a1 + 32) + 936);
  v63 = v48;
  v64 = 32;
  if (v61 == 1)
    v64 = 40;
  v65 = *(double *)(a3 + v64);
  v77 = v63;
  if (v62 == -1.0)
  {
    objc_msgSend(v63, "lastBaseline");
    if (!v48 || ((v67 = *((double *)off_1E50B8810 + 1), v65 != v67) ? (v68 = v66 == v67) : (v68 = 1), v68))
      v69 = *(double *)(a3 + 128);
    else
      v69 = v66 - v65;
  }
  else if (v65 == 0.0)
  {
    v69 = 0.0;
  }
  else
  {
    v69 = v62;
  }
  PXGAssertErrValidFloat();
  *(double *)(a3 + 128) = v69;

  if (!v21)
  {
LABEL_84:
    v70 = v77;
    if (*(_BYTE *)(a1 + 258))
      goto LABEL_93;
LABEL_85:
    v74 = *(_QWORD *)(a1 + 104);
    if (v74 == 1)
    {
      v75 = *(double *)(a3 + 40) + *(double *)(a3 + 128);
      v76 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    else
    {
      if (v74 != 2)
      {
        if (v74)
          goto LABEL_93;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = *(_QWORD *)(a1 + 96);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = 487;
LABEL_89:
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("PXGStackLayout.m"), v16, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v75 = *(double *)(a3 + 32) + *(double *)(a3 + 128);
      v76 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
    }
    *v76 = v75 + *v76;
    goto LABEL_93;
  }
  v70 = v77;
  if (!*(_BYTE *)(a1 + 258))
    goto LABEL_85;
  v71 = *(_QWORD *)(a1 + 104);
  switch(v71)
  {
    case 1:
      v72 = *(double *)(a3 + 128) - v60;
      v73 = 0.0;
LABEL_83:
      *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = CGRectOffset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)+ 32), v73, v72);
      goto LABEL_84;
    case 2:
      v73 = *(double *)(a3 + 128) - v60;
      v72 = 0.0;
      goto LABEL_83;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 96);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 472;
      goto LABEL_89;
  }
LABEL_93:

}

void __43__PXGStackLayout__updateInterlayoutSpacing__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  id v12;

  v12 = *a4;
  v6 = 32;
  if (*(_QWORD *)(a1 + 40) == 1)
    v6 = 40;
  v7 = *(double *)(a3 + v6);
  if (*(double *)(*(_QWORD *)(a1 + 32) + 936) == -1.0)
  {
    objc_msgSend(v12, "lastBaseline");
    if (!v12 || ((v9 = *((double *)off_1E50B8810 + 1), v7 != v9) ? (v10 = v8 == v9) : (v10 = 1), v10))
      v11 = *(double *)(a3 + 128);
    else
      v11 = v8 - v7;
  }
  else if (v7 == 0.0)
  {
    v11 = 0.0;
  }
  else
  {
    v11 = *(double *)(*(_QWORD *)(a1 + 32) + 936);
  }
  PXGAssertErrValidFloat();
  *(double *)(a3 + 128) = v11;

}

__n128 __59__PXGStackLayout__invalidateEstimatedSublayoutContentSizes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;

  result = *(__n128 *)off_1E50B8810;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)off_1E50B8810;
  return result;
}

@end
