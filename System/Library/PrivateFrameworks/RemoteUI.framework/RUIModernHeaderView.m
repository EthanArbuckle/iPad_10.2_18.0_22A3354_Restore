@implementation RUIModernHeaderView

- (RUIModernHeaderView)initWithTitle:(id)a3
{
  return -[RUIModernHeaderView initWithTitle:detailText:icon:](self, "initWithTitle:detailText:icon:", a3, 0, 0);
}

- (RUIModernHeaderView)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v9;
  RUIModernHeaderView *v10;
  RUIModernHeaderView *v11;
  void *v12;
  double v13;
  objc_super v15;
  objc_super v16;

  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RUIModernHeaderView;
  v10 = -[RUIModernHeaderView initWithTitle:detailText:icon:](&v16, sel_initWithTitle_detailText_icon_, a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    -[RUIModernHeaderView headerLabel](v10, "headerLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 0;
    objc_msgSend(v12, "_setHyphenationFactor:", v13);

    objc_storeStrong((id *)&v11->_detailText, a4);
    v11->_iconHeight = 60.0;
    v15.receiver = v11;
    v15.super_class = (Class)RUIModernHeaderView;
    -[RUIModernHeaderView setAllowFullWidthIcon:](&v15, sel_setAllowFullWidthIcon_, 1);
  }

  return v11;
}

- (void)setImageSize:(CGSize)a3
{
  -[RUIModernHeaderView setIconHeight:](self, "setIconHeight:", a3.height);
}

- (double)topPadding
{
  return 10.0;
}

- (double)iconToHeaderLabelPadding
{
  return 10.0;
}

- (double)bottomPadding
{
  return 0.0;
}

- (RUIModernHeaderView)initWithAttributes:(id)a3
{
  return -[RUIModernHeaderView initWithTitle:](self, "initWithTitle:", &stru_24C29B280);
}

- (double)headerHeightForWidth:(double)a3 inView:(id)a4
{
  double v4;

  -[RUIModernHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a4, *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  return v4;
}

- (void)setText:(id)a3 attributes:(id)a4
{
  objc_storeStrong((id *)&self->_detailText, a3);
  -[RUIModernHeaderView updateDetailText](self, "updateDetailText");
}

- (void)setDetailText:(id)a3 attributes:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_209E87000, v4, OS_LOG_TYPE_DEFAULT, "Detail text is not supported with setupAssistant-style title headers", v5, 2u);
    }

  }
}

- (void)setSubHeaderText:(id)a3 attributes:(id)a4
{
  objc_storeStrong((id *)&self->_subHeaderText, a3);
  -[RUIModernHeaderView updateDetailText](self, "updateDetailText");
}

- (void)setIconImage:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RUIModernHeaderView;
  -[RUIModernHeaderView setIcon:accessibilityLabel:](&v3, sel_setIcon_accessibilityLabel_, a3, 0);
}

- (void)updateDetailText
{
  uint64_t v3;
  id v4;
  void *v5;
  objc_super v6;

  v3 = 544;
  if (-[NSString length](self->_detailText, "length") && -[NSString length](self->_subHeaderText, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), self->_detailText, self->_subHeaderText);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[NSString length](self->_detailText, "length"))
    {
      v3 = 552;
      if (!-[NSString length](self->_subHeaderText, "length"))
      {
        v5 = 0;
        goto LABEL_8;
      }
    }
    v4 = *(id *)((char *)&self->super.super.super.super.isa + v3);
  }
  v5 = v4;
LABEL_8:
  v6.receiver = self;
  v6.super_class = (Class)RUIModernHeaderView;
  -[RUIModernHeaderView setDetailText:](&v6, sel_setDetailText_, v5);

}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
}

- (NSString)subHeaderText
{
  return self->_subHeaderText;
}

- (void)setSubHeaderText:(id)a3
{
  objc_storeStrong((id *)&self->_subHeaderText, a3);
}

- (double)iconHeight
{
  return self->_iconHeight;
}

- (void)setIconHeight:(double)a3
{
  self->_iconHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subHeaderText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
}

@end
