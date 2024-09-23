@implementation IPCShieldInfoMessage

+ (id)ipcMessageForShieldInfo:(id)a3
{
  id v3;
  IPCShieldInfoMessage *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(IPCShieldInfoMessage);
  -[IPCShieldInfoMessage setShieldID:](v4, "setShieldID:", objc_msgSend(v3, "shieldID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shieldStringID"));
  -[IPCShieldInfoMessage setShieldStringID:](v4, "setShieldStringID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shieldText"));
  -[IPCShieldInfoMessage setShieldText:](v4, "setShieldText:", v6);

  return v4;
}

- (id)shieldInfo
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[IPCShieldInfoMessage shieldID](self, "shieldID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IPCShieldInfoMessage shieldStringID](self, "shieldStringID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCShieldInfoMessage shieldText](self, "shieldText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v3, v4, v5));

  return v6;
}

- (IPCShieldInfoMessage)initWithDictionary:(id)a3
{
  id v4;
  IPCShieldInfoMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IPCShieldInfoMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v10, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCShieldInfoMessageShieldIDKey")));
    -[IPCShieldInfoMessage setShieldID:](v5, "setShieldID:", objc_msgSend(v6, "integerValue"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCShieldInfoMessageShieldStringIDKey")));
    -[IPCShieldInfoMessage setShieldStringID:](v5, "setShieldStringID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCShieldInfoMessageShieldTextKey")));
    -[IPCShieldInfoMessage setShieldText:](v5, "setShieldText:", v8);

  }
  return v5;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IPCShieldInfoMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v13, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCShieldInfoMessage shieldID](self, "shieldID")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kIPCShieldInfoMessageShieldIDKey"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IPCShieldInfoMessage shieldStringID](self, "shieldStringID"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kIPCShieldInfoMessageShieldStringIDKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCShieldInfoMessage shieldText](self, "shieldText"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("kIPCShieldInfoMessageShieldTextKey"));

  v11 = objc_msgSend(v5, "copy");
  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IPCShieldInfoMessage;
  v3 = -[IPCShieldInfoMessage description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCShieldInfoMessage shieldID](self, "shieldID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCShieldInfoMessage shieldStringID](self, "shieldStringID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IPCShieldInfoMessage shieldText](self, "shieldText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@             shieldID : {%@}             shieldStringID : {%@}             shieldText : {%@}"), v4, v5, v6, v7));

  return v8;
}

- (int)shieldID
{
  return self->_shieldID;
}

- (void)setShieldID:(int)a3
{
  self->_shieldID = a3;
}

- (NSString)shieldStringID
{
  return self->_shieldStringID;
}

- (void)setShieldStringID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_shieldStringID, 0);
}

@end
