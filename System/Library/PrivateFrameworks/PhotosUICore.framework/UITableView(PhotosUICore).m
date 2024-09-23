@implementation UITableView(PhotosUICore)

- (void)px_performUpdatesForChangeDetails:()PhotosUICore dataSourceUpdate:
{
  void (**v6)(_QWORD);
  id v7;
  _QWORD v8[4];
  id v9;
  void *v10;
  void (**v11)(_QWORD);

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "hasIncrementalChanges"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__UITableView_PhotosUICore__px_performUpdatesForChangeDetails_dataSourceUpdate___block_invoke;
    v8[3] = &unk_1E5145688;
    v11 = v6;
    v9 = v7;
    v10 = a1;
    objc_msgSend(a1, "performBatchUpdates:completion:", v8, 0);

  }
  else
  {
    v6[2](v6);
    objc_msgSend(a1, "reloadData");
  }

}

@end
