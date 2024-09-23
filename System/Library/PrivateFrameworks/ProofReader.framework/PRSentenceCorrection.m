@implementation PRSentenceCorrection

- (PRSentenceCorrection)initWithCategory:(int)a3 range:(_NSRange)a4 word:(id)a5 corrections:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  PRSentenceCorrection *v11;
  PRSentenceCorrection *v12;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)PRSentenceCorrection;
  v11 = -[PRSentenceCorrection init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_category = a3;
    v11->_range.location = location;
    v11->_range.length = length;
    v11->_word = (NSString *)objc_msgSend(a5, "copy");
    v12->_corrections = (NSArray *)objc_msgSend(a6, "copy");
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSentenceCorrection;
  -[PRSentenceCorrection dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lu)%@<%@>(%@)"), self->_category, NSStringFromRange(self->_range), self->_word, -[NSArray componentsJoinedByString:](self->_corrections, "componentsJoinedByString:", CFSTR("/")));
}

- (int)category
{
  return self->_category;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)word
{
  return self->_word;
}

- (id)corrections
{
  return self->_corrections;
}

- (BOOL)presentAsSpellingError
{
  return 0;
}

- (BOOL)presentAsAutocorrection
{
  return (self->_category & 0xFFFFFFFE) == 4;
}

- (BOOL)presentAsGrammarError
{
  if (presentAsGrammarError_onceToken != -1)
    dispatch_once(&presentAsGrammarError_onceToken, &__block_literal_global_5);
  return (self->_category & 0xFFFFFFFE) == 4;
}

uint64_t __45__PRSentenceCorrection_presentAsGrammarError__block_invoke()
{
  uint64_t result;

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSSpellCheckerSentenceCorrectionSubjectVerbEnabled")))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSSpellCheckerSentenceCorrectionSubjectVerbEnabled"));
  }
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSSpellCheckerSentenceCorrectionMissingArticleEnabled"));
  if (result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSSpellCheckerSentenceCorrectionMissingArticleEnabled"));
  return result;
}

@end
