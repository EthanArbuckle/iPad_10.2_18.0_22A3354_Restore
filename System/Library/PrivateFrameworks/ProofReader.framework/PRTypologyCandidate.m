@implementation PRTypologyCandidate

- (PRTypologyCandidate)initWithString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  PRTypologyCandidate *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)PRTypologyCandidate;
  v7 = -[PRTypologyCandidate init](&v9, sel_init);
  if (v7)
  {
    v7->_candidateString = (NSString *)objc_msgSend(a3, "copy");
    v7->_selectedRange.location = location;
    v7->_selectedRange.length = length;
    v7->_isOpen = 1;
    v7->_openTime = CFAbsoluteTimeGetCurrent();
  }
  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  id v6;
  uint64_t v7;
  objc_super v8;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_result)
  {
    v9.receiver = self;
    v9.super_class = (Class)PRTypologyCandidate;
    v4 = -[PRTypologyCandidate description](&v9, sel_description);
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: <%@> at %@->%@"), v4, self->_candidateString, NSStringFromRange(self->_selectedRange), self->_result);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PRTypologyCandidate;
    v6 = -[PRTypologyCandidate description](&v8, sel_description);
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: <%@> at %@"), v6, self->_candidateString, NSStringFromRange(self->_selectedRange), v7);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRTypologyCandidate;
  -[PRTypologyCandidate dealloc](&v3, sel_dealloc);
}

+ (id)openTypologyCandidate:(id)a3 selectedRange:(_NSRange)a4 inString:(id)a5
{
  PRTypologyCandidate *v5;
  BOOL v6;

  v5 = 0;
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords)
      v6 = _typologyRecordsSerialQueue == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v5 = -[PRTypologyCandidate initWithString:range:]([PRTypologyCandidate alloc], "initWithString:range:", a3, a4.location, a4.length);
      objc_msgSend(+[PRTypologyRecord currentTypologyRecord](PRTypologyRecord, "currentTypologyRecord"), "addCandidate:", v5);
    }
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *candidateString;
  NSTextCheckingResult *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  candidateString = self->_candidateString;
  if (candidateString)
    objc_msgSend(v3, "setObject:forKey:", candidateString, CFSTR("CandidateString"));
  objc_msgSend(v4, "setObject:forKey:", NSStringFromRange(self->_selectedRange), CFSTR("SelectedRange"));
  v6 = self->_result;
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", -[NSTextCheckingResult description](v6, "description"), CFSTR("Result"));
  if (!self->_isOpen)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_closeTime - self->_openTime), CFSTR("Time"));
  return v4;
}

- (void)closeTypologyCandidateWithResult:(id)a3
{
  if (self->_isOpen)
  {
    self->_closeTime = CFAbsoluteTimeGetCurrent();
    self->_result = (NSTextCheckingResult *)objc_msgSend(a3, "copy");
    self->_isOpen = 0;
  }
}

@end
