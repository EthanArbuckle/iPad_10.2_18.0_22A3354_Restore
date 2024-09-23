@implementation AXKonaVoice

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXKonaVoice languageCode](self, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXKonaVoice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("com.apple.eloquence."), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)konaLanguage
{
  return self->_konaLanguage;
}

- (void)setKonaLanguage:(unint64_t)a3
{
  self->_konaLanguage = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (int64_t)eciVoiceNumber
{
  return self->_eciVoiceNumber;
}

- (void)setEciVoiceNumber:(int64_t)a3
{
  self->_eciVoiceNumber = a3;
}

- (AXKonaParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
