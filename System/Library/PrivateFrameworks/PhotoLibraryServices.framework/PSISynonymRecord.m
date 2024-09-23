@implementation PSISynonymRecord

- (PSISynonymRecord)initWithSynonym:(id)a3 category:(signed __int16)a4 identifier:(id)a5
{
  id v8;
  id v9;
  PSISynonymRecord *v10;
  uint64_t v11;
  NSString *synonym;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSISynonymRecord;
  v10 = -[PSISynonymRecord init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    synonym = v10->_synonym;
    v10->_synonym = (NSString *)v11;

    v10->_category = a4;
    v13 = objc_msgSend(v9, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v13;

  }
  return v10;
}

- (NSString)synonym
{
  return self->_synonym;
}

- (void)setSynonym:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (signed)category
{
  return self->_category;
}

- (void)setCategory:(signed __int16)a3
{
  self->_category = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_synonym, 0);
}

@end
