@implementation PMLMutableDenseVector

- (float)mutablePtr
{
  return (float *)-[NSMutableData bytes](self->super._data, "bytes");
}

- (PMLMutableDenseVector)initWithMutableData:(id)a3
{
  id v5;
  PMLMutableDenseVector *v6;
  PMLMutableDenseVector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLMutableDenseVector;
  v6 = -[PMLDenseVector init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->super._data, a3);

  return v7;
}

- (void)append:(float)a3
{
  float v3;

  v3 = a3;
  -[NSMutableData appendBytes:length:](self->super._data, "appendBytes:length:", &v3, 4);
}

- (void)append:(const float *)a3 count:(unint64_t)a4
{
  -[NSMutableData appendBytes:length:](self->super._data, "appendBytes:length:", a3, 4 * a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PMLDenseVector initWithData:](+[PMLDenseVector allocWithZone:](PMLDenseVector, "allocWithZone:", a3), "initWithData:", self->super._data);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PMLDenseVector initWithData:](+[PMLMutableDenseVector allocWithZone:](PMLMutableDenseVector, "allocWithZone:", a3), "initWithData:", self->super._data);
}

- (void)processValuesInPlaceWithBlock:(id)a3
{
  PMLMutableDenseVector *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  float (**v9)(id, _QWORD, float);

  v9 = (float (**)(id, _QWORD, float))a3;
  v4 = objc_retainAutorelease(self);
  v5 = -[PMLMutableDenseVector mutablePtr](v4, "mutablePtr");
  v6 = -[PMLDenseVector count](v4, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      *(float *)(v5 + 4 * i) = v9[2](v9, i, *(float *)(v5 + 4 * i));
  }

}

- (void)scaleInPlaceWithInversedFactor:(float)a3
{
  if (a3 > 0.0)
    cblas_sscal(-[PMLDenseVector count](self, "count"), 1.0 / a3, -[PMLMutableDenseVector mutablePtr](objc_retainAutorelease(self), "mutablePtr"), 1);
}

- (void)scaleInPlaceWithFactor:(float)a3
{
  cblas_sscal(-[PMLDenseVector count](self, "count"), a3, -[PMLMutableDenseVector mutablePtr](objc_retainAutorelease(self), "mutablePtr"), 1);
}

- (void)sumInPlaceWithVector:(id)a3
{
  id v4;
  int v5;
  id v6;
  const float *v7;

  v4 = a3;
  v5 = -[PMLDenseVector count](self, "count");
  v6 = objc_retainAutorelease(v4);
  v7 = (const float *)objc_msgSend(v6, "ptr");

  cblas_saxpy(v5, 1.0, v7, 1, -[PMLMutableDenseVector mutablePtr](objc_retainAutorelease(self), "mutablePtr"), 1);
}

- (NSMutableData)mutableData
{
  return self->_mutableData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableData, 0);
}

@end
