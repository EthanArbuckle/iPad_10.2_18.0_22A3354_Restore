@implementation BICDescribedImagePair

- (BOOL)isEqualToDescribedImagePair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImagePair sourceImage](self, "sourceImage"));
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImagePair destinationImage](self, "destinationImage"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  BICDescribedImagePair *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BICDescribedImagePair *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(BICDescribedImagePair);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[BICDescribedImagePair isEqualToDescribedImagePair:](self, "isEqualToDescribedImagePair:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (BICDescribedImage)sourceImage
{
  return self->_sourceImage;
}

- (void)setSourceImage:(id)a3
{
  objc_storeStrong((id *)&self->_sourceImage, a3);
}

- (BICDescribedImage)destinationImage
{
  return self->_destinationImage;
}

- (void)setDestinationImage:(id)a3
{
  objc_storeStrong((id *)&self->_destinationImage, a3);
}

- (BICDescribedImage)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_destinationImage, 0);
  objc_storeStrong((id *)&self->_sourceImage, 0);
}

@end
