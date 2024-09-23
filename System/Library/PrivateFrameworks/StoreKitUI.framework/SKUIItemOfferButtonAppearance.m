@implementation SKUIItemOfferButtonAppearance

- (SKUIItemOfferButtonAppearance)initWithColorScheme:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    if (v4)
      goto LABEL_5;
LABEL_11:
    v5 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[SKUIItemOfferButtonAppearance initWithColorScheme:].cold.1();
  if (!v4)
    goto LABEL_11;
LABEL_5:
  v14.receiver = self;
  v14.super_class = (Class)SKUIItemOfferButtonAppearance;
  v5 = -[SKUIItemOfferButtonAppearance init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "secondaryTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    switch(objc_msgSend(v4, "schemeStyle"))
    {
      case 0:
      case 2:
        v8 = (void *)MEMORY[0x1E0DC3658];
        v9 = 0.0980392157;
        v10 = 0.670588235;
        v11 = 0.125490196;
        goto LABEL_9;
      case 1:
      case 3:
        v8 = (void *)MEMORY[0x1E0DC3658];
        v9 = 0.2;
        v10 = 0.792156863;
        v11 = 0.231372549;
LABEL_9:
        objc_msgSend(v8, "colorWithRed:green:blue:alpha:", v9, v10, v11, 1.0);
        v12 = objc_claimAutoreleasedReturnValue();
        self = (SKUIItemOfferButtonAppearance *)*((_QWORD *)v5 + 2);
        *((_QWORD *)v5 + 2) = v12;
        goto LABEL_12;
      default:
        break;
    }
  }
LABEL_13:

  return (SKUIItemOfferButtonAppearance *)v5;
}

- (UIColor)buttonColor
{
  return self->_buttonColor;
}

- (UIColor)confirmationColor
{
  return self->_confirmationColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationColor, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
}

- (void)initWithColorScheme:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIItemOfferButtonAppearance initWithColorScheme:]";
}

@end
