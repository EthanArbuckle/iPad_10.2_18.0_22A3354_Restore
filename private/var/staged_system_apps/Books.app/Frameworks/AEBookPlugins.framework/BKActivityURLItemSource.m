@implementation BKActivityURLItemSource

- (BKActivityURLItemSource)initWithPath:(id)a3
{
  id v4;
  BKActivityURLItemSource *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKActivityURLItemSource;
  v5 = -[BKActivityURLItemSource init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
