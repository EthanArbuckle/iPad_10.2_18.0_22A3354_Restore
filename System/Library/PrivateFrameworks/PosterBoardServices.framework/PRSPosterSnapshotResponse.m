@implementation PRSPosterSnapshotResponse

- (PRSPosterSnapshotResponse)initWithSnapshots:(id)a3
{
  id v4;
  PRSPosterSnapshotResponse *v5;
  uint64_t v6;
  NSArray *snapshots;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterSnapshotResponse;
  v5 = -[PRSPosterSnapshotResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    snapshots = v5->_snapshots;
    v5->_snapshots = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_snapshots, CFSTR("snapshots"));
}

- (PRSPosterSnapshotResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  PRSPosterSnapshotResponse *v7;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v5, objc_opt_class(), CFSTR("snapshots"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[PRSPosterSnapshotResponse initWithSnapshots:](self, "initWithSnapshots:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)snapshots
{
  return self->_snapshots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshots, 0);
}

@end
