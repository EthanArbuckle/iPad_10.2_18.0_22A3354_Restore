@implementation VisionCoreISPInferenceNetworkHandObject

- (VisionCoreISPInferenceNetworkHandObject)initWithANSTHand:(id)a3
{
  id v4;
  VisionCoreISPInferenceNetworkHandObject *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreISPInferenceNetworkHandObject;
  v5 = -[VisionCoreISPInferenceNetworkObject initWithANSTObject:](&v8, sel_initWithANSTObject_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "chirality") == 1)
    {
      v6 = 1;
LABEL_6:
      v5->_chirality = v6;
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "chirality") == 2)
    {
      v6 = 2;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

- (int64_t)chirality
{
  return self->_chirality;
}

@end
