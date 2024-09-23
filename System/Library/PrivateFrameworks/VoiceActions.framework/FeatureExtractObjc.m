@implementation FeatureExtractObjc

- (FeatureExtractObjc)initWithConfig:(id)a3
{
  return (FeatureExtractObjc *)FeatureExtract.init(config:)(a3);
}

- (void)addCallbackForAcousticModelOutputAvailableWithCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();
  uint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___FeatureExtractObjc_acousticModelOutputAvailable);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_acousticModelOutputAvailable);
  *v6 = sub_24A1B9550;
  v6[1] = (uint64_t (*)())v5;
  sub_24A191318(v7);
}

- (void)setCmvnMinWindowLengthWithCmvnMinWindowLength:(int64_t)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(void);
  FeatureExtractObjc *v7;
  _QWORD *v8;
  _QWORD *v9;

  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_config);
  v6 = *(uint64_t (**)(void))((*v5 & *MEMORY[0x24BEE4EA0]) + 0x90);
  v7 = self;
  v8 = v5;
  v9 = (_QWORD *)v6();

  (*(void (**)(int64_t))((*v4 & *v9) + 0xA8))(a3);
}

- (id)configuration
{
  return *(id *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_config);
}

- (void)setStreamingModeWithStreaming:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_streamingMode) = a3;
}

- (void)startWithCompletionHandlerWithCompletionHandler:(id)a3
{
  sub_24A1B3C4C(self, (int)a2, a3, (uint64_t)&unk_251B9CF88, (uint64_t)sub_24A1B9AF4, (void (*)(uint64_t, uint64_t))sub_24A1B1BDC);
}

- (void)reset
{
  FeatureExtractObjc *v2;

  v2 = self;
  sub_24A1B23FC();

}

- (id)audioForKeywordWithStartFrame:(int64_t)a3 endFrame:(int64_t)a4 actualEndFrame:(int64_t *)a5
{
  FeatureExtractObjc *v8;
  uint64_t *v9;

  v8 = self;
  v9 = sub_24A1B2568(a3, a4, (uint64_t)a5);

  return v9;
}

- (void)addFloatSamples:(const float *)a3 count:(int64_t)a4
{
  FeatureExtractObjc *v6;

  v6 = self;
  sub_24A1B32F4((uint64_t)a3, a4);

}

- (void)addSamples:(const signed __int16 *)a3 count:(int64_t)a4
{
  FeatureExtractObjc *v6;

  v6 = self;
  sub_24A1B3648((uint64_t)a3, a4);

}

- (void)stopWithCompletionHandlerWithCompletionHandler:(id)a3
{
  sub_24A1B3C4C(self, (int)a2, a3, (uint64_t)&unk_251B9CF60, (uint64_t)sub_24A1B9544, (void (*)(uint64_t, uint64_t))sub_24A1B399C);
}

- (id)saveAudioBufferToFileWithPcmBuffer:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  FeatureExtractObjc *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;

  v9 = sub_24A135F88(&qword_25790BCF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24A215CB4();
  v14 = v13;
  v15 = sub_24A215CB4();
  v17 = v16;
  v18 = a3;
  v19 = self;
  sub_24A1B3CC8((uint64_t)v18, v12, v14, v15, v17, a6, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = sub_24A215750();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v11, 1, v20) != 1)
  {
    v22 = (void *)sub_24A215720();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v20);
  }
  return v22;
}

- (id)saveAudioDataToFileWithData:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  FeatureExtractObjc *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;

  v10 = sub_24A135F88(&qword_25790BCF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  v17 = sub_24A215774();
  v19 = v18;

  sub_24A215CB4();
  sub_24A215CB4();

  sub_24A1B4470(v17, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A135F1C(v17, v19);

  v20 = sub_24A215750();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v12, 1, v20) != 1)
  {
    v22 = (void *)sub_24A215720();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v20);
  }
  return v22;
}

- (id)saveStandaloneDebugSamplesToFileWithDebugAudioSamples:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FeatureExtractObjc *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;

  v8 = sub_24A135F88(&qword_25790BCF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A215EA0();
  v12 = sub_24A215CB4();
  v14 = v13;
  v15 = sub_24A215CB4();
  v17 = v16;
  v18 = self;
  sub_24A1B4924(v11, v12, v14, v15, v17, a6, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = sub_24A215750();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) != 1)
  {
    v21 = (void *)sub_24A215720();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
  }
  return v21;
}

- (FeatureExtractObjc)init
{
  FeatureExtractObjc *result;

  result = (FeatureExtractObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_24A191318(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_acousticModelOutputAvailable));
}

@end
