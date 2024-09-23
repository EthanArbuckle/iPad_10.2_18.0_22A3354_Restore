@implementation TVShouldConstrainToPortait

uint64_t __TVShouldConstrainToPortait_block_invoke()
{
  void *v0;
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Width;
  uint64_t result;
  char v15;
  BOOL v17;
  CGRect v18;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v2 = MGGetSInt32Answer();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixedCoordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  Width = CGRectGetWidth(v18);
  result = MGGetBoolAnswer();
  if (v1)
  {
    v15 = 0;
  }
  else
  {
    v17 = Width < 375.0 || v2 == 5;
    v15 = v17 & ~(_BYTE)result;
  }
  TVShouldConstrainToPortait_tvConstrainToPortrait = v15;
  return result;
}

@end
