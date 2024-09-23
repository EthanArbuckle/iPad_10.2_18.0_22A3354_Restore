@implementation _UIOrderedLayoutArrangement

+ (Class)_configurationHistoryClass
{
  return (Class)objc_opt_class();
}

- (void)_intrinsicContentSizeInvalidatedForItem:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIOrderedLayoutArrangement;
  v3 = a3;
  -[_UILayoutArrangement _intrinsicContentSizeInvalidatedForItem:](&v4, sel__intrinsicContentSizeInvalidatedForItem_, v3);
  _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v3);

}

- (BOOL)_monitorsSystemLayoutFittingSizeForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (self->_distribution != 2)
    return 0;
  v4 = a3;
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
  -[_UILayoutArrangement _setLayoutFillsCanvas:notify:](self, "_setLayoutFillsCanvas:notify:", a3, 1);
}

- (id)_identifierForSpanningLayoutGuide
{
  return CFSTR("UISV-ordering-spanner");
}

- (void)insertItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _UIOrderedLayoutArrangement *v18;
  unint64_t v19;

  v6 = a3;
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v15, "indexOfObject:", v6);
  if (v7 != a4)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL
      || (-[_UILayoutArrangement _outgoingItems](self, "_outgoingItems"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "containsObject:", v6),
          v8,
          v9))
    {
      -[_UIOrderedLayoutArrangement _setItemOrderingChanged:](self, "_setItemOrderingChanged:", 1);
      -[_UILayoutArrangement _createUnanimatedConfigurationTargetIfNecessary](self, "_createUnanimatedConfigurationTargetIfNecessary");
      -[_UILayoutArrangement canvas](self, "canvas");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = _UILAIsAnimatingOnCanvas(v10);

      if (v11)
      {
        -[_UILayoutArrangement _registerAnimationRequest](self, "_registerAnimationRequest");
      }
      else
      {
        -[_UILayoutArrangement _unanimatedConfigurationTarget](self, "_unanimatedConfigurationTarget");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setItemOrderingChanged:", 1);

      }
      -[_UILayoutArrangement canvas](self, "canvas");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsUpdateConstraints");

    }
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50___UIOrderedLayoutArrangement_insertItem_atIndex___block_invoke;
  v16[3] = &unk_1E16B1C28;
  v18 = self;
  v19 = a4;
  v17 = v6;
  v14 = v6;
  -[_UIOrderedLayoutArrangement _trackChangesAffectingExternalBaselineConstraints:](self, "_trackChangesAffectingExternalBaselineConstraints:", v16);

}

- (void)_insertIndividualGuidesAndConstraintsAsNecessary
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSMapTable *v14;
  NSMapTable *hidingDimensionConstraints;
  NSMapTable *edgeToEdgeConstraintsForVisibleItems;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSMapTable *v24;
  BOOL v25;
  NSMapTable *v26;
  NSMapTable *edgeToEdgeConstraintsForHiddenItems;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t j;
  NSMapTable *v34;
  NSMapTable *v36;
  unint64_t v37;
  NSMapTable *spacingOrCenteringGuides;
  unint64_t v39;
  NSMapTable *v40;
  NSMapTable *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  _BOOL4 v46;
  NSMapTable *relatedDimensionConstraints;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t k;
  NSMapTable *v54;
  NSMapTable *v56;
  void *v57;
  int v58;
  BOOL v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  char v65;
  unint64_t v66;
  id v67;
  void *v68;
  _BOOL4 v69;
  void *v71;
  void *v72;
  uint64_t m;
  NSMapTable *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  char v100;
  unint64_t v101;
  uint64_t v102;
  void *v103;
  unint64_t v104;
  unint64_t v105;
  void *v106;
  id v107;
  unint64_t v108;
  _BOOL4 v109;
  unint64_t v110;
  _BOOL4 v111;
  _BOOL4 v112;
  _BOOL4 v113;
  unint64_t v114;
  void *v115;
  unint64_t v116;
  id v117;
  void *v118;
  _QWORD v119[4];
  id v120;
  _UIOrderedLayoutArrangement *v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v118, "count");
  v5 = v4;
  v101 = v4 - 1;
  if (v4)
    v6 = v4 - 1;
  else
    v6 = 0;
  -[_UILayoutArrangement _hiddenItems](self, "_hiddenItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[_UILayoutArrangement _newlyHiddenItems](self, "_newlyHiddenItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v106 = v3;
  objc_msgSend(v3, "_newlyHiddenItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - v10 + v8;

  v114 = v5;
  v13 = v5 - v12;
  v14 = self->_hidingDimensionConstraints;
  if (v12 && !v14)
    v14 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, v12);
  hidingDimensionConstraints = self->_hidingDimensionConstraints;
  self->_hidingDimensionConstraints = v14;

  edgeToEdgeConstraintsForVisibleItems = self->_edgeToEdgeConstraintsForVisibleItems;
  v25 = v13 == 1;
  v17 = v13 - 1;
  if (!v25 && v5 != v12)
  {
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    -[NSMapTable objectEnumerator](edgeToEdgeConstraintsForVisibleItems, "objectEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v124;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v124 != v22)
            objc_enumerationMutation(v18);
          v21 += objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * i), "isActive");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
      }
      while (v20);
    }
    else
    {
      v21 = 0;
    }

    v24 = self->_edgeToEdgeConstraintsForVisibleItems;
    v113 = v21 < v17;
    v25 = v21 < v17 && v24 == 0;
    if (v25)
    {
      v24 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, v17);
      v113 = 1;
    }
  }
  else
  {
    v24 = edgeToEdgeConstraintsForVisibleItems;
    v113 = 0;
  }
  v26 = self->_edgeToEdgeConstraintsForVisibleItems;
  self->_edgeToEdgeConstraintsForVisibleItems = v24;

  edgeToEdgeConstraintsForHiddenItems = self->_edgeToEdgeConstraintsForHiddenItems;
  if (v12)
  {
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    -[NSMapTable objectEnumerator](edgeToEdgeConstraintsForHiddenItems, "objectEnumerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *(_QWORD *)v124;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v124 != v32)
            objc_enumerationMutation(v28);
          v31 += objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * j), "isActive");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
      }
      while (v30);
    }
    else
    {
      v31 = 0;
    }

    v34 = self->_edgeToEdgeConstraintsForHiddenItems;
    v111 = v31 < v12;
    if (v31 < v12 && v34 == 0)
    {
      v34 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, v12);
      v111 = 1;
    }
  }
  else
  {
    v34 = edgeToEdgeConstraintsForHiddenItems;
    v111 = 0;
  }
  v36 = self->_edgeToEdgeConstraintsForHiddenItems;
  self->_edgeToEdgeConstraintsForHiddenItems = v34;

  v37 = objc_msgSend(v106, "distribution") - 3;
  spacingOrCenteringGuides = self->_spacingOrCenteringGuides;
  v104 = v37;
  if (v37 >= 2)
  {
    v40 = spacingOrCenteringGuides;
    v109 = 0;
  }
  else
  {
    v39 = -[NSMapTable count](spacingOrCenteringGuides, "count");
    v40 = self->_spacingOrCenteringGuides;
    v109 = v39 < v6;
    if (v39 < v6 && v40 == 0)
    {
      v40 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, v6);
      v109 = 1;
    }
  }
  v42 = self->_spacingOrCenteringGuides;
  self->_spacingOrCenteringGuides = v40;

  if (v114)
  {
    if ((unint64_t)(objc_msgSend(v106, "distribution") - 1) > 3)
    {
      v110 = 0;
      v107 = 0;
    }
    else
    {
      -[NSMapTable objectEnumerator](self->_relatedDimensionConstraints, "objectEnumerator");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "nextObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIOrderedLayoutArrangement _dimensionRefItemFromConstraint:](self, "_dimensionRefItemFromConstraint:", v44);
      v107 = (id)objc_claimAutoreleasedReturnValue();

      if (v104 > 1)
      {
        v46 = -[_UIOrderedLayoutArrangement _wantsProportionalDistribution](self, "_wantsProportionalDistribution");
        v45 = v114;
        if (!v46)
          v45 = v101;
      }
      else
      {
        v45 = v114 - 2;
        if (v114 <= 1)
          v45 = 0;
      }
      v110 = v45;
    }
  }
  else
  {
    v110 = 0;
    v107 = 0;
  }
  relatedDimensionConstraints = self->_relatedDimensionConstraints;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  -[NSMapTable objectEnumerator](relatedDimensionConstraints, "objectEnumerator");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
  if (v49)
  {
    v50 = v49;
    v51 = 0;
    v52 = *(_QWORD *)v124;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v124 != v52)
          objc_enumerationMutation(v48);
        v51 += objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * k), "isActive");
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
    }
    while (v50);
  }
  else
  {
    v51 = 0;
  }

  v54 = self->_relatedDimensionConstraints;
  if (v51 < v110 && v54 == 0)
    v54 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, v6);
  v56 = self->_relatedDimensionConstraints;
  self->_relatedDimensionConstraints = v54;

  v57 = v106;
  if (objc_msgSend(v106, "axis"))
    v112 = 0;
  else
    v112 = (unint64_t)(objc_msgSend(v106, "distribution") - 3) < 0xFFFFFFFFFFFFFFFELL;
  v58 = v113;
  if (v12)
    v58 = 1;
  if (((v58 | v109) & 1) != 0 || (v51 >= v110 ? (v59 = !v112) : (v59 = 0), !v59))
  {
    -[_UIOrderedLayoutArrangement _firstVisibleItem](self, "_firstVisibleItem");
    v62 = objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _lastVisibleItem](self, "_lastVisibleItem");
    v63 = objc_claimAutoreleasedReturnValue();
    v61 = v118;
    v105 = objc_msgSend(v118, "indexOfObject:", v62);
    v115 = (void *)v62;
    v116 = objc_msgSend(v118, "indexOfObject:", v63);
    v99 = (void *)v63;
    if (v62)
      v64 = v63 == 0;
    else
      v64 = 1;
    v65 = !v64;
    v100 = v65;
    if (v114)
    {
      v66 = 0;
      v102 = 0;
      v103 = 0;
      v108 = 0;
      v67 = 0;
      while (1)
      {
        objc_msgSend(v61, "objectAtIndexedSubscript:", v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v68);
        if (v113 && v69 && v67 != 0)
        {
          -[NSMapTable objectForKey:](self->_edgeToEdgeConstraintsForVisibleItems, "objectForKey:", v67);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (v71)
          {
            if ((objc_msgSend(v71, "isActive") & 1) == 0)
              objc_msgSend(v72, "setActive:", 1);
          }
          else
          {
            -[_UIOrderedLayoutArrangement _activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:isHidden:](self, "_activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:isHidden:", v67, v68, v105 < v108, v116 > v66, 0);
          }

        }
        v117 = v67;
        if (!v111)
          goto LABEL_115;
        if (v69)
          break;
        if (v67)
        {
          -[NSMapTable objectForKey:](self->_edgeToEdgeConstraintsForHiddenItems, "objectForKey:", v68);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v83)
          {
            -[_UIOrderedLayoutArrangement _activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:isHidden:](self, "_activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:isHidden:", v117, v68, 1, v116 > v66, 1);
            goto LABEL_148;
          }
          goto LABEL_138;
        }
        if ((v100 & 1) == 0)
        {
          -[NSMapTable objectForKey:](self->_edgeToEdgeConstraintsForHiddenItems, "objectForKey:", v68);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (v83)
            goto LABEL_138;
          -[_UILayoutArrangement _spanningLayoutGuideCreateIfNecessary](self, "_spanningLayoutGuideCreateIfNecessary");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIOrderedLayoutArrangement _activateAndInsertEdgeToEdgeConstraintForGapBetweenSpanningLayoutGuide:hiddenItem:](self, "_activateAndInsertEdgeToEdgeConstraintForGapBetweenSpanningLayoutGuide:hiddenItem:", v89, v68);

LABEL_148:
LABEL_149:
          v67 = v117;
        }
        if (v112 && objc_msgSend(v68, "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged"))
        {
          -[_UILayoutArrangement canvas](self, "canvas");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "_ola_shouldUseImprovedMultilineTextDisambiguation");

          if (v91)
          {
            v92 = v103;
            if (!v103)
              v92 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            v103 = v92;
            objc_msgSend(v92, "addIndex:", v66);
            v102 += objc_msgSend(v68, "_la_isVisible");
          }
          else
          {
            -[_UIOrderedLayoutArrangement _setUpMultilineTextWidthDisambiguationConstraintForItem:numberOfVisibleMultilineItems:](self, "_setUpMultilineTextWidthDisambiguationConstraintForItem:numberOfVisibleMultilineItems:", v68, 0x7FFFFFFFFFFFFFFFLL);
          }
          v61 = v118;
        }
        if (v69)
        {
          v93 = v67;
          v67 = v68;
          v108 = v66;
LABEL_167:

          goto LABEL_168;
        }
        -[NSMapTable objectForKey:](self->_hidingDimensionConstraints, "objectForKey:", v68);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v94)
        {
          -[NSMapTable objectForKey:](self->_hidingDimensionConstraints, "objectForKey:", v68);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v95;
          if (v95)
          {
            if ((objc_msgSend(v95, "isActive") & 1) == 0)
              objc_msgSend(v93, "setActive:", 1);
          }
          else
          {
            -[_UIOrderedLayoutArrangement _setUpHidingDimensionConstraintForItem:](self, "_setUpHidingDimensionConstraintForItem:", v68);
          }
          v61 = v118;
          goto LABEL_167;
        }
        v61 = v118;
LABEL_168:

        if (++v66 == v114)
          goto LABEL_171;
      }
      if (v66 && v68 == v115 && v105)
      {
        for (m = 0; m != v66; ++m)
        {
          v74 = self->_edgeToEdgeConstraintsForHiddenItems;
          objc_msgSend(v61, "objectAtIndexedSubscript:", m);
          v75 = v61;
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](v74, "objectForKey:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (v77)
          {
            if ((objc_msgSend(v77, "isActive") & 1) == 0)
              objc_msgSend(v77, "setActive:", 1);
          }
          else
          {
            objc_msgSend(v75, "objectAtIndexedSubscript:", m);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIOrderedLayoutArrangement _activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:isHidden:](self, "_activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:isHidden:", v78, v115, 0, v116 > v66, 1);

          }
          v61 = v118;
        }
      }
LABEL_115:
      if (v109 && v69)
      {
        -[NSMapTable objectForKey:](self->_spacingOrCenteringGuides, "objectForKey:", v68);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v79)
          v80 = -[_UIOrderedLayoutArrangement _setUpSpacingOrCenteringGuideForGapIndex:](self, "_setUpSpacingOrCenteringGuideForGapIndex:", v66);
      }
      if (v51 >= v110 || !v69)
        goto LABEL_149;
      -[NSMapTable objectForKey:](self->_relatedDimensionConstraints, "objectForKey:", v68);
      v82 = objc_claimAutoreleasedReturnValue();
      if (v82)
      {
        v83 = (void *)v82;
LABEL_138:
        if ((objc_msgSend(v83, "isActive") & 1) == 0)
          objc_msgSend(v83, "setActive:", 1);
        goto LABEL_148;
      }
      v84 = (uint64_t)v107;
      if (!v107)
      {
        if (v104 > 1)
        {
          if (!-[_UIOrderedLayoutArrangement _wantsProportionalDistribution](self, "_wantsProportionalDistribution"))
          {
            v107 = v68;
            goto LABEL_147;
          }
          -[_UILayoutArrangement canvas](self, "canvas");
          v84 = objc_claimAutoreleasedReturnValue();
LABEL_142:
          v83 = 0;
          v107 = (id)v84;
          if (v104 < 2 || (void *)v84 == v68)
            goto LABEL_148;
          -[_UIOrderedLayoutArrangement _setUpDimensionConstraintForItem:referenceItem:atIndex:](self, "_setUpDimensionConstraintForItem:referenceItem:atIndex:", v68, v84, v66);
LABEL_147:
          v83 = 0;
          goto LABEL_148;
        }
        -[NSMapTable objectEnumerator](self->_spacingOrCenteringGuides, "objectEnumerator");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "nextObject");
        v86 = objc_claimAutoreleasedReturnValue();

        v84 = v86;
        v61 = v118;
      }
      if (v104 <= 1 && v66 < v101)
      {
        v107 = (id)v84;
        -[NSMapTable objectForKey:](self->_spacingOrCenteringGuides, "objectForKey:", v68);
        v87 = objc_claimAutoreleasedReturnValue();
        v88 = (void *)v87;
        if (v87 && v107 != (id)v87)
          -[_UIOrderedLayoutArrangement _setUpDimensionConstraintForItem:referenceItem:atIndex:](self, "_setUpDimensionConstraintForItem:referenceItem:atIndex:", v87, v107, v66);

        goto LABEL_147;
      }
      goto LABEL_142;
    }
    v67 = 0;
    v102 = 0;
    v103 = 0;
LABEL_171:
    -[_UILayoutArrangement canvas](self, "canvas");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v96, "_ola_shouldUseImprovedMultilineTextDisambiguation") & 1) != 0)
    {
      v97 = v103;
      v98 = objc_msgSend(v103, "count");

      if (v98 < 2)
      {
LABEL_175:

        v57 = v106;
        v60 = v107;
        goto LABEL_176;
      }
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __79___UIOrderedLayoutArrangement__insertIndividualGuidesAndConstraintsAsNecessary__block_invoke;
      v119[3] = &unk_1E16BAF70;
      v120 = v61;
      v121 = self;
      v122 = v102;
      objc_msgSend(v103, "enumerateIndexesUsingBlock:", v119);
      v96 = v120;
    }

    v97 = v103;
    goto LABEL_175;
  }
  v60 = v107;
  v61 = v118;
LABEL_176:

}

- (id)_baselineViewVendTallest:(BOOL)a3 forFirstBaseline:(BOOL)a4
{
  void *v4;

  if (a3)
  {
    -[_UIOrderedLayoutArrangement _tallestItem](self, "_tallestItem", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      -[_UIOrderedLayoutArrangement _firstVisibleItem](self, "_firstVisibleItem");
    else
      -[_UIOrderedLayoutArrangement _lastVisibleItem](self, "_lastVisibleItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_trackChangesAffectingExternalBaselineConstraints:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  if (-[_UILayoutArrangement axis](self, "axis") == 1)
  {
    -[_UIOrderedLayoutArrangement _firstVisibleItem](self, "_firstVisibleItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _lastVisibleItem](self, "_lastVisibleItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2]();
    -[_UIOrderedLayoutArrangement _firstVisibleItem](self, "_firstVisibleItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v6)
    {
      -[_UILayoutArrangement canvas](self, "canvas");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_vendedBaselineViewDidMoveForFirst:", 1);

    }
    -[_UIOrderedLayoutArrangement _lastVisibleItem](self, "_lastVisibleItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v8)
    {
      -[_UILayoutArrangement canvas](self, "canvas");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_vendedBaselineViewDidMoveForFirst:", 0);

    }
  }
  else
  {
    v10[2]();
    v5 = 0;
    v4 = 0;
  }

}

- (id)_lastVisibleItem
{
  return -[_UIOrderedLayoutArrangement _visibleItemAtEndWithEnumerationOptions:](self, "_visibleItemAtEndWithEnumerationOptions:", 2);
}

- (id)_firstVisibleItem
{
  return -[_UIOrderedLayoutArrangement _visibleItemAtEndWithEnumerationOptions:](self, "_visibleItemAtEndWithEnumerationOptions:", 0);
}

- (id)_edgeToEdgeConstraintForGapBetweenPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  id v16;
  double v17;
  double v18;
  float v19;
  uint64_t v20;
  id v21;
  id v22;
  _BOOL8 v23;
  int64_t v24;
  int64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "distribution") - 3;
  v14 = -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v10);
  v15 = -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v11);
  v16 = v12;
  objc_msgSend(v16, "customSpacingAfterItem:", v10);
  if (v17 == 3.40282347e38)
  {
    objc_msgSend(v16, "spacing");
    if (v17 == 3.40282347e38)
    {

LABEL_11:
      v23 = v13 < 2;
      v24 = -[_UIOrderedLayoutArrangement _minAttributeForGapConstraintRespectingBaselineRelative:](self, "_minAttributeForGapConstraintRespectingBaselineRelative:", -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v11));
      v25 = -[_UIOrderedLayoutArrangement _maxAttributeForGapConstraintRespectingBaselineRelative:](self, "_maxAttributeForGapConstraintRespectingBaselineRelative:", -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v10));
      -[_UIOrderedLayoutArrangement _expectedEdgeToEdgeSpacingForPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:](self, "_expectedEdgeToEdgeSpacingForPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:", v10, v11, v7, v6);
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", v11, v24, v23, v10, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
  }
  v18 = v17;

  if (v14 && v15)
    v19 = 1.0;
  else
    v19 = 0.5;
  if (v18 != 1.17549435e-38)
    goto LABEL_11;
  v20 = objc_msgSend(v16, "axis");
  v21 = v10;
  if (v20)
  {
    v22 = v11;
    if ((objc_msgSend(v16, "isBaselineRelativeArrangement") & 1) != 0)
      objc_msgSend(v21, "lastBaselineAnchor");
    else
      objc_msgSend(v21, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isBaselineRelativeArrangement") & 1) != 0)
      objc_msgSend(v22, "firstBaselineAnchor");
    else
      objc_msgSend(v22, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v19;
    if (v13 > 1)
      objc_msgSend(v29, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v27, v31);
    else
      objc_msgSend(v29, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v27, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v11, "leadingAnchor");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    if (v13 > 1)
      objc_msgSend(v22, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v27, v28);
    else
      objc_msgSend(v22, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v27, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_25:
  objc_msgSend(v26, "setIdentifier:", CFSTR("UISV-spacing"));

  return v26;
}

- (id)_visibleItemAtEndWithEnumerationOptions:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71___UIOrderedLayoutArrangement__visibleItemAtEndWithEnumerationOptions___block_invoke;
  v9[3] = &unk_1E16C3618;
  v9[4] = self;
  v6 = objc_msgSend(v5, "indexOfObjectWithOptions:passingTest:", a3, v9);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (int64_t)_minAttributeForGapConstraintRespectingBaselineRelative:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  v3 = a3;
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "axis");
  if (v5)
    v6 = 3;
  else
    v6 = 5;
  if (v5 && v3)
  {
    if (objc_msgSend(v4, "isBaselineRelativeArrangement"))
      v6 = 12;
    else
      v6 = 3;
  }

  return v6;
}

- (int64_t)_maxAttributeForGapConstraintRespectingBaselineRelative:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  v3 = a3;
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "axis");
  if (v5)
    v6 = 4;
  else
    v6 = 6;
  if (v5 && v3)
  {
    if (objc_msgSend(v4, "isBaselineRelativeArrangement"))
      v6 = 11;
    else
      v6 = 4;
  }

  return v6;
}

- (double)_expectedEdgeToEdgeSpacingForPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v10);
  v13 = -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v11);

  v14 = 0.0;
  if ((v12 || v7) && (v13 || v6))
  {
    -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "customSpacingAfterItem:", v10);
    if (v16 == 3.40282347e38)
      objc_msgSend(v15, "spacing");
    -[_UILayoutArrangement canvas](self, "canvas");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale(v17);
    v14 = v18;

    if (!v12 || !v13)
      v14 = v14 * 0.5;

  }
  return v14;
}

- (void)_activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6 isHidden:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  id v17;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v17 = a3;
  v12 = a4;
  -[_UIOrderedLayoutArrangement _edgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:](self, "_edgeToEdgeConstraintForGapBetweenPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:", v17, v12, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  LODWORD(v15) = 1148846080;
  if (v7)
    *(float *)&v15 = 50.0;
  objc_msgSend(v13, "setPriority:", v15);
  if (v7)
  {
    if (v9)
      v16 = v12;
    else
      v16 = v17;
    -[NSMapTable setObject:forKey:](self->_edgeToEdgeConstraintsForHiddenItems, "setObject:forKey:", v14, v16);
    objc_msgSend(v14, "setIdentifier:", CFSTR("UISV-spacing-hidden"));
  }
  else
  {
    -[NSMapTable setObject:forKey:](self->_edgeToEdgeConstraintsForVisibleItems, "setObject:forKey:", v14, v17);
  }
  objc_msgSend(v14, "setActive:", 1);

}

- (void)_adjustConstraintConstantsIfPossible
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  void *v76;
  _BOOL4 v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id obj;
  id obja;
  unint64_t v87;
  unint64_t v88;
  void *v89;
  _UIOrderedLayoutArrangement *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spacing");
  v6 = v5;
  objc_msgSend(v3, "spacing");
  v8 = v7;

  v9 = -[_UIOrderedLayoutArrangement _customSpacingChanged](self, "_customSpacingChanged");
  objc_msgSend(v3, "_newlyHiddenItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_newlyUnhiddenItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "spacing");
  v14 = v13;
  if (v13 == 0.0)
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v108 != v18)
            objc_enumerationMutation(v15);
          -[_UIOrderedLayoutArrangement customSpacingAfterItem:](self, "customSpacingAfterItem:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i));
          if (v20 != 0.0 && v20 != 3.40282347e38 && v20 != 1.17549435e-38)
          {

            goto LABEL_23;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
      }
      while (v17);
    }

  }
  v22 = v6 != v8 || v9;
  if ((v22 & 1) != 0 || v14 != 0.0 && v14 != 1.17549435e-38 && objc_msgSend(v12, "count"))
  {
LABEL_23:
    v83 = v12;
    v84 = v3;
    -[_UILayoutArrangement items](self, "items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _firstVisibleItem](self, "_firstVisibleItem");
    v24 = objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _lastVisibleItem](self, "_lastVisibleItem");
    v25 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v24;
    v88 = objc_msgSend(v23, "indexOfObject:", v24);
    v89 = v23;
    v81 = (void *)v25;
    v87 = objc_msgSend(v23, "indexOfObject:", v25);
    v90 = self;
    -[NSMapTable objectEnumerator](self->_edgeToEdgeConstraintsForVisibleItems, "objectEnumerator");
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v104;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v104 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
          objc_msgSend(v30, "constant");
          v32 = v31;
          objc_msgSend(v30, "secondItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstItem");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v89, "indexOfObject:", v33);
          v36 = objc_msgSend(v89, "indexOfObject:", v34);
          objc_msgSend(v30, "secondItem");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstItem");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIOrderedLayoutArrangement _expectedEdgeToEdgeSpacingForPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:](v90, "_expectedEdgeToEdgeSpacingForPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:", v37, v38, v88 < v35, v87 > v36);
          v40 = v39;

          if (v32 != v40)
            objc_msgSend(v30, "setConstant:", v40);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
      }
      while (v27);
    }
    -[NSMapTable objectEnumerator](v90->_edgeToEdgeConstraintsForHiddenItems, "objectEnumerator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    obja = v41;
    v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v100;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v100 != v44)
            objc_enumerationMutation(obja);
          v46 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * k);
          objc_msgSend(v46, "constant");
          v48 = v47;
          objc_msgSend(v46, "secondItem");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "firstItem");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v89, "indexOfObject:", v49);
          v52 = objc_msgSend(v89, "indexOfObject:", v50);
          objc_msgSend(v46, "secondItem");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "firstItem");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIOrderedLayoutArrangement _expectedEdgeToEdgeSpacingForPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:](v90, "_expectedEdgeToEdgeSpacingForPrecedingItem:followingItem:isPrecededByVisibleItem:isFollowedByVisibleItem:", v53, v54, v88 < v51, v87 > v52);
          v56 = v55;

          if (v48 != v56)
            objc_msgSend(v46, "setConstant:", v56);

        }
        v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
      }
      while (v43);
    }

    if (-[NSMapTable count](v90->_multilineTextWidthDisambiguationConstraints, "count"))
    {
      -[_UILayoutArrangement _mutableItems](v90, "_mutableItems");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "count");
      -[_UILayoutArrangement _hiddenItems](v90, "_hiddenItems");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "count");

      if (-[NSMapTable count](v90->_multilineTextWidthDisambiguationConstraints, "count"))
      {
        -[_UILayoutArrangement canvas](v90, "canvas");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "_ola_shouldUseImprovedMultilineTextDisambiguation");

        if (v62)
        {
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          -[_UILayoutArrangement _mutableItems](v90, "_mutableItems");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v95, v112, 16);
          if (v64)
          {
            v65 = v64;
            v66 = 0;
            v67 = *(_QWORD *)v96;
            do
            {
              for (m = 0; m != v65; ++m)
              {
                if (*(_QWORD *)v96 != v67)
                  objc_enumerationMutation(v63);
                v69 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * m);
                if (objc_msgSend(v69, "_la_isVisible"))
                  v66 += 8
                       * objc_msgSend(v69, "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged");
              }
              v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v95, v112, 16);
            }
            while (v65);
          }
          else
          {
            v66 = 0;
          }

        }
        else
        {
          v66 = v58 - v60;
        }
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        -[NSMapTable objectEnumerator](v90->_multilineTextWidthDisambiguationConstraints, "objectEnumerator");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
        if (v71)
        {
          v72 = v71;
          v73 = *(_QWORD *)v92;
          do
          {
            for (n = 0; n != v72; ++n)
            {
              if (*(_QWORD *)v92 != v73)
                objc_enumerationMutation(v70);
              v75 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * n);
              objc_msgSend(v75, "firstItem");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](v90, "_itemWantsLayoutAsIfVisible:", v76);

              if (v77)
              {
                objc_msgSend(v75, "constant");
                v79 = v78;
                -[_UIOrderedLayoutArrangement _constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:](v90, "_constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:", v66);
                if (v79 != v80)
                  objc_msgSend(v75, "setConstant:");
              }
            }
            v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
          }
          while (v72);
        }

      }
    }

    v12 = v83;
    v3 = v84;
  }

}

- (BOOL)_hasStaleSpacing
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spacing");
  v6 = v5;
  objc_msgSend(v4, "spacing");
  if (v6 == v7)
  {
    objc_msgSend(v4, "_newlyHiddenItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {

    }
    else
    {
      objc_msgSend(v4, "_newlyUnhiddenItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        v11 = -[_UIOrderedLayoutArrangement _customSpacingChanged](self, "_customSpacingChanged");
        goto LABEL_6;
      }
    }
  }
  v11 = 1;
LABEL_6:

  return v11;
}

- (double)_calculatedIntrinsicHeight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[_UILayoutArrangement axis](self, "axis"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_UILayoutArrangement _mutableItems](self, "_mutableItems", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v16;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "_la_isVisible"))
          {
            ++v6;
            objc_msgSend(v10, "_calculatedIntrinsicHeight");
            v8 = v8 + v11;
          }
          if (v6)
            v8 = v8 + self->_spacing * (double)(unint64_t)(v6 - 1);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }
    else
    {
      v8 = 0.0;
    }

  }
  else
  {
    -[_UIOrderedLayoutArrangement _tallestItem](self, "_tallestItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_calculatedIntrinsicHeight");
    v8 = v13;

  }
  return v8;
}

- (id)_tallestItem
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "_la_isVisible"))
        {
          objc_msgSend(v9, "_calculatedIntrinsicHeight");
          if (v10 > v7)
          {
            v11 = v10;
            v12 = v9;

            v7 = v11;
            v5 = v12;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMapTable)customSpacings
{
  return self->_customSpacings;
}

- (void)_setUpHidingDimensionConstraintForItem:(id)a3
{
  void *v4;
  id v5;
  double v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0D156E0];
  v5 = a3;
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:constant:", v5, -[_UILayoutArrangement _dimensionAttributeForCurrentAxis](self, "_dimensionAttributeForCurrentAxis"), 0, 0.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", CFSTR("UISV-hiding"));
  LODWORD(v6) = 1148846064;
  objc_msgSend(v7, "setPriority:", v6);
  objc_msgSend(v7, "setActive:", 1);
  -[NSMapTable setObject:forKey:](self->_hidingDimensionConstraints, "setObject:forKey:", v7, v5);

}

- (void)_setItemOrderingChanged:(BOOL)a3
{
  self->_itemOrderingChanged = a3;
}

- (void)_activateAndInsertEdgeToEdgeConstraintForGapBetweenSpanningLayoutGuide:(id)a3 hiddenItem:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  double v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = -[_UIOrderedLayoutArrangement _minAttributeForGapConstraintRespectingBaselineRelative:](self, "_minAttributeForGapConstraintRespectingBaselineRelative:", 0);
  v9 = -[_UIOrderedLayoutArrangement _maxAttributeForGapConstraintRespectingBaselineRelative:](self, "_maxAttributeForGapConstraintRespectingBaselineRelative:", 0);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", v6, v8, 0, v7, v9, 0.0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIdentifier:", CFSTR("UISV-spacing-hidden"));
  LODWORD(v10) = 1112014848;
  objc_msgSend(v11, "setPriority:", v10);
  objc_msgSend(v11, "setActive:", 1);
  -[NSMapTable setObject:forKey:](self->_edgeToEdgeConstraintsForHiddenItems, "setObject:forKey:", v11, v6);

}

- (void)_removeGuideAndConstraintGroupsAsNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  unint64_t v8;
  int v9;
  int v10;
  double v11;
  int v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;

  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "distribution");
  if ((objc_msgSend(v3, "hasEstablishedOrderingValues") & 1) != 0)
  {
    v5 = objc_msgSend(v24, "distribution");
    v6 = v4 != v5;
    v7 = (unint64_t)(v4 - 3) < 2;
    if ((unint64_t)(v4 - 3) <= 1 && v4 != v5)
    {
      -[_UIOrderedLayoutArrangement _cleanUpGuides](self, "_cleanUpGuides");
      v7 = 1;
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
    v7 = (unint64_t)(v4 - 3) < 2;
  }
  v8 = objc_msgSend(v24, "distribution") - 3;
  if (v7 != v8 < 2)
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  if (objc_msgSend(v24, "_itemOrderingChanged"))
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  v9 = objc_msgSend(v3, "layoutUsesCanvasMarginsWhenFilling");
  v10 = v9 ^ objc_msgSend(v24, "layoutUsesCanvasMarginsWhenFilling");
  if (-[NSMapTable count](self->_relatedDimensionConstraints, "count"))
  {
    if (v6
      || ((objc_msgSend(v3, "proportionalFillDenominator"), v11 != self->_proportionalFillDenominator)
        ? (v12 = 1)
        : (v12 = v10),
          v12 == 1))
    {
      _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
    }
  }
  v13 = -[NSMapTable count](self->_relatedDimensionConstraints, "count");
  if (v8 >= 2 && v13 && objc_msgSend(v24, "distribution") != 2)
  {
    -[NSMapTable objectEnumerator](self->_relatedDimensionConstraints, "objectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nextObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _dimensionRefItemFromConstraint:](self, "_dimensionRefItemFromConstraint:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v16)
      || (-[_UILayoutArrangement _outgoingItems](self, "_outgoingItems"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "containsObject:", v16),
          v17,
          v18))
    {
      _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
    }

  }
  if (!-[_UILayoutArrangement axis](self, "axis"))
  {
    if ((v10 & 1) == 0 && (!v6 || (unint64_t)(objc_msgSend(v24, "distribution") - 3) <= 0xFFFFFFFFFFFFFFFDLL))
    {
      -[_UILayoutArrangement _newlyHiddenItems](self, "_newlyHiddenItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v19, "count"))
      {
        -[_UILayoutArrangement _newlyUnhiddenItems](self, "_newlyUnhiddenItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "count"))
        {
          -[_UILayoutArrangement _incomingItems](self, "_incomingItems");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v21, "count"))
          {
            -[_UILayoutArrangement _outgoingItems](self, "_outgoingItems");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            if (!v23)
              goto LABEL_35;
            goto LABEL_34;
          }

        }
      }

    }
LABEL_34:
    _UILACleanUpConstraintsMapTable(self->_multilineTextWidthDisambiguationConstraints);
  }
LABEL_35:

}

- (void)_updateArrangementConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  float v36;
  void *v37;
  unint64_t v38;
  NSMapTable *multilineTextWidthDisambiguationConstraints;
  void *v40;
  void *v41;
  float v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  unint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v58.receiver = self;
  v58.super_class = (Class)_UIOrderedLayoutArrangement;
  -[_UILayoutArrangement _updateArrangementConstraints](&v58, sel__updateArrangementConstraints);
  -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInOrderedArrangementUpdateSection:", 1);
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMapTable count](self->_edgeToEdgeConstraintsForHiddenItems, "count")
    && !-[NSMapTable count](self->_edgeToEdgeConstraintsForVisibleItems, "count"))
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  if (objc_msgSend(v4, "_itemOrderingChanged"))
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  objc_msgSend(v4, "_newlyUnhiddenItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[_UILayoutArrangement _hiddenItems](self, "_hiddenItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v4, "_newlyUnhiddenItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v55 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            _UILACleanUpConstraintForItemInCollection(v14, self->_hidingDimensionConstraints);
            -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:](self, "_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:", v14, 0x7FFFFFFFFFFFFFFFLL, 1);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        }
        while (v11);
      }

    }
    else
    {
      _UILACleanUpConstraintsMapTable(self->_hidingDimensionConstraints);
      _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
    }
  }
  if (objc_msgSend(v4, "distribution") != 2)
    self->_proportionalFillDenominator = 0.0;
  if (objc_msgSend(v4, "distribution") == 2)
  {
    if ((objc_msgSend(v4, "_itemFittingSizeChanged") & 1) != 0
      || -[_UIOrderedLayoutArrangement _itemCountChanged](self, "_itemCountChanged")
      || objc_msgSend(v3, "distribution") != 2
      || (v15 = objc_msgSend(v4, "axis"), v15 != objc_msgSend(v3, "axis")))
    {
      self->_proportionalFillDenominator = 0.0;
      -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v51 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
            if (-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v21))
            {
              objc_msgSend(v21, "_proportionalFillLengthForOrderedArrangement:relevantParentAxis:", self, -[_UILayoutArrangement axis](self, "axis"));
              if (v22 > 0.0)
                self->_proportionalFillDenominator = v22 + self->_proportionalFillDenominator;
              objc_msgSend(v4, "spacing");
              self->_proportionalFillDenominator = v23 + self->_proportionalFillDenominator;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v18);
      }
      objc_msgSend(v4, "spacing");
      self->_proportionalFillDenominator = self->_proportionalFillDenominator - v24;

    }
  }
  if (-[_UIOrderedLayoutArrangement _hasStaleConfiguration](self, "_hasStaleConfiguration"))
  {
    v25 = objc_msgSend(v3, "axis");
    if (v25 == -[_UILayoutArrangement axis](self, "axis"))
    {
      -[_UIOrderedLayoutArrangement _removeGuideAndConstraintGroupsAsNecessary](self, "_removeGuideAndConstraintGroupsAsNecessary");
      -[_UIOrderedLayoutArrangement _removeIndividualGuidesAndConstraintsAsNecessary](self, "_removeIndividualGuidesAndConstraintsAsNecessary");
    }
    else
    {
      -[_UIOrderedLayoutArrangement _cleanUpWithoutResettingKeepAliveWorkaround](self, "_cleanUpWithoutResettingKeepAliveWorkaround");
    }
    -[_UIOrderedLayoutArrangement _adjustConstraintConstantsIfPossible](self, "_adjustConstraintConstantsIfPossible");
    -[_UIOrderedLayoutArrangement _insertIndividualGuidesAndConstraintsAsNecessary](self, "_insertIndividualGuidesAndConstraintsAsNecessary");
    -[_UILayoutArrangement canvas](self, "canvas");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "_ola_shouldUseImprovedMultilineTextDisambiguation");

    if (!v27)
      goto LABEL_63;
    v28 = -[NSMapTable count](self->_multilineTextWidthDisambiguationConstraints, "count");
    if (v28 < 2)
      goto LABEL_63;
    v29 = v28;
    if (25.0 / (double)v28 <= 1.0)
      v30 = 25.0 / (double)v28;
    else
      v30 = 1.0;
    v31 = *MEMORY[0x1E0D15688];
    if (v30 == 0.0)
    {
      if (v31 > 0.0)
      {
LABEL_47:
        v32 = _adjustMultilineTextDisambiguationConstraintPrioritiesAndActivate___s_category;
        if (!_adjustMultilineTextDisambiguationConstraintPrioritiesAndActivate___s_category)
        {
          v32 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v32, (unint64_t *)&_adjustMultilineTextDisambiguationConstraintPrioritiesAndActivate___s_category);
        }
        v33 = *(NSObject **)(v32 + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = v33;
          -[_UILayoutArrangement canvas](self, "canvas");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v62 = v29;
          v63 = 2112;
          v64 = v35;
          _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Too many side-by-side multiline views (%lu) for optional width disambiguation. Making required constraints instead. Layout might be broken. Stack view: %@", buf, 0x16u);

        }
        v36 = 1000.0;
        goto LABEL_54;
      }
    }
    else if (v30 < v31)
    {
      goto LABEL_47;
    }
    v36 = 950.0;
LABEL_54:
    -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count"))
    {
      v38 = 0;
      do
      {
        multilineTextWidthDisambiguationConstraints = self->_multilineTextWidthDisambiguationConstraints;
        objc_msgSend(v37, "objectAtIndexedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](multilineTextWidthDisambiguationConstraints, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v41, "priority");
          if (v42 == v36)
          {
            v43 = v36;
          }
          else
          {
            objc_msgSend(v41, "setActive:", 0);
            v43 = v36;
            v44 = fmax(v43, fmin(v43, 1000.0));
            *(float *)&v44 = v44;
            objc_msgSend(v41, "setPriority:", v44);
          }
          v36 = v30 + v43;
          objc_msgSend(v41, "setActive:", 1);
        }

        ++v38;
      }
      while (v38 < objc_msgSend(v37, "count"));
    }

LABEL_63:
    -[_UILayoutArrangement _incomingItems](self, "_incomingItems");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v45, "count"))
    {
      -[_UILayoutArrangement _outgoingItems](self, "_outgoingItems");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v46, "count") && (objc_msgSend(v4, "_itemOrderingChanged") & 1) == 0)
      {
        objc_msgSend(v4, "_newlyHiddenItems");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v47, "count"))
        {
          objc_msgSend(v4, "_newlyUnhiddenItems");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "count");

          if (!v49)
            goto LABEL_71;
          goto LABEL_70;
        }

      }
    }

LABEL_70:
    -[_UIOrderedLayoutArrangement _notifyCanvasesBaselineParametersDidChange](self, "_notifyCanvasesBaselineParametersDidChange");
  }
LABEL_71:
  -[_UIOrderedLayoutArrangement _updateConfigurationHistory](self, "_updateConfigurationHistory");
  objc_msgSend(v3, "setInOrderedArrangementUpdateSection:", 0);

}

- (void)_updateConfigurationHistory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInOrderedArrangementUpdateSection"))
  {
    -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spacing");
    objc_msgSend(v3, "setSpacing:");
    objc_msgSend(v3, "setDistribution:", objc_msgSend(v4, "distribution"));
    objc_msgSend(v3, "setProportionalFillDenominator:", self->_proportionalFillDenominator);
    objc_msgSend(v3, "setHasEstablishedOrderingValues:", 1);
    objc_msgSend(v3, "setBaselineRelativeArrangement:", objc_msgSend(v4, "isBaselineRelativeArrangement"));
    if (v3 != v4)
    {
      objc_msgSend(v3, "customSpacings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllObjects");

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v4, "customSpacings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
            objc_msgSend(v4, "customSpacings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "doubleValue");
            objc_msgSend(v3, "setCustomSpacing:afterItem:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "_setItemOrderingChanged:", 0);

  }
  v15.receiver = self;
  v15.super_class = (Class)_UIOrderedLayoutArrangement;
  -[_UILayoutArrangement _updateConfigurationHistory](&v15, sel__updateConfigurationHistory);

}

- (BOOL)_customSpacingChanged
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v10;
  void *v11;

  -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customSpacings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customSpacings");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = 0;
  else
    v8 = v5 != 0;
  if ((v5 != 0) != v8 && v6 != 0)
  {
    objc_msgSend(v4, "customSpacings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "customSpacings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqual:", v11) ^ 1;

  }
  return v8;
}

- (BOOL)_hasStaleConfiguration
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIOrderedLayoutArrangement;
  if (-[_UILayoutArrangement _hasStaleConfiguration](&v9, sel__hasStaleConfiguration))
    return 1;
  -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "hasEstablishedOrderingValues")
    || -[_UIOrderedLayoutArrangement _hasStaleSpacing](self, "_hasStaleSpacing")
    || (objc_msgSend(v5, "_itemOrderingChanged") & 1) != 0
    || (v6 = objc_msgSend(v4, "distribution"), v6 != objc_msgSend(v5, "distribution")))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v4, "proportionalFillDenominator");
    v3 = v7 != self->_proportionalFillDenominator;
  }

  return v3;
}

- (BOOL)_canvasConnectionConstraintsNeedUpdatePass
{
  char v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIOrderedLayoutArrangement;
  if (-[_UILayoutArrangement _canvasConnectionConstraintsNeedUpdatePass](&v6, sel__canvasConnectionConstraintsNeedUpdatePass))
  {
    return 1;
  }
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "_itemOrderingChanged");

  return v3;
}

- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3
{
  uint64_t (**v5)(_QWORD);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v11;
  objc_super v12;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIOrderedLayoutArrangement__indexOfItemForLocationAttribute___block_invoke;
  aBlock[3] = &unk_1E16C7D38;
  aBlock[4] = self;
  v5 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[_UILayoutArrangement axis](self, "axis"))
  {
    if ((unint64_t)a3 > 0x10)
      goto LABEL_13;
    if (((1 << a3) & 0x9008) != 0)
    {
      v11.receiver = self;
      v11.super_class = (Class)_UIOrderedLayoutArrangement;
      v9 = -[_UILayoutArrangement _indexOfItemForLocationAttribute:](&v11, sel__indexOfItemForLocationAttribute_, a3);
      goto LABEL_12;
    }
    v7 = 1 << a3;
    v8 = 67600;
  }
  else
  {
    if ((unint64_t)a3 > 0x12)
      goto LABEL_13;
    if (((1 << a3) & 0x22022) != 0)
    {
      v12.receiver = self;
      v12.super_class = (Class)_UIOrderedLayoutArrangement;
      v9 = -[_UILayoutArrangement _indexOfItemForLocationAttribute:](&v12, sel__indexOfItemForLocationAttribute_, a3);
      goto LABEL_12;
    }
    v7 = 1 << a3;
    v8 = 278596;
  }
  if ((v7 & v8) != 0)
  {
    v9 = (id)v5[2](v5);
LABEL_12:
    v6 = (unint64_t)v9;
  }
LABEL_13:

  return v6;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (void)_notifyCanvasesBaselineParametersDidChange
{
  void *v2;
  void *v3;
  id v4;

  -[_UILayoutArrangement canvas](self, "canvas");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  if (objc_msgSend(v4, "_hasLayoutArrangements"))
  {
    v3 = v4;
    do
    {
      objc_msgSend(v3, "_vendedBaselineViewParametersDidChange");
      objc_msgSend(v3, "superview");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v2;
    }
    while ((objc_msgSend(v2, "_hasLayoutArrangements") & 1) != 0);
  }

}

- (void)_cleanUpWithoutResettingKeepAliveWorkaround
{
  _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
  _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
  _UILACleanUpConstraintsMapTable(self->_hidingDimensionConstraints);
  _UILACleanUpConstraintsMapTable(self->_multilineTextWidthDisambiguationConstraints);
  -[_UIOrderedLayoutArrangement _cleanUpGuides](self, "_cleanUpGuides");
}

- (BOOL)_configurationRequiresCanvasConnectionFittingConstraint
{
  void *v2;
  BOOL v3;

  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v2, "distribution") - 3) < 2;

  return v3;
}

- (BOOL)_itemCountChanged
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_newlyHiddenItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "_newlyUnhiddenItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v5 = 1;
    }
    else
    {
      -[_UILayoutArrangement _incomingItems](self, "_incomingItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        v5 = 1;
      }
      else
      {
        -[_UILayoutArrangement _outgoingItems](self, "_outgoingItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "count") != 0;

      }
    }

  }
  return v5;
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
  -[_UILayoutArrangement _setLayoutUsesCanvasMarginsWhenFilling:notify:](self, "_setLayoutUsesCanvasMarginsWhenFilling:notify:", a3, 1);
}

- (void)_clearAllConstraintsArrays
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIOrderedLayoutArrangement;
  -[_UILayoutArrangement _clearAllConstraintsArrays](&v3, sel__clearAllConstraintsArrays);
  -[_UIOrderedLayoutArrangement _cleanUpWithoutResettingKeepAliveWorkaround](self, "_cleanUpWithoutResettingKeepAliveWorkaround");
}

- (void)_cleanUpGuides
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (-[NSMapTable count](self->_spacingOrCenteringGuides, "count"))
  {
    -[NSMapTable objectEnumerator](self->_spacingOrCenteringGuides, "objectEnumerator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      do
      {
        objc_msgSend(v4, "_setLockedToOwningView:", 0);
        objc_msgSend(v4, "owningView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeLayoutGuide:", v4);

        objc_msgSend(v7, "nextObject");
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
      while (v6);
    }
    -[NSMapTable removeAllObjects](self->_spacingOrCenteringGuides, "removeAllObjects");

  }
}

- (void)setAxis:(int64_t)a3
{
  -[_UILayoutArrangement _setAxis:notify:](self, "_setAxis:notify:", a3, 1);
}

- (void)_didEvaluateMultilineHeightForView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if (!-[_UILayoutArrangement axis](self, "axis"))
  {
    -[_UILayoutArrangement canvas](self, "canvas");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v7)
    {

    }
    else
    {
      -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v7);

      if (!v6)
        goto LABEL_7;
    }
    -[_UIOrderedLayoutArrangement _notifyCanvasesBaselineParametersDidChange](self, "_notifyCanvasesBaselineParametersDidChange");
  }
LABEL_7:

}

- (void)setDistribution:(int64_t)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_distribution != a3)
  {
    self->_distribution = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47___UIOrderedLayoutArrangement_setDistribution___block_invoke;
    v5[3] = &__block_descriptor_40_e36_v16__0___UIOLAConfigurationHistory_8l;
    v5[4] = a3;
    -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", v5);
    -[_UILayoutArrangement canvas](self, "canvas");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v4);

  }
}

- (void)setSpacing:(double)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42___UIOrderedLayoutArrangement_setSpacing___block_invoke;
    v5[3] = &__block_descriptor_40_e36_v16__0___UIOLAConfigurationHistory_8l;
    *(double *)&v5[4] = a3;
    -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", v5);
    -[_UILayoutArrangement canvas](self, "canvas");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v4);

  }
}

- (void)_visibilityParameterChangedForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    if (-[_UILayoutArrangement axis](self, "axis") != 1)
    {
LABEL_15:
      v19.receiver = self;
      v19.super_class = (Class)_UIOrderedLayoutArrangement;
      -[_UILayoutArrangement _visibilityParameterChangedForItem:](&v19, sel__visibilityParameterChangedForItem_, v4);
      goto LABEL_16;
    }
    -[_UIOrderedLayoutArrangement _firstVisibleItem](self, "_firstVisibleItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _lastVisibleItem](self, "_lastVisibleItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_la_isVisible"))
    {
      -[_UIOrderedLayoutArrangement _firstVisibleItem](self, "_firstVisibleItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v4)
      {
        -[_UILayoutArrangement canvas](self, "canvas");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_vendedBaselineViewDidMoveForFirst:", 1);

      }
      -[_UIOrderedLayoutArrangement _lastVisibleItem](self, "_lastVisibleItem");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 != v4)
        goto LABEL_14;
    }
    else
    {
      if (!v8
        || (-[_UILayoutArrangement _mutableItems](self, "_mutableItems"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "indexOfObject:", v8),
            v13,
            v7 < v14))
      {
        -[_UILayoutArrangement canvas](self, "canvas");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_vendedBaselineViewDidMoveForFirst:", 1);

      }
      if (v9)
      {
        -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "indexOfObject:", v9);

        if (v7 <= v17)
          goto LABEL_14;
      }
    }
    -[_UILayoutArrangement canvas](self, "canvas");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_vendedBaselineViewDidMoveForFirst:", 0);

LABEL_14:
    goto LABEL_15;
  }
LABEL_16:

}

- (double)spacing
{
  return self->_spacing;
}

- (void)removeItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42___UIOrderedLayoutArrangement_removeItem___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_UIOrderedLayoutArrangement _trackChangesAffectingExternalBaselineConstraints:](self, "_trackChangesAffectingExternalBaselineConstraints:", v6);

}

- (int64_t)_precedingLocationAttributeForGuideConstraint
{
  void *v3;
  int64_t v4;
  int64_t v5;

  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "distribution") == 3)
  {
    v4 = -[_UIOrderedLayoutArrangement _minAttributeForGapConstraint](self, "_minAttributeForGapConstraint");
    if ((unint64_t)(v4 - 3) < 0xA)
    {
      v5 = qword_186685070[v4 - 3];
      goto LABEL_9;
    }
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "distribution") != 4)
    goto LABEL_8;
  if (-[_UILayoutArrangement axis](self, "axis"))
    v5 = 10;
  else
    v5 = 9;
LABEL_9:

  return v5;
}

- (id)_setUpSpacingOrCenteringGuideForGapIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  _UIOLAGapGuide *v11;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 + 1 >= objc_msgSend(v5, "count"))
  {
LABEL_4:
    v8 = 0;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  while (1)
  {
    v7 = a3 + 1;
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v8))
      break;

    v9 = objc_msgSend(v5, "count");
    v10 = a3 + 2;
    ++a3;
    if (v10 >= v9)
      goto LABEL_4;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFELL)
    goto LABEL_5;
  -[_UILayoutArrangement canvas](self, "canvas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(_UIOLAGapGuide);
  objc_msgSend(v13, "addLayoutGuide:", v11);
  -[UILayoutGuide setIdentifier:](v11, "setIdentifier:", CFSTR("UISV-distributing"));
  -[UILayoutGuide _setLockedToOwningView:](v11, "_setLockedToOwningView:", 1);
  -[_UIOLAGapGuide setFollowingItemIndex:](v11, "setFollowingItemIndex:", v7);
  -[_UIOLAGapGuide setFollowingItem:](v11, "setFollowingItem:", v8);
  v14 = -[_UIOrderedLayoutArrangement _minAttributeForGapConstraint](self, "_minAttributeForGapConstraint");
  v15 = -[_UIOrderedLayoutArrangement _precedingLocationAttributeForGuideConstraint](self, "_precedingLocationAttributeForGuideConstraint");
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v11, v14, 0, v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v21[0] = v16;
  if ((unint64_t)(v14 - 3) <= 9)
    v17 = qword_186685070[v14 - 3];
  if ((unint64_t)(v15 - 3) > 9)
    v18 = 0;
  else
    v18 = qword_186685070[v15 - 3];
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v11, v17, 0, v8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "makeObjectsPerformSelector:withObject:", sel_setIdentifier_, CFSTR("UISV-distributing-edge"));
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v20);
  -[UILayoutGuide _setSystemConstraints:](v11, "_setSystemConstraints:", v20);
  -[NSMapTable setObject:forKey:](self->_spacingOrCenteringGuides, "setObject:forKey:", v11, v6);

LABEL_6:
  return v11;
}

- (int64_t)_minAttributeForGapConstraint
{
  return -[_UIOrderedLayoutArrangement _minAttributeForGapConstraintRespectingBaselineRelative:](self, "_minAttributeForGapConstraintRespectingBaselineRelative:", 1);
}

- (void)_removeIndividualGuidesAndConstraintsAsNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  id v46;
  double v47;
  double v48;
  double v49;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  uint64_t v57;
  id v58;
  double v59;
  double v60;
  double v61;
  id v62;
  double v63;
  double v64;
  double v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  -[_UILayoutArrangement _outgoingItems](self, "_outgoingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v85 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        -[_UIOrderedLayoutArrangement _cleanUpGuideAtGapFollowingItem:](self, "_cleanUpGuideAtGapFollowingItem:", v8);
        -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:](self, "_cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:", v8, 0x7FFFFFFFFFFFFFFFLL, 1);
        -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:](self, "_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:", v8, 0x7FFFFFFFFFFFFFFFLL, 1);
        _UILACleanUpConstraintForItemInCollection(v8, self->_hidingDimensionConstraints);
        _UILACleanUpConstraintForItemInCollection(v8, self->_relatedDimensionConstraints);
        _UILACleanUpConstraintForItemInCollection(v8, self->_multilineTextWidthDisambiguationConstraints);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v5);
  }
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[_UILayoutArrangement _incomingItems](self, "_incomingItems");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:](self, "_cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:", v11, v10 - 1, 1);

    objc_msgSend(v9, "objectAtIndexedSubscript:", v10 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:](self, "_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:", v12, v10 - 1, 0);

  }
  v70 = v3;
  if ((-[NSMapTable count](self->_edgeToEdgeConstraintsForVisibleItems, "count")
     || -[NSMapTable count](self->_edgeToEdgeConstraintsForHiddenItems, "count")
     || -[NSMapTable count](self->_spacingOrCenteringGuides, "count")
     || -[NSMapTable count](self->_multilineTextWidthDisambiguationConstraints, "count"))
    && v10)
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMapTable count](self->_multilineTextWidthDisambiguationConstraints, "count")
        && (objc_msgSend(v14, "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged") & 1) == 0)
      {
        _UILACleanUpConstraintForItemInCollection(v14, self->_multilineTextWidthDisambiguationConstraints);
      }
      if (-[NSMapTable count](self->_edgeToEdgeConstraintsForVisibleItems, "count")
        || -[NSMapTable count](self->_edgeToEdgeConstraintsForHiddenItems, "count")
        || -[NSMapTable count](self->_spacingOrCenteringGuides, "count"))
      {
        break;
      }
LABEL_43:

      if (++v13 == v10)
        goto LABEL_44;
    }
    if (v10 >= 2 && v13 < v10 - 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13 + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v69, "containsObject:", v15);

      if (v16)
      {
        -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:](self, "_cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:", v14, v13, 0);
        -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:](self, "_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:", v14, v13, 1);
      }
    }
    -[_UILayoutArrangement _newlyHiddenItems](self, "_newlyHiddenItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "containsObject:", v14))
    {

    }
    else
    {
      -[_UILayoutArrangement _newlyUnhiddenItems](self, "_newlyUnhiddenItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", v14);

      if (!v19)
      {
LABEL_30:
        if (!-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v14))
        {
          -[_UIOrderedLayoutArrangement _cleanUpGuideAtGapFollowingItem:](self, "_cleanUpGuideAtGapFollowingItem:", v14);
          _UILACleanUpConstraintForItemInCollection(v14, self->_relatedDimensionConstraints);
        }
        -[NSMapTable objectForKey:](self->_spacingOrCenteringGuides, "objectForKey:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v22 = v13;
          if (objc_msgSend(v20, "followingItemIndex") >= v10)
          {
            -[_UIOrderedLayoutArrangement _cleanUpGuideAtGapFollowingItem:](self, "_cleanUpGuideAtGapFollowingItem:", v14);
          }
          else
          {
            while (++v22 < v10)
            {
              if (-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", 0))
              {
                objc_msgSend(v9, "objectAtIndexedSubscript:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              }
            }
            v23 = 0;
LABEL_39:
            objc_msgSend(v21, "followingItem");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24 != v23)
            {
              -[_UIOrderedLayoutArrangement _cleanUpGuideAtGapFollowingItem:](self, "_cleanUpGuideAtGapFollowingItem:", v14);
              _UILACleanUpConstraintForItemInCollection(v14, self->_relatedDimensionConstraints);
            }

          }
        }

        v3 = v70;
        goto LABEL_43;
      }
    }
    -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:](self, "_cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:atIndex:processPrecedingVisibleItem:", v14, v13, 1);
    -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:](self, "_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:", v14, v13, 1);
    goto LABEL_30;
  }
LABEL_44:
  if ((unint64_t)(self->_distribution - 3) >= 2
    && -[NSMapTable count](self->_relatedDimensionConstraints, "count"))
  {
    v25 = v9;
    v26 = (void *)-[NSMapTable copy](self->_relatedDimensionConstraints, "copy");
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    objc_msgSend(v26, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v81 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
          if (!-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v32))
            _UILACleanUpConstraintForItemInCollection(v32, self->_relatedDimensionConstraints);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      }
      while (v29);
    }

    v9 = v25;
  }
  if (-[_UIOrderedLayoutArrangement _hasStaleSpacing](self, "_hasStaleSpacing"))
  {
    v68 = v9;
    -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _orderedConfigurationHistory](self, "_orderedConfigurationHistory");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)-[NSMapTable copy](self->_edgeToEdgeConstraintsForVisibleItems, "copy");
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v67 = v35;
    objc_msgSend(v35, "keyEnumerator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v77 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
          v42 = v34;
          objc_msgSend(v42, "customSpacingAfterItem:", v41);
          if (v43 == 3.40282347e38)
          {
            objc_msgSend(v42, "spacing");
            if (v44 == 3.40282347e38)
              v45 = 0.0;
            else
              v45 = v44;
          }
          else
          {
            v45 = v43;
          }

          v46 = v33;
          objc_msgSend(v46, "customSpacingAfterItem:", v41);
          if (v47 == 3.40282347e38)
          {
            objc_msgSend(v46, "spacing");
            if (v48 == 3.40282347e38)
              v49 = 0.0;
            else
              v49 = v48;
          }
          else
          {
            v49 = v47;
          }

          if (v45 != v49 && (v45 == 1.17549435e-38 || v49 == 1.17549435e-38))
            _UILACleanUpConstraintForItemInCollection(v41, self->_edgeToEdgeConstraintsForVisibleItems);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      }
      while (v38);
    }

    v51 = (void *)-[NSMapTable copy](self->_edgeToEdgeConstraintsForHiddenItems, "copy");
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v71 = v51;
    objc_msgSend(v51, "keyEnumerator");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v73;
      do
      {
        for (m = 0; m != v54; ++m)
        {
          if (*(_QWORD *)v73 != v55)
            objc_enumerationMutation(v52);
          v57 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * m);
          v58 = v34;
          objc_msgSend(v58, "customSpacingAfterItem:", v57);
          if (v59 == 3.40282347e38)
          {
            objc_msgSend(v58, "spacing");
            if (v60 == 3.40282347e38)
              v61 = 0.0;
            else
              v61 = v60;
          }
          else
          {
            v61 = v59;
          }

          v62 = v33;
          objc_msgSend(v62, "customSpacingAfterItem:", v57);
          if (v63 == 3.40282347e38)
          {
            objc_msgSend(v62, "spacing");
            if (v64 == 3.40282347e38)
              v65 = 0.0;
            else
              v65 = v64;
          }
          else
          {
            v65 = v63;
          }

          if (v61 != v65 && (v61 == 1.17549435e-38 || v65 == 1.17549435e-38))
            -[_UIOrderedLayoutArrangement _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:](self, "_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:atIndex:processAdjacentHiddenItems:", v57, 0x7FFFFFFFFFFFFFFFLL, 1);
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      }
      while (v54);
    }

    v3 = v70;
    v9 = v68;
  }

}

- (void)_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:(id)a3 atIndex:(unint64_t)a4 processAdjacentHiddenItems:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;

  v5 = a5;
  v17 = a3;
  _UILACleanUpConstraintForItemInCollection(v17, self->_edgeToEdgeConstraintsForHiddenItems);
  if (v5)
  {
    -[_UILayoutArrangement items](self, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL && (a4 = objc_msgSend(v8, "indexOfObject:", v17), a4 == 0x7FFFFFFFFFFFFFFFLL))
    {
      _removeEntriesFromCollectionIfConstraintContainsItem(v17, self->_edgeToEdgeConstraintsForHiddenItems);
    }
    else
    {
      if (a4)
      {
        v10 = a4 - 1;
        v11 = v17;
        while (1)
        {
          v12 = v11;
          objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v17))
            break;
          _UILACleanUpConstraintForItemInCollection(v17, self->_edgeToEdgeConstraintsForHiddenItems);
          --v10;
          v11 = v17;
          if (v10 == -1)
            goto LABEL_11;
        }
      }
      v11 = v17;
LABEL_11:
      v17 = v11;
      v13 = objc_msgSend(v9, "count");
      if (v13 >= 3)
      {
        v14 = v13;
        if (a4 < v13 - 2)
        {
          v15 = a4 + 1;
          do
          {
            v16 = v17;
            objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            if (-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v17))
              break;
            _UILACleanUpConstraintForItemInCollection(v17, self->_edgeToEdgeConstraintsForHiddenItems);
            ++v15;
          }
          while (v15 < v14);
        }
      }
    }

  }
}

- (void)_cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:(id)a3 atIndex:(unint64_t)a4 processPrecedingVisibleItem:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;

  v5 = a5;
  v13 = a3;
  _UILACleanUpConstraintForItemInCollection(v13, self->_edgeToEdgeConstraintsForVisibleItems);
  if (v5)
  {
    -[_UILayoutArrangement items](self, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL && (a4 = objc_msgSend(v8, "indexOfObject:", v13), a4 == 0x7FFFFFFFFFFFFFFFLL))
    {
      _removeEntriesFromCollectionIfConstraintContainsItem(v13, self->_edgeToEdgeConstraintsForVisibleItems);
    }
    else if (a4)
    {
      v10 = a4 - 1;
      while (1)
      {
        v11 = v13;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (-[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v13))
          break;
        if (--v10 == -1)
          goto LABEL_13;
      }
      v12 = v13;
      if (v12)
      {
        v13 = v12;
        _UILACleanUpConstraintForItemInCollection(v12, self->_edgeToEdgeConstraintsForVisibleItems);

      }
      else
      {
        v13 = 0;
      }
    }
LABEL_13:

  }
}

- (void)_cleanUpGuideAtGapFollowingItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMapTable objectForKey:](self->_spacingOrCenteringGuides, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMapTable objectEnumerator](self->_relatedDimensionConstraints, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIOrderedLayoutArrangement _dimensionRefItemFromConstraint:](self, "_dimensionRefItemFromConstraint:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v7)
    {
      _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
      -[_UIOrderedLayoutArrangement _cleanUpGuides](self, "_cleanUpGuides");
    }
    else
    {
      objc_msgSend(v4, "_setLockedToOwningView:", 0);
      objc_msgSend(v4, "owningView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeLayoutGuide:", v4);

      -[NSMapTable removeObjectForKey:](self->_spacingOrCenteringGuides, "removeObjectForKey:", v9);
    }
  }

}

- (id)_dimensionRefItemFromConstraint:(id)a3
{
  void *v5;

  objc_msgSend(a3, "_ola_dimensionRefItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && !v5)
  {
    if (-[_UIOrderedLayoutArrangement _wantsProportionalDistribution](self, "_wantsProportionalDistribution"))
    {
      -[_UILayoutArrangement canvas](self, "canvas");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (void)setCustomSpacing:(double)a3 afterItem:(id)a4
{
  id v6;
  void *v7;
  int v8;
  double v9;
  NSMapTable *customSpacings;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  double v20;

  v6 = a4;
  -[_UILayoutArrangement items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    -[_UIOrderedLayoutArrangement customSpacingAfterItem:](self, "customSpacingAfterItem:", v6);
    if (v9 != a3)
    {
      customSpacings = self->_customSpacings;
      if (!customSpacings)
      {
        v11 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
        v12 = self->_customSpacings;
        self->_customSpacings = v11;

        customSpacings = self->_customSpacings;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](customSpacings, "setObject:forKey:", v13, v6);

      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __58___UIOrderedLayoutArrangement_setCustomSpacing_afterItem___block_invoke;
      v18 = &unk_1E16E9770;
      v20 = a3;
      v19 = v6;
      -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", &v15);
      -[_UILayoutArrangement canvas](self, "canvas", v15, v16, v17, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v14);

    }
  }

}

- (double)customSpacingAfterItem:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMapTable objectForKey:](self->_customSpacings, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 3.40282347e38;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (dyld_program_sdk_at_least())
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
    _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
    _UILACleanUpConstraintsMapTable(self->_hidingDimensionConstraints);
    _UILACleanUpConstraintsMapTable(self->_multilineTextWidthDisambiguationConstraints);
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIOrderedLayoutArrangement;
  -[_UIOrderedLayoutArrangement dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSpacings, 0);
  objc_storeStrong((id *)&self->_multilineTextWidthDisambiguationConstraints, 0);
  objc_storeStrong((id *)&self->_hidingDimensionConstraints, 0);
  objc_storeStrong((id *)&self->_relatedDimensionConstraints, 0);
  objc_storeStrong((id *)&self->_edgeToEdgeConstraintsForHiddenItems, 0);
  objc_storeStrong((id *)&self->_edgeToEdgeConstraintsForVisibleItems, 0);
  objc_storeStrong((id *)&self->_spacingOrCenteringGuides, 0);
}

- (void)_setUpDimensionConstraintForItem:(id)a3 referenceItem:(id)a4 atIndex:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  int64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  const __CFString *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOrderedLayoutArrangement.m"), 1169, CFSTR("Can't set up dimension constraint"));

  }
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_UIOrderedLayoutArrangement _wantsProportionalDistribution](self, "_wantsProportionalDistribution");
  v14 = -[_UILayoutArrangement _dimensionAttributeForCurrentAxis](self, "_dimensionAttributeForCurrentAxis");
  if (v13)
  {
    -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_proportionalFillLengthForOrderedArrangement:relevantParentAxis:", self, objc_msgSend(v15, "axis"));
    v17 = v16;

    v18 = fmax(v17, 0.0) / self->_proportionalFillDenominator;
    if (v18 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", v9, v14, 0, 0.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v26 = v25;
      if (self->_distribution != 4)
      {
        objc_msgSend(v25, "multiplier");
        if (v29 == 1.0)
        {
          LODWORD(v29) = 1148846080;
          goto LABEL_18;
        }
        v27 = 999.0 - (double)a5;
        v28 = 751.0;
LABEL_17:
        v29 = fmax(v27, v28);
        *(float *)&v29 = v29;
LABEL_18:
        objc_msgSend(v26, "setPriority:", v29);
        goto LABEL_19;
      }
LABEL_14:
      v27 = 150.0 - (double)a5;
      v28 = 50.0;
      goto LABEL_17;
    }
    -[_UILayoutArrangement _propertySource](self, "_propertySource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "layoutUsesCanvasMarginsWhenFilling");

    if (!v20)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:", v9, v14, 0, v10, v14, v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    -[_UILayoutArrangement canvas](self, "canvas");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (v21 == v10)
    {
LABEL_7:
      -[_UILayoutArrangement canvas](self, "canvas");
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if (v22 == v10)
      {
        -[_UILayoutArrangement canvas](self, "canvas");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "layoutMarginsGuide");
        v24 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v24;
      }
      goto LABEL_9;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        goto LABEL_30;
      -[_UILayoutArrangement canvas](self, "canvas");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412546;
      v37 = v35;
      v38 = 2112;
      v39 = v10;
      _os_log_fault_impl(&dword_185066000, v34, OS_LOG_TYPE_FAULT, "Unexpected referenceItem for proportional fill constraint for stack view. UIStackView = %@, referenceItem = %@", (uint8_t *)&v36, 0x16u);
    }
    else
    {
      v32 = _setUpDimensionConstraintForItem_referenceItem_atIndex____s_category;
      if (!_setUpDimensionConstraintForItem_referenceItem_atIndex____s_category)
      {
        v32 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v32, (unint64_t *)&_setUpDimensionConstraintForItem_referenceItem_atIndex____s_category);
      }
      v33 = *(NSObject **)(v32 + 8);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v34 = v33;
      -[_UILayoutArrangement canvas](self, "canvas");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412546;
      v37 = v35;
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Unexpected referenceItem for proportional fill constraint for stack view. UIStackView = %@, referenceItem = %@", (uint8_t *)&v36, 0x16u);
    }

LABEL_30:
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v9, v14, 0, v10, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_distribution == 4)
    goto LABEL_14;
LABEL_19:
  if (v13)
    v30 = CFSTR("UISV-fill-proportionally");
  else
    v30 = CFSTR("UISV-fill-equally");
  objc_msgSend(v26, "setIdentifier:", v30);
  objc_msgSend(v26, "setActive:", 1);
  -[NSMapTable setObject:forKey:](self->_relatedDimensionConstraints, "setObject:forKey:", v26, v12);

}

- (BOOL)_wantsProportionalDistribution
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  double proportionalFillDenominator;
  double v8;

  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = 0;
  if (objc_msgSend(v3, "distribution") == 2 && v5)
  {
    proportionalFillDenominator = self->_proportionalFillDenominator;
    objc_msgSend(v3, "spacing");
    v6 = proportionalFillDenominator > fmax(v8 * (double)(unint64_t)(v5 - 1), 1.0);
  }

  return v6;
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_baselineRelativeArrangement != a3)
  {
    self->_baselineRelativeArrangement = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62___UIOrderedLayoutArrangement_setBaselineRelativeArrangement___block_invoke;
    v5[3] = &__block_descriptor_33_e36_v16__0___UIOLAConfigurationHistory_8l;
    v6 = a3;
    -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", v5);
    -[_UILayoutArrangement canvas](self, "canvas");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v4);

  }
}

- (void)_systemLayoutFittingSizeDidChangeForItem:(id)a3
{
  _QWORD *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  -[_UILayoutArrangement _createUnanimatedConfigurationTargetIfNecessary](self, "_createUnanimatedConfigurationTargetIfNecessary");
  -[_UIOrderedLayoutArrangement _setItemFittingSizeChanged:](self, "_setItemFittingSizeChanged:", 1);
  -[_UILayoutArrangement canvas](self, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _UILAIsAnimatingOnCanvas(v5);

  if (v6)
  {
    -[_UILayoutArrangement _registerAnimationRequest](self, "_registerAnimationRequest");
  }
  else
  {
    -[_UILayoutArrangement _unanimatedConfigurationTarget](self, "_unanimatedConfigurationTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setItemFittingSizeChanged:", 1);

  }
  -[_UILayoutArrangement canvas](self, "canvas");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v4[14];

  objc_msgSend(v9, "_setNeedsUpdateConstraintsNeedingLayout:", (v8 & 0x60) == 0);
}

- (double)_constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "spacing");
    v7 = -(v6 * ((double)a3 + -1.0)) / (double)a3;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)_preparedFaultyCompatibleMultilineTextWidthDisambiguationConstraintForItem:(id)a3
{
  id v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  double v26;
  void *v28;

  v5 = a3;
  -[_UILayoutArrangement canvas](self, "canvas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_ola_shouldUseImprovedMultilineTextDisambiguation");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOrderedLayoutArrangement.m"), 1229, CFSTR("Incorrect use of faulty logic. Internal UIKit bug."));

  }
  v8 = v5;
  -[_UILayoutArrangement _mutableItems](self, "_mutableItems");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)v9, "count");
  -[_UILayoutArrangement _hiddenItems](self, "_hiddenItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = v10 - v12;

  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v14, "layoutUsesCanvasMarginsWhenFilling");
  -[_UILayoutArrangement canvas](self, "canvas");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v15, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v8, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0.0;
  if (v10 != v12)
    v20 = 1.0 / (double)v13;
  -[_UIOrderedLayoutArrangement _constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:](self, "_constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:", v13);
  objc_msgSend(v19, "constraintEqualToAnchor:multiplier:constant:", v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentCompressionResistancePriorityForAxis:", 0);
  v24 = v23;
  objc_msgSend(v8, "contentHuggingPriorityForAxis:", 0);
  if (v24 >= v25)
    v25 = v24;
  v26 = v25 + 10.0;
  if (v26 > 999.0)
    v26 = 999.0;
  *(float *)&v26 = v26;
  objc_msgSend(v22, "setPriority:", v26);

  return v22;
}

- (id)_preparedImprovedMultilineTextWidthDisambiguationConstraintForItem:(id)a3 numberOfVisibleMultilineItems:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;

  v6 = a3;
  objc_msgSend(v6, "_ola_willApplyMultilineTextWidthDisambiguationConstraint");
  -[_UIOrderedLayoutArrangement _orderedPropertySource](self, "_orderedPropertySource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutUsesCanvasMarginsWhenFilling");
  -[_UILayoutArrangement canvas](self, "canvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    v14 = 1.0 / (double)a4;
  else
    v14 = 1.0;
  -[_UIOrderedLayoutArrangement _constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:](self, "_constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:", a4);
  objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = 1148026880;
  objc_msgSend(v16, "setPriority:", v17);

  return v16;
}

- (void)_setUpMultilineTextWidthDisambiguationConstraintForItem:(id)a3 numberOfVisibleMultilineItems:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSMapTable *v8;
  unint64_t v9;
  NSMapTable *multilineTextWidthDisambiguationConstraints;
  id v11;

  v11 = a3;
  -[NSMapTable objectForKey:](self->_multilineTextWidthDisambiguationConstraints, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "setActive:", 1);
  }
  else
  {
    v8 = self->_multilineTextWidthDisambiguationConstraints;
    if (!v8)
    {
      if (a4 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
        v9 = a4 - 1;
      else
        v9 = 0;
      v8 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, v9);
    }
    multilineTextWidthDisambiguationConstraints = self->_multilineTextWidthDisambiguationConstraints;
    self->_multilineTextWidthDisambiguationConstraints = v8;

    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIOrderedLayoutArrangement _preparedFaultyCompatibleMultilineTextWidthDisambiguationConstraintForItem:](self, "_preparedFaultyCompatibleMultilineTextWidthDisambiguationConstraintForItem:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setActive:", 1);
    }
    else
    {
      -[_UIOrderedLayoutArrangement _preparedImprovedMultilineTextWidthDisambiguationConstraintForItem:numberOfVisibleMultilineItems:](self, "_preparedImprovedMultilineTextWidthDisambiguationConstraintForItem:numberOfVisibleMultilineItems:", v11, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "setIdentifier:", CFSTR("UISV-text-width-disambiguation"));
    -[NSMapTable setObject:forKey:](self->_multilineTextWidthDisambiguationConstraints, "setObject:forKey:", v7, v11);
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIOrderedLayoutArrangement;
  -[_UILayoutArrangement description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return (NSString *)v3;
  if (-[NSMapTable count](self->_edgeToEdgeConstraintsForVisibleItems, "count"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" edgeToEdgeConstraintsForVisibleItems=%p"), self->_edgeToEdgeConstraintsForVisibleItems);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (-[NSMapTable count](self->_edgeToEdgeConstraintsForHiddenItems, "count"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" edgeToEdgeConstraintsForHiddenItems=%p"), self->_edgeToEdgeConstraintsForHiddenItems);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  if (-[NSMapTable count](self->_hidingDimensionConstraints, "count"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" hidingDimensionConstraints=%p"), self->_hidingDimensionConstraints);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  if (-[NSMapTable count](self->_multilineTextWidthDisambiguationConstraints, "count"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" multilineTextWidthDisambiguationConstraints=%p"), self->_multilineTextWidthDisambiguationConstraints);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  if (-[NSMapTable count](self->_spacingOrCenteringGuides, "count"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" spacingOrCenteringGuides=%p"), self->_spacingOrCenteringGuides);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  if (-[NSMapTable count](self->_relatedDimensionConstraints, "count"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" relatedDimensionConstraints=%p"), self->_relatedDimensionConstraints);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  if (self->_distribution == 2)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" proportionalFillDenominator=%f"), *(_QWORD *)&self->_proportionalFillDenominator);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }
  if (self->_spacing == 1.17549435e-38)
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" spacing=system"));
  else
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" spacing=%g"), *(_QWORD *)&self->_spacing);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSMapTable count](self->_customSpacings, "count"))
    return (NSString *)v12;
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" customSpacings=%p"), self->_customSpacings);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)_itemOrderingChanged
{
  return self->_itemOrderingChanged;
}

- (BOOL)_itemFittingSizeChanged
{
  return self->_itemFittingSizeChanged;
}

- (void)_setItemFittingSizeChanged:(BOOL)a3
{
  self->_itemFittingSizeChanged = a3;
}

- (BOOL)isBaselineRelativeArrangement
{
  return self->_baselineRelativeArrangement;
}

@end
