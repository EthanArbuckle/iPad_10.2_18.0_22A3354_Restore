@implementation MTImageDownloadClientRequest

+ (id)requestForUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUrl:key:podcastUuid:completion:", v13, v12, v11, v10);

  return v14;
}

- (MTImageDownloadClientRequest)initWithUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MTImageDownloadClientRequest *v15;
  void *v16;
  uint64_t v17;
  NSString *uniqueId;
  void *v19;
  void *v20;
  id completion;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MTImageDownloadClientRequest;
  v15 = -[MTImageDownloadClientRequest init](&v23, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    uniqueId = v15->_uniqueId;
    v15->_uniqueId = (NSString *)v17;

    objc_storeStrong((id *)&v15->_url, a3);
    objc_storeStrong((id *)&v15->_key, a4);
    if (v13)
    {
      if (objc_msgSend(v13, "length"))
        v19 = v13;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    objc_storeStrong((id *)&v15->_uuid, v19);
    v20 = _Block_copy(v14);
    completion = v15->_completion;
    v15->_completion = v20;

  }
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("url=%@, key=%@"), self->_url, self->_key);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (-[NSString length](self->_uuid, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuid=%@"), self->_uuid);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_completion)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("completion=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)key
{
  return self->_key;
}

- (id)completion
{
  return self->_completion;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

@end
