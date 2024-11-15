@implementation MFMessageInfoHeaderItem

- (MFMessageInfoHeaderItem)initWithName:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  MFMessageInfoHeaderItem *v9;
  MFMessageInfoHeaderItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMessageInfoHeaderItem;
  v9 = -[MFMessageInfoHeaderItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionName, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end
