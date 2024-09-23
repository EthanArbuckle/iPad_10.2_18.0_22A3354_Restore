@implementation PXGMetalRecordingTextureCreatedEvent

- (PXGMetalRecordingTextureCreatedEvent)initWithTexture:(id)a3 options:(id)a4 recordingComponent:(int64_t)a5
{
  id v8;
  PXGMetalRecordingTextureCreatedEvent *v9;
  PXGMetalRecordingMetalSpriteTexture *v10;
  PXGMetalRecordingMetalSpriteTexture *recordingTexture;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalRecordingTextureCreatedEvent;
  v9 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v13, sel_initWithComponent_eventName_, a5, CFSTR("textureCreated"));
  if (v9)
  {
    v10 = -[PXGMetalRecordingMetalSpriteTexture initWithTexture:]([PXGMetalRecordingMetalSpriteTexture alloc], "initWithTexture:", v8);
    recordingTexture = v9->_recordingTexture;
    v9->_recordingTexture = v10;

    v9->_options = ($FA15997C902EC2271369254F9448C610)a4;
  }

  return v9;
}

- (id)serializable
{
  PXGMetalRecordingTextureCreatedEventSerializable *v3;
  void *v4;
  PXGTextureConverterOptionsSerializable *v5;
  $FA15997C902EC2271369254F9448C610 options;
  void *v7;

  v3 = objc_alloc_init(PXGMetalRecordingTextureCreatedEventSerializable);
  -[PXGMetalRecordingMetalSpriteTexture serializable](self->_recordingTexture, "serializable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalRecordingTextureCreatedEventSerializable setTexture:](v3, "setTexture:", v4);

  v5 = objc_alloc_init(PXGTextureConverterOptionsSerializable);
  -[PXGMetalRecordingTextureCreatedEventSerializable setOptions:](v3, "setOptions:", v5);

  options = self->_options;
  -[PXGMetalRecordingTextureCreatedEventSerializable options](v3, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextureConverterOptions:", options);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingTexture, 0);
}

+ (id)eventWithTexture:(id)a3 options:(id)a4 recordingComponent:(int64_t)a5
{
  id v7;
  PXGMetalRecordingTextureCreatedEvent *v8;

  v7 = a3;
  v8 = -[PXGMetalRecordingTextureCreatedEvent initWithTexture:options:recordingComponent:]([PXGMetalRecordingTextureCreatedEvent alloc], "initWithTexture:options:recordingComponent:", v7, a4, a5);

  return v8;
}

@end
