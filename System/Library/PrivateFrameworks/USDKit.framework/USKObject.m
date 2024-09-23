@implementation USKObject

- (NSDictionary)metadata
{
  return (NSDictionary *)(id)objc_opt_new();
}

- (USKToken)name
{
  return self->_name;
}

- (USKObjectPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
