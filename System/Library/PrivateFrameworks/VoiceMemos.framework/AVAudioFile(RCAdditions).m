@implementation AVAudioFile(RCAdditions)

- (double)rc_sampleRate
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "processingFormat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sampleRate");
  v3 = v2;

  return v3;
}

- (double)rc_durationInSeconds
{
  double v2;
  void *v3;
  double v4;
  double v5;

  v2 = (double)objc_msgSend(a1, "length");
  objc_msgSend(a1, "processingFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleRate");
  v5 = v2 / v4;

  return v5;
}

- (uint64_t)rc_audioFormat
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fileFormat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C898E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

@end
