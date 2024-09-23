@implementation NSDocumentDifferenceSize

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(generationCount=%ld, changeCount=%ld)"), self->_generationCount, self->_changeCount);
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(int64_t)a3
{
  self->_generationCount = a3;
}

- (int64_t)changeCount
{
  return self->_changeCount;
}

- (void)setChangeCount:(int64_t)a3
{
  self->_changeCount = a3;
}

@end
