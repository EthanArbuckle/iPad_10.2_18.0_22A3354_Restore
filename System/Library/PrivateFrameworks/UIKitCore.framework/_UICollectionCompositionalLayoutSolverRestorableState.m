@implementation _UICollectionCompositionalLayoutSolverRestorableState

- (void)applyToSolver:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3)
    v5 = (void *)*((_QWORD *)a3 + 11);
  else
    v5 = 0;
  v7 = v5;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || objc_msgSend(v7, "isEqualToIndexSet:", self->_orthogonalSectionIndexes))
  {
    if (a3)
      v6 = (void *)*((_QWORD *)a3 + 23);
    else
      v6 = 0;
    -[_UICollectionCompositionalLayoutSolver _restoreStateFromBookmarkSnapshots:bookmarks:update:]((uint64_t)a3, self->_bookmarkSnapshotters, v6, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orthogonalSectionIndexes, 0);
  objc_storeStrong((id *)&self->_bookmarkSnapshotters, 0);
}

@end
