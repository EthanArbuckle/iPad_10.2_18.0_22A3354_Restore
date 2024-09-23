@implementation SFPlayMediaCommand

- (SFPlayMediaCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFPlayMediaCommand *v5;
  void *v6;
  SFMediaMetadata *v7;
  void *v8;
  SFMediaMetadata *v9;
  void *v10;
  SFAudioData *v11;
  void *v12;
  SFAudioData *v13;
  SFPlayMediaCommand *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPlayMediaCommand;
  v5 = -[SFPlayMediaCommand init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFMediaMetadata alloc];
      objc_msgSend(v4, "mediaMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFMediaMetadata initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFPlayMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v9);

    }
    if (objc_msgSend(v4, "playbackLocation"))
      -[SFPlayMediaCommand setPlaybackLocation:](v5, "setPlaybackLocation:", objc_msgSend(v4, "playbackLocation"));
    if (objc_msgSend(v4, "shouldPause"))
      -[SFPlayMediaCommand setShouldPause:](v5, "setShouldPause:", objc_msgSend(v4, "shouldPause"));
    objc_msgSend(v4, "audioData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFAudioData alloc];
      objc_msgSend(v4, "audioData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFAudioData initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFPlayMediaCommand setAudioData:](v5, "setAudioData:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setPlaybackLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playbackLocation = a3;
}

- (BOOL)hasPlaybackLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setShouldPause:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldPause = a3;
}

- (BOOL)hasShouldPause
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFPlayMediaCommand)initWithCoder:(id)a3
{
  id v4;
  SFPlayMediaCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SFPlayMediaCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand mediaMetadata](v8, "mediaMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPlayMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v9);

    -[SFPlayMediaCommand setPlaybackLocation:](v5, "setPlaybackLocation:", -[SFCommand playbackLocation](v8, "playbackLocation"));
    -[SFPlayMediaCommand setShouldPause:](v5, "setShouldPause:", -[SFCommand shouldPause](v8, "shouldPause"));
    -[SFCommand audioData](v8, "audioData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPlayMediaCommand setAudioData:](v5, "setAudioData:", v10);

    -[SFCommand commandDetail](v8, "commandDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v11);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v12);

    -[SFCommand backendData](v8, "backendData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v13);

    -[SFCommand commandReference](v8, "commandReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFPlayMediaCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPlayMediaCommand *v2;
  void *v3;

  v2 = -[_SFPBPlayMediaCommand initWithFacade:]([_SFPBPlayMediaCommand alloc], "initWithFacade:", self);
  -[_SFPBPlayMediaCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPlayMediaCommand *v2;
  void *v3;

  v2 = -[_SFPBPlayMediaCommand initWithFacade:]([_SFPBPlayMediaCommand alloc], "initWithFacade:", self);
  -[_SFPBPlayMediaCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFPlayMediaCommand;
  v4 = -[SFCommand copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SFPlayMediaCommand mediaMetadata](self, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMediaMetadata:", v6);

  objc_msgSend(v4, "setPlaybackLocation:", -[SFPlayMediaCommand playbackLocation](self, "playbackLocation"));
  objc_msgSend(v4, "setShouldPause:", -[SFPlayMediaCommand shouldPause](self, "shouldPause"));
  -[SFPlayMediaCommand audioData](self, "audioData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAudioData:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFPlayMediaCommand *v6;
  SFPlayMediaCommand *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v6 = (SFPlayMediaCommand *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPlayMediaCommand isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v23.receiver = self;
      v23.super_class = (Class)SFPlayMediaCommand;
      if (-[SFCommand isEqual:](&v23, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFPlayMediaCommand mediaMetadata](self, "mediaMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPlayMediaCommand mediaMetadata](v7, "mediaMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
        -[SFPlayMediaCommand mediaMetadata](self, "mediaMetadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFPlayMediaCommand mediaMetadata](self, "mediaMetadata"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFPlayMediaCommand mediaMetadata](v7, "mediaMetadata"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFPlayMediaCommand playbackLocation](self, "playbackLocation");
          if (v12 == -[SFPlayMediaCommand playbackLocation](v7, "playbackLocation"))
          {
            v13 = -[SFPlayMediaCommand shouldPause](self, "shouldPause");
            if (v13 == -[SFPlayMediaCommand shouldPause](v7, "shouldPause"))
            {
              -[SFPlayMediaCommand audioData](self, "audioData");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPlayMediaCommand audioData](v7, "audioData");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v14 == 0) != (v15 != 0))
              {
                v21 = v14;
                v22 = v15;
                -[SFPlayMediaCommand audioData](self, "audioData");
                v16 = objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v20 = (void *)v16;
                  -[SFPlayMediaCommand audioData](self, "audioData");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFPlayMediaCommand audioData](v7, "audioData");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = objc_msgSend(v17, "isEqual:", v18);

                  if (!v10)
                    goto LABEL_20;
                }
                else
                {

                  v11 = 1;
                  if (!v10)
                    goto LABEL_20;
                }
                goto LABEL_19;
              }

            }
          }
          v11 = 0;
          if (!v10)
          {
LABEL_20:

            goto LABEL_21;
          }
        }
        else
        {
          v11 = 0;
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFPlayMediaCommand;
  v3 = -[SFCommand hash](&v11, sel_hash);
  -[SFPlayMediaCommand mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFPlayMediaCommand playbackLocation](self, "playbackLocation");
  v7 = v6 ^ -[SFPlayMediaCommand shouldPause](self, "shouldPause");
  -[SFPlayMediaCommand audioData](self, "audioData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (SFMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (void)setMediaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (int)playbackLocation
{
  return self->_playbackLocation;
}

- (BOOL)shouldPause
{
  return self->_shouldPause;
}

- (SFAudioData)audioData
{
  return self->_audioData;
}

- (void)setAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_audioData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
