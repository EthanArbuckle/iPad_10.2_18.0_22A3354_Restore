@implementation SRSensorWriterClient

+ (id)sensorWriterClientWithWriter:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWriter:", a3);
}

- (SRSensorWriterClient)initWithWriter:(id)a3
{
  SRSensorWriterClient *v4;
  SRSensorWriterClient *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRSensorWriterClient;
  v4 = -[SRSensorWriterClient init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SRSensorWriterClient setWriter:](v4, "setWriter:", a3);
  return v5;
}

- (void)resetDatastoreFiles:(id)a3
{
  -[SRSensorWriter daemonForcedResetDatastoreFiles:](-[SRSensorWriterClient writer](self, "writer"), "daemonForcedResetDatastoreFiles:", a3);
}

- (void)setMonitoring:(BOOL)a3 withRequestedConfigurations:(id)a4
{
  _BOOL8 v5;
  SRSensorWriter *v6;

  v5 = a3;
  v6 = -[SRSensorWriterClient writer](self, "writer");
  -[SRSensorWriter set_requestedConfigurations:](v6, "set_requestedConfigurations:", a4);
  -[SRSensorWriter setMonitoring:](v6, "setMonitoring:", v5);
}

- (SRSensorWriter)writer
{
  return (SRSensorWriter *)objc_loadWeak((id *)&self->_writer);
}

- (void)setWriter:(id)a3
{
  objc_storeWeak((id *)&self->_writer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_writer);
}

@end
