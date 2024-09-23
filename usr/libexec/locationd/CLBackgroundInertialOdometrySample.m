@implementation CLBackgroundInertialOdometrySample

- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 sampleInterval:(double)a4 CMOdometry:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;

  if (objc_msgSend(a5, "deltaPositionX") && objc_msgSend(a5, "deltaPositionY") && objc_msgSend(a5, "deltaPositionZ"))
  {
    v8 = objc_alloc((Class)CLBIO_DeltaPosition);
    objc_msgSend(objc_msgSend(a5, "deltaPositionX"), "doubleValue");
    v10 = v9;
    objc_msgSend(objc_msgSend(a5, "deltaPositionY"), "doubleValue");
    v12 = v11;
    objc_msgSend(objc_msgSend(a5, "deltaPositionZ"), "doubleValue");
    v14 = objc_msgSend(v8, "initWithX:Y:Z:", v10, v12, v13);
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(a5, "deltaVelocityX") && objc_msgSend(a5, "deltaVelocityY") && objc_msgSend(a5, "deltaVelocityZ"))
  {
    v15 = objc_alloc((Class)CLBIO_DeltaVelocity);
    objc_msgSend(objc_msgSend(a5, "deltaVelocityX"), "doubleValue");
    v17 = v16;
    objc_msgSend(objc_msgSend(a5, "deltaVelocityY"), "doubleValue");
    v19 = v18;
    objc_msgSend(objc_msgSend(a5, "deltaVelocityZ"), "doubleValue");
    v21 = objc_msgSend(v15, "initWithX:Y:Z:", v17, v19, v20);
  }
  else
  {
    v21 = 0;
  }
  if (objc_msgSend(a5, "quaternionX")
    && objc_msgSend(a5, "quaternionY")
    && objc_msgSend(a5, "quaternionZ")
    && objc_msgSend(a5, "quaternionW"))
  {
    v22 = objc_alloc((Class)CLBIO_Quaternion);
    objc_msgSend(objc_msgSend(a5, "quaternionX"), "doubleValue");
    v24 = v23;
    objc_msgSend(objc_msgSend(a5, "quaternionY"), "doubleValue");
    v26 = v25;
    objc_msgSend(objc_msgSend(a5, "quaternionZ"), "doubleValue");
    v28 = v27;
    objc_msgSend(objc_msgSend(a5, "quaternionW"), "doubleValue");
    v30 = objc_msgSend(v22, "initWithX:Y:Z:W:", v24, v26, v28, v29);
  }
  else
  {
    v30 = 0;
  }
  v31 = objc_msgSend(a5, "referenceFrame");
  v32 = objc_msgSend(a5, "staticFlag");
  if (v32 == (id)1)
    v33 = 1;
  else
    v33 = 2 * (v32 == (id)2);
  if (v31 == (id)1)
    v34 = 1;
  else
    v34 = 8;
  objc_msgSend(a5, "timestamp");
  return -[CLBackgroundInertialOdometrySample initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:](self, "initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:", a3, v14, v21, v30, 0, v34, v33);
}

- (id)initWithCLPIOSample:(CLPIOSample *)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int var15;
  uint64_t v10;

  if (a3->var16)
    v5 = objc_msgSend(objc_alloc((Class)CLBIO_DeltaPosition), "initWithX:Y:Z:", a3->var3, a3->var4, a3->var5);
  else
    v5 = 0;
  if (a3->var17)
    v6 = objc_msgSend(objc_alloc((Class)CLBIO_DeltaVelocity), "initWithX:Y:Z:", a3->var6, a3->var7, a3->var8);
  else
    v6 = 0;
  if (a3->var18)
    v7 = objc_msgSend(objc_alloc((Class)CLBIO_Quaternion), "initWithX:Y:Z:W:", a3->var9, a3->var10, a3->var11, a3->var12);
  else
    v7 = 0;
  if (a3->var14 == 8)
    v8 = 8;
  else
    v8 = 1;
  var15 = a3->var15;
  if (var15 == 2)
    v10 = 2;
  else
    v10 = var15 == 1;
  return -[CLBackgroundInertialOdometrySample initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:](self, "initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:", objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", a3->var0), v5, v6, v7, a3->var13 == 1, v8, a3->var1, a3->var2, v10);
}

@end
