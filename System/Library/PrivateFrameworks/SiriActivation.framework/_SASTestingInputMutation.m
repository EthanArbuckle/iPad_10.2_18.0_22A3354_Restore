@implementation _SASTestingInputMutation

- (_SASTestingInputMutation)init
{
  return -[_SASTestingInputMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SASTestingInputMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SASTestingInputMutation *v6;
  _SASTestingInputMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SASTestingInputMutation;
  v6 = -[_SASTestingInputMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setRecordedSpeechURL:(id)a3
{
  objc_storeStrong((id *)&self->_recordedSpeechURL, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  SASTestingInput *baseModel;
  SASTestingInput *v4;
  SASTestingInput *v5;
  int64_t type;
  NSString *v7;
  NSString *v8;
  NSURL *v9;
  NSURL *v10;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SASTestingInput initWithType:text:recordedSpeechURL:]([SASTestingInput alloc], "initWithType:text:recordedSpeechURL:", self->_type, self->_text, self->_recordedSpeechURL);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SASTestingInput *)-[SASTestingInput copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    type = self->_type;
    if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_10:
    -[SASTestingInput text](self->_baseModel, "text");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  type = -[SASTestingInput type](baseModel, "type");
  if ((*(_BYTE *)&self->_mutationFlags & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = self->_text;
LABEL_11:
  v8 = v7;
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v9 = self->_recordedSpeechURL;
  }
  else
  {
    -[SASTestingInput recordedSpeechURL](self->_baseModel, "recordedSpeechURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v5 = -[SASTestingInput initWithType:text:recordedSpeechURL:]([SASTestingInput alloc], "initWithType:text:recordedSpeechURL:", type, v8, v9);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedSpeechURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
