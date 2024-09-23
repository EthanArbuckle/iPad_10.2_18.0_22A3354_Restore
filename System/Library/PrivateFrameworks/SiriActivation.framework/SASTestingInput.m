@implementation SASTestingInput

- (SASTestingInput)initWithBuilder:(id)a3
{
  SASTestingInput *v4;

  v4 = +[SASTestingInput newWithBuilder:](SASTestingInput, "newWithBuilder:", a3);

  return v4;
}

- (SASTestingInput)initWithType:(int64_t)a3 text:(id)a4 recordedSpeechURL:(id)a5
{
  id v8;
  id v9;
  SASTestingInput *v10;
  SASTestingInput *v11;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSURL *recordedSpeechURL;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SASTestingInput;
  v10 = -[SASTestingInput init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    text = v11->_text;
    v11->_text = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    recordedSpeechURL = v11->_recordedSpeechURL;
    v11->_recordedSpeechURL = (NSURL *)v14;

  }
  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  unint64_t type;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19.receiver = self;
  v19.super_class = (Class)SASTestingInput;
  -[SASTestingInput description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  type = self->_type;
  SASTestingInputTypeGetName(type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("type = %ld (%@)"), type, v7);
  v20[0] = v8;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_text, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("text = %@"), v10);
  v20[1] = v11;
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSURL description](self->_recordedSpeechURL, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("recordedSpeechURL = %@"), v13);
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@}"), v4, v16);

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_text, "hash");
  v6 = v5 ^ -[NSURL hash](self->_recordedSpeechURL, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SASTestingInput *v4;
  SASTestingInput *v5;
  int64_t type;
  NSString *v7;
  NSString *text;
  NSURL *v9;
  NSURL *recordedSpeechURL;
  BOOL v11;

  v4 = (SASTestingInput *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[SASTestingInput type](v5, "type"))
      {
        -[SASTestingInput text](v5, "text");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        text = self->_text;
        if (text == v7 || -[NSString isEqual:](text, "isEqual:", v7))
        {
          -[SASTestingInput recordedSpeechURL](v5, "recordedSpeechURL");
          v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
          recordedSpeechURL = self->_recordedSpeechURL;
          v11 = recordedSpeechURL == v9 || -[NSURL isEqual:](recordedSpeechURL, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASTestingInput)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SASTestingInput *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASTestingInput::type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASTestingInput::text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASTestingInput::recordedSpeechURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SASTestingInput initWithType:text:recordedSpeechURL:](self, "initWithType:text:recordedSpeechURL:", v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SASTestingInput::type"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_text, CFSTR("SASTestingInput::text"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_recordedSpeechURL, CFSTR("SASTestingInput::recordedSpeechURL"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)text
{
  return self->_text;
}

- (NSURL)recordedSpeechURL
{
  return self->_recordedSpeechURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedSpeechURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SASTestingInputMutation *);
  _SASTestingInputMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SASTestingInputMutation *))a3;
  v4 = objc_alloc_init(_SASTestingInputMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SASTestingInputMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SASTestingInputMutation *);
  _SASTestingInputMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SASTestingInputMutation *))a3;
  if (v4)
  {
    v5 = -[_SASTestingInputMutation initWithBaseModel:]([_SASTestingInputMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SASTestingInputMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SASTestingInput copy](self, "copy");
  }

  return v6;
}

@end
