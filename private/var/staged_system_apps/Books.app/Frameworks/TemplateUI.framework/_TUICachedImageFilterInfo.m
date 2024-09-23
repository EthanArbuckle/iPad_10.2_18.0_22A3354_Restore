@implementation _TUICachedImageFilterInfo

- (_TUICachedImageFilterInfo)initWithFilter:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  _TUICachedImageFilterInfo *v11;
  _TUICachedImageFilterInfo *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_TUICachedImageFilterInfo;
  v11 = -[_TUICachedImageFilterInfo init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_filter, a3);
    v12->_naturalSize.width = width;
    v12->_naturalSize.height = height;
    v12->_contentsScale = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  BCUImageFilter *filter;
  BCUImageFilter *v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  double contentsScale;
  double v16;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(self))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    filter = self->_filter;
    v10 = (BCUImageFilter *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filter"));
    if (filter == v10
      && ((objc_msgSend(v8, "naturalSize"), self->_naturalSize.width == v12)
        ? (v13 = self->_naturalSize.height == v11)
        : (v13 = 0),
          v13))
    {
      contentsScale = self->_contentsScale;
      objc_msgSend(v8, "contentsScale");
      v14 = contentsScale == v16;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return (unint64_t)-[BCUImageFilter hash](self->_filter, "hash") ^ (unint64_t)self->_naturalSize.width ^ (unint64_t)self->_naturalSize.height ^ (unint64_t)self->_contentsScale;
}

- (BCUImageFilter)filter
{
  return self->_filter;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_naturalSize.width;
  height = self->_naturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
