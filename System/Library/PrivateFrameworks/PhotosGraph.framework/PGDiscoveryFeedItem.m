@implementation PGDiscoveryFeedItem

- (PGDiscoveryFeedItem)initWithObject:(id)a3
{
  id v4;
  PGDiscoveryFeedItem *v5;
  void *v6;
  uint64_t v7;
  NSString *localIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGDiscoveryFeedItem;
  v5 = -[PGDiscoveryFeedItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v7;

    objc_opt_class();
    v5->_isCollection = objc_opt_isKindOfClass() & 1;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D72060];
  v8[0] = self->_localIdentifier;
  v3 = *MEMORY[0x1E0D72058];
  v7[0] = v2;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCollection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
