@implementation RMPose

- (id)_initWithAttitude:(id)a3 consumedAuxTimestamp:(double)a4 receivedAuxTimestamp:(double)a5 machAbsTimestamp:(double)a6
{
  id v11;
  id *v12;
  double *v13;
  objc_super v15;

  v11 = a3;
  objc_msgSend(v11, "timestamp");
  v15.receiver = self;
  v15.super_class = (Class)RMPose;
  v12 = -[RMLogItem _initWithTimestamp:](&v15, sel__initWithTimestamp_);
  v13 = (double *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 2, a3);
    v13[3] = a4;
    v13[4] = a5;
    v13[5] = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMPose)initWithCoder:(id)a3
{
  id v4;
  RMPose *v5;
  uint64_t v6;
  RMAttitude *attitude;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMPose;
  v5 = -[RMLogItem initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RMPoseEncodingKeyAttitude"));
    v6 = objc_claimAutoreleasedReturnValue();
    attitude = v5->_attitude;
    v5->_attitude = (RMAttitude *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RMPoseEncodingKeyConsumedAuxTimestamp"));
    v5->_consumedAuxTimestamp = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RMPoseEncodingKeyReceivedAuxTimestamp"));
    v5->_receivedAuxTimestamp = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RMPoseEncodingKeyMachAbsTimestamp"));
    v5->_machAbsTimestamp = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMPose;
  v4 = a3;
  -[RMLogItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_attitude, CFSTR("RMPoseEncodingKeyAttitude"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("RMPoseEncodingKeyConsumedAuxTimestamp"), self->_consumedAuxTimestamp);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("RMPoseEncodingKeyReceivedAuxTimestamp"), self->_receivedAuxTimestamp);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("RMPoseEncodingKeyMachAbsTimestamp"), self->_machAbsTimestamp);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RMLogItem timestamp](self, "timestamp");
  v5 = (_QWORD *)objc_msgSend(v4, "_initWithTimestamp:");
  if (v5)
  {
    -[RMPose attitude](self, "attitude");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[2];
    v5[2] = v6;

    -[RMPose consumedAuxTimestamp](self, "consumedAuxTimestamp");
    v5[3] = v8;
    -[RMPose receivedAuxTimestamp](self, "receivedAuxTimestamp");
    v5[4] = v9;
    -[RMPose machAbsTimestamp](self, "machAbsTimestamp");
    v5[5] = v10;
  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double consumedAuxTimestamp;
  double receivedAuxTimestamp;
  double machAbsTimestamp;
  uint64_t v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[RMAttitude quaternion](self->_attitude, "quaternion");
  v5 = v4;
  -[RMAttitude quaternion](self->_attitude, "quaternion");
  v7 = v6;
  -[RMAttitude quaternion](self->_attitude, "quaternion");
  v9 = v8;
  -[RMAttitude quaternion](self->_attitude, "quaternion");
  v11 = v10;
  consumedAuxTimestamp = self->_consumedAuxTimestamp;
  receivedAuxTimestamp = self->_receivedAuxTimestamp;
  machAbsTimestamp = self->_machAbsTimestamp;
  -[RMLogItem timestamp](self, "timestamp");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("RMPose,q.x,%f,q.y,%f,q.z,%f,q.w,%f,consumedAuxTimestamp,%f,receivedAuxTimestamp,%f,machAbsTimestamp,%f,timestamp,%f"), v5, v7, v9, v11, *(_QWORD *)&consumedAuxTimestamp, *(_QWORD *)&receivedAuxTimestamp, *(_QWORD *)&machAbsTimestamp, v15);
}

- (RMAttitude)attitude
{
  return self->_attitude;
}

- (double)consumedAuxTimestamp
{
  return self->_consumedAuxTimestamp;
}

- (double)receivedAuxTimestamp
{
  return self->_receivedAuxTimestamp;
}

- (double)machAbsTimestamp
{
  return self->_machAbsTimestamp;
}

- (void)setMachAbsTimestamp:(double)a3
{
  self->_machAbsTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attitude, 0);
}

@end
