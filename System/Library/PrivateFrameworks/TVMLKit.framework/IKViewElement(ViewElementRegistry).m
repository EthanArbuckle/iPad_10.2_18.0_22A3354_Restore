@implementation IKViewElement(ViewElementRegistry)

- (id)tv_proxyView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_getAssociatedObject(a1, sel_tv_proxyView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_getAssociatedObject(a1, sel_tv_proxyView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      goto LABEL_9;
    }
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "isViewLoaded"))
    goto LABEL_10;
  objc_msgSend(v4, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v6 = v5;
LABEL_11:

  return v6;
}

- (void)tv_setProxyView:()ViewElementRegistry
{
  void *v4;
  _TVProxyWeakContainer *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_getAssociatedObject(a1, sel_tv_proxyView);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_getAssociatedObject(a1, sel_tv_proxyView);
      v5 = (_TVProxyWeakContainer *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
LABEL_8:
        -[_TVProxyWeakContainer setObject:](v5, "setObject:", v6);

        goto LABEL_9;
      }
    }
    else
    {

    }
    v5 = objc_alloc_init(_TVProxyWeakContainer);
    objc_setAssociatedObject(a1, sel_tv_proxyView, v5, (void *)1);
    goto LABEL_8;
  }
LABEL_9:

}

+ (id)tv_approximateViewElementForView:()ViewElementRegistry
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "tv_associatedIKViewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (!v4)
  {
    v5 = v3;
    while (1)
    {
      v6 = v5;
      objc_msgSend(v5, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        break;
      objc_msgSend(v5, "tv_associatedIKViewElement");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v4 = (void *)v7;
        goto LABEL_7;
      }
    }
    v4 = 0;
  }
LABEL_7:

  return v4;
}

@end
