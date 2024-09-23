@implementation SVXSpeechSynthesisRequest

- (SVXSpeechSynthesisRequest)initWithPriority:(int64_t)a3 options:(unint64_t)a4 speakableText:(id)a5 speakableContext:(id)a6 localizationKey:(id)a7 presynthesizedAudio:(id)a8 streamID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SVXSpeechSynthesisRequest *v20;
  SVXSpeechSynthesisRequest *v21;
  uint64_t v22;
  NSString *speakableText;
  uint64_t v24;
  NSDictionary *speakableContext;
  uint64_t v26;
  NSString *localizationKey;
  uint64_t v28;
  SVXSpeechSynthesisAudio *presynthesizedAudio;
  uint64_t v30;
  NSString *streamID;
  objc_super v33;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SVXSpeechSynthesisRequest;
  v20 = -[SVXSpeechSynthesisRequest init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_priority = a3;
    v20->_options = a4;
    v22 = objc_msgSend(v15, "copy");
    speakableText = v21->_speakableText;
    v21->_speakableText = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    speakableContext = v21->_speakableContext;
    v21->_speakableContext = (NSDictionary *)v24;

    v26 = objc_msgSend(v17, "copy");
    localizationKey = v21->_localizationKey;
    v21->_localizationKey = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    presynthesizedAudio = v21->_presynthesizedAudio;
    v21->_presynthesizedAudio = (SVXSpeechSynthesisAudio *)v28;

    v30 = objc_msgSend(v19, "copy");
    streamID = v21->_streamID;
    v21->_streamID = (NSString *)v30;

  }
  return v21;
}

- (id)description
{
  return -[SVXSpeechSynthesisRequest _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t priority;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v13.receiver = self;
  v13.super_class = (Class)SVXSpeechSynthesisRequest;
  -[SVXSpeechSynthesisRequest description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  priority = self->_priority;
  if (priority > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24CD50[priority];
  v8 = v7;
  SVXSpeechSynthesisOptionsGetNames(self->_options);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("|"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {priority = %@, options = %@, speakableText = %@, speakableContext = %@, localizationKey = %@, presynthesizedAudio = %@, streamID = %@}"), v5, v8, v10, self->_speakableText, self->_speakableContext, self->_localizationKey, self->_presynthesizedAudio, self->_streamID);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  NSUInteger v11;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_priority);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSString hash](self->_speakableText, "hash");
  v8 = v7 ^ -[NSDictionary hash](self->_speakableContext, "hash");
  v9 = v8 ^ -[NSString hash](self->_localizationKey, "hash");
  v10 = v6 ^ v9 ^ -[SVXSpeechSynthesisAudio hash](self->_presynthesizedAudio, "hash");
  v11 = v10 ^ -[NSString hash](self->_streamID, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SVXSpeechSynthesisRequest *v4;
  SVXSpeechSynthesisRequest *v5;
  int64_t priority;
  unint64_t options;
  NSString *v8;
  NSString *speakableText;
  NSDictionary *v10;
  NSDictionary *speakableContext;
  NSString *v12;
  NSString *localizationKey;
  SVXSpeechSynthesisAudio *v14;
  SVXSpeechSynthesisAudio *presynthesizedAudio;
  NSString *v16;
  NSString *streamID;
  BOOL v18;

  v4 = (SVXSpeechSynthesisRequest *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      priority = self->_priority;
      if (priority == -[SVXSpeechSynthesisRequest priority](v5, "priority")
        && (options = self->_options, options == -[SVXSpeechSynthesisRequest options](v5, "options")))
      {
        -[SVXSpeechSynthesisRequest speakableText](v5, "speakableText");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        speakableText = self->_speakableText;
        if (speakableText == v8 || -[NSString isEqual:](speakableText, "isEqual:", v8))
        {
          -[SVXSpeechSynthesisRequest speakableContext](v5, "speakableContext");
          v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          speakableContext = self->_speakableContext;
          if (speakableContext == v10 || -[NSDictionary isEqual:](speakableContext, "isEqual:", v10))
          {
            -[SVXSpeechSynthesisRequest localizationKey](v5, "localizationKey");
            v12 = (NSString *)objc_claimAutoreleasedReturnValue();
            localizationKey = self->_localizationKey;
            if (localizationKey == v12 || -[NSString isEqual:](localizationKey, "isEqual:", v12))
            {
              -[SVXSpeechSynthesisRequest presynthesizedAudio](v5, "presynthesizedAudio");
              v14 = (SVXSpeechSynthesisAudio *)objc_claimAutoreleasedReturnValue();
              presynthesizedAudio = self->_presynthesizedAudio;
              if (presynthesizedAudio == v14
                || -[SVXSpeechSynthesisAudio isEqual:](presynthesizedAudio, "isEqual:", v14))
              {
                -[SVXSpeechSynthesisRequest streamID](v5, "streamID");
                v16 = (NSString *)objc_claimAutoreleasedReturnValue();
                streamID = self->_streamID;
                v18 = streamID == v16 || -[NSString isEqual:](streamID, "isEqual:", v16);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (SVXSpeechSynthesisRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SVXSpeechSynthesisRequest *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisRequest::priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisRequest::options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisRequest::speakableText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("SVXSpeechSynthesisRequest::speakableContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisRequest::localizationKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisRequest::presynthesizedAudio"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisRequest::streamID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:](self, "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", v6, v8, v9, v14, v15, v16, v17);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t priority;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  priority = self->_priority;
  v8 = a3;
  objc_msgSend(v4, "numberWithInteger:", priority);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("SVXSpeechSynthesisRequest::priority"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_options);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("SVXSpeechSynthesisRequest::options"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_speakableText, CFSTR("SVXSpeechSynthesisRequest::speakableText"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_speakableContext, CFSTR("SVXSpeechSynthesisRequest::speakableContext"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_localizationKey, CFSTR("SVXSpeechSynthesisRequest::localizationKey"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_presynthesizedAudio, CFSTR("SVXSpeechSynthesisRequest::presynthesizedAudio"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_streamID, CFSTR("SVXSpeechSynthesisRequest::streamID"));

}

- (int64_t)priority
{
  return self->_priority;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)speakableText
{
  return self->_speakableText;
}

- (NSDictionary)speakableContext
{
  return self->_speakableContext;
}

- (NSString)localizationKey
{
  return self->_localizationKey;
}

- (SVXSpeechSynthesisAudio)presynthesizedAudio
{
  return self->_presynthesizedAudio;
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong((id *)&self->_presynthesizedAudio, 0);
  objc_storeStrong((id *)&self->_localizationKey, 0);
  objc_storeStrong((id *)&self->_speakableContext, 0);
  objc_storeStrong((id *)&self->_speakableText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXSpeechSynthesisRequestMutation *);
  _SVXSpeechSynthesisRequestMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXSpeechSynthesisRequestMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXSpeechSynthesisRequestMutation initWithBaseModel:]([_SVXSpeechSynthesisRequestMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXSpeechSynthesisRequestMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXSpeechSynthesisRequest copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXSpeechSynthesisRequestMutation *);
  _SVXSpeechSynthesisRequestMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXSpeechSynthesisRequestMutation *))a3;
  v4 = objc_alloc_init(_SVXSpeechSynthesisRequestMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXSpeechSynthesisRequestMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
