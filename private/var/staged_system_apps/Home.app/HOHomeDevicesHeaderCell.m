@implementation HOHomeDevicesHeaderCell

- (HOHomeDevicesHeaderCell)initWithFrame:(CGRect)a3
{
  HOHomeDevicesHeaderCell *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v35.receiver = self;
  v35.super_class = (Class)HOHomeDevicesHeaderCell;
  v3 = -[HOHomeDevicesHeaderCell initWithFrame:](&v35, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = objc_alloc_init((Class)UILabel);
    -[HOHomeDevicesHeaderCell setDevicesLabel:](v3, "setDevicesLabel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell devicesLabel](v3, "devicesLabel"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell devicesLabel](v3, "devicesLabel"));
    objc_msgSend(v8, "setFont:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell devicesLabel](v3, "devicesLabel"));
    objc_msgSend(v10, "setTextColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = CFSTR("HODeviceGridTitle");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HODeviceGridTitle"), CFSTR("_"), CFSTR("HOLocalizable")));

    if (objc_msgSend(CFSTR("_"), "isEqualToString:", v13))
    {
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v14 = sub_100016908();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v16)
      {
        v17 = v16;
        v34 = v4;
        v18 = *(_QWORD *)v37;
LABEL_5:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("HODeviceGridTitle"), CFSTR("HODeviceGridTitle"), v20));

          if (!-[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("HODeviceGridTitle")))
            break;

          if (v17 == (id)++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            if (v17)
              goto LABEL_5;
            v22 = CFSTR("_");
            break;
          }
        }
        v4 = v34;
        v12 = CFSTR("HODeviceGridTitle");
      }
      else
      {
        v22 = CFSTR("_");
      }

      v13 = v22;
    }
    if (objc_msgSend(CFSTR("_"), "isEqualToString:", v13))
      NSLog(CFSTR("Sensitive key '%@' not found!"), CFSTR("HODeviceGridTitle"));
    else
      v12 = v13;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell devicesLabel](v3, "devicesLabel"));
    objc_msgSend(v23, "setText:", v12);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell devicesLabel](v3, "devicesLabel"));
    -[HOHomeDevicesHeaderCell addSubview:](v3, "addSubview:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell devicesLabel](v3, "devicesLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell bottomAnchor](v3, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -6.0));
    objc_msgSend(v4, "addObject:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell devicesLabel](v3, "devicesLabel"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderCell leadingAnchor](v3, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 14.0));
    objc_msgSend(v4, "addObject:", v32);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
  }
  return v3;
}

+ (double)requiredHeight
{
  return 50.0;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UILabel)devicesLabel
{
  return self->_devicesLabel;
}

- (void)setDevicesLabel:(id)a3
{
  objc_storeStrong((id *)&self->_devicesLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
