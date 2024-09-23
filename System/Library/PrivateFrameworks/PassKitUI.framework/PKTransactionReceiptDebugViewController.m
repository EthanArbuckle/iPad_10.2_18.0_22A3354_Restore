@implementation PKTransactionReceiptDebugViewController

- (PKTransactionReceiptDebugViewController)initWithPaymentTransaction:(id)a3
{
  id v5;
  PKTransactionReceiptDebugViewController *v6;
  PKTransactionReceiptDebugViewController *v7;
  uint64_t v8;
  PKPaymentService *paymentService;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionReceiptDebugViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v11, sel_initWithStyle_numberOfSections_, 1, 6);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v7);
    paymentService = v7->_paymentService;
    v7->_paymentService = (PKPaymentService *)v8;

  }
  return v7;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = 1;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      return v4;
    case 1uLL:
      -[PKTransactionReceipt headerFields](self->_receipt, "headerFields");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      -[PKTransactionReceipt lineItems](self->_receipt, "lineItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3uLL:
      -[PKTransactionReceipt summaryItems](self->_receipt, "summaryItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = v5;
      v4 = objc_msgSend(v5, "count") != 0;

      break;
    case 5uLL:
      -[PKTransactionReceipt htmlReceiptData](self->_receipt, "htmlReceiptData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v4 = 1;
      }
      else
      {
        -[PKTransactionReceipt pdfReceiptData](self->_receipt, "pdfReceiptData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v8 != 0;

      }
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  int64_t result;
  void *v7;
  void *v8;
  int64_t v9;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  result = 6;
  switch(v5)
  {
    case 0uLL:
      return result;
    case 1uLL:
      -[PKTransactionReceipt headerFields](self->_receipt, "headerFields");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      -[PKTransactionReceipt lineItems](self->_receipt, "lineItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3uLL:
      -[PKTransactionReceipt summaryItems](self->_receipt, "summaryItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = v7;
      v9 = objc_msgSend(v7, "count");

      result = v9;
      break;
    case 4uLL:
      result = 2;
      break;
    case 5uLL:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 0uLL:
      -[PKTransactionReceiptDebugViewController _infoCellForTableView:atIndexPath:](self, "_infoCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1uLL:
      -[PKTransactionReceiptDebugViewController _headerFieldCellForTableView:atIndexPath:](self, "_headerFieldCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      -[PKTransactionReceiptDebugViewController _lineItemCellForTableView:atIndexPath:](self, "_lineItemCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      -[PKTransactionReceiptDebugViewController _summaryItemCellForTableView:atIndexPath:](self, "_summaryItemCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      -[PKTransactionReceiptDebugViewController _amountCellForTableView:atIndexPath:](self, "_amountCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5uLL:
      -[PKTransactionReceiptDebugViewController _previewCellForTableView:atIndexPath:](self, "_previewCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) == 5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v6, "section")) == 5)
    -[PKTransactionReceiptDebugViewController _presentReceiptPreview](self, "_presentReceiptPreview");
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v4;

  v4 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v4 - 1 > 2)
    return 0;
  else
    return off_1E3E70328[v4 - 1];
}

- (void)viewDidLoad
{
  void *v3;
  PKPaymentService *paymentService;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTransactionReceiptDebugViewController;
  -[PKSectionTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PKTransactionReceiptDebugViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CellReuseIdentifier"));
  paymentService = self->_paymentService;
  -[PKPaymentTransaction identifier](self->_transaction, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E3E702E8;
  v6[4] = self;
  -[PKPaymentService transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:](paymentService, "transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:", v5, 1, v6);

}

void __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1096), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (id)provideDataForItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PKTransactionReceipt pdfReceiptData](self->_receipt, "pdfReceiptData", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKTransactionReceipt htmlReceiptData](self->_receipt, "htmlReceiptData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  -[PKTransactionReceipt pdfReceiptData](self->_receipt, "pdfReceiptData", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[PKTransactionReceipt htmlReceiptData](self->_receipt, "htmlReceiptData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  return self->_receiptPreviewItem;
}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKTransactionReceiptDebugViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKTransactionReceiptDebugViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PKTransactionReceiptDebugViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1088), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1096), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "reloadData");
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)_presentReceiptPreview
{
  void *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  QLItem *v7;
  QLItem *receiptPreviewItem;
  QLPreviewController *v9;
  QLPreviewController *previewController;
  id v11;

  -[PKTransactionReceipt pdfReceiptData](self->_receipt, "pdfReceiptData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (id *)MEMORY[0x1E0CEC570];
  }
  else
  {
    -[PKTransactionReceipt htmlReceiptData](self->_receipt, "htmlReceiptData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    v4 = (id *)MEMORY[0x1E0CEC518];
  }
  objc_msgSend(*v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = (id)v6;
    v7 = (QLItem *)objc_msgSend(objc_alloc((Class)_MergedGlobals_1_1[0]()), "initWithDataProvider:contentType:previewTitle:", self, v6, CFSTR("Receipt"));
    receiptPreviewItem = self->_receiptPreviewItem;
    self->_receiptPreviewItem = v7;

    v9 = (QLPreviewController *)objc_alloc_init((Class)off_1EE492C68[0]());
    previewController = self->_previewController;
    self->_previewController = v9;

    -[QLPreviewController setDelegate:](self->_previewController, "setDelegate:", self);
    -[QLPreviewController setDataSource:](self->_previewController, "setDataSource:", self);
    -[PKTransactionReceiptDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_previewController, 1, 0);

  }
}

- (id)_infoCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  switch(v8)
  {
    case 0:
      -[PKTransactionReceipt uniqueID](self->_receipt, "uniqueID");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Unique ID");
      break;
    case 1:
      -[PKTransactionReceipt receiptProviderIdentifier](self->_receipt, "receiptProviderIdentifier");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Provider ID");
      break;
    case 2:
      -[PKTransactionReceipt receiptIdentifier](self->_receipt, "receiptIdentifier");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Receipt ID");
      break;
    case 3:
      -[PKTransactionReceipt lastUpdatedDate](self->_receipt, "lastUpdatedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKW3CDateStringFromDate();
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v10 = CFSTR("Last Updated");
      break;
    case 4:
      -[PKTransactionReceipt supportURL](self->_receipt, "supportURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v10 = CFSTR("Support URL");
      break;
    case 5:
      v13 = -[PKTransactionReceipt state](self->_receipt, "state");
      if (v13 > 2)
        v9 = 0;
      else
        v9 = off_1E3E70340[v13];
      v10 = CFSTR("State");
      break;
    default:
      v10 = 0;
      v9 = 0;
      break;
  }
  objc_msgSend(v7, "keyLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v10);

  objc_msgSend(v7, "valueLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v9);

  return v7;
}

- (id)_headerFieldCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionReceipt headerFields](self->_receipt, "headerFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "keyLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v7, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  return v7;
}

- (id)_lineItemCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionReceipt lineItems](self->_receipt, "lineItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "keyLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v7, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currencyAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "formattedStringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v15);

  objc_msgSend(v7, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v10, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithPKImage:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v19);

  return v7;
}

- (id)_summaryItemCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionReceipt summaryItems](self->_receipt, "summaryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "label");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = objc_msgSend(v10, "type");
    if (v12 > 4)
      v11 = 0;
    else
      v11 = off_1E3E70358[v12];
  }
  objc_msgSend(v7, "keyLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v11);

  objc_msgSend(v7, "valueLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currencyAmount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "formattedStringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  return v7;
}

- (id)_amountCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  if (v8 == 1)
  {
    -[PKTransactionReceipt totalCurrencyAmount](self->_receipt, "totalCurrencyAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("Total");
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_7;
    }
    -[PKTransactionReceipt subtotalCurrencyAmount](self->_receipt, "subtotalCurrencyAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("Subtotal");
  }
  objc_msgSend(v9, "formattedStringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  objc_msgSend(v7, "keyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v10);

  objc_msgSend(v7, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v11);

  return v7;
}

- (id)_previewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", CFSTR("View Receipt"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_receiptPreviewItem, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
