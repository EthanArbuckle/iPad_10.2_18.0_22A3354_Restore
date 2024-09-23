@implementation CMOdometry

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 rotationArbitraryToTrueNorth:(float)a13 staticFlag:(int64_t)a14 timestamp:(double)a15
{
  CMOdometry *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMOdometry;
  v22 = -[CMLogItem initWithTimestamp:](&v24, "initWithTimestamp:", a15);
  if (v22)
  {
    v22->_deltaPositionX = (NSNumber *)a3;
    v22->_deltaPositionY = (NSNumber *)a4;
    v22->_deltaPositionZ = (NSNumber *)a5;
    v22->_deltaVelocityX = (NSNumber *)a6;
    v22->_deltaVelocityY = (NSNumber *)a7;
    v22->_deltaVelocityZ = (NSNumber *)a8;
    v22->_quaternionX = (NSNumber *)a9;
    v22->_quaternionY = (NSNumber *)a10;
    v22->_quaternionZ = (NSNumber *)a11;
    v22->_quaternionW = (NSNumber *)a12;
    v22->_referenceFrame = 1;
    v22->_rotationArbitraryToTrueNorth = a13;
    v22->_staticFlag = a14;
  }
  return v22;
}

- (CMOdometry)initWithDeltaPositionX:(id)a3 deltaPositionY:(id)a4 deltaPositionZ:(id)a5 deltaVelocityX:(id)a6 deltaVelocityY:(id)a7 deltaVelocityZ:(id)a8 quaternionX:(id)a9 quaternionY:(id)a10 quaternionZ:(id)a11 quaternionW:(id)a12 timestamp:(double)a13
{
  double v13;

  v13 = a13;
  LODWORD(a13) = 0;
  return -[CMOdometry initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:](self, "initWithDeltaPositionX:deltaPositionY:deltaPositionZ:deltaVelocityX:deltaVelocityY:deltaVelocityZ:quaternionX:quaternionY:quaternionZ:quaternionW:rotationArbitraryToTrueNorth:staticFlag:timestamp:", a3, a4, a5, a6, a7, a8, a13, v13, a9, a10, a11, a12, 0);
}

- (void)rotateArbitraryToTrueNorth
{
  float rotationArbitraryToTrueNorth;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  float32x4_t v10;
  float32x4_t v11;
  id v12;
  double v13;
  id v14;
  double v15;
  id v16;
  double v17;
  id v18;
  double v19;
  NSNumber *deltaPositionX;
  __int32 v21;
  __int32 v22;
  unsigned int v23;
  id v24;
  double v25;
  id v26;
  double v27;
  NSNumber *deltaVelocityX;
  __int32 v29;
  __int32 v30;
  unsigned int v31;
  id v32;
  double v33;
  id v34;
  double v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  uint64_t v39;
  float v40;

  if (self->_referenceFrame == 1)
  {
    if (self->_quaternionX)
    {
      if (self->_quaternionY)
      {
        if (self->_quaternionZ)
        {
          if (self->_quaternionW)
          {
            rotationArbitraryToTrueNorth = self->_rotationArbitraryToTrueNorth;
            if (rotationArbitraryToTrueNorth != 0.0)
            {
              v39 = 0;
              v40 = rotationArbitraryToTrueNorth;
              -[NSNumber floatValue](self->_quaternionX, "floatValue", sub_100B61FD0(&v38, (float *)&v39));
              v5 = v4;
              -[NSNumber floatValue](self->_quaternionY, "floatValue");
              v7 = v6;
              -[NSNumber floatValue](self->_quaternionZ, "floatValue");
              v9 = v8;
              -[NSNumber floatValue](self->_quaternionW, "floatValue");
              v37.i64[0] = __PAIR64__(v7, v5);
              v37.i64[1] = __PAIR64__(v10.u32[0], v9);
              v11 = sub_10012C97C(&v37, v10);
              sub_100B61EC4((uint64_t)&v37, v38.f32, &v36, v11);
              v37 = v36;

              v12 = objc_alloc((Class)NSNumber);
              LODWORD(v13) = v37.i32[0];
              self->_quaternionX = (NSNumber *)objc_msgSend(v12, "initWithFloat:", v13);
              v14 = objc_alloc((Class)NSNumber);
              LODWORD(v15) = v37.i32[1];
              self->_quaternionY = (NSNumber *)objc_msgSend(v14, "initWithFloat:", v15);
              v16 = objc_alloc((Class)NSNumber);
              LODWORD(v17) = v37.i32[2];
              self->_quaternionZ = (NSNumber *)objc_msgSend(v16, "initWithFloat:", v17);
              v18 = objc_alloc((Class)NSNumber);
              LODWORD(v19) = v37.i32[3];
              self->_quaternionW = (NSNumber *)objc_msgSend(v18, "initWithFloat:", v19);
              deltaPositionX = self->_deltaPositionX;
              if (deltaPositionX && self->_deltaPositionY)
              {
                -[NSNumber floatValue](deltaPositionX, "floatValue");
                v22 = v21;
                -[NSNumber floatValue](self->_deltaPositionY, "floatValue");
                v36.i32[0] = v22;
                *(uint64_t *)((char *)v36.i64 + 4) = v23;
                sub_100B61F4C(v38.f32, (uint64_t)&v36);

                v24 = objc_alloc((Class)NSNumber);
                LODWORD(v25) = v36.i32[0];
                self->_deltaPositionX = (NSNumber *)objc_msgSend(v24, "initWithFloat:", v25);
                v26 = objc_alloc((Class)NSNumber);
                LODWORD(v27) = v36.i32[1];
                self->_deltaPositionY = (NSNumber *)objc_msgSend(v26, "initWithFloat:", v27);
              }
              else
              {

                self->_deltaPositionX = 0;
                self->_deltaPositionY = 0;
              }
              deltaVelocityX = self->_deltaVelocityX;
              if (deltaVelocityX && self->_deltaVelocityY)
              {
                -[NSNumber floatValue](deltaVelocityX, "floatValue");
                v30 = v29;
                -[NSNumber floatValue](self->_deltaVelocityY, "floatValue");
                v36.i32[0] = v30;
                *(uint64_t *)((char *)v36.i64 + 4) = v31;
                sub_100B61F4C(v38.f32, (uint64_t)&v36);

                v32 = objc_alloc((Class)NSNumber);
                LODWORD(v33) = v36.i32[0];
                self->_deltaVelocityX = (NSNumber *)objc_msgSend(v32, "initWithFloat:", v33);
                v34 = objc_alloc((Class)NSNumber);
                LODWORD(v35) = v36.i32[1];
                self->_deltaVelocityY = (NSNumber *)objc_msgSend(v34, "initWithFloat:", v35);
              }
              else
              {

                self->_deltaVelocityX = 0;
                self->_deltaVelocityY = 0;
              }
              self->_referenceFrame = 8;
            }
          }
        }
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOdometry)initWithCoder:(id)a3
{
  CMOdometry *v4;
  float v5;
  float v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMOdometry;
  v4 = -[CMLogItem initWithCoder:](&v8, "initWithCoder:");
  if (v4)
  {
    v4->_deltaPositionX = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyDeltaPositionX"));
    v4->_deltaPositionY = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyDeltaPositionY"));
    v4->_deltaPositionZ = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyDeltaPositionZ"));
    v4->_deltaVelocityX = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyDeltaVelocityX"));
    v4->_deltaVelocityY = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyDeltaVelocityY"));
    v4->_deltaVelocityZ = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyDeltaVelocityZ"));
    v4->_quaternionX = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyQuaternionX"));
    v4->_quaternionY = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyQuaternionY"));
    v4->_quaternionZ = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyQuaternionZ"));
    v4->_quaternionW = (NSNumber *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyQuaternionW"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("kCMOdometryCodingKeyReferenceFrame"));
    v4->_referenceFrame = (unint64_t)v5;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("kCMOdometryCodingKeyRotationArbitraryToTrueNort"));
    v4->_rotationArbitraryToTrueNorth = v6;
    v4->_staticFlag = (int64_t)objc_msgSend(objc_msgSend(a3, "decodeObjectForKey:", CFSTR("kCMOdometryCodingKeyStaticFlag")), "integerValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMOdometry;
  -[CMLogItem encodeWithCoder:](&v7, "encodeWithCoder:");
  objc_msgSend(a3, "encodeObject:forKey:", self->_deltaPositionX, CFSTR("kCMOdometryCodingKeyDeltaPositionX"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deltaPositionY, CFSTR("kCMOdometryCodingKeyDeltaPositionY"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deltaPositionZ, CFSTR("kCMOdometryCodingKeyDeltaPositionZ"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deltaVelocityX, CFSTR("kCMOdometryCodingKeyDeltaVelocityX"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deltaVelocityY, CFSTR("kCMOdometryCodingKeyDeltaVelocityY"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deltaVelocityZ, CFSTR("kCMOdometryCodingKeyDeltaVelocityZ"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_quaternionX, CFSTR("kCMOdometryCodingKeyQuaternionX"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_quaternionY, CFSTR("kCMOdometryCodingKeyQuaternionY"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_quaternionZ, CFSTR("kCMOdometryCodingKeyQuaternionZ"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_quaternionW, CFSTR("kCMOdometryCodingKeyQuaternionW"));
  *(float *)&v5 = (float)self->_referenceFrame;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("kCMOdometryCodingKeyReferenceFrame"), v5);
  *(float *)&v6 = self->_rotationArbitraryToTrueNorth;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("kCMOdometryCodingKeyRotationArbitraryToTrueNort"), v6);
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_staticFlag), CFSTR("kCMOdometryCodingKeyStaticFlag"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMOdometry;
  -[CMLogItem dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMOdometry;
  v5 = -[CMLogItem copyWithZone:](&v7, "copyWithZone:");
  if (v5)
  {
    v5[3] = -[NSNumber copyWithZone:](self->_deltaPositionX, "copyWithZone:", a3);
    v5[4] = -[NSNumber copyWithZone:](self->_deltaPositionY, "copyWithZone:", a3);
    v5[5] = -[NSNumber copyWithZone:](self->_deltaPositionZ, "copyWithZone:", a3);
    v5[6] = -[NSNumber copyWithZone:](self->_deltaVelocityX, "copyWithZone:", a3);
    v5[7] = -[NSNumber copyWithZone:](self->_deltaVelocityY, "copyWithZone:", a3);
    v5[8] = -[NSNumber copyWithZone:](self->_deltaVelocityZ, "copyWithZone:", a3);
    v5[9] = -[NSNumber copyWithZone:](self->_quaternionX, "copyWithZone:", a3);
    v5[10] = -[NSNumber copyWithZone:](self->_quaternionY, "copyWithZone:", a3);
    v5[11] = -[NSNumber copyWithZone:](self->_quaternionZ, "copyWithZone:", a3);
    v5[12] = -[NSNumber copyWithZone:](self->_quaternionW, "copyWithZone:", a3);
    v5[13] = self->_referenceFrame;
    *((_DWORD *)v5 + 4) = LODWORD(self->_rotationArbitraryToTrueNorth);
    v5[14] = self->_staticFlag;
  }
  return v5;
}

- (id)description
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMOdometry;
  -[CMLogItem timestamp](&v4, "timestamp");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timestamp, %@, DeltaPositionXYZ, %@, %@, %@, DeltaVelocityXYZ, %@, %@, %@, QuaternionXYZW, %@, %@, %@, %@, ReferenceFrame, %d, StaticFlag, %d"), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), self->_deltaPositionX, self->_deltaPositionY, self->_deltaPositionZ, self->_deltaVelocityX, self->_deltaVelocityY, self->_deltaVelocityZ, self->_quaternionX, self->_quaternionY, self->_quaternionZ, self->_quaternionW, self->_referenceFrame, self->_staticFlag);
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (NSNumber)deltaVelocityX
{
  return self->_deltaVelocityX;
}

- (NSNumber)deltaVelocityY
{
  return self->_deltaVelocityY;
}

- (NSNumber)deltaVelocityZ
{
  return self->_deltaVelocityZ;
}

- (NSNumber)quaternionX
{
  return self->_quaternionX;
}

- (NSNumber)quaternionY
{
  return self->_quaternionY;
}

- (NSNumber)quaternionZ
{
  return self->_quaternionZ;
}

- (NSNumber)quaternionW
{
  return self->_quaternionW;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (int64_t)staticFlag
{
  return self->_staticFlag;
}

@end
