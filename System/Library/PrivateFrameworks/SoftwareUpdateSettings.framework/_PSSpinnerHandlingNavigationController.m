@implementation _PSSpinnerHandlingNavigationController

- (_PSSpinnerHandlingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  _PSSpinnerHandlingNavigationController *v4;
  _PSSpinnerHandlingNavigationController *v6;
  objc_super v8;
  id v9;
  id location[2];
  _PSSpinnerHandlingNavigationController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)_PSSpinnerHandlingNavigationController;
  v11 = -[_PSSpinnerHandlingNavigationController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, location[0], v9);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
    -[_PSSpinnerHandlingNavigationController setDelegate:](v11, "setDelegate:", v11);
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (void)_removeSpinnerViewControllerIfNeeded
{
  id v2;
  id v3;
  char isKindOfClass;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  SEL v11;
  _PSSpinnerHandlingNavigationController *v12;

  v12 = self;
  v11 = a2;
  v10 = 0;
  v3 = (id)-[_PSSpinnerHandlingNavigationController viewControllers](self, "viewControllers");
  v8 = 0;
  v6 = 0;
  isKindOfClass = 0;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v9 = (id)-[_PSSpinnerHandlingNavigationController viewControllers](v12, "viewControllers");
    v8 = 1;
    v7 = (id)objc_msgSend(v9, "firstObject");
    v6 = 1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  v10 = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
  {
    v2 = (id)-[_PSSpinnerHandlingNavigationController viewControllers](v12, "viewControllers");
    v5 = (id)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v5, "removeObjectAtIndex:", 0);
    -[_PSSpinnerHandlingNavigationController setViewControllers:animated:](v12, "setViewControllers:animated:", v5, 0);
    objc_storeStrong(&v5, 0);
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  char isKindOfClass;
  objc_super v7;
  BOOL v8;
  id location[2];
  _PSSpinnerHandlingNavigationController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v5 = (id)-[_PSSpinnerHandlingNavigationController topViewController](v10, "topViewController");
  objc_opt_class();
  isKindOfClass = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    getRUIPageClass();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  if ((isKindOfClass & 1) != 0)
  {
    v8 = 0;
    -[_PSSpinnerHandlingNavigationController setToolbarHidden:](v10, "setToolbarHidden:", 1);
  }
  v7.receiver = v10;
  v7.super_class = (Class)_PSSpinnerHandlingNavigationController;
  -[_PSSpinnerHandlingNavigationController pushViewController:animated:](&v7, sel_pushViewController_animated_, location[0], v8);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id location[2];
  _PSSpinnerHandlingNavigationController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  -[_PSSpinnerHandlingNavigationController _removeSpinnerViewControllerIfNeeded](v8, "_removeSpinnerViewControllerIfNeeded");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

@end
