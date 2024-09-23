@implementation SKPartitionDescriptor

- (id)newPartition
{
  SKPartition *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(SKPartition);
  -[SKPartition setSize:](v3, "setSize:", -[SKPartitionDescriptor size](self, "size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filesystem"));
  -[SKPartition setFs:](v3, "setFs:", v5);

  return v3;
}

@end
