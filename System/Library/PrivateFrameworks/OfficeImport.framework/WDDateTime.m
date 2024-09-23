@implementation WDDateTime

- (WDDateTime)initWithParagraph:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  WDDateTime *v8;
  WDCharacterProperties *v9;
  void *v10;
  WDCharacterProperties *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WDDateTime;
  v8 = -[WDRunWithCharacterProperties initWithParagraph:](&v13, sel_initWithParagraph_, v6);
  if (v8)
  {
    v9 = [WDCharacterProperties alloc];
    objc_msgSend(v6, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WDCharacterProperties initWithDocument:](v9, "initWithDocument:", v10);
    -[WDRunWithCharacterProperties setProperties:](v8, "setProperties:", v11);

    objc_storeStrong((id *)&v8->mDate, a4);
  }

  return v8;
}

- (id)date
{
  return self->mDate;
}

- (int)runType
{
  return 13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDDateTime;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDate, 0);
}

@end
