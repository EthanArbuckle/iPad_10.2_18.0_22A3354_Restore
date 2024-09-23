@implementation BEProtocolCacheItem

- (BEProtocolCacheItem)init
{
  BEProtocolCacheItem *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *svgCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEProtocolCacheItem;
  v2 = -[BEProtocolCacheItem init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    svgCache = v2->_svgCache;
    v2->_svgCache = v3;

    v2->_svgCacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)infoForDocumentAtPath:(id)a3
{
  return -[NSDictionary objectForKey:](self->_documents, "objectForKey:", a3);
}

- (id)dataForSinfNumber:(id)a3
{
  return -[NSDictionary objectForKey:](self->_sinfInfo, "objectForKey:", a3);
}

- (id)cachedSVGForURL:(id)a3
{
  os_unfair_lock_s *p_svgCacheLock;
  id v4;
  _QWORD *v5;
  id v6;
  _QWORD v8[2];
  void (*v9)(_QWORD *);
  void *v10;
  BEProtocolCacheItem *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_955C;
  v18 = sub_956C;
  v19 = 0;
  p_svgCacheLock = &self->_svgCacheLock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_9574;
  v10 = &unk_377790;
  v13 = &v14;
  v11 = self;
  v4 = a3;
  v12 = v4;
  v5 = v8;
  os_unfair_lock_lock(p_svgCacheLock);
  v9(v5);
  os_unfair_lock_unlock(p_svgCacheLock);

  v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

- (void)cacheSVG:(id)a3 url:(id)a4
{
  id v6;
  os_unfair_lock_s *p_svgCacheLock;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  p_svgCacheLock = &self->_svgCacheLock;
  v10[2] = sub_966C;
  v10[3] = &unk_3777B8;
  v10[4] = self;
  v11 = a4;
  v12 = v6;
  v8 = v6;
  v9 = v11;
  os_unfair_lock_lock(p_svgCacheLock);
  sub_966C((uint64_t)v10);
  os_unfair_lock_unlock(p_svgCacheLock);

}

- (unint64_t)contentBlockingRule
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BEDocumentExternalLoadApprovalCache sharedInstance](BEDocumentExternalLoadApprovalCache, "sharedInstance"));
  LODWORD(self) = objc_msgSend(v3, "didApproveLoadingExternalContentForBookID:", self->_bookID);

  if ((_DWORD)self)
    return 2;
  else
    return 1;
}

- (NSString)bookID
{
  return self->_bookID;
}

- (void)setBookID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bookEpubId
{
  return self->_bookEpubId;
}

- (void)setBookEpubId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bookEpubIdWithUUIDScheme
{
  return self->_bookEpubIdWithUUIDScheme;
}

- (void)setBookEpubIdWithUUIDScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)sinfInfo
{
  return self->_sinfInfo;
}

- (void)setSinfInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)documents
{
  return self->_documents;
}

- (void)setDocuments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableDictionary)svgCache
{
  return self->_svgCache;
}

- (void)setSvgCache:(id)a3
{
  objc_storeStrong((id *)&self->_svgCache, a3);
}

- (os_unfair_lock_s)svgCacheLock
{
  return self->_svgCacheLock;
}

- (void)setSvgCacheLock:(os_unfair_lock_s)a3
{
  self->_svgCacheLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_svgCache, 0);
  objc_storeStrong((id *)&self->_documents, 0);
  objc_storeStrong((id *)&self->_sinfInfo, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_bookEpubIdWithUUIDScheme, 0);
  objc_storeStrong((id *)&self->_bookEpubId, 0);
  objc_storeStrong((id *)&self->_bookID, 0);
}

@end
