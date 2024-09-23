@implementation _SVXSystemEventMutation

- (_SVXSystemEventMutation)init
{
  return -[_SVXSystemEventMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXSystemEventMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXSystemEventMutation *v6;
  _SVXSystemEventMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSystemEventMutation;
  v6 = -[_SVXSystemEventMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setDeviceSetupFlowScene:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSetupFlowScene, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setStoreDemo:(id)a3
{
  objc_storeStrong((id *)&self->_storeDemo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void)setOrderedAlarmAndTimerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_orderedAlarmAndTimerIDs, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void)setSpeechSynthesisRequest:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesisRequest, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x81u;
}

- (id)generate
{
  SVXSystemEvent *baseModel;
  char mutationFlags;
  uint64_t v5;
  SVXSystemEvent *v6;
  SVXSystemEvent *v7;
  int64_t type;
  unint64_t timestamp;
  SVXDeviceSetupFlowScene *v10;
  SVXDeviceSetupFlowScene *v11;
  SVXStoreDemo *v12;
  SVXStoreDemo *v13;
  NSArray *v14;
  NSArray *v15;
  SVXSpeechSynthesisRequest *v16;
  SVXSpeechSynthesisRequest *v17;
  unsigned int audioSessionID;
  uint64_t v20;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [SVXSystemEvent alloc];
    LODWORD(v20) = self->_audioSessionID;
    v5 = -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:](v6, "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", self->_type, self->_timestamp, self->_deviceSetupFlowScene, self->_storeDemo, self->_orderedAlarmAndTimerIDs, self->_speechSynthesisRequest, v20);
    goto LABEL_5;
  }
  mutationFlags = (char)self->_mutationFlags;
  if ((mutationFlags & 1) == 0)
  {
    v5 = -[SVXSystemEvent copy](baseModel, "copy");
LABEL_5:
    v7 = (SVXSystemEvent *)v5;
    return v7;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) == 0)
  {
    type = -[SVXSystemEvent type](baseModel, "type");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_11:
    timestamp = -[SVXSystemEvent timestamp](self->_baseModel, "timestamp");
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      goto LABEL_9;
LABEL_12:
    -[SVXSystemEvent deviceSetupFlowScene](self->_baseModel, "deviceSetupFlowScene");
    v10 = (SVXDeviceSetupFlowScene *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  type = self->_type;
  if ((*(_BYTE *)&self->_mutationFlags & 4) == 0)
    goto LABEL_11;
LABEL_8:
  timestamp = self->_timestamp;
  if ((mutationFlags & 8) == 0)
    goto LABEL_12;
LABEL_9:
  v10 = self->_deviceSetupFlowScene;
LABEL_13:
  v11 = v10;
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v12 = self->_storeDemo;
  }
  else
  {
    -[SVXSystemEvent storeDemo](self->_baseModel, "storeDemo");
    v12 = (SVXStoreDemo *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v14 = self->_orderedAlarmAndTimerIDs;
  }
  else
  {
    -[SVXSystemEvent orderedAlarmAndTimerIDs](self->_baseModel, "orderedAlarmAndTimerIDs");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v16 = self->_speechSynthesisRequest;
  }
  else
  {
    -[SVXSystemEvent speechSynthesisRequest](self->_baseModel, "speechSynthesisRequest");
    v16 = (SVXSpeechSynthesisRequest *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if ((*(_BYTE *)&self->_mutationFlags & 0x80000000) != 0)
    audioSessionID = self->_audioSessionID;
  else
    audioSessionID = -[SVXSystemEvent audioSessionID](self->_baseModel, "audioSessionID");
  LODWORD(v20) = audioSessionID;
  v7 = -[SVXSystemEvent initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:]([SVXSystemEvent alloc], "initWithType:timestamp:deviceSetupFlowScene:storeDemo:orderedAlarmAndTimerIDs:speechSynthesisRequest:audioSessionID:", type, timestamp, v11, v13, v15, v17, v20);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesisRequest, 0);
  objc_storeStrong((id *)&self->_orderedAlarmAndTimerIDs, 0);
  objc_storeStrong((id *)&self->_storeDemo, 0);
  objc_storeStrong((id *)&self->_deviceSetupFlowScene, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
