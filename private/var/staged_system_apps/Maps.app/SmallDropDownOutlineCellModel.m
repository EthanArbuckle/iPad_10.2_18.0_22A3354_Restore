@implementation SmallDropDownOutlineCellModel

- (SmallDropDownOutlineCellModel)initWithButtonTitle:(id)a3 dropDownTitles:(id)a4 selectedIndex:(int64_t)a5 delegate:(id)a6 backgroundModel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SmallDropDownOutlineCellModel *v16;
  NSString *v17;
  NSString *buttonTitle;
  NSArray *v19;
  NSArray *dropDownTitles;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SmallDropDownOutlineCellModel;
  v16 = -[SmallDropDownOutlineCellModel init](&v22, "init");
  if (v16)
  {
    v17 = (NSString *)objc_msgSend(v12, "copy");
    buttonTitle = v16->_buttonTitle;
    v16->_buttonTitle = v17;

    v19 = (NSArray *)objc_msgSend(v13, "copy");
    dropDownTitles = v16->_dropDownTitles;
    v16->_dropDownTitles = v19;

    v16->_selectedIndex = a5;
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_backgroundModel, a7);
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_buttonTitle, "hash");
  return (unint64_t)-[NSArray hash](self->_dropDownTitles, "hash") ^ v3 ^ self->_selectedIndex;
}

- (BOOL)isEqual:(id)a3
{
  SmallDropDownOutlineCellModel *v4;
  SmallDropDownOutlineCellModel *v5;
  uint64_t v6;
  SmallDropDownOutlineCellModel *v7;
  NSString *v8;
  NSString *v9;
  NSArray *v10;
  NSArray *v11;
  id v12;
  id WeakRetained;
  SidebarOutlineCellBackgroundModel *v14;
  SidebarOutlineCellBackgroundModel *v15;
  unsigned __int8 v16;

  v4 = (SmallDropDownOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel buttonTitle](v7, "buttonTitle"));
    v9 = v8;
    if (v8 == self->_buttonTitle || -[NSString isEqual:](v8, "isEqual:"))
    {
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel dropDownTitles](v7, "dropDownTitles"));
      v11 = v10;
      if ((v10 == self->_dropDownTitles || -[NSArray isEqual:](v10, "isEqual:"))
        && -[SmallDropDownOutlineCellModel selectedIndex](v7, "selectedIndex") == self->_selectedIndex)
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel delegate](v7, "delegate"));
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (v12 == WeakRetained || objc_msgSend(v12, "isEqual:", WeakRetained))
        {
          v14 = (SidebarOutlineCellBackgroundModel *)objc_claimAutoreleasedReturnValue(-[SmallDropDownOutlineCellModel backgroundModel](v7, "backgroundModel"));
          v15 = v14;
          if (v14 == self->_backgroundModel)
            v16 = 1;
          else
            v16 = -[SidebarOutlineCellBackgroundModel isEqual:](v14, "isEqual:");

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[SmallDropDownOutlineCellRegistration sharedRegistration](SmallDropDownOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[SmallDropDownOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSArray)dropDownTitles
{
  return self->_dropDownTitles;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (SmallDropDownOutlineCellDelegate)delegate
{
  return (SmallDropDownOutlineCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SidebarOutlineCellBackgroundModel)backgroundModel
{
  return self->_backgroundModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dropDownTitles, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
