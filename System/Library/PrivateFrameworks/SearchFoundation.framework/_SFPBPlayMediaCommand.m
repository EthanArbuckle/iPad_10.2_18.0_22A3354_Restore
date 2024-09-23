@implementation _SFPBPlayMediaCommand

- (_SFPBPlayMediaCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBPlayMediaCommand *v5;
  void *v6;
  _SFPBMediaMetadata *v7;
  void *v8;
  _SFPBMediaMetadata *v9;
  void *v10;
  _SFPBAudioData *v11;
  void *v12;
  _SFPBAudioData *v13;
  _SFPBPlayMediaCommand *v14;

  v4 = a3;
  v5 = -[_SFPBPlayMediaCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBMediaMetadata alloc];
      objc_msgSend(v4, "mediaMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBMediaMetadata initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBPlayMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v9);

    }
    if (objc_msgSend(v4, "hasPlaybackLocation"))
      -[_SFPBPlayMediaCommand setPlaybackLocation:](v5, "setPlaybackLocation:", objc_msgSend(v4, "playbackLocation"));
    if (objc_msgSend(v4, "hasShouldPause"))
      -[_SFPBPlayMediaCommand setShouldPause:](v5, "setShouldPause:", objc_msgSend(v4, "shouldPause"));
    objc_msgSend(v4, "audioData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBAudioData alloc];
      objc_msgSend(v4, "audioData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBAudioData initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBPlayMediaCommand setAudioData:](v5, "setAudioData:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setMediaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (void)setPlaybackLocation:(int)a3
{
  self->_playbackLocation = a3;
}

- (void)setShouldPause:(BOOL)a3
{
  self->_shouldPause = a3;
}

- (void)setAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_audioData, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPlayMediaCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBPlayMediaCommand mediaMetadata](self, "mediaMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBPlayMediaCommand playbackLocation](self, "playbackLocation"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBPlayMediaCommand shouldPause](self, "shouldPause"))
    PBDataWriterWriteBOOLField();
  -[_SFPBPlayMediaCommand audioData](self, "audioData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

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
  int playbackLocation;
  int shouldPause;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[_SFPBPlayMediaCommand mediaMetadata](self, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_13;
  -[_SFPBPlayMediaCommand mediaMetadata](self, "mediaMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPlayMediaCommand mediaMetadata](self, "mediaMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_14;
  }
  else
  {

  }
  playbackLocation = self->_playbackLocation;
  if (playbackLocation != objc_msgSend(v4, "playbackLocation"))
    goto LABEL_14;
  shouldPause = self->_shouldPause;
  if (shouldPause != objc_msgSend(v4, "shouldPause"))
    goto LABEL_14;
  -[_SFPBPlayMediaCommand audioData](self, "audioData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBPlayMediaCommand audioData](self, "audioData");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_17:
      v19 = 1;
      goto LABEL_15;
    }
    v15 = (void *)v14;
    -[_SFPBPlayMediaCommand audioData](self, "audioData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
LABEL_13:

  }
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[_SFPBMediaMetadata hash](self->_mediaMetadata, "hash");
  if (self->_shouldPause)
    v5 = 2654435761;
  else
    v5 = 0;
  v4 = 2654435761 * self->_playbackLocation;
  return v4 ^ v3 ^ v5 ^ -[_SFPBAudioData hash](self->_audioData, "hash");
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
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioData)
  {
    -[_SFPBPlayMediaCommand audioData](self, "audioData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioData"));

    }
  }
  if (self->_mediaMetadata)
  {
    -[_SFPBPlayMediaCommand mediaMetadata](self, "mediaMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mediaMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mediaMetadata"));

    }
  }
  if (self->_playbackLocation)
  {
    v10 = -[_SFPBPlayMediaCommand playbackLocation](self, "playbackLocation");
    if (v10 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E4042190 + v10);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("playbackLocation"));

  }
  if (self->_shouldPause)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPlayMediaCommand shouldPause](self, "shouldPause"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("shouldPause"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPlayMediaCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPlayMediaCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPlayMediaCommand *v5;
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
    self = -[_SFPBPlayMediaCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPlayMediaCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPlayMediaCommand *v5;
  void *v6;
  _SFPBMediaMetadata *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBAudioData *v11;
  _SFPBPlayMediaCommand *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBPlayMediaCommand;
  v5 = -[_SFPBPlayMediaCommand init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBMediaMetadata initWithDictionary:]([_SFPBMediaMetadata alloc], "initWithDictionary:", v6);
      -[_SFPBPlayMediaCommand setMediaMetadata:](v5, "setMediaMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackLocation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPlayMediaCommand setPlaybackLocation:](v5, "setPlaybackLocation:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldPause"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPlayMediaCommand setShouldPause:](v5, "setShouldPause:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBAudioData initWithDictionary:]([_SFPBAudioData alloc], "initWithDictionary:", v10);
      -[_SFPBPlayMediaCommand setAudioData:](v5, "setAudioData:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (_SFPBMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (int)playbackLocation
{
  return self->_playbackLocation;
}

- (BOOL)shouldPause
{
  return self->_shouldPause;
}

- (_SFPBAudioData)audioData
{
  return self->_audioData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

@end
