@implementation ATCRTResponse

- (ATCRTResponse)init
{
  -[ATCRTResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ATCRTResponse)initWithFourCharacterCode:(unsigned int)a3 byte0:(unsigned __int8)a4 resultDescriptionFunction:(void *)a5
{
  ATCRTResponse *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATCRTResponse;
  result = -[ATCRTResponse init](&v9, sel_init);
  if (result)
  {
    result->_code = a3;
    result->_result = a4 & 0xF;
    result->_resultDescFunc = a5;
  }
  return result;
}

- (BOOL)success
{
  return self->_result == 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  stringForFourCharCode(self->_code);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ATCRT Response: %@\n\tResult: %s (%u)\n"), v4, ((uint64_t (*)(_QWORD))self->_resultDescFunc)(self->_result), self->_result);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)code
{
  return self->_code;
}

- (unsigned)result
{
  return self->_result;
}

@end
