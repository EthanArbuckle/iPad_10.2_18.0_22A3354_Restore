@implementation NSAttributedString

- (id)tui_attributedTitleForButtonType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSUInteger v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  NSAttributedStringKey v20;
  void *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec defaultFontSpec](TUIFontSpec, "defaultFontSpec", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  v7 = objc_alloc((Class)NSMutableAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSAttributedString string](self, "string"));
  v20 = NSFontAttributeName;
  v21 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v10 = objc_msgSend(v7, "initWithString:attributes:", v8, v9);

  v11 = -[NSAttributedString length](self, "length");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_83F24;
  v17[3] = &unk_240208;
  v18 = v5;
  v12 = v10;
  v19 = v12;
  v13 = v5;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

- (double)tui_widthAsTitle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSUInteger v8;
  id v9;
  double v10;
  double v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  NSAttributedStringKey v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  v4 = objc_alloc((Class)NSMutableAttributedString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSAttributedString string](self, "string"));
  v18 = NSFontAttributeName;
  v19 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v7 = objc_msgSend(v4, "initWithString:attributes:", v5, v6);

  v8 = -[NSAttributedString length](self, "length");
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_134C84;
  v16 = &unk_2422E8;
  v17 = v7;
  v9 = v7;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, &v13);
  objc_msgSend(v9, "boundingRectWithSize:options:context:", 0, 0, 3.40282347e38, 3.40282347e38, v13, v14, v15, v16);
  v11 = UICeilToViewScale(0, v10);

  return v11;
}

@end
