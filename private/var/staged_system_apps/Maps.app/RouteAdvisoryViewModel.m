@implementation RouteAdvisoryViewModel

+ (id)viewModelForAdvisory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithAdvisory:", v4);

  return v5;
}

+ (id)viewModelsForAdvisories:(id)a3
{
  id v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A85EAC;
  v5[3] = &unk_1011E11B0;
  v5[4] = a1;
  v3 = sub_10039DCD4(a3, v5);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

+ (id)viewModelWithText:(id)a3 artwork:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithText:artwork:handler:", v10, v9, v8);

  return v11;
}

+ (id)viewModelWithText:(id)a3 buttonRange:(_NSRange)a4 image:(id)a5 handler:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithText:buttonRange:image:handler:", v13, location, length, v12, v11);

  return v14;
}

- (RouteAdvisoryViewModel)initWithAdvisory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RouteAdvisoryViewModel *v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultOptions"));

  objc_msgSend(v7, "setCreateAttributedString:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RouteAdvisoryView _stringAttributes](RouteAdvisoryView, "_stringAttributes"));
  objc_msgSend(v7, "setStringAttributes:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringResultWithOptions:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributedString"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artwork"));
  v13 = -[RouteAdvisoryViewModel initWithText:artwork:handler:](self, "initWithText:artwork:handler:", v11, v12, 0);

  if (v13)
    objc_storeStrong((id *)&v13->_advisory, a3);

  return v13;
}

- (RouteAdvisoryViewModel)initWithText:(id)a3 artwork:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  RouteAdvisoryViewModel *v11;
  NSAttributedString *v12;
  NSAttributedString *text;
  id v14;
  id handler;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RouteAdvisoryViewModel;
  v11 = -[RouteAdvisoryViewModel init](&v17, "init");
  if (v11)
  {
    v12 = (NSAttributedString *)objc_msgSend(v8, "copy");
    text = v11->_text;
    v11->_text = v12;

    objc_storeStrong((id *)&v11->_artwork, a4);
    v14 = objc_msgSend(v10, "copy");
    handler = v11->_handler;
    v11->_handler = v14;

  }
  return v11;
}

- (RouteAdvisoryViewModel)initWithText:(id)a3 buttonRange:(_NSRange)a4 image:(id)a5 handler:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  RouteAdvisoryViewModel *v14;
  NSAttributedString *v15;
  NSAttributedString *text;
  id v17;
  id handler;
  objc_super v20;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)RouteAdvisoryViewModel;
  v14 = -[RouteAdvisoryViewModel init](&v20, "init");
  if (v14)
  {
    v15 = (NSAttributedString *)objc_msgSend(v11, "copy");
    text = v14->_text;
    v14->_text = v15;

    objc_storeStrong((id *)&v14->_image, a5);
    v14->_buttonRange.location = location;
    v14->_buttonRange.length = length;
    v17 = objc_msgSend(v13, "copy");
    handler = v14->_handler;
    v14->_handler = v17;

  }
  return v14;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (UIImage)image
{
  return self->_image;
}

- (_NSRange)buttonRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_buttonRange.length;
  location = self->_buttonRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)handler
{
  return self->_handler;
}

- (GEOComposedRouteAdvisory)advisory
{
  return self->_advisory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisory, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
