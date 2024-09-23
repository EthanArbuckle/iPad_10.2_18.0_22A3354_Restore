@implementation PPSFlatStorage

- (PPSFlatStorage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPSFlatStorage;
  return -[PPSStorage init](&v3, sel_init);
}

- (void)setupStorageForEntryKey:(id)a3
{
  NSLog(CFSTR("PPSFlatStorage Implementation"), a2, a3);
}

@end
