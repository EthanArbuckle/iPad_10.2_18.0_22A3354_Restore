@implementation SKAStatusUnencryptedEnvelope

- (SKAStatusUnencryptedEnvelope)initWithEnvelopeDictionary:(id)a3
{
  id v5;
  SKAStatusUnencryptedEnvelope *v6;
  SKAStatusUnencryptedEnvelope *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKAStatusUnencryptedEnvelope;
  v6 = -[SKAStatusUnencryptedEnvelope init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_envelopeDictionary, a3);

  return v7;
}

- (NSString)statusUniqueIdentifier
{
  return (NSString *)-[NSDictionary ska_stringForKey:](self->_envelopeDictionary, "ska_stringForKey:", CFSTR("i"));
}

- (NSDate)datePublished
{
  return (NSDate *)-[NSDictionary ska_dateFromUnixTimestampForKey:](self->_envelopeDictionary, "ska_dateFromUnixTimestampForKey:", CFSTR("p"));
}

- (NSDate)dateCreated
{
  return (NSDate *)-[NSDictionary ska_dateFromUnixTimestampForKey:](self->_envelopeDictionary, "ska_dateFromUnixTimestampForKey:", CFSTR("c"));
}

- (NSDictionary)envelopeDictionary
{
  return self->_envelopeDictionary;
}

- (void)setEnvelopeDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_envelopeDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_envelopeDictionary, 0);
}

@end
