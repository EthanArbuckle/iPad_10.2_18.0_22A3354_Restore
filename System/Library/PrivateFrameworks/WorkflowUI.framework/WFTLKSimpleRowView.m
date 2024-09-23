@implementation WFTLKSimpleRowView

- (void)observedPropertiesChanged
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)WFTLKSimpleRowView;
  -[TLKSimpleRowView observedPropertiesChanged](&v35, sel_observedPropertiesChanged);
  -[TLKSimpleRowView leadingImage](self, "leadingImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[TLKSimpleRowView trailingImage](self, "trailingImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  -[TLKSimpleRowView leadingSubtitle](self, "leadingSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    -[TLKSimpleRowView trailingSubtitle](self, "trailingSubtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  -[TLKSimpleRowView leadingImage](self, "leadingImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;

  -[TLKSimpleRowView leadingImage](self, "leadingImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    -[TLKSimpleRowView leadingTitle](self, "leadingTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[TLKSimpleRowView trailingTitle](self, "trailingTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v13 = 0;
      }
      else
      {
        -[TLKSimpleRowView trailingSubtitle](self, "trailingSubtitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v13 = 0;
        }
        else
        {
          -[TLKSimpleRowView trailingImage](self, "trailingImage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "size");
          if (v19 == 29.0 && v18 == 29.0)
          {
            v13 = 1;
          }
          else
          {
            -[TLKSimpleRowView trailingImage](self, "trailingImage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "isTemplate"))
            {
              -[TLKSimpleRowView trailingImage](self, "trailingImage");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "size");
              if (v21 <= 29.0)
              {
                v13 = 1;
              }
              else
              {
                -[TLKSimpleRowView trailingImage](self, "trailingImage");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "size");
                v13 = v22 <= 29.0;

              }
            }
            else
            {
              v13 = 0;
            }

          }
        }

      }
    }
    else
    {
      v13 = 0;
    }

  }
  -[TLKSimpleRowView leadingTitle](self, "leadingTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[TLKSimpleRowView leadingSubtitle](self, "leadingSubtitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[TLKSimpleRowView trailingTitle](self, "trailingTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = 0;
      }
      else
      {
        -[TLKSimpleRowView trailingSubtitle](self, "trailingSubtitle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v26 = 0;
        }
        else
        {
          -[TLKSimpleRowView leadingImage](self, "leadingImage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            -[TLKSimpleRowView trailingImage](self, "trailingImage");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v11 <= 18.0 && v29 == 0;

          }
          else
          {
            v26 = 0;
          }

        }
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  if (!v13 && !v26 && !v7 && !v4)
  {
    objc_msgSend(MEMORY[0x24BEB4B90], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x24BEBE200], 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFont:", v31);

  }
}

@end
