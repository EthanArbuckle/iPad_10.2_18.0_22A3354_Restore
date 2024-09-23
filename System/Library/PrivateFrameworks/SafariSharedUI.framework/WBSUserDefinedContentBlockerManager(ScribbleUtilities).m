@implementation WBSUserDefinedContentBlockerManager(ScribbleUtilities)

- (void)deleteAllContentBlockersWithCompletionHandler:()ScribbleUtilities
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __104__WBSUserDefinedContentBlockerManager_ScribbleUtilities__deleteAllContentBlockersWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5441E68;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "resetDatabaseWithCompletionHandler:", v6);

}

- (void)getAllPaintingAvoidanceSelectorsThatApplyToHost:()ScribbleUtilities completionHandler:
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke;
  v8[3] = &unk_1E5444C38;
  v8[4] = a1;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "contentBlockerForHost:createIfNeeded:completionHandler:", a3, 0, v8);

}

- (uint64_t)clearAllEditsForContentBlocker:()ScribbleUtilities
{
  objc_msgSend(a1, "deleteActionsForContentBlocker:");
  return objc_msgSend(a1, "deleteUnassociatedCrossSiteContent");
}

@end
