@implementation CSVTUIAudioRecorderRemoteDeviceContext

- (CSVTUIAudioRecorderRemoteDeviceContext)initWithRemoteTrainingDeviceType:(unint64_t)a3 remoteTrainingDeviceUUIDList:(id)a4
{
  id v6;
  CSVTUIAudioRecorderRemoteDeviceContext *v7;
  CSVTUIAudioRecorderRemoteDeviceContext *v8;
  uint64_t v9;
  NSArray *remoteTrainingDeviceUUIDList;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSVTUIAudioRecorderRemoteDeviceContext;
  v7 = -[CSVTUIAudioRecorderRemoteDeviceContext init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_remoteTrainingDeviceType = a3;
    v9 = objc_msgSend(v6, "copy");
    remoteTrainingDeviceUUIDList = v8->_remoteTrainingDeviceUUIDList;
    v8->_remoteTrainingDeviceUUIDList = (NSArray *)v9;

  }
  return v8;
}

- (unint64_t)remoteTrainingDeviceType
{
  return self->_remoteTrainingDeviceType;
}

- (NSArray)remoteTrainingDeviceUUIDList
{
  return self->_remoteTrainingDeviceUUIDList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTrainingDeviceUUIDList, 0);
}

@end
