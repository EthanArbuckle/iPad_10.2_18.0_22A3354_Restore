@implementation SLBertClassifierResult

- (SLBertClassifierResult)initWithScore:(id)a3 assetVersion:(id)a4 extractedFeats:(id)a5
{
  id v9;
  id v10;
  id v11;
  SLBertClassifierResult *v12;
  SLBertClassifierResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SLBertClassifierResult;
  v12 = -[SLBertClassifierResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_domainProb, a3);
    objc_storeStrong((id *)&v13->_assetVersion, a4);
    objc_storeStrong((id *)&v13->_extractedFeats, a5);
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_extractedFeats);
  objc_msgSend(v3, "setObject:forKey:", self->_domainProb, CFSTR("domainProb"));
  objc_msgSend(v3, "setObject:forKey:", self->_assetVersion, CFSTR("assetVersion"));
  return v3;
}

- (NSArray)domainProb
{
  return self->_domainProb;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (NSDictionary)extractedFeats
{
  return self->_extractedFeats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedFeats, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_domainProb, 0);
}

@end
