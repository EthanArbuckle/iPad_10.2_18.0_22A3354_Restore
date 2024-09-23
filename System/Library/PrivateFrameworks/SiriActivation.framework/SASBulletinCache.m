@implementation SASBulletinCache

- (SASBulletinCache)init
{
  SASBulletinCache *v2;
  SASBulletinCache *v3;
  SASBulletinCacheNode *oldestNode;
  SASBulletinCacheNode *newestNode;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SASBulletinCache;
  v2 = -[SASBulletinCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    oldestNode = v2->_oldestNode;
    v2->_count = 0;
    v2->_oldestNode = 0;

    newestNode = v3->_newestNode;
    v3->_newestNode = 0;

  }
  return v3;
}

- (void)insertBulletin:(id)a3 fromFeed:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SASBulletinCacheNode *v10;
  SASBulletinCacheNode *newestNode;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "bulletinID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    os_unfair_lock_lock(&cacheLock);
    if (-[SASBulletinCache _isFeedRelevant:](self, "_isFeedRelevant:", a4))
    {
      objc_msgSend(v6, "bulletinID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASBulletinCache _findNodeForBulletinID:](self, "_findNodeForBulletinID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        -[SASBulletinCache _deleteNode:](self, "_deleteNode:", v9);
      if (self->_count >= 0x19)
        -[SASBulletinCache _purgeOldestNodes](self, "_purgeOldestNodes");
      v10 = objc_alloc_init(SASBulletinCacheNode);
      -[SASBulletinCacheNode setBulletin:](v10, "setBulletin:", v6);
      if (!self->_oldestNode)
        objc_storeStrong((id *)&self->_oldestNode, v10);
      if (self->_newestNode)
      {
        -[SASBulletinCacheNode setPreviousNode:](v10, "setPreviousNode:");
        -[SASBulletinCacheNode setNextNode:](self->_newestNode, "setNextNode:", v10);
      }
      newestNode = self->_newestNode;
      self->_newestNode = v10;

      ++self->_count;
    }
    os_unfair_lock_unlock(&cacheLock);
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SASBulletinCache insertBulletin:fromFeed:].cold.1(v6, v12);
  }

}

- (BOOL)removeBulletinForID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock(&cacheLock);
  -[SASBulletinCache _findNodeForBulletinID:](self, "_findNodeForBulletinID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[SASBulletinCache _deleteNode:](self, "_deleteNode:", v5);
  os_unfair_lock_unlock(&cacheLock);

  return v5 != 0;
}

- (id)allBulletins
{
  void *v3;
  SASBulletinCacheNode *v4;
  os_log_t *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  os_log_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&cacheLock);
  v4 = self->_oldestNode;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  *(_QWORD *)&v6 = 136315650;
  v15 = v6;
  do
  {
    -[SASBulletinCacheNode bulletin](v4, "bulletin", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "bulletinID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v3, "setObject:forKey:", v8, v9);
      }
      else
      {
        v10 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v12 = v10;
          objc_msgSend(v8, "bbBulletin");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v15;
          v17 = "-[SASBulletinCache allBulletins]";
          v18 = 2112;
          v19 = v8;
          v20 = 2112;
          v21 = v13;
          _os_log_error_impl(&dword_1D132F000, v12, OS_LOG_TYPE_ERROR, "%s Bulletin cache contains a bulletin with a nil identifier; not including the bulletin as part of the retur"
            "n value of -allBulletins (bulletin: %@; bbBulletin: %@)",
            buf,
            0x20u);

        }
      }

    }
    -[SASBulletinCacheNode nextNode](v4, "nextNode");
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (SASBulletinCacheNode *)v11;
  }
  while (v11);
  os_unfair_lock_unlock(&cacheLock);
  return v3;
}

- (id)cachedBulletinForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_lock_lock(&cacheLock);
  -[SASBulletinCache _findNodeForBulletinID:](self, "_findNodeForBulletinID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bulletin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&cacheLock);

  return v6;
}

- (id)_findNodeForBulletinID:(id)a3
{
  id v4;
  SASBulletinCacheNode *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;

  v4 = a3;
  v5 = self->_oldestNode;
  do
  {
    -[SASBulletinCacheNode bulletin](v5, "bulletin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bulletinID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

    if ((v8 & 1) != 0)
      break;
    -[SASBulletinCacheNode nextNode](v5, "nextNode");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (SASBulletinCacheNode *)v9;
  }
  while (v9);

  return v5;
}

- (void)_deleteNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SASBulletinCacheNode *v8;
  SASBulletinCacheNode *newestNode;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "previousNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNextNode:", v5);
  objc_msgSend(v5, "setPreviousNode:", v10);
  objc_msgSend(v4, "previousNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_storeStrong((id *)&self->_oldestNode, v5);
  objc_msgSend(v4, "nextNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "previousNode");
    v8 = (SASBulletinCacheNode *)objc_claimAutoreleasedReturnValue();
    newestNode = self->_newestNode;
    self->_newestNode = v8;

  }
  objc_msgSend(v4, "setBulletin:", 0);
  objc_msgSend(v4, "setPreviousNode:", 0);
  objc_msgSend(v4, "setNextNode:", 0);

  --self->_count;
}

- (void)_purgeOldestNodes
{
  if (self->_count >= 0x19)
  {
    do
      -[SASBulletinCache _deleteNode:](self, "_deleteNode:", self->_oldestNode);
    while (self->_count > 0x18);
  }
}

- (BOOL)_isFeedRelevant:(unint64_t)a3
{
  return (a3 & 9) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newestNode, 0);
  objc_storeStrong((id *)&self->_oldestNode, 0);
}

- (void)insertBulletin:(void *)a1 fromFeed:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "bbBulletin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[SASBulletinCache insertBulletin:fromFeed:]";
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_1D132F000, v3, OS_LOG_TYPE_ERROR, "%s Bulletin cache is being asked to insert a bulletin with no ID; ignoring the request because bulletin lookup is ID"
    "-based and so there's no reason to store a bulletin with no ID (bulletin: %@; bbBulletin: %@)",
    (uint8_t *)&v5,
    0x20u);

}

@end
