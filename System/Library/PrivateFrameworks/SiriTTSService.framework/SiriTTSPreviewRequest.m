@implementation SiriTTSPreviewRequest

- (SiriTTSAudibleContext)audibleContext
{
  return (SiriTTSAudibleContext *)sub_19AD72394();
}

- (void)setAudibleContext:(id)a3
{
  id v4;
  SiriTTSPreviewRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD72410(v4);

}

- (SiriTTSSynthesisVoice)voice
{
  return (SiriTTSSynthesisVoice *)sub_19AD724A0();
}

- (void)setVoice:(id)a3
{
  id v4;
  SiriTTSPreviewRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD7251C(v4);

}

- (int64_t)previewType
{
  int64_t result;

  sub_19AD725AC();
  return result;
}

- (void)setPreviewType:(int64_t)a3
{
  sub_19AD72604(a3);
}

- (SiriTTSPreviewRequest)initWithVoice:(id)a3 previewType:(int64_t)a4
{
  return (SiriTTSPreviewRequest *)PreviewRequest.init(voice:previewType:)(a3);
}

- (NSURL)previewAudioURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  SiriTTSPreviewRequest *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED05B3D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_19AD72828((uint64_t)v5);

  v7 = sub_19AE54EB4();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_19AE54E48();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSURL *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSPreviewRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD72958();

}

- (SiriTTSPreviewRequest)initWithCoder:(id)a3
{
  id v3;
  SiriTTSPreviewRequest *result;

  v3 = a3;
  PreviewRequest.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD72B94);
}

- (SiriTTSPreviewRequest)init
{
  sub_19AD72CBC();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_163((uint64_t)self, OBJC_IVAR___SiriTTSPreviewRequest_audibleContext);
  OUTLINED_FUNCTION_23_3(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSPreviewRequest_voice));
}

- (unsigned)audioSessionId
{
  void *v2;
  unsigned int v3;

  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "audioSessionId");

  return v3;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioSessionId:", v3);

}

- (BOOL)immediate
{
  void *v2;
  char v3;

  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "immediate");

  return v3;
}

- (void)setImmediate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImmediate:", v3);

}

- (float)playbackVolume
{
  void *v2;
  float v3;
  float v4;

  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackVolume");
  v4 = v3;

  return v4;
}

- (void)setPlaybackVolume:(float)a3
{
  double v4;
  id v5;

  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPlaybackVolume:", v4);

}

- (id)didStartSpeaking
{
  void *v2;
  void *v3;

  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didStartSpeaking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDidStartSpeaking:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSPreviewRequest audibleContext](self, "audibleContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDidStartSpeaking:", v4);

}

- (id)siriRequestId
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SiriTTSBaseRequest logLinkId](self, "logLinkId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setSiriRequestId:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SiriTTSBaseRequest setLogLinkId:](self, "setLogLinkId:", v4);

}

- (id)siriAceViewId
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SiriTTSBaseRequest interactionLinkId](self, "interactionLinkId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setSiriAceViewId:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SiriTTSBaseRequest setInteractionLinkId:](self, "setInteractionLinkId:", v4);

}

@end
