@implementation BKLibraryBookshelfCellMetrics

+ (id)cellMetricsForSectionName:(id)a3
{
  id v3;
  __objc2_class **v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bookCellGrid")) & 1) != 0)
  {
    v4 = off_1008E5280;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bookCellListUser")) & 1) != 0)
  {
    v4 = off_1008E5288;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bookCellListFinished")) & 1) != 0)
  {
    v4 = off_1008E5278;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("bookCellListWantToRead")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = off_1008E5290;
  }
  v5 = objc_alloc_init(*v4);
LABEL_10:

  return v5;
}

+ (id)sectionNameForCollectionType:(unint64_t)a3 layoutMode:(unint64_t)a4
{
  id result;

  result = CFSTR("bookCellGrid");
  if (a4 == 2 && a3 <= 3)
    return off_1008E8428[a3];
  return result;
}

+ (id)sectionName
{
  return 0;
}

+ (id)sectionNames
{
  _QWORD v3[4];

  v3[0] = CFSTR("bookCellGrid");
  v3[1] = CFSTR("bookCellListUser");
  v3[2] = CFSTR("bookCellListFinished");
  v3[3] = CFSTR("bookCellListWantToRead");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4));
}

- (void)configureWithSection:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listPlainCellConfiguration](UIBackgroundConfiguration, "listPlainCellConfiguration"));
  objc_msgSend(v4, "floatForKey:", CFSTR("background-corner-radius"));
  objc_msgSend(v13, "setCornerRadius:");
  objc_msgSend(v4, "insetsForKey:", CFSTR("background-insets"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v13, "setBackgroundInsets:", v6, v8, v10, v12);
  objc_msgSend(v13, "setBackgroundColorTransformer:", &stru_1008E8408);
  -[BKLibraryBookshelfCellMetrics setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v13);

}

- (id)backgroundConfigurationForState:(id)a3 isInEditMode:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCellMetrics backgroundConfiguration](self, "backgroundConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updatedConfigurationForState:", v6));

  LODWORD(v7) = objc_msgSend(v6, "isSelected");
  if (!(_DWORD)v7 || a4)
  {
    v9 = v8;
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
    objc_msgSend(v8, "setBackgroundColor:", v9);
  }

  return v8;
}

- (int)cellType
{
  return self->_cellType;
}

- (void)setCellType:(int)a3
{
  self->_cellType = a3;
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  return self->_backgroundConfiguration;
}

- (void)setBackgroundConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundConfiguration, 0);
}

@end
