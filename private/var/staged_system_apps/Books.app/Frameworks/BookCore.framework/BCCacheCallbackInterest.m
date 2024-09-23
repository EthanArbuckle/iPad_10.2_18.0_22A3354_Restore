@implementation BCCacheCallbackInterest

- (void)setDescribedImage:(id)a3
{
  id v4;
  void (**v5)(id, id, _QWORD);

  v4 = a3;
  -[BCCacheCallbackInterest setDescribedImageShown:](self, "setDescribedImageShown:", v4);
  v5 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue(-[BCCacheCallbackInterest handler](self, "handler"));
  v5[2](v5, v4, 0);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheCallbackInterest describedImageShown](self, "describedImageShown"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheCallbackInterest describedImageRequested](self, "describedImageRequested"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("shown: %@, requested: %@"), v3, v4));

  return v5;
}

- (BICDescribedImage)describedImageRequested
{
  return self->describedImageRequested;
}

- (void)setDescribedImageRequested:(id)a3
{
  objc_storeStrong((id *)&self->describedImageRequested, a3);
}

- (BICDescribedImage)describedImageShown
{
  return (BICDescribedImage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDescribedImageShown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)needsNewVersion
{
  return self->needsNewVersion;
}

- (void)setNeedsNewVersion:(BOOL)a3
{
  self->needsNewVersion = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->describedImageShown, 0);
  objc_storeStrong((id *)&self->describedImageRequested, 0);
}

@end
