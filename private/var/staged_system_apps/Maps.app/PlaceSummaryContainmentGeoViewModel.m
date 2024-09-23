@implementation PlaceSummaryContainmentGeoViewModel

- (PlaceSummaryContainmentGeoViewModel)initWithMapItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  PlaceSummaryContainmentGeoViewModel *v10;
  uint64_t v11;
  NSString *prefix;
  uint64_t v13;
  NSString *containment;
  PlaceSummaryContainmentGeoViewModel *v15;
  objc_super v17;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MUPlaceHeaderViewModel), "initWithMapItem:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enclosingPlaceViewModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "labelValue"));
  if (objc_msgSend(v7, "length"))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tokenValue"));
    v9 = objc_msgSend(v8, "length");

    if (!v9)
    {
      v15 = 0;
      goto LABEL_7;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PlaceSummaryContainmentGeoViewModel;
  v10 = -[PlaceSummaryContainmentGeoViewModel init](&v17, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "labelValue"));
    prefix = v10->_prefix;
    v10->_prefix = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tokenValue"));
    containment = v10->_containment;
    v10->_containment = (NSString *)v13;

  }
  self = v10;
  v15 = self;
LABEL_7:

  return v15;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSString)containment
{
  return self->_containment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containment, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end
