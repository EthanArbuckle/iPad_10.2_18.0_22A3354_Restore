@implementation SearchHomeNoDataDataProvider

- (SearchHomeNoDataDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchHomeNoDataDataProvider *v13;
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
  v21.super_class = (Class)SearchHomeNoDataDataProvider;
  v13 = -[SearchHomeNoDataDataProvider init](&v21, "init");
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

- (id)headerAccessibilityIdentifier
{
  return CFSTR("SearchHomeNoData");
}

- (NSArray)objects
{
  return self->_objects;
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
