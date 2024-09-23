@implementation DOMElement(BrowserExtras)

- (BOOL)inDocument
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "ownerDocument");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    v3 = v1;
    objc_msgSend(v1, "parentNode");
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  while (v1 && v1 != v2);

  return v1 != 0;
}

- (uint64_t)isHidden
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "offsetWidth") || !objc_msgSend(a1, "offsetHeight"))
    return 1;
  objc_msgSend(a1, "ownerDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getComputedStyle:pseudoElement:", a1, &stru_1E16EDF20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "getPropertyValue:", CFSTR("visibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v4, "isEqualToString:", CFSTR("visible"));

  v5 = v2 ^ 1;
  return v5;
}

@end
