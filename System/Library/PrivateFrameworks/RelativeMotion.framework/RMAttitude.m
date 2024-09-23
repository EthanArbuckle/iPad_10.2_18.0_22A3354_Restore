@implementation RMAttitude

- (id)_initWithQuaternion:(id)a3 timestamp:(double)a4
{
  double var3;
  double var2;
  double var1;
  double var0;
  id result;
  objc_super v9;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v9.receiver = self;
  v9.super_class = (Class)RMAttitude;
  result = -[RMLogItem _initWithTimestamp:](&v9, sel__initWithTimestamp_, a4);
  if (result)
  {
    *((double *)result + 2) = var0;
    *((double *)result + 3) = var1;
    *((double *)result + 4) = var2;
    *((double *)result + 5) = var3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMAttitude)initWithCoder:(id)a3
{
  id v4;
  RMAttitude *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMAttitude;
  v5 = -[RMLogItem initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kRMAttitudeCodingKeyQuaternionX"));
    v5->_quaternion.x = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kRMAttitudeCodingKeyQuaternionY"));
    v5->_quaternion.y = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kRMAttitudeCodingKeyQuaternionZ"));
    v5->_quaternion.z = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kRMAttitudeCodingKeyQuaternionW"));
    v5->_quaternion.w = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double *v3;
  id v4;
  objc_super v5;

  v3 = (double *)self;
  v5.receiver = self;
  v5.super_class = (Class)RMAttitude;
  v4 = a3;
  -[RMLogItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  v3 += 2;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kRMAttitudeCodingKeyQuaternionX"), *v3, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kRMAttitudeCodingKeyQuaternionY"), v3[1]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kRMAttitudeCodingKeyQuaternionZ"), v3[2]);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kRMAttitudeCodingKeyQuaternionW"), v3[3]);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RMLogItem timestamp](self, "timestamp");
  v5 = objc_msgSend(v4, "_initWithTimestamp:");
  v6 = (_QWORD *)v5;
  if (v5)
  {
    v7 = (_QWORD *)(v5 + 16);
    -[RMAttitude quaternion](self, "quaternion");
    *v7 = v8;
    v6[3] = v9;
    v6[4] = v10;
    v6[5] = v11;
  }
  return v6;
}

- (id)description
{
  void *v2;
  double z;
  double w;
  uint64_t v5;
  __int128 v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v7 = *(_OWORD *)&self->_quaternion.x;
  z = self->_quaternion.z;
  w = self->_quaternion.w;
  -[RMLogItem timestamp](self, "timestamp");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("Quaternion: <%f,%f,%f,%f> Timestamp %f"), v7, *(_QWORD *)&z, *(_QWORD *)&w, v5);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)quaternion
{
  double x;
  double y;
  double z;
  double w;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  x = self->_quaternion.x;
  y = self->_quaternion.y;
  z = self->_quaternion.z;
  w = self->_quaternion.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

@end
