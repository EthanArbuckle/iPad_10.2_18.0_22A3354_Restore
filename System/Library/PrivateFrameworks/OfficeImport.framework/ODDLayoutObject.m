@implementation ODDLayoutObject

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDLayoutObject;
  -[ODDLayoutObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
