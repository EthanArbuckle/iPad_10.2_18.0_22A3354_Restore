@implementation UIFont(LayoutAdditions)

- (double)tf_estimatedFirstBaseline
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "lineHeight");
  v3 = v2;
  objc_msgSend(a1, "descender");
  return v3 + v4;
}

- (void)tf_computeFittedLineHeight
{
  void *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  uint64_t v10;
  _QWORD v11[2];
  CGRect v12;

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDF65F8];
  v11[0] = a1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_24D795FA8, "boundingRectWithSize:options:attributes:context:", 3, v1, 0, 1.79769313e308, 1.79769313e308);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v12.origin.x = v3;
  v12.origin.y = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  CGRectGetHeight(v12);
}

@end
