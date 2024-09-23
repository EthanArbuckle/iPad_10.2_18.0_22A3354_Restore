@implementation UIAlertAction

+ (id)recorderMenuActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  RCActionItemViewController *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_new(RCActionItemViewController);
  -[RCActionItemViewController setActionTitle:](v10, "setActionTitle:", v9);

  -[RCActionItemViewController setActionImage:](v10, "setActionImage:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction _actionWithContentViewController:style:handler:](UIAlertAction, "_actionWithContentViewController:style:handler:", v10, 0, v7));

  return v11;
}

@end
