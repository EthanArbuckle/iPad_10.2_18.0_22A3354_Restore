@implementation CHBReader

+ (void)readChart:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CHBReaderState *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(v5, "edSheet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSheet:", v7);

  objc_msgSend(v9, "setStyleId:", 0);
  v8 = -[CHBReaderState initWithEBReaderSheetState:]([CHBReaderState alloc], "initWithEBReaderSheetState:", v5);
  -[CHBReaderState setChart:](v8, "setChart:", v9);
  +[CHBChart readWithState:](CHBChart, "readWithState:", v8);

  objc_autoreleasePoolPop(v6);
}

@end
