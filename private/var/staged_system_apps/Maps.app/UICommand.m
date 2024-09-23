@implementation UICommand

+ (id)_maps_commandWithEnableFeatureTitle:(id)a3 disableFeatureTitle:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = CFSTR("MapsUICommandEnableTitleKey");
  v13[1] = CFSTR("MapsUICommandDisableTitleKey");
  v14[0] = a3;
  v14[1] = a4;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "commandWithTitle:image:action:propertyList:", v9, 0, a5, v10));
  return v11;
}

- (void)_maps_setUseDisableFeatureTitle:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UICommand propertyList](self, "propertyList"));
    v4 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MapsUICommandDisableTitleKey")));
      -[UICommand setTitle:](self, "setTitle:", v5);

    }
  }
}

@end
