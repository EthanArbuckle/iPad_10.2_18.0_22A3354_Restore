@implementation THGlossaryController

- (THGlossaryController)initWithModel:(id)a3 documentRoot:(id)a4
{
  THGlossaryController *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THGlossaryController;
  result = -[THGlossaryController init](&v7, "init");
  if (result)
  {
    result->mDocumentRoot = (THDocumentRoot *)a4;
    result->mModel = (THModelGlossary *)a3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->mAlphabeticalTermIndex = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryController;
  -[THGlossaryController dealloc](&v3, "dealloc");
}

- (id)alphabeticalTermIndex
{
  id result;

  result = self->mAlphabeticalTermIndex;
  if (!result)
  {
    result = +[THGlossaryIndex alphabeticalIndexForGlossary:withPrefix:](THGlossaryIndex, "alphabeticalIndexForGlossary:withPrefix:", self->mModel, 0);
    self->mAlphabeticalTermIndex = (THGlossaryIndex *)result;
  }
  return result;
}

- (id)entryForPath:(id)a3
{
  return -[THModelGlossary entryForPath:](self->mModel, "entryForPath:", a3);
}

- (THModelGlossary)model
{
  return self->mModel;
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

@end
