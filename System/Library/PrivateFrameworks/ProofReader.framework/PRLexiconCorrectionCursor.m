@implementation PRLexiconCorrectionCursor

- (PRLexiconCorrectionCursor)initWithCursor:(_LXCursor *)a3 replacementsCount:(unint64_t)a4 insertionsCount:(unint64_t)a5 deletionsCount:(unint64_t)a6 transpositionsCount:(unint64_t)a7 advancementLength:(unint64_t)a8
{
  PRLexiconCorrectionCursor *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRLexiconCorrectionCursor;
  v14 = -[PRLexiconCorrectionCursor init](&v16, sel_init);
  if (v14)
  {
    v14->_cursor = (_LXCursor *)CFRetain(a3);
    v14->_replacementsCount = a4;
    v14->_insertionsCount = a5;
    v14->_deletionsCount = a6;
    v14->_transpositionsCount = a7;
    v14->_advancementLength = a8;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_cursor);
  v3.receiver = self;
  v3.super_class = (Class)PRLexiconCorrectionCursor;
  -[PRLexiconCorrectionCursor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%u %u %u %u len %u>"), self->_replacementsCount, self->_insertionsCount, self->_deletionsCount, self->_transpositionsCount, self->_advancementLength);
}

- (unint64_t)totalEdits
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->_replacementsCount, *(int64x2_t *)&self->_deletionsCount));
}

- (double)prefixProbability
{
  double result;

  LXCursorPrefixProbability();
  return result;
}

- (unint64_t)errorType
{
  if (-[PRLexiconCorrectionCursor totalEdits](self, "totalEdits") > 1)
    return 13;
  if (self->_replacementsCount)
    return 8;
  if (self->_insertionsCount)
    return 11;
  if (self->_deletionsCount)
    return 10;
  if (self->_transpositionsCount)
    return 9;
  return 3;
}

- (_LXCursor)cursor
{
  return self->_cursor;
}

- (unint64_t)replacementsCount
{
  return self->_replacementsCount;
}

- (unint64_t)insertionsCount
{
  return self->_insertionsCount;
}

- (unint64_t)deletionsCount
{
  return self->_deletionsCount;
}

- (unint64_t)transpositionsCount
{
  return self->_transpositionsCount;
}

- (unint64_t)advancementLength
{
  return self->_advancementLength;
}

@end
