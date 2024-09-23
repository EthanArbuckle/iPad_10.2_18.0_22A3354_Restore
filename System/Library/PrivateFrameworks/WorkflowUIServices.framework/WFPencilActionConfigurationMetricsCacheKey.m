@implementation WFPencilActionConfigurationMetricsCacheKey

- (WFPencilActionConfigurationMetricsCacheKey)initWithInterfaceOrientation:(int64_t)a3 screenSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  WFPencilActionConfigurationMetricsCacheKey *v7;
  WFPencilActionConfigurationMetricsCacheKey *v8;
  WFPencilActionConfigurationMetricsCacheKey *v9;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v11.receiver = self;
  v11.super_class = (Class)WFPencilActionConfigurationMetricsCacheKey;
  v7 = -[WFPencilActionConfigurationMetricsCacheKey init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_screenSize.width = width;
    v7->_screenSize.height = height;
    v7->_interfaceOrientation = a3;
    v9 = v7;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[WFPencilActionConfigurationMetricsCacheKey screenSize](self, "screenSize");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[WFPencilActionConfigurationMetricsCacheKey screenSize](self, "screenSize");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") ^ v5;
  v10 = v9 ^ -[WFPencilActionConfigurationMetricsCacheKey interfaceOrientation](self, "interfaceOrientation");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v14;
  int64_t v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  -[WFPencilActionConfigurationMetricsCacheKey screenSize](self, "screenSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "screenSize");
  if (v8 == v12 && v10 == v11)
  {
    v15 = -[WFPencilActionConfigurationMetricsCacheKey interfaceOrientation](self, "interfaceOrientation");
    v14 = v15 == objc_msgSend(v6, "interfaceOrientation");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFPencilActionConfigurationMetricsCacheKey *v4;
  int64_t v5;

  v4 = [WFPencilActionConfigurationMetricsCacheKey alloc];
  v5 = -[WFPencilActionConfigurationMetricsCacheKey interfaceOrientation](self, "interfaceOrientation");
  -[WFPencilActionConfigurationMetricsCacheKey screenSize](self, "screenSize");
  return -[WFPencilActionConfigurationMetricsCacheKey initWithInterfaceOrientation:screenSize:](v4, "initWithInterfaceOrientation:screenSize:", v5);
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

@end
