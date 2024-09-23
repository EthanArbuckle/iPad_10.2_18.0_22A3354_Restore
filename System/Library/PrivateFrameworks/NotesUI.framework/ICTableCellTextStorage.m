@implementation ICTableCellTextStorage

- (ICTableCellTextStorage)initWithDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICTableCellTextStorage *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "mergeableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)ICTableCellTextStorage;
  v7 = -[ICTableTextStorage initWithDocument:](&v10, sel_initWithDocument_, v4);
  if (v7)
  {
    objc_msgSend(v4, "mergeableString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v6);

  }
  return v7;
}

@end
