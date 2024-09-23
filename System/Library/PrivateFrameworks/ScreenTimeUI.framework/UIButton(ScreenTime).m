@implementation UIButton(ScreenTime)

- (void)st_setBackgroundColor:()ScreenTime
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "st_pointImageOfColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setBackgroundImage:forState:", v5, 0);
  objc_msgSend(MEMORY[0x24BDF6AC8], "st_pointImageOfColor:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundImage:forState:", v6, 1);

}

- (void)st_setTitleColor:()ScreenTime
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.25);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTitleColor:forState:", v4, 0);

  objc_msgSend(a1, "setTitleColor:forState:", v5, 1);
}

@end
