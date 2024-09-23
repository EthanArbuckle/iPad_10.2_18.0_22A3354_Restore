@implementation PRRecordedCorrection

- (PRRecordedCorrection)initWithCorrectionResult:(id)a3 correctedString:(id)a4
{
  PRRecordedCorrection *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRRecordedCorrection;
  v6 = -[PRRecordedCorrection init](&v8, sel_init);
  if (v6)
  {
    v6->_correctionResult = (NSTextCheckingResult *)objc_msgSend(a3, "copy");
    v6->_correctedString = (NSString *)objc_msgSend(a4, "copy");
    v6->_hasRecordedResponse = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRRecordedCorrection;
  -[PRRecordedCorrection dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRRecordedCorrection;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@->%@ %d"), -[PRRecordedCorrection description](&v3, sel_description), self->_correctedString, self->_correctionResult, self->_hasRecordedResponse);
}

- (id)correctionResult
{
  return self->_correctionResult;
}

- (id)correctedString
{
  return self->_correctedString;
}

- (BOOL)hasRecordedResponse
{
  return self->_hasRecordedResponse;
}

- (void)setHasRecordedResponse:(BOOL)a3
{
  self->_hasRecordedResponse = a3;
}

@end
