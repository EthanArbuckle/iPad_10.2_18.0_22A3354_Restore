@implementation SMFenceInfo

- (SMFenceInfo)initWithDate:(id)a3 fenceRadius:(double)a4
{
  id v7;
  SMFenceInfo *v8;
  SMFenceInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMFenceInfo;
  v8 = -[SMFenceInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_date, a3);
    v9->_fenceRadius = a4;
  }

  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (double)fenceRadius
{
  return self->_fenceRadius;
}

- (void)setFenceRadius:(double)a3
{
  self->_fenceRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
