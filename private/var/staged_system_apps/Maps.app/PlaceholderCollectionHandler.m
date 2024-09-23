@implementation PlaceholderCollectionHandler

+ (id)sharedInstance
{
  if (qword_1014D3980 != -1)
    dispatch_once(&qword_1014D3980, &stru_1011DBA40);
  return (id)qword_1014D3978;
}

- (PlaceholderCollectionHandler)init
{
  PlaceholderCollectionHandler *v2;
  PlaceholderCollectionHandler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PlaceholderCollectionHandler;
  v2 = -[CollectionHandler init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CollectionHandler loadDefaultImage](v2, "loadDefaultImage");
  return v3;
}

- (BOOL)containsItem:(id)a3
{
  return 0;
}

- (id)identifier
{
  return CFSTR("__internal_CollectionPlaceholderIdentifier");
}

- (id)glyphImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus"));
}

- (int64_t)handlerType
{
  return 1;
}

@end
