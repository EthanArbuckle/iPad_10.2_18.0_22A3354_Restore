@implementation SHCampaignTokens

- (SHCampaignTokens)initWithConfiguration:(id)a3
{
  id v5;
  SHCampaignTokens *v6;
  SHCampaignTokens *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHCampaignTokens;
  v6 = -[SHCampaignTokens init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_campaignTokens, a3);

  return v7;
}

- (id)tokenForClientIdentifier:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("itsct"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHCampaignTokens campaignTokens](self, "campaignTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = CFSTR("bglsk");
  v8 = v6;

  return v8;
}

- (NSDictionary)campaignTokens
{
  return self->_campaignTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_campaignTokens, 0);
}

@end
