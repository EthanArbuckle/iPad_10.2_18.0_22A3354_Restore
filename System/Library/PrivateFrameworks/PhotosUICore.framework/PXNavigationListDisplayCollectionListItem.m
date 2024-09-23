@implementation PXNavigationListDisplayCollectionListItem

- (PXNavigationListDisplayCollectionListItem)initWithIdentifier:(id)a3 displayCollectionList:(id)a4 title:(id)a5 itemCount:(int64_t)a6
{
  id v11;
  PXNavigationListDisplayCollectionListItem *v12;
  __CFString *v13;
  int v14;
  objc_super v16;

  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXNavigationListDisplayCollectionListItem;
  v12 = -[PXNavigationListItem initWithIdentifier:title:itemCount:](&v16, sel_initWithIdentifier_title_itemCount_, a3, a5, a6);
  if (v12)
  {
    if (objc_msgSend(v11, "px_isSharedAlbumsFolder"))
      v13 = CFSTR("person.2.fill");
    else
      v13 = CFSTR("rectangle.stack");
    objc_storeStrong((id *)&v12->_glyphImageName, v13);
    if ((objc_msgSend(v11, "px_isTopLevelFolder") & 1) != 0)
      LOBYTE(v14) = 0;
    else
      v14 = objc_msgSend(v11, "px_isProjectsFolder") ^ 1;
    v12->_draggable = v14;
    v12->_reorderable = objc_msgSend(v11, "px_isTopLevelFolder") ^ 1;
    v12->_renamable = objc_msgSend(v11, "px_isRenamable");
    v12->_deletable = objc_msgSend(v11, "px_isDeletable");
    v12->_expandable = objc_msgSend(v11, "px_isFolder");
    objc_storeStrong((id *)&v12->_collection, a4);
  }

  return v12;
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
  v13.super_class = (Class)PXNavigationListDisplayCollectionListItem;
  v5 = -[PXNavigationListItem copyWithZone:](&v13, sel_copyWithZone_);
  -[PXNavigationListDisplayCollectionListItem glyphImageName](self, "glyphImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[8];
  v5[8] = v7;

  *((_BYTE *)v5 + 56) = -[PXNavigationListDisplayCollectionListItem isDraggable](self, "isDraggable");
  *((_BYTE *)v5 + 57) = -[PXNavigationListDisplayCollectionListItem isReorderable](self, "isReorderable");
  *((_BYTE *)v5 + 58) = -[PXNavigationListDisplayCollectionListItem isRenamable](self, "isRenamable");
  *((_BYTE *)v5 + 59) = -[PXNavigationListDisplayCollectionListItem isDeletable](self, "isDeletable");
  *((_BYTE *)v5 + 60) = -[PXNavigationListDisplayCollectionListItem isExpandable](self, "isExpandable");
  -[PXNavigationListDisplayCollectionListItem collection](self, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)v5[10];
  v5[10] = v10;

  v5[11] = -[PXNavigationListDisplayCollectionListItem indentationLevel](self, "indentationLevel");
  *((_BYTE *)v5 + 61) = -[PXNavigationListDisplayCollectionListItem isExpanded](self, "isExpanded");
  return v5;
}

- (id)glyphImageName
{
  return self->_glyphImageName;
}

- (id)accessoryGlyphImageName
{
  return self->_accessoryGlyphImageName;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (void)setDraggable:(BOOL)a3
{
  self->_draggable = a3;
}

- (BOOL)isReorderable
{
  return self->_reorderable;
}

- (void)setReorderable:(BOOL)a3
{
  self->_reorderable = a3;
}

- (BOOL)isRenamable
{
  return self->_renamable;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (BOOL)isExpandable
{
  return self->_expandable;
}

- (PXDisplayCollectionList)collection
{
  return self->_collection;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentationLevel = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_accessoryGlyphImageName, 0);
  objc_storeStrong((id *)&self->_glyphImageName, 0);
}

@end
