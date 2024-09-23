@implementation HomeSearchStatusOutlineCellModel

- (HomeSearchStatusOutlineCellModel)initWithErrorString:(id)a3 enableStructuredRAPAffordance:(BOOL)a4 delegate:(id)a5
{
  id v9;
  id v10;
  HomeSearchStatusOutlineCellModel *v11;
  HomeSearchStatusOutlineCellModel *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HomeSearchStatusOutlineCellModel;
  v11 = -[HomeSearchStatusOutlineCellModel init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_errorString, a3);
    v12->_enableStructuredRAPAffordance = a4;
    objc_storeStrong((id *)&v12->_delegate, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_errorString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HomeSearchStatusOutlineCellModel *v4;
  HomeSearchStatusOutlineCellModel *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  unsigned __int8 v9;

  v4 = (HomeSearchStatusOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCellModel errorString](v5, "errorString"));
    v8 = v7;
    if (v7 == self->_errorString)
      v9 = 1;
    else
      v9 = -[NSString isEqual:](v7, "isEqual:");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_maps_diffableDataSourceIdentifier
{
  return CFSTR("SearchStatusIdentifier");
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[HomeSearchStatusOutlineCellRegistration sharedRegistration](HomeSearchStatusOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[HomeSearchStatusOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (NSString)errorString
{
  return self->_errorString;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (HomeSearchStatusOutlineCellModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
}

@end
