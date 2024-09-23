@implementation PSGLMWrapper

- (void)dealloc
{
  objc_super v3;

  if (self->_langModel)
    LMLanguageModelRelease();
  if (self->_lexicon)
    LMLexiconRelease();
  v3.receiver = self;
  v3.super_class = (Class)PSGLMWrapper;
  -[PSGLMWrapper dealloc](&v3, sel_dealloc);
}

- (PSGLMWrapper)initWithLangModel:(void *)a3 lexicon:(void *)a4
{
  PSGLMWrapper *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSGLMWrapper;
  result = -[PSGLMWrapper init](&v7, sel_init);
  if (result)
  {
    result->_langModel = a3;
    result->_lexicon = a4;
  }
  return result;
}

- (void)langModel
{
  return self->_langModel;
}

- (void)lexicon
{
  return self->_lexicon;
}

@end
