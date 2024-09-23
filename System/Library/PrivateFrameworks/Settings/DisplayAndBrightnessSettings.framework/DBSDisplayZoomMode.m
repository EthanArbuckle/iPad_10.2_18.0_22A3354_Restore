@implementation DBSDisplayZoomMode

- (DBSDisplayZoomMode)initWithDisplayZoomOption:(unint64_t)a3 localizedName:(id)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  DBSDisplayZoomMode *v10;
  DBSDisplayZoomMode *v11;
  uint64_t v12;
  NSString *localizedName;
  objc_super v15;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DBSDisplayZoomMode;
  v10 = -[DBSDisplayZoomMode init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_displayZoomOption = a3;
    v12 = objc_msgSend(v9, "copy");
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v12;

    v11->_size.width = width;
    v11->_size.height = height;
  }

  return v11;
}

- (unint64_t)displayZoomOption
{
  return self->_displayZoomOption;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
