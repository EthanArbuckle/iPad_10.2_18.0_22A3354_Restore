@implementation VehicleColorPicker

- (VehicleColorPicker)initWithColors:(id)a3 colorsPerRow:(unint64_t)a4 colorEdgeInsets:(UIEdgeInsets)a5 selectedIndex:(id)a6 contrastColor:(id)a7 delegate:(id)a8
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v17;
  id v18;
  id v19;
  VehicleColorPicker *v20;
  NSArray *v21;
  NSArray *colors;
  NSNumber *v23;
  NSNumber *selectedIndex;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  id v60;
  id v61;
  id v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  VehicleColorPicker *v67;
  void *v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  NSMutableArray *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  objc_super v77;
  void *v78;
  _QWORD v79[4];
  _QWORD v80[3];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v17 = a3;
  v18 = a6;
  v62 = a7;
  v19 = a8;
  v77.receiver = self;
  v77.super_class = (Class)VehicleColorPicker;
  v20 = -[VehicleColorPicker initWithFrame:](&v77, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v20)
  {
    v21 = (NSArray *)objc_msgSend(v17, "copy");
    colors = v20->_colors;
    v20->_colors = v21;

    v20->_colorsPerRow = a4;
    v20->_colorEdgeInsets.top = top;
    v20->_colorEdgeInsets.left = left;
    v20->_colorEdgeInsets.bottom = bottom;
    v20->_colorEdgeInsets.right = right;
    objc_storeStrong((id *)&v20->_contrastColor, a7);
    objc_storeWeak((id *)&v20->_delegate, v19);
    v23 = (NSNumber *)objc_msgSend(v18, "copy");
    selectedIndex = v20->_selectedIndex;
    v20->_selectedIndex = v23;

    v72 = objc_opt_new(NSMutableArray);
    v25 = (unint64_t)objc_msgSend(v17, "count");
    v70 = v25;
    if (v25 % a4)
      v26 = v25 / a4 + 1;
    else
      v26 = v25 / a4;
    v27 = objc_claimAutoreleasedReturnValue(-[VehicleColorPicker topAnchor](v20, "topAnchor", v19));
    v28 = (void *)v27;
    v60 = v18;
    v61 = v17;
    if (v26)
    {
      v29 = 0;
      v30 = 0;
      v65 = a4 - 1;
      v66 = a4;
      v67 = v20;
      v63 = v26;
      do
      {
        v31 = 0;
        if (v29 >= v70)
        {
          v51 = 0;
        }
        else
        {
          v64 = v30;
          v32 = 0;
          v33 = 0;
          v31 = 0;
          v68 = v28;
          v69 = v29;
          do
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker cells](v20, "cells"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", v29 + v32));

            -[VehicleColorPicker addSubview:](v20, "addSubview:", v35);
            v76 = v33;
            if (v32)
            {
              v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v33));
              v79[0] = v36;
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v28));
              v79[1] = v74;
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "widthAnchor"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "widthAnchor"));
              v73 = v38;
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
              v79[2] = v40;
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "heightAnchor"));
              v75 = v31;
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "heightAnchor"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
              v79[3] = v43;
              v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 4));
              -[NSMutableArray addObjectsFromArray:](v72, "addObjectsFromArray:", v44);

              v45 = v71;
            }
            else
            {
              v46 = v35;

              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker leadingAnchor](v20, "leadingAnchor"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v36));
              v80[0] = v37;
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v28));
              v80[1] = v73;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "widthAnchor"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "heightAnchor"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
              v80[2] = v41;
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 3));
              -[NSMutableArray addObjectsFromArray:](v72, "addObjectsFromArray:", v42);
              v75 = v46;
            }

            v20 = v67;
            if (v65 == v32)
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker trailingAnchor](v67, "trailingAnchor"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));
              v78 = v49;
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
              -[NSMutableArray addObjectsFromArray:](v72, "addObjectsFromArray:", v50);

            }
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));

            ++v32;
            v28 = v68;
            v29 = v69;
            v31 = v75;
            if (v32 >= v66)
              break;
            v33 = v51;
          }
          while (v32 + v69 < v70);
          v29 = v69 + v32;
          v26 = v63;
          v30 = v64;
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));

        ++v30;
        v28 = v52;
      }
      while (v30 != v26);
    }
    else
    {
      v52 = (void *)v27;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker cells](v20, "cells"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastObject"));

    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker bottomAnchor](v20, "bottomAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
    -[NSMutableArray addObject:](v72, "addObject:", v57);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v72);
    v18 = v60;
    v17 = v61;
    v19 = v59;
  }

  return v20;
}

- (NSArray)cells
{
  NSArray *cells;
  NSMutableArray *v4;
  void *v5;
  id v6;
  char *v7;
  double y;
  double width;
  double height;
  VehiclePickerButton *v11;
  void *v12;
  void *v13;
  void *v14;
  NSNumber *selectedIndex;
  _BOOL8 v16;
  double v17;
  void *v18;
  char *v19;
  NSArray *v20;

  cells = self->_cells;
  if (!cells)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker colors](self, "colors"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      do
      {
        v11 = -[VehiclePickerButton initWithFrame:]([VehiclePickerButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker colors](self, "colors"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v7));

        -[VehiclePickerButton setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[VehiclePickerButton setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("VehiclePickerButton"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehiclePickerButton colorView](v11, "colorView"));
        objc_msgSend(v14, "setBackgroundColor:", v13);

        -[VehiclePickerButton setColorViewInsets:](v11, "setColorViewInsets:", self->_colorEdgeInsets.top, self->_colorEdgeInsets.left, self->_colorEdgeInsets.bottom, self->_colorEdgeInsets.right);
        selectedIndex = self->_selectedIndex;
        if (selectedIndex)
          v16 = v7 == (char *)-[NSNumber unsignedIntegerValue](selectedIndex, "unsignedIntegerValue");
        else
          v16 = 0;
        -[VehiclePickerButton setActive:](v11, "setActive:", v16);
        objc_msgSend(v13, "_maps_euclideanDistanceFromColor:", self->_contrastColor);
        -[VehiclePickerButton setNeedsOutlineStroke:](v11, "setNeedsOutlineStroke:", v17 < 0.1);
        -[VehiclePickerButton addTarget:action:forControlEvents:](v11, "addTarget:action:forControlEvents:", self, "pressedCell:", 64);
        -[NSMutableArray addObject:](v4, "addObject:", v11);

        ++v7;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker colors](self, "colors"));
        v19 = (char *)objc_msgSend(v18, "count");

      }
      while (v7 < v19);
    }
    v20 = self->_cells;
    self->_cells = &v4->super;

    cells = self->_cells;
  }
  return cells;
}

- (void)pressedCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker cells](self, "cells"));
  objc_msgSend(v5, "colorPicker:didSelectIndex:", self, objc_msgSend(v6, "indexOfObject:", v4));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker cells](self, "cells", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "setActive:", 0);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setActive:", 1);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VehicleColorPicker;
  -[VehicleColorPicker traitCollectionDidChange:](&v21, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleColorPicker cells](self, "cells", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "colorView"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "backgroundColor"));
          objc_msgSend(v15, "_maps_euclideanDistanceFromColor:", self->_contrastColor);
          objc_msgSend(v13, "setNeedsOutlineStroke:", v16 < 0.1);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

  }
}

- (NSArray)colors
{
  return self->_colors;
}

- (VehicleColorPickerDelegate)delegate
{
  return (VehicleColorPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cells, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_contrastColor, 0);
  objc_storeStrong((id *)&self->_selectedIndex, 0);
}

@end
