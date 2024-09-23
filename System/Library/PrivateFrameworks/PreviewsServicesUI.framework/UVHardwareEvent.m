@implementation UVHardwareEvent

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "data");
}

- (UVHardwareEvent)initWithData:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UVHardwareEvent;
  return -[UVHardwareEvent init](&v5, sel_init, a3, a4);
}

@end
