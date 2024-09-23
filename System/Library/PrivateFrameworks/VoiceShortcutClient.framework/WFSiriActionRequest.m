@implementation WFSiriActionRequest

- (WFSiriActionRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFSiriActionRequest;
  return -[WFSiriActionRequest init](&v3, sel_init);
}

- (WFSiriActionRequest)initWithCoder:(id)a3
{
  WFSiriActionRequest *v3;
  WFSiriActionRequest *v4;
  WFSiriActionRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSiriActionRequest;
  v3 = -[WFSiriActionRequest init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
