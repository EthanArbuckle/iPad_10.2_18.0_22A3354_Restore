@implementation LNAutoShortcutParameterPhraseGroup

- (LNAutoShortcutParameterPhraseGroup)initWithParameterID:(id)a3 phrases:(id)a4
{
  id v7;
  id v8;
  LNAutoShortcutParameterPhraseGroup *v9;
  LNAutoShortcutParameterPhraseGroup *v10;
  uint64_t v11;
  NSArray *phrases;
  LNAutoShortcutParameterPhraseGroup *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LNAutoShortcutParameterPhraseGroup;
  v9 = -[LNAutoShortcutParameterPhraseGroup init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterID, a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    phrases = v10->_phrases;
    v10->_phrases = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)addPhrase:(id)a3
{
  NSArray *v4;
  NSArray *phrases;

  -[NSArray arrayByAddingObject:](self->_phrases, "arrayByAddingObject:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  phrases = self->_phrases;
  self->_phrases = v4;

}

- (NSUUID)parameterID
{
  return self->_parameterID;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_parameterID, 0);
}

@end
