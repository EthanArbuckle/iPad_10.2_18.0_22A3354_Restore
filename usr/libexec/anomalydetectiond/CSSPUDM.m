@implementation CSSPUDM

- (CSSPUDM)initWithTimestamp:(unint64_t)a3 quaternion:(const float *)a4 rate:(const float *)a5
{
  CSSPUDM *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSSPUDM;
  result = -[CSSPUDM init](&v9, "init");
  if (result)
  {
    *(_QWORD *)(&result->_c_struct.status + 1) = a3;
    result->_c_struct.quaternion[0] = *a4;
    result->_c_struct.quaternion[1] = a4[1];
    result->_c_struct.quaternion[2] = a4[2];
    result->_c_struct.quaternion[3] = a4[3];
    result->_c_struct.rotation[0] = *a5;
    result->_c_struct.rotation[1] = a5[1];
    result->_c_struct.rotation[2] = a5[2];
  }
  return result;
}

- (CSSPUDM)initWithTimestamp:(unint64_t)a3 quaternion:(const float *)a4 rate:(const float *)a5 userAccel:(const float *)a6
{
  CSSPUDM *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSSPUDM;
  result = -[CSSPUDM init](&v11, "init");
  if (result)
  {
    *(_QWORD *)(&result->_c_struct.status + 1) = a3;
    result->_c_struct.quaternion[0] = *a4;
    result->_c_struct.quaternion[1] = a4[1];
    result->_c_struct.quaternion[2] = a4[2];
    result->_c_struct.quaternion[3] = a4[3];
    result->_c_struct.rotation[0] = *a5;
    result->_c_struct.rotation[1] = a5[1];
    result->_c_struct.rotation[2] = a5[2];
    result->_c_struct.userAccel[0] = *a6;
    result->_c_struct.userAccel[1] = a6[1];
    result->_c_struct.userAccel[2] = a6[2];
  }
  return result;
}

- (unint64_t)timestamp
{
  return *(_QWORD *)(&self->_c_struct.status + 1);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)(&self->_c_struct.status + 1) = a3;
}

- (DMSample)c_struct
{
  return &self->_c_struct;
}

@end
