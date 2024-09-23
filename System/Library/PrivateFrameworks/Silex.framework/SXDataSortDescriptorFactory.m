@implementation SXDataSortDescriptorFactory

- (id)sortDescriptorForDataDescriptor:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  __objc2_class *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "dataType");
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if ((unint64_t)(v6 - 1) > 1)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v7 = SXDataStringSortDescriptor;
  }
  else
  {
    v7 = SXDataNumberSortDescriptor;
  }
  v8 = [v7 alloc];
  objc_msgSend(v5, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:ascending:", v9, v4);

LABEL_6:
  return v10;
}

@end
