@implementation SBSetInterfaceOrientationFromUserResizingEventResponse

- (SBSetInterfaceOrientationFromUserResizingEventResponse)initWithDisplayItem:(id)a3 desiredContentOrientation:(int64_t)a4
{
  id v7;
  SBSetInterfaceOrientationFromUserResizingEventResponse *v8;
  SBSetInterfaceOrientationFromUserResizingEventResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSetInterfaceOrientationFromUserResizingEventResponse;
  v8 = -[SBChainableModifierEventResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayItem, a3);
    v9->_desiredOrientation = a4;
  }

  return v9;
}

- (int64_t)type
{
  return 39;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (int64_t)desiredOrientation
{
  return self->_desiredOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end
