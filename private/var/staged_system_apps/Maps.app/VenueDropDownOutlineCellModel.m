@implementation VenueDropDownOutlineCellModel

- (VenueDropDownOutlineCellModel)initWithButtonTitle:(id)a3 categories:(id)a4 selectedCategory:(id)a5 venueIdentifier:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  VenueDropDownOutlineCellModel *v17;
  NSString *v18;
  NSString *buttonTitle;
  NSArray *v20;
  NSArray *categories;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)VenueDropDownOutlineCellModel;
  v17 = -[VenueDropDownOutlineCellModel init](&v23, "init");
  if (v17)
  {
    v18 = (NSString *)objc_msgSend(v12, "copy");
    buttonTitle = v17->_buttonTitle;
    v17->_buttonTitle = v18;

    v20 = (NSArray *)objc_msgSend(v13, "copy");
    categories = v17->_categories;
    v17->_categories = v20;

    objc_storeStrong((id *)&v17->_venueIdentifier, a6);
    objc_storeStrong((id *)&v17->_selectedCategory, a5);
    objc_storeWeak((id *)&v17->_delegate, v16);
  }

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_buttonTitle, "hash");
  v4 = (unint64_t)-[NSArray hash](self->_categories, "hash") ^ v3;
  return v4 ^ (unint64_t)-[GEOSearchCategory hash](self->_selectedCategory, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VenueDropDownOutlineCellModel *v4;
  VenueDropDownOutlineCellModel *v5;
  uint64_t v6;
  VenueDropDownOutlineCellModel *v7;
  NSString *v8;
  NSString *v9;
  NSArray *v10;
  NSArray *v11;
  GEOSearchCategory *v12;
  GEOSearchCategory *v13;
  id v14;
  id WeakRetained;
  unsigned __int8 v16;

  v4 = (VenueDropDownOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel buttonTitle](v7, "buttonTitle"));
    v9 = v8;
    if (v8 == self->_buttonTitle || -[NSString isEqual:](v8, "isEqual:"))
    {
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel categories](v7, "categories"));
      v11 = v10;
      if (v10 == self->_categories || -[NSArray isEqual:](v10, "isEqual:"))
      {
        v12 = (GEOSearchCategory *)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel selectedCategory](v7, "selectedCategory"));
        v13 = v12;
        if (v12 == self->_selectedCategory || -[GEOSearchCategory isEqual:](v12, "isEqual:"))
        {
          v14 = (id)objc_claimAutoreleasedReturnValue(-[VenueDropDownOutlineCellModel delegate](v7, "delegate"));
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (v14 == WeakRetained)
            v16 = 1;
          else
            v16 = objc_msgSend(v14, "isEqual:", WeakRetained);

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
  return (UICollectionViewCellRegistration *)+[VenueDropDownOutlineCellRegistration sharedRegistration](VenueDropDownOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[VenueDropDownOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (VenueDropDownOutlineCellDelegate)delegate
{
  return (VenueDropDownOutlineCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (GEOVenueIdentifier)venueIdentifier
{
  return self->_venueIdentifier;
}

- (NSArray)categories
{
  return self->_categories;
}

- (GEOSearchCategory)selectedCategory
{
  return self->_selectedCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_selectedCategory, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
