@implementation VisionCoreISPInferenceNetworkObject

- (VisionCoreISPInferenceNetworkObject)initWithANSTObject:(id)a3
{
  id v4;
  VisionCoreISPInferenceNetworkObject *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VisionCoreISPInferenceNetworkObject;
  v5 = -[VisionCoreISPInferenceNetworkObject init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "boundingBox");
    v5->_boundingBox.origin.x = v6;
    v5->_boundingBox.origin.y = v7;
    v5->_boundingBox.size.width = v8;
    v5->_boundingBox.size.height = v9;
    v5->_groupID = objc_msgSend(v4, "groupID");
    v5->_confidence = objc_msgSend(v4, "confidence");
  }

  return v5;
}

- (unint64_t)groupID
{
  return self->_groupID;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

@end
