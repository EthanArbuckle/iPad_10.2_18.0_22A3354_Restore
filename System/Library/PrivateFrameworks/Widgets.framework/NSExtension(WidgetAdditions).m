@implementation NSExtension(WidgetAdditions)

- (id)wg_description
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(a1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "optedIn");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("; {uuid = %@; optedIn = %@}"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)wg_hasExplicitUserElectionState
{
  void *v1;
  char v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userElection");

  return v2 != 0;
}

@end
