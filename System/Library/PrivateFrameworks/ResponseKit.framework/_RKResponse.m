@implementation _RKResponse

- (_RKResponse)init
{
  -[_RKResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_RKResponse)initWithSpeechAct:(id)a3 headword:(id)a4 text:(id)a5
{
  id v9;
  id v10;
  id v11;
  _RKResponse *v12;
  _RKResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_RKResponse;
  v12 = -[_RKResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_speechAct, a3);
    objc_storeStrong((id *)&v13->_headword, a4);
    objc_storeStrong((id *)&v13->_text, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _RKResponse *v4;
  _RKResponse *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = (_RKResponse *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_RKResponse text](self, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_RKResponse text](v5, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        v8 = -[_RKResponse type](self, "type");
        v9 = v8 == -[_RKResponse type](v5, "type");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[_RKResponse text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[_RKResponse type](self, "type") ^ v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_RKResponse text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{'%@', %lu}"), v4, -[_RKResponse type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)type
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (type_onceToken != -1)
    dispatch_once(&type_onceToken, &__block_literal_global);
  v3 = (void *)type_sSpeechActResponseType;
  -[_RKResponse speechAct](self, "speechAct");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (NSString)speechAct
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)headword
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_headword, 0);
  objc_storeStrong((id *)&self->_speechAct, 0);
}

@end
