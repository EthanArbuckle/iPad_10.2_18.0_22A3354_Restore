@implementation ACM_textField_PNG

- (id)image
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &ACM_textField_bytes, 298);
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v2);
}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &ACM_textField_bytes, 298);
}

@end
