@implementation TIContinuousPathWithLayoutName

- (TIContinuousPathWithLayoutName)initWithLayout:(id)a3
{
  NSString *v4;
  TIContinuousPathWithLayoutName *v5;
  NSString *layout;
  objc_super v8;

  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TIContinuousPathWithLayoutName;
  v5 = -[TIContinuousPath init](&v8, sel_init);
  layout = v5->_layout;
  v5->_layout = v4;

  return v5;
}

- (NSString)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
