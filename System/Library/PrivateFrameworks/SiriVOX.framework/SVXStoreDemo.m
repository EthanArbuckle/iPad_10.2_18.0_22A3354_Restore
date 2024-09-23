@implementation SVXStoreDemo

- (SVXStoreDemo)initWithTranscriptID:(int64_t)a3 languageCode:(id)a4 gender:(int64_t)a5 outputVolume:(float)a6
{
  id v10;
  SVXStoreDemo *v11;
  SVXStoreDemo *v12;
  uint64_t v13;
  NSString *languageCode;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXStoreDemo;
  v11 = -[SVXStoreDemo init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_transcriptID = a3;
    v13 = objc_msgSend(v10, "copy");
    languageCode = v12->_languageCode;
    v12->_languageCode = (NSString *)v13;

    v12->_gender = a5;
    v12->_outputVolume = a6;
  }

  return v12;
}

- (id)description
{
  return -[SVXStoreDemo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t transcriptID;
  __CFString *v7;
  __CFString *v8;
  unint64_t gender;
  NSString *languageCode;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v15.receiver = self;
  v15.super_class = (Class)SVXStoreDemo;
  -[SVXStoreDemo description](&v15, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  transcriptID = self->_transcriptID;
  if (transcriptID > 0x15)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24BF78[transcriptID];
  v8 = v7;
  languageCode = self->_languageCode;
  gender = self->_gender;
  if (gender > 3)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_24D24C478[gender];
  v12 = v11;
  v13 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {transcriptID = %@, languageCode = %@, gender = %@, outputVolume = %f}"), v5, v8, languageCode, v12, self->_outputVolume);

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_transcriptID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_languageCode, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_gender);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  *(float *)&v8 = self->_outputVolume;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5 ^ v7 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SVXStoreDemo *v4;
  SVXStoreDemo *v5;
  int64_t transcriptID;
  int64_t gender;
  float outputVolume;
  float v9;
  BOOL v10;
  NSString *v12;
  NSString *languageCode;

  v4 = (SVXStoreDemo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      transcriptID = self->_transcriptID;
      if (transcriptID == -[SVXStoreDemo transcriptID](v5, "transcriptID")
        && (gender = self->_gender, gender == -[SVXStoreDemo gender](v5, "gender"))
        && (outputVolume = self->_outputVolume, -[SVXStoreDemo outputVolume](v5, "outputVolume"), outputVolume == v9))
      {
        -[SVXStoreDemo languageCode](v5, "languageCode");
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        languageCode = self->_languageCode;
        v10 = languageCode == v12 || -[NSString isEqual:](languageCode, "isEqual:", v12);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (SVXStoreDemo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  double v13;
  SVXStoreDemo *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXStoreDemo::transcriptID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXStoreDemo::languageCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXStoreDemo::gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXStoreDemo::outputVolume"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  LODWORD(v13) = v12;
  v14 = -[SVXStoreDemo initWithTranscriptID:languageCode:gender:outputVolume:](self, "initWithTranscriptID:languageCode:gender:outputVolume:", v6, v7, v9, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t transcriptID;
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  transcriptID = self->_transcriptID;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", transcriptID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SVXStoreDemo::transcriptID"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_languageCode, CFSTR("SVXStoreDemo::languageCode"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_gender);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SVXStoreDemo::gender"));

  *(float *)&v9 = self->_outputVolume;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("SVXStoreDemo::outputVolume"));

}

- (int64_t)transcriptID
{
  return self->_transcriptID;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (int64_t)gender
{
  return self->_gender;
}

- (float)outputVolume
{
  return self->_outputVolume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXStoreDemoMutation *);
  _SVXStoreDemoMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXStoreDemoMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXStoreDemoMutation initWithBaseModel:]([_SVXStoreDemoMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXStoreDemoMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXStoreDemo copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXStoreDemoMutation *);
  _SVXStoreDemoMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXStoreDemoMutation *))a3;
  v4 = objc_alloc_init(_SVXStoreDemoMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXStoreDemoMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
