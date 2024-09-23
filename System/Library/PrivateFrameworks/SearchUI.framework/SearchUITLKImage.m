@implementation SearchUITLKImage

- (SearchUITLKImage)initWithSearchUIImage:(id)a3
{
  id v4;
  SearchUITLKImage *v5;
  SearchUITLKImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUITLKImage;
  v5 = -[TLKImage init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SearchUITLKImage setSearchUIImage:](v5, "setSearchUIImage:", v4);

  return v6;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  -[SearchUITLKImage searchUIImage](self, "searchUIImage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loadImageWithScale:isDarkStyle:completionHandler:", v5, v8, a3);

}

- (double)aspectRatio
{
  void *v2;
  double v3;
  double v4;

  -[SearchUITLKImage searchUIImage](self, "searchUIImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aspectRatio");
  v4 = v3;

  return v4;
}

- (SearchUIImage)searchUIImage
{
  return (SearchUIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSearchUIImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchUIImage, 0);
}

@end
