@implementation PKStationPreview

- (PKStationPreview)initWithTitle:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  PKStationPreview *v8;
  PKStationPreview *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKStationPreview;
  v8 = -[PKStationPreview init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PKStationPreview setTitle:](v8, "setTitle:", v6);
    -[PKStationPreview setUuid:](v9, "setUuid:", v7);
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
