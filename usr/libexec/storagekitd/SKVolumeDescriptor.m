@implementation SKVolumeDescriptor

- (id)toVolumeWithDisk:(id)a3
{
  id v4;
  SKVolume *v5;
  void *v6;
  void *v7;
  void *v8;
  SKVolume *v9;

  v4 = a3;
  v5 = [SKVolume alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolumeDescriptor filesystem](self, "filesystem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolumeDescriptor name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKVolumeDescriptor password](self, "password"));
  v9 = -[SKVolume initWithDisk:filesystem:name:password:](v5, "initWithDisk:filesystem:name:password:", v4, v6, v7, v8);

  return v9;
}

@end
