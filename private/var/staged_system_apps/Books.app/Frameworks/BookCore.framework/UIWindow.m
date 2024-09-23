@implementation UIWindow

- (id)im_ancestorConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow windowScene](self, "windowScene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  if (!objc_msgSend(v6, "conformsToProtocol:", v4) || (v7 = v6) == 0)
  {
    v8 = objc_opt_class(_BCWindowScene);
    v9 = BUDynamicCast(v8, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controller"));
    if ((objc_msgSend(v7, "conformsToProtocol:", v4) & 1) != 0)
    {

      if (v7)
        goto LABEL_11;
    }
    else
    {

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));

    if (objc_msgSend(v12, "conformsToProtocol:", v4))
      v7 = v12;
    else
      v7 = 0;

  }
LABEL_11:

  return v7;
}

@end
