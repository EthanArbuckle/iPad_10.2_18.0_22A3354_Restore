@implementation CarSmallWidgetSearchCategoriesView

- (void)setCategories:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_categories, "isEqualToArray:"))
    objc_storeStrong((id *)&self->_categories, a3);
  -[CarSmallWidgetCollectionView refreshData](self, "refreshData");

}

- (id)data
{
  return self->_categories;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CarSmallWidgetSearchCategoriesCellModel *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetSearchCategoriesView categories](self, "categories"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  v8 = -[CarSmallWidgetSearchCategoriesCellModel initWithBrowseCategory:]([CarSmallWidgetSearchCategoriesCellModel alloc], "initWithBrowseCategory:", v7);

  return v8;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  CarSmallWidgetSearchCategoriesView *v9;
  CarSmallWidgetSearchCategoriesView *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetSearchCategoriesView categories](self, "categories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  v7 = sub_10043379C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetSearchCategoriesView performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v21 = v16;
    v22 = 2112;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] didSelectItemAtIndexPath: %@", buf, 0x16u);

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100373D00;
  v18[3] = &unk_1011AC8B0;
  v18[4] = self;
  v19 = v6;
  v17 = v6;
  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:](MapsCarPlayServicesShim, "openMapsCarPlayApplicationWithCompletion:", v18);

}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
