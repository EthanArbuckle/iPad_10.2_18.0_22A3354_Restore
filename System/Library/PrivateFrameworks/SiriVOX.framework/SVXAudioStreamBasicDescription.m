@implementation SVXAudioStreamBasicDescription

- (SVXAudioStreamBasicDescription)initWithSampleRate:(double)a3 formatID:(unsigned int)a4 formatFlags:(unsigned int)a5 bytesPerPacket:(unsigned int)a6 framesPerPacket:(unsigned int)a7 bytesPerFrame:(unsigned int)a8 channelsPerFrame:(unsigned int)a9 bitsPerChannel:(unsigned int)a10 reserved:(unsigned int)a11
{
  SVXAudioStreamBasicDescription *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SVXAudioStreamBasicDescription;
  result = -[SVXAudioStreamBasicDescription init](&v19, sel_init);
  if (result)
  {
    result->_sampleRate = a3;
    result->_formatID = a4;
    result->_formatFlags = a5;
    result->_bytesPerPacket = a6;
    result->_framesPerPacket = a7;
    result->_bytesPerFrame = a8;
    result->_channelsPerFrame = a9;
    result->_bitsPerChannel = a10;
    result->_reserved = a11;
  }
  return result;
}

- (id)description
{
  return -[SVXAudioStreamBasicDescription _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXAudioStreamBasicDescription;
  -[SVXAudioStreamBasicDescription description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {sampleRate = %f, formatID = %u, formatFlags = %u, bytesPerPacket = %u, framesPerPacket = %u, bytesPerFrame = %u, channelsPerFrame = %u, bitsPerChannel = %u, reserved = %u}"), v5, *(_QWORD *)&self->_sampleRate, self->_formatID, self->_formatFlags, self->_bytesPerPacket, self->_framesPerPacket, self->_bytesPerFrame, self->_channelsPerFrame, self->_bitsPerChannel, self->_reserved);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_sampleRate);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v21, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_formatID);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v20, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_formatFlags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bytesPerPacket);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_framesPerPacket);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bytesPerFrame);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelsPerFrame);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bitsPerChannel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reserved);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14 ^ v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  SVXAudioStreamBasicDescription *v4;
  SVXAudioStreamBasicDescription *v5;
  double sampleRate;
  double v7;
  unsigned int formatID;
  unsigned int formatFlags;
  unsigned int bytesPerPacket;
  unsigned int framesPerPacket;
  unsigned int bytesPerFrame;
  unsigned int channelsPerFrame;
  unsigned int bitsPerChannel;
  unsigned int reserved;
  BOOL v16;

  v4 = (SVXAudioStreamBasicDescription *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sampleRate = self->_sampleRate;
      -[SVXAudioStreamBasicDescription sampleRate](v5, "sampleRate");
      if (sampleRate == v7
        && (formatID = self->_formatID, formatID == -[SVXAudioStreamBasicDescription formatID](v5, "formatID"))
        && (formatFlags = self->_formatFlags,
            formatFlags == -[SVXAudioStreamBasicDescription formatFlags](v5, "formatFlags"))
        && (bytesPerPacket = self->_bytesPerPacket,
            bytesPerPacket == -[SVXAudioStreamBasicDescription bytesPerPacket](v5, "bytesPerPacket"))
        && (framesPerPacket = self->_framesPerPacket,
            framesPerPacket == -[SVXAudioStreamBasicDescription framesPerPacket](v5, "framesPerPacket"))
        && (bytesPerFrame = self->_bytesPerFrame,
            bytesPerFrame == -[SVXAudioStreamBasicDescription bytesPerFrame](v5, "bytesPerFrame"))
        && (channelsPerFrame = self->_channelsPerFrame,
            channelsPerFrame == -[SVXAudioStreamBasicDescription channelsPerFrame](v5, "channelsPerFrame"))
        && (bitsPerChannel = self->_bitsPerChannel,
            bitsPerChannel == -[SVXAudioStreamBasicDescription bitsPerChannel](v5, "bitsPerChannel")))
      {
        reserved = self->_reserved;
        v16 = reserved == -[SVXAudioStreamBasicDescription reserved](v5, "reserved");
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (SVXAudioStreamBasicDescription)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::sampleRate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::formatID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::formatFlags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::bytesPerPacket"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::framesPerPacket"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::bytesPerFrame"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::channelsPerFrame"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::bitsPerChannel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAudioStreamBasicDescription::reserved"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v21, "unsignedIntValue");
  return -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:](self, "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", v8, v10, v12, v14, v16, v18, v6, __PAIR64__(v3, v20));
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double sampleRate;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDD16E0];
  sampleRate = self->_sampleRate;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", sampleRate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SVXAudioStreamBasicDescription::sampleRate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_formatID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SVXAudioStreamBasicDescription::formatID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_formatFlags);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("SVXAudioStreamBasicDescription::formatFlags"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bytesPerPacket);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("SVXAudioStreamBasicDescription::bytesPerPacket"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_framesPerPacket);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("SVXAudioStreamBasicDescription::framesPerPacket"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bytesPerFrame);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("SVXAudioStreamBasicDescription::bytesPerFrame"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelsPerFrame);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("SVXAudioStreamBasicDescription::channelsPerFrame"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bitsPerChannel);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("SVXAudioStreamBasicDescription::bitsPerChannel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reserved);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v15, CFSTR("SVXAudioStreamBasicDescription::reserved"));

}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)formatID
{
  return self->_formatID;
}

- (unsigned)formatFlags
{
  return self->_formatFlags;
}

- (unsigned)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (unsigned)framesPerPacket
{
  return self->_framesPerPacket;
}

- (unsigned)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (unsigned)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (unsigned)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (unsigned)reserved
{
  return self->_reserved;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXAudioStreamBasicDescriptionMutation *);
  _SVXAudioStreamBasicDescriptionMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXAudioStreamBasicDescriptionMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXAudioStreamBasicDescriptionMutation initWithBaseModel:]([_SVXAudioStreamBasicDescriptionMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXAudioStreamBasicDescriptionMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXAudioStreamBasicDescription copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXAudioStreamBasicDescriptionMutation *);
  _SVXAudioStreamBasicDescriptionMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXAudioStreamBasicDescriptionMutation *))a3;
  v4 = objc_alloc_init(_SVXAudioStreamBasicDescriptionMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXAudioStreamBasicDescriptionMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
