@implementation SVImageLayer

- (void)setImage:(id)a3
{
  NSString *identifier;
  id v6;

  objc_storeStrong((id *)&self->_image, a3);
  v6 = objc_retainAutorelease(a3);
  -[SVImageLayer setContents:](self, "setContents:", objc_msgSend(v6, "CGImage"));
  if (v6)
    identifier = self->_identifier;
  else
    identifier = 0;
  objc_storeStrong((id *)&self->_identifier, identifier);

}

- (UIImage)image
{
  return self->_image;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
