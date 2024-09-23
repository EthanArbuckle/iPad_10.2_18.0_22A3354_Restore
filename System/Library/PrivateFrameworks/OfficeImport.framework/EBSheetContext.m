@implementation EBSheetContext

- (EBSheetContext)initWithSheetIndex:(unsigned int)a3 state:(id)a4
{
  id v6;
  EBSheetContext *v7;
  EBReaderSheetState *v8;
  EBReaderSheetState *mSheetState;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EBSheetContext;
  v7 = -[EBSheetContext init](&v16, sel_init);
  if (v7)
  {
    v8 = -[EBReaderSheetState initWithReaderState:]([EBReaderSheetState alloc], "initWithReaderState:", v6);
    mSheetState = v7->mSheetState;
    v7->mSheetState = v8;

    v7->mSheetIndex = a3;
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "threadDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", CFSTR("kSheetCountInEntireDocument"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v13 + 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("kSheetCountInEntireDocument"));

  }
  return v7;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  EBReaderSheetState *mSheetState;
  void *v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)MEMORY[0x22E2DDB58](+[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("Delayed reading of sheet"), 1.0, 0.9));
    -[EBReaderSheetState setEDSheet:](self->mSheetState, "setEDSheet:", v4);
    -[EBReaderSheetState readerState](self->mSheetState, "readerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resumeReading");

    +[EBSheet readDelayedSheetWithIndex:state:](EBSheet, "readDelayedSheetWithIndex:state:", self->mSheetIndex, self->mSheetState);
    -[EBReaderSheetState readerState](self->mSheetState, "readerState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pauseReading");

    mSheetState = self->mSheetState;
    self->mSheetState = 0;

    objc_autoreleasePoolPop(v6);
    +[TCProgressContext endStage](TCProgressContext, "endStage");
    objc_msgSend(v4, "setLoaded:", 1);
    v10 = (void *)MEMORY[0x22E2DDB58](+[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("Applying processors for delayed sheet"), 1.0, 0.1));
    objc_msgSend(v4, "applyProcessors");
    objc_autoreleasePoolPop(v10);
    +[TCProgressContext endStage](TCProgressContext, "endStage");

  }
  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSheetState, 0);
}

@end
