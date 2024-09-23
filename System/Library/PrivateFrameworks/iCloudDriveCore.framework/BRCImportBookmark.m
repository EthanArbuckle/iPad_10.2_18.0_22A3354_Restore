@implementation BRCImportBookmark

+ (id)extractBookmarkDataFromTemplateItem:(id)a3 isTrashBookmark:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  objc_msgSend(v5, "parentItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC8230]) & 1) != 0)
  {
    objc_msgSend(v5, "extendedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("com.apple.clouddocs.private.trash-parent-bookmark#B"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;

      goto LABEL_12;
    }
    objc_msgSend(v5, "extendedAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.trash-parent-bookmark#N"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_12:
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 1;
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        +[BRCImportBookmark extractBookmarkDataFromTemplateItem:isTrashBookmark:].cold.2((uint64_t)v13, v14, v23, v24, v25, v26, v27, v28);
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "extendedAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.clouddocs.private.share-bookmark#B"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9 = (void *)v11;

  }
  else
  {
    objc_msgSend(v5, "extendedAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v21 = 0;
      if (!a4)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[BRCImportBookmark extractBookmarkDataFromTemplateItem:isTrashBookmark:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  v21 = 0;
LABEL_14:

  if (a4)
LABEL_15:
    *a4 = v21;
LABEL_16:

  return v9;
}

- (BRCImportBookmark)initWithBookmarkData:(id)a3 isTrashBookmark:(BOOL)a4 session:(id)a5
{
  id v8;
  id v9;
  BRCImportBookmark *v10;
  BRCImportBookmark *v11;
  void *v12;
  BRCImportBookmark *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BRCImportBookmark;
  v10 = -[BRCImportBookmark init](&v15, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_6;
  if (!v8)
  {
    v12 = 0;
    v10->_isTrashBookmark = a4;
LABEL_8:

    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v8), "bytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11->_isTrashBookmark = a4;
  if (!v12
    || !+[BRCLocalItem parseBookmarkData:inAccountSession:itemID:mangledID:unsaltedBookmarkData:error:](BRCLocalItem, "parseBookmarkData:inAccountSession:itemID:mangledID:unsaltedBookmarkData:error:", v12, v9, &v11->_itemID, &v11->_mangledID, 0, 0))
  {
    goto LABEL_8;
  }

LABEL_6:
  v13 = v11;
LABEL_9:

  return v13;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (BOOL)isTrashBookmark
{
  return self->_isTrashBookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

+ (void)extractBookmarkDataFromTemplateItem:(uint64_t)a3 isTrashBookmark:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] Shared item has bookmark data for import%@", a5, a6, a7, a8, 2u);
}

+ (void)extractBookmarkDataFromTemplateItem:(uint64_t)a3 isTrashBookmark:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] Trashed item has bookmark data for import%@", a5, a6, a7, a8, 2u);
}

@end
