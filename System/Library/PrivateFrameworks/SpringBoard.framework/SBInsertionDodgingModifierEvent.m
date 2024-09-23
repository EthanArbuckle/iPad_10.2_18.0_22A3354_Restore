@implementation SBInsertionDodgingModifierEvent

- (SBInsertionDodgingModifierEvent)initWithIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  SBInsertionDodgingModifierEvent *v12;
  SBInsertionDodgingModifierEvent *v13;
  objc_super v15;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBInsertionDodgingModifierEvent;
  v12 = -[SBInsertionDodgingModifierEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13->_center.x = x;
    v13->_center.y = y;
    v13->_size.width = width;
    v13->_size.height = height;
  }

  return v13;
}

- (unint64_t)type
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
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
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
