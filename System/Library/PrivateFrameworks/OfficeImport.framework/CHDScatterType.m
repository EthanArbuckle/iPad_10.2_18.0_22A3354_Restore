@implementation CHDScatterType

- (int)defaultLabelPosition
{
  CHDDataLabel *mDefaultDataLabel;

  mDefaultDataLabel = self->super.mDefaultDataLabel;
  if (mDefaultDataLabel && -[CHDDataLabel position](mDefaultDataLabel, "position"))
    return -[CHDDataLabel position](self->super.mDefaultDataLabel, "position");
  else
    return 6;
}

- (BOOL)isSmoothType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  char v7;
  int v8;

  -[CHDChartType seriesCollection](self, "seriesCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(v2, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = 2;
        goto LABEL_9;
      }
      v6 = v5;
      v7 = objc_msgSend(v6, "isSmooth");

      if ((v7 & 1) != 0)
        break;

      if (v3 == ++v4)
        goto LABEL_6;
    }
    v8 = 1;
LABEL_9:

  }
  else
  {
LABEL_6:
    v8 = 2;
  }

  return v8 != 2;
}

@end
