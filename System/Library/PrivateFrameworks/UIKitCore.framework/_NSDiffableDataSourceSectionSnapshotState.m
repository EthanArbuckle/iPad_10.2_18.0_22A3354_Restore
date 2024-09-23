@implementation _NSDiffableDataSourceSectionSnapshotState

- (void)willBecomeWiredToDataSource
{
  self->_identifierLookupCount = -1;
}

- (NSOrderedSet)identifiers
{
  return self->_identifiers;
}

- (_NSDiffableDataSourceSectionSnapshotState)init
{
  _UITreeDataSourceSnapshotter *v3;
  id v4;
  _NSDiffableDataSourceSectionSnapshotState *v5;

  v3 = objc_alloc_init(_UITreeDataSourceSnapshotter);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v5 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:identifiersHaveGuaranteedPerformance:](self, "initWithSnapshotter:identifiers:identifiersHaveGuaranteedPerformance:", v3, v4, 1);

  return v5;
}

- (_NSDiffableDataSourceSectionSnapshotState)initWithSnapshotter:(id)a3 identifiers:(id)a4 identifiersHaveGuaranteedPerformance:(BOOL)a5
{
  id v9;
  id v10;
  _NSDiffableDataSourceSectionSnapshotState *v11;
  _NSDiffableDataSourceSectionSnapshotState *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NSDiffableDataSourceSectionSnapshotState;
  v11 = -[_NSDiffableDataSourceSectionSnapshotState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_snapshotter, a3);
    objc_storeStrong((id *)&v12->_identifiers, a4);
    if (a5 || -[NSOrderedSet count](v12->_identifiers, "count") <= 0xA)
      objc_storeStrong((id *)&v12->_guaranteedPerformanceIdentifiers, v12->_identifiers);
  }

  return v12;
}

- (id)snapshotterMutableCopy
{
  return (id)-[_UITreeDataSourceSnapshotter copy](self->_snapshotter, "copy");
}

- (_NSDiffableDataSourceSectionSnapshotState)initWithSnapshotter:(id)a3 identifiers:(id)a4
{
  return -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:identifiersHaveGuaranteedPerformance:](self, "initWithSnapshotter:identifiers:identifiersHaveGuaranteedPerformance:", a3, a4, 0);
}

- (BOOL)containsIdentifier:(id)a3
{
  return a3 && -[NSOrderedSet containsObject:](self->_identifiers, "containsObject:");
}

- (_UITreeDataSourceSnapshotter)snapshotter
{
  return self->_snapshotter;
}

- (int64_t)indexOfIdentifier:(id)a3
{
  id v4;
  unint64_t identifierLookupCount;
  NSOrderedSet *v6;
  NSOrderedSet *guaranteedPerformanceIdentifiers;
  int64_t v8;
  NSOrderedSet *identifiers;

  v4 = a3;
  if (v4)
  {
    identifierLookupCount = self->_identifierLookupCount;
    if (identifierLookupCount < 0xA)
    {
      self->_identifierLookupCount = identifierLookupCount + 1;
    }
    else if (!self->_guaranteedPerformanceIdentifiers)
    {
      v6 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_identifiers);
      guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
      self->_guaranteedPerformanceIdentifiers = v6;

    }
    identifiers = self->_guaranteedPerformanceIdentifiers;
    if (!identifiers)
      identifiers = self->_identifiers;
    v8 = -[NSOrderedSet indexOfObject:](identifiers, "indexOfObject:", v4);
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_guaranteedPerformanceIdentifiers, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *guaranteedPerformanceIdentifiers;
  id v6;
  void *v7;
  void *v8;
  id *v9;

  if (!self->_guaranteedPerformanceIdentifiers)
  {
    v4 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", self->_identifiers);
    guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
    self->_guaranteedPerformanceIdentifiers = v4;

  }
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)-[_UITreeDataSourceSnapshotter copy](self->_snapshotter, "copy");
  v8 = (void *)-[NSOrderedSet copy](self->_identifiers, "copy");
  v9 = (id *)objc_msgSend(v6, "initWithSnapshotter:identifiers:", v7, v8);

  if (v9)
    objc_storeStrong(v9 + 2, self->_guaranteedPerformanceIdentifiers);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _NSDiffableDataSourceSectionSnapshotState *v4;
  _NSDiffableDataSourceSectionSnapshotState *v5;
  _NSDiffableDataSourceSectionSnapshotState *v6;
  BOOL v7;

  v4 = (_NSDiffableDataSourceSectionSnapshotState *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      v6 = v4;
      objc_opt_class();
      v7 = (objc_opt_isKindOfClass() & 1) != 0
        && -[_UITreeDataSourceSnapshotter isEqual:](self->_snapshotter, "isEqual:", v6->_snapshotter)
        && -[NSOrderedSet isEqualToOrderedSet:](self->_identifiers, "isEqualToOrderedSet:", v6->_identifiers);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p: "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("identifiers = %@; snapshotter=%@>"), self->_identifiers, self->_snapshotter);
  return v3;
}

@end
