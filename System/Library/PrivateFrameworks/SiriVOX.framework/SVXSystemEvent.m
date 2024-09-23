@implementation SVXSystemEvent

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7 speechSynthesisRequest:(id)a8 audioSessionID:(unsigned int)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  SVXSystemEvent *v19;
  SVXSystemEvent *v20;
  uint64_t v21;
  SVXDeviceSetupFlowScene *deviceSetupFlowScene;
  uint64_t v23;
  SVXStoreDemo *storeDemo;
  uint64_t v25;
  NSArray *orderedAlarmAndTimerIDs;
  uint64_t v27;
  SVXSpeechSynthesisRequest *speechSynthesisRequest;
  objc_super v30;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)SVXSystemEvent;
  v19 = -[SVXSystemEvent init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    v19->_timestamp = a4;
    v21 = objc_msgSend(v15, "copy");
    deviceSetupFlowScene = v20->_deviceSetupFlowScene;
    v20->_deviceSetupFlowScene = (SVXDeviceSetupFlowScene *)v21;

    v23 = objc_msgSend(v16, "copy");
    storeDemo = v20->_storeDemo;
    v20->_storeDemo = (SVXStoreDemo *)v23;

    v25 = objc_msgSend(v17, "copy");
    orderedAlarmAndTimerIDs = v20->_orderedAlarmAndTimerIDs;
    v20->_orderedAlarmAndTimerIDs = (NSArray *)v25;

    v27 = objc_msgSend(v18, "copy");
    speechSynthesisRequest = v20->_speechSynthesisRequest;
    v20->_speechSynthesisRequest = (SVXSpeechSynthesisRequest *)v27;

    v20->_audioSessionID = a9;
  }

  return v20;
}

- (id)description
{
  return -[SVXSystemEvent _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t type;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)SVXSystemEvent;
  -[SVXSystemEvent description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 0xD)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24DC28[type];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {type = %@, timestamp = %llu, deviceSetupFlowScene = %@, storeDemo = %@, orderedAlarmAndTimerIDs = %@, speechSynthesisRequest = %@, audioSessionID = %u}"), v5, v8, self->_timestamp, self->_deviceSetupFlowScene, self->_storeDemo, self->_orderedAlarmAndTimerIDs, self->_speechSynthesisRequest, self->_audioSessionID);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[SVXDeviceSetupFlowScene hash](self->_deviceSetupFlowScene, "hash");
  v8 = v7 ^ -[SVXStoreDemo hash](self->_storeDemo, "hash");
  v9 = v8 ^ -[NSArray hash](self->_orderedAlarmAndTimerIDs, "hash");
  v10 = v6 ^ v9 ^ -[SVXSpeechSynthesisRequest hash](self->_speechSynthesisRequest, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audioSessionID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  SVXSystemEvent *v4;
  SVXSystemEvent *v5;
  int64_t type;
  unint64_t timestamp;
  unsigned int audioSessionID;
  SVXDeviceSetupFlowScene *v9;
  SVXDeviceSetupFlowScene *deviceSetupFlowScene;
  SVXStoreDemo *v11;
  SVXStoreDemo *storeDemo;
  NSArray *v13;
  NSArray *orderedAlarmAndTimerIDs;
  SVXSpeechSynthesisRequest *v15;
  SVXSpeechSynthesisRequest *speechSynthesisRequest;
  BOOL v17;

  v4 = (SVXSystemEvent *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[SVXSystemEvent type](v5, "type")
        && (timestamp = self->_timestamp, timestamp == -[SVXSystemEvent timestamp](v5, "timestamp"))
        && (audioSessionID = self->_audioSessionID,
            audioSessionID == -[SVXSystemEvent audioSessionID](v5, "audioSessionID")))
      {
        -[SVXSystemEvent deviceSetupFlowScene](v5, "deviceSetupFlowScene");
        v9 = (SVXDeviceSetupFlowScene *)objc_claimAutoreleasedReturnValue();
        deviceSetupFlowScene = self->_deviceSetupFlowScene;
        if (deviceSetupFlowScene == v9 || -[SVXDeviceSetupFlowScene isEqual:](deviceSetupFlowScene, "isEqual:", v9))
        {
          -[SVXSystemEvent storeDemo](v5, "storeDemo");
          v11 = (SVXStoreDemo *)objc_claimAutoreleasedReturnValue();
          storeDemo = self->_storeDemo;
          if (storeDemo == v11 || -[SVXStoreDemo isEqual:](storeDemo, "isEqual:", v11))
          {
            -[SVXSystemEvent orderedAlarmAndTimerIDs](v5, "orderedAlarmAndTimerIDs");
            v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
            orderedAlarmAndTimerIDs = self->_orderedAlarmAndTimerIDs;
            if (orderedAlarmAndTimerIDs == v13
              || -[NSArray isEqual:](orderedAlarmAndTimerIDs, "isEqual:", v13))
            {
              -[SVXSystemEvent speechSynthesisRequest](v5, "speechSynthesisRequest");
              v15 = (SVXSpeechSynthesisRequest *)objc_claimAutoreleasedReturnValue();
              speechSynthesisRequest = self->_speechSynthesisRequest;
              v17 = speechSynthesisRequest == v15
                 || -[SVXSpeechSynthesisRequest isEqual:](speechSynthesisRequest, "isEqual:", v15);

            }
            else
            {
              v17 = 0;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (SVXSystemEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SVXSystemEvent *v17;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSystemEvent::type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSystemEvent::timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSystemEvent::deviceSetupFlowScene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSystemEvent::storeDemo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("SVXSystemEvent::orderedAlarmAndTimerIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSystemEvent::speechSynthesisRequest"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSystemEvent::audioSessionID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v16, "unsignedIntValue");
  LODWORD(v19) = (_DWORD)v4;
  v17 = -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", v6, v8, v9, v10, v14, v15, v19);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  type = self->_type;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SVXSystemEvent::type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SVXSystemEvent::timestamp"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceSetupFlowScene, CFSTR("SVXSystemEvent::deviceSetupFlowScene"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_storeDemo, CFSTR("SVXSystemEvent::storeDemo"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_orderedAlarmAndTimerIDs, CFSTR("SVXSystemEvent::orderedAlarmAndTimerIDs"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_speechSynthesisRequest, CFSTR("SVXSystemEvent::speechSynthesisRequest"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audioSessionID);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("SVXSystemEvent::audioSessionID"));

}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (SVXDeviceSetupFlowScene)deviceSetupFlowScene
{
  return self->_deviceSetupFlowScene;
}

- (SVXStoreDemo)storeDemo
{
  return self->_storeDemo;
}

- (NSArray)orderedAlarmAndTimerIDs
{
  return self->_orderedAlarmAndTimerIDs;
}

- (SVXSpeechSynthesisRequest)speechSynthesisRequest
{
  return self->_speechSynthesisRequest;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesisRequest, 0);
  objc_storeStrong((id *)&self->_orderedAlarmAndTimerIDs, 0);
  objc_storeStrong((id *)&self->_storeDemo, 0);
  objc_storeStrong((id *)&self->_deviceSetupFlowScene, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXSystemEventMutation *);
  _SVXSystemEventMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXSystemEventMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXSystemEventMutation initWithBaseModel:]([_SVXSystemEventMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXSystemEventMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXSystemEvent copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXSystemEventMutation *);
  _SVXSystemEventMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXSystemEventMutation *))a3;
  v4 = objc_alloc_init(_SVXSystemEventMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXSystemEventMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4
{
  uint64_t v5;

  LODWORD(v5) = 0;
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", a3, a4, 0, 0, 0, 0, v5);
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 alarm:(id)a5
{
  uint64_t v6;

  LODWORD(v6) = 0;
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", a3, a4, 0, 0, 0, 0, v6);
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5
{
  uint64_t v6;

  LODWORD(v6) = 0;
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", a3, a4, a5, 0, 0, 0, v6);
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 storeDemo:(id)a5
{
  uint64_t v6;

  LODWORD(v6) = 0;
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", a3, a4, 0, a5, 0, 0, v6);
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 alarm:(id)a5 deviceSetupFlowScene:(id)a6
{
  uint64_t v7;

  LODWORD(v7) = 0;
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", a3, a4, a6, 0, 0, 0, v7);
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 timer:(id)a5
{
  uint64_t v6;

  LODWORD(v6) = 0;
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", a3, a4, 0, 0, 0, 0, v6);
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7
{
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:audioSessionID:", a3, a4, a5, a6, a7, 0);
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7 audioSessionID:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](self, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", a3, a4, a5, a6, a7, 0, v9);
}

@end
