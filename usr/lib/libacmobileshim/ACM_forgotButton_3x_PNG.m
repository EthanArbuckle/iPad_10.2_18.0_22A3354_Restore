@implementation ACM_forgotButton_3x_PNG

- (id)image
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &ACM_forgotButton_3x_bytes, 1778);
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v2);
}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &ACM_forgotButton_3x_bytes, 1778);
}

@end
