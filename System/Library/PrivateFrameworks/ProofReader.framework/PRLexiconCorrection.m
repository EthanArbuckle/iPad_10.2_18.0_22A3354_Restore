@implementation PRLexiconCorrection

- (PRLexiconCorrection)initWithTokenID:(unsigned int)a3 score:(double)a4 errorType:(unint64_t)a5
{
  PRLexiconCorrection *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRLexiconCorrection;
  result = -[PRLexiconCorrection init](&v9, sel_init);
  if (result)
  {
    result->_tokenID = a3;
    result->_score = a4;
    result->_errorType = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%u %.4g %u>"), self->_tokenID, *(_QWORD *)&self->_score, self->_errorType);
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)errorType
{
  return self->_errorType;
}

@end
