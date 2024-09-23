@implementation CRLiOSPresetCollectionContext

- (CRLiOSPresetCollectionContext)initWithContextType:(unint64_t)a3 contentSize:(CGSize)a4 editingCoordinator:(id)a5 isSearching:(BOOL)a6 pageIndex:(unint64_t)a7 subpageIndex:(unint64_t)a8 traitCollection:(id)a9
{
  CGFloat height;
  CGFloat width;
  id v18;
  id v19;
  CRLiOSPresetCollectionContext *v20;
  CRLiOSPresetCollectionContext *v21;
  objc_super v23;

  height = a4.height;
  width = a4.width;
  v18 = a5;
  v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CRLiOSPresetCollectionContext;
  v20 = -[CRLiOSPresetCollectionContext init](&v23, "init");
  v21 = v20;
  if (v20)
  {
    v20->_contentSize.width = width;
    v20->_contentSize.height = height;
    v20->_contextType = a3;
    objc_storeStrong((id *)&v20->_editingCoordinator, a5);
    v21->_isSearching = a6;
    v21->_pageIndex = a7;
    v21->_subpageIndex = a8;
    objc_storeStrong((id *)&v21->_traitCollection, a9);
  }

  return v21;
}

- (BOOL)isInPopover
{
  return (id)-[CRLiOSPresetCollectionContext contextType](self, "contextType") == (id)1;
}

- (BOOL)isSidebarLike
{
  return (id)-[CRLiOSPresetCollectionContext contextType](self, "contextType") == (id)2;
}

- (BOOL)hasCompactHeightRegularWidthTraitCollection
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "verticalSizeClass") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "horizontalSizeClass") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasRegularHeightCompactWidthTraitCollection
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "verticalSizeClass") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "horizontalSizeClass") == (id)1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasRegularHeightRegularWidthTraitCollection
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "verticalSizeClass") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "horizontalSizeClass") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasCompactHeightCompactWidthTraitCollection
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "verticalSizeClass") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "horizontalSizeClass") == (id)1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isInDarkContainer
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "crl_isUserInterfaceStyleDark");

  return v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[CRLiOSPresetCollectionContext contentSize](self, "contentSize");
  v7 = v6;
  -[CRLiOSPresetCollectionContext contentSize](self, "contentSize");
  v9 = v8;
  v10 = -[CRLiOSPresetCollectionContext contextType](self, "contextType");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext editingCoordinator](self, "editingCoordinator"));
  v12 = -[CRLiOSPresetCollectionContext isSearching](self, "isSearching");
  v13 = -[CRLiOSPresetCollectionContext pageIndex](self, "pageIndex");
  v14 = -[CRLiOSPresetCollectionContext subpageIndex](self, "subpageIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionContext traitCollection](self, "traitCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p; contentSize.width=%f, contentSize.height=%f, contextType=%lu, editingCoordinator=%@, isSearching: %d, pageIndex=%lu,subpageIndex=%lu, traitCollection=%@>"),
                    v5,
                    self,
                    v7,
                    v9,
                    v10,
                    v11,
                    v12,
                    v13,
                    v14,
                    v15));

  return v16;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (CRLEditingCoordinator)editingCoordinator
{
  return self->_editingCoordinator;
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (unint64_t)subpageIndex
{
  return self->_subpageIndex;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_editingCoordinator, 0);
}

@end
