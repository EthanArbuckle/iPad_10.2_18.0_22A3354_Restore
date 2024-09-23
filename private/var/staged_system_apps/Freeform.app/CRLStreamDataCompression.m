@implementation CRLStreamDataCompression

- (CRLStreamDataCompression)initWithAlgorithm:(int)a3 operation:(int)a4
{
  CRLStreamDataCompression *v4;
  CRLStreamDataCompression *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLStreamDataCompression;
  v4 = -[CRLStreamCompression initWithAlgorithm:operation:](&v8, "initWithAlgorithm:operation:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_outputData, &_dispatch_data_empty);
    v7.receiver = v5;
    v7.super_class = (Class)CRLStreamDataCompression;
    -[CRLStreamCompression setHandler:](&v7, "setHandler:", &stru_10124BDD8);
  }
  return v5;
}

- (BOOL)handleData:(id)a3 isDone:(BOOL)a4
{
  OS_dispatch_data *concat;
  OS_dispatch_data *outputData;

  concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_outputData, (dispatch_data_t)a3);
  outputData = self->_outputData;
  self->_outputData = concat;

  return 1;
}

- (void)setHandler:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = sub_1002A9BA8;
  v6[3] = &unk_10124BE00;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRLStreamDataCompression;
  v6[0] = _NSConcreteStackBlock;
  v4 = v7;
  -[CRLStreamCompression setHandler:](&v5, "setHandler:", v6);

}

- (OS_dispatch_data)outputData
{
  return self->_outputData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputData, 0);
}

@end
