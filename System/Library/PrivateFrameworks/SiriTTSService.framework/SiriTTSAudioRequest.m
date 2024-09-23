@implementation SiriTTSAudioRequest

- (SiriTTSAudioData)audio
{
  return (SiriTTSAudioData *)AudioRequest.audio.getter();
}

- (SiriTTSAudibleContext)audibleContext
{
  return (SiriTTSAudibleContext *)sub_19AD70A18();
}

- (void)setAudibleContext:(id)a3
{
  id v4;
  SiriTTSAudioRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD70A94(v4);

}

- (SiriTTSAudioRequest)initWithAudio:(id)a3
{
  SiriTTSAudioRequest *result;

  AudioRequest.init(audio:)(a3);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSAudioRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD70BD8();

}

- (SiriTTSAudioRequest)initWithCoder:(id)a3
{
  id v3;
  SiriTTSAudioRequest *result;

  v3 = a3;
  AudioRequest.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD70DD8);
}

- (SiriTTSAudioRequest)init
{
  sub_19AD70EA8();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_163((uint64_t)self, OBJC_IVAR___SiriTTSAudioRequest_audio);
  OUTLINED_FUNCTION_23_3(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSAudioRequest_audibleContext));
}

- (unsigned)audioSessionId
{
  void *v2;
  unsigned int v3;

  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "audioSessionId");

  return v3;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioSessionId:", v3);

}

- (BOOL)immediate
{
  void *v2;
  char v3;

  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "immediate");

  return v3;
}

- (void)setImmediate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImmediate:", v3);

}

- (float)playbackVolume
{
  void *v2;
  float v3;
  float v4;

  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackVolume");
  v4 = v3;

  return v4;
}

- (void)setPlaybackVolume:(float)a3
{
  double v4;
  id v5;

  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPlaybackVolume:", v4);

}

- (id)didStartSpeaking
{
  void *v2;
  void *v3;

  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
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
  -[SiriTTSAudioRequest audibleContext](self, "audibleContext");
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
