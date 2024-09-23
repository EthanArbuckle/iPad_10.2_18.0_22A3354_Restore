@implementation TSDDrawableEditor

- (TSDDrawableEditor)initWithInteractiveCanvasController:(id)a3
{
  TSDDrawableEditor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDDrawableEditor;
  result = -[TSDDrawableEditor init](&v5, sel_init);
  if (result)
    result->mICC = (TSDInteractiveCanvasController *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableEditor;
  -[TSDDrawableEditor dealloc](&v3, sel_dealloc);
}

+ (id)keyPathsForValuesAffectingInfo
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("infos"));
}

- (TSDDrawableInfo)info
{
  void *v3;
  uint64_t v4;

  if (-[NSSet count](self->mInfos, "count") >= 2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableEditor info]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableEditor.m"), 87, CFSTR("You need to change your code to expect an array of infos from the TSDDrawableEditor so that multiple selection is supported."));
  }
  return (TSDDrawableInfo *)-[NSSet anyObject](self->mInfos, "anyObject");
}

- (id)infosOfClass:(Class)a3
{
  NSSet *mInfos;
  _QWORD v5[5];

  mInfos = self->mInfos;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__TSDDrawableEditor_infosOfClass___block_invoke;
  v5[3] = &unk_24D82B460;
  v5[4] = a3;
  return -[NSSet objectsPassingTest:](mInfos, "objectsPassingTest:", v5);
}

uint64_t __34__TSDDrawableEditor_infosOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)keyPathsForValuesAffectingFirstInfo
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("infos"));
}

+ (BOOL)shouldSuppressMultiselection
{
  return 0;
}

- (TSDDrawableInfo)firstInfo
{
  NSSet *mInfos;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  TSDDrawableInfo *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mInfos = self->mInfos;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(mInfos);
    v8 = *(TSDDrawableInfo **)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v8;
    if (v5 == ++v7)
    {
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingLayouts
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("infos"));
}

- (NSSet)layouts
{
  return (NSSet *)-[TSDLayoutController layoutsForInfos:](-[TSDInteractiveCanvasController layoutController](-[TSDDrawableEditor interactiveCanvasController](self, "interactiveCanvasController"), "layoutController"), "layoutsForInfos:", -[TSDDrawableEditor infos](self, "infos"));
}

- (int)canPerformAction:(SEL)a3
{
  return 0;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (sel_addOrShowComment_ == a3)
  {
    if (-[TSDDrawableEditor canAddOrShowComment](self, "canAddOrShowComment"))
      return 1;
    else
      return -1;
  }
  else if (sel_flipHorizontally_ == a3 || sel_flipVertically_ == a3)
  {
    if (-[NSSet count](-[TSDDrawableEditor infos](self, "infos"), "count")
      && (v15 = 0u,
          v16 = 0u,
          v13 = 0u,
          v14 = 0u,
          v6 = -[TSDDrawableEditor layouts](self, "layouts", 0),
          (v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16)) != 0))
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "canFlip")
            && !objc_msgSend((id)objc_msgSend(v11, "info"), "isLocked"))
          {
            return 1;
          }
        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        result = -1;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      return -1;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

- (id)documentRoot
{
  return -[TSDInteractiveCanvasController documentRoot](-[TSDDrawableEditor interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot");
}

- (NSSet)selectedObjectsSupportingStroke
{
  return 0;
}

- (NSSet)selectedObjectsSupportingShadow
{
  return 0;
}

- (NSSet)selectedObjectsSupportingReflection
{
  return 0;
}

- (NSSet)selectedObjectsSupportingOpacity
{
  return 0;
}

- (NSSet)selectedObjectsSupportingFill
{
  return 0;
}

- (NSSet)selectedObjectsSupportingEndpoints
{
  return 0;
}

- (NSSet)selectedObjectsSupportingResize
{
  return -[NSSet objectsPassingTest:](-[TSDDrawableEditor layouts](self, "layouts"), "objectsPassingTest:", &__block_literal_global_33);
}

uint64_t __52__TSDDrawableEditor_selectedObjectsSupportingResize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsResize");
}

- (NSSet)selectedObjectsSupportingTextInset
{
  return -[NSSet objectsPassingTest:](-[TSDDrawableEditor infos](self, "infos"), "objectsPassingTest:", &__block_literal_global_17);
}

void *__55__TSDDrawableEditor_selectedObjectsSupportingTextInset__block_invoke()
{
  void *result;

  objc_opt_class();
  result = (void *)TSUDynamicCast();
  if (result)
    return (void *)objc_msgSend(result, "supportsTextInset");
  return result;
}

- (NSSet)selectedObjectsSupportingShrinkTextToFit
{
  return -[NSSet objectsPassingTest:](-[TSDDrawableEditor infos](self, "infos"), "objectsPassingTest:", &__block_literal_global_19);
}

void *__61__TSDDrawableEditor_selectedObjectsSupportingShrinkTextToFit__block_invoke()
{
  void *result;

  objc_opt_class();
  result = (void *)TSUDynamicCast();
  if (result)
    return (void *)objc_msgSend(result, "supportsShrinkTextToFit");
  return result;
}

- (NSSet)selectedObjectsSupportingConnectionLineAttributes
{
  return 0;
}

- (NSSet)selectedObjectsSupportingSmartShapeAttributes
{
  return 0;
}

- (id)topLevelInspectorAutosaveName
{
  return CFSTR("TSDDrawableInspectorLastSelectedPane");
}

- (id)selectedLayoutsSupportingRotation
{
  return -[NSSet objectsPassingTest:](-[TSDDrawableEditor layouts](self, "layouts"), "objectsPassingTest:", &__block_literal_global_23);
}

uint64_t __54__TSDDrawableEditor_selectedLayoutsSupportingRotation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsRotation");
}

- (id)selectedLayoutsSupportingFlipping
{
  return -[NSSet objectsPassingTest:](-[TSDDrawableEditor layouts](self, "layouts"), "objectsPassingTest:", &__block_literal_global_24);
}

uint64_t __54__TSDDrawableEditor_selectedLayoutsSupportingFlipping__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsFlipping");
}

- (id)selectedLayoutsSupportingInspectorPositioning
{
  return -[NSSet objectsPassingTest:](-[TSDDrawableEditor layouts](self, "layouts"), "objectsPassingTest:", &__block_literal_global_25);
}

uint64_t __66__TSDDrawableEditor_selectedLayoutsSupportingInspectorPositioning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsInspectorPositioning");
}

- (id)stroke
{
  return 0;
}

- (id)strokeColor
{
  return 0;
}

- (void)beginChangingStrokeWidth:(id)a3
{
  NSSet *mInfos;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TSDInteractiveCanvasController beginDynamicOperation](self->mICC, "beginDynamicOperation", a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  mInfos = self->mInfos;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(mInfos);
        objc_msgSend(-[TSDInteractiveCanvasController layoutForInfo:](self->mICC, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)), "dynamicStrokeWidthChangeDidBegin");
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)didChangeStrokeWidth:(id)a3
{
  float v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  NSSet *mInfos;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  int v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "floatValue");
  -[TSDDrawableEditor strokeWidthForNormalizedWidth:](self, "strokeWidthForNormalizedWidth:", v5);
  v7 = v6;
  objc_msgSend(a3, "floatValue");
  -[TSDDrawableEditor pictureFrameAssetScaleForNormalizedWidth:](self, "pictureFrameAssetScaleForNormalizedWidth:", v8);
  v10 = v9;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  mInfos = self->mInfos;
  v12 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    v15 = v10;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(mInfos);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v18 = (void *)objc_msgSend(v17, "performSelector:", sel_stroke);
          v19 = -[TSDInteractiveCanvasController layoutForInfo:](self->mICC, "layoutForInfo:", v17);
          v20 = objc_msgSend(v18, "isFrame");
          v21 = v7;
          if (v20)
          {
            objc_msgSend(v18, "minimumAssetScale", v7);
            *(float *)&v22 = v22;
            v21 = fmaxf(v15, *(float *)&v22);
          }
          objc_msgSend(v19, "dynamicStrokeWidthUpdateToValue:", v21);
        }
      }
      v13 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }
}

- (void)endChangingStrokeWidth:(id)a3
{
  NSSet *mInfos;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  mInfos = self->mInfos;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(mInfos);
        objc_msgSend(-[TSDInteractiveCanvasController layoutForInfo:](self->mICC, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)), "dynamicStrokeWidthChangeDidEnd");
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](mInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[TSDInteractiveCanvasController endDynamicOperation](self->mICC, "endDynamicOperation");
}

- (id)strokeSwatches
{
  return 0;
}

- (id)strokeColorPickerTitle
{
  return 0;
}

- (double)strokeWidthForNormalizedWidth:(double)a3
{
  double result;

  TSUClamp();
  return result;
}

- (double)pictureFrameAssetScaleForNormalizedWidth:(double)a3
{
  return a3 / 100.0;
}

- (BOOL)canAddOrShowComment
{
  return 0;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mICC;
}

- (NSSet)infos
{
  return self->mInfos;
}

- (void)setInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)stylePresetKindForInspector
{
  return (id)String;
}

- (id)viewControllerForMoreStyleOptions
{
  return 0;
}

- (id)imageForPreset:(id)a3 size:(CGSize)a4
{
  return 0;
}

@end
