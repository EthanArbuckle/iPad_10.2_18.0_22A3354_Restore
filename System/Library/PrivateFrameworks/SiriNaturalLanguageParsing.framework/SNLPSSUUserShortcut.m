@implementation SNLPSSUUserShortcut

- (SNLPSSUUserShortcut)initWithIdentifier:(id)a3 phrase:(id)a4
{
  NSString *v6;
  NSString *v7;
  SNLPSSUUserShortcut *v8;
  NSString *identifier;
  NSString *v10;
  NSString *phrase;
  objc_super v13;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SNLPSSUUserShortcut;
  v8 = -[SNLPSSUUserShortcut init](&v13, sel_init);
  identifier = v8->_identifier;
  v8->_identifier = v6;
  v10 = v6;

  phrase = v8->_phrase;
  v8->_phrase = v7;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
