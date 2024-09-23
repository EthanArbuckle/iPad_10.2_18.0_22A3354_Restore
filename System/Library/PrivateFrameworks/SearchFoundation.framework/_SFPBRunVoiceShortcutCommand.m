@implementation _SFPBRunVoiceShortcutCommand

- (_SFPBRunVoiceShortcutCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBRunVoiceShortcutCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBRunVoiceShortcutCommand *v10;

  v4 = a3;
  v5 = -[_SFPBRunVoiceShortcutCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "voiceShortcutIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "voiceShortcutIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRunVoiceShortcutCommand setVoiceShortcutIdentifier:](v5, "setVoiceShortcutIdentifier:", v7);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRunVoiceShortcutCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setVoiceShortcutIdentifier:(id)a3
{
  NSString *v4;
  NSString *voiceShortcutIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  voiceShortcutIdentifier = self->_voiceShortcutIdentifier;
  self->_voiceShortcutIdentifier = v4;

}

- (void)setApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRunVoiceShortcutCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceShortcutIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceShortcutIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_voiceShortcutIdentifier, "hash");
  return -[NSString hash](self->_applicationBundleIdentifier, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationBundleIdentifier)
  {
    -[_SFPBRunVoiceShortcutCommand applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationBundleIdentifier"));

  }
  if (self->_voiceShortcutIdentifier)
  {
    -[_SFPBRunVoiceShortcutCommand voiceShortcutIdentifier](self, "voiceShortcutIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("voiceShortcutIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRunVoiceShortcutCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRunVoiceShortcutCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRunVoiceShortcutCommand *v5;
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
    self = -[_SFPBRunVoiceShortcutCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRunVoiceShortcutCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRunVoiceShortcutCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBRunVoiceShortcutCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRunVoiceShortcutCommand;
  v5 = -[_SFPBRunVoiceShortcutCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceShortcutIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRunVoiceShortcutCommand setVoiceShortcutIdentifier:](v5, "setVoiceShortcutIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationBundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBRunVoiceShortcutCommand setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)voiceShortcutIdentifier
{
  return self->_voiceShortcutIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceShortcutIdentifier, 0);
}

@end
