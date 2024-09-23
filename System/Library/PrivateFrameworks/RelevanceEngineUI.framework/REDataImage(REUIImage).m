@implementation REDataImage(REUIImage)

- (id)image
{
  double v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "scale");
  v3 = v2;
  if (v2 < 1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v3 = v5;

  }
  v6 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(a1, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithData:scale:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
