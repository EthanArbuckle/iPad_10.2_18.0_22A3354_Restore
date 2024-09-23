@implementation TIKeyboardOutput(UIKBExtras)

- (void)_copyTo:()UIKBExtras
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a1, "acceptedCandidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAcceptedCandidate:", v4);

  objc_msgSend(a1, "textToCommit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextToCommit:", v5);

  objc_msgSend(v11, "setUnmarkIfNecessary:", objc_msgSend(a1, "unmarkIfNecessary"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setPositionOffset:", objc_msgSend(a1, "positionOffset"));
  objc_msgSend(v11, "setDeletionCount:", objc_msgSend(a1, "deletionCount"));
  objc_msgSend(a1, "insertionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInsertionText:", v6);

  objc_msgSend(v11, "setForwardDeletionCount:", objc_msgSend(a1, "forwardDeletionCount"));
  objc_msgSend(a1, "insertionTextAfterSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInsertionTextAfterSelection:", v7);

  objc_msgSend(a1, "shortcutConversion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShortcutConversion:", v8);

  objc_msgSend(a1, "handwritingStrokesToDelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHandwritingStrokesToDelete:", v9);

  objc_msgSend(v11, "setShouldSendCurrentLocation:", objc_msgSend(a1, "shouldSendCurrentLocation"));
  objc_msgSend(a1, "customInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCustomInfo:", v10);

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setProducedByDeleteInput:", objc_msgSend(a1, "producedByDeleteInput"));

}

- (BOOL)_isEmpty
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  char v14;

  objc_msgSend(a1, "acceptedCandidate");
  v2 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "textToCommit");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v2 | v3;

  v5 = objc_msgSend(a1, "unmarkIfNecessary");
  if (v4)
    v6 = 1;
  else
    v6 = v5;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a1, "positionOffset"))
    v6 = 1;
  if (objc_msgSend(a1, "deletionCount"))
    v6 = 1;
  objc_msgSend(a1, "insertionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v6 = 1;

  if (objc_msgSend(a1, "forwardDeletionCount"))
    v6 = 1;
  objc_msgSend(a1, "insertionTextAfterSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v6 = 1;

  objc_msgSend(a1, "shortcutConversion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v6 = 1;

  objc_msgSend(a1, "handwritingStrokesToDelete");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 1;
  else
    v11 = v6;

  v12 = objc_msgSend(a1, "shouldSendCurrentLocation");
  objc_msgSend(a1, "customInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11 | v12 | (v13 != 0);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 |= objc_msgSend(a1, "producedByDeleteInput");
  return (v14 & 1) == 0;
}

@end
