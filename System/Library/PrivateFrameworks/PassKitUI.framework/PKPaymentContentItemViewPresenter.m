@implementation PKPaymentContentItemViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v7 = a5;
  v17 = a3;
  objc_msgSend(a4, "contentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v17, "setShowsDisclosure:", 0);
    objc_msgSend(v17, "setSelectionStyle:", 0);
    objc_msgSend(v17, "setShowsSeparator:", v7);
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pk_uppercaseAttributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLabel:", v12);

    objc_msgSend(v9, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v17, "addValue:", v13);

    objc_msgSend(v17, "setCentered:", objc_msgSend(v9, "isCentered"));
    v15 = objc_retainAutorelease(v9);
    if (objc_msgSend(v15, "image"))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", objc_msgSend(objc_retainAutorelease(v15), "image"));
      objc_msgSend(v17, "setLabelImage:", v16);

    }
  }

}

@end
