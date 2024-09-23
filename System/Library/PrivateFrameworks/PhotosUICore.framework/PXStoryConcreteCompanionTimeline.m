@implementation PXStoryConcreteCompanionTimeline

- (PXStoryConcreteCompanionTimeline)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteCompanionTimeline.m"), 64, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteCompanionTimeline init]");

  abort();
}

- (PXStoryConcreteCompanionTimeline)initWithTimeline:(id)a3 colorGradeKind:(int64_t)a4 colorGradingRepository:(id)a5
{
  id v9;
  id v10;
  PXStoryConcreteCompanionTimeline *v11;
  PXStoryConcreteCompanionTimeline *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteCompanionTimeline;
  v11 = -[PXStoryConcreteCompanionTimeline init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timeline, a3);
    v12->_colorGradeKind = a4;
    objc_storeStrong((id *)&v12->_colorGradingRepository, a5);
  }

  return v12;
}

- (int64_t)numberOfSegments
{
  void *v2;
  int64_t v3;

  -[PXStoryConcreteCompanionTimeline timeline](self, "timeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSegments");

  return v3;
}

- (id)segmentAtIndex:(int64_t)a3
{
  _PXStoryConcreteCompanionTimelineSegment *v5;
  void *v6;
  _PXStoryConcreteCompanionTimelineSegment *v7;

  v5 = [_PXStoryConcreteCompanionTimelineSegment alloc];
  -[PXStoryConcreteCompanionTimeline timeline](self, "timeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_PXStoryConcreteCompanionTimelineSegment initWithTimeline:segmentIndex:](v5, "initWithTimeline:segmentIndex:", v6, a3);

  return v7;
}

- (PXStoryCompanionColorEffect)colorGradingEffect
{
  void *v3;
  void *v4;
  _PXStoryConcreteCompanionColorEffect *v5;

  -[PXStoryConcreteCompanionTimeline colorGradingRepository](self, "colorGradingRepository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorLookupCubeForColorGradeKind:", -[PXStoryConcreteCompanionTimeline colorGradeKind](self, "colorGradeKind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[_PXStoryConcreteCompanionColorEffect initWithColorLookupCube:]([_PXStoryConcreteCompanionColorEffect alloc], "initWithColorLookupCube:", v4);
  return (PXStoryCompanionColorEffect *)v5;
}

- (NSString)diagnosticDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteCompanionTimeline timeline](self, "timeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "diagnosticDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteCompanionTimeline colorGradeKind](self, "colorGradeKind");
  PFStoryColorGradeKindToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteCompanionTimeline colorGradingRepository](self, "colorGradingRepository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, timeline=%@, colorGradeKind=%@, colorGradingRepository=%@>"), v5, self, v7, v8, v9);

  return (NSString *)v10;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (int64_t)colorGradeKind
{
  return self->_colorGradeKind;
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
