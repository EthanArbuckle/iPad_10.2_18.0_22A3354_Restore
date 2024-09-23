@implementation LNEnumCaseMetadata(Workflow)

- (id)wf_symbolName
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "displayRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "systemName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wf_localizedSubtitle
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "displayRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wf_localizedDisplayName
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "displayRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
