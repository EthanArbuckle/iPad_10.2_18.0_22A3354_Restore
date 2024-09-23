@implementation ICCloudItemIDList

- (ICCloudItemIDList)init
{
  ICCloudItemIDList *v2;
  NSMutableArray *v3;
  NSMutableArray *itemIDs;
  NSMutableArray *v5;
  NSMutableArray *idTypes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICCloudItemIDList;
  v2 = -[ICCloudItemIDList init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    itemIDs = v2->_itemIDs;
    v2->_itemIDs = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    idTypes = v2->_idTypes;
    v2->_idTypes = v5;

  }
  return v2;
}

- (ICCloudItemIDList)initWithCoder:(id)a3
{
  id v4;
  ICCloudItemIDList *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *itemIDs;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *idTypes;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICCloudItemIDList;
  v5 = -[ICCloudItemIDList init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("ICCloudItemIDListItemIDs"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemIDs = v5->_itemIDs;
    v5->_itemIDs = (NSMutableArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("ICCloudItemIDListIDTypes"));
    v15 = objc_claimAutoreleasedReturnValue();
    idTypes = v5->_idTypes;
    v5->_idTypes = (NSMutableArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *itemIDs;
  id v5;

  itemIDs = self->_itemIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIDs, CFSTR("ICCloudItemIDListItemIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idTypes, CFSTR("ICCloudItemIDListIDTypes"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSMutableArray copyWithZone:](self->_itemIDs, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSMutableArray copyWithZone:](self->_idTypes, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p Item ID Count = %lu>"), objc_opt_class(), self, -[NSMutableArray count](self->_itemIDs, "count"));
}

- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4
{
  NSMutableArray *itemIDs;
  void *v7;
  NSMutableArray *idTypes;
  id v9;

  itemIDs = self->_itemIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](itemIDs, "addObject:", v7);

  idTypes = self->_idTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](idTypes, "addObject:", v9);

}

- (void)addGlobalPlaylistID:(id)a3
{
  -[NSMutableArray addObject:](self->_itemIDs, "addObject:", a3);
  -[NSMutableArray addObject:](self->_idTypes, "addObject:", &unk_1E43E66E8);
}

- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5
{
  NSMutableArray *itemIDs;
  void *v9;
  NSMutableArray *idTypes;
  id v11;

  itemIDs = self->_itemIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](itemIDs, "insertObject:atIndex:", v9, a5);

  idTypes = self->_idTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](idTypes, "insertObject:atIndex:", v11, a5);

}

- (void)enumerateCloudItemIDsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, uint64_t, unsigned __int8 *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v12;

  v4 = (void (**)(id, void *, uint64_t, uint64_t, unsigned __int8 *))a3;
  if (v4)
  {
    v12 = 0;
    v5 = -[NSMutableArray count](self->_itemIDs, "count");
    if (v5)
    {
      v6 = 0;
      v7 = v5 - 1;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_itemIDs, "objectAtIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_idTypes, "objectAtIndex:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        v4[2](v4, v8, v10, v6, &v12);
        LODWORD(v9) = v12;

        if ((_DWORD)v9)
          break;
      }
      while (v7 != v6++);
    }
  }

}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_itemIDs, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idTypes, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
