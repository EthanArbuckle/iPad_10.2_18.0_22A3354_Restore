@implementation _TransitDirectionsListViewInfo

+ (_TransitDirectionsListViewInfo)infoWithStepView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[1];
  v8[1] = v6;
  v10 = v6;

  v11 = (void *)v8[2];
  v8[2] = v7;

  return (_TransitDirectionsListViewInfo *)v8;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsListViewInfo indexPath](self, "indexPath"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(self))
  {
    v7 = v4;
    v8 = objc_claimAutoreleasedReturnValue(-[_TransitDirectionsListViewInfo indexPath](self, "indexPath"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPath"));
    if (v8 | v9)
      v6 = objc_msgSend((id)v8, "isEqual:", v9);
    else
      v6 = 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_TransitDirectionsListViewInfo;
  v3 = -[_TransitDirectionsListViewInfo description](&v15, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsListViewInfo indexPath](self, "indexPath"));
  v6 = objc_msgSend(v5, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsListViewInfo indexPath](self, "indexPath"));
  v8 = objc_msgSend(v7, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsListViewInfo stepView](self, "stepView"));
  v10 = (objc_class *)objc_opt_class(v9);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%ld-%ld: %@)"), v4, v6, v8, v12));

  return v13;
}

- (TransitDirectionsStepView)stepView
{
  return self->_stepView;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_stepView, 0);
}

@end
