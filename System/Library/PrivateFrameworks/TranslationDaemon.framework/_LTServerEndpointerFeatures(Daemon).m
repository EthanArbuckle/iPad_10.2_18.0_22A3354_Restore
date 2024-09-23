@implementation _LTServerEndpointerFeatures(Daemon)

- (id)initWithResponse:()Daemon
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&off_2578848F0;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v5, "setWordCount:", (int)objc_msgSend(v4, "num_of_words"));
    objc_msgSend(v5, "setTrailingSilenceDuration:", (int)objc_msgSend(v4, "trailing_silence_duration"));
    objc_msgSend(v4, "eos_likelihood");
    objc_msgSend(v5, "setEosLikelihood:");
    objc_msgSend(v4, "pause_counts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPauseCounts:", v6);

    objc_msgSend(v4, "silence_posterior");
    objc_msgSend(v5, "setSilencePosterior:");
    objc_msgSend(v5, "setProcessedAudioDurationInMilliseconds:", (int)objc_msgSend(v4, "processed_audio_duration_ms"));
    v7 = v5;
  }

  return v5;
}

+ (id)featuresForEndpointer:()Daemon
{
  void *v3;
  id v4;
  float v5;
  float v6;

  objc_msgSend(a3, "defaultServerEndpointFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDF6428]);
  objc_msgSend(v4, "setWordCount:", objc_msgSend(v3, "wordCount"));
  objc_msgSend(v4, "setTrailingSilenceDuration:", objc_msgSend(v3, "trailingSilenceDuration"));
  objc_msgSend(v3, "endOfSentenceLikelihood");
  objc_msgSend(v4, "setEosLikelihood:", v5);
  objc_msgSend(v4, "setPauseCounts:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v3, "silencePosterior");
  objc_msgSend(v4, "setSilencePosterior:", v6);
  objc_msgSend(v4, "setProcessedAudioDurationInMilliseconds:", 0);

  return v4;
}

@end
