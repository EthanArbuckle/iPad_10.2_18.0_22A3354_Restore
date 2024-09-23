@implementation UIView(UIKit_SiriUIFrameworkAdditions)

- (void)siriui_setBlendEffectEnabled:()UIKit_SiriUIFrameworkAdditions
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a1, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

    if (objc_msgSend(v8, "count"))
    {
      v9 = a3 ^ 1u;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectAtIndex:", 0);
        objc_msgSend(v10, "sublayers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v10, "sublayers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v13);
        }
        else
        {
          objc_msgSend(v10, "setCompositingFilter:", v14);
          objc_msgSend(v10, "setAllowsGroupBlending:", v9);
          objc_msgSend(v10, "superlayer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAllowsGroupBlending:", v9);
        }

      }
      while (objc_msgSend(v8, "count"));
    }

  }
}

@end
