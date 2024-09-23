@implementation NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController

+ (id)title
{
  return CFSTR("Unmanaged Content");
}

- (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController)init
{
  NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController *v2;
  NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController;
  v2 = -[NCSupplementaryViewPrototypeRecipeViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](v2, "updateConfiguration:", &__block_literal_global_358);
  return v3;
}

uint64_t __79__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContainsUnmanagedContent:", 1);
}

- (void)loadView
{
  NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *v3;

  v3 = objc_alloc_init(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView);
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView setContainsUnmanagedContent:](v3, "setContainsUnmanagedContent:", 1);
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView setDelegate:](v3, "setDelegate:", self);
  -[NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController setView:](self, "setView:", v3);

}

- (void)unmanagedContentViewControllerView:(id)a3 setContainsUnmanagedContent:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __138__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController_unmanagedContentViewControllerView_setContainsUnmanagedContent___block_invoke;
  v4[3] = &__block_descriptor_33_e65_v16__0__NCNotificationListMutableSupplementaryViewConfiguration_8l;
  v5 = a4;
  -[NCSupplementaryViewPrototypeRecipeViewController updateConfiguration:](self, "updateConfiguration:", v4);
}

uint64_t __138__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController_unmanagedContentViewControllerView_setContainsUnmanagedContent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContainsUnmanagedContent:", *(unsigned __int8 *)(a1 + 32));
}

@end
