@implementation SearchUIContactPickerViewController

- (SearchUIContactPickerViewController)initWithContact:(id)a3
{
  id v4;
  SearchUIContactPickerViewController *v5;
  SearchUIContactPickerViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIContactPickerViewController;
  v5 = -[SearchUIContactPickerViewController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CNContactPickerViewController setAllowsCancel:](v5, "setAllowsCancel:", 1);
    -[CNContactPickerViewController setAutocloses:](v6, "setAutocloses:", 0);
    -[CNContactPickerViewController setMode:](v6, "setMode:", 2);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPredicateForSelectionOfContact:](v6, "setPredicateForSelectionOfContact:", v7);

    -[CNContactPickerViewController setDelegate:](v6, "setDelegate:", v6);
    -[SearchUIContactPickerViewController setContact:](v6, "setContact:", v4);
  }

  return v6;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPickerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0C974D8];
  v7 = a4;
  v8 = a3;
  -[SearchUIContactPickerViewController contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllerForUpdatingContact:withPropertiesFromContact:", v7, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v8, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pushViewController:animated:", v11, 1);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
