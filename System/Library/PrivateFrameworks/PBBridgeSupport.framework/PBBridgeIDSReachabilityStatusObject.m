@implementation PBBridgeIDSReachabilityStatusObject

- (unint64_t)hash
{
  return -[NSUUID hash](self->_idsDeviceID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (v4)
    v5 = -[NSUUID isEqual:](self->_idsDeviceID, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBBridgeIDSReachabilityStatusObject *v4;

  v4 = -[PBBridgeIDSReachabilityStatusObject init](+[PBBridgeIDSReachabilityStatusObject allocWithZone:](PBBridgeIDSReachabilityStatusObject, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_idsDeviceID, self->_idsDeviceID);
  v4->_reachability = self->_reachability;
  return v4;
}

- (id)description
{
  void *v2;
  NSUUID *idsDeviceID;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  idsDeviceID = self->_idsDeviceID;
  objc_msgSend((id)objc_opt_class(), "connectivityString:", self->_reachability);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s: idsID=%@ connectivity=%@"), "-[PBBridgeIDSReachabilityStatusObject description]", idsDeviceID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)connectivityString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("unknown enum value");
  else
    return off_24CBBE8A0[a3];
}

- (NSUUID)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_idsDeviceID, a3);
}

- (unint64_t)reachability
{
  return self->_reachability;
}

- (void)setReachability:(unint64_t)a3
{
  self->_reachability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
}

@end
