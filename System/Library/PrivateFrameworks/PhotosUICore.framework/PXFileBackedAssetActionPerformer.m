@implementation PXFileBackedAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "_selectionSnapshotForPerformerClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(a1, "canPerformWithSelectionSnapshot:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3
{
  return 0;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 0;
}

@end
