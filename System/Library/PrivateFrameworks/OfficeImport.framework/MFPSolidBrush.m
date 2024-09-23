@implementation MFPSolidBrush

- (MFPSolidBrush)initWithColor:(id)a3
{
  id v5;
  MFPSolidBrush *v6;
  MFPSolidBrush *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPSolidBrush;
  v6 = -[MFPSolidBrush init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mColor, a3);

  return v7;
}

- (id)color
{
  return self->mColor;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (void)fillPath:(id)a3
{
  id v4;

  v4 = a3;
  -[OITSUColor set](self->mColor, "set");
  objc_msgSend(v4, "fill");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
