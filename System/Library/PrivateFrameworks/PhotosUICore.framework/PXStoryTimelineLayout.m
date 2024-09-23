@implementation PXStoryTimelineLayout

- (PXStoryTimelineLayout)init
{
  PXStoryTimelineLayout *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *clipIdentifiers;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *clipLayoutReuseIdentifiers;
  NSMutableDictionary *v7;
  NSMutableDictionary *clipLayoutReuseIdentifiersByClipIdentifier;
  id v9;
  uint64_t v10;
  NSIndexSet *supportedResourceKindsForClipLayouts;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStoryTimelineLayout;
  v2 = -[PXGAbsoluteCompositeLayout init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    clipIdentifiers = v2->_clipIdentifiers;
    v2->_clipIdentifiers = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    clipLayoutReuseIdentifiers = v2->_clipLayoutReuseIdentifiers;
    v2->_clipLayoutReuseIdentifiers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clipLayoutReuseIdentifiersByClipIdentifier = v2->_clipLayoutReuseIdentifiersByClipIdentifier;
    v2->_clipLayoutReuseIdentifiersByClipIdentifier = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v9, "addIndex:", 1);
    objc_msgSend(v9, "addIndex:", 3);
    objc_msgSend(v9, "addIndex:", 4);
    objc_msgSend(v9, "addIndex:", 5);
    v10 = objc_msgSend(v9, "copy");
    supportedResourceKindsForClipLayouts = v2->_supportedResourceKindsForClipLayouts;
    v2->_supportedResourceKindsForClipLayouts = (NSIndexSet *)v10;

  }
  return v2;
}

- (void)setDisplayedTimeline:(id)a3
{
  PXStoryTimeline *v5;
  char v6;
  PXStoryTimeline *v7;

  v7 = (PXStoryTimeline *)a3;
  v5 = self->_displayedTimeline;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryTimeline isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedTimeline, a3);
      -[PXStoryTimelineLayout displayedTimelineDidChange](self, "displayedTimelineDidChange");
    }
  }

}

- (void)setDisplayedTimeRange:(id *)a3
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_displayedTimeRange;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range1;

  p_displayedTimeRange = &self->_displayedTimeRange;
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = *(_OWORD *)&self->_displayedTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_displayedTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_displayedTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    v8 = *(_OWORD *)&a3->var0.var0;
    v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_displayedTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_displayedTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_displayedTimeRange->start.value = v8;
    -[PXStoryTimelineLayout displayedTimeRangeDidChange](self, "displayedTimeRangeDidChange");
  }
}

- (void)setDisplayedTimelineRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_displayedTimelineRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_displayedTimelineRect = &self->_displayedTimelineRect;
  if (!CGRectEqualToRect(a3, self->_displayedTimelineRect))
  {
    p_displayedTimelineRect->origin.x = x;
    p_displayedTimelineRect->origin.y = y;
    p_displayedTimelineRect->size.width = width;
    p_displayedTimelineRect->size.height = height;
    -[PXStoryTimelineLayout displayedTimelineRectDidChange](self, "displayedTimelineRectDidChange");
  }
}

- (void)willUpdateTimelineContent
{
  self->_isUpdatingTimelineContent = 1;
}

- (void)didUpdateTimelineContent
{
  self->_isUpdatingTimelineContent = 0;
}

- (void)setPresentedTimelineTransition:(id)a3
{
  PXStoryViewModeTransition **p_presentedTimelineTransition;
  PXStoryViewModeTransition *v6;
  char v7;
  PXStoryViewModeTransition *v8;

  v8 = (PXStoryViewModeTransition *)a3;
  p_presentedTimelineTransition = &self->_presentedTimelineTransition;
  v6 = self->_presentedTimelineTransition;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXStoryViewModeTransition isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryViewModeTransition unregisterChangeObserver:context:](*p_presentedTimelineTransition, "unregisterChangeObserver:context:", self, TimelineTransitionObservationContext);
      objc_storeStrong((id *)&self->_presentedTimelineTransition, a3);
      -[PXStoryViewModeTransition registerChangeObserver:context:](*p_presentedTimelineTransition, "registerChangeObserver:context:", self, TimelineTransitionObservationContext);
      -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (v3 != self->_cornerRadius.var0.var0.topLeft
    || v4 != self->_cornerRadius.var0.var0.topRight
    || v5 != self->_cornerRadius.var0.var0.bottomLeft
    || v6 != self->_cornerRadius.var0.var0.bottomRight)
  {
    self->_cornerRadius.var0.var0.topLeft = v3;
    self->_cornerRadius.var0.var0.topRight = v4;
    self->_cornerRadius.var0.var0.bottomLeft = v5;
    self->_cornerRadius.var0.var0.bottomRight = v6;
    -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (void)setClipsCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (v3 != self->_clipsCornerRadius.var0.var0.topLeft
    || v4 != self->_clipsCornerRadius.var0.var0.topRight
    || v5 != self->_clipsCornerRadius.var0.var0.bottomLeft
    || v6 != self->_clipsCornerRadius.var0.var0.bottomRight)
  {
    self->_clipsCornerRadius.var0.var0.topLeft = v3;
    self->_clipsCornerRadius.var0.var0.topRight = v4;
    self->_clipsCornerRadius.var0.var0.bottomLeft = v5;
    self->_clipsCornerRadius.var0.var0.bottomRight = v6;
    -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (void)setClippingInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_clippingInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_clippingInsets = &self->_clippingInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_clippingInsets->top = top;
    p_clippingInsets->left = left;
    p_clippingInsets->bottom = bottom;
    p_clippingInsets->right = right;
    -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineLayout;
  -[PXGCompositeLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent");
}

- (void)didUpdateClipLayout:(id)a3 frame:(CGRect)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalSize");
  objc_msgSend(v5, "setDisplayedTimelineOriginalSize:");

}

- (PXStoryTimelineLayoutSnapshot)presentedSnapshot
{
  PXStoryTimelineLayoutSnapshot *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  PXStoryTimelineLayoutSnapshot *v21;
  uint64_t v23;

  v3 = [PXStoryTimelineLayoutSnapshot alloc];
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineLayout displayedTimelineRect](self, "displayedTimelineRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXStoryTimelineLayout displayedTimeRange](self, "displayedTimeRange");
  -[PXStoryTimelineLayout clipsCornerRadius](self, "clipsCornerRadius");
  LODWORD(v14) = v13;
  LODWORD(v16) = v15;
  LODWORD(v18) = v17;
  LODWORD(v20) = v19;
  v21 = -[PXStoryTimelineLayoutSnapshot initWithTimeline:timelineRect:timeRange:clipCornerRadius:](v3, "initWithTimeline:timelineRect:timeRange:clipCornerRadius:", v4, &v23, v6, v8, v10, v12, v14, v16, v18, v20);

  return v21;
}

- (int64_t)viewMode
{
  return 100;
}

- (BOOL)shouldSetContentSizeToReferenceSize
{
  return 1;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryTimelineLayout;
  -[PXGCompositeLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryTimelineLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryTimelineLayout.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryTimelineLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryTimelineLayout.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryTimelineLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryTimelineLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryTimelineLayout.m"), 190, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryTimelineLayout;
  -[PXGCompositeLayout update](&v9, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryTimelineLayout;
  -[PXGCompositeLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryTimelineLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryTimelineLayout.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

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
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryTimelineLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryTimelineLayout.m"), 200, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  int64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  int v74;
  id v75;
  id v76;
  id v78;
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[4];
  id v82;
  PXStoryTimelineLayout *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  SEL v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
  uint64_t v95;
  int64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  BOOL v109;
  char v110;
  uint8_t buf[16];
  __int128 v112;
  __int128 v113;
  _QWORD v114[5];
  id v115;
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  _QWORD aBlock[5];
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;

  -[PXStoryTimelineLayout willUpdateTimelineContent](self, "willUpdateTimelineContent");
  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  if (-[PXStoryTimelineLayout shouldSetContentSizeToReferenceSize](self, "shouldSetContentSizeToReferenceSize"))
  {
    -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v4, v6);
    v7 = 0;
    v8 = 0;
  }
  else
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    PXRectWithOriginAndSize();
    v7 = v9;
    v8 = v10;
    v4 = v11;
    v6 = v12;
  }
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v122 = 0u;
  -[PXStoryTimelineLayout displayedTimeRange](self, "displayedTimeRange");
  -[PXStoryTimelineLayout displayedTimelineRect](self, "displayedTimelineRect");
  v59 = v15;
  v60 = v14;
  v57 = v17;
  v58 = v16;
  -[PXStoryTimelineLayout cornerRadius](self, "cornerRadius");
  v73 = v19;
  v74 = v18;
  v71 = v21;
  v72 = v20;
  -[PXStoryTimelineLayout clipsCornerRadius](self, "clipsCornerRadius");
  v68 = v23;
  v69 = v22;
  v66 = v25;
  v67 = v24;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v70 = v26;
  -[PXStoryTimelineLayout clippingInsets](self, "clippingInsets");
  v65 = PXEdgeInsetsEqualToEdgeInsets() ^ 1;
  PXEdgeInsetsInsetRect();
  v63 = v28;
  v64 = v27;
  v61 = v30;
  v62 = v29;
  -[PXStoryTimelineLayout presentedTimelineTransition](self, "presentedTimelineTransition");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[PXStoryTimelineLayout viewMode](self, "viewMode");
  -[PXStoryTimelineLayout supportedResourceKindsForClipLayouts](self, "supportedResourceKindsForClipLayouts");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)-[NSMutableIndexSet mutableCopy](self->_clipIdentifiers, "mutableCopy");
  v33 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[NSMutableOrderedSet set](self->_clipLayoutReuseIdentifiers, "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v33, "initWithSet:", v34);

  v35 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke;
  aBlock[3] = &unk_1E512B550;
  aBlock[4] = self;
  v36 = v13;
  v121 = v36;
  v37 = _Block_copy(aBlock);
  v118[0] = v35;
  v118[1] = 3221225472;
  v118[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke_2;
  v118[3] = &unk_1E512B578;
  v78 = v32;
  v119 = v78;
  v38 = _Block_copy(v118);
  v39 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[NSMutableOrderedSet set](self->_clipLayoutReuseIdentifiers, "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v39, "initWithSet:", v40);

  v114[0] = v35;
  v114[1] = 3221225472;
  v114[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke_3;
  v114[3] = &unk_1E512B5A0;
  v42 = v38;
  v116 = v42;
  v43 = v37;
  v117 = v43;
  v114[4] = self;
  v44 = v41;
  v115 = v44;
  *(_OWORD *)buf = v122;
  v112 = v123;
  v113 = v124;
  objc_msgSend(v36, "enumerateClipsInTimeRange:rect:usingBlock:", buf, v114, v60, v59, v58, v57);
  v81[0] = v35;
  v81[1] = 3221225472;
  v81[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke_4;
  v81[3] = &unk_1E512B5F0;
  v76 = v42;
  v88 = v76;
  v45 = v36;
  v82 = v45;
  v83 = self;
  v75 = v43;
  v89 = v75;
  v46 = v44;
  v84 = v46;
  v90 = a2;
  v47 = v54;
  v85 = v47;
  v101 = v69;
  v102 = v68;
  v103 = v67;
  v104 = v66;
  v105 = v74;
  v106 = v73;
  v107 = v72;
  v108 = v71;
  v91 = v7;
  v92 = v8;
  v93 = v4;
  v94 = v6;
  v95 = v70;
  v109 = v31 != 0;
  v48 = v31;
  v86 = v48;
  v96 = v56;
  v110 = v65;
  v97 = v64;
  v98 = v63;
  v99 = v62;
  v100 = v61;
  v49 = v55;
  v87 = v49;
  *(_OWORD *)buf = v122;
  v112 = v123;
  v113 = v124;
  objc_msgSend(v45, "enumerateClipsInTimeRange:rect:usingBlock:", buf, v81, v60, v59, v58, v57);
  v80[0] = v35;
  v80[1] = 3221225472;
  v80[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke_6;
  v80[3] = &unk_1E512B618;
  v80[4] = self;
  objc_msgSend(v47, "enumerateObjectsUsingBlock:", v80);
  v79[0] = v35;
  v79[1] = 3221225472;
  v79[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke_7;
  v79[3] = &unk_1E5148928;
  v79[4] = self;
  objc_msgSend(v49, "enumerateIndexesUsingBlock:", v79);
  -[NSMutableIndexSet removeIndexes:](self->_clipIdentifiers, "removeIndexes:", v49);
  v50 = -[NSMutableIndexSet count](self->_clipIdentifiers, "count");
  if (v50 != -[NSMutableOrderedSet count](self->_clipLayoutReuseIdentifiers, "count"))
  {
    PXAssertGetLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v51, OS_LOG_TYPE_ERROR, "Should have one reuse identifier per clip", buf, 2u);
    }

  }
  v52 = -[NSMutableIndexSet count](self->_clipIdentifiers, "count");
  if (v52 != -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts"))
  {
    PXAssertGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v53, OS_LOG_TYPE_ERROR, "Should have one layout per clip", buf, 2u);
    }

  }
  -[PXStoryTimelineLayout didUpdateTimelineContent](self, "didUpdateTimelineContent");

}

- (void)enumerateClipLayouts:(id)a3
{
  id v4;
  NSMutableIndexSet *clipIdentifiers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clipIdentifiers = self->_clipIdentifiers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PXStoryTimelineLayout_enumerateClipLayouts___block_invoke;
  v7[3] = &unk_1E5144C48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](clipIdentifiers, "enumerateIndexesUsingBlock:", v7);

}

- (id)existingLayoutForClipWithIdentifier:(int64_t)a3
{
  int64_t v4;
  void *v5;

  v4 = -[PXStoryTimelineLayout _sublayoutIndexForClipWithIdentifier:](self, "_sublayoutIndexForClipWithIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (double)proposedZPositionForClipLayoutWithClipIdentifier:(int64_t)a3
{
  return -0.100000001;
}

- (int64_t)_sublayoutIndexForClipWithIdentifier:(int64_t)a3
{
  NSMutableDictionary *clipLayoutReuseIdentifiersByClipIdentifier;
  void *v5;
  void *v6;
  int64_t v7;

  clipLayoutReuseIdentifiersByClipIdentifier = self->_clipLayoutReuseIdentifiersByClipIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](clipLayoutReuseIdentifiersByClipIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NSMutableOrderedSet indexOfObject:](self->_clipLayoutReuseIdentifiers, "indexOfObject:", v6);
  return v7;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "diagnosticDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n\n%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DisplayedTimeline-%p"), self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachmentWithText:name:", v7, v8);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)TimelineTransitionObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineLayout.m"), 417, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0 && !self->_isUpdatingTimelineContent)
  {
    v11 = v9;
    -[PXStoryTimelineLayout _invalidateContent](self, "_invalidateContent");
    v9 = v11;
  }

}

- (NSIndexSet)supportedResourceKindsForClipLayouts
{
  return self->_supportedResourceKindsForClipLayouts;
}

- (PXStoryTimeline)displayedTimeline
{
  return self->_displayedTimeline;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)displayedTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[25].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[24].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[25].var0.var3;
  return self;
}

- (CGRect)displayedTimelineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_displayedTimelineRect.origin.x;
  y = self->_displayedTimelineRect.origin.y;
  width = self->_displayedTimelineRect.size.width;
  height = self->_displayedTimelineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)clipsCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (UIEdgeInsets)clippingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_clippingInsets.top;
  left = self->_clippingInsets.left;
  bottom = self->_clippingInsets.bottom;
  right = self->_clippingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (PXStoryViewModeTransition)presentedTimelineTransition
{
  return self->_presentedTimelineTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedTimelineTransition, 0);
  objc_storeStrong((id *)&self->_displayedTimeline, 0);
  objc_storeStrong((id *)&self->_supportedResourceKindsForClipLayouts, 0);
  objc_storeStrong((id *)&self->_clipLayoutReuseIdentifiersByClipIdentifier, 0);
  objc_storeStrong((id *)&self->_clipLayoutReuseIdentifiers, 0);
  objc_storeStrong((id *)&self->_clipIdentifiers, 0);
}

void __46__PXStoryTimelineLayout_enumerateClipLayouts___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "existingLayoutForClipWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

PXStoryClipLayoutReuseIdentifier *__39__PXStoryTimelineLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  PXStoryClipLayoutReuseIdentifier *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (PXStoryClipLayoutReuseIdentifier *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "clipWithIdentifier:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXStoryClipLayoutReuseIdentifier initWithClip:]([PXStoryClipLayoutReuseIdentifier alloc], "initWithClip:", v7);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  }
  return v6;
}

uint64_t __39__PXStoryTimelineLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", *(_QWORD *)(a2 + 8));
}

void __39__PXStoryTimelineLayout__updateContent__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  unsigned int (*v11)(uint64_t, uint64_t *);
  void *v12;
  uint64_t v13;
  _BYTE v14[760];
  uint64_t v15;
  uint64_t v16;

  if (a2 >= 1)
  {
    v15 = v5;
    v16 = v6;
    v7 = a2;
    v9 = (_QWORD *)(a5 + 8);
    do
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(unsigned int (**)(uint64_t, uint64_t *))(v10 + 16);
      v13 = *(v9 - 1);
      memcpy(v14, v9, sizeof(v14));
      if (v11(v10, &v13))
      {
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "indexOfObject:", v12, v13) != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(*(id *)(a1 + 40), "removeObject:", v12);

      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

void __39__PXStoryTimelineLayout__updateContent__block_invoke_4(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD *v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t *);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  PXStoryClipLayout *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  float v76;
  float v77;
  float v78;
  float v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  float v119;
  float v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  _OWORD *v126;
  float v127;
  float v128;
  _QWORD v129[3];
  __int128 v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  _OWORD v136[3];
  _QWORD v137[4];
  id v138;
  uint64_t v139;
  uint64_t v140;
  _BYTE v141[752];
  _BYTE __dst[752];
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;

  if (a2 >= 1)
  {
    v143 = v14;
    v144 = v13;
    v145 = v12;
    v146 = v11;
    v147 = v10;
    v148 = v9;
    v149 = v8;
    v150 = v7;
    v151 = v5;
    v152 = v6;
    v16 = a2;
    v111 = *((double *)off_1E50B8020 + 1);
    v112 = *(double *)off_1E50B8020;
    v109 = *((double *)off_1E50B8020 + 3);
    v110 = *((double *)off_1E50B8020 + 2);
    v18 = (_QWORD *)(a5 + 16);
    v19 = (double *)(a4 + 16);
    do
    {
      v21 = *(v18 - 2);
      v20 = *(v18 - 1);
      memcpy(__dst, v18, sizeof(__dst));
      v22 = *(_QWORD *)(a1 + 80);
      v23 = *(unsigned int (**)(uint64_t, uint64_t *))(v22 + 16);
      v139 = v21;
      v140 = v20;
      memcpy(v141, v18, sizeof(v141));
      if (v23(v22, &v139))
      {
        v126 = a3;
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = v21;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "addIndex:", v21);
        (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "indexOfObject:", v25);
        v121 = (void *)v25;
        v122 = v16;
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v27 = (void *)v25;
          v28 = *(void **)(a1 + 48);
          v137[0] = MEMORY[0x1E0C809B0];
          v137[1] = 3221225472;
          v137[2] = __39__PXStoryTimelineLayout__updateContent__block_invoke_5;
          v137[3] = &unk_1E512B5C8;
          v29 = v27;
          v138 = v29;
          objc_msgSend(v28, "objectsPassingTest:", v137);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "anyObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v32 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "indexOfObject:", v31);
            if (v32 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40), CFSTR("PXStoryTimelineLayout.m"), 284, CFSTR("Should be able to find a sublayout for a near match identifier"));

            }
            objc_msgSend(*(id *)(a1 + 40), "sublayoutAtIndex:loadIfNeeded:", v32, 0);
            v33 = (PXStoryClipLayout *)objc_claimAutoreleasedReturnValue();
            v113 = v32;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "replaceObjectAtIndex:withObject:", v32, v29);
            objc_msgSend(*(id *)(a1 + 48), "removeObject:", v31);
            objc_msgSend(*(id *)(a1 + 56), "removeObject:", v31);
          }
          else
          {
            v33 = objc_alloc_init(PXStoryClipLayout);
            -[PXStoryClipLayout setTimelineLayout:](v33, "setTimelineLayout:", *(_QWORD *)(a1 + 40));
            objc_msgSend(*(id *)(a1 + 40), "configureClipLayout:", v33);
            v36 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "count");
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "addObject:", v29);
            v113 = v36;
            objc_msgSend(*(id *)(a1 + 40), "insertSublayout:atIndex:", v33, v36);
          }

        }
        else
        {
          v34 = v26;
          objc_msgSend(*(id *)(a1 + 40), "sublayoutAtIndex:loadIfNeeded:", v26, 0);
          v33 = (PXStoryClipLayout *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "objectAtIndexedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35 != (void *)v25)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "replaceObjectAtIndex:withObject:", v34, v25);
          v113 = v34;
          objc_msgSend(*(id *)(a1 + 48), "removeObject:", v25);
        }
        v37 = v21;
        -[PXStoryClipLayout setClip:](v33, "setClip:", v24);
        v38 = v126[1];
        v136[0] = *v126;
        v136[1] = v38;
        v136[2] = v126[2];
        -[PXStoryClipLayout setClipTimeRange:](v33, "setClipTimeRange:", v136);
        v40 = *(v19 - 2);
        v39 = *(v19 - 1);
        v42 = *v19;
        v41 = v19[1];
        objc_msgSend(*(id *)(a1 + 40), "alphaForClipLayout:", v33);
        v44 = v43;
        if (v20 == 3)
        {
          v45 = *(float *)(a1 + 184);
          v46 = *(float *)(a1 + 188);
          v127 = *(float *)(a1 + 192);
          v47 = *(float *)(a1 + 196);
        }
        else
        {
          v108 = *(_QWORD *)(a1 + 128);
          v107 = *(_OWORD *)(a1 + 112);
          v106 = *(_QWORD *)(a1 + 104);
          PXGCornerRadiusForSubrectFromContainerCornerRadiusAndRect();
          v45 = fmaxf(*(float *)(a1 + 184), v48);
          v46 = fmaxf(*(float *)(a1 + 188), v49);
          v127 = fmaxf(*(float *)(a1 + 192), v50);
          v47 = fmaxf(*(float *)(a1 + 196), v51);
        }
        v128 = v47;
        objc_msgSend(*(id *)(a1 + 40), "proposedZPositionForClipLayoutWithClipIdentifier:", v21, v106, v107, v108);
        v53 = v52 * *(double *)(a1 + 136);
        if (*(_BYTE *)(a1 + 216))
        {
          v54 = *(void **)(a1 + 64);
          v55 = *(_QWORD *)(a1 + 144);
          v56 = *(_QWORD *)(a1 + 40);
          v139 = v123;
          v140 = v20;
          memcpy(v141, __dst, sizeof(v141));
          objc_msgSend(v54, "frameForClipWithInfo:proposedFrame:inViewMode:layout:", &v139, v55, v56, v40, v39, v42, v41);
          v40 = v57;
          v39 = v58;
          v42 = v59;
          v41 = v60;
          v61 = *(void **)(a1 + 64);
          v62 = *(_QWORD *)(a1 + 144);
          v63 = *(_QWORD *)(a1 + 40);
          v139 = v123;
          v140 = v20;
          memcpy(v141, __dst, sizeof(v141));
          objc_msgSend(v61, "alphaForClipWithInfo:proposedAlpha:inViewMode:layout:", &v139, v62, v63, v44);
          v44 = v64;
          v65 = *(void **)(a1 + 64);
          v66 = *(_QWORD *)(a1 + 144);
          v67 = *(_QWORD *)(a1 + 40);
          v139 = v123;
          v140 = v20;
          memcpy(v141, __dst, sizeof(v141));
          objc_msgSend(v65, "zPositionForClipWithInfo:proposedZPosition:inViewMode:layout:", &v139, v66, v67, v53);
          v53 = v68;
          v69 = *(void **)(a1 + 64);
          v70 = *(_QWORD *)(a1 + 144);
          v71 = *(_QWORD *)(a1 + 40);
          v139 = v123;
          v140 = v20;
          memcpy(v141, __dst, sizeof(v141));
          *(float *)&v72 = v45;
          *(float *)&v73 = v46;
          *(float *)&v74 = v127;
          *(float *)&v75 = v128;
          objc_msgSend(v69, "cornerRadiusForClipWithInfo:proposedCornerRadius:inViewMode:layout:", &v139, v70, v71, v72, v73, v74, v75);
          v45 = v76;
          v46 = v77;
          v127 = v78;
          v128 = v79;
          v80 = *(void **)(a1 + 64);
          if (v80)
          {
            v81 = *(_QWORD *)(a1 + 40);
            v82 = *(_QWORD *)(a1 + 144);
            v139 = v123;
            v140 = v20;
            memcpy(v141, __dst, sizeof(v141));
            memset(v129, 0, sizeof(v129));
            __asm { FMOV            V0.2D, #1.0 }
            v130 = _Q0;
            objc_msgSend(v80, "contentsTransformOverrideForClipWithInfo:proposedOverride:inViewMode:layout:", &v139, v129, v82, v81);
            v114 = v131;
            v115 = v132;
            v116 = v134;
            v117 = v133;
            v118 = v135;
          }
          else
          {
            v117 = 0.0;
            v118 = 0.0;
            v115 = 0.0;
            v116 = 0.0;
            v114 = 0.0;
          }
          v37 = v123;
        }
        else
        {
          v117 = 0.0;
          v118 = 1.0;
          v115 = 0.0;
          v116 = 1.0;
          v114 = 0.0;
        }
        v119 = v46;
        v120 = v45;
        v124 = v53;
        v125 = v44;
        if (*(_BYTE *)(a1 + 217))
        {
          PXEdgeInsetsBetweenRects();
          v88 = v41;
          v90 = v89;
          v92 = v91;
          v94 = v93;
          v96 = v95;
        }
        else
        {
          v96 = v109;
          v94 = v110;
          v88 = v41;
          v92 = v111;
          v90 = v112;
        }
        -[PXGLayout setAlpha:](v33, "setAlpha:", v125);
        *(float *)&v98 = v119;
        *(float *)&v97 = v120;
        *(float *)&v99 = v127;
        *(float *)&v100 = v128;
        -[PXStoryClipLayout setCornerRadius:](v33, "setCornerRadius:", v97, v98, v99, v100);
        -[PXStoryClipLayout setClippingInsets:](v33, "setClippingInsets:", v90, v92, v94, v96);
        -[PXStoryClipLayout setManualContentsRectAmount:](v33, "setManualContentsRectAmount:", v114);
        -[PXStoryClipLayout setManualContentsRect:](v33, "setManualContentsRect:", v115, v117, v116, v118);
        -[PXGLayout setReferenceDepth:](v33, "setReferenceDepth:", *(double *)(a1 + 136));
        v101 = *(double *)(a1 + 136);
        -[PXGLayout referenceDepth](v33, "referenceDepth");
        v103 = v102 / *(double *)(a1 + 136);
        objc_msgSend(*(id *)(a1 + 40), "relativeZPositionAboveLegibilityGradients");
        -[PXStoryClipLayout setRelativeZPositionAboveLegibilityGradients:](v33, "setRelativeZPositionAboveLegibilityGradients:", (v124 / v101 + v104) / v103);
        objc_msgSend(*(id *)(a1 + 40), "setZPosition:forSublayoutAtIndex:", v113, v124);
        objc_msgSend(*(id *)(a1 + 40), "setFrame:forSublayoutAtIndex:", v113, v40, v39, v42, v88);
        objc_msgSend(*(id *)(a1 + 56), "removeObject:", v121);
        objc_msgSend(*(id *)(a1 + 72), "removeIndex:", v37);
        objc_msgSend(*(id *)(a1 + 40), "didUpdateClipLayout:frame:", v33, v40, v39, v42, v88);

        v16 = v122;
        a3 = v126;
      }
      v18 += 96;
      a3 += 3;
      v19 += 4;
      --v16;
    }
    while (v16);
  }
}

uint64_t __39__PXStoryTimelineLayout__updateContent__block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "indexOfObject:", a2);
  objc_msgSend(*(id *)(a1 + 32), "removeSublayoutAtIndex:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "removeObjectAtIndex:", v3);
}

void __39__PXStoryTimelineLayout__updateContent__block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

uint64_t __39__PXStoryTimelineLayout__updateContent__block_invoke_5(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasResourceEqualTo:", *(_QWORD *)(a1 + 32));
  *a3 = result;
  return result;
}

@end
