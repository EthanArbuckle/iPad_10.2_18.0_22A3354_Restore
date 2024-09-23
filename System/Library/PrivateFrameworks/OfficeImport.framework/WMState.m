@implementation WMState

- (WMState)init
{
  WMState *v2;
  CMOutlineState *v3;
  CMOutlineState *outlineState;
  WDText *mLastHeader;
  WDText *mLastFooter;
  uint64_t v7;
  NSMutableArray *paragraphStack;
  WMState *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WMState;
  v2 = -[CMState init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CMOutlineState);
    outlineState = v2->outlineState;
    v2->outlineState = v3;

    v2->mCurrentPage = 0;
    v2->mPageHeight = 980.0;
    mLastHeader = v2->mLastHeader;
    v2->mLastHeader = 0;

    mLastFooter = v2->mLastFooter;
    v2->mLastFooter = 0;

    v7 = objc_opt_new();
    paragraphStack = v2->_paragraphStack;
    v2->_paragraphStack = (NSMutableArray *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)setTopMargin:(float)a3
{
  self->mTopMargin = a3;
}

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
}

- (void)setPageHeight:(float)a3
{
  self->mPageHeight = a3;
}

- (id)lastHeader
{
  return self->mLastHeader;
}

- (void)setBlockIndex:(unint64_t)a3
{
  self->mBlockIndex = a3;
}

- (void)setIsFrame:(BOOL)a3
{
  self->mIsFrame = a3;
}

- (void)setIsFrameStart:(BOOL)a3
{
  self->mIsFrameStart = a3;
}

- (void)setIsFrameEnd:(BOOL)a3
{
  self->mIsFrameEnd = a3;
}

- (BOOL)isFrame
{
  return self->mIsFrame;
}

- (void)setRunIndex:(unint64_t)a3
{
  self->mRunIndex = a3;
}

- (unsigned)currentPage
{
  return self->mCurrentPage;
}

- (void)setCurrentPage:(unsigned int)a3
{
  self->mCurrentPage = a3;
}

- (id)currentListState
{
  return self->currentListState;
}

- (BOOL)isCurrentListStateOverridden
{
  return self->currentListState != 0;
}

- (void)setCurrentListState:(id)a3
{
  CMOutlineState *v4;
  CMOutlineState *currentListState;

  v4 = (CMOutlineState *)a3;
  -[WMState clearCurrentListState](self, "clearCurrentListState");
  currentListState = self->currentListState;
  self->currentListState = v4;

}

- (void)clearCurrentListState
{
  CMOutlineState *currentListState;

  currentListState = self->currentListState;
  self->currentListState = 0;

}

- (id)lastFooter
{
  return self->mLastFooter;
}

- (void)dealloc
{
  objc_super v3;

  -[WMState clearCurrentListState](self, "clearCurrentListState");
  v3.receiver = self;
  v3.super_class = (Class)WMState;
  -[WMState dealloc](&v3, sel_dealloc);
}

- (void)setLastFooter:(id)a3
{
  objc_storeStrong((id *)&self->mLastFooter, a3);
}

- (void)setIsHeaderOrFooter:(BOOL)a3
{
  self->mIsHeaderOrFooter = a3;
}

- (unint64_t)blockIndex
{
  return self->mBlockIndex;
}

- (BOOL)isFrameStart
{
  return self->mIsFrameStart;
}

- (BOOL)isFrameEnd
{
  return self->mIsFrameEnd;
}

- (void)setLastHeader:(id)a3
{
  objc_storeStrong((id *)&self->mLastHeader, a3);
}

- (BOOL)isHeaderOrFooter
{
  return self->mIsHeaderOrFooter;
}

- (float)pageOffset
{
  unsigned int mCurrentPage;

  mCurrentPage = self->mCurrentPage;
  if (mCurrentPage)
    return (double)mCurrentPage * self->mPageHeight;
  else
    return 0.0;
}

- (float)totalPageHeight
{
  return self->mTotalPageHeight;
}

- (void)setTotalPageHeight:(float)a3
{
  self->mTotalPageHeight = a3;
}

- (id)outlineState
{
  return self->outlineState;
}

- (unint64_t)runIndex
{
  return self->mRunIndex;
}

- (float)topMargin
{
  return self->mTopMargin;
}

- (float)leftMargin
{
  return self->mLeftMargin;
}

- (BOOL)isCurrentListDefinitionId:(int)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[WMState isCurrentListStateOverridden](self, "isCurrentListStateOverridden"))
    return 0;
  -[WMState currentListState](self, "currentListState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listDefinition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "listDefinitionId") == a3;

  return v7;
}

- (id)listStateForListDefinitionId:(int)a3
{
  NSMutableDictionary *listStates;
  void *v4;
  void *v5;

  listStates = self->listStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](listStates, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)listStateForListDefinitionWithId:(int)a3 settingUpStateIfNeededWithDocument:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  CMOutlineState *v8;
  void *v9;
  CMOutlineState *v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[WMState listStateForListDefinitionId:](self, "listStateForListDefinitionId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v6, "listDefinitionWithListDefinitionId:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CMOutlineState initWithListDefinition:]([CMOutlineState alloc], "initWithListDefinition:", v9);
    -[WMState setListState:forListDefinitionId:](self, "setListState:forListDefinitionId:", v10, v4);
    v8 = v10;

  }
  return v8;
}

- (void)setListState:(id)a3 forListDefinitionId:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *listStates;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  listStates = self->listStates;
  if (!listStates)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    v8 = self->listStates;
    self->listStates = v7;

    listStates = self->listStates;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](listStates, "setObject:forKey:", v10, v9);

}

- (float)pageHeight
{
  return self->mPageHeight;
}

- (void)pushParagraph:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WMState paragraphStack](self, "paragraphStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)popParagraph
{
  id v2;

  -[WMState paragraphStack](self, "paragraphStack");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeLastObject");

}

- (BOOL)containsParagraph:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WMState paragraphStack](self, "paragraphStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSMutableArray)paragraphStack
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setParagraphStack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraphStack, 0);
  objc_storeStrong((id *)&self->mLastFooter, 0);
  objc_storeStrong((id *)&self->mLastHeader, 0);
  objc_storeStrong((id *)&self->listStates, 0);
  objc_storeStrong((id *)&self->outlineState, 0);
  objc_storeStrong((id *)&self->currentListState, 0);
}

@end
