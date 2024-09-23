@implementation SiriTTSSynthesisRequest

- (SiriTTSSynthesisContext)synthesisContext
{
  return (SiriTTSSynthesisContext *)sub_19AD70F5C();
}

- (void)setSynthesisContext:(id)a3
{
  id v4;
  SiriTTSSynthesisRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD70FD8(v4);

}

- (SiriTTSSynthesisRequest)initWithText:(id)a3 voice:(id)a4
{
  SiriTTSSynthesisRequest *result;

  sub_19AD71EEC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, SynthesisRequest.init(text:voice:));
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSSynthesisRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD71104();

}

- (SiriTTSSynthesisRequest)initWithCoder:(id)a3
{
  SiriTTSSynthesisRequest *result;

  SynthesisRequest.init(coder:)(a3);
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19AD72150(self);
}

- (SiriTTSSynthesisRequest)init
{
  sub_19AD7127C();
}

- (void).cxx_destruct
{

}

- (id)text
{
  void *v2;
  void *v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)voice
{
  void *v2;
  void *v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setVoice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoice:", v4);

}

- (BOOL)privacySensitive
{
  void *v2;
  char v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "privacySensitive");

  return v3;
}

- (void)setPrivacySensitive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrivacySensitive:", v3);

}

- (BOOL)minimizeDeviceUsage
{
  void *v2;
  char v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimizeDeviceUsage");

  return v3;
}

- (void)setMinimizeDeviceUsage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimizeDeviceUsage:", v3);

}

- (id)contextInfo
{
  void *v2;
  void *v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContextInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContextInfo:", v4);

}

- (float)rate
{
  void *v2;
  float v3;
  float v4;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (void)setRate:(float)a3
{
  double v4;
  id v5;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setRate:", v4);

}

- (float)pitch
{
  void *v2;
  float v3;
  float v4;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pitch");
  v4 = v3;

  return v4;
}

- (void)setPitch:(float)a3
{
  double v4;
  id v5;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPitch:", v4);

}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  double v4;
  id v5;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVolume:", v4);

}

- (id)customResourceURLs
{
  void *v2;
  void *v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customResourceURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCustomResourceURLs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomResourceURLs:", v4);

}

- (BOOL)disableCompactVoice
{
  void *v2;
  char v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableCompactVoice");

  return v3;
}

- (void)setDisableCompactVoice:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableCompactVoice:", v3);

}

- (int64_t)synthesisProfile
{
  void *v2;
  int64_t v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "synthesisProfile");

  return v3;
}

- (void)setSynthesisProfile:(int64_t)a3
{
  id v4;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSynthesisProfile:", a3);

}

- (id)prosodyProperties
{
  void *v2;
  void *v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prosodyProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setProsodyProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProsodyProperties:", v4);

}

- (id)didGenerateAudio
{
  void *v2;
  void *v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didGenerateAudio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDidGenerateAudio:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDidGenerateAudio:", v4);

}

- (id)didGenerateWordTimings
{
  void *v2;
  void *v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didGenerateWordTimings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDidGenerateWordTimings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDidGenerateWordTimings:", v4);

}

- (BOOL)whisper
{
  void *v2;
  char v3;

  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "whisper");

  return v3;
}

- (void)setWhisper:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriTTSSynthesisRequest synthesisContext](self, "synthesisContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhisper:", v3);

}

@end
