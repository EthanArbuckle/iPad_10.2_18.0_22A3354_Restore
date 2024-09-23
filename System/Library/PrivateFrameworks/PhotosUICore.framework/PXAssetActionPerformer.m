@implementation PXAssetActionPerformer

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 30 && -[PXActionPerformer success](self, "success");
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (void)setSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSnapshot, a3);
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_selectionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
}

@end
