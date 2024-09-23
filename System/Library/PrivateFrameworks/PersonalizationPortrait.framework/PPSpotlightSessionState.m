@implementation PPSpotlightSessionState

- (PPSpotlightSessionState)init
{
  PPSpotlightSessionState *v2;
  uint64_t v3;
  NSMutableArray *seenSpotlightIds;
  uint64_t v5;
  NSMutableArray *seenBundleIds;
  uint64_t v7;
  NSMutableArray *engagedSpotlightIds;
  uint64_t v9;
  NSMutableArray *engagedBundleIds;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PPSpotlightSessionState;
  v2 = -[PPSpotlightSessionState init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    seenSpotlightIds = v2->_seenSpotlightIds;
    v2->_seenSpotlightIds = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    seenBundleIds = v2->_seenBundleIds;
    v2->_seenBundleIds = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    engagedSpotlightIds = v2->_engagedSpotlightIds;
    v2->_engagedSpotlightIds = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    engagedBundleIds = v2->_engagedBundleIds;
    v2->_engagedBundleIds = (NSMutableArray *)v9;

  }
  return v2;
}

- (NSMutableArray)seenSpotlightIds
{
  return self->_seenSpotlightIds;
}

- (void)setSeenSpotlightIds:(id)a3
{
  objc_storeStrong((id *)&self->_seenSpotlightIds, a3);
}

- (NSMutableArray)seenBundleIds
{
  return self->_seenBundleIds;
}

- (void)setSeenBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_seenBundleIds, a3);
}

- (NSMutableArray)engagedSpotlightIds
{
  return self->_engagedSpotlightIds;
}

- (void)setEngagedSpotlightIds:(id)a3
{
  objc_storeStrong((id *)&self->_engagedSpotlightIds, a3);
}

- (NSMutableArray)engagedBundleIds
{
  return self->_engagedBundleIds;
}

- (void)setEngagedBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_engagedBundleIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagedBundleIds, 0);
  objc_storeStrong((id *)&self->_engagedSpotlightIds, 0);
  objc_storeStrong((id *)&self->_seenBundleIds, 0);
  objc_storeStrong((id *)&self->_seenSpotlightIds, 0);
}

@end
