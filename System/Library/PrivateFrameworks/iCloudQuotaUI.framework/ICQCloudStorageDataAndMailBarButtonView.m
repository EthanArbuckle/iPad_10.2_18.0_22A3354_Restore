@implementation ICQCloudStorageDataAndMailBarButtonView

+ (id)barButtonItemWithData:(id)a3 andMail:(id)a4
{
  id v5;
  id v6;
  ICQCloudStorageDataAndMailBarButtonView *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[ICQCloudStorageDataAndMailBarButtonView initWithData:andMail:]([ICQCloudStorageDataAndMailBarButtonView alloc], "initWithData:andMail:", v6, v5);

  -[ICQCloudStorageDataAndMailBarButtonView setNeedsLayout](v7, "setNeedsLayout");
  -[ICQCloudStorageDataAndMailBarButtonView layoutIfNeeded](v7, "layoutIfNeeded");
  -[ICQCloudStorageDataAndMailBarButtonView sizeToFit](v7, "sizeToFit");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v7);

  return v8;
}

- (ICQCloudStorageDataAndMailBarButtonView)initWithData:(id)a3 andMail:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  ICQCloudStorageDataAndMailBarButtonView *v12;
  uint64_t v13;
  UILabel *data;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UILabel *dataSizes;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UILabel *mail;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UILabel *mailSizes;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)ICQCloudStorageDataAndMailBarButtonView;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = -[ICQCloudStorageDataAndMailBarButtonView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x24BDBF090], v9, v10, v11);
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v8, v9, v10, v11);
    data = v12->_data;
    v12->_data = (UILabel *)v13;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_data, "setFont:", v15);

    PSToolbarLabelsTextColor();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12->_data, "setTextColor:", v16);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v12->_data, "setBackgroundColor:", v17);

    -[UILabel setTextAlignment:](v12->_data, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v12->_data, "setLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("STORAGE_LABEL"), &stru_24E400750, CFSTR("CloudGroup"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12->_data, "setText:", v19);

    -[UILabel sizeToFit](v12->_data, "sizeToFit");
    -[ICQCloudStorageDataAndMailBarButtonView addSubview:](v12, "addSubview:", v12->_data);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v8, v9, v10, v11);
    dataSizes = v12->_dataSizes;
    v12->_dataSizes = (UILabel *)v20;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_dataSizes, "setFont:", v22);

    PSToolbarLabelsTextColor();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12->_dataSizes, "setTextColor:", v23);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v12->_dataSizes, "setBackgroundColor:", v24);

    -[UILabel setTextAlignment:](v12->_dataSizes, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v12->_dataSizes, "setLineBreakMode:", 4);
    -[UILabel setText:](v12->_dataSizes, "setText:", v6);
    -[UILabel sizeToFit](v12->_dataSizes, "sizeToFit");
    -[ICQCloudStorageDataAndMailBarButtonView addSubview:](v12, "addSubview:", v12->_dataSizes);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v8, v9, v10, v11);
    mail = v12->_mail;
    v12->_mail = (UILabel *)v25;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_mail, "setFont:", v27);

    PSToolbarLabelsTextColor();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12->_mail, "setTextColor:", v28);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v12->_mail, "setBackgroundColor:", v29);

    -[UILabel setTextAlignment:](v12->_mail, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v12->_mail, "setLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MAIL_LABEL"), &stru_24E400750, CFSTR("CloudGroup"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12->_mail, "setText:", v31);

    -[UILabel sizeToFit](v12->_mail, "sizeToFit");
    -[ICQCloudStorageDataAndMailBarButtonView addSubview:](v12, "addSubview:", v12->_mail);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v8, v9, v10, v11);
    mailSizes = v12->_mailSizes;
    v12->_mailSizes = (UILabel *)v32;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_mailSizes, "setFont:", v34);

    PSToolbarLabelsTextColor();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12->_mailSizes, "setTextColor:", v35);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v12->_mailSizes, "setBackgroundColor:", v36);

    -[UILabel setTextAlignment:](v12->_mailSizes, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v12->_mailSizes, "setLineBreakMode:", 4);
    -[UILabel setText:](v12->_mailSizes, "setText:", v7);
    -[UILabel sizeToFit](v12->_mailSizes, "sizeToFit");
    -[ICQCloudStorageDataAndMailBarButtonView addSubview:](v12, "addSubview:", v12->_mailSizes);
  }

  return v12;
}

- (void)sizeToFit
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[UILabel frame](self->_mail, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel frame](self->_mailSizes, "frame");
  v36.origin.x = v11;
  v36.origin.y = v12;
  v36.size.width = v13;
  v36.size.height = v14;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  v32 = CGRectUnion(v31, v36);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  -[UILabel frame](self->_data, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UILabel frame](self->_dataSizes, "frame");
  v37.origin.x = v27;
  v37.origin.y = v28;
  v37.size.width = v29;
  v37.size.height = v30;
  v33.origin.x = v20;
  v33.origin.y = v22;
  v33.size.width = v24;
  v33.size.height = v26;
  v38 = CGRectUnion(v33, v37);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectUnion(v34, v38);
  -[ICQCloudStorageDataAndMailBarButtonView setBounds:](self, "setBounds:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[UILabel frame](self->_data, "frame");
  v4 = v3;
  v6 = v5;
  -[UILabel frame](self->_dataSizes, "frame");
  v8 = v7;
  v27 = v9;
  -[UILabel frame](self->_mail, "frame");
  v11 = v10;
  v24 = v12;
  -[UILabel frame](self->_mailSizes, "frame");
  v14 = v13;
  v25 = v8;
  v26 = v15;
  v23 = v13;
  if (v4 + 2.0 + v8 >= v11 + 2.0 + v13)
    v16 = v4 + 2.0 + v8;
  else
    v16 = v11 + 2.0 + v13;
  v17 = floor((v8 + v16 - v4 + 2.0) * 0.5);
  v28.origin.y = 0.0;
  v28.origin.x = v17;
  v28.size.width = v4;
  v18 = v6;
  v28.size.height = v6;
  v22 = CGRectGetMaxX(v28) + 2.0;
  v29.origin.y = 0.0;
  v29.origin.x = v17;
  v29.size.width = v4;
  v29.size.height = v6;
  v19 = CGRectGetMaxY(v29) + -2.0;
  v20 = floor((v14 + v16 - v11 + 2.0) * 0.5);
  v30.origin.x = v20;
  v30.origin.y = v19;
  v30.size.width = v11;
  v30.size.height = v24;
  v21 = CGRectGetMaxX(v30) + 2.0;
  -[UILabel setFrame:](self->_data, "setFrame:", v17, 0.0, v4, v18);
  -[UILabel setFrame:](self->_dataSizes, "setFrame:", v22, 0.0, v25, v27);
  -[UILabel setFrame:](self->_mail, "setFrame:", v20, v19, v11, v24);
  -[UILabel setFrame:](self->_mailSizes, "setFrame:", v21, v19, v23, v26);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailSizes, 0);
  objc_storeStrong((id *)&self->_mail, 0);
  objc_storeStrong((id *)&self->_dataSizes, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
