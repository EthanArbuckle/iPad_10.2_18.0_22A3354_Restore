@implementation BKMousePointerButtonDownRepositionAssertion

- (BKMousePointerButtonDownRepositionAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 contextRelativePointerPosition:(id)a5 displayUUID:(id)a6 restrictingToPID:(int)a7 invalidationBlock:(id)a8
{
  id v15;
  id v16;
  BKMousePointerButtonDownRepositionAssertion *v17;
  BKMousePointerButtonDownRepositionAssertion *v18;
  objc_super v20;

  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BKMousePointerButtonDownRepositionAssertion;
  v17 = -[BKMousePointerButtonDownRepositionAssertion initWithIdentifier:forReason:invalidationBlock:](&v20, "initWithIdentifier:forReason:invalidationBlock:", a3, a4, a8);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contextRelativePointerPosition, a5);
    objc_storeStrong((id *)&v18->_displayUUID, a6);
    v18->_restrictingToPID = a7;
  }

  return v18;
}

- (BKSContextRelativePoint)contextRelativePointerPosition
{
  return self->_contextRelativePointerPosition;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (int)restrictingToPID
{
  return self->_restrictingToPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_contextRelativePointerPosition, 0);
}

@end
