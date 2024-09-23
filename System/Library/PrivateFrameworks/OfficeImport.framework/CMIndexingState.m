@implementation CMIndexingState

- (CMIndexingState)init
{
  CMIndexingState *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *metadata;
  CSSearchableItemAttributeSet *v5;
  CSSearchableItemAttributeSet *searchableAttributes;
  NSMutableString *v7;
  NSMutableString *textContent;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMIndexingState;
  v2 = -[CMState init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    metadata = v2->_metadata;
    v2->_metadata = v3;

    v5 = (CSSearchableItemAttributeSet *)objc_alloc_init(MEMORY[0x24BDC2480]);
    searchableAttributes = v2->_searchableAttributes;
    v2->_searchableAttributes = v5;

    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    textContent = v2->_textContent;
    v2->_textContent = v7;

  }
  return v2;
}

- (CSSearchableItemAttributeSet)searchableAttributes
{
  -[CSSearchableItemAttributeSet setTextContent:](self->_searchableAttributes, "setTextContent:", self->_textContent);
  return self->_searchableAttributes;
}

- (NSMutableDictionary)metadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setSearchableAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_searchableAttributes, a3);
}

- (NSMutableString)textContent
{
  return (NSMutableString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTextContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_searchableAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
