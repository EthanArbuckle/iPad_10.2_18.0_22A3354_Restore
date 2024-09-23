@implementation UIKeyCommand

+ (id)_maps_commandWithEnableFeatureTitle:(id)a3 disableFeatureTitle:(id)a4 action:(SEL)a5 input:(id)a6 modifierFlags:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v18[0] = CFSTR("MapsUICommandEnableTitleKey");
  v18[1] = CFSTR("MapsUICommandDisableTitleKey");
  v19[0] = a3;
  v19[1] = a4;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v14, 0, a5, v12, a7, v15));
  return v16;
}

- (NSIndexPath)cell_IndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIKeyCommand propertyList](self, "propertyList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("row")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIKeyCommand propertyList](self, "propertyList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("section")));

  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0
    && (v8 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
  {
    v9 = v6;
    v10 = objc_msgSend(v4, "integerValue");
    v11 = objc_msgSend(v9, "integerValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, v11));
  }
  else
  {
    v12 = 0;
  }

  return (NSIndexPath *)v12;
}

@end
