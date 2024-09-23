@implementation PXStoryTVWatchNextCellConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  -[PXGFocusableViewConfiguration delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v5);

  -[PXGFocusEffectViewConfiguration cornerRadius](self, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");
  -[PXGFocusEffectViewConfiguration contentMotionRotation](self, "contentMotionRotation");
  objc_msgSend(v4, "setContentMotionRotation:");
  -[PXGFocusEffectViewConfiguration contentMotionTranslation](self, "contentMotionTranslation");
  objc_msgSend(v4, "setContentMotionTranslation:");
  -[PXGFocusEffectViewConfiguration focusedSizeIncrease](self, "focusedSizeIncrease");
  objc_msgSend(v4, "setFocusedSizeIncrease:");
  v6 = -[NSString copy](self->_title, "copy");
  v7 = v4[13];
  v4[13] = (id)v6;

  v8 = -[NSString copy](self->_subtitle, "copy");
  v9 = v4[14];
  v4[14] = (id)v8;

  objc_storeStrong(v4 + 12, self->_spec);
  v4[15] = (id)self->_countdownValue;
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryTVWatchNextCellConfiguration;
  v3 = -[PXGFocusEffectViewConfiguration hash](&v7, sel_hash);
  v4 = v3 ^ (2 * -[NSString hash](self->_title, "hash"));
  v5 = v4 ^ (4 * -[NSString hash](self->_subtitle, "hash"));
  return v5 ^ (8 * -[PXStoryTVCellSpec hash](self->_spec, "hash")) ^ (16 * self->_countdownValue);
}

- (BOOL)isEqual:(id)a3
{
  PXStoryTVWatchNextCellConfiguration *v4;
  PXStoryTVWatchNextCellConfiguration *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  id v10;
  id v11;
  int v12;
  id v13;
  id v14;
  int v15;
  int64_t v16;
  objc_super v18;

  v4 = (PXStoryTVWatchNextCellConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v18.receiver = self;
      v18.super_class = (Class)PXStoryTVWatchNextCellConfiguration;
      if (!-[PXGFocusEffectViewConfiguration isEqual:](&v18, sel_isEqual_, v5))
      {
        v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[PXStoryTVWatchNextCellConfiguration title](self, "title");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryTVWatchNextCellConfiguration title](v5, "title");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      -[PXStoryTVWatchNextCellConfiguration subtitle](self, "subtitle");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryTVWatchNextCellConfiguration subtitle](v5, "subtitle");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {

      }
      else
      {
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v12)
        {
          v9 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      -[PXStoryTVWatchNextCellConfiguration spec](self, "spec");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryTVWatchNextCellConfiguration spec](v5, "spec");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {

      }
      else
      {
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (!v15)
        {
          v9 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      v16 = -[PXStoryTVWatchNextCellConfiguration countdownValue](self, "countdownValue");
      v9 = v16 == -[PXStoryTVWatchNextCellConfiguration countdownValue](v5, "countdownValue");
      goto LABEL_20;
    }
    v9 = 0;
  }
LABEL_24:

  return v9;
}

- (PXStoryTVCellSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (int64_t)countdownValue
{
  return self->_countdownValue;
}

- (void)setCountdownValue:(int64_t)a3
{
  self->_countdownValue = a3;
}

- (int64_t)maximumCountdownValue
{
  return self->_maximumCountdownValue;
}

- (void)setMaximumCountdownValue:(int64_t)a3
{
  self->_maximumCountdownValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
