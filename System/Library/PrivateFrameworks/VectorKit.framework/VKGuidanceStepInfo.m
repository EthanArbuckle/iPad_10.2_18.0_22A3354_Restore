@implementation VKGuidanceStepInfo

- (VKGuidanceStepInfo)initWithRoadName:(id)a3 point:(int)a4
{
  id v7;
  VKGuidanceStepInfo *v8;
  VKGuidanceStepInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKGuidanceStepInfo;
  v8 = -[VKGuidanceStepInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_roadName, a3);
    v9->_routePoint = a4;
  }

  return v9;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (int)routePoint
{
  return self->_routePoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadName, 0);
}

@end
