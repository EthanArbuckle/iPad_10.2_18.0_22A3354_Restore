@implementation PKPassShareSelectDateViewController

- (PKPassShareSelectDateViewController)initWithDate:(id)a3 minimumDate:(id)a4 maximumDate:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKPassShareSelectDateViewController *v14;
  PKPassShareSelectDateViewController *v15;
  PKPassShareSelectDateSectionController *v16;
  PKPassShareSelectDateSectionController *sectionController;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPassShareSelectDateViewController;
  v14 = -[PKPaymentSetupOptionsViewController init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    -[PKPassShareSelectDateViewController setTitle:](v14, "setTitle:", v13);
    v16 = -[PKPassShareSelectDateSectionController initWithDate:minimumDate:maximumDate:delegate:]([PKPassShareSelectDateSectionController alloc], "initWithDate:minimumDate:maximumDate:delegate:", v10, v11, v12, v15);
    sectionController = v15->_sectionController;
    v15->_sectionController = v16;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v15, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPaymentSetupOptionsViewController setHeaderMode:](v15, "setHeaderMode:", 1);
    v21[0] = v15->_sectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v15, "setSections:animated:", v18, 0);

  }
  return v15;
}

- (void)didUpdateDate:(id)a3
{
  void (**dateChangeHandler)(id, id);

  dateChangeHandler = (void (**)(id, id))self->_dateChangeHandler;
  if (dateChangeHandler)
    dateChangeHandler[2](dateChangeHandler, a3);
}

- (void)reloadDataAnimated:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassShareSelectDateViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v5, sel_reloadDataAnimated_, a3);
  -[PKDynamicCollectionViewController layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (id)dateChangeHandler
{
  return self->_dateChangeHandler;
}

- (void)setDateChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateChangeHandler, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
