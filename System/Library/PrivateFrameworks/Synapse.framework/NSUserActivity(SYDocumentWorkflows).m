@implementation NSUserActivity(SYDocumentWorkflows)

- (id)_syRelatedUniqueIdentifier
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.relatedUniqueIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  objc_sync_exit(v1);
  return v3;
}

- (void)set_syRelatedUniqueIdentifier:()SYDocumentWorkflows
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPayload:object:identifier:", v5, 0, CFSTR("com.apple.synapse.relatedUniqueIdentifier"));

  objc_sync_exit(v4);
}

- (id)_syDocumentProvider
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.document"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v1);
  if (v2)
    v3 = v1;
  else
    v3 = 0;
  return v3;
}

- (uint64_t)_syShouldCreateNewMessage
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.shouldCreateNewMessage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "getBytes:length:", &v5, 1);

  objc_sync_exit(v1);
  return v5;
}

- (id)_syOriginalUserActivity
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.originalUserActivity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v2);
  else
    v3 = 0;

  objc_sync_exit(v1);
  return v3;
}

@end
