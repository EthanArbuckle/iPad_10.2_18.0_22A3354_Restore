@implementation PXCollectionSortMenuItemConfiguration

- (PXCollectionSortMenuItemConfiguration)initWithSortOrder:(int64_t)a3 title:(id)a4 systemImageName:(id)a5 selected:(BOOL)a6 actionAscending:(BOOL)a7
{
  id v13;
  id v14;
  PXCollectionSortMenuItemConfiguration *v15;
  PXCollectionSortMenuItemConfiguration *v16;
  objc_super v18;

  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXCollectionSortMenuItemConfiguration;
  v15 = -[PXCollectionSortMenuItemConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_sortOrder = a3;
    objc_storeStrong((id *)&v15->_title, a4);
    objc_storeStrong((id *)&v16->_systemImageName, a5);
    v16->_selected = a6;
    v16->_actionAscending = a7;
  }

  return v16;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)actionAscending
{
  return self->_actionAscending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
