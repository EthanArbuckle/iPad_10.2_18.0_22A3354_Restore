@implementation CSVTUITrainingResult

- (CSVTUITrainingResult)initWithSessionId:(int64_t)a3 sessionStatus:(int)a4 audioStatus:(int)a5
{
  CSVTUITrainingResult *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSVTUITrainingResult;
  result = -[CSVTUITrainingResult init](&v9, sel_init);
  if (result)
  {
    result->_sessionId = a3;
    result->_sessionStatus = a4;
    result->_audioStatus = a5;
  }
  return result;
}

- (CSVTUITrainingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VTUITrainingResultSessionId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VTUITrainingResultStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VTUITrainingAudioStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "longLongValue");
  return -[CSVTUITrainingResult initWithSessionId:sessionStatus:audioStatus:](self, "initWithSessionId:sessionStatus:audioStatus:", v6, v8, v10);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t sessionId;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  sessionId = self->_sessionId;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", sessionId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("VTUITrainingResultSessionId"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sessionStatus);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("VTUITrainingResultStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_audioStatus);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("VTUITrainingAudioStatus"));

}

- (int64_t)sessionId
{
  return self->_sessionId;
}

- (int)sessionStatus
{
  return self->_sessionStatus;
}

- (int)audioStatus
{
  return self->_audioStatus;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
