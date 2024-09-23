@implementation ICLiveLinkEvent

- (id)_initWithType:(int64_t)a3 participant:(id)a4
{
  id v6;
  ICLiveLinkEvent *v7;
  ICLiveLinkEvent *v8;
  uint64_t v9;
  ICLiveLinkIdentity *participant;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICLiveLinkEvent;
  v7 = -[ICLiveLinkEvent init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    participant = v8->_participant;
    v8->_participant = (ICLiveLinkIdentity *)v9;

  }
  return v8;
}

- (id)description
{
  int64_t type;
  uint64_t v4;

  type = self->_type;
  switch(type)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkEvent: %p participant=%@ unknown/invalid>"), self, self->_participant, v4);
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkEvent: %p participant=%@ sessionEvent=%@>"), self, self->_participant, self->_sessionEvent);
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkEvent: %p participant=%@ playbackEvent=%@>"), self, self->_participant, self->_playbackEvent);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkEvent: %p participant=%@ queueEvent=%@>"), self, self->_participant, self->_queueEvent);
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkEvent: %p participant=%@ reactionEvent=%@>"), self, self->_participant, self->_reactionEvent);
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkEvent: %p participant=%@ customEvent=%@>"), self, self->_participant, self->_customEvent);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkEvent: %p participant=%@ unknown/eventType=%ld>"), self, self->_participant, type);
      break;
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)primaryReferencedIdentifier
{
  int64_t type;
  ICLiveLinkQueueEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  type = self->_type;
  if (type == 4)
  {
    -[ICLiveLinkReactionEvent itemIdentifier](self->_reactionEvent, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (type == 3)
  {
    v3 = self->_queueEvent;
    switch(-[ICLiveLinkQueueEvent kind](v3, "kind"))
    {
      case 1:
        -[ICLiveLinkQueueEvent contentAdded](v3, "contentAdded");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "itemIdentifiers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      case 3:
        -[ICLiveLinkQueueEvent contentReordered](v3, "contentReordered");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "itemIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 5:
        -[ICLiveLinkQueueEvent contentReplaced](v3, "contentReplaced");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 6:
        -[ICLiveLinkQueueEvent contentPlayedNow](v3, "contentPlayedNow");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v4 = v8;
        objc_msgSend(v8, "startItemIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v6 = (void *)v7;
LABEL_13:

        break;
      default:

        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v6 = 0;
  }
  return (NSString *)v6;
}

- (ICLiveLinkIdentity)participant
{
  return self->_participant;
}

- (int64_t)type
{
  return self->_type;
}

- (ICLiveLinkSessionEvent)sessionEvent
{
  return self->_sessionEvent;
}

- (ICLiveLinkPlaybackEvent)playbackEvent
{
  return self->_playbackEvent;
}

- (ICLiveLinkQueueEvent)queueEvent
{
  return self->_queueEvent;
}

- (ICLiveLinkReactionEvent)reactionEvent
{
  return self->_reactionEvent;
}

- (ICLiveLinkCustomEvent)customEvent
{
  return self->_customEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customEvent, 0);
  objc_storeStrong((id *)&self->_reactionEvent, 0);
  objc_storeStrong((id *)&self->_queueEvent, 0);
  objc_storeStrong((id *)&self->_playbackEvent, 0);
  objc_storeStrong((id *)&self->_sessionEvent, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

+ (id)eventWithSessionEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[ICLiveLinkEvent _initWithType:participant:]([ICLiveLinkEvent alloc], "_initWithType:participant:", 1, v6);

  v8 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

+ (id)eventWithPlaybackEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[ICLiveLinkEvent _initWithType:participant:]([ICLiveLinkEvent alloc], "_initWithType:participant:", 2, v6);

  v8 = (void *)v7[4];
  v7[4] = v5;

  return v7;
}

+ (id)eventWithQueueEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[ICLiveLinkEvent _initWithType:participant:]([ICLiveLinkEvent alloc], "_initWithType:participant:", 3, v6);

  v8 = (void *)v7[5];
  v7[5] = v5;

  return v7;
}

+ (id)eventWithReactionEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[ICLiveLinkEvent _initWithType:participant:]([ICLiveLinkEvent alloc], "_initWithType:participant:", 4, v6);

  v8 = (void *)v7[6];
  v7[6] = v5;

  return v7;
}

+ (id)eventWithCustomEvent:(id)a3 participant:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[ICLiveLinkEvent _initWithType:participant:]([ICLiveLinkEvent alloc], "_initWithType:participant:", 5, v6);

  v8 = (void *)v7[7];
  v7[7] = v5;

  return v7;
}

@end
