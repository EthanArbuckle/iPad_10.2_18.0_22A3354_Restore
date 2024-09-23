@implementation PXStoryTimelineSpecManager

- (PXStoryTimelineSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineSpecManager.m"), 29, CFSTR("%s is not available as initializer"), "-[PXStoryTimelineSpecManager initWithExtendedTraitCollection:options:]");

  abort();
}

- (PXStoryTimelineSpecManager)initWithExtendedTraitCollection:(id)a3 configuration:(id)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  char v12;
  __int128 v14;
  uint64_t v15;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryTimelineSpecManager;
  v7 = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v16, sel_initWithExtendedTraitCollection_options_, a3, 0);
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "fixedSegmentDuration");
    }
    else
    {
      v14 = 0uLL;
      v15 = 0;
    }
    *((_QWORD *)v7 + 21) = v15;
    *(_OWORD *)(v7 + 152) = v14;
    *((_QWORD *)v7 + 16) = objc_msgSend(v6, "allowedInlineTitles");
    objc_msgSend(v6, "allowedTransitionKinds");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v7 + 17);
    *((_QWORD *)v7 + 17) = v8;

    objc_msgSend(v6, "launchType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("TVMemoriesScreenSaver"));

    if (v11)
      v12 = 2;
    else
      v12 = 1;
    v7[120] = v12;
    *((_QWORD *)v7 + 18) = v11;
  }

  return (PXStoryTimelineSpecManager *)v7;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXStoryTimelineSpec)timelineSpec
{
  void *v4;
  void *v5;
  void *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  -[PXFeatureSpecManager spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineSpecManager.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timelineSpec != nil"));

  }
  -[PXStoryTimelineSpecManager fixedSegmentDuration](self, "fixedSegmentDuration");
  v8 = v10;
  v9 = v11;
  objc_msgSend(v4, "setFixedSegmentDuration:", &v8);
  objc_msgSend(v4, "setAllowedInlineTitles:", -[PXStoryTimelineSpecManager allowedInlineTitles](self, "allowedInlineTitles"));
  -[PXStoryTimelineSpecManager allowedTransitionKinds](self, "allowedTransitionKinds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowedTransitionKinds:", v5);

  objc_msgSend(v4, "setFallbackTransitionKind:", -[PXStoryTimelineSpecManager fallbackTransitionKind](self, "fallbackTransitionKind"));
  objc_msgSend(v4, "setStoryTransitionCurveType:", -[PXStoryTimelineSpecManager storyTransitionCurveType](self, "storyTransitionCurveType"));
  return (PXStoryTimelineSpec *)v4;
}

- (unint64_t)defaultChangesToUpdateFor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineSpecManager;
  return -[PXFeatureSpecManager defaultChangesToUpdateFor](&v3, sel_defaultChangesToUpdateFor) | 0x10;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (unint64_t)allowedInlineTitles
{
  return self->_allowedInlineTitles;
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (unint64_t)storyTransitionCurveType
{
  return self->_storyTransitionCurveType;
}

- (char)fallbackTransitionKind
{
  return self->_fallbackTransitionKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTransitionKinds, 0);
}

@end
