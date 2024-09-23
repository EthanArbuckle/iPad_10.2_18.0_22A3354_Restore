@implementation RAPMarkerViewAttributes

- (RAPMarkerViewAttributes)initWithTitle:(id)a3 styleAttributes:(id)a4
{
  id v6;
  id v7;
  RAPMarkerViewAttributes *v8;
  NSString *v9;
  NSString *title;
  GEOFeatureStyleAttributes *v11;
  GEOFeatureStyleAttributes *styleAttributes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPMarkerViewAttributes;
  v8 = -[RAPMarkerViewAttributes init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = v9;

    v11 = (GEOFeatureStyleAttributes *)objc_msgSend(v7, "copy");
    styleAttributes = v8->_styleAttributes;
    v8->_styleAttributes = v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = -[GEOFeatureStyleAttributes copy](self->_styleAttributes, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_title, "copy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
