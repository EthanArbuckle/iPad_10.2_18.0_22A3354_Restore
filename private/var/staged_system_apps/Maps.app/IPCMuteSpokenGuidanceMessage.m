@implementation IPCMuteSpokenGuidanceMessage

- (IPCMuteSpokenGuidanceMessage)initWithDictionary:(id)a3
{
  id v4;
  IPCMuteSpokenGuidanceMessage *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPCMuteSpokenGuidanceMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v8, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCMuteSpokenGuidanceMessageMuteNavigationKey")));
    -[IPCMuteSpokenGuidanceMessage setMuteNavigation:](v5, "setMuteNavigation:", objc_msgSend(v6, "BOOLValue"));

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IPCMuteSpokenGuidanceMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v9, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCMuteSpokenGuidanceMessage muteNavigation](self, "muteNavigation")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kIPCMuteSpokenGuidanceMessageMuteNavigationKey"));

  v7 = objc_msgSend(v5, "copy");
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPCMuteSpokenGuidanceMessage;
  v3 = -[IPCMuteSpokenGuidanceMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCMuteSpokenGuidanceMessage dictionaryValue](self, "dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)muteNavigation
{
  return self->_muteNavigation;
}

- (void)setMuteNavigation:(BOOL)a3
{
  self->_muteNavigation = a3;
}

@end
