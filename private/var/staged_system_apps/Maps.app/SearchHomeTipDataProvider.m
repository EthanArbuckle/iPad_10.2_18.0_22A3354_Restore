@implementation SearchHomeTipDataProvider

- (SearchHomeTipDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchHomeTipDataProvider *v13;
  NSArray *v14;
  NSArray *objects;
  NSString *v16;
  NSString *identifier;
  NSString *v18;
  NSString *title;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SearchHomeTipDataProvider;
  v13 = -[SearchHomeTipDataProvider init](&v21, "init");
  if (v13)
  {
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    objects = v13->_objects;
    v13->_objects = v14;

    v13->_type = a4;
    v16 = (NSString *)objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = v16;

    v18 = (NSString *)objc_msgSend(v12, "copy");
    title = v13->_title;
    v13->_title = v18;

  }
  return v13;
}

- (NSArray)objects
{
  void *v3;
  unsigned __int8 v4;
  NSArray *objects;
  NSArray *v6;

  if (!MapsFeature_IsEnabled_MapsWally(self)
    || (GEOConfigGetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68) & 1) != 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper")),
        v4 = objc_msgSend(v3, "isUsingOfflineMaps"),
        v3,
        (v4 & 1) != 0))
  {
    objects = self->_objects;
    v6 = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    objects = self->_objects;
    v6 = (NSArray *)&off_101273800;
  }
  self->_objects = v6;

  return self->_objects;
}

- (id)headerAccessibilityIdentifier
{
  return CFSTR("SearchHomeTip");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
