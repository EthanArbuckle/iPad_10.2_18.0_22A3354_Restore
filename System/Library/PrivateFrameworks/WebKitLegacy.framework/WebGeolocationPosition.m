@implementation WebGeolocationPosition

- (WebGeolocationPosition)initWithTimestamp:(double)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6
{
  WebGeolocationPosition *v10;
  _QWORD v12[4];
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)WebGeolocationPosition;
  v10 = -[WebGeolocationPosition init](&v23, sel_init);
  if (v10)
  {
    *(double *)v12 = a3;
    *(double *)&v12[1] = a4;
    *(double *)&v12[2] = a5;
    *(double *)&v12[3] = a6;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v10->_internal = -[WebGeolocationPositionInternal initWithCoreGeolocationPosition:]([WebGeolocationPositionInternal alloc], "initWithCoreGeolocationPosition:", v12);
  }
  return v10;
}

- (WebGeolocationPosition)initWithGeolocationPosition:(void *)a3
{
  WebGeolocationPosition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebGeolocationPosition;
  v4 = -[WebGeolocationPosition init](&v6, sel_init);
  if (v4)
    v4->_internal = -[WebGeolocationPositionInternal initWithCoreGeolocationPosition:]([WebGeolocationPositionInternal alloc], "initWithCoreGeolocationPosition:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebGeolocationPosition;
  -[WebGeolocationPosition dealloc](&v3, sel_dealloc);
}

@end
