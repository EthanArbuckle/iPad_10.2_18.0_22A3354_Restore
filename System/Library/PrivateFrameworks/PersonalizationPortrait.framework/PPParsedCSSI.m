@implementation PPParsedCSSI

- (PPParsedCSSI)init
{
  PPParsedCSSI *v2;
  uint64_t v3;
  NSArray *identifiers;
  uint64_t v5;
  NSMutableSet *neStrings;
  uint64_t v7;
  NSMutableSet *topicStrings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PPParsedCSSI;
  v2 = -[PPParsedCSSI init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSArray *)v3;

    v5 = objc_opt_new();
    neStrings = v2->_neStrings;
    v2->_neStrings = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    topicStrings = v2->_topicStrings;
    v2->_topicStrings = (NSMutableSet *)v7;

  }
  return v2;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSMutableSet)neStrings
{
  return self->_neStrings;
}

- (void)setNeStrings:(id)a3
{
  objc_storeStrong((id *)&self->_neStrings, a3);
}

- (NSMutableSet)topicStrings
{
  return self->_topicStrings;
}

- (void)setTopicStrings:(id)a3
{
  objc_storeStrong((id *)&self->_topicStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicStrings, 0);
  objc_storeStrong((id *)&self->_neStrings, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
