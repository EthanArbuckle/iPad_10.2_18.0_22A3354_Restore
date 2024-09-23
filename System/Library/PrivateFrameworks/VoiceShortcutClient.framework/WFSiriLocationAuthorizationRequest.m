@implementation WFSiriLocationAuthorizationRequest

- (WFSiriLocationAuthorizationRequest)initWithNeedsPreciseLocation:(BOOL)a3
{
  WFSiriLocationAuthorizationRequest *v4;
  WFSiriLocationAuthorizationRequest *v5;
  WFSiriLocationAuthorizationRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSiriLocationAuthorizationRequest;
  v4 = -[WFSiriActionRequest init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_needsPreciseLocation = a3;
    v6 = v4;
  }

  return v5;
}

- (WFSiriLocationAuthorizationRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriLocationAuthorizationRequest *v5;
  WFSiriLocationAuthorizationRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSiriLocationAuthorizationRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_needsPreciseLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsPreciseLocation"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSiriLocationAuthorizationRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriLocationAuthorizationRequest needsPreciseLocation](self, "needsPreciseLocation", v5.receiver, v5.super_class), CFSTR("needsPreciseLocation"));

}

- (BOOL)needsPreciseLocation
{
  return self->_needsPreciseLocation;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
