@implementation UISearchToken

- (id)_initToken
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchToken;
  return -[UISearchToken init](&v3, sel_init);
}

+ (UISearchToken)tokenWithImage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[UISearchToken _initToken]([_UISearchToken alloc], "_initToken");
  objc_msgSend(v4, "setImage:", v3);

  return (UISearchToken *)v4;
}

+ (UISearchToken)tokenWithIcon:(UIImage *)icon text:(NSString *)text
{
  NSString *v5;
  UIImage *v6;
  id v7;

  v5 = text;
  v6 = icon;
  v7 = -[UISearchToken _initToken]([_UISearchToken alloc], "_initToken");
  objc_msgSend(v7, "setImage:", v6);

  objc_msgSend(v7, "setText:", v5);
  return (UISearchToken *)v7;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)representedObject
{
  objc_storeStrong(&self->_representedObject, representedObject);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_representedObject, 0);
}

@end
