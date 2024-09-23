@implementation SHSheetContentDataSourceChangeDetails

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)SHSheetContentDataSourceChangeDetails;
  -[SHSheetContentDataSourceChangeDetails description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails snapshotChanged](self, "snapshotChanged");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails airDropBadgeChanged](self, "airDropBadgeChanged");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails sectionsChanged](self, "sectionsChanged");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails peopleCountChanged](self, "peopleCountChanged");
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails forceReload](self, "forceReload");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails animateDifferences](self, "animateDifferences");
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentDataSourceChangeDetails modifiedIdentifiers](self, "modifiedIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ snapshotChanged:%@ airDropBadgeChanged:%@ sectionsChanged:%@ peopleCountChanged:%@ forceReload:%@ animateDifferences:%@ modifiedIdentifiers:%@>"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)snapshotChanged
{
  return self->_snapshotChanged;
}

- (void)setSnapshotChanged:(BOOL)a3
{
  self->_snapshotChanged = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (BOOL)animateDifferences
{
  return self->_animateDifferences;
}

- (void)setAnimateDifferences:(BOOL)a3
{
  self->_animateDifferences = a3;
}

- (BOOL)airDropBadgeChanged
{
  return self->_airDropBadgeChanged;
}

- (void)setAirDropBadgeChanged:(BOOL)a3
{
  self->_airDropBadgeChanged = a3;
}

- (BOOL)sectionsChanged
{
  return self->_sectionsChanged;
}

- (void)setSectionsChanged:(BOOL)a3
{
  self->_sectionsChanged = a3;
}

- (BOOL)peopleCountChanged
{
  return self->_peopleCountChanged;
}

- (void)setPeopleCountChanged:(BOOL)a3
{
  self->_peopleCountChanged = a3;
}

- (NSArray)modifiedIdentifiers
{
  return self->_modifiedIdentifiers;
}

- (void)setModifiedIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedIdentifiers, 0);
}

@end
