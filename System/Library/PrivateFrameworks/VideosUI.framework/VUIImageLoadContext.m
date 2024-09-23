@implementation VUIImageLoadContext

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void)setImageLoadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoadOperation, a3);
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadOperation, 0);
}

- (VUIImageLoadingOperation)imageLoadOperation
{
  return self->_imageLoadOperation;
}

@end
