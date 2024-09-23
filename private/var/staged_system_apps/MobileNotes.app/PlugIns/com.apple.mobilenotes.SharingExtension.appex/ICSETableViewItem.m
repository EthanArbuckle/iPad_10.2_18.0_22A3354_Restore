@implementation ICSETableViewItem

- (double)cellHeight
{
  double v3;
  _BOOL8 v4;
  uint64_t v5;

  v3 = sub_1000062FC();
  v4 = -[ICSETableViewItem isSearchResult](self, "isSearchResult");
  if (v4 || ICAccessibilityAccessibilityLargerTextSizesEnabled(v4, v5))
    return UITableViewAutomaticDimension;
  return v3;
}

- (UIEdgeInsets)seperatorInsets
{
  double v3;
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  if (-[ICSETableViewItem isSearchResult](self, "isSearchResult"))
  {
    v3 = 52.0;
  }
  else if (-[ICSETableViewItem isInFolderList](self, "isInFolderList")
         && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folderListItem](self, "folderListItem")),
             v4,
             v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folderListItem](self, "folderListItem"));
    v6 = (char *)objc_msgSend(v5, "level") - 1;

    v3 = (double)(unint64_t)v6 * 33.0 + 53.0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
    if (v7)
    {

      v3 = 53.0;
    }
    else
    {
      v8 = -[ICSETableViewItem isAccountFolder](self, "isAccountFolder");
      v3 = 53.0;
      if (!v8)
        v3 = 41.0;
    }
  }
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  result.right = v11;
  result.bottom = v10;
  result.left = v3;
  result.top = v9;
  return result;
}

- (BOOL)isSelectable
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v14;

  if (-[ICSETableViewItem isHeader](self, "isHeader"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
  v4 = objc_msgSend(v3, "isPasswordProtected");

  if ((v4 & 1) != 0)
    return 0;
  v5 = objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
    v8 = objc_msgSend(v7, "isEditable");

    if (!v8)
      return 0;
  }
  v9 = objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
  if (!v9)
    return 1;
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
  if ((objc_msgSend(v11, "canMoveAddOrDeleteContents") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
    v12 = objc_msgSend(v14, "isSystemFolder");

  }
  return v12;
}

- (BOOL)isChecked
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem selectedNote](self, "selectedNote"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem selectedFolder](self, "selectedFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem account](self, "account"));
  if (v4)
    v7 = v4;
  else
    v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));

  if (v9)
  {
    v10 = v3;
    v11 = v4;
LABEL_6:
    LOBYTE(v12) = objc_msgSend(v10, "isEqual:", v11);
    goto LABEL_7;
  }
  v14 = objc_claimAutoreleasedReturnValue(-[ICSETableViewItem account](self, "account"));
  if (!v14)
  {
    LOBYTE(v12) = 0;
    goto LABEL_7;
  }
  v15 = (void *)v14;
  v12 = -[ICSETableViewItem isAccountPicker](self, "isAccountPicker");

  if (v12)
  {
    v10 = v8;
    v11 = v6;
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (UIImage)image
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  if (-[ICSETableViewItem isHeader](self, "isHeader"))
    goto LABEL_2;
  if (-[ICSETableViewItem isChecked](self, "isChecked"))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
  v6 = objc_msgSend(v5, "isPasswordProtected");

  if (v6)
  {
    v7 = CFSTR("lock.fill");
LABEL_10:
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage ic_smallSystemImageNamed:](UIImage, "ic_smallSystemImageNamed:", v7));
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
  if ((objc_msgSend(v8, "isSharedViaICloud") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem noteContainer](self, "noteContainer"));
    v10 = objc_msgSend(v9, "isSharedViaICloud");

    if ((v10 & 1) == 0)
    {
      v7 = CFSTR("person.crop.circle");
      goto LABEL_10;
    }
  }
  else
  {

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
  if (v12)
  {

  }
  else if (!-[ICSETableViewItem isAccountFolder](self, "isAccountFolder"))
  {
    if (!-[ICSETableViewItem isSystemPaperFolder](self, "isSystemPaperFolder"))
    {
LABEL_2:
      v3 = 0;
      return (UIImage *)v3;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("quicknote")));
LABEL_11:
    v3 = (void *)v4;
    return (UIImage *)v3;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "systemImageName"));
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[ICFolder defaultSystemImageName](ICFolder, "defaultSystemImageName"));
  v17 = v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", v17));
  return (UIImage *)v3;
}

- (NSString)cellIdentifier
{
  void *v3;
  void *v5;
  NSObject *v6;

  if (-[ICSETableViewItem isSearchResult](self, "isSearchResult"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));

    if (v3)
      return (NSString *)CFSTR("SearchResultNoteCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
    if (v5 || -[ICSETableViewItem isSystemPaperFolder](self, "isSystemPaperFolder"))
    {

      return (NSString *)CFSTR("SearchResultFolderCell");
    }
    if (-[ICSETableViewItem isAccountFolder](self, "isAccountFolder"))
      return (NSString *)CFSTR("SearchResultFolderCell");
    v6 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10009E738(v6);

  }
  return (NSString *)CFSTR("NoteCell");
}

+ (id)tableViewItemFromObject:(id)a3 selectedNote:(id)a4 selectedFolder:(id)a5 isSearchResult:(BOOL)a6 isAccountPicker:(BOOL)a7
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  ICSETableViewItem *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  int v56;
  void *v57;
  void *v58;
  id v60;
  _BOOL4 v61;
  void *v62;

  v7 = a7;
  v61 = a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v14 = objc_opt_class(ICNote, v13);
  v15 = ICDynamicCast(v14, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v18 = objc_opt_class(ICFolder, v17);
  v19 = ICDynamicCast(v18, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v22 = objc_opt_class(ICAccount, v21);
  v23 = ICDynamicCast(v22, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v26 = objc_opt_class(ICSEFolderListItem, v25);
  v27 = ICDynamicCast(v26, v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  if (v28)
  {
    v60 = v11;
    v29 = v10;
    v30 = v7;
    if (objc_msgSend(v28, "isAccount"))
    {
      v32 = objc_opt_class(ICAccount, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteContainer"));
      v34 = ICDynamicCast(v32, v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      v36 = v24;
      v24 = (void *)v35;
    }
    else
    {
      v37 = objc_opt_class(ICFolder, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteContainer"));
      v38 = ICDynamicCast(v37, v33);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v36 = v20;
      v20 = (void *)v39;
    }

    v7 = v30;
    v10 = v29;
    v11 = v60;
  }
  if (objc_msgSend(v16, "isDeletedOrInTrash"))
  {

    v16 = 0;
  }
  if (objc_msgSend(v20, "isTrashFolder"))
  {

    v20 = 0;
  }
  if (v28 || v16 || v20 || v24)
  {
    v40 = objc_alloc_init(ICSETableViewItem);
    -[ICSETableViewItem setNote:](v40, "setNote:", v16);
    -[ICSETableViewItem setFolder:](v40, "setFolder:", v20);
    -[ICSETableViewItem setAccount:](v40, "setAccount:", v24);
    -[ICSETableViewItem setFolderListItem:](v40, "setFolderListItem:", v28);
    -[ICSETableViewItem setSelectedNote:](v40, "setSelectedNote:", v10);
    -[ICSETableViewItem setSelectedFolder:](v40, "setSelectedFolder:", v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
    if (v20)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedTitle"));
      v43 = objc_msgSend(v42, "copy");
      v44 = v41;
      v45 = v24;
      v46 = v11;
      v47 = v10;
      v48 = v7;
      v49 = v43;

      v50 = v49;
      v7 = v48;
      v10 = v47;
      v11 = v46;
      v24 = v45;
      v41 = v50;
    }
    -[ICSETableViewItem setTitle:](v40, "setTitle:", v41);
    -[ICSETableViewItem setIsSearchResult:](v40, "setIsSearchResult:", v61);
    -[ICSETableViewItem setIsAccountPicker:](v40, "setIsAccountPicker:", v7);
    if (v24)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accountName"));
      v52 = v51;
      if ((v7 & 1) != 0)
      {
        -[ICSETableViewItem setTitle:](v40, "setTitle:", v51);
      }
      else
      {
        v62 = v41;
        v53 = v24;
        v54 = v11;
        v55 = v10;
        v56 = v7;
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedUppercaseString"));
        -[ICSETableViewItem setTitle:](v40, "setTitle:", v7);

        LODWORD(v7) = v56;
        v10 = v55;
        v11 = v54;
        v24 = v53;
        v41 = v62;
      }

      -[ICSETableViewItem setIsAccountHeader:](v40, "setIsAccountHeader:", v7 ^ 1);
    }
    if (v16)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "modificationDate"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "ic_briefFormattedDate"));
      -[ICSETableViewItem setSecondaryTitle:](v40, "setSecondaryTitle:", v58);

    }
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (id)tableViewItemsForObjects:(id)a3 selectedNote:(id)a4 selectedFolder:(id)a5 isSearchResult:(BOOL)a6 noteContainer:(id)a7 isAccountPicker:(BOOL)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id obj;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v25 = a8;
  v9 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v13;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tableViewItemFromObject:selectedNote:selectedFolder:isSearchResult:isAccountPicker:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v21), v14, v15, v9, v25));
        objc_msgSend(v22, "setNoteContainer:", v16);
        objc_msgSend(v17, "ic_addNonNilObject:", v22);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "note"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
    if (v8 == v9)
    {
      v12 = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "folder"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
      v12 = v10 == v11;

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem note](self, "note"));
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableViewItem folder](self, "folder"));
  v6 = objc_msgSend(v5, "hash");
  v14 = sub_100013328((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13, v6);

  return v14;
}

+ (void)configureTableViewNibs:(id)a3
{
  id v4;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSBundle *v14;
  void *v15;
  id v16;

  v4 = a3;
  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("ICSETableViewCell"), v7));

  objc_msgSend(v4, "registerNib:forCellReuseIdentifier:", v8, CFSTR("NoteCell"));
  v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("ICSEFolderSearchResultTableViewCell"), v11));

  objc_msgSend(v4, "registerNib:forCellReuseIdentifier:", v12, CFSTR("SearchResultFolderCell"));
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (id)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("ICSENoteSearchResultTableViewCell"), v15));

  objc_msgSend(v4, "registerNib:forCellReuseIdentifier:", v16, CFSTR("SearchResultNoteCell"));
}

- (BOOL)isSearchResult
{
  return self->_isSearchResult;
}

- (void)setIsSearchResult:(BOOL)a3
{
  self->_isSearchResult = a3;
}

- (void)setIsHeader:(BOOL)a3
{
  self->_isHeader = a3;
}

- (BOOL)isAccountPicker
{
  return self->_isAccountPicker;
}

- (void)setIsAccountPicker:(BOOL)a3
{
  self->_isAccountPicker = a3;
}

- (BOOL)isInFolderList
{
  return self->_isInFolderList;
}

- (void)setIsInFolderList:(BOOL)a3
{
  self->_isInFolderList = a3;
}

- (BOOL)isAccountHeader
{
  return self->_isAccountHeader;
}

- (void)setIsAccountHeader:(BOOL)a3
{
  self->_isAccountHeader = a3;
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (ICAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (ICSEFolderListItem)folderListItem
{
  return self->_folderListItem;
}

- (void)setFolderListItem:(id)a3
{
  objc_storeStrong((id *)&self->_folderListItem, a3);
}

- (BOOL)isAccountFolder
{
  return self->_isAccountFolder;
}

- (void)setIsAccountFolder:(BOOL)a3
{
  self->_isAccountFolder = a3;
}

- (BOOL)isSystemPaperFolder
{
  return self->_isSystemPaperFolder;
}

- (void)setIsSystemPaperFolder:(BOOL)a3
{
  self->_isSystemPaperFolder = a3;
}

- (ICNote)selectedNote
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_selectedNote);
}

- (void)setSelectedNote:(id)a3
{
  objc_storeWeak((id *)&self->_selectedNote, a3);
}

- (ICFolder)selectedFolder
{
  return (ICFolder *)objc_loadWeakRetained((id *)&self->_selectedFolder);
}

- (void)setSelectedFolder:(id)a3
{
  objc_storeWeak((id *)&self->_selectedFolder, a3);
}

- (ICNoteContainer)noteContainer
{
  return (ICNoteContainer *)objc_loadWeakRetained((id *)&self->_noteContainer);
}

- (void)setNoteContainer:(id)a3
{
  objc_storeWeak((id *)&self->_noteContainer, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_noteContainer);
  objc_destroyWeak((id *)&self->_selectedFolder);
  objc_destroyWeak((id *)&self->_selectedNote);
  objc_storeStrong((id *)&self->_folderListItem, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
