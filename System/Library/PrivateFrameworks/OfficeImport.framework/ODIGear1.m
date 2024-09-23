@implementation ODIGear1

+ (unint64_t)nodeCountWithState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "diagram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 3)
    return 3;
  else
    return v6;
}

+ (void)mapStyleForTransition:(id)a3 shape:(id)a4 state:(id)a5
{
  +[ODIDrawable map1dArrowStyleToShape:state:](ODIDrawable, "map1dArrowStyleToShape:state:", a4, a5);
}

@end
