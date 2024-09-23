@implementation DOMNode(UIKit_DOMExtras)

- (id)tagName
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "tagName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)urlScheme
{
  void *v2;
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "absoluteLinkURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
