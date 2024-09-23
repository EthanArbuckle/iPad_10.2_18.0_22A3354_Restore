@implementation RidesharingFareLineItem

- (RidesharingFareLineItem)init
{
  RidesharingFareLineItem *result;

  result = (RidesharingFareLineItem *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)_initWithTitle:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  RidesharingFareLineItem *v8;
  NSString *v9;
  NSString *title;
  NSString *v11;
  NSString *details;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingFareLineItem;
  v8 = -[RidesharingFareLineItem init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    details = v8->_details;
    v8->_details = v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_title, "hash");
  return -[NSString hash](self->_details, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = a3;
  v5 = objc_opt_class(RidesharingFareLineItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingFareLineItem title](self, "title"));
    if (objc_msgSend(v9, "isEqual:", v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "details"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingFareLineItem details](self, "details"));
      v13 = objc_msgSend(v11, "isEqual:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_fareItemsFromRideOption:(id)a3
{
  id v3;
  NSMutableSet *v4;
  NSMutableSet *v5;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  NSMutableSet *v13;
  NSMutableSet *v14;

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v5 = objc_opt_new(NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fareLineItems"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009473F0;
  v12[3] = &unk_1011DC758;
  v13 = v5;
  v14 = v4;
  v7 = v4;
  v8 = v5;
  v9 = sub_10039DCD4(v6, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)details
{
  return self->_details;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
