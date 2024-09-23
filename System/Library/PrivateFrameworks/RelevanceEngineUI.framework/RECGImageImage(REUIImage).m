@implementation RECGImageImage(REUIImage)

- (uint64_t)image
{
  void *v1;
  id v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  v2 = objc_retainAutorelease(a1);
  v3 = objc_msgSend(v2, "CGImage");
  objc_msgSend(v2, "scale");
  return objc_msgSend(v1, "imageWithCGImage:scale:orientation:", v3, 0);
}

@end
