@implementation PXFileBackedImageKey

- (PXFileBackedImageKey)initWithUrl:(id)a3 size:(CGSize)a4 preferHDR:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  PXFileBackedImageKey *v10;
  uint64_t v11;
  NSURL *url;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXFileBackedImageKey;
  v10 = -[PXFileBackedImageKey init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    v10->_size.width = width;
    v10->_size.height = height;
    v10->_preferHDR = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSURL hash](self->_url, "hash");
  v4 = CGSizeHash();
  v5 = 123;
  if (!self->_preferHDR)
    v5 = 321;
  return v5 - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3) + 29791;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  if (-[NSURL isEqual:](self->_url, "isEqual:", *((_QWORD *)v4 + 2)))
    v5 = self->_size.height == v4[4] && self->_size.width == v4[3];
  else
    v5 = 0;

  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
