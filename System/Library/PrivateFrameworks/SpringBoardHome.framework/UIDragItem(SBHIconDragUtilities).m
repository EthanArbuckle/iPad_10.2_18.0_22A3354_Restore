@implementation UIDragItem(SBHIconDragUtilities)

- (id)sbh_appDragLocalContext
{
  void *v2;
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a1, "localObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = v2;
    if (v5)
      goto LABEL_11;
    goto LABEL_8;
  }
  objc_getAssociatedObject(a1, "com.apple.springboard.appDragLocalContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
    v5 = v6;
  else
    v5 = 0;

  if (!v5)
  {
LABEL_8:
    +[SBIconView dragContextForDragItem:](SBIconView, "dragContextForDragItem:", a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 && !v2)
      objc_msgSend(a1, "sbh_setAppDragLocalContext:", v5);
  }
LABEL_11:

  return v5;
}

- (void)sbh_setAppDragLocalContext:()SBHIconDragUtilities
{
  id value;

  value = a3;
  objc_msgSend(a1, "setLocalObject:", value);
  objc_setAssociatedObject(a1, "com.apple.springboard.appDragLocalContext", value, (void *)1);

}

@end
