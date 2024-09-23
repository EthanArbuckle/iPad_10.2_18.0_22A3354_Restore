@implementation WTSmartReplyConfiguration

- (WTSmartReplyConfiguration)initWithInputContextHistory:(id)a3
{
  id v5;
  WTSmartReplyConfiguration *v6;
  WTSmartReplyConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WTSmartReplyConfiguration;
  v6 = -[WTSmartReplyConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inputContextHistory, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WTSmartReplyConfiguration baseResponse](self, "baseResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WTSmartReplyConfiguration baseResponse](self, "baseResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("BaseResponseKey"));

  }
  -[WTSmartReplyConfiguration entryPoint](self, "entryPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WTSmartReplyConfiguration entryPoint](self, "entryPoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("SelectedEntryKey"));

  }
  -[WTSmartReplyConfiguration inputContextHistory](self, "inputContextHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WTSmartReplyConfiguration inputContextHistory](self, "inputContextHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("InputContextHistoryKey"));

  }
}

- (WTSmartReplyConfiguration)initWithCoder:(id)a3
{
  id v4;
  WTSmartReplyConfiguration *v5;
  uint64_t v6;
  NSString *baseResponse;
  uint64_t v8;
  NSString *entryPoint;
  uint64_t v10;
  TIInputContextHistory *inputContextHistory;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WTSmartReplyConfiguration;
  v5 = -[WTSmartReplyConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BaseResponseKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    baseResponse = v5->_baseResponse;
    v5->_baseResponse = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SelectedEntryKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    entryPoint = v5->_entryPoint;
    v5->_entryPoint = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InputContextHistoryKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)baseResponse
{
  return self->_baseResponse;
}

- (void)setBaseResponse:(id)a3
{
  objc_storeStrong((id *)&self->_baseResponse, a3);
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
  objc_storeStrong((id *)&self->_entryPoint, a3);
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_baseResponse, 0);
}

@end
