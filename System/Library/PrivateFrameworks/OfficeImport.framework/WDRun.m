@implementation WDRun

- (WDRun)initWithParagraph:(id)a3
{
  id v4;
  WDRun *v5;
  WDRun *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDRun;
  v5 = -[WDRun init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mParagraph, v4);

  return v6;
}

- (WDParagraph)paragraph
{
  return (WDParagraph *)objc_loadWeakRetained((id *)&self->mParagraph);
}

- (int)runType
{
  return 0;
}

- (WDRun)init
{

  return 0;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDRun;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mParagraph);
}

@end
