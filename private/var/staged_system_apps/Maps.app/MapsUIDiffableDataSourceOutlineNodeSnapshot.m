@implementation MapsUIDiffableDataSourceOutlineNodeSnapshot

- (MapsUIDiffableDataSourceOutlineNodeSnapshot)initWithIdentifierPath:(id)a3 viewModel:(id)a4 childSnapshots:(id)a5 expanded:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v14;
  IdentifierPath *v15;
  IdentifierPath *identifierPath;
  NSArray *v17;
  NSArray *childSnapshots;
  unint64_t v19;
  void *v20;
  NSArray *v21;
  NSDictionary *v22;
  id v23;
  NSDictionary *v24;
  NSDictionary *childMap;
  NSDictionary *v26;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, uint64_t, _BYTE *);
  void *v31;
  NSDictionary *v32;
  unint64_t v33;
  objc_super v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  v14 = 0;
  if (v10 && v11 && v12)
  {
    v34.receiver = self;
    v34.super_class = (Class)MapsUIDiffableDataSourceOutlineNodeSnapshot;
    self = -[MapsUIDiffableDataSourceOutlineNodeSnapshot init](&v34, "init");
    if (self)
    {
      v15 = (IdentifierPath *)objc_msgSend(v10, "copy");
      identifierPath = self->_identifierPath;
      self->_identifierPath = v15;

      objc_storeStrong((id *)&self->_viewModel, a4);
      v17 = (NSArray *)objc_msgSend(v13, "copy");
      childSnapshots = self->_childSnapshots;
      self->_childSnapshots = v17;

      self->_expanded = a6;
      if (-[NSArray count](self->_childSnapshots, "count"))
      {
        v19 = -[IdentifierPath length](self->_identifierPath, "length");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", -[NSArray count](self->_childSnapshots, "count")));
        v21 = self->_childSnapshots;
        v28 = _NSConcreteStackBlock;
        v29 = 3221225472;
        v30 = sub_10046ECE8;
        v31 = &unk_1011B7910;
        v33 = v19;
        v22 = v20;
        v32 = v22;
        -[NSArray enumerateObjectsUsingBlock:](v21, "enumerateObjectsUsingBlock:", &v28);
        v23 = -[NSDictionary count](v22, "count", v28, v29, v30, v31);
        if (v23 != (id)-[NSArray count](self->_childSnapshots, "count"))
        {

          v14 = 0;
          goto LABEL_12;
        }
        v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v22));
        childMap = self->_childMap;
        self->_childMap = v24;

      }
      else
      {
        v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
        v22 = self->_childMap;
        self->_childMap = v26;
      }

    }
    self = self;
    v14 = self;
  }
LABEL_12:

  return v14;
}

- (unint64_t)hash
{
  return -[IdentifierPath hash](self->_identifierPath, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v4;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v5;
  uint64_t v6;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v7;
  IdentifierPath *v8;
  IdentifierPath *v9;
  MapsUIDiffableDataSourceViewModel *v10;
  MapsUIDiffableDataSourceViewModel *v11;
  NSArray *v12;
  NSArray *v13;
  BOOL v14;

  v4 = (MapsUIDiffableDataSourceOutlineNodeSnapshot *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (IdentifierPath *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot identifierPath](v7, "identifierPath"));
    v9 = v8;
    if (v8 == self->_identifierPath || -[IdentifierPath isEqual:](v8, "isEqual:"))
    {
      v10 = (MapsUIDiffableDataSourceViewModel *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot viewModel](v7, "viewModel"));
      v11 = v10;
      if (v10 == self->_viewModel || -[MapsUIDiffableDataSourceViewModel isEqual:](v10, "isEqual:"))
      {
        v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot childSnapshots](v7, "childSnapshots"));
        v13 = v12;
        v14 = (v12 == self->_childSnapshots || -[NSArray isEqual:](v12, "isEqual:"))
           && self->_expanded == -[MapsUIDiffableDataSourceOutlineNodeSnapshot expanded](v7, "expanded");

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  MapsUIDiffableDataSourceViewModel *viewModel;
  __CFString *v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdentifierPath visualDescription](self->_identifierPath, "visualDescription"));
  v7 = (objc_class *)objc_opt_class(self->_viewModel);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  viewModel = self->_viewModel;
  v11 = sub_10039E4FC(self->_expanded);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; identifierPath = %@, viewModel = <%@: %p>, expanded = %@>"),
                    v5,
                    self,
                    v6,
                    v9,
                    viewModel,
                    v12));

  return (NSString *)v13;
}

- (NSString)recursiveDescription
{
  void *v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot description](self, "description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v3));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_childSnapshots;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "recursiveDescription"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n |  ")));
        objc_msgSend(v4, "appendFormat:", CFSTR("\n +-- %@"), v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return (NSString *)v4;
}

- (BOOL)needsReloadFromPreviousItemSnapshot:(id)a3
{
  id v4;
  IdentifierPath *v5;
  IdentifierPath *v6;
  unsigned int v7;
  unsigned __int8 v8;
  MapsUIDiffableDataSourceViewModel *viewModel;
  void *v10;

  v4 = a3;
  v5 = (IdentifierPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
  v6 = v5;
  if (v5 == self->_identifierPath)
  {

    goto LABEL_5;
  }
  v7 = -[IdentifierPath isEqual:](v5, "isEqual:");

  if (v7)
  {
LABEL_5:
    viewModel = self->_viewModel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
    v8 = -[MapsUIDiffableDataSourceViewModel needsReloadFromPreviousViewModel:](viewModel, "needsReloadFromPreviousViewModel:", v10);

    goto LABEL_6;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

- (id)nodeSnapshotAtIdentifierPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot childSnapshotWithIdentifier:](self, "childSnapshotWithIdentifier:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPathByRemovingFirstIdentifier"));
    v8 = (MapsUIDiffableDataSourceOutlineNodeSnapshot *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodeSnapshotAtIdentifierPath:", v7));

  }
  else
  {
    v8 = self;
  }

  return v8;
}

- (id)childSnapshotWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_childMap, "objectForKeyedSubscript:", a3));
  v5 = v4;
  if (v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_childSnapshots, "objectAtIndexedSubscript:", objc_msgSend(v4, "unsignedIntegerValue")));
  else
    v6 = 0;

  return v6;
}

- (IdentifierPath)identifierPath
{
  return self->_identifierPath;
}

- (MapsUIDiffableDataSourceViewModel)viewModel
{
  return self->_viewModel;
}

- (NSArray)childSnapshots
{
  return self->_childSnapshots;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childSnapshots, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_identifierPath, 0);
  objc_storeStrong((id *)&self->_childMap, 0);
}

@end
