@implementation WFCloudKitLegacyWorkflowOrdering

+ (id)recordType
{
  return CFSTR("ShortcutOrdering");
}

+ (id)recordBasename
{
  return CFSTR("WFOrdering");
}

- (WFCloudKitLegacyWorkflowOrdering)initWithZoneID:(id)a3 orderedWorkflowIDs:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFCloudKitLegacyWorkflowOrdering *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitLegacyWorkflowOrdering.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zoneID"));

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("WFOrdering"), v7);
  v10 = -[WFCloudKitBaseOrdering initWithIdentifier:orderedWorkflowIDs:orderedFolderIDs:](self, "initWithIdentifier:orderedWorkflowIDs:orderedFolderIDs:", v9, v8, 0);

  return v10;
}

@end
