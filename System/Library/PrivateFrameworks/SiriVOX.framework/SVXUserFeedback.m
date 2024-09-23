@implementation SVXUserFeedback

- (SVXUserFeedback)initWithIdentifier:(id)a3 contentType:(int64_t)a4 audioContent:(id)a5 voiceContent:(id)a6
{
  id v10;
  id v11;
  id v12;
  SVXUserFeedback *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  SVXUserFeedbackAudioContent *audioContent;
  uint64_t v18;
  SVXUserFeedbackVoiceContent *voiceContent;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SVXUserFeedback;
  v13 = -[SVXUserFeedback init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_contentType = a4;
    v16 = objc_msgSend(v11, "copy");
    audioContent = v13->_audioContent;
    v13->_audioContent = (SVXUserFeedbackAudioContent *)v16;

    v18 = objc_msgSend(v12, "copy");
    voiceContent = v13->_voiceContent;
    v13->_voiceContent = (SVXUserFeedbackVoiceContent *)v18;

  }
  return v13;
}

- (id)description
{
  return -[SVXUserFeedback _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t contentType;
  NSString *identifier;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v12.receiver = self;
  v12.super_class = (Class)SVXUserFeedback;
  -[SVXUserFeedback description](&v12, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  contentType = self->_contentType;
  if (contentType > 2)
    v8 = CFSTR("(unknown)");
  else
    v8 = off_24D24C380[contentType];
  v9 = v8;
  v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, contentType = %@, audioContent = %@, voiceContent = %@}"), v5, identifier, v9, self->_audioContent, self->_voiceContent);

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_contentType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[SVXUserFeedbackAudioContent hash](self->_audioContent, "hash");
  v7 = v5 ^ v6 ^ -[SVXUserFeedbackVoiceContent hash](self->_voiceContent, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SVXUserFeedback *v4;
  SVXUserFeedback *v5;
  int64_t contentType;
  NSString *v7;
  NSString *identifier;
  SVXUserFeedbackAudioContent *v9;
  SVXUserFeedbackAudioContent *audioContent;
  SVXUserFeedbackVoiceContent *v11;
  SVXUserFeedbackVoiceContent *voiceContent;
  BOOL v13;

  v4 = (SVXUserFeedback *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      contentType = self->_contentType;
      if (contentType == -[SVXUserFeedback contentType](v5, "contentType"))
      {
        -[SVXUserFeedback identifier](v5, "identifier");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        if (identifier == v7 || -[NSString isEqual:](identifier, "isEqual:", v7))
        {
          -[SVXUserFeedback audioContent](v5, "audioContent");
          v9 = (SVXUserFeedbackAudioContent *)objc_claimAutoreleasedReturnValue();
          audioContent = self->_audioContent;
          if (audioContent == v9 || -[SVXUserFeedbackAudioContent isEqual:](audioContent, "isEqual:", v9))
          {
            -[SVXUserFeedback voiceContent](v5, "voiceContent");
            v11 = (SVXUserFeedbackVoiceContent *)objc_claimAutoreleasedReturnValue();
            voiceContent = self->_voiceContent;
            v13 = voiceContent == v11 || -[SVXUserFeedbackVoiceContent isEqual:](voiceContent, "isEqual:", v11);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (SVXUserFeedback)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SVXUserFeedback *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedback::identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedback::contentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedback::audioContent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedback::voiceContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SVXUserFeedback initWithIdentifier:contentType:audioContent:voiceContent:](self, "initWithIdentifier:contentType:audioContent:voiceContent:", v5, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("SVXUserFeedback::identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_contentType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SVXUserFeedback::contentType"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_audioContent, CFSTR("SVXUserFeedback::audioContent"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_voiceContent, CFSTR("SVXUserFeedback::voiceContent"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (SVXUserFeedbackAudioContent)audioContent
{
  return self->_audioContent;
}

- (SVXUserFeedbackVoiceContent)voiceContent
{
  return self->_voiceContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceContent, 0);
  objc_storeStrong((id *)&self->_audioContent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXUserFeedbackMutation *);
  _SVXUserFeedbackMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXUserFeedbackMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXUserFeedbackMutation initWithBaseModel:]([_SVXUserFeedbackMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXUserFeedbackMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXUserFeedback copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXUserFeedbackMutation *);
  _SVXUserFeedbackMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXUserFeedbackMutation *))a3;
  v4 = objc_alloc_init(_SVXUserFeedbackMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXUserFeedbackMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
