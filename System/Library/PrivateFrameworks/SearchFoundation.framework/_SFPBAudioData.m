@implementation _SFPBAudioData

- (_SFPBAudioData)initWithFacade:(id)a3
{
  id v4;
  _SFPBAudioData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _SFPBAudioData *v24;

  v4 = a3;
  v5 = -[_SFPBAudioData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "audioBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "audioBuffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setAudioBuffer:](v5, "setAudioBuffer:", v7);

    }
    objc_msgSend(v4, "formatID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "formatID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setFormatID:](v5, "setFormatID:", v9);

    }
    objc_msgSend(v4, "formatFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "formatFlags");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setFormatFlags:](v5, "setFormatFlags:", objc_msgSend(v11, "intValue"));

    }
    if (objc_msgSend(v4, "hasSampleRate"))
    {
      objc_msgSend(v4, "sampleRate");
      -[_SFPBAudioData setSampleRate:](v5, "setSampleRate:");
    }
    objc_msgSend(v4, "bitsPerChannel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "bitsPerChannel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setBitsPerChannel:](v5, "setBitsPerChannel:", objc_msgSend(v13, "intValue"));

    }
    objc_msgSend(v4, "bytesPerFrame");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "bytesPerFrame");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setBytesPerFrame:](v5, "setBytesPerFrame:", objc_msgSend(v15, "intValue"));

    }
    objc_msgSend(v4, "channelsPerFrame");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "channelsPerFrame");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setChannelsPerFrame:](v5, "setChannelsPerFrame:", objc_msgSend(v17, "intValue"));

    }
    objc_msgSend(v4, "bytesPerPacket");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "bytesPerPacket");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setBytesPerPacket:](v5, "setBytesPerPacket:", objc_msgSend(v19, "intValue"));

    }
    objc_msgSend(v4, "framesPerPacket");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "framesPerPacket");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setFramesPerPacket:](v5, "setFramesPerPacket:", objc_msgSend(v21, "intValue"));

    }
    objc_msgSend(v4, "reserved");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "reserved");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioData setReserved:](v5, "setReserved:", objc_msgSend(v23, "intValue"));

    }
    v24 = v5;
  }

  return v5;
}

- (void)setAudioBuffer:(id)a3
{
  NSData *v4;
  NSData *audioBuffer;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  audioBuffer = self->_audioBuffer;
  self->_audioBuffer = v4;

}

- (void)setFormatID:(id)a3
{
  NSString *v4;
  NSString *formatID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  formatID = self->_formatID;
  self->_formatID = v4;

}

- (void)setFormatFlags:(int)a3
{
  self->_formatFlags = a3;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (void)setBitsPerChannel:(int)a3
{
  self->_bitsPerChannel = a3;
}

- (void)setBytesPerFrame:(int)a3
{
  self->_bytesPerFrame = a3;
}

- (void)setChannelsPerFrame:(int)a3
{
  self->_channelsPerFrame = a3;
}

- (void)setBytesPerPacket:(int)a3
{
  self->_bytesPerPacket = a3;
}

- (void)setFramesPerPacket:(int)a3
{
  self->_framesPerPacket = a3;
}

- (void)setReserved:(int)a3
{
  self->_reserved = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAudioDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBAudioData audioBuffer](self, "audioBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteDataField();

  -[_SFPBAudioData formatID](self, "formatID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBAudioData formatFlags](self, "formatFlags"))
    PBDataWriterWriteInt32Field();
  -[_SFPBAudioData sampleRate](self, "sampleRate");
  if (v6 != 0.0)
    PBDataWriterWriteDoubleField();
  if (-[_SFPBAudioData bitsPerChannel](self, "bitsPerChannel"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBAudioData bytesPerFrame](self, "bytesPerFrame"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBAudioData channelsPerFrame](self, "channelsPerFrame"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBAudioData bytesPerPacket](self, "bytesPerPacket"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBAudioData framesPerPacket](self, "framesPerPacket"))
    PBDataWriterWriteInt32Field();
  v7 = -[_SFPBAudioData reserved](self, "reserved");
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int formatFlags;
  double sampleRate;
  double v21;
  int bitsPerChannel;
  int bytesPerFrame;
  int channelsPerFrame;
  int bytesPerPacket;
  int framesPerPacket;
  int reserved;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBAudioData audioBuffer](self, "audioBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBAudioData audioBuffer](self, "audioBuffer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBAudioData audioBuffer](self, "audioBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBAudioData formatID](self, "formatID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_SFPBAudioData formatID](self, "formatID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBAudioData formatID](self, "formatID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formatID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  formatFlags = self->_formatFlags;
  if (formatFlags == objc_msgSend(v4, "formatFlags"))
  {
    sampleRate = self->_sampleRate;
    objc_msgSend(v4, "sampleRate");
    if (sampleRate == v21)
    {
      bitsPerChannel = self->_bitsPerChannel;
      if (bitsPerChannel == objc_msgSend(v4, "bitsPerChannel"))
      {
        bytesPerFrame = self->_bytesPerFrame;
        if (bytesPerFrame == objc_msgSend(v4, "bytesPerFrame"))
        {
          channelsPerFrame = self->_channelsPerFrame;
          if (channelsPerFrame == objc_msgSend(v4, "channelsPerFrame"))
          {
            bytesPerPacket = self->_bytesPerPacket;
            if (bytesPerPacket == objc_msgSend(v4, "bytesPerPacket"))
            {
              framesPerPacket = self->_framesPerPacket;
              if (framesPerPacket == objc_msgSend(v4, "framesPerPacket"))
              {
                reserved = self->_reserved;
                v17 = reserved == objc_msgSend(v4, "reserved");
                goto LABEL_13;
              }
            }
          }
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t formatFlags;
  double sampleRate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  v3 = -[NSData hash](self->_audioBuffer, "hash");
  v4 = -[NSString hash](self->_formatID, "hash");
  formatFlags = self->_formatFlags;
  sampleRate = self->_sampleRate;
  if (sampleRate == 0.0)
  {
    v10 = 0;
  }
  else
  {
    v7 = -sampleRate;
    if (sampleRate >= 0.0)
      v7 = self->_sampleRate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v10 += (unint64_t)v9;
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  return v4 ^ v3 ^ v10 ^ (2654435761 * formatFlags) ^ (2654435761 * self->_bitsPerChannel) ^ (2654435761
                                                                                                * self->_bytesPerFrame) ^ (2654435761 * self->_channelsPerFrame) ^ (2654435761 * self->_bytesPerPacket) ^ (2654435761 * self->_framesPerPacket) ^ (2654435761 * self->_reserved);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioBuffer)
  {
    -[_SFPBAudioData audioBuffer](self, "audioBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioBuffer"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioBuffer"));

    }
  }
  if (self->_bitsPerChannel)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBAudioData bitsPerChannel](self, "bitsPerChannel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bitsPerChannel"));

  }
  if (self->_bytesPerFrame)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBAudioData bytesPerFrame](self, "bytesPerFrame"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("bytesPerFrame"));

  }
  if (self->_bytesPerPacket)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBAudioData bytesPerPacket](self, "bytesPerPacket"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bytesPerPacket"));

  }
  if (self->_channelsPerFrame)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBAudioData channelsPerFrame](self, "channelsPerFrame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("channelsPerFrame"));

  }
  if (self->_formatFlags)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBAudioData formatFlags](self, "formatFlags"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("formatFlags"));

  }
  if (self->_formatID)
  {
    -[_SFPBAudioData formatID](self, "formatID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("formatID"));

  }
  if (self->_framesPerPacket)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBAudioData framesPerPacket](self, "framesPerPacket"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("framesPerPacket"));

  }
  if (self->_reserved)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBAudioData reserved](self, "reserved"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("reserved"));

  }
  if (self->_sampleRate != 0.0)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBAudioData sampleRate](self, "sampleRate");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("sampleRate"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAudioData dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBAudioData)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAudioData *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBAudioData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAudioData)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAudioData *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _SFPBAudioData *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBAudioData;
  v5 = -[_SFPBAudioData init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioBuffer"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      -[_SFPBAudioData setAudioBuffer:](v5, "setAudioBuffer:", v7);

    }
    v21 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBAudioData setFormatID:](v5, "setFormatID:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatFlags"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioData setFormatFlags:](v5, "setFormatFlags:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampleRate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      -[_SFPBAudioData setSampleRate:](v5, "setSampleRate:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bitsPerChannel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioData setBitsPerChannel:](v5, "setBitsPerChannel:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesPerFrame"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioData setBytesPerFrame:](v5, "setBytesPerFrame:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channelsPerFrame"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioData setChannelsPerFrame:](v5, "setChannelsPerFrame:", objc_msgSend(v14, "intValue"));
    v20 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesPerPacket"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioData setBytesPerPacket:](v5, "setBytesPerPacket:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("framesPerPacket"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioData setFramesPerPacket:](v5, "setFramesPerPacket:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reserved"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioData setReserved:](v5, "setReserved:", objc_msgSend(v17, "intValue"));
    v18 = v5;

  }
  return v5;
}

- (NSData)audioBuffer
{
  return self->_audioBuffer;
}

- (NSString)formatID
{
  return self->_formatID;
}

- (int)formatFlags
{
  return self->_formatFlags;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (int)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (int)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (int)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (int)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (int)framesPerPacket
{
  return self->_framesPerPacket;
}

- (int)reserved
{
  return self->_reserved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatID, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
}

@end
