@implementation WDNote

- (WDNote)initWithParagraph:(id)a3 footnote:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  WDNote *v7;
  WDNote *v8;
  void *v9;
  WDText *v10;
  uint64_t v11;
  uint64_t v12;
  WDText *mText;
  WDCharacterRun *v14;
  WDCharacterRun *mReference;
  objc_super v17;

  v4 = a4;
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WDNote;
  v7 = -[WDRun initWithParagraph:](&v17, sel_initWithParagraph_, v6);
  v8 = v7;
  if (v7)
  {
    v7->mAutomaticNumbering = 1;
    objc_msgSend(v6, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [WDText alloc];
    if (v4)
      v11 = 1;
    else
      v11 = 5;
    v12 = -[WDText initWithDocument:textType:](v10, "initWithDocument:textType:", v9, v11);
    mText = v8->mText;
    v8->mText = (WDText *)v12;

    v14 = -[WDCharacterRun initWithParagraph:]([WDCharacterRun alloc], "initWithParagraph:", v6);
    mReference = v8->mReference;
    v8->mReference = v14;

  }
  return v8;
}

- (id)text
{
  return self->mText;
}

- (void)setAutomaticNumbering:(BOOL)a3
{
  self->mAutomaticNumbering = a3;
}

- (id)reference
{
  return self->mReference;
}

- (int)runType
{
  if (-[WDText textType](self->mText, "textType") == 1)
    return 1;
  else
    return 2;
}

- (BOOL)automaticNumbering
{
  return self->mAutomaticNumbering;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDNote;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReference, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
