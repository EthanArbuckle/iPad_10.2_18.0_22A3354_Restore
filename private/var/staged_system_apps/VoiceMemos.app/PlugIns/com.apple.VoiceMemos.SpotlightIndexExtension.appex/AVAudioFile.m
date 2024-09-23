@implementation AVAudioFile

- (double)rc_sampleRate
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAudioFile processingFormat](self, "processingFormat"));
  objc_msgSend(v2, "sampleRate");
  v4 = v3;

  return v4;
}

- (double)rc_durationInSeconds
{
  double v3;
  void *v4;
  double v5;
  double v6;

  v3 = (double)-[AVAudioFile length](self, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVAudioFile processingFormat](self, "processingFormat"));
  objc_msgSend(v4, "sampleRate");
  v6 = v3 / v5;

  return v6;
}

- (unsigned)rc_audioFormat
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAudioFile fileFormat](self, "fileFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", AVFormatIDKey));
  v5 = objc_msgSend(v4, "unsignedIntValue");

  return v5;
}

@end
