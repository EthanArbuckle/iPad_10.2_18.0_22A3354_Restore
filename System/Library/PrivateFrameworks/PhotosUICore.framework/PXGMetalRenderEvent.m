@implementation PXGMetalRenderEvent

- (PXGMetalRenderEvent)initWithRenderTexture:(id *)a3 pipeline:(id *)a4
{
  PXGMetalRenderEvent *v6;
  PXGMetalRenderEvent *v7;
  __int128 v8;
  _NSRange var2;
  __int128 v10;
  PXGMetalRecordingMetalSpriteTexture *v11;
  PXGMetalRecordingMetalSpriteTexture *recordingTexture;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXGMetalRenderEvent;
  v6 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v14, sel_initWithComponent_eventName_, 1, CFSTR("render"));
  v7 = v6;
  if (v6)
  {
    __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)&v6->_pipeline, (uint64_t)a4);
    v8 = *(_OWORD *)&a3[1].var0;
    v10 = *(_OWORD *)&a3->var0;
    var2 = a3->var2;
    *(_OWORD *)&v7->_renderTexture.zPosition = *(_OWORD *)&a3->var3;
    *(_OWORD *)v7->_anon_88 = v8;
    *(_OWORD *)&v7->_renderTexture.texture = v10;
    v7->_renderTexture.bufferRange = var2;
    v7->_renderTexture.shader = 0;
    v11 = -[PXGMetalRecordingMetalSpriteTexture initWithTexture:]([PXGMetalRecordingMetalSpriteTexture alloc], "initWithTexture:", a3->var0);
    recordingTexture = v7->_recordingTexture;
    v7->_recordingTexture = v11;

  }
  __destructor_8_s16_s24_s32((id *)a4);
  return v7;
}

- (id)serializable
{
  PXGMetalRecordingRenderEventSerializable *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v3 = objc_alloc_init(PXGMetalRecordingRenderEventSerializable);
  -[PXGMetalRecordingMetalSpriteTexture serializable](self->_recordingTexture, "serializable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalRecordingRenderEventSerializable setTexture:](v3, "setTexture:", v4);

  -[PXGMetalRecordingRenderEventSerializable setBufferRange:](v3, "setBufferRange:", self->_renderTexture.bufferRange.location, self->_renderTexture.bufferRange.length);
  *(float *)&v5 = self->_renderTexture.zPosition;
  -[PXGMetalRecordingRenderEventSerializable setZPosition:](v3, "setZPosition:", v5);
  -[PXGMetalRecordingRenderEventSerializable setContentsGravity:](v3, "setContentsGravity:", self->_renderTexture.contentsGravity);
  -[PXGMetalRecordingRenderEventSerializable setIsOpaque:](v3, "setIsOpaque:", self->_anon_88[12]);
  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[PXGMetalRecordingMetalSpriteTexture spriteIndexes](self->_recordingTexture, "spriteIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGMetalRecordingMetalSpriteTexture spriteIndexes](self->_recordingTexture, "spriteIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__PXGMetalRenderEvent_serializable__block_invoke;
  v12[3] = &unk_1E5148928;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v12);

  -[PXGMetalRecordingRenderEventSerializable setSpriteIndices:](v3, "setSpriteIndices:", v10);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingTexture, 0);
  __destructor_8_s16_s24_s32((id *)&self->_pipeline);
}

void __35__PXGMetalRenderEvent_serializable__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)eventWithRenderTexture:(id *)a3 pipeline:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v13;
  id v14;
  id v15;
  id v16;
  BOOL var5;

  v6 = objc_alloc((Class)a1);
  v13 = *(_OWORD *)&a4->var0;
  v7 = a4->var2;
  v14 = v7;
  v8 = a4->var3;
  v15 = v8;
  v9 = a4->var4;
  v16 = v9;
  var5 = a4->var5;
  if (v6)
  {
    v10 = (void *)objc_msgSend(v6, "initWithRenderTexture:pipeline:", a3, &v13);
  }
  else
  {
    v11 = v9;

    v10 = 0;
  }
  __destructor_8_s16_s24_s32((id *)a4);
  return v10;
}

@end
