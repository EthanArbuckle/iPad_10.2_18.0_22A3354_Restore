@implementation SVXSpeechSynthesisAudio

- (SVXSpeechSynthesisAudio)initWithData:(id)a3 decoderASBD:(id)a4 playerASBD:(id)a5
{
  id v8;
  id v9;
  id v10;
  SVXSpeechSynthesisAudio *v11;
  uint64_t v12;
  NSData *data;
  uint64_t v14;
  SVXAudioStreamBasicDescription *decoderASBD;
  uint64_t v16;
  SVXAudioStreamBasicDescription *playerASBD;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SVXSpeechSynthesisAudio;
  v11 = -[SVXSpeechSynthesisAudio init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    data = v11->_data;
    v11->_data = (NSData *)v12;

    v14 = objc_msgSend(v9, "copy");
    decoderASBD = v11->_decoderASBD;
    v11->_decoderASBD = (SVXAudioStreamBasicDescription *)v14;

    v16 = objc_msgSend(v10, "copy");
    playerASBD = v11->_playerASBD;
    v11->_playerASBD = (SVXAudioStreamBasicDescription *)v16;

  }
  return v11;
}

- (id)description
{
  return -[SVXSpeechSynthesisAudio _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXSpeechSynthesisAudio;
  -[SVXSpeechSynthesisAudio description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {data = (%llu bytes), decoderASBD = %@, playerASBD = %@}"), v5, -[NSData length](self->_data, "length"), self->_decoderASBD, self->_playerASBD);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSData hash](self->_data, "hash");
  v4 = -[SVXAudioStreamBasicDescription hash](self->_decoderASBD, "hash") ^ v3;
  return v4 ^ -[SVXAudioStreamBasicDescription hash](self->_playerASBD, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SVXSpeechSynthesisAudio *v4;
  SVXSpeechSynthesisAudio *v5;
  NSData *v6;
  NSData *data;
  SVXAudioStreamBasicDescription *v8;
  SVXAudioStreamBasicDescription *decoderASBD;
  SVXAudioStreamBasicDescription *v10;
  SVXAudioStreamBasicDescription *playerASBD;
  BOOL v12;

  v4 = (SVXSpeechSynthesisAudio *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SVXSpeechSynthesisAudio data](v5, "data");
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
      data = self->_data;
      if (data == v6 || -[NSData isEqual:](data, "isEqual:", v6))
      {
        -[SVXSpeechSynthesisAudio decoderASBD](v5, "decoderASBD");
        v8 = (SVXAudioStreamBasicDescription *)objc_claimAutoreleasedReturnValue();
        decoderASBD = self->_decoderASBD;
        if (decoderASBD == v8 || -[SVXAudioStreamBasicDescription isEqual:](decoderASBD, "isEqual:", v8))
        {
          -[SVXSpeechSynthesisAudio playerASBD](v5, "playerASBD");
          v10 = (SVXAudioStreamBasicDescription *)objc_claimAutoreleasedReturnValue();
          playerASBD = self->_playerASBD;
          v12 = playerASBD == v10 || -[SVXAudioStreamBasicDescription isEqual:](playerASBD, "isEqual:", v10);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (SVXSpeechSynthesisAudio)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SVXSpeechSynthesisAudio *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisAudio::data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisAudio::decoderASBD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisAudio::playerASBD"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SVXSpeechSynthesisAudio initWithData:decoderASBD:playerASBD:](self, "initWithData:decoderASBD:playerASBD:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("SVXSpeechSynthesisAudio::data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_decoderASBD, CFSTR("SVXSpeechSynthesisAudio::decoderASBD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playerASBD, CFSTR("SVXSpeechSynthesisAudio::playerASBD"));

}

- (NSData)data
{
  return self->_data;
}

- (SVXAudioStreamBasicDescription)decoderASBD
{
  return self->_decoderASBD;
}

- (SVXAudioStreamBasicDescription)playerASBD
{
  return self->_playerASBD;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerASBD, 0);
  objc_storeStrong((id *)&self->_decoderASBD, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXSpeechSynthesisAudioMutation *);
  _SVXSpeechSynthesisAudioMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXSpeechSynthesisAudioMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXSpeechSynthesisAudioMutation initWithBaseModel:]([_SVXSpeechSynthesisAudioMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXSpeechSynthesisAudioMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXSpeechSynthesisAudio copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXSpeechSynthesisAudioMutation *);
  _SVXSpeechSynthesisAudioMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXSpeechSynthesisAudioMutation *))a3;
  v4 = objc_alloc_init(_SVXSpeechSynthesisAudioMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXSpeechSynthesisAudioMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
