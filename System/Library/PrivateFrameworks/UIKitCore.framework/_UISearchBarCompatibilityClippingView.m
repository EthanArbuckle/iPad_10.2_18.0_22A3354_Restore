@implementation _UISearchBarCompatibilityClippingView

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t i;
  void *v12;
  objc_super v13;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  if (a4 == -2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[UIView subviews](self, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = objc_msgSend(v10, "indexOfObject:", v9); ; ++i)
    {
      if (i >= objc_msgSend(v10, "count"))
      {

        goto LABEL_8;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "_isKnownUISearchBarComponentContainer"))
        break;

    }
    v14.receiver = self;
    v14.super_class = (Class)_UISearchBarCompatibilityClippingView;
    -[UIView _addSubview:positioned:relativeTo:](&v14, sel__addSubview_positioned_relativeTo_, v8, -3, v12);

  }
  else
  {
LABEL_8:
    v13.receiver = self;
    v13.super_class = (Class)_UISearchBarCompatibilityClippingView;
    -[UIView _addSubview:positioned:relativeTo:](&v13, sel__addSubview_positioned_relativeTo_, v8, a4, v9);
  }

}

@end
