@implementation BABookmarkItem

- (BABookmarkItem)initWithBookmarkCollection:(id)a3 bookmark:(id)a4
{
  id v7;
  id v8;
  BABookmarkItem *v9;
  BABookmarkItem *v10;
  BABookmarkItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BABookmarkItem;
  v9 = -[BABookmarkItem init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeStrong((id *)&v10->_bookmark, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[WebBookmark isFolder](self->_bookmark, "isFolder"))
    v4 = "BAFolder";
  else
    v4 = "BABookmark";
  v5 = -[WebBookmark identifier](self->_bookmark, "identifier");
  -[WebBookmark serverID](self->_bookmark, "serverID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wb_stringByRedactingBookmarkDAVServerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s %p; localID: %d; serverID: %@; item: %p>"),
    v4,
    self,
    v5,
    v7,
    self->_bookmark);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
