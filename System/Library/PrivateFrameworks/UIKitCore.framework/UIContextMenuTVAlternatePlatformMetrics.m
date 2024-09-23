@implementation UIContextMenuTVAlternatePlatformMetrics

id __48___UIContextMenuTVAlternatePlatformMetrics_init__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  if ((a2 & 0xD) != 0)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "colorWithAlphaComponent:", 0.05);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
