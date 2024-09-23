@implementation WLUIClient

- (WLUIClient)initWithHostname:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WLUIClient *v14;
  WLUIClient *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WLUIClient;
  v14 = -[WLUIClient init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[WLUIClient setHostname:](v14, "setHostname:", v10);
    -[WLUIClient setBrand:](v15, "setBrand:", v11);
    -[WLUIClient setModel:](v15, "setModel:", v12);
    -[WLUIClient setName:](v15, "setName:", v13);
  }

  return v15;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end
