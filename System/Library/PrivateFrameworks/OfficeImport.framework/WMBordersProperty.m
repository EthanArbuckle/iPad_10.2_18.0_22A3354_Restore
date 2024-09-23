@implementation WMBordersProperty

- (WMBordersProperty)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WMBordersProperty;
  return -[CMBordersProperty init](&v3, sel_init);
}

- (void)setBorder:(id)a3 location:(int)a4
{
  int v6;
  int v7;
  unsigned int v8;
  int *mBorderWidth;
  int v10;
  double v11;
  void *v12;
  int v13;
  OITSUColor *v14;
  OITSUColor *mBorderColor;
  objc_class *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = objc_msgSend(v19, "style");
  v7 = 4;
  switch(v6)
  {
    case 0:
      self->super.mBorderStyle[a4] = 0;
      goto LABEL_26;
    case 1:
    case 2:
    case 4:
    case 5:
      goto LABEL_5;
    case 3:
      v7 = 2;
      goto LABEL_7;
    case 6:
      goto LABEL_7;
    case 7:
      goto LABEL_4;
    default:
      if (v6 == 22)
LABEL_4:
        v7 = 3;
      else
LABEL_5:
        v7 = 1;
LABEL_7:
      self->super.mBorderStyle[a4] = v7;
      v8 = objc_msgSend(v19, "width");
      if (self->super.mBorderStyle[a4] == 2)
        goto LABEL_8;
      v11 = (double)v8 / 20.0;
      if (v11 < 1.5)
      {
        mBorderWidth = self->super.mBorderWidth;
        v10 = 1;
        goto LABEL_11;
      }
      if (v11 < 2.5)
      {
LABEL_8:
        mBorderWidth = self->super.mBorderWidth;
        v10 = 2;
LABEL_11:
        mBorderWidth[a4] = v10;
        goto LABEL_12;
      }
      mBorderWidth = self->super.mBorderWidth;
      if (v11 < 3.5)
      {
        v10 = 3;
        goto LABEL_11;
      }
      mBorderWidth[a4] = 4;
      self->super.mBorderWidth[a4 + 6] = (int)v11;
LABEL_12:
      if (!self->super.mBorderColor)
      {
        objc_msgSend(v19, "color");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isBlack");

        if (v13)
        {
          +[OITSUColor blackColor](OITSUColor, "blackColor");
          v14 = (OITSUColor *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          mBorderColor = self->super.mBorderColor;
          self->super.mBorderColor = v14;

        }
        else
        {
          switch(a4)
          {
            case 1:
              objc_msgSend(v19, "color");
              v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v17 = 24;
              break;
            case 2:
              objc_msgSend(v19, "color");
              v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v17 = 32;
              break;
            case 3:
              objc_msgSend(v19, "color");
              v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v17 = 40;
              break;
            case 4:
              objc_msgSend(v19, "color");
              v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v17 = 48;
              break;
            default:
              objc_msgSend(v19, "color");
              v14 = (OITSUColor *)objc_claimAutoreleasedReturnValue();
              goto LABEL_15;
          }
          v18 = *(Class *)((char *)&self->super.super.super.isa + v17);
          *(Class *)((char *)&self->super.super.super.isa + v17) = v16;

        }
      }
LABEL_26:

      return;
  }
}

@end
