@implementation SVXUserFeedbackVoiceContent

- (SVXUserFeedbackVoiceContent)initWithText:(id)a3 isPhonetic:(BOOL)a4
{
  id v6;
  SVXUserFeedbackVoiceContent *v7;
  uint64_t v8;
  NSString *text;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SVXUserFeedbackVoiceContent;
  v7 = -[SVXUserFeedbackVoiceContent init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_isPhonetic = a4;
  }

  return v7;
}

- (id)description
{
  return -[SVXUserFeedbackVoiceContent _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10.receiver = self;
  v10.super_class = (Class)SVXUserFeedbackVoiceContent;
  -[SVXUserFeedbackVoiceContent description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isPhonetic)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {text = %@, isPhonetic = %@}"), v5, self->_text, v7);

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_text, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPhonetic);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SVXUserFeedbackVoiceContent *v4;
  SVXUserFeedbackVoiceContent *v5;
  _BOOL4 isPhonetic;
  NSString *v7;
  NSString *text;
  BOOL v9;

  v4 = (SVXUserFeedbackVoiceContent *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isPhonetic = self->_isPhonetic;
      if (isPhonetic == -[SVXUserFeedbackVoiceContent isPhonetic](v5, "isPhonetic"))
      {
        -[SVXUserFeedbackVoiceContent text](v5, "text");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        text = self->_text;
        v9 = text == v7 || -[NSString isEqual:](text, "isEqual:", v7);

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

- (SVXUserFeedbackVoiceContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SVXUserFeedbackVoiceContent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackVoiceContent::text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackVoiceContent::isPhonetic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  v8 = -[SVXUserFeedbackVoiceContent initWithText:isPhonetic:](self, "initWithText:isPhonetic:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;
  id v6;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("SVXUserFeedbackVoiceContent::text"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPhonetic);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("SVXUserFeedbackVoiceContent::isPhonetic"));

}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isPhonetic
{
  return self->_isPhonetic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXUserFeedbackVoiceContentMutation *);
  _SVXUserFeedbackVoiceContentMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXUserFeedbackVoiceContentMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXUserFeedbackVoiceContentMutation initWithBaseModel:]([_SVXUserFeedbackVoiceContentMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXUserFeedbackVoiceContentMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXUserFeedbackVoiceContent copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXUserFeedbackVoiceContentMutation *);
  _SVXUserFeedbackVoiceContentMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXUserFeedbackVoiceContentMutation *))a3;
  v4 = objc_alloc_init(_SVXUserFeedbackVoiceContentMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXUserFeedbackVoiceContentMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
