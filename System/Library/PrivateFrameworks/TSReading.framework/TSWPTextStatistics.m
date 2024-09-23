@implementation TSWPTextStatistics

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setWordCount:", self->_wordCount);
  objc_msgSend(v4, "setCharactersNoWhiteSpace:", self->_charactersNoWhiteSpace);
  objc_msgSend(v4, "setParagraphCount:", self->_paragraphCount);
  objc_msgSend(v4, "setIsAccurate:", self->_isAccurate);
  return v4;
}

- (void)resetStatistics
{
  -[TSWPTextStatistics setWordCount:](self, "setWordCount:", 0);
  -[TSWPTextStatistics setCharactersNoWhiteSpace:](self, "setCharactersNoWhiteSpace:", 0);
  -[TSWPTextStatistics setParagraphCount:](self, "setParagraphCount:", 0);
  -[TSWPTextStatistics setIsAccurate:](self, "setIsAccurate:", 0);
}

- (void)setTextStatistics:(id)a3
{
  -[TSWPTextStatistics setWordCount:](self, "setWordCount:", objc_msgSend(a3, "wordCount"));
  -[TSWPTextStatistics setCharactersNoWhiteSpace:](self, "setCharactersNoWhiteSpace:", objc_msgSend(a3, "charactersNoWhiteSpace"));
  -[TSWPTextStatistics setParagraphCount:](self, "setParagraphCount:", objc_msgSend(a3, "paragraphCount"));
}

- (void)addTextStatistics:(id)a3
{
  -[TSWPTextStatistics setWordCount:](self, "setWordCount:", objc_msgSend(a3, "wordCount") + -[TSWPTextStatistics wordCount](self, "wordCount"));
  -[TSWPTextStatistics setCharactersNoWhiteSpace:](self, "setCharactersNoWhiteSpace:", objc_msgSend(a3, "charactersNoWhiteSpace")+ -[TSWPTextStatistics charactersNoWhiteSpace](self, "charactersNoWhiteSpace"));
  -[TSWPTextStatistics setParagraphCount:](self, "setParagraphCount:", objc_msgSend(a3, "paragraphCount") + -[TSWPTextStatistics paragraphCount](self, "paragraphCount"));
}

- (void)removeTextStatistics:(id)a3
{
  -[TSWPTextStatistics setWordCount:](self, "setWordCount:", -[TSWPTextStatistics wordCount](self, "wordCount") - objc_msgSend(a3, "wordCount"));
  -[TSWPTextStatistics setCharactersNoWhiteSpace:](self, "setCharactersNoWhiteSpace:", -[TSWPTextStatistics charactersNoWhiteSpace](self, "charactersNoWhiteSpace")- objc_msgSend(a3, "charactersNoWhiteSpace"));
  -[TSWPTextStatistics setParagraphCount:](self, "setParagraphCount:", -[TSWPTextStatistics paragraphCount](self, "paragraphCount") - objc_msgSend(a3, "paragraphCount"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class();
  return v5 == objc_opt_class()
      && self->_wordCount == *((_QWORD *)a3 + 1)
      && self->_charactersNoWhiteSpace == *((_QWORD *)a3 + 2)
      && self->_paragraphCount == *((_QWORD *)a3 + 3)
      && self->_isAccurate == *((unsigned __int8 *)a3 + 32);
}

- (unint64_t)wordCount
{
  return self->_wordCount;
}

- (void)setWordCount:(unint64_t)a3
{
  self->_wordCount = a3;
}

- (unint64_t)charactersNoWhiteSpace
{
  return self->_charactersNoWhiteSpace;
}

- (void)setCharactersNoWhiteSpace:(unint64_t)a3
{
  self->_charactersNoWhiteSpace = a3;
}

- (unint64_t)paragraphCount
{
  return self->_paragraphCount;
}

- (void)setParagraphCount:(unint64_t)a3
{
  self->_paragraphCount = a3;
}

- (BOOL)isAccurate
{
  return self->_isAccurate;
}

- (void)setIsAccurate:(BOOL)a3
{
  self->_isAccurate = a3;
}

@end
