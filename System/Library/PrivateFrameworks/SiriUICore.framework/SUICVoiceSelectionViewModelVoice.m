@implementation SUICVoiceSelectionViewModelVoice

- (SUICVoiceSelectionViewModelVoice)initWithVoice:(id)a3 isCurrentSiriVoice:(BOOL)a4
{
  id v7;
  SUICVoiceSelectionViewModelVoice *v8;
  SUICVoiceSelectionViewModelVoice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUICVoiceSelectionViewModelVoice;
  v8 = -[SUICVoiceSelectionViewModelVoice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_voiceInfo, a3);
    v9->_isCurrentSiriVoice = a4;
  }

  return v9;
}

- (NSString)localizedDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFVoiceInfo languageCode](self->_voiceInfo, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFVoiceInfo name](self->_voiceInfo, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputVoiceDescriptorForOutputLanguageCode:voiceName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CGColor)associatedCGColor
{
  return CGColorCreateSRGB(0.0666666667, 0.564705882, 0.894117647, 1.0);
}

- (AFVoiceInfo)voiceInfo
{
  return self->_voiceInfo;
}

- (BOOL)isCurrentSiriVoice
{
  return self->_isCurrentSiriVoice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceInfo, 0);
}

@end
