@implementation SVXDeactivationOptions

- (SVXDeactivationOptions)initWithAudioSessionDeactivationDelay:(double)a3
{
  SVXDeactivationOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SVXDeactivationOptions;
  result = -[SVXDeactivationOptions init](&v5, sel_init);
  if (result)
    result->_audioSessionDeactivationDelay = a3;
  return result;
}

- (id)description
{
  return -[SVXDeactivationOptions _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXDeactivationOptions;
  -[SVXDeactivationOptions description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {audioSessionDeactivationDelay = %f}"), v5, *(_QWORD *)&self->_audioSessionDeactivationDelay);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_audioSessionDeactivationDelay);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeactivationOptions *v4;
  double audioSessionDeactivationDelay;
  double v6;
  BOOL v7;

  v4 = (SVXDeactivationOptions *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      audioSessionDeactivationDelay = self->_audioSessionDeactivationDelay;
      -[SVXDeactivationOptions audioSessionDeactivationDelay](v4, "audioSessionDeactivationDelay");
      v7 = audioSessionDeactivationDelay == v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (SVXDeactivationOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeactivationOptions::audioSessionDeactivationDelay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return -[SVXDeactivationOptions initWithAudioSessionDeactivationDelay:](self, "initWithAudioSessionDeactivationDelay:", v7);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  double audioSessionDeactivationDelay;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  audioSessionDeactivationDelay = self->_audioSessionDeactivationDelay;
  v5 = a3;
  objc_msgSend(v3, "numberWithDouble:", audioSessionDeactivationDelay);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("SVXDeactivationOptions::audioSessionDeactivationDelay"));

}

- (double)audioSessionDeactivationDelay
{
  return self->_audioSessionDeactivationDelay;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeactivationOptionsMutation *);
  _SVXDeactivationOptionsMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeactivationOptionsMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeactivationOptionsMutation initWithBaseModel:]([_SVXDeactivationOptionsMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeactivationOptionsMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeactivationOptions copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeactivationOptionsMutation *);
  _SVXDeactivationOptionsMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeactivationOptionsMutation *))a3;
  v4 = objc_alloc_init(_SVXDeactivationOptionsMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeactivationOptionsMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
