@implementation SearchHomePublishersDataProvider

- (SearchHomePublishersDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchHomePublishersDataProvider *v13;
  NSArray *v14;
  NSArray *objects;
  _BOOL8 v16;
  void *v17;
  NSArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  NSArray *v24;
  NSArray *viewModels;
  NSString *v26;
  NSString *identifier;
  NSString *v28;
  NSString *title;
  int64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SearchHomePublishersDataProvider;
  v13 = -[SearchHomePublishersDataProvider init](&v37, "init");
  if (v13)
  {
    v31 = a4;
    v32 = v11;
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    objects = v13->_objects;
    v13->_objects = v14;

    v16 = -[SearchHomePublishersDataProvider showDisclosureIndicator](v13, "showDisclosureIndicator");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](v13->_objects, "count")));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = v13->_objects;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForPublisher:showDisclosureIndicator:](TwoLinesContentViewModelComposer, "cellModelForPublisher:showDisclosureIndicator:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), v16));
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v20);
    }

    v24 = (NSArray *)objc_msgSend(v17, "copy");
    viewModels = v13->_viewModels;
    v13->_viewModels = v24;

    v11 = v32;
    v13->_type = v31;
    v26 = (NSString *)objc_msgSend(v32, "copy");
    identifier = v13->_identifier;
    v13->_identifier = v26;

    v28 = (NSString *)objc_msgSend(v12, "copy");
    title = v13->_title;
    v13->_title = v28;

  }
  return v13;
}

- (id)headerAccessibilityIdentifier
{
  return CFSTR("SearchHomePublishers");
}

- (BOOL)showDisclosureIndicator
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != (id)5;

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_viewModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
