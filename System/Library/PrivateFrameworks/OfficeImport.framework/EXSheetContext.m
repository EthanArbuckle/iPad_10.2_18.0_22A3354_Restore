@implementation EXSheetContext

- (EXSheetContext)initWithSheetLocation:(id)a3 sheetXmlType:(id)a4 state:(id)a5
{
  id v9;
  id v10;
  id v11;
  EXSheetContext *v12;
  EXSheetContext *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EXSheetContext;
  v12 = -[EXSheetContext init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mSheetState, a5);
    objc_storeStrong((id *)&v13->mPackageLocation, a3);
    objc_storeStrong((id *)&v13->mType, a4);
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "threadDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKey:", CFSTR("kSheetCountInEntireDocument"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v17 + 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("kSheetCountInEntireDocument"));

  }
  return v13;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4;
  void *v5;
  EXReadState *mSheetState;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->mPackageLocation && self->mSheetState)
  {
    +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", 1.0, 1.0);
    v5 = (void *)MEMORY[0x22E2DDB58](+[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("Delayed reading of sheet"), 1.0, 0.9));
    -[EXReadState setCurrentSheet:](self->mSheetState, "setCurrentSheet:", v4);
    +[EXSheet readDelayedSheeWithLocation:sheetXmlType:state:](EXSheet, "readDelayedSheeWithLocation:sheetXmlType:state:", self->mPackageLocation, self->mType, self->mSheetState);
    -[EXReadState setCurrentSheet:](self->mSheetState, "setCurrentSheet:", 0);
    -[EXReadState resetForNewSheet](self->mSheetState, "resetForNewSheet");
    mSheetState = self->mSheetState;
    self->mSheetState = 0;

    objc_autoreleasePoolPop(v5);
    +[TCProgressContext endStage](TCProgressContext, "endStage");
    objc_msgSend(v4, "setLoaded:", 1);
    v7 = (void *)MEMORY[0x22E2DDB58](+[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("Applying processors for delayed sheet"), 1.0, 0.1));
    objc_msgSend(v4, "applyProcessors");
    objc_autoreleasePoolPop(v7);
    +[TCProgressContext endStage](TCProgressContext, "endStage");
    +[TCProgressContext endStage](TCProgressContext, "endStage");

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mType, 0);
  objc_storeStrong((id *)&self->mPackageLocation, 0);
  objc_storeStrong((id *)&self->mSheetState, 0);
}

@end
