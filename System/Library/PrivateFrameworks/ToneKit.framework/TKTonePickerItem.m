@implementation TKTonePickerItem

- (int64_t)numberOfChildren
{
  return -[NSArray count](self->_childrenToneClassicsPickerItems, "count");
}

- (id)childItemAtIndex:(int64_t)a3
{
  void *v5;

  if ((int64_t)-[NSArray count](self->_childrenToneClassicsPickerItems, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_childrenToneClassicsPickerItems, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TKTonePickerItem;
  -[TKPickerSelectableItem _appendDescriptionOfAttributesToString:](&v6, sel__appendDescriptionOfAttributesToString_, v4);
  v5 = -[TKTonePickerItem itemKind](self, "itemKind") - 1;
  if (v5 <= 2)
    -[TKPickerItem _appendDescriptionOfAttributeNamed:withStringValue:toString:](self, "_appendDescriptionOfAttributeNamed:withStringValue:toString:", CFSTR("itemKind"), off_24D380228[v5], v4);

}

- (unint64_t)itemKind
{
  return self->_itemKind;
}

- (void)_setItemKind:(unint64_t)a3
{
  self->_itemKind = a3;
}

- (TKTonePickerSectionItem)parentSectionItem
{
  return (TKTonePickerSectionItem *)objc_loadWeakRetained((id *)&self->_parentSectionItem);
}

- (void)_setParentSectionItem:(id)a3
{
  objc_storeWeak((id *)&self->_parentSectionItem, a3);
}

- (BOOL)needsRoomForCheckmark
{
  return self->_needsRoomForCheckmark;
}

- (void)_setNeedsRoomForCheckmark:(BOOL)a3
{
  self->_needsRoomForCheckmark = a3;
}

- (BOOL)needsActivityIndicator
{
  return self->_needsActivityIndicator;
}

- (void)_setNeedsActivityIndicator:(BOOL)a3
{
  self->_needsActivityIndicator = a3;
}

- (BOOL)needsDownloadProgress
{
  return self->_needsDownloadProgress;
}

- (void)_setNeedsDownloadProgress:(BOOL)a3
{
  self->_needsDownloadProgress = a3;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)_setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (NSArray)childrenToneClassicsPickerItems
{
  return self->_childrenToneClassicsPickerItems;
}

- (void)_setChildrenToneClassicsPickerItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childrenToneClassicsPickerItems, 0);
  objc_destroyWeak((id *)&self->_parentSectionItem);
}

@end
