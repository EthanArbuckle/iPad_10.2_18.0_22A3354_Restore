@implementation ICVirtualSmartFolderItemIdentifier

- (void)setOverrideNoteContainerViewMode:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_setAssociatedObject(self, &unk_100451874, v4, (void *)1);

}

- (int64_t)overrideNoteContainerViewMode
{
  id AssociatedObject;
  void *v3;
  void *v4;
  int64_t v5;

  AssociatedObject = objc_getAssociatedObject(self, &unk_100451874);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
    v5 = (int64_t)objc_msgSend(v3, "integerValue");
  else
    v5 = -1;

  return v5;
}

- (int64_t)enforcedNoteContainerViewMode
{
  void *v4;
  unsigned int v5;

  if (-[ICVirtualSmartFolderItemIdentifier overrideNoteContainerViewMode](self, "overrideNoteContainerViewMode") != -1)
    return -[ICVirtualSmartFolderItemIdentifier overrideNoteContainerViewMode](self, "overrideNoteContainerViewMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICVirtualSmartFolderItemIdentifier type](self, "type"));
  v5 = objc_msgSend(v4, "isEqual:", ICVirtualSmartFolderItemIdentifierTypeSystemPaper);

  if (v5)
    return 1;
  else
    return -1;
}

@end
