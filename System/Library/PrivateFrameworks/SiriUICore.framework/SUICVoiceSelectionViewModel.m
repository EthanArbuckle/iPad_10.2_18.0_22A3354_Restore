@implementation SUICVoiceSelectionViewModel

- (SUICVoiceSelectionViewModel)initWithLanguages:(id)a3 voices:(id)a4
{
  id v6;
  id v7;
  SUICVoiceSelectionViewModel *v8;
  uint64_t v9;
  NSArray *languages;
  uint64_t v11;
  NSArray *voices;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUICVoiceSelectionViewModel;
  v8 = -[SUICVoiceSelectionViewModel init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v6, 1);
    languages = v8->_languages;
    v8->_languages = (NSArray *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 1);
    voices = v8->_voices;
    v8->_voices = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)languages
{
  return self->_languages;
}

- (NSArray)voices
{
  return self->_voices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voices, 0);
  objc_storeStrong((id *)&self->_languages, 0);
}

@end
