@implementation PXComposeRecipientTableCellModel

- (PXComposeRecipientTableCellModel)init
{
  PXComposeRecipientTableCellModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientTableCellModel;
  result = -[PXComposeRecipientTableCellModel init](&v3, sel_init);
  if (result)
    result->_imageRequestID = -1;
  return result;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientTableCellModel;
  -[PXComposeRecipientTableCellModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  char v5;
  UIImage *v6;
  UIImage *image;
  UIImage *v8;

  v8 = (UIImage *)a3;
  v4 = self->_image;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIImage isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)-[UIImage copy](v8, "copy");
      image = self->_image;
      self->_image = v6;

      -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setImageRequestID:(int64_t)a3
{
  if (self->_imageRequestID != a3)
  {
    self->_imageRequestID = a3;
    -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *name;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_name;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      name = self->_name;
      self->_name = v6;

      -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setAddress:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *address;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_address;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      address = self->_address;
      self->_address = v6;

      -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setIsValidAddress:(BOOL)a3
{
  if (self->_isValidAddress != a3)
  {
    self->_isValidAddress = a3;
    -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setShowsCheckbox:(BOOL)a3
{
  if (self->_showsCheckbox != a3)
  {
    self->_showsCheckbox = a3;
    -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setContact:(id)a3
{
  CNContact *v4;
  char v5;
  CNContact *v6;
  CNContact *contact;
  CNContact *v8;

  v8 = (CNContact *)a3;
  v4 = self->_contact;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[CNContact isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (CNContact *)-[CNContact copy](v8, "copy");
      contact = self->_contact;
      self->_contact = v6;

      -[PXComposeRecipientTableCellModel signalChange:](self, "signalChange:", 128);
    }
  }

}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)imageRequestID
{
  return self->_imageRequestID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)isValidAddress
{
  return self->_isValidAddress;
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)showsCheckbox
{
  return self->_showsCheckbox;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (double)imageDiameter
{
  return 37.0;
}

+ (double)imageVerticalInset
{
  return 5.0;
}

+ (double)imageInset
{
  return 12.0;
}

@end
