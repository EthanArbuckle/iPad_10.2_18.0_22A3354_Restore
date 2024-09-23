@implementation PBMasterInfo

- (PBMasterInfo)init
{
  PBMasterInfo *v2;
  NSMutableArray *v3;
  NSMutableArray *mTgtSlideLayoutArray;
  _QWORD *v5;
  uint64_t v6;
  NSMutableDictionary *mXmlLayoutMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBMasterInfo;
  v2 = -[PBMasterInfo init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mTgtSlideLayoutArray = v2->mTgtSlideLayoutArray;
    v2->mTgtSlideLayoutArray = v3;

    v5 = operator new(0x18uLL);
    *v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
    v2->mSrcTextStyling = v5;
    std::vector<PBReaderMasterStyleInfo,ChAllocator<PBReaderMasterStyleInfo>>::resize((uint64_t)v5, 9u);
    v6 = objc_opt_new();
    mXmlLayoutMap = v2->mXmlLayoutMap;
    v2->mXmlLayoutMap = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (void)setSlideMaster:(id)a3
{
  objc_storeStrong((id *)&self->mSlideMaster, a3);
}

- (void)setMainPbRef:(unsigned int)a3
{
  self->mMainPbRef = a3;
}

- (void)sourceTextStyling
{
  return self->mSrcTextStyling;
}

- (void)cacheTargetLayoutType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray indexOfObject:](self->mTgtSlideLayoutArray, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](self->mTgtSlideLayoutArray, "addObject:", v4);

}

- (id)slideMaster
{
  return self->mSlideMaster;
}

- (id)allTargetLayoutTypes
{
  return self->mTgtSlideLayoutArray;
}

- (void)cacheSlideLayouts
{
  NSDictionary *v3;
  NSDictionary *mLayoutMap;

  layoutMapForSlideMaster(self->mSlideMaster);
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  mLayoutMap = self->mLayoutMap;
  self->mLayoutMap = v3;

}

- (id)slideLayoutForSlideHolder:(id)a3
{
  ESDContainer *v4;
  _DWORD *v5;
  _DWORD *v6;
  int v7;
  void *v8;
  _DWORD *v9;
  int v10;
  uint64_t v11;
  NSDictionary *mLayoutMap;
  void *v13;

  v4 = (ESDContainer *)a3;
  if (!-[PBMasterInfo useXmlBlobs](self, "useXmlBlobs"))
    goto LABEL_8;
  v5 = ESDAtomAccess<PptRoundTripContentMasterIdAtom>::first(v4, 0);
  v6 = v5;
  if (!v5
    || (v7 = v5[12], v7 != -[PBMasterInfo xmlMainMasterId](self, "xmlMainMasterId"))
    || (-[PBMasterInfo slideLayoutForXmlLayoutId:](self, "slideLayoutForXmlLayoutId:", *((unsigned __int16 *)v6 + 26)),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = ESDAtomAccess<PptRoundTripCompositeMasterIdAtom>::first(v4, 0);
    if (!v9
      || (v10 = v9[12], v10 != -[PBMasterInfo xmlMainMasterId](self, "xmlMainMasterId"))
      || (-[PBMasterInfo uniqueXmlSlideLayout](self, "uniqueXmlSlideLayout"),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_8:
      v11 = pdSlideLayoutTypeForPptSlideHolder(v4);
      mLayoutMap = self->mLayoutMap;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](mLayoutMap, "objectForKeyedSubscript:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (void)dealloc
{
  void **mSrcTextStyling;
  void *v4;
  objc_super v5;

  mSrcTextStyling = (void **)self->mSrcTextStyling;
  if (mSrcTextStyling)
  {
    v4 = *mSrcTextStyling;
    if (*mSrcTextStyling)
    {
      mSrcTextStyling[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x22E2DD408](mSrcTextStyling, 0x20C40960023A9);
  }
  self->mSrcTextStyling = 0;
  v5.receiver = self;
  v5.super_class = (Class)PBMasterInfo;
  -[PBMasterInfo dealloc](&v5, sel_dealloc);
}

- (void)setTitlePbRef:(unsigned int)a3
{
  self->mTitlePbRef = a3;
}

- (unsigned)mainPbRef
{
  return self->mMainPbRef;
}

- (unsigned)titlePbRef
{
  return self->mTitlePbRef;
}

- (void)setSlideLayout:(id)a3 forXmlLayoutId:(unsigned __int16)a4
{
  uint64_t v4;
  NSMutableDictionary *mXmlLayoutMap;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  mXmlLayoutMap = self->mXmlLayoutMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mXmlLayoutMap, "setObject:forKeyedSubscript:", v8, v7);

}

- (id)slideLayoutForXmlLayoutId:(unsigned __int16)a3
{
  NSMutableDictionary *mXmlLayoutMap;
  void *v4;
  void *v5;

  mXmlLayoutMap = self->mXmlLayoutMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mXmlLayoutMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)uniqueXmlSlideLayout
{
  void *v3;
  NSMutableDictionary *mXmlLayoutMap;
  void *v5;
  void *v6;

  -[NSMutableDictionary allKeys](self->mXmlLayoutMap, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mXmlLayoutMap = self->mXmlLayoutMap;
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mXmlLayoutMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)xmlMainMasterId
{
  return self->mXmlMainMasterId;
}

- (void)setXmlMainMasterId:(unsigned int)a3
{
  self->mXmlMainMasterId = a3;
}

- (BOOL)useXmlBlobs
{
  return self->mUseXmlBlobs;
}

- (void)setUseXmlBlobs:(BOOL)a3
{
  self->mUseXmlBlobs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mXmlLayoutMap, 0);
  objc_storeStrong((id *)&self->mLayoutMap, 0);
  objc_storeStrong((id *)&self->mTgtSlideLayoutArray, 0);
  objc_storeStrong((id *)&self->mSlideMaster, 0);
}

@end
