@implementation PlaceCategoryItem

- (PlaceCategoryItem)initWithSearchCategory:(id)a3 parentMuid:(unint64_t)a4 displayMode:(int)a5
{
  id v9;
  PlaceCategoryItem *v10;
  PlaceCategoryItem *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PlaceCategoryItem;
  v10 = -[PlaceCategoryItem init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_searchCategory, a3);
    v11->_parentMuid = a4;
    v11->_displayMode = a5;
  }

  return v11;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (unint64_t)parentMuid
{
  return self->_parentMuid;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategory, 0);
}

@end
