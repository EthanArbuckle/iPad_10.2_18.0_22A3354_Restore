@implementation SUCoreConnectMessage

- (SUCoreConnectMessage)initWithType:(int64_t)a3 messageName:(id)a4 clientID:(id)a5 version:(id)a6 message:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SUCoreConnectMessage *v17;
  SUCoreConnectMessage *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *clientID;
  void *v23;
  NSError *error;
  SUCoreConnectMessage *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  objc_super v30;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("SUCoreConnectMessage requires a non-nil messageName");
LABEL_10:
    objc_msgSend(v26, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreConnectMessage"), v28, 8102, 0);

    v25 = 0;
    goto LABEL_11;
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("SUCoreConnectMessage requires a non-nil clientID");
    goto LABEL_10;
  }
  if (!+[SUCoreConnectMessage validateMessageDictionary:](SUCoreConnectMessage, "validateMessageDictionary:", v16))
  {
    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("SUCoreConnectMessage requires a valid message dictionary");
    goto LABEL_10;
  }
  v30.receiver = self;
  v30.super_class = (Class)SUCoreConnectMessage;
  v17 = -[SUCoreConnectMessage init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_messageType = a3;
    objc_storeStrong((id *)&v17->_messageName, a4);
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.<%d>"), v14, objc_msgSend(v20, "processIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    clientID = v18->_clientID;
    v18->_clientID = (NSString *)v21;

    objc_storeStrong((id *)&v18->_clientIDRaw, a5);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_clientProcessIdentifier = objc_msgSend(v23, "processIdentifier");

    objc_storeStrong((id *)&v18->_version, a6);
    error = v18->_error;
    v18->_error = 0;

    objc_storeStrong((id *)&v18->_message, a7);
  }
  self = v18;
  v25 = self;
LABEL_11:

  return v25;
}

+ (BOOL)validateMessageDictionary:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SUCoreConnectMessage messageType](self, "messageType"), CFSTR("MessageType"));
  -[SUCoreConnectMessage messageName](self, "messageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MessageName"));

  -[SUCoreConnectMessage clientID](self, "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ClientID"));

  -[SUCoreConnectMessage clientIDRaw](self, "clientIDRaw");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ClientIDRaw"));

  objc_msgSend(v4, "encodeInt:forKey:", -[SUCoreConnectMessage clientProcessIdentifier](self, "clientProcessIdentifier"), CFSTR("ClientProcessIdentifier"));
  -[SUCoreConnectMessage version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Version"));

  -[SUCoreConnectMessage error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("Error"));

  -[SUCoreConnectMessage message](self, "message");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("Message"));

}

- (SUCoreConnectMessage)initWithCoder:(id)a3
{
  id v4;
  SUCoreConnectMessage *v5;
  uint64_t v6;
  NSString *messageName;
  uint64_t v8;
  NSString *clientID;
  uint64_t v10;
  NSString *clientIDRaw;
  uint64_t v12;
  SUCoreConnectVersion *version;
  uint64_t v14;
  NSError *error;
  int64_t messageType;
  void *v17;
  uint64_t v18;
  NSDictionary *message;
  void *v20;
  uint64_t v21;
  NSError *v22;
  NSDictionary *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSError *v27;
  NSDictionary *v28;
  void *v29;
  void *v30;
  NSError *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSError *v36;
  NSDictionary *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SUCoreConnectMessage;
  v5 = -[SUCoreConnectMessage init](&v39, sel_init);
  if (v5)
  {
    v5->_messageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MessageType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MessageName"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageName = v5->_messageName;
    v5->_messageName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientID"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientIDRaw"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientIDRaw = v5->_clientIDRaw;
    v5->_clientIDRaw = (NSString *)v10;

    v5->_clientProcessIdentifier = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ClientProcessIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
    v12 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (SUCoreConnectVersion *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Error"));
    v14 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v14;

    messageType = v5->_messageType;
    if (messageType == 2)
    {
      +[SUCoreConnectClientPolicy getAllowlistedClassesForKey:](SUCoreConnectClientPolicy, "getAllowlistedClassesForKey:", v5->_messageName);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
LABEL_7:
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("Message"));
        v18 = objc_claimAutoreleasedReturnValue();
        message = v5->_message;
        v5->_message = (NSDictionary *)v18;

LABEL_13:
        goto LABEL_14;
      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("client policy does not define allowlisted classes for key: %@"), v5->_messageName);
      objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "buildError:underlying:description:", 8902, v5->_error, v24);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v5->_error;
      v5->_error = (NSError *)v35;

      v37 = v5->_message;
      v5->_message = 0;

      objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = v5->_error;
      v32 = v24;
      v33 = 8902;
    }
    else
    {
      if (messageType != 1)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("no connect policy type could be determined for message with type: %ld"), v5->_messageType);
        objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "buildError:underlying:description:", 8901, v5->_error, v17);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v5->_error;
        v5->_error = (NSError *)v21;

        v23 = v5->_message;
        v5->_message = 0;

        objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "trackError:forReason:withResult:withError:", CFSTR("SUCoreConnectMessageDecode"), v17, 8901, v5->_error);
LABEL_12:

        goto LABEL_13;
      }
      +[SUCoreConnectServerPolicy getAllowlistedClassesForKey:](SUCoreConnectServerPolicy, "getAllowlistedClassesForKey:", v5->_messageName);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        goto LABEL_7;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("server policy does not define allowlisted classes for key: %@"), v5->_messageName);
      objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "buildError:underlying:description:", 8904, v5->_error, v24);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v5->_error;
      v5->_error = (NSError *)v26;

      v28 = v5->_message;
      v5->_message = 0;

      objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = v5->_error;
      v32 = v24;
      v33 = 8904;
    }
    objc_msgSend(v29, "trackError:forReason:withResult:withError:", CFSTR("SUCoreConnectMessageDecode"), v32, v33, v31);

    goto LABEL_12;
  }
LABEL_14:

  return v5;
}

+ (id)nameForMessageType:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("CLIENT_MESSAGE");
  if (a3 == 2)
  {
    v3 = CFSTR("SERVER_MESSAGE");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UNKNOWN_TYPE(%lu)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreConnectMessage clientID](self, "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreConnectMessage nameForMessageType:](SUCoreConnectMessage, "nameForMessageType:", -[SUCoreConnectMessage messageType](self, "messageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectMessage messageName](self, "messageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCoreConnectMessage(clientID:%@|type:%@|name:%@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  SUCoreConnectMessage *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  SUCoreConnectMessage *v34;
  id obj;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v2 = self;
  v49 = *MEMORY[0x24BDAC8D0];
  -[SUCoreConnectMessage message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("[>>>\n");
  if (!v3)
    v4 = 0;
  v5 = v4;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[SUCoreConnectMessage message](v2, "message");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v37)
  {
    v6 = *(_QWORD *)v44;
    v33 = *(_QWORD *)v44;
    v34 = v2;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v44 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[SUCoreConnectMessage message](v2, "message");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v38 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = v5;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v40;
            v15 = CFSTR("{\n");
            do
            {
              v16 = 0;
              v17 = v15;
              do
              {
                if (*(_QWORD *)v40 != v14)
                  objc_enumerationMutation(v11);
                v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v16);
                objc_msgSend(v11, "objectForKey:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", CFSTR("\t\t%@: %@\n"), v18, v19);
                v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

                ++v16;
                v17 = v15;
              }
              while (v13 != v16);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v13);
          }
          else
          {
            v15 = CFSTR("{\n");
          }

          v20 = v36;
          -[__CFString stringByAppendingFormat:](v36, "stringByAppendingFormat:", CFSTR("\t%@: %@\n\t}\n"), v8, v15);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v6 = v33;
          v2 = v34;
        }
        else
        {
          -[SUCoreConnectMessage message](v2, "message");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString objectForKey:](v15, "objectForKey:", v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("\t%@: %@\n"), v8, v20);
          v21 = objc_claimAutoreleasedReturnValue();

          v5 = (__CFString *)v21;
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v37);
  }

  if (v5)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("<<<]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  v23 = (void *)MEMORY[0x24BDD17C8];
  +[SUCoreConnectMessage nameForMessageType:](SUCoreConnectMessage, "nameForMessageType:", -[SUCoreConnectMessage messageType](v2, "messageType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectMessage messageName](v2, "messageName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectMessage clientID](v2, "clientID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectMessage clientIDRaw](v2, "clientIDRaw");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SUCoreConnectMessage clientProcessIdentifier](v2, "clientProcessIdentifier");
  -[SUCoreConnectMessage version](v2, "version");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectMessage error](v2, "error");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("SUCoreConnectMessage(type:%@|name:%@|clientID:%@|clientIDRaw:%@|clientProcessIdentifier:%d|version:%@|error:%@|message:%@)"), v24, v25, v26, v27, v28, v29, v30, v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (SUCoreConnectVersion)version
{
  return self->_version;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setClientConnectionAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientConnectionAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientConnectionAuditToken.val[4] = v3;
}

- (NSSet)allowlistedClasses
{
  return self->_allowlistedClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowlistedClasses, 0);
  objc_storeStrong((id *)&self->_clientIDRaw, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

@end
