@implementation ICSearchResultConfiguration

- (ICSearchResultConfiguration)initWithSearchString:(id)a3 searchSuggestionType:(unint64_t)a4 isTopHit:(BOOL)a5 foundAttachmentObjectID:(id)a6 sortableSearchableItem:(id)a7
{
  id v13;
  id v14;
  id v15;
  ICSearchResultConfiguration *v16;
  ICSearchResultConfiguration *v17;
  objc_super v19;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ICSearchResultConfiguration;
  v16 = -[ICSearchResultConfiguration init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_searchString, a3);
    v17->_searchStringLength = objc_msgSend(v13, "length");
    v17->_searchSuggestionType = a4;
    v17->_isTopHit = a5;
    objc_storeStrong((id *)&v17->_foundAttachmentObjectID, a6);
    objc_storeStrong((id *)&v17->_sortableSearchableItem, a7);
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = self->_hash;
  if (!result)
  {
    -[ICSearchResultConfiguration searchString](self, "searchString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    v6 = -[ICSearchResultConfiguration searchSuggestionType](self, "searchSuggestionType");
    -[ICSearchResultConfiguration isTopHit](self, "isTopHit");
    -[ICSearchResultConfiguration foundAttachmentObjectID](self, "foundAttachmentObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hash");
    -[ICSearchResultConfiguration sortableSearchableItem](self, "sortableSearchableItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hash");
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v6);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  int v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  char v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)ICSearchResultConfiguration;
  v4 = a3;
  v5 = -[ICSearchResultConfiguration isEqual:](&v24, sel_isEqual_, v4);
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
    goto LABEL_8;
  -[ICSearchResultConfiguration searchString](self, "searchString", v24.receiver, v24.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_8;
  v11 = -[ICSearchResultConfiguration searchSuggestionType](self, "searchSuggestionType");
  if (v11 != objc_msgSend(v6, "searchSuggestionType"))
    goto LABEL_8;
  v12 = -[ICSearchResultConfiguration isTopHit](self, "isTopHit");
  if (v12 != objc_msgSend(v6, "isTopHit"))
    goto LABEL_8;
  -[ICSearchResultConfiguration foundAttachmentObjectID](self, "foundAttachmentObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "foundAttachmentObjectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v15)
    v18 = 0;
  else
    v18 = v15;
  v19 = v18;
  if (v17 == v16)
    v20 = 0;
  else
    v20 = v16;
  v21 = v20;
  if (!(v19 | v21))
  {

    goto LABEL_22;
  }
  v22 = (void *)v21;
  if (!v19 || !v21)
  {

    v13 = 0;
    goto LABEL_24;
  }
  v23 = objc_msgSend((id)v19, "isEqual:", v21);

  if ((v23 & 1) != 0)
  {
LABEL_22:
    -[ICSearchResultConfiguration sortableSearchableItem](self, "sortableSearchableItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortableSearchableItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "isEqual:", v16);
LABEL_24:

    goto LABEL_9;
  }
LABEL_8:
  v13 = 0;
LABEL_9:

  return v13;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (unint64_t)searchStringLength
{
  return self->_searchStringLength;
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (NSManagedObjectID)foundAttachmentObjectID
{
  return self->_foundAttachmentObjectID;
}

- (ICSortableSearchableItem)sortableSearchableItem
{
  return self->_sortableSearchableItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortableSearchableItem, 0);
  objc_storeStrong((id *)&self->_foundAttachmentObjectID, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
