@implementation _PXStoryDefaultStyleProducer

- (_PXStoryDefaultStyleProducer)initWithStoryConfiguration:(id)a3
{
  id v5;
  _PXStoryDefaultStyleProducer *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PXStoryDefaultStyleProducer;
  v6 = -[_PXStoryDefaultStyleProducer init](&v8, sel_init);
  if (v6)
  {
    v6->_thumbnailOnly = (objc_msgSend(v5, "options") & 2) != 0;
    objc_storeStrong((id *)&v6->_storyConfiguration, a3);
  }

  return v6;
}

- (id)styleWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  PXStoryConcreteThumbnailOnlyStyle *v18;
  id v19;
  PXStoryConcreteStyle *v20;
  uint64_t v22;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (self->_thumbnailOnly)
  {
    v17 = a4;
    v18 = -[PXStoryConcreteThumbnailOnlyStyle initWithCustomColorGradeKind:originalColorGradeCategory:]([PXStoryConcreteThumbnailOnlyStyle alloc], "initWithCustomColorGradeKind:originalColorGradeCategory:", a3, v17);
  }
  else
  {
    v19 = a4;
    v20 = [PXStoryConcreteStyle alloc];
    -[_PXStoryDefaultStyleProducer storyConfiguration](self, "storyConfiguration");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = a9;
    v18 = -[PXStoryConcreteStyle initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:](v20, "initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:", a3, v19, v14, v15, v16, a8.var0, *(_QWORD *)&a8.var1, v22, v17);

  }
  return v18;
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
}

@end
