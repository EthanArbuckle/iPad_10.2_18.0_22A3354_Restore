@implementation IPCSetNavigationVoiceVolumeMessage

- (IPCSetNavigationVoiceVolumeMessage)initWithDictionary:(id)a3
{
  id v4;
  IPCSetNavigationVoiceVolumeMessage *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPCSetNavigationVoiceVolumeMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v8, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCSetNavigationVoiceVolumeMessageRequestedVolumeKey")));
    -[IPCSetNavigationVoiceVolumeMessage setRequestedVolume:](v5, "setRequestedVolume:", v6);

  }
  return v5;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IPCSetNavigationVoiceVolumeMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v10, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCSetNavigationVoiceVolumeMessage requestedVolume](self, "requestedVolume"));
  v7 = objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIPCSetNavigationVoiceVolumeMessageRequestedVolumeKey"));

  v8 = objc_msgSend(v5, "copy");
  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPCSetNavigationVoiceVolumeMessage;
  v3 = -[IPCSetNavigationVoiceVolumeMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCSetNavigationVoiceVolumeMessage dictionaryValue](self, "dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (NSString)requestedVolume
{
  return self->_requestedVolume;
}

- (void)setRequestedVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedVolume, 0);
}

@end
