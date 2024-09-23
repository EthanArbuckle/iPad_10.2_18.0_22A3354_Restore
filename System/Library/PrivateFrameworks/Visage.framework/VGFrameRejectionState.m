@implementation VGFrameRejectionState

+ (unint64_t)parseInternalRejection:(int)a3
{
  if (a3 > 0x2A)
    return 1;
  else
    return qword_249D3AB10[a3];
}

- (id)initFromInternalRejectionState:(FrameRejectionState *)a3
{
  VGFrameRejectionState *v4;
  VGFrameRejectionState *v5;
  VGFrameRejectionState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VGFrameRejectionState;
  v4 = -[VGFrameRejectionState init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_internal.reason = a3->reason;
    objc_storeStrong((id *)&v4->_internal.description, a3->description);
    *(_QWORD *)&v5->_internal.outOfFovOffset = *(_QWORD *)&a3->outOfFovOffset;
    objc_storeStrong((id *)&v5->_internal.debugDictionary, a3->debugDictionary);
    v6 = v5;
  }

  return v5;
}

- (unint64_t)reason
{
  return +[VGFrameRejectionState parseInternalRejection:](VGFrameRejectionState, "parseInternalRejection:", self->_internal.reason);
}

- (NSString)description
{
  return self->_internal.description;
}

- (float)outOfFovOffset
{
  return self->_internal.outOfFovOffset;
}

- (float)outOfDistanceRangeOffset
{
  return self->_internal.outOfDistanceRangeOffset;
}

- (NSDictionary)debugDictionary
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGFrameRejectionState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  VGFrameRejectionState *v17;
  int v19;
  id v20;
  int v21;
  int v22;
  id v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("reason"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("outOfFovOffset"));
  v9 = v8;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("outOfDistanceRangeOffset"));
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("debugDictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v6;
  v14 = v7;
  v20 = v14;
  v21 = v9;
  v22 = v11;
  v15 = v13;
  v16 = v15;
  v23 = v15;
  if (self)
  {
    v17 = -[VGFrameRejectionState initFromInternalRejectionState:](self, "initFromInternalRejectionState:", &v19);
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt:forKey:", self->_internal.reason, CFSTR("reason"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_internal.description, CFSTR("description"));
  *(float *)&v4 = self->_internal.outOfFovOffset;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("outOfFovOffset"), v4);
  *(float *)&v5 = self->_internal.outOfDistanceRangeOffset;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("outOfDistanceRangeOffset"), v5);
  objc_msgSend(v6, "encodeObject:forKey:", self->_internal.debugDictionary, CFSTR("debugDictionary"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *description;
  NSDictionary *debugDictionary;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_internal.reason == *((_DWORD *)v5 + 2)
      && ((description = self->_internal.description, !((unint64_t)description | v5[2]))
       || -[NSString isEqual:](description, "isEqual:"))
      && self->_internal.outOfFovOffset == *((float *)v5 + 6)
      && self->_internal.outOfDistanceRangeOffset == *((float *)v5 + 7))
    {
      debugDictionary = self->_internal.debugDictionary;
      if ((unint64_t)debugDictionary | v5[4])
        v8 = -[NSDictionary isEqualToDictionary:](debugDictionary, "isEqualToDictionary:");
      else
        v8 = 1;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FrameRejectionState)internal
{
  NSString *v5;
  uint64_t v6;
  NSDictionary *debugDictionary;
  FrameRejectionState *result;

  retstr->reason = self->_internal.reason;
  v5 = self->_internal.description;
  v6 = *(_QWORD *)&self->_internal.outOfFovOffset;
  debugDictionary = self->_internal.debugDictionary;
  retstr->description = v5;
  *(_QWORD *)&retstr->outOfFovOffset = v6;
  result = debugDictionary;
  retstr->debugDictionary = (NSDictionary *)result;
  return result;
}

- (void)setInternal:(FrameRejectionState *)a3
{
  self->_internal.reason = a3->reason;
  objc_storeStrong((id *)&self->_internal.description, a3->description);
  *(_QWORD *)&self->_internal.outOfFovOffset = *(_QWORD *)&a3->outOfFovOffset;
  objc_storeStrong((id *)&self->_internal.debugDictionary, a3->debugDictionary);

}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
