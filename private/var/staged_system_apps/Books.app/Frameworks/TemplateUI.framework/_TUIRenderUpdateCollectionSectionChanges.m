@implementation _TUIRenderUpdateCollectionSectionChanges

- (_TUIRenderUpdateCollectionSectionChanges)initWithSectionUpdates:(id)a3 model:(id)a4
{
  id v6;
  id v7;
  _TUIRenderUpdateCollectionSectionChanges *v8;
  NSArray *v9;
  NSArray *sectionUpdates;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIRenderUpdateCollectionSectionChanges;
  v8 = -[_TUIRenderUpdateCollectionSectionChanges init](&v12, "init");
  if (v8)
  {
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    sectionUpdates = v8->_sectionUpdates;
    v8->_sectionUpdates = v9;

    objc_storeStrong((id *)&v8->_model, a4);
  }

  return v8;
}

- (void)applyToContext:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_sectionUpdates;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "applyToContext:", v4, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSString)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v7, self);

  objc_msgSend(v8, "appendFormat:", CFSTR(" sectionUpdates=%@"), self->_sectionUpdates);
  objc_msgSend(v8, "appendFormat:", CFSTR(" model=%@"), self->_model);
  objc_msgSend(v8, "appendFormat:", CFSTR(">"));
  v9 = objc_msgSend(v8, "copy");

  return (NSString *)v9;
}

- (TUIRenderModelCollection)model
{
  return self->_model;
}

- (NSArray)sectionUpdates
{
  return self->_sectionUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionUpdates, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
