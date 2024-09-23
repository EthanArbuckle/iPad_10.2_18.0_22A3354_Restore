@implementation MFPhoneBrush

- (void)setPolyFillMode:(id)a3 in_path:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = objc_msgSend(v8, "getPolyFillMode");
  if (v6 == 1)
  {
    v7 = 1;
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    v7 = 0;
LABEL_5:
    objc_msgSend(v5, "setWindingRule:", v7);
  }

}

- (BOOL)fillWithROP:(id)a3 in_path:(id)a4
{
  id v5;
  id v6;
  int v7;
  BOOL v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = +[MFPhoneDeviceDriver getROP:](MFPhoneDeviceDriver, "getROP:", v5);
  if (!v7)
  {
    +[OITSUColor blackColor](OITSUColor, "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set");
LABEL_6:

    objc_msgSend(v6, "fill");
    v8 = 1;
    goto LABEL_7;
  }
  if (v7 == 1)
  {
    +[OITSUColor whiteColor](OITSUColor, "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set");
    goto LABEL_6;
  }
  v8 = v7 == 3;
LABEL_7:

  return v8;
}

@end
