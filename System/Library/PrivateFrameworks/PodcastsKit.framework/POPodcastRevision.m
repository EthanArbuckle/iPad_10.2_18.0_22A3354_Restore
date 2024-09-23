@implementation POPodcastRevision

- (id)deletedModelObject
{
  __CFString *v3;
  id v4;
  void *v5;

  if (-[POPodcastRevision isPodcastCollection](self, "isPodcastCollection"))
    v3 = CFSTR("POPodcastCollection");
  else
    v3 = CFSTR("POPodcastStation");
  v4 = objc_alloc_init(NSClassFromString(&v3->isa));
  -[POPodcastRevision objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v5);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[POPodcastRevision revisionID](self, "revisionID");
  v7 = -[POPodcastRevision revisionType](self, "revisionType");
  if (v7 > 2)
    v8 = CFSTR("unknown");
  else
    v8 = off_24FD62808[v7];
  -[POPodcastRevision objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p) revisionID: %lu, type: %@, uuid, %@"), v5, self, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)revisionID
{
  return self->_revisionID;
}

- (void)setRevisionID:(unint64_t)a3
{
  self->_revisionID = a3;
}

- (int64_t)revisionType
{
  return self->_revisionType;
}

- (void)setRevisionType:(int64_t)a3
{
  self->_revisionType = a3;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (BOOL)isPodcastCollection
{
  return self->_isPodcastCollection;
}

- (void)setIsPodcastCollection:(BOOL)a3
{
  self->_isPodcastCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
