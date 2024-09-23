@implementation REMFetchMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFetchMetadata)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REMFetchMetadata;
  return -[REMFetchMetadata init](&v4, sel_init, a3);
}

@end
