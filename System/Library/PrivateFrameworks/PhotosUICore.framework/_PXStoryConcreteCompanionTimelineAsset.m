@implementation _PXStoryConcreteCompanionTimelineAsset

- (_PXStoryConcreteCompanionTimelineAsset)initWithFrame:(CGRect)a3 clip:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  _PXStoryConcreteCompanionTimelineAsset *v11;
  _PXStoryConcreteCompanionTimelineAsset *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryConcreteCompanionTimelineAsset;
  v11 = -[_PXStoryConcreteCompanionTimelineAsset init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_frame.origin.x = x;
    v11->_frame.origin.y = y;
    v11->_frame.size.width = width;
    v11->_frame.size.height = height;
    objc_storeStrong((id *)&v11->_clip, a4);
  }

  return v12;
}

- (PHAsset)photoLibraryAsset
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  -[_PXStoryConcreteCompanionTimelineAsset clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "px_storyResourceDisplayAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteCompanionTimeline.m"), 172, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteCompanionTimeline.m"), 172, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:

  return (PHAsset *)v7;
}

- (int64_t)playbackStyle
{
  void *v2;
  void *v3;
  int64_t v4;
  int64_t v6;

  -[_PXStoryConcreteCompanionTimelineAsset clip](self, "clip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = v2;
  objc_msgSend(v2, "info");
  v4 = v6;

  if ((unint64_t)(v4 - 1) >= 5)
    return 0;
  else
    return v4;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)videoTimeRange
{
  void *v4;
  void *v5;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  -[_PXStoryConcreteCompanionTimelineAsset clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "videoTimeRange");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  *(_OWORD *)&retstr->var0.var0 = v7;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = v9;

  return result;
}

- ($AD15B6C785738E514ABCC493A298F7F8)initialContentsRect
{
  void *v4;
  void *v5;
  $AD15B6C785738E514ABCC493A298F7F8 *result;
  _BYTE v7[568];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  -[_PXStoryConcreteCompanionTimelineAsset clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "info");
  else
    bzero(v7, 0x300uLL);
  v10 = *(_OWORD *)&v7[552];
  v11 = v8;
  v12 = v9;
  PXStoryCompanionRectFromPXStoryContentsRect((uint64_t)retstr);

  return result;
}

- ($AD15B6C785738E514ABCC493A298F7F8)finalContentsRect
{
  void *v4;
  void *v5;
  $AD15B6C785738E514ABCC493A298F7F8 *result;
  _BYTE v7[616];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  -[_PXStoryConcreteCompanionTimelineAsset clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "info");
  else
    bzero(v7, 0x300uLL);
  v10 = *(_OWORD *)&v7[600];
  v11 = v8;
  v12 = v9;
  PXStoryCompanionRectFromPXStoryContentsRect((uint64_t)retstr);

  return result;
}

- (PXStoryCompanionColorEffect)colorNormalizationEffect
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _PXStoryConcreteCompanionColorEffect *v8;
  _PXStoryConcreteCompanionColorEffect *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__141861;
  v21 = __Block_byref_object_dispose__141862;
  v22 = 0;
  v3 = dispatch_semaphore_create(0);
  +[PXStoryColorNormalizationCubeLibrary sharedInstance](PXStoryColorNormalizationCubeLibrary, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryConcreteCompanionTimelineAsset clip](self, "clip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorNormalization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66___PXStoryConcreteCompanionTimelineAsset_colorNormalizationEffect__block_invoke;
  v14 = &unk_1E512D080;
  v16 = &v17;
  v7 = v3;
  v15 = v7;
  objc_msgSend(v4, "requestColorCubeForAssetNormalization:completionHandler:", v6, &v11);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = [_PXStoryConcreteCompanionColorEffect alloc];
  v9 = -[_PXStoryConcreteCompanionColorEffect initWithColorLookupCube:](v8, "initWithColorLookupCube:", v18[5], v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return (PXStoryCompanionColorEffect *)v9;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PXStoryClip)clip
{
  return self->_clip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
}

@end
