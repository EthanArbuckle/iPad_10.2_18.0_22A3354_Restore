@implementation SCMLTextModerationLMResult

- (SCMLTextModerationLMResult)init
{
  SCMLTextModerationLMResult *v2;
  SCMLTextModerationLMResult *v3;
  uint64_t v4;
  NSArray *predictions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCMLTextModerationLMResult;
  v2 = -[SCMLTextModerationLMResult init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_safe = 1;
    v4 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    predictions = v3->_predictions;
    v3->_predictions = (NSArray *)v4;

  }
  return v3;
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (void)setPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_predictions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
}

@end
