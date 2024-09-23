@implementation REFileImage(REUIImage)

- (id)image
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
