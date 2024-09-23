@implementation PXMessagesUISettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesUISettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXMessagesUISettings setDataSourceType:](self, "setDataSourceType:", 0);
  -[PXMessagesUISettings setStackedItemsCount:](self, "setStackedItemsCount:", *MEMORY[0x1E0D75520]);
  -[PXMessagesUISettings setNormalizedStackSizeTransform:](self, "setNormalizedStackSizeTransform:", *MEMORY[0x1E0D75518]);
  -[PXMessagesUISettings setNormalizedStackVerticalOffset:](self, "setNormalizedStackVerticalOffset:", *MEMORY[0x1E0D75530]);
  -[PXMessagesUISettings setVerticalContentInsets:](self, "setVerticalContentInsets:", *MEMORY[0x1E0D75528]);
  -[PXMessagesUISettings setEnableDebugTapbacksStack:](self, "setEnableDebugTapbacksStack:", 0);
  -[PXMessagesUISettings setRotationAngle:](self, "setRotationAngle:", *MEMORY[0x1E0D75510]);
  -[PXMessagesUISettings setApplyRotationToFirstAndLast:](self, "setApplyRotationToFirstAndLast:", 0);
  -[PXMessagesUISettings setStackShadowYOffset:](self, "setStackShadowYOffset:", 7.0);
  -[PXMessagesUISettings setStackShadowBlurRadius:](self, "setStackShadowBlurRadius:", 27.0);
  -[PXMessagesUISettings setStackShadowAlpha:](self, "setStackShadowAlpha:", 0.15);
  -[PXMessagesUISettings setRenderWithCA:](self, "setRenderWithCA:", 1);
  -[PXMessagesUISettings setHorizontalOffsetString:](self, "setHorizontalOffsetString:", CFSTR("20,14.5,10,9"));
  objc_storeStrong((id *)&self->_cachedHorizontalOffsets, (id)*MEMORY[0x1E0D75508]);
  -[PXMessagesUISettings setNormalizedPageWidth:](self, "setNormalizedPageWidth:", 0.8);
  -[PXMessagesUISettings setPagingBehavior:](self, "setPagingBehavior:", 3);
  -[PXMessagesUISettings setPagingVelocityThreshold:](self, "setPagingVelocityThreshold:", 0.6);
  -[PXMessagesUISettings setBestCropRectEnabled:](self, "setBestCropRectEnabled:", 0);
  -[PXMessagesUISettings setAspectTilesEnabled:](self, "setAspectTilesEnabled:", 0);
  -[PXMessagesUISettings setGridShadowXOffset:](self, "setGridShadowXOffset:", 0.0);
  -[PXMessagesUISettings setGridShadowYOffset:](self, "setGridShadowYOffset:", 7.0);
  -[PXMessagesUISettings setGridShadowBlurRadius:](self, "setGridShadowBlurRadius:", 27.0);
  -[PXMessagesUISettings setGridShadowAlpha:](self, "setGridShadowAlpha:", 0.15);
  -[PXMessagesUISettings setEnableDebugTapbacksGrid:](self, "setEnableDebugTapbacksGrid:", 0);
  -[PXMessagesUISettings setMinItemSize:](self, "setMinItemSize:", 220.0);
  -[PXMessagesUISettings setComfortableFitPercentage:](self, "setComfortableFitPercentage:", 0.85);
  -[PXMessagesUISettings setMinColumns:](self, "setMinColumns:", 1);
  -[PXMessagesUISettings setMaxColumns:](self, "setMaxColumns:", 5);
  -[PXMessagesUISettings setTransitionItemsCount:](self, "setTransitionItemsCount:", 5);
  -[PXMessagesUISettings setTransitionDuration:](self, "setTransitionDuration:", 0.6);
  -[PXMessagesUISettings setTransitionSpringDamping:](self, "setTransitionSpringDamping:", 0.8);
  -[PXMessagesUISettings setTransitionSpringVelocity:](self, "setTransitionSpringVelocity:", 0.0);
}

- (void)setVerticalContentInsets:(double)a3
{
  self->_verticalContentInsets = a3;
}

- (void)setTransitionSpringVelocity:(double)a3
{
  self->_transitionSpringVelocity = a3;
}

- (void)setTransitionSpringDamping:(double)a3
{
  self->_transitionSpringDamping = a3;
}

- (void)setTransitionItemsCount:(unint64_t)a3
{
  self->_transitionItemsCount = a3;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (void)setStackedItemsCount:(unint64_t)a3
{
  self->_stackedItemsCount = a3;
}

- (void)setStackShadowYOffset:(double)a3
{
  self->_stackShadowYOffset = a3;
}

- (void)setStackShadowBlurRadius:(double)a3
{
  self->_stackShadowBlurRadius = a3;
}

- (void)setStackShadowAlpha:(double)a3
{
  self->_stackShadowAlpha = a3;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (void)setRenderWithCA:(BOOL)a3
{
  self->_renderWithCA = a3;
}

- (void)setPagingVelocityThreshold:(double)a3
{
  self->_pagingVelocityThreshold = a3;
}

- (void)setPagingBehavior:(int64_t)a3
{
  self->_pagingBehavior = a3;
}

- (void)setNormalizedStackVerticalOffset:(double)a3
{
  self->_normalizedStackVerticalOffset = a3;
}

- (void)setNormalizedStackSizeTransform:(double)a3
{
  self->_normalizedStackSizeTransform = a3;
}

- (void)setNormalizedPageWidth:(double)a3
{
  self->_normalizedPageWidth = a3;
}

- (void)setMinItemSize:(double)a3
{
  self->_minItemSize = a3;
}

- (void)setMinColumns:(int64_t)a3
{
  self->_minColumns = a3;
}

- (void)setMaxColumns:(int64_t)a3
{
  self->_maxColumns = a3;
}

- (void)setHorizontalOffsetString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setGridShadowYOffset:(double)a3
{
  self->_gridShadowYOffset = a3;
}

- (void)setGridShadowXOffset:(double)a3
{
  self->_gridShadowXOffset = a3;
}

- (void)setGridShadowBlurRadius:(double)a3
{
  self->_gridShadowBlurRadius = a3;
}

- (void)setGridShadowAlpha:(double)a3
{
  self->_gridShadowAlpha = a3;
}

- (void)setEnableDebugTapbacksStack:(BOOL)a3
{
  self->_enableDebugTapbacksStack = a3;
}

- (void)setEnableDebugTapbacksGrid:(BOOL)a3
{
  self->_enableDebugTapbacksGrid = a3;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void)setComfortableFitPercentage:(double)a3
{
  self->_comfortableFitPercentage = a3;
}

- (void)setBestCropRectEnabled:(BOOL)a3
{
  self->_bestCropRectEnabled = a3;
}

- (void)setAspectTilesEnabled:(BOOL)a3
{
  self->_aspectTilesEnabled = a3;
}

- (void)setApplyRotationToFirstAndLast:(BOOL)a3
{
  self->_applyRotationToFirstAndLast = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (NSArray)horizontalOffsets
{
  NSArray *cachedHorizontalOffsets;
  void *v4;
  void *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  NSArray *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  cachedHorizontalOffsets = self->_cachedHorizontalOffsets;
  if (!cachedHorizontalOffsets)
  {
    -[PXMessagesUISettings horizontalOffsetString](self, "horizontalOffsetString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "stringByTrimmingCharactersInSet:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v14 = v13;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 / 300.0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v6, "addObject:", v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v16 = self->_cachedHorizontalOffsets;
    self->_cachedHorizontalOffsets = v6;

    cachedHorizontalOffsets = self->_cachedHorizontalOffsets;
  }
  return cachedHorizontalOffsets;
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (unint64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- (double)normalizedStackSizeTransform
{
  return self->_normalizedStackSizeTransform;
}

- (double)normalizedStackVerticalOffset
{
  return self->_normalizedStackVerticalOffset;
}

- (double)verticalContentInsets
{
  return self->_verticalContentInsets;
}

- (BOOL)enableDebugTapbacksStack
{
  return self->_enableDebugTapbacksStack;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (BOOL)applyRotationToFirstAndLast
{
  return self->_applyRotationToFirstAndLast;
}

- (double)stackShadowYOffset
{
  return self->_stackShadowYOffset;
}

- (double)stackShadowBlurRadius
{
  return self->_stackShadowBlurRadius;
}

- (double)stackShadowAlpha
{
  return self->_stackShadowAlpha;
}

- (BOOL)renderWithCA
{
  return self->_renderWithCA;
}

- (NSString)horizontalOffsetString
{
  return self->_horizontalOffsetString;
}

- (double)normalizedPageWidth
{
  return self->_normalizedPageWidth;
}

- (int64_t)pagingBehavior
{
  return self->_pagingBehavior;
}

- (double)pagingVelocityThreshold
{
  return self->_pagingVelocityThreshold;
}

- (BOOL)bestCropRectEnabled
{
  return self->_bestCropRectEnabled;
}

- (BOOL)aspectTilesEnabled
{
  return self->_aspectTilesEnabled;
}

- (double)gridShadowXOffset
{
  return self->_gridShadowXOffset;
}

- (double)gridShadowYOffset
{
  return self->_gridShadowYOffset;
}

- (double)gridShadowBlurRadius
{
  return self->_gridShadowBlurRadius;
}

- (double)gridShadowAlpha
{
  return self->_gridShadowAlpha;
}

- (BOOL)enableDebugTapbacksGrid
{
  return self->_enableDebugTapbacksGrid;
}

- (double)minItemSize
{
  return self->_minItemSize;
}

- (double)comfortableFitPercentage
{
  return self->_comfortableFitPercentage;
}

- (int64_t)minColumns
{
  return self->_minColumns;
}

- (int64_t)maxColumns
{
  return self->_maxColumns;
}

- (unint64_t)transitionItemsCount
{
  return self->_transitionItemsCount;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (double)transitionSpringDamping
{
  return self->_transitionSpringDamping;
}

- (double)transitionSpringVelocity
{
  return self->_transitionSpringVelocity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalOffsetString, 0);
  objc_storeStrong((id *)&self->_cachedHorizontalOffsets, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1960);
  return (id)sharedInstance_sharedInstance;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXMessagesUISettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken != -1)
    dispatch_once(&transientProperties_onceToken, block);
  return (id)transientProperties_transientProperties;
}

void __43__PXMessagesUISettings_transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXMessagesUISettings;
  objc_msgSendSuper2(&v5, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_horizontalOffsets);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)transientProperties_transientProperties;
  transientProperties_transientProperties = v3;

}

void __38__PXMessagesUISettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messagesUISettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v20;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  _QWORD aBlock[4];
  id v156;
  id location;
  _QWORD v158[8];
  void *v159;
  void *v160;
  _QWORD v161[4];
  _QWORD v162[5];
  _QWORD v163[2];
  _QWORD v164[3];
  _QWORD v165[12];
  _QWORD v166[3];

  v166[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D830B8];
  v3 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_dataSourceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Data Source Type"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleValues:titles:", &unk_1E53E8640, &unk_1E53E8658);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v166[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v7, CFSTR("Data Source"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = (void *)MEMORY[0x1E0D830B8];
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_stackedItemsCount);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Stacked Items Count"), v151);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "minValue:maxValue:", 1.0, 5.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "px_increment:", 1.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = v140;
  v9 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_normalizedStackSizeTransform);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Size Transform"), v137);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "minValue:maxValue:", 0.1, 1.0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "px_increment:", 0.05);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v165[1] = v127;
  v10 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_normalizedStackVerticalOffset);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Vertical Offset"), v125);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "minValue:maxValue:", 0.0, 1.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "px_increment:", 0.05);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v165[2] = v118;
  v11 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_verticalContentInsets);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Content Insets"), v117);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "minValue:maxValue:", 0.0, 100.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "px_increment:", 1.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v165[3] = v114;
  v12 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotationAngle);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Rotation Angle"), v113);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "minValue:maxValue:", 0.0, 45.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "px_increment:", 1.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v165[4] = v110;
  v13 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_applyRotationToFirstAndLast);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Rotate First/Last"), v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v165[5] = v108;
  v14 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDebugTapbacksStack);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Debug Tapbacks"), v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v165[6] = v106;
  v15 = (void *)MEMORY[0x1E0D83068];
  NSStringFromSelector(sel_horizontalOffsetString);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Offset"), v105);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v165[7] = v104;
  v16 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_stackShadowYOffset);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Y"), v103);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "minValue:maxValue:", 0.0, 20.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "px_increment:", 1.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v165[8] = v100;
  v17 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_stackShadowBlurRadius);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius"), v99);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 0.0, 50.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "px_increment:", 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v165[9] = v20;
  v21 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_stackShadowAlpha);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Alpha"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue:maxValue:", 0.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "px_increment:", 0.05);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v165[10] = v25;
  v26 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_renderWithCA);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Use CoreAnimation"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v165[11] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "sectionWithRows:title:", v29, CFSTR("Static Params"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v144 = (void *)MEMORY[0x1E0D830B8];
  v30 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_normalizedPageWidth);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Page Width"), v152);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "minValue:maxValue:", 0.1, 2.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "px_increment:", 0.1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v164[0] = v32;
  v33 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_pagingBehavior);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Page Settling"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "possibleValues:titles:", &unk_1E53E8670, &unk_1E53E8688);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v164[1] = v36;
  v37 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_pagingVelocityThreshold);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("Paging Velocity"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", 0.1, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "px_increment:", 0.05);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v164[2] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "sectionWithRows:title:", v42, CFSTR("Dynamic Params"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x1E0D830B8];
  v44 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_aspectTilesEnabled);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rowWithTitle:valueKeyPath:", CFSTR("Aspect tiles"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v46;
  v47 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_bestCropRectEnabled);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rowWithTitle:valueKeyPath:", CFSTR("Smart Crop"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v163[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sectionWithRows:title:", v50, CFSTR("Content Display"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = (void *)MEMORY[0x1E0D830B8];
  v51 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_gridShadowXOffset);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rowWithTitle:valueKeyPath:", CFSTR("Shadow X"), v153);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "minValue:maxValue:", -20.0, 20.0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "px_increment:", 1.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v141;
  v52 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_gridShadowYOffset);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Y"), v138);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "minValue:maxValue:", -20.0, 20.0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "px_increment:", 1.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v162[1] = v128;
  v53 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_gridShadowBlurRadius);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius"), v126);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "minValue:maxValue:", 0.0, 50.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "px_increment:", 1.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v162[2] = v56;
  v57 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_gridShadowAlpha);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Alpha"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "minValue:maxValue:", 0.0, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "px_increment:", 0.05);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v162[3] = v61;
  v62 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDebugTapbacksGrid);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rowWithTitle:valueKeyPath:", CFSTR("Debug Tapbacks"), v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v162[4] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "sectionWithRows:title:", v65, CFSTR("Grid"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = (void *)MEMORY[0x1E0D83078];
  v66 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_transitionItemsCount);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Items Count"), v154);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "minValue:maxValue:", 0.0, 4.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "px_increment:", 1.0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = v142;
  v67 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_transitionDuration);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Duration"), v139);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "minValue:maxValue:", 0.3, 4.0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "px_increment:", 0.1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v161[1] = v68;
  v69 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_transitionSpringDamping);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowWithTitle:valueKeyPath:", CFSTR("Spring Damping"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "minValue:maxValue:", 0.0, 1.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "px_increment:", 0.1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v161[2] = v73;
  v74 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_transitionSpringVelocity);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rowWithTitle:valueKeyPath:", CFSTR("Spring Velocity"), v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "minValue:maxValue:", 0.0, 1.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "px_increment:", 0.1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v161[3] = v78;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "sectionWithRows:title:", v79, CFSTR("Transition"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, a1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PXMessagesUISettings_UI__settingsControllerModule__block_invoke;
  aBlock[3] = &unk_1E5118408;
  objc_copyWeak(&v156, &location);
  v80 = _Block_copy(aBlock);
  v81 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Show Stack"), v80);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v160, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "sectionWithRows:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = (void *)MEMORY[0x1E0D83078];
  v86 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:action:", CFSTR("Restore Defaults"), v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v88;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v159, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "sectionWithRows:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = (void *)MEMORY[0x1E0D83078];
  v158[0] = v84;
  v158[1] = v98;
  v158[2] = v97;
  v158[3] = v124;
  v158[4] = v122;
  v158[5] = v120;
  v158[6] = v130;
  v158[7] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 8);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "moduleWithTitle:contents:", CFSTR("MessagesUI"), v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v156);
  objc_destroyWeak(&location);

  return v93;
}

+ (id)_assetCollectionItemProvider
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PXDiagnosticsController sharedController](PXDiagnosticsController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection"), (_QWORD)v12))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (void)_showStackBalloonViewWithNavigationController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXFileBackedUIMediaProvider *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  PXFileBackedAssetActionManager *v23;
  PXMessagesStackBalloonViewController *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataSourceType");
  if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pathManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v18, "temporaryFileBackedDebugDirectoryCreateIfNeeded:error:", 0, &v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXFileBackedAssetsDataSourceManager fileBackedDataSourceManagerWithDirectory:](PXFileBackedAssetsDataSourceManager, "fileBackedDataSourceManagerWithDirectory:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc_init(PXFileBackedUIMediaProvider);
      v22 = objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v14);
      v23 = -[PXFileBackedAssetActionManager initWithSelectionManager:]([PXFileBackedAssetActionManager alloc], "initWithSelectionManager:", v22);
    }
    else
    {
      PLUIGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v20;
        _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Unable to get file backed directory for app library with error: %@", buf, 0xCu);
      }
      v23 = 0;
      v16 = 0;
      v14 = 0;
    }

    if (!v14)
      goto LABEL_17;
  }
  else
  {
    if (v6)
    {
      v14 = 0;
      v16 = 0;
      v23 = 0;
LABEL_17:
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("No PHAssetCollection found"), CFSTR("Please navigate to a view of a valid asset collection in the Photos app UI"), 1);
      v24 = (PXMessagesStackBalloonViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMessagesStackBalloonViewController addAction:](v24, "addAction:", v25);

      objc_msgSend(v4, "presentViewController:animated:completion:", v24, 1, 0);
      goto LABEL_18;
    }
    objc_msgSend(a1, "_assetCollectionItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v9, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "librarySpecificFetchOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchAssetsInAssetCollection:options:", v9, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v26) = 0;
      +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:", v9, v13, 0, 0, 0, 0, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v15);
      v16 = (PXFileBackedUIMediaProvider *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
      v14 = 0;
    }

    v23 = 0;
    if (!v14)
      goto LABEL_17;
  }
  if (!v16)
    goto LABEL_17;
  v24 = -[PXMessagesStackBalloonViewController initWithDataSourceManager:mediaProvider:]([PXMessagesStackBalloonViewController alloc], "initWithDataSourceManager:mediaProvider:", v14, v16);
  -[PXMessagesStackBalloonViewController setAssetActionManager:](v24, "setAssetActionManager:", v23);
  objc_msgSend(v4, "pushViewController:animated:", v24, 1);
LABEL_18:

}

void __52__PXMessagesUISettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_showStackBalloonViewWithNavigationController:", v3);

}

@end
