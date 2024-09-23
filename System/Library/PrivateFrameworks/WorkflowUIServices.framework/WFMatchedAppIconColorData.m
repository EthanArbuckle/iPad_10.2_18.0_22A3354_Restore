@implementation WFMatchedAppIconColorData

- (WFMatchedAppIconColorData)initWithColors:(id)a3
{
  id v5;
  WFMatchedAppIconColorData *v6;
  WFMatchedAppIconColorData *v7;
  WFMatchedAppIconColorData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFMatchedAppIconColorData;
  v6 = -[WFMatchedAppIconColorData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_colors, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
