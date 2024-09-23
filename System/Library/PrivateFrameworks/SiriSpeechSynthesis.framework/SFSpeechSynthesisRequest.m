@implementation SFSpeechSynthesisRequest

- (SFSpeechSynthesisRequest)init
{
  SFSpeechSynthesisRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSpeechSynthesisRequest;
  result = -[SFSpeechSynthesisRequest init](&v3, sel_init);
  if (result)
    result->_useCache = 1;
  return result;
}

- (id)description
{
  void *v3;
  NSString *text;
  int64_t type;
  int64_t solutionType;
  NSString *voiceName;
  NSString *clientBundleIdentifier;
  NSString *requestIdentifer;
  void *v10;
  void *v11;
  __int128 v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13 = *(_OWORD *)&self->_locale;
  type = self->_type;
  text = self->_text;
  solutionType = self->_solutionType;
  voiceName = self->_voiceName;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  requestIdentifer = self->_requestIdentifer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useCache);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("locale:%@, gender:%@, voiceName:%@, text:'%@', requestType:%ld, solutionType:%ld, appId:%@, requestId:%@, useCache:%@, devServiceType:%@"), v13, voiceName, text, type, solutionType, clientBundleIdentifier, requestIdentifer, v10, self->_devServiceType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void)setIsPrivate:(BOOL)a3
{
  self->_isPrivate = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)solutionType
{
  return self->_solutionType;
}

- (void)setSolutionType:(int64_t)a3
{
  self->_solutionType = a3;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)gender
{
  return self->_gender;
}

- (void)setGender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)requestIdentifer
{
  return self->_requestIdentifer;
}

- (void)setRequestIdentifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SFSpeechSynthesisVoice)voice
{
  return (SFSpeechSynthesisVoice *)objc_loadWeakRetained((id *)&self->_voice);
}

- (void)setVoice:(id)a3
{
  objc_storeWeak((id *)&self->_voice, a3);
}

- (BOOL)useCache
{
  return self->_useCache;
}

- (void)setUseCache:(BOOL)a3
{
  self->_useCache = a3;
}

- (BOOL)returnFrontEndFeature
{
  return self->_returnFrontEndFeature;
}

- (void)setReturnFrontEndFeature:(BOOL)a3
{
  self->_returnFrontEndFeature = a3;
}

- (int64_t)phoneSetType
{
  return self->_phoneSetType;
}

- (void)setPhoneSetType:(int64_t)a3
{
  self->_phoneSetType = a3;
}

- (ProsodyTransferData)prosodyTransferData
{
  return self->_prosodyTransferData;
}

- (void)setProsodyTransferData:(id)a3
{
  objc_storeStrong((id *)&self->_prosodyTransferData, a3);
}

- (NSString)devServiceType
{
  return self->_devServiceType;
}

- (void)setDevServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_devServiceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devServiceType, 0);
  objc_storeStrong((id *)&self->_prosodyTransferData, 0);
  objc_destroyWeak((id *)&self->_voice);
  objc_storeStrong((id *)&self->_requestIdentifer, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
