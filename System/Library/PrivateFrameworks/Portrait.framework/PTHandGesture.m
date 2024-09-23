@implementation PTHandGesture

- (PTHandGesture)initWithVCPHandObservation:(id)a3
{
  id v4;
  PTHandGesture *v5;
  PTHandGesture *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  NSNumber *personID;
  uint64_t v17;
  NSNumber *handID;
  void *v19;
  uint64_t v20;
  NSNumber *confidence;
  uint64_t v22;
  NSArray *handKeypoints;
  PTHandGesture *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PTHandGesture;
  v5 = -[PTHandGesture init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    v7 = objc_msgSend(v4, "gestureType") - 2;
    if (v7 <= 0xF && ((0xBCE1u >> v7) & 1) != 0)
      v6->_type = dword_1C93437FC[v7];
    v8 = objc_msgSend(v4, "chirality") + 1;
    if (v8 <= 2)
      v6->_handChirality = dword_1C934383C[v8];
    v9 = objc_msgSend(v4, "mitigationType");
    if (v9 <= 15)
    {
      v10 = 0;
      switch(v9)
      {
        case 0:
          goto LABEL_19;
        case 1:
          v10 = 1;
          goto LABEL_19;
        case 2:
          v10 = 2;
          goto LABEL_19;
        case 4:
          v10 = 3;
          goto LABEL_19;
        case 8:
          v10 = 4;
          goto LABEL_19;
        default:
          goto LABEL_20;
      }
      goto LABEL_20;
    }
    switch(v9)
    {
      case 16:
        v10 = 5;
        break;
      case 32:
        v10 = 6;
        break;
      case 64:
        v10 = 7;
        break;
      default:
LABEL_20:
        objc_msgSend(v4, "bounds");
        v6->_boundingBox.origin.x = v11;
        v6->_boundingBox.origin.y = v12;
        v6->_boundingBox.size.width = v13;
        v6->_boundingBox.size.height = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "groupID"));
        v15 = objc_claimAutoreleasedReturnValue();
        personID = v6->_personID;
        v6->_personID = (NSNumber *)v15;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "handID"));
        v17 = objc_claimAutoreleasedReturnValue();
        handID = v6->_handID;
        v6->_handID = (NSNumber *)v17;

        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "gestureConfidence");
        objc_msgSend(v19, "numberWithFloat:");
        v20 = objc_claimAutoreleasedReturnValue();
        confidence = v6->_confidence;
        v6->_confidence = (NSNumber *)v20;

        objc_msgSend(v4, "keypoints");
        v22 = objc_claimAutoreleasedReturnValue();
        handKeypoints = v6->_handKeypoints;
        v6->_handKeypoints = (NSArray *)v22;

        v24 = v6;
        goto LABEL_21;
    }
LABEL_19:
    v6->_fpMitigation = v10;
    goto LABEL_20;
  }
LABEL_21:

  return v6;
}

- (PTHandGesture)initWithType:(unsigned int)a3 chirality:(unsigned int)a4 boundingBox:(CGRect)a5 confidence:(id)a6 personID:(id)a7 handID:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  id v19;
  PTHandGesture *v20;
  PTHandGesture *v21;
  PTHandGesture *v22;
  objc_super v24;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PTHandGesture;
  v20 = -[PTHandGesture init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_type = 0;
    v20->_handChirality = a4;
    objc_storeStrong((id *)&v20->_confidence, a6);
    v21->_boundingBox.origin.x = x;
    v21->_boundingBox.origin.y = y;
    v21->_boundingBox.size.width = width;
    v21->_boundingBox.size.height = height;
    objc_storeStrong((id *)&v21->_personID, a7);
    objc_storeStrong((id *)&v21->_handID, a8);
    v22 = v21;
  }

  return v21;
}

+ (id)gestureTypeToString:(unsigned int)a3
{
  if (a3 > 9)
    return CFSTR("Undefined");
  else
    return off_1E822A858[a3];
}

- (unsigned)type
{
  return self->_type;
}

- (NSNumber)confidence
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)handChirality
{
  return self->_handChirality;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSNumber)personID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)handID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)handKeypoints
{
  return self->_handKeypoints;
}

- (unsigned)fpMitigation
{
  return self->_fpMitigation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handKeypoints, 0);
  objc_storeStrong((id *)&self->_handID, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
}

@end
