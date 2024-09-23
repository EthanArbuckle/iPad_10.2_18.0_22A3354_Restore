@implementation MFPPath

- (MFPPath)initWithPath:(id)a3
{
  id v5;
  MFPPath *v6;
  MFPPath *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPPath;
  v6 = -[MFPPath init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mPath, a3);

  return v7;
}

- (void)dealloc
{
  OITSUBezierPath *mPath;
  objc_super v4;

  mPath = self->mPath;
  self->mPath = 0;

  v4.receiver = self;
  v4.super_class = (Class)MFPPath;
  -[MFPPath dealloc](&v4, sel_dealloc);
}

- (id)path
{
  return self->mPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPath, 0);
}

@end
