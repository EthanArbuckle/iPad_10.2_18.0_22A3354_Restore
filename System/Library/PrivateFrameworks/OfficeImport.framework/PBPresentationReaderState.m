@implementation PBPresentationReaderState

- (PBPresentationReaderState)initWithReader:(void *)a3 tgtPresentation:(id)a4
{
  id v7;
  PBPresentationReaderState *v8;
  PBPresentationReaderState *v9;
  _QWORD *v10;
  NSMutableArray *v11;
  NSMutableArray *mSlideIndexes;
  PBOfficeArtReaderState *v13;
  PBOfficeArtReaderState *mOfficeArtState;
  NSMutableArray *v15;
  NSMutableArray *mFontEntities;
  OITSUNoCopyDictionary *v17;
  OITSUNoCopyDictionary *mSlideMasterToMasterStyles;
  PBSlideState *v19;
  PBSlideState *mSlideState;
  _QWORD *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *mTargetShapeToSourceTextBoxContainerHolderMap;
  void *v24;
  PptEshObjectFactory *v25;
  objc_super v27;

  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PBPresentationReaderState;
  v8 = -[PBPresentationReaderState init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mPptBinaryReader = a3;
    objc_storeStrong((id *)&v8->mTgtPresentation, a4);
    v10 = operator new(0x18uLL);
    v10[1] = 0;
    v10[2] = 0;
    *v10 = 0;
    v9->mCurrentSlideTextBlockRecordIndexRangeVector = v10;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSlideIndexes = v9->mSlideIndexes;
    v9->mSlideIndexes = v11;

    v13 = -[PBOfficeArtReaderState initWithPresentationState:]([PBOfficeArtReaderState alloc], "initWithPresentationState:", v9);
    mOfficeArtState = v9->mOfficeArtState;
    v9->mOfficeArtState = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFontEntities = v9->mFontEntities;
    v9->mFontEntities = v15;

    v17 = objc_alloc_init(OITSUNoCopyDictionary);
    mSlideMasterToMasterStyles = v9->mSlideMasterToMasterStyles;
    v9->mSlideMasterToMasterStyles = v17;

    v9->mHyperlinkMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    v19 = objc_alloc_init(PBSlideState);
    mSlideState = v9->mSlideState;
    v9->mSlideState = v19;

    v21 = operator new(0x18uLL);
    *v21 = 0;
    v21[1] = 0;
    v21[2] = 0;
    v9->mSrcDocMasterStyleInfoVector = v21;
    std::vector<PBReaderMasterStyleInfo,ChAllocator<PBReaderMasterStyleInfo>>::resize((uint64_t)v21, 9u);
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mTargetShapeToSourceTextBoxContainerHolderMap = v9->mTargetShapeToSourceTextBoxContainerHolderMap;
    v9->mTargetShapeToSourceTextBoxContainerHolderMap = v22;

    +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (PptEshObjectFactory *)operator new(0x10uLL);
    PptEshObjectFactory::PptEshObjectFactory(v25);
    objc_msgSend(v24, "setEshFactory:", v25);

  }
  return v9;
}

- (void)setCancelDelegate:(id)a3
{
  objc_storeStrong((id *)&self->mCancel, a3);
}

- (void)reader
{
  return self->mPptBinaryReader;
}

- (void)setDocumentRoot:(id)a3
{
  objc_storeStrong((id *)&self->mDocumentRoot, a3);
}

- (void)addFontEntity:(id)a3 charSet:(int)a4 type:(int)a5 family:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PBFontEntity *v10;
  id v11;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v10 = -[PBFontEntity initWithName:charSet:type:family:]([PBFontEntity alloc], "initWithName:charSet:type:family:", v11, v8, v7, v6);
  -[NSMutableArray addObject:](self->mFontEntities, "addObject:", v10);

}

- (PBReaderMasterStyleInfo)docSourceMasterStyleInfoOfType:(int)a3
{
  return (PBReaderMasterStyleInfo *)(*(_QWORD *)self->mSrcDocMasterStyleInfoVector + 16 * a3);
}

- (id)tgtPresentation
{
  return self->mTgtPresentation;
}

- (id)currentMacCharStyle
{
  return self->mCurrentMacCharStyle;
}

- (BOOL)hasCharacterPropertyBulletIndex
{
  return self->mHasCharacterPropertyBulletIndex;
}

- (void)setBulletIndex:(unsigned int)a3
{
  self->mBulletIndex = a3;
  self->mHasCharacterPropertyBulletIndex = 1;
}

- (id)fontEntityAtIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  PBFontEntity *v7;
  void *v8;

  if (-[NSMutableArray count](self->mFontEntities, "count") <= a3)
  {
    v6 = (void *)-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity;
    if (!-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity)
    {
      v7 = -[PBFontEntity initWithName:charSet:type:family:]([PBFontEntity alloc], "initWithName:charSet:type:family:", CFSTR("Arial"), 0, 0, 0);
      v8 = (void *)-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity;
      -[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity = (uint64_t)v7;

      v6 = (void *)-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity;
    }
    v5 = v6;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mFontEntities, "objectAtIndex:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)documentRoot
{
  return self->mDocumentRoot;
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (BOOL)isCancelled
{
  return -[TCCancelDelegate isCancelled](self->mCancel, "isCancelled");
}

- (void)setCurrentSourceMasterStyleInfoVector:(void *)a3
{
  self->mSrcCurrentMasterStyleInfoVector = a3;
}

- (PBReaderMasterStyleInfo)currentSourceMasterStyleInfoOfType:(int)a3
{
  _QWORD *mSrcCurrentMasterStyleInfoVector;

  mSrcCurrentMasterStyleInfoVector = self->mSrcCurrentMasterStyleInfoVector;
  if (!mSrcCurrentMasterStyleInfoVector)
    mSrcCurrentMasterStyleInfoVector = self->mSrcDocMasterStyleInfoVector;
  return (PBReaderMasterStyleInfo *)(*mSrcCurrentMasterStyleInfoVector + 16 * a3);
}

- (void)setMasterStyles:(id)a3 slideMaster:(id)a4
{
  -[OITSUNoCopyDictionary setObject:forUncopiedKey:](self->mSlideMasterToMasterStyles, "setObject:forUncopiedKey:", a3, a4);
}

- (void)setTgtSlide:(id)a3
{
  objc_storeStrong((id *)&self->mTgtSlide, a3);
}

- (void)setCurrentBulletStyle:(id)a3 macCharStyle:(id)a4
{
  ESDObject *v6;
  ESDObject *v7;
  ESDObject *mCurrentBulletStyle;
  ESDObject *mCurrentMacCharStyle;
  ESDObject *v10;

  v6 = (ESDObject *)a3;
  v7 = (ESDObject *)a4;
  mCurrentBulletStyle = self->mCurrentBulletStyle;
  self->mCurrentBulletStyle = v6;
  v10 = v6;

  mCurrentMacCharStyle = self->mCurrentMacCharStyle;
  self->mCurrentMacCharStyle = v7;

}

- (BOOL)hasCurrentSourceMasterStyleInfoVector
{
  return self->mSrcCurrentMasterStyleInfoVector != 0;
}

- (id)currentBulletStyle
{
  return self->mCurrentBulletStyle;
}

- (void)setHasCharacterPropertyBulletIndex:(BOOL)a3
{
  self->mHasCharacterPropertyBulletIndex = a3;
}

- (id)tgtSlide
{
  return self->mTgtSlide;
}

- (void)setSourceTextBoxContainerHolder:(id)a3 forTargetShape:(id)a4
{
  NSMutableDictionary *mTargetShapeToSourceTextBoxContainerHolderMap;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  mTargetShapeToSourceTextBoxContainerHolderMap = self->mTargetShapeToSourceTextBoxContainerHolderMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mTargetShapeToSourceTextBoxContainerHolderMap, "setObject:forKey:", v7, v8);

}

- (unint64_t)numberOfSlideIndexes
{
  return -[NSMutableArray count](self->mSlideIndexes, "count");
}

- (id)masterStyles:(id)a3
{
  -[OITSUNoCopyDictionary objectForKey:](self->mSlideMasterToMasterStyles, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sourceTextBoxContainerHolderForTargetShape:(id)a3
{
  NSMutableDictionary *mTargetShapeToSourceTextBoxContainerHolderMap;
  void *v4;
  void *v5;
  void *v6;

  mTargetShapeToSourceTextBoxContainerHolderMap = self->mTargetShapeToSourceTextBoxContainerHolderMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mTargetShapeToSourceTextBoxContainerHolderMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonretainedObjectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSourceSlideListHolder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setSourceSlideId:(unsigned int)a3
{
  self->mSrcSlideId = a3;
}

- (ESDContainer)sourceSlideListHolder
{
  return (ESDContainer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentTextType:(int)a3 placeholderIndex:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[PBOutlineBulletDictionary objectForSlideId:textType:placeholderIndex:](self->mPlaceholderBulletStyles, "objectForSlideId:textType:placeholderIndex:", self->mSrcSlideId, *(_QWORD *)&a3, *(_QWORD *)&a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PBOutlineBulletDictionary objectForSlideId:textType:placeholderIndex:](self->mPlaceholderMacCharStyles, "objectForSlideId:textType:placeholderIndex:", self->mSrcSlideId, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBPresentationReaderState setCurrentBulletStyle:macCharStyle:](self, "setCurrentBulletStyle:macCharStyle:", v8, v7);

}

- (BOOL)hasSlideNumberPlaceholder
{
  return self->mHasSlideNumberPlaceholder;
}

- (void)setHasSlideNumberPlaceholder:(BOOL)a3
{
  self->mHasSlideNumberPlaceholder = a3;
}

- (void)dealloc
{
  void **mCurrentSlideTextBlockRecordIndexRangeVector;
  void *v4;
  void **mSrcDocMasterStyleInfoVector;
  void *v6;
  objc_super v7;

  mCurrentSlideTextBlockRecordIndexRangeVector = (void **)self->mCurrentSlideTextBlockRecordIndexRangeVector;
  if (mCurrentSlideTextBlockRecordIndexRangeVector)
  {
    v4 = *mCurrentSlideTextBlockRecordIndexRangeVector;
    if (*mCurrentSlideTextBlockRecordIndexRangeVector)
    {
      mCurrentSlideTextBlockRecordIndexRangeVector[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x22E2DD408](mCurrentSlideTextBlockRecordIndexRangeVector, 0x20C40960023A9);
  }
  self->mCurrentSlideTextBlockRecordIndexRangeVector = 0;
  CFRelease(self->mHyperlinkMap);
  mSrcDocMasterStyleInfoVector = (void **)self->mSrcDocMasterStyleInfoVector;
  if (mSrcDocMasterStyleInfoVector)
  {
    v6 = *mSrcDocMasterStyleInfoVector;
    if (*mSrcDocMasterStyleInfoVector)
    {
      mSrcDocMasterStyleInfoVector[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x22E2DD408](mSrcDocMasterStyleInfoVector, 0x20C40960023A9);
  }
  self->mSrcDocMasterStyleInfoVector = 0;
  v7.receiver = self;
  v7.super_class = (Class)PBPresentationReaderState;
  -[PBPresentationReaderState dealloc](&v7, sel_dealloc);
}

- (id)hyperlinkInfoWithId:(unsigned int)a3 createIfAbsent:(BOOL)a4
{
  _BOOL4 v4;
  const void *v6;
  PBReaderHyperlinkInfo *v7;
  BOOL v8;

  v4 = a4;
  v6 = (const void *)a3;
  CFDictionaryGetValue(self->mHyperlinkMap, (const void *)a3);
  v7 = (PBReaderHyperlinkInfo *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(PBReaderHyperlinkInfo);
    CFDictionarySetValue(self->mHyperlinkMap, v6, v7);
  }
  return v7;
}

- (void)setPlaceholderBulletStyles:(id)a3
{
  objc_storeStrong((id *)&self->mPlaceholderBulletStyles, a3);
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancel;
}

- (void)setPlaceholderMacCharStyles:(id)a3
{
  objc_storeStrong((id *)&self->mPlaceholderMacCharStyles, a3);
}

- (void)addSlideIndex:(unint64_t)a3
{
  NSMutableArray *mSlideIndexes;
  id v4;

  mSlideIndexes = self->mSlideIndexes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](mSlideIndexes, "addObject:");

}

- (unint64_t)getSlideIndexAt:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableArray objectAtIndex:](self->mSlideIndexes, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)slideIndexesRef
{
  return self->mSlideIndexes;
}

- (unint64_t)fontEntityCount
{
  return -[NSMutableArray count](self->mFontEntities, "count");
}

- (unsigned)bulletIndex
{
  return self->mBulletIndex;
}

- (id)slideState
{
  return self->mSlideState;
}

- (void)resetSlideState
{
  -[PBSlideState reset](self->mSlideState, "reset");
}

- (void)currentSlideTextBlockRecordIndexRangeVector
{
  return self->mCurrentSlideTextBlockRecordIndexRangeVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetShapeToSourceTextBoxContainerHolderMap, 0);
  objc_storeStrong((id *)&self->mCancel, 0);
  objc_storeStrong((id *)&self->mSlideState, 0);
  objc_storeStrong((id *)&self->mCurrentMacCharStyle, 0);
  objc_storeStrong((id *)&self->mCurrentBulletStyle, 0);
  objc_storeStrong((id *)&self->mPlaceholderMacCharStyles, 0);
  objc_storeStrong((id *)&self->mPlaceholderBulletStyles, 0);
  objc_storeStrong((id *)&self->mTgtSlide, 0);
  objc_storeStrong((id *)&self->mFontEntities, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mSlideMasterToMasterStyles, 0);
  objc_storeStrong((id *)&self->mSlideIndexes, 0);
  objc_storeStrong((id *)&self->mSrcSlideListHolder, 0);
  objc_storeStrong((id *)&self->mDocumentRoot, 0);
  objc_storeStrong((id *)&self->mTgtPresentation, 0);
}

@end
