@implementation PinnedConversationItem

+ (id)pinnedItemWithID:(id)a3 dynamicOffset:(id)a4 indexPathProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  PinnedConversationItem *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    v11 = objc_alloc_init(PinnedConversationItem);
    -[PinnedConversationItem setItemID:](v11, "setItemID:", v7);
    -[PinnedConversationItem setDynamicOffset:](v11, "setDynamicOffset:", v8);
    -[PinnedConversationItem setIndexPathProvider:](v11, "setIndexPathProvider:", v10);
  }

  return v11;
}

- (NSIndexPath)indexPath
{
  uint64_t (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;

  v3 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PinnedConversationItem indexPathProvider](self, "indexPathProvider"));
  v4 = ((uint64_t (**)(_QWORD, PinnedConversationItem *))v3)[2](v3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSIndexPath *)v5;
}

- (NSString)ef_publicDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PinnedConversationItem itemID](self, "itemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PinnedConversationItem indexPath](self, "indexPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PinnedConversationItem dynamicOffset](self, "dynamicOffset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> itemID=%@ indexPath=%@ dynamicOffset=%@"), v3, self, v4, v5, v7));

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = objc_opt_class(PinnedConversationItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOffset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PinnedConversationItem dynamicOffset](self, "dynamicOffset"));
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PinnedConversationItem itemID](self, "itemID"));
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (MFDynamicCellOffsetRepresentation)dynamicOffset
{
  return self->_dynamicOffset;
}

- (void)setDynamicOffset:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicOffset, a3);
}

- (id)indexPathProvider
{
  return self->_indexPathProvider;
}

- (void)setIndexPathProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_indexPathProvider, 0);
  objc_storeStrong((id *)&self->_dynamicOffset, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
