@implementation PXNavigationListItem

- (PXNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5
{
  id v8;
  id v9;
  PXNavigationListItem *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXNavigationListItem;
  v10 = -[PXNavigationListItem init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E5149688;
    objc_storeStrong((id *)&v10->_title, v15);

    v10->_lockState = 0;
    v10->_itemCount = a5;
  }

  return v10;
}

- (PXNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4
{
  return -[PXNavigationListItem initWithIdentifier:title:itemCount:](self, "initWithIdentifier:title:itemCount:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
}

- (NSString)accessoryTitle
{
  NSString *accessoryTitle;
  int64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  accessoryTitle = self->_accessoryTitle;
  if (!accessoryTitle)
  {
    v4 = -[PXNavigationListItem itemCount](self, "itemCount");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = self->_accessoryTitle;
      self->_accessoryTitle = (NSString *)CFSTR(" ");
    }
    else
    {
      v6 = v4;
      PLSharedCountFormatter();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromNumber:", v7);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_accessoryTitle;
      self->_accessoryTitle = v8;

    }
    accessoryTitle = self->_accessoryTitle;
  }
  return accessoryTitle;
}

- (NSString)glyphImageName
{
  return 0;
}

- (NSString)accessoryGlyphImageName
{
  return 0;
}

- (BOOL)isEmbeddedGlyph
{
  void *v2;
  BOOL v3;

  -[PXNavigationListItem glyphImageName](self, "glyphImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PXImageUtilities symbolIsEmbeddedGlyph:](PXImageUtilities, "symbolIsEmbeddedGlyph:", v2);

  return v3;
}

- (BOOL)isDraggable
{
  return 0;
}

- (BOOL)isReorderable
{
  return 0;
}

- (BOOL)isRemovable
{
  return 0;
}

- (BOOL)isRenamable
{
  return 0;
}

- (BOOL)isExpandable
{
  return 0;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isExpanded
{
  return 0;
}

- (int64_t)indentationLevel
{
  return 0;
}

- (PHCollection)collection
{
  return 0;
}

- (int64_t)style
{
  return 0;
}

- (id)representedObject
{
  return 0;
}

- (NSString)visualDescription
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = CFSTR(" ");
  objc_msgSend(&stru_1E5149688, "stringByPaddingToLength:withString:startingAtIndex:", -[PXNavigationListItem indentationLevel](self, "indentationLevel"), CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXNavigationListItem isExpandable](self, "isExpandable"))
  {
    if (-[PXNavigationListItem isExpanded](self, "isExpanded"))
      v3 = CFSTR("▾");
    else
      v3 = CFSTR("▸");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = v3;
  -[PXNavigationListItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListItem accessoryTitle](self, "accessoryTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%p> %@%@%@ (%@)"), self, v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (PXProgrammaticNavigationDestination)destination
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PXNavigationListItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)objc_msgSend(v5, "initWithIdentifier:title:itemCount:", v6, v7, -[PXNavigationListItem itemCount](self, "itemCount"));

  -[PXNavigationListItem accessoryTitle](self, "accessoryTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)v8[3];
  v8[3] = v10;

  -[PXNavigationListItem badgeString](self, "badgeString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  v14 = (void *)v8[4];
  v8[4] = v13;

  v8[5] = -[PXNavigationListItem lockState](self, "lockState");
  return v8;
}

- (BOOL)isEqualToNavigationListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int64_t v27;
  unint64_t v28;
  id v29;
  id v30;
  void *v31;
  char v32;
  int64_t v33;
  id v34;
  id v35;
  void *v36;
  char v37;
  char v38;
  void *v40;
  void *v41;

  v4 = a3;
  -[PXNavigationListItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_30;
  -[PXNavigationListItem title](self, "title");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_30;
  }
  -[PXNavigationListItem accessoryTitle](self, "accessoryTitle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryTitle");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_30;
  }
  -[PXNavigationListItem glyphImageName](self, "glyphImageName");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "glyphImageName");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_30;
  }
  v20 = -[PXNavigationListItem isDraggable](self, "isDraggable");
  if (v20 != objc_msgSend(v4, "isDraggable"))
    goto LABEL_30;
  v21 = -[PXNavigationListItem isReorderable](self, "isReorderable");
  if (v21 != objc_msgSend(v4, "isReorderable"))
    goto LABEL_30;
  v22 = -[PXNavigationListItem isRemovable](self, "isRemovable");
  if (v22 != objc_msgSend(v4, "isRemovable"))
    goto LABEL_30;
  v23 = -[PXNavigationListItem isRenamable](self, "isRenamable");
  if (v23 != objc_msgSend(v4, "isRenamable"))
    goto LABEL_30;
  v24 = -[PXNavigationListItem isExpandable](self, "isExpandable");
  if (v24 != objc_msgSend(v4, "isExpandable"))
    goto LABEL_30;
  v25 = -[PXNavigationListItem isDeletable](self, "isDeletable");
  if (v25 != objc_msgSend(v4, "isDeletable"))
    goto LABEL_30;
  v26 = -[PXNavigationListItem isGroup](self, "isGroup");
  if (v26 != objc_msgSend(v4, "isGroup"))
    goto LABEL_30;
  v27 = -[PXNavigationListItem indentationLevel](self, "indentationLevel");
  if (v27 != objc_msgSend(v4, "indentationLevel"))
    goto LABEL_30;
  v28 = -[PXNavigationListItem lockState](self, "lockState");
  if (v28 != objc_msgSend(v4, "lockState"))
    goto LABEL_30;
  -[PXNavigationListItem collection](self, "collection");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collection");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v29 == v30)
  {

  }
  else
  {
    v31 = v30;
    v32 = objc_msgSend(v29, "isEqual:", v30);

    if ((v32 & 1) == 0)
      goto LABEL_30;
  }
  v33 = -[PXNavigationListItem style](self, "style");
  if (v33 != objc_msgSend(v4, "style"))
  {
LABEL_30:
    v38 = 0;
    goto LABEL_31;
  }
  -[PXNavigationListItem badgeString](self, "badgeString");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badgeString");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (v34 == v35)
  {

  }
  else
  {
    v36 = v35;
    v37 = objc_msgSend(v34, "isEqualToString:", v35);

    if ((v37 & 1) == 0)
      goto LABEL_30;
  }
  -[PXNavigationListItem destination](self, "destination");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 == v41)
    v38 = 1;
  else
    v38 = objc_msgSend(v40, "isEqual:", v41);

LABEL_31:
  return v38;
}

- (BOOL)isEqual:(id)a3
{
  PXNavigationListItem *v4;
  BOOL v5;

  v4 = (PXNavigationListItem *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PXNavigationListItem isEqualToNavigationListItem:](self, "isEqualToNavigationListItem:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;

  -[PXNavigationListItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PXNavigationListItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[PXNavigationListItem accessoryTitle](self, "accessoryTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[PXNavigationListItem glyphImageName](self, "glyphImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  if (-[PXNavigationListItem isDraggable](self, "isDraggable"))
    v11 = 2;
  else
    v11 = 0;
  v12 = -[PXNavigationListItem isRemovable](self, "isRemovable");
  v13 = 4;
  if (!v12)
    v13 = 0;
  v14 = v10 ^ v11 ^ v13;
  if (-[PXNavigationListItem isRenamable](self, "isRenamable"))
    v15 = 8;
  else
    v15 = 0;
  v16 = -[PXNavigationListItem isExpandable](self, "isExpandable");
  v17 = 16;
  if (!v16)
    v17 = 0;
  v18 = v15 ^ v17;
  v19 = -[PXNavigationListItem isGroup](self, "isGroup");
  v20 = 32;
  if (!v19)
    v20 = 0;
  v21 = v14 ^ v18 ^ v20 ^ (-[PXNavigationListItem indentationLevel](self, "indentationLevel") << 6);
  if (-[PXNavigationListItem isReorderable](self, "isReorderable"))
    v22 = 128;
  else
    v22 = 0;
  v23 = -[PXNavigationListItem isDeletable](self, "isDeletable");
  v24 = 256;
  if (!v23)
    v24 = 0;
  v25 = v21 ^ v22 ^ v24 ^ (-[PXNavigationListItem style](self, "style") << 9);
  v26 = v25 ^ (-[PXNavigationListItem lockState](self, "lockState") << 10);
  -[PXNavigationListItem collection](self, "collection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hash");

  -[PXNavigationListItem badgeString](self, "badgeString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28 ^ objc_msgSend(v29, "hash");

  -[PXNavigationListItem destination](self, "destination");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v26 ^ v30 ^ objc_msgSend(v31, "hash");

  return v32;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[PXNavigationListItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = %@, identifier = %@, indentationLevel = %ld"),
    v4,
    self,
    v5,
    v6,
    -[PXNavigationListItem indentationLevel](self, "indentationLevel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXNavigationListItem glyphImageName](self, "glyphImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXNavigationListItem glyphImageName](self, "glyphImageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(", glyphImageName = %@"), v9);

  }
  -[PXNavigationListItem badgeString](self, "badgeString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXNavigationListItem badgeString](self, "badgeString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(", badgeString = %@"), v11);

  }
  v12 = -[PXNavigationListItem lockState](self, "lockState");
  if (v12 > 2)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E5126708[v12];
  objc_msgSend(v7, "appendFormat:", CFSTR(", lockState = %@>"), v13);
  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)badgeString
{
  return self->_badgeString;
}

- (void)setBadgeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeString, 0);
  objc_storeStrong((id *)&self->_accessoryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
