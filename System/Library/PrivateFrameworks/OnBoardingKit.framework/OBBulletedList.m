@implementation OBBulletedList

- (OBBulletedList)initWithFrame:(CGRect)a3
{
  OBBulletedList *v3;
  NSMutableArray *v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  NSMutableArray *verticalConstraints;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OBBulletedList;
  v3 = -[OBBulletedList initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v3->_items;
    v3->_items = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    verticalConstraints = v3->_verticalConstraints;
    v3->_verticalConstraints = v6;

  }
  return v3;
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OBBulletedListItem *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[OBBulletedListItem initWithTitle:description:image:tintColor:]([OBBulletedListItem alloc], "initWithTitle:description:image:tintColor:", v13, v12, v11, v10);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v14);

}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OBBulletedListItem *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[OBBulletedListItem initWithTitle:description:image:tintColor:linkButton:]([OBBulletedListItem alloc], "initWithTitle:description:image:tintColor:linkButton:", v16, v15, v14, v13, v12);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v17);

}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  OBBulletedListItem *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[OBBulletedListItem initWithTitle:description:image:tintColor:]([OBBulletedListItem alloc], "initWithTitle:description:image:tintColor:", v10, v9, v8, 0);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v11);

}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 linkButton:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OBBulletedListItem *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[OBBulletedListItem initWithTitle:description:image:tintColor:linkButton:]([OBBulletedListItem alloc], "initWithTitle:description:image:tintColor:linkButton:", v13, v12, v11, 0, v10);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v14);

}

- (void)addItemWithDescription:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  OBBulletedListItem *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[OBBulletedListItem initWithTitle:description:image:tintColor:]([OBBulletedListItem alloc], "initWithTitle:description:image:tintColor:", 0, v7, v6, 0);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v8);

}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OBBulletedListItem *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[OBBulletedListItem initWithTitle:description:symbolName:tintColor:]([OBBulletedListItem alloc], "initWithTitle:description:symbolName:tintColor:", v13, v12, v11, v10);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v14);

}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OBBulletedListItem *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[OBBulletedListItem initWithTitle:description:symbolName:tintColor:linkButton:]([OBBulletedListItem alloc], "initWithTitle:description:symbolName:tintColor:linkButton:", v16, v15, v14, v13, v12);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v17);

}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5
{
  id v8;
  id v9;
  id v10;
  OBBulletedListItem *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[OBBulletedListItem initWithTitle:description:symbolName:tintColor:]([OBBulletedListItem alloc], "initWithTitle:description:symbolName:tintColor:", v10, v9, v8, 0);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v11);

}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 linkButton:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OBBulletedListItem *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[OBBulletedListItem initWithTitle:description:symbolName:tintColor:linkButton:]([OBBulletedListItem alloc], "initWithTitle:description:symbolName:tintColor:linkButton:", v13, v12, v11, 0, v10);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v14);

}

- (void)addItemWithDescription:(id)a3 symbolName:(id)a4
{
  id v6;
  id v7;
  OBBulletedListItem *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[OBBulletedListItem initWithTitle:description:symbolName:tintColor:]([OBBulletedListItem alloc], "initWithTitle:description:symbolName:tintColor:", 0, v7, v6, 0);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v8);

}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
  -[OBBulletedList _updatePaddingForOrientation](self, "_updatePaddingForOrientation");
}

- (void)addBulletedListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[OBBulletedList items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[OBBulletedList addSubview:](self, "addSubview:", v4);
  v6 = (void *)MEMORY[0x1E0CB3718];
  -[OBBulletedList leadingAnchor](self, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  -[OBBulletedList trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v13);

  -[OBBulletedList _updateConstraints](self, "_updateConstraints");
}

- (double)bulletedListItemSpacing
{
  double result;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  if (-[OBBulletedList _shouldHandleLandscapeiPhoneLayout](self, "_shouldHandleLandscapeiPhoneLayout"))
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "type") == 1)
    {
      v5 = +[OBViewUtilities activeInterfaceOrientationForView:](OBViewUtilities, "activeInterfaceOrientationForView:", self)- 3;

      result = 22.0;
      if (v5 < 2)
        return result;
    }
    else
    {

    }
  }
  +[OBDevice currentDevice](OBDevice, "currentDevice", result);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "templateType");

  result = 26.0;
  switch(v7)
  {
    case 0:
      result = 0.0;
      break;
    case 1:
    case 6:
    case 9:
      v8 = MGGetProductType();
      v9 = v8 == 1895344378 || v8 == 2903084588;
      result = 36.0;
      if (v9)
        result = 16.0;
      break;
    case 5:
    case 7:
      result = 22.0;
      break;
    case 10:
      result = 20.0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBBulletedList;
  -[OBBulletedList didMoveToWindow](&v3, sel_didMoveToWindow);
  -[OBBulletedList _updateConstraints](self, "_updateConstraints");
}

- (void)_updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  -[OBBulletedList verticalConstraints](self, "verticalConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedList removeConstraints:](self, "removeConstraints:", v3);

  -[OBBulletedList verticalConstraints](self, "verticalConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[OBBulletedList items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[OBBulletedList items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 1)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[OBBulletedList verticalConstraints](self, "verticalConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedList topAnchor](self, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v13;
    -[OBBulletedList bottomAnchor](self, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v17);

LABEL_17:
    goto LABEL_18;
  }
  v18 = objc_msgSend(v7, "count");

  if (v18 >= 2)
  {
    -[OBBulletedList bulletedListItemSpacing](self, "bulletedListItemSpacing");
    v20 = v19;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[OBBulletedList items](self, "items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v21)
    {
      v22 = v21;
      v9 = 0;
      v23 = *(_QWORD *)v39;
      v24 = -v20;
      do
      {
        v25 = 0;
        v26 = v9;
        do
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v25);
          -[OBBulletedList verticalConstraints](self, "verticalConstraints");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v26, "bottomAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "topAnchor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v29;
            v32 = v30;
            v33 = v24;
          }
          else
          {
            -[OBBulletedList topAnchor](self, "topAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "topAnchor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0.0;
            v31 = v29;
            v32 = v30;
          }
          objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

          v9 = v27;
          ++v25;
          v26 = v9;
        }
        while (v22 != v25);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v22);
    }
    else
    {
      v9 = 0;
    }

    -[OBBulletedList verticalConstraints](self, "verticalConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedList bottomAnchor](self, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);
    goto LABEL_17;
  }
LABEL_18:
  v35 = (void *)MEMORY[0x1E0CB3718];
  -[OBBulletedList verticalConstraints](self, "verticalConstraints");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v36);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBBulletedList;
  -[OBBulletedList layoutSubviews](&v3, sel_layoutSubviews);
  -[OBBulletedList _updatePaddingForOrientation](self, "_updatePaddingForOrientation");
}

- (void)_updatePaddingForOrientation
{
  double v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v3 = 0.0;
  if (-[OBBulletedList _shouldHandleLandscapeiPhoneLayout](self, "_shouldHandleLandscapeiPhoneLayout"))
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "type") == 1)
    {
      v5 = +[OBViewUtilities activeInterfaceOrientationForView:](OBViewUtilities, "activeInterfaceOrientationForView:", self)- 3;

      if (v5 >= 2)
        v3 = 0.0;
      else
        v3 = 54.0;
    }
    else
    {

    }
  }
  -[OBBulletedList leadingConstraint](self, "leadingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", -v3);

  -[OBBulletedList trailingConstraint](self, "trailingConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v3);

}

- (BOOL)_shouldHandleLandscapeiPhoneLayout
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedList window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "supportedInterfaceOrientationsForWindow:", v4);

  return v5 == 3 || (v5 & 0xFFFFFFFFFFFFFFF7) == 16;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalConstraints, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
