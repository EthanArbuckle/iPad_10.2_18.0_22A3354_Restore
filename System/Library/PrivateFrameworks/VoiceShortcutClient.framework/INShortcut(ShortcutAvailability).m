@implementation INShortcut(ShortcutAvailability)

- (uint64_t)wf_shortcutAvailability
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "intent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v3;
    v6 = objc_msgSend(v3, "shortcutAvailability");

    return v6;
  }
  objc_msgSend(a1, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "userActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 0;
}

@end
