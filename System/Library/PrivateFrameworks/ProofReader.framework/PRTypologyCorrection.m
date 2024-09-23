@implementation PRTypologyCorrection

- (PRTypologyCorrection)initWithString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  PRTypologyCorrection *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)PRTypologyCorrection;
  v7 = -[PRTypologyCorrection init](&v9, sel_init);
  if (v7)
  {
    v7->_misspelling = (NSString *)objc_msgSend(a3, "copy");
    v7->_misspelledRange.location = location;
    v7->_misspelledRange.length = length;
    v7->_logs = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
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
  if (self->_correctionResult)
  {
    v9.receiver = self;
    v9.super_class = (Class)PRTypologyCorrection;
    v4 = -[PRTypologyCorrection description](&v9, sel_description);
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: <%@> at %@->%@"), v4, self->_misspelling, NSStringFromRange(self->_misspelledRange), self->_correctionResult);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PRTypologyCorrection;
    v6 = -[PRTypologyCorrection description](&v8, sel_description);
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: <%@> at %@ no correction"), v6, self->_misspelling, NSStringFromRange(self->_misspelledRange), v7);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRTypologyCorrection;
  -[PRTypologyCorrection dealloc](&v3, sel_dealloc);
}

+ (id)openTypologyCorrectionWithString:(id)a3 range:(_NSRange)a4 inString:(id)a5
{
  PRTypologyCorrection *v5;
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
      v5 = -[PRTypologyCorrection initWithString:range:]([PRTypologyCorrection alloc], "initWithString:range:", a3, a4.location, a4.length);
      objc_msgSend(+[PRTypologyRecord currentTypologyRecord](PRTypologyRecord, "currentTypologyRecord"), "addCorrection:", v5);
    }
  }
  return v5;
}

- (void)addTypologyCorrectionLog:(id)a3
{
  id v3;
  uint64_t v5;

  if (self->_isOpen)
  {
    v3 = a3;
    if (a3)
      v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:locale:arguments:", a3, 0, &v5);
    -[NSMutableString appendString:](self->_logs, "appendString:", v3);
    -[NSMutableString appendString:](self->_logs, "appendString:", CFSTR("\n"));

  }
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *misspelling;
  NSMutableString *logs;
  NSTextCheckingResult *correctionResult;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  misspelling = self->_misspelling;
  if (misspelling)
    objc_msgSend(v3, "setObject:forKey:", misspelling, CFSTR("Misspelling"));
  objc_msgSend(v4, "setObject:forKey:", NSStringFromRange(self->_misspelledRange), CFSTR("MisspelledRange"));
  logs = self->_logs;
  if (logs)
    objc_msgSend(v4, "setObject:forKey:", logs, CFSTR("Logs"));
  correctionResult = self->_correctionResult;
  if (correctionResult)
    objc_msgSend(v4, "setObject:forKey:", -[NSTextCheckingResult description](correctionResult, "description"), CFSTR("CorrectionResult"));
  if (!self->_isOpen)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_closeTime - self->_openTime), CFSTR("Time"));
  return v4;
}

- (void)closeTypologyCorrectionWithResult:(id)a3
{
  if (self->_isOpen)
  {
    self->_closeTime = CFAbsoluteTimeGetCurrent();
    self->_correctionResult = (NSTextCheckingResult *)objc_msgSend(a3, "copy");
    self->_isOpen = 0;
  }
}

@end
