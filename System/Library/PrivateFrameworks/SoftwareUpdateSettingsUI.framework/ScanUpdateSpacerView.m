@implementation ScanUpdateSpacerView

- (ScanUpdateSpacerView)initWithSpecifier:(id)a3
{
  ScanUpdateSpacerView *v3;
  NSNumber *v4;
  NSNumber *height;
  ScanUpdateSpacerView *v7;
  ScanUpdateSpacerView *v8;
  objc_super v9;
  id location[2];
  ScanUpdateSpacerView *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)ScanUpdateSpacerView;
  v8 = -[PSFooterHyperlinkView initWithSpecifier:](&v9, sel_initWithSpecifier_, location[0]);
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    v4 = (NSNumber *)(id)objc_msgSend(location[0], "propertyForKey:", CFSTR("SUHeight"));
    height = v11->_height;
    v11->_height = v4;

  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  NSNumber *v3;
  NSNumber *height;
  objc_super v5;
  id location[2];
  ScanUpdateSpacerView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (NSNumber *)(id)objc_msgSend(location[0], "propertyForKey:", CFSTR("SUHeight"));
  height = v7->_height;
  v7->_height = v3;

  v5.receiver = v7;
  v5.super_class = (Class)ScanUpdateSpacerView;
  -[PSFooterHyperlinkView refreshContentsWithSpecifier:](&v5, sel_refreshContentsWithSpecifier_, location[0]);
  objc_storeStrong(location, 0);
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  float v4;
  float v5;
  id location[3];
  ScanUpdateSpacerView *v8;
  double v9;

  v8 = self;
  location[2] = (id)a2;
  location[1] = *(id *)&a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (!v8->_height || (-[NSNumber floatValue](v8->_height, "floatValue"), v4 == 0.0))
  {
    v9 = 0.0;
  }
  else
  {
    -[NSNumber floatValue](v8->_height, "floatValue");
    v9 = v5;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
}

@end
