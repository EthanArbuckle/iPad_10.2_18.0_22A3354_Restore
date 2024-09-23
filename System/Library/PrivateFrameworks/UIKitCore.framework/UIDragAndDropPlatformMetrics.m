@implementation UIDragAndDropPlatformMetrics

id __37___UIDragAndDropPlatformMetrics_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  if (v5 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    -[UIView _outlinePath](v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
