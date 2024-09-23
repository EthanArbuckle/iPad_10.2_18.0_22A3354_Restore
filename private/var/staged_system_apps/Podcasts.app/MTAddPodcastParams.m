@implementation MTAddPodcastParams

- (MTAddPodcastParams)init
{
  MTAddPodcastParams *v2;
  MTAddPodcastParams *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAddPodcastParams;
  v2 = -[MTAddPodcastParams init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MTAddPodcastParams setUserInitiated:](v2, "setUserInitiated:", 1);
  return v3;
}

- (void)setUrl:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  NSString *url;
  id v18;
  id v19;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scheme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("pcast")))
  {

LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resourceSpecifier"));
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("http:%@"), v8);
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("feed"));

  if (v7)
    goto LABEL_4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("pcasts")))
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("feeds"));

    if (!v12)
    {
      v15 = v18;
      goto LABEL_10;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resourceSpecifier"));
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https:%@"), v8);
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));

  v15 = (void *)v14;
LABEL_10:
  v19 = v15;
  v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
  url = self->_url;
  self->_url = v16;

}

- (NSString)url
{
  return self->_url;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int64_t)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(int64_t)a3
{
  self->_storeCollectionId = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)processingCompletion
{
  return self->_processingCompletion;
}

- (void)setProcessingCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processingCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
