@implementation _RCSAudioFile

- (NSURL)url
{
  return -[RCSSavedRecordingAccessToken compositionAVURL](self->_fileToken, "compositionAVURL");
}

- (AVAudioFormat)fileFormat
{
  void *v2;
  void *v3;

  -[RCSSavedRecordingAccessToken userInfo](self->_fileToken, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fileFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVAudioFormat *)v3;
}

- (AVAudioFormat)processingFormat
{
  void *v2;
  void *v3;

  -[RCSSavedRecordingAccessToken userInfo](self->_fileToken, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("processingFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVAudioFormat *)v3;
}

- (NSDictionary)settings
{
  void *v2;
  void *v3;

  -[RCSSavedRecordingAccessToken userInfo](self->_fileToken, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (RCSSavedRecordingAccessToken)fileToken
{
  return self->_fileToken;
}

- (void)setFileToken:(id)a3
{
  objc_storeStrong((id *)&self->_fileToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileToken, 0);
}

@end
