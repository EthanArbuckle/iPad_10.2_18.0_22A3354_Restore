@implementation UIDictationConnectionOptions

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)activationType
{
  return self->_activationType;
}

- (void)setActivationType:(unint64_t)a3
{
  self->_activationType = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)fieldIdentifier
{
  return self->_fieldIdentifier;
}

- (void)setFieldIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)activationIdentifier
{
  return self->_activationIdentifier;
}

- (void)setActivationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)layoutIdentifier
{
  return self->_layoutIdentifier;
}

- (void)setLayoutIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (BOOL)secureInput
{
  return self->_secureInput;
}

- (void)setSecureInput:(BOOL)a3
{
  self->_secureInput = a3;
}

- (BOOL)useAutomaticEndpointing
{
  return self->_useAutomaticEndpointing;
}

- (void)setUseAutomaticEndpointing:(BOOL)a3
{
  self->_useAutomaticEndpointing = a3;
}

- (BOOL)acceptsDictationSearchResults
{
  return self->_acceptsDictationSearchResults;
}

- (void)setAcceptsDictationSearchResults:(BOOL)a3
{
  self->_acceptsDictationSearchResults = a3;
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (void)setPrefixText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)postfixText
{
  return self->_postfixText;
}

- (void)setPostfixText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)autoPunctuation
{
  return self->_autoPunctuation;
}

- (void)setAutoPunctuation:(BOOL)a3
{
  self->_autoPunctuation = a3;
}

- (BOOL)shouldRecognizeCommands
{
  return self->_shouldRecognizeCommands;
}

- (void)setShouldRecognizeCommands:(BOOL)a3
{
  self->_shouldRecognizeCommands = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_layoutIdentifier, 0);
  objc_storeStrong((id *)&self->_activationIdentifier, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end
