@implementation WDBlock

- (WDBlock)initWithText:(id)a3
{
  WDBlock *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDBlock;
  result = -[WDBlock init](&v5, sel_init);
  if (result)
    result->mText = (WDText *)a3;
  return result;
}

- (id)document
{
  return -[WDText document](self->mText, "document");
}

- (int)textType
{
  return -[WDText textType](self->mText, "textType");
}

- (id)text
{
  return self->mText;
}

- (int)blockType
{
  return 0;
}

- (WDBlock)init
{

  return 0;
}

- (id)runIterator
{
  return 0;
}

- (id)newRunIterator
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
  v3.super_class = (Class)WDBlock;
  -[WDBlock description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
