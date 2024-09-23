@implementation VKCImageSubjectContext

- (VKCImageSubjectContext)initWithMaskResult:(id)a3
{
  id v5;
  VKCImageSubjectContext *v6;
  VKCImageSubjectContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCImageSubjectContext;
  v6 = -[VKCImageSubjectContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_maskResult, a3);

  return v7;
}

- (unint64_t)subjectCount
{
  void *v2;
  unint64_t v3;

  -[VKCImageSubjectContext subjectInstances](self, "subjectInstances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSNumber)animatedStickerScore
{
  void *v2;
  void *v3;

  -[VKCImageSubjectContext maskResult](self, "maskResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animatedStickerScore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (BOOL)allSubjectsSelected
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;

  -[VKCImageSubjectContext activeSubjectIndexes](self, "activeSubjectIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

  }
  else
  {
    v7 = -[VKCImageSubjectContext subjectCount](self, "subjectCount");

    if (v7)
      return 1;
  }
  -[VKCImageSubjectContext activeSubjectIndexes](self, "activeSubjectIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 == -[VKCImageSubjectContext subjectCount](self, "subjectCount");

  return v6;
}

- (CGSize)imageSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VKCImageSubjectContext allSubjectsInstance](self, "allSubjectsInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)imageOrientation
{
  void *v2;
  int64_t v3;

  -[VKCImageSubjectContext maskResult](self, "maskResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageOrientation");

  return v3;
}

- (VKCRemoveBackgroundRequest)request
{
  void *v2;
  void *v3;

  -[VKCImageSubjectContext maskResult](self, "maskResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKCRemoveBackgroundRequest *)v3;
}

- (CGRect)normalizedCropRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKCImageSubjectContext maskResult](self, "maskResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedCropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setActiveSubjectIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_activeSubjectIndexes, a3);
}

- (NSIndexSet)activeMADSubjectIndexes
{
  void *v3;
  void *v4;

  -[VKCImageSubjectContext activeSubjectIndexes](self, "activeSubjectIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectContext madSubjectIndexesForVKSubjectIndexes:](self, "madSubjectIndexesForVKSubjectIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (id)madSubjectIndexesForVKSubjectIndexes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[VKCImageSubjectContext subjectInstances](self, "subjectInstances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__VKCImageSubjectContext_madSubjectIndexesForVKSubjectIndexes___block_invoke;
  v12[3] = &unk_1E94628A0;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __63__VKCImageSubjectContext_madSubjectIndexesForVKSubjectIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3))
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "madIndex"));

}

- (NSIndexSet)allSubjectIndexes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[VKCImageSubjectContext subjectCount](self, "subjectCount"));
}

- (void)preparePathsAndImageMaskIfNecessaryWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  VKCImageSubjectContextInstance *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  -[VKCImageSubjectContext maskResult](self, "maskResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instanceMasks");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke;
  v16[3] = &unk_1E94628C8;
  v16[4] = self;
  v17 = v4;
  v7 = v4;
  objc_msgSend(v12, "vk_compactMap:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectContext setSubjectInstances:](self, "setSubjectInstances:", v8);
  v9 = objc_alloc_init(VKCImageSubjectContextInstance);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke_2;
  v13[3] = &unk_1E94628A0;
  v14 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v15 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v10 = v15;
  v11 = v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
  -[VKCImageSubjectContextInstance setBaseTopLevelNormalizedSubjectPath:](v9, "setBaseTopLevelNormalizedSubjectPath:", v11);
  -[VKCImageSubjectContextInstance setBaseNormalizedSubjectPath:](v9, "setBaseNormalizedSubjectPath:", v10);
  -[VKCImageSubjectContext imageSize](self, "imageSize");
  -[VKCImageSubjectContextInstance setImageSize:](v9, "setImageSize:");
  -[VKCImageSubjectContext setAllSubjectsInstance:](self, "setAllSubjectsInstance:", v9);

}

VKCImageSubjectContextInstance *__73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  VKCImageSubjectContextInstance *v6;
  void *v7;
  VKCImageSubjectContextInstance *v8;
  VKCImageSubjectContextInstance *v9;

  v5 = a2;
  v6 = objc_alloc_init(VKCImageSubjectContextInstance);
  -[VKCImageSubjectContextInstance setMadIndex:](v6, "setMadIndex:", a3 + 1);
  objc_msgSend(*(id *)(a1 + 32), "prepareInstanceImagesWithCIContext:instance:image:", *(_QWORD *)(a1 + 40), v6, v5);

  objc_msgSend(*(id *)(a1 + 32), "processPathForInstance:", v6);
  -[VKCImageSubjectContextInstance baseNormalizedSubjectPath](v6, "baseNormalizedSubjectPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

void __73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "baseTopLevelNormalizedSubjectPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_appendBezierPath:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "baseNormalizedSubjectPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vk_appendBezierPath:", v7);
}

- (void)prepareInstanceImagesWithCIContext:(id)a3 instance:(id)a4 image:(CGImage *)a5
{
  id v8;
  double Width;
  void *v10;
  void *v11;
  CGImage *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  Width = (double)CGImageGetWidth(a5);
  objc_msgSend(v8, "setImageSize:", Width, (double)CGImageGetHeight(a5));
  objc_msgSend(v8, "setMaskImage:", a5);
  if (-[VKCImageSubjectContext imageOrientation](self, "imageOrientation"))
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageByApplyingCGOrientation:", vk_cgImagePropertyOrientationFromVKOrientation(-[VKCImageSubjectContext imageOrientation](self, "imageOrientation")));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "imageSize");
    v12 = (CGImage *)objc_msgSend(v13, "createCGImage:fromRect:format:colorSpace:", v11, *MEMORY[0x1E0C9E000], 0, VKMRectWithSize());
    objc_msgSend(v8, "setOrientedMaskImage:", v12);
    CGImageRelease(v12);

  }
  else
  {
    objc_msgSend(v8, "setOrientedMaskImage:", a5);
  }

}

- (void)processPathForInstance:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  VKCImageSubjectContext *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v43;
  id v44;
  id v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CEDE58]);
  objc_msgSend(v5, "setDetectsDarkOnLight:", 0);
  v6 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v7 = objc_msgSend(v4, "orientedMaskImage");
  v8 = (void *)objc_msgSend(v6, "initWithCGImage:options:", v7, MEMORY[0x1E0C9AA70]);
  v46[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v8, "performRequests:error:", v9, &v45);
  v10 = v45;

  if (v10)
  {
    v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[VKCImageSubjectContext processPathForInstance:].cold.1((uint64_t)v10, v11);
  }
  else
  {
    objc_msgSend(v5, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();

    -[NSObject topLevelContours](v11, "topLevelContours");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v34 = self;
      v35 = v4;
      v33 = objc_alloc_init(MEMORY[0x1E0CEA390]);
      v13 = objc_alloc_init(MEMORY[0x1E0CEA390]);
      if (-[NSObject contourCount](v11, "contourCount") < 1)
      {
        v10 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        do
        {
          v44 = v14;
          -[NSObject contourAtIndex:error:](v11, "contourAtIndex:error:", v15, &v44);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v44;

          LODWORD(v17) = 981668463;
          objc_msgSend(v16, "polygonApproximationWithEpsilon:error:", 0, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0CEA390];
          v20 = objc_retainAutorelease(v18);
          objc_msgSend(v19, "vk_pathFromCGPath:", objc_msgSend(v20, "normalizedPath"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "vk_appendBezierPath:", v21);

          ++v15;
          v14 = v10;
        }
        while (v15 < -[NSObject contourCount](v11, "contourCount"));
      }
      v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v43.a = *MEMORY[0x1E0C9BAA8];
      v31 = *(_OWORD *)&v43.a;
      *(_OWORD *)&v43.c = v32;
      *(_OWORD *)&v43.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v30 = *(_OWORD *)&v43.tx;
      CGAffineTransformMakeScale(&t2, 1.0, -1.0);
      *(_OWORD *)&t1.a = v31;
      *(_OWORD *)&t1.c = v32;
      *(_OWORD *)&t1.tx = v30;
      CGAffineTransformConcat(&v43, &t1, &t2);
      CGAffineTransformMakeTranslation(&v40, 0.0, 1.0);
      v39 = v43;
      CGAffineTransformConcat(&t1, &v39, &v40);
      v43 = t1;
      -[VKCImageSubjectContext normalizedCropRect](v34, "normalizedCropRect");
      VKMTransformConvertingRectToRect((uint64_t)&v38, 0.0, 1.0, 1.0, v22, v23, v24, v25);
      v39 = v43;
      CGAffineTransformConcat(&t1, &v39, &v38);
      v43 = t1;
      objc_msgSend(v13, "vk_applyTransform:", &t1);
      v4 = v35;
      if ((objc_msgSend(v13, "isEmpty") & 1) == 0)
      {
        v26 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v35, "setBaseNormalizedSubjectPath:", v26);

      }
      -[NSObject topLevelContours](v11, "topLevelContours", v30, v31, v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __49__VKCImageSubjectContext_processPathForInstance___block_invoke;
      v36[3] = &unk_1E94628F0;
      v28 = v33;
      v37 = v28;
      objc_msgSend(v27, "enumerateObjectsUsingBlock:", v36);

      t1 = v43;
      objc_msgSend(v28, "vk_applyTransform:", &t1);
      if ((objc_msgSend(v28, "isEmpty") & 1) == 0)
      {
        v29 = (void *)objc_msgSend(v28, "copy");
        objc_msgSend(v35, "setBaseTopLevelNormalizedSubjectPath:", v29);

      }
    }
  }

}

void __49__VKCImageSubjectContext_processPathForInstance___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  LODWORD(a3) = 981668463;
  objc_msgSend(a2, "polygonApproximationWithEpsilon:error:", 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA390];
  v7 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "vk_pathFromCGPath:", objc_msgSend(v7, "normalizedPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vk_appendBezierPath:", v6);

}

- (id)convertIndexSetToConcreteSubjectIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    if (!objc_msgSend(v4, "count"))
    {
      -[VKCImageSubjectContext allSubjectIndexes](self, "allSubjectIndexes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)convertExternalIndexSetToInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[VKCImageSubjectContext allSubjectIndexes](self, "allSubjectIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    if (objc_msgSend(v4, "count"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __60__VKCImageSubjectContext_convertExternalIndexSetToInternal___block_invoke;
      v8[3] = &unk_1E9462918;
      v9 = v5;
      objc_msgSend(v4, "indexesPassingTest:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __60__VKCImageSubjectContext_convertExternalIndexSetToInternal___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
}

- (id)normalizedPathForSubjectWithIndexSet:(id)a3 contentsRect:(CGRect)a4 topLevelOnly:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  VKCImageSubjectContext *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  uint8_t buf[16];

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  if (!objc_msgSend(v11, "count"))
  {
    -[VKCImageSubjectContext normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:](self, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", 0, v5, x, y, width, height);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[VKCImageSubjectContext convertExternalIndexSetToInternal:](self, "convertExternalIndexSetToInternal:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 != objc_msgSend(v11, "count"))
  {
    v14 = objc_msgSend(v12, "count");
    v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        v17 = "Indexes contain one or more indexes that are invalid, ignoring invalid indexes.";
LABEL_9:
        _os_log_impl(&dword_1D2E0D000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      }
    }
    else if (v16)
    {
      *(_WORD *)buf = 0;
      v17 = "Indexes contain no valid indexes, ignoring.";
      goto LABEL_9;
    }

  }
  if (objc_msgSend(v12, "count"))
  {
    v19 = objc_alloc_init(MEMORY[0x1E0CEA390]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __89__VKCImageSubjectContext_normalizedPathForSubjectWithIndexSet_contentsRect_topLevelOnly___block_invoke;
    v22[3] = &unk_1E9462940;
    v18 = v19;
    v23 = v18;
    v24 = self;
    v25 = x;
    v26 = y;
    v27 = width;
    v28 = height;
    v29 = v5;
    objc_msgSend(v11, "enumerateIndexesUsingBlock:", v22);

  }
  else
  {
    v18 = 0;
  }

LABEL_15:
  v20 = (void *)objc_msgSend(v18, "copy");

  return v20;
}

void __89__VKCImageSubjectContext_normalizedPathForSubjectWithIndexSet_contentsRect_topLevelOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v6, *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_appendBezierPath:", v5);

}

- (id)normalizedPathForSubjectAtIndex:(id)a3 contentsRect:(CGRect)a4 topLevelOnly:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  if (v11)
  {
    -[VKCImageSubjectContext subjectInstances](self, "subjectInstances");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vk_safeObjectAtIndex:", objc_msgSend(v11, "integerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "instance != ((void *)0)", "-[VKCImageSubjectContext normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:]", 0, 0, CFSTR("Trying to get subject at index: %ld, but the index is out of range, returning nil"), objc_msgSend(v11, "integerValue"));
      v13 = 0;
    }
  }
  else
  {
    -[VKCImageSubjectContext allSubjectsInstance](self, "allSubjectsInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "normalizedSubjectPathWithContentsRect:topLevelOnly:", v5, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (id)normalizedPathForActiveSubjectsWithContentsRect:(CGRect)a3 topLevelOnly:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  VKCImageSubjectContext *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageSubjectContext activeSubjectIndexes](self, "activeSubjectIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CEA390]);
    -[VKCImageSubjectContext activeSubjectIndexes](self, "activeSubjectIndexes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __87__VKCImageSubjectContext_normalizedPathForActiveSubjectsWithContentsRect_topLevelOnly___block_invoke;
    v17[3] = &unk_1E9462940;
    v14 = v12;
    v18 = v14;
    v19 = self;
    v20 = x;
    v21 = y;
    v22 = width;
    v23 = height;
    v24 = v4;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", v17);

  }
  else
  {
    -[VKCImageSubjectContext normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:](self, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", 0, v4, x, y, width, height);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

void __87__VKCImageSubjectContext_normalizedPathForActiveSubjectsWithContentsRect_topLevelOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v6, *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_appendBezierPath:", v5);

}

- (BOOL)containsSubjectAtNormalizedPoint:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  -[VKCImageSubjectContext indexOfSubjectAtNormalizedPoint:](self, "indexOfSubjectAtNormalizedPoint:", a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)indexOfSubjectAtNormalizedPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  y = a3.y;
  x = a3.x;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[VKCImageSubjectContext subjectInstances](self, "subjectInstances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__VKCImageSubjectContext_indexOfSubjectAtNormalizedPoint___block_invoke;
  v8[3] = &unk_1E9462968;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__VKCImageSubjectContext_indexOfSubjectAtNormalizedPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a2;
  objc_msgSend(v13, "baseTopLevelNormalizedSubjectPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  if (CGRectContainsPoint(v14, *(CGPoint *)(a1 + 40)))
  {
    objc_msgSend(v13, "baseTopLevelNormalizedSubjectPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *a4 = 1;
    }
  }

}

- (BOOL)subjectIndexes:(id)a3 equivalentToIndexes:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[VKCImageSubjectContext convertIndexSetToConcreteSubjectIndexes:](self, "convertIndexSetToConcreteSubjectIndexes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectContext convertIndexSetToConcreteSubjectIndexes:](self, "convertIndexSetToConcreteSubjectIndexes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqualToIndexSet:", v8);
  return (char)v6;
}

- (void)setSubjectCount:(unint64_t)a3
{
  self->_subjectCount = a3;
}

- (NSIndexSet)activeSubjectIndexes
{
  return self->_activeSubjectIndexes;
}

- (void)setActiveMADSubjectIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_activeMADSubjectIndexes, a3);
}

- (NSArray)subjectPaths
{
  return self->_subjectPaths;
}

- (void)setSubjectPaths:(id)a3
{
  objc_storeStrong((id *)&self->_subjectPaths, a3);
}

- (VKCImageSubjectContextInstance)allSubjectsInstance
{
  return self->_allSubjectsInstance;
}

- (void)setAllSubjectsInstance:(id)a3
{
  objc_storeStrong((id *)&self->_allSubjectsInstance, a3);
}

- (NSArray)subjectInstances
{
  return self->_subjectInstances;
}

- (void)setSubjectInstances:(id)a3
{
  objc_storeStrong((id *)&self->_subjectInstances, a3);
}

- (VKCRemoveBackgroundResult)maskResult
{
  return self->_maskResult;
}

- (void)setMaskResult:(id)a3
{
  objc_storeStrong((id *)&self->_maskResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskResult, 0);
  objc_storeStrong((id *)&self->_subjectInstances, 0);
  objc_storeStrong((id *)&self->_allSubjectsInstance, 0);
  objc_storeStrong((id *)&self->_subjectPaths, 0);
  objc_storeStrong((id *)&self->_activeMADSubjectIndexes, 0);
  objc_storeStrong((id *)&self->_activeSubjectIndexes, 0);
}

- (void)processPathForInstance:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Error generating path from subject mask instance: %@", (uint8_t *)&v2, 0xCu);
}

@end
