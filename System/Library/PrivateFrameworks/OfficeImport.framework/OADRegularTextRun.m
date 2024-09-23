@implementation OADRegularTextRun

- (OADRegularTextRun)init
{
  OADRegularTextRun *v2;
  NSMutableString *v3;
  NSMutableString *mText;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADRegularTextRun;
  v2 = -[OADTextRun init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mText = v2->mText;
    v2->mText = v3;

  }
  return v2;
}

- (id)text
{
  return self->mText;
}

- (BOOL)isEmpty
{
  return -[NSMutableString length](self->mText, "length") == 0;
}

- (unint64_t)characterCount
{
  return -[NSMutableString length](self->mText, "length");
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADRegularTextRun;
  if (-[OADTextRun isSimilarToTextRun:](&v9, sel_isSimilarToTextRun_, v4))
  {
    -[OADRegularTextRun text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
}

@end
