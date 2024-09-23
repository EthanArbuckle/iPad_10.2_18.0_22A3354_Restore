@implementation PXNavigationListActionItem

- (PXNavigationListActionItem)initWithActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PXNavigationListActionItem *v7;
  PXNavigationListActionItem *v8;
  NSString *glyphImageName;
  uint64_t v10;
  NSString *actionType;
  objc_super v13;

  v4 = a3;
  -[PXNavigationListItem collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitCollectionListCreateCollectionActionPerformer localizedTitleForActionType:collectionList:](PXPhotoKitCollectionListCreateCollectionActionPerformer, "localizedTitleForActionType:collectionList:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PXNavigationListActionItem;
  v7 = -[PXNavigationListItem initWithIdentifier:title:itemCount:](&v13, sel_initWithIdentifier_title_itemCount_, v4, v6, 0x7FFFFFFFFFFFFFFFLL);
  v8 = v7;
  if (v7)
  {
    glyphImageName = v7->_glyphImageName;
    v7->_glyphImageName = (NSString *)CFSTR("PXNavigationListItemImageNamePlus");

    v10 = objc_msgSend(v4, "copy");
    actionType = v8->_actionType;
    v8->_actionType = (NSString *)v10;

    v8->_style = 1;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXNavigationListActionItem;
  v5 = -[PXNavigationListItem copyWithZone:](&v13, sel_copyWithZone_);
  -[PXNavigationListActionItem glyphImageName](self, "glyphImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[7];
  v5[7] = v7;

  -[PXNavigationListActionItem actionType](self, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v5[8] = -[PXNavigationListActionItem style](self, "style");
  return v5;
}

- (BOOL)isEqualToNavigationListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListActionItem;
  if (-[PXNavigationListItem isEqualToNavigationListItem:](&v9, sel_isEqualToNavigationListItem_, v4))
  {
    -[PXNavigationListActionItem actionType](self, "actionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXNavigationListActionItem;
  v3 = -[PXNavigationListItem hash](&v7, sel_hash);
  -[PXNavigationListActionItem actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)glyphImageName
{
  return self->_glyphImageName;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_glyphImageName, 0);
}

@end
