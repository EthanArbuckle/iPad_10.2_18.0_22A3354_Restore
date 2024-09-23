@implementation ICMatchRedownloadRequest

- (ICMatchRedownloadRequest)init
{
  ICMatchRedownloadRequest *v2;
  ICMatchRedownloadRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICMatchRedownloadRequest;
  v2 = -[ICMediaRedownloadRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICMediaRedownloadRequest setRequestURLBagKey:](v2, "setRequestURLBagKey:", CFSTR("paidRedownloadProduct"));
  return v3;
}

- (ICMatchRedownloadRequest)initWithRequestContext:(id)a3 itemSagaID:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  ICMatchRedownloadRequest *v10;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("sagaId");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)ICMatchRedownloadRequest;
  v10 = -[ICMediaRedownloadRequest initWithRequestContext:redownloadParameters:](&v12, sel_initWithRequestContext_redownloadParameters_, v7, v9);

  return v10;
}

@end
