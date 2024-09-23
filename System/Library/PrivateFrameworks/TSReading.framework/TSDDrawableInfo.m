@implementation TSDDrawableInfo

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->mExteriorTextWrap;
}

+ (BOOL)canPartition
{
  return sInfosPartitionByDefault;
}

- (void)setOwningAttachment:(id)a3
{
  self->mOwningAttachment = (TSDOwningAttachment *)a3;
}

- (void)setParentInfo:(id)a3
{
  self->mParentInfo = (TSDContainerInfo *)a3;
}

- (TSDOwningAttachment)owningAttachment
{
  TSDOwningAttachment *mOwningAttachment;

  mOwningAttachment = self->mOwningAttachment;
  -[TSDDrawableInfo parentInfo](self, "parentInfo");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TSDContainerInfo owningAttachment](-[TSDDrawableInfo parentInfo](self, "parentInfo"), "owningAttachment");
  else
    return mOwningAttachment;
}

- (TSDContainerInfo)parentInfo
{
  return self->mParentInfo;
}

- (int)elementKind
{
  return 1;
}

- (TSDDrawableInfo)initWithContext:(id)a3 geometry:(id)a4
{
  TSDDrawableInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDDrawableInfo;
  v5 = -[TSPObject initWithContext:](&v7, sel_initWithContext_, a3);
  if (v5)
  {
    v5->mGeometry = (TSDInfoGeometry *)a4;
    v5->mExteriorTextWrap = -[TSDExteriorTextWrap initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:]([TSDExteriorTextWrap alloc], "initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", 0, 4, 2, 1, 12.0, 0.5);
    v5->mAspectRatioLocked = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mParentInfoReference = 0;
  self->mParentInfo = 0;

  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableInfo;
  -[TSDDrawableInfo dealloc](&v3, sel_dealloc);
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  if (self->mParentInfo == a3)
    self->mParentInfo = 0;
}

- (TSDAnnotationHosting)comment
{
  return self->mComment;
}

- (void)setComment:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mComment = (TSDAnnotationHosting *)a3;
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return self->mOwningAttachment;
}

- (void)setGeometry:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[TSPObject willModify](self, "willModify");
  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableInfo setGeometry:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 181, CFSTR("invalid nil value for '%s'"), "newGeometry");
  }
  if ((objc_msgSend(a3, "isEqual:", self->mGeometry) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualExceptForPosition:", self->mGeometry))
      v7 = 513;
    else
      v7 = 512;
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", v7);

    self->mGeometry = (TSDInfoGeometry *)a3;
    -[TSDDrawableInfo setMatchesObjectPlaceholderGeometry:](self, "setMatchesObjectPlaceholderGeometry:", 0);
  }
}

- (TSDInfoGeometry)geometry
{
  return self->mGeometry;
}

- (void)setHyperlinkURL:(id)a3
{
  if ((objc_msgSend(a3, "isEqual:", self->mHyperlinkURL) & 1) == 0)
  {
    -[TSPObject willModify](self, "willModify");
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 524);

    self->mHyperlinkURL = (NSURL *)a3;
  }
}

- (void)setAccessibilityDescription:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", self->mAccessibilityDescription) & 1) == 0)
  {
    -[TSPObject willModify](self, "willModify");

    self->mAccessibilityDescription = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setLocked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  BOOL *p_mLocked;

  v3 = a3;
  if (!a3)
  {
    p_mLocked = &self->mLocked;
    if (!self->mLocked)
      return;
    goto LABEL_8;
  }
  if (!-[TSDDrawableInfo isLockable](self, "isLockable"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableInfo setLocked:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 239, CFSTR("Invalid attempt to lock an unlockable object."));
  }
  p_mLocked = &self->mLocked;
  if (self->mLocked != v3 && -[TSDDrawableInfo isLockable](self, "isLockable"))
  {
LABEL_8:
    -[TSPObject willModify](self, "willModify");
    *p_mLocked = v3;
  }
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  if (self->mAspectRatioLocked != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 525);
    -[TSPObject willModify](self, "willModify");
    self->mAspectRatioLocked = a3;
  }
}

- (BOOL)canSizeBeChangedIncrementally
{
  return 1;
}

- (void)performBlockWithTemporaryLayout:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TSDDrawableInfo_performBlockWithTemporaryLayout___block_invoke;
  v6[3] = &unk_24D82B5F0;
  v6[4] = self;
  v6[5] = a3;
  +[TSDLayoutController temporaryLayoutControllerForInfos:useInBlock:](TSDLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v5, v6);
}

uint64_t __51__TSDDrawableInfo_performBlockWithTemporaryLayout___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(a2, "layoutForInfo:", *(_QWORD *)(a1 + 32)));
}

- (CGAffineTransform)computeLayoutFullTransform
{
  __int128 v4;
  uint64_t *v5;
  __int128 v6;
  CGAffineTransform *result;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v9 = 0;
  v10 = &v9;
  v11 = 0x5010000000;
  v12 = &unk_217C8B239;
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v13 = *MEMORY[0x24BDBD8B8];
  v14 = v4;
  v15 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__TSDDrawableInfo_computeLayoutFullTransform__block_invoke;
  v8[3] = &unk_24D82B618;
  v8[4] = &v9;
  -[TSDDrawableInfo performBlockWithTemporaryLayout:](self, "performBlockWithTemporaryLayout:", v8);
  v5 = v10;
  v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

__n128 __45__TSDDrawableInfo_computeLayoutFullTransform__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  _OWORD *v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD *v18;
  __int128 v19;
  __n128 result;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = (void *)objc_msgSend(a2, "geometry");
  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }
  v5 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = v26;
  v6 = v27;
  v5[2] = v25;
  v5[3] = v7;
  v5[4] = v6;
  objc_msgSend(a2, "boundsForStandardKnobs");
  v9 = v8;
  v11 = v10;
  v12 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 8);
  CGAffineTransformMakeTranslation(&t1, v13, v14);
  v15 = v12[3];
  *(_OWORD *)&v22.a = v12[2];
  *(_OWORD *)&v22.c = v15;
  *(_OWORD *)&v22.tx = v12[4];
  CGAffineTransformConcat(&v24, &t1, &v22);
  v17 = *(_OWORD *)&v24.c;
  v16 = *(_OWORD *)&v24.tx;
  v12[2] = *(_OWORD *)&v24.a;
  v12[3] = v17;
  v12[4] = v16;
  v18 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v19 = v18[3];
  *(_OWORD *)&v22.a = v18[2];
  *(_OWORD *)&v22.c = v19;
  *(_OWORD *)&v22.tx = v18[4];
  CGAffineTransformScale(&v24, &v22, v9, v11);
  v21 = *(_OWORD *)&v24.c;
  result = *(__n128 *)&v24.tx;
  v18[2] = *(_OWORD *)&v24.a;
  v18[3] = v21;
  v18[4] = result;
  return result;
}

- (CGAffineTransform)computeFullTransform
{
  CGAffineTransform *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  result = (CGAffineTransform *)-[TSDInfoGeometry widthValid](-[TSDDrawableInfo geometry](self, "geometry"), "widthValid");
  if (!(_DWORD)result
    || (result = (CGAffineTransform *)-[TSDInfoGeometry heightValid](-[TSDDrawableInfo geometry](self, "geometry"), "heightValid"), (result & 1) == 0))
  {
    if (self)
    {
      result = -[TSDDrawableInfo computeLayoutFullTransform](self, "computeLayoutFullTransform");
      goto LABEL_8;
    }
LABEL_7:
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    goto LABEL_8;
  }
  result = -[TSDDrawableInfo geometry](self, "geometry");
  if (!result)
    goto LABEL_7;
  result = (CGAffineTransform *)-[CGAffineTransform fullTransform](result, "fullTransform");
LABEL_8:
  v6 = v8;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = v9;
  return result;
}

- (CGAffineTransform)fullTransformInRoot
{
  TSDInfoGeometry *v5;
  CGAffineTransform *result;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform v11;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = -[TSDDrawableInfo geometry](self, "geometry");
  if (v5)
  {
    -[TSDInfoGeometry fullTransform](v5, "fullTransform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  objc_opt_class();
  -[TSDDrawableInfo parentInfo](self, "parentInfo");
  result = (CGAffineTransform *)TSUDynamicCast();
  if (result)
  {
    -[CGAffineTransform transformInRoot](result, "transformInRoot");
    v7 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v9.c = v7;
    *(_OWORD *)&v9.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v11, &v9, &t2);
    v8 = *(_OWORD *)&v11.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  }
  return result;
}

- (CGAffineTransform)transformInRoot
{
  uint64_t v4;
  __int128 v5;
  CGAffineTransform *v6;
  void *v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform t2;

  v4 = MEMORY[0x24BDBD8B8];
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  if (self)
  {
    v6 = self;
    do
    {
      v7 = (void *)-[CGAffineTransform geometry](v6, "geometry");
      if (v7)
        objc_msgSend(v7, "transform");
      else
        memset(&t2, 0, sizeof(t2));
      v8 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v9.c = v8;
      *(_OWORD *)&v9.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(retstr, &v9, &t2);
      objc_opt_class();
      -[CGAffineTransform parentInfo](v6, "parentInfo");
      self = (CGAffineTransform *)TSUDynamicCast();
      v6 = self;
    }
    while (self);
  }
  return self;
}

- (BOOL)isFloatingAboveText
{
  return -[TSDDrawableInfo owningAttachmentNoRecurse](self, "owningAttachmentNoRecurse") == 0;
}

- (BOOL)isAnchoredToText
{
  return -[TSDOwningAttachment isAnchored](-[TSDDrawableInfo owningAttachmentNoRecurse](self, "owningAttachmentNoRecurse"), "isAnchored");
}

- (BOOL)isInlineWithText
{
  if (-[TSDDrawableInfo isFloatingAboveText](self, "isFloatingAboveText"))
    return 0;
  else
    return !-[TSDDrawableInfo isAnchoredToText](self, "isAnchoredToText");
}

- (BOOL)isAttachedToBodyText
{
  return -[TSDOwningAttachment isAttachedToBodyText](-[TSDDrawableInfo owningAttachmentNoRecurse](self, "owningAttachmentNoRecurse"), "isAttachedToBodyText");
}

- (void)setExteriorTextWrap:(id)a3
{
  void *v5;
  uint64_t v6;

  -[TSPObject willModify](self, "willModify");
  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableInfo setExteriorTextWrap:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 340, CFSTR("invalid nil value for '%s'"), "exteriorTextWrap");
  }
  if ((objc_msgSend(a3, "isEqual:", self->mExteriorTextWrap) & 1) == 0)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 521);

    self->mExteriorTextWrap = (TSDExteriorTextWrap *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)isUserModifiable
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isThemeContent
{
  return -[TSDContainerInfo isThemeContent](-[TSDDrawableInfo parentInfo](self, "parentInfo"), "isThemeContent");
}

- (id)partitioner
{
  TSDDefaultPartitioner *mDefaultPartitioner;

  if (!objc_msgSend((id)objc_opt_class(), "canPartition"))
    return 0;
  mDefaultPartitioner = self->mDefaultPartitioner;
  if (!mDefaultPartitioner)
  {
    mDefaultPartitioner = -[TSDDefaultPartitioner initWithInfo:]([TSDDefaultPartitioner alloc], "initWithInfo:", self);
    self->mDefaultPartitioner = mDefaultPartitioner;
  }
  return mDefaultPartitioner;
}

+ (void)setShouldPartitionByDefault:(BOOL)a3
{
  sInfosPartitionByDefault = a3;
}

- (BOOL)supportsHyperlinks
{
  return 1;
}

- (id)presetKind
{
  return (id)String;
}

- (BOOL)isLockable
{
  _BOOL4 v3;

  v3 = -[TSDDrawableInfo isFloatingAboveText](self, "isFloatingAboveText");
  if (v3)
    LOBYTE(v3) = -[TSDDrawableInfo containingGroup](self, "containingGroup") == 0;
  return v3;
}

- (id)copyWithContext:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:", a3);
  if (v4)
  {
    *(_QWORD *)(v4 + 48) = -[TSDInfoGeometry copy](self->mGeometry, "copy");
    *(_QWORD *)(v4 + 88) = -[TSDExteriorTextWrap copy](self->mExteriorTextWrap, "copy");
    *(_BYTE *)(v4 + 72) = self->mLocked;
    *(_BYTE *)(v4 + 73) = self->mAspectRatioLocked;
    *(_QWORD *)(v4 + 128) = -[NSString copy](self->mAccessibilityDescription, "copy");
    *(_QWORD *)(v4 + 136) = -[NSMutableDictionary mutableCopy](self->mAccessibilityDescriptions, "mutableCopy");
    *(_QWORD *)(v4 + 112) = -[NSURL copy](self->mHyperlinkURL, "copy");
  }
  return (id)v4;
}

- (BOOL)canAnchor
{
  return 1;
}

- (BOOL)supportsAttachedComments
{
  return 1;
}

- (id)searchForAnnotationsWithHitBlock:(id)a3
{
  TSDCanvasSearchReference *v5;

  if (-[TSDDrawableInfo comment](self, "comment"))
  {
    v5 = +[TSDCanvasSearchReference searchReferenceWithDrawableInfo:](TSDCanvasSearchReference, "searchReferenceWithDrawableInfo:", self);
    -[TSDCanvasSearchReference setAnnotation:](v5, "setAnnotation:", -[TSDDrawableInfo comment](self, "comment"));
    (*((void (**)(id, TSDCanvasSearchReference *))a3 + 2))(a3, v5);
  }
  return 0;
}

- (void)beginCollectingChanges
{
  void *v3;
  uint64_t v4;

  if (!self->mChanges
    || (v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableInfo beginCollectingChanges]"),
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 489, CFSTR("don't try to beginCollectingChanges when we are already collecting")), !self->mChanges))
  {
    self->mChanges = objc_alloc_init(TSSPropertySetChangeDetails);
  }
}

- (void)willChangeProperty:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[TSPObject willModify](self, "willModify");
  -[TSSPropertySetChangeDetails addChangedProperty:](self->mChanges, "addChangedProperty:", v3);
}

- (void)willChangeProperties:(id)a3
{
  -[TSPObject willModify](self, "willModify");
  -[TSSPropertySetChangeDetails addChangedProperties:](self->mChanges, "addChangedProperties:", a3);
}

- (id)endCollectingChanges
{
  TSSPropertySetChangeDetails *mChanges;
  void *v4;
  uint64_t v5;

  mChanges = self->mChanges;
  if (!mChanges)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableInfo endCollectingChanges]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 515, CFSTR("don't try to endCollectingChanges without calling -beginCollectingChanges first"));
    mChanges = self->mChanges;
  }
  self->mChanges = 0;
  return mChanges;
}

- (void)coalesceChanges:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_msgSend(a3, "count");
  if (v4 >= 2)
  {
    v5 = v4;
    v6 = objc_alloc_init(MEMORY[0x24BEB3C98]);
    v7 = v5 - 1;
    do
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", v7);
      v9 = (void *)objc_msgSend(v6, "objectForKey:", objc_msgSend(v8, "kind"));
      objc_opt_class();
      objc_msgSend(v8, "details");
      v10 = (void *)TSUDynamicCast();
      if (v10)
      {
        if (v9)
        {
          objc_msgSend(v9, "addChangedProperties:", objc_msgSend(v10, "changedProperties"));
          objc_msgSend(a3, "removeObjectAtIndex:", v7);
        }
        else
        {
          objc_msgSend(v6, "setObject:forKey:", v10, objc_msgSend(v8, "kind"));
        }
      }
      --v7;
    }
    while (v7 != -1);
  }
}

- (Class)editorClass
{
  return (Class)objc_opt_class();
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  if (-[TSDDrawableInfo comment](self, "comment", a3, a4))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("kTSDAnnotationInvalidatedNotification"), a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  if (-[TSDDrawableInfo comment](self, "comment"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("kTSDAnnotationInvalidatedNotification"), a3);
}

- (BOOL)canChangeWrapType
{
  return 1;
}

- (id)animationFilters
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", kTSDAnimationFilterStandard, kTSDAnimationFilterNotMovie, 0);
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 animationFilter:(id)a4
{
  return -[TSDDrawableInfo chunkCountForTextureDeliveryStyle:byGlyphStyle:animationFilter:](self, "chunkCountForTextureDeliveryStyle:byGlyphStyle:animationFilter:", a3, 0, a4);
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 byGlyphStyle:(int)a4 animationFilter:(id)a5
{
  return 1;
}

- (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3
{
  unint64_t result;

  if (textureDeliveryStyleFromDeliveryString__onceToken != -1)
    dispatch_once(&textureDeliveryStyleFromDeliveryString__onceToken, &__block_literal_global_23);
  result = objc_msgSend((id)textureDeliveryStyleFromDeliveryString__sDeliveryStyleMap, "objectForKeyedSubscript:", a3);
  if (result)
    return objc_msgSend((id)result, "unsignedIntegerValue");
  return result;
}

void *__58__TSDDrawableInfo_textureDeliveryStyleFromDeliveryString___block_invoke()
{
  textureDeliveryStyleFromDeliveryString__sDeliveryStyleMap = (uint64_t)&unk_24D8FB748;
  return &unk_24D8FB748;
}

- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4
{
  void *v4;
  const __CFString *v5;

  v4 = (void *)MEMORY[0x24BDBCE30];
  if (a3)
    v5 = (const __CFString *)objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("All at Once"), &stru_24D82FEB0, CFSTR("TSDrawables"));
  else
    v5 = CFSTR("All at Once");
  return (id)objc_msgSend(v4, "arrayWithObject:", v5);
}

- (BOOL)reverseChunkingIsSupported
{
  return 1;
}

- (id)descriptionForPasteboard
{
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("anchoredToText");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TSDDrawableInfo isAnchoredToText](self, "isAnchoredToText"));
  v4[1] = CFSTR("floatingAboveText");
  v5[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TSDDrawableInfo isFloatingAboveText](self, "isFloatingAboveText"));
  v4[2] = CFSTR("inlineWithText");
  v5[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TSDDrawableInfo isInlineWithText](self, "isInlineWithText"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)containingGroup
{
  void *v3;
  id result;
  BOOL v5;

  objc_opt_class();
  -[TSDDrawableInfo parentInfo](self, "parentInfo");
  v3 = (void *)TSUDynamicCast();
  objc_opt_class();
  result = (id)TSUDynamicCast();
  if (v3)
    v5 = result == 0;
  else
    v5 = 0;
  if (v5)
    return (id)objc_msgSend(v3, "containingGroup");
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableInfo mixingTypeWithObject:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 717, CFSTR("TSDDrawableInfo does not implement TSDMixing!"));
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4, a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDrawableInfo mixedObjectWithFraction:ofObject:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 724, CFSTR("TSDDrawableInfo does not implement TSDMixing!"));
  return 0;
}

- (id)transformedGeometryWithTransform:(CGAffineTransform *)a3 inBounds:(CGRect)a4
{
  double v6;
  void *v7;
  float a;
  float d;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;

  v6 = TSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v28 = v6 / a3->a;
  v7 = (void *)-[TSDInfoGeometry mutableCopy](-[TSDDrawableInfo geometry](self, "geometry"), "mutableCopy");
  a = a3->a;
  d = a3->d;
  v10 = fminf(a, d);
  objc_msgSend(v7, "size");
  objc_msgSend(v7, "setSize:", TSDMultiplySizeScalar(v11, v12, v10));
  -[TSDDrawableInfo transformableObjectAnchorPoint](self, "transformableObjectAnchorPoint");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "position");
  v18 = TSDSubtractPoints(v14, v16, v17);
  v20 = v19;
  v21 = TSDSubtractPoints(v14, v16, v28);
  v23 = TSDAddPoints(v21 * v10, v22 * v10, v6);
  v25 = v24;
  v26 = TSDMultiplyPointScalar(v18, v20, v10);
  objc_msgSend(v7, "setPosition:", TSDSubtractPoints(v23, v25, v26));
  return v7;
}

- (CGPoint)transformableObjectAnchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[TSDInfoGeometry center](-[TSDDrawableInfo geometry](self, "geometry"), "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)matchesObjectPlaceholderGeometry
{
  return 0;
}

- (NSURL)hyperlinkURL
{
  return self->mHyperlinkURL;
}

- (BOOL)isLocked
{
  return self->mLocked;
}

- (BOOL)aspectRatioLocked
{
  return self->mAspectRatioLocked;
}

- (NSString)accessibilityDescription
{
  return self->mAccessibilityDescription;
}

- (NSMutableDictionary)accessibilityDescriptions
{
  return self->mAccessibilityDescriptions;
}

- (void)setAccessibilityDescriptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (void)setInsertionCenterPosition:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  v6 = (id)-[TSDInfoGeometry mutableCopy](-[TSDDrawableInfo geometry](self, "geometry"), "mutableCopy");
  objc_msgSend(v6, "setCenter:", x, y);
  -[TSDDrawableInfo setGeometry:](self, "setGeometry:", v6);

}

- (BOOL)containsProperty:(int)a3
{
  return a3 == 512 || a3 == 524;
}

- (id)boxedObjectForProperty:(int)a3
{
  uint64_t v3;
  id result;
  float v6;
  double v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  switch(String(a3))
  {
    case 0u:
      result = -[TSDDrawableInfo objectForProperty:](self, "objectForProperty:", v3);
      break;
    case 1u:
      v8 = -[TSDDrawableInfo intValueForProperty:](self, "intValueForProperty:", v3);
      if ((_DWORD)v8 == 0x80000000)
        goto LABEL_8;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
      break;
    case 2u:
      -[TSDDrawableInfo floatValueForProperty:](self, "floatValueForProperty:", v3);
      if (v6 == INFINITY)
        goto LABEL_8;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
      break;
    case 3u:
      -[TSDDrawableInfo doubleValueForProperty:](self, "doubleValueForProperty:", v3);
      if (v7 == INFINITY)
        goto LABEL_8;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      break;
    default:
LABEL_8:
      result = 0;
      break;
  }
  return result;
}

- (id)objectForProperty:(int)a3
{
  if (a3 == 524)
    return -[TSDDrawableInfo hyperlinkURL](self, "hyperlinkURL");
  if (a3 == 512)
    return -[TSDDrawableInfo geometry](self, "geometry");
  return 0;
}

- (int)intValueForProperty:(int)a3
{
  return 0x80000000;
}

- (float)floatValueForProperty:(int)a3
{
  return INFINITY;
}

- (double)doubleValueForProperty:(int)a3
{
  return INFINITY;
}

- (double)CGFloatValueForProperty:(int)a3
{
  return INFINITY;
}

@end
