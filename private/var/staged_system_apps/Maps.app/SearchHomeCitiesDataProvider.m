@implementation SearchHomeCitiesDataProvider

- (SearchHomeCitiesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchHomeCitiesDataProvider *v13;
  NSArray *v14;
  NSArray *objects;
  id v16;
  uint64_t v17;
  NSArray *viewModels;
  NSString *v19;
  NSString *identifier;
  NSString *v21;
  NSString *title;
  objc_super v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SearchHomeCitiesDataProvider;
  v13 = -[SearchHomeCitiesDataProvider init](&v24, "init");
  if (v13)
  {
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    objects = v13->_objects;
    v13->_objects = v14;

    v16 = objc_msgSend(objc_alloc((Class)MKPlaceCompactCollectionsLogicController), "initWithGuideLocations:context:", v10, 1);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "compactCollectionsInSection:", 0));
    viewModels = v13->_viewModels;
    v13->_viewModels = (NSArray *)v17;

    v13->_type = a4;
    v19 = (NSString *)objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = v19;

    v21 = (NSString *)objc_msgSend(v12, "copy");
    title = v13->_title;
    v13->_title = v21;

  }
  return v13;
}

- (id)headerAccessibilityIdentifier
{
  return CFSTR("SearchHomeCities");
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
