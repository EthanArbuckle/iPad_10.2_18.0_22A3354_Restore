@implementation WLQRCode

- (WLQRCode)initWithName:(id)a3 title:(id)a4 URL:(id)a5 code:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WLQRCode *v14;
  WLQRCode *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WLQRCode;
  v14 = -[WLQRCode init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[WLQRCode setName:](v14, "setName:", v10);
    -[WLQRCode setTitle:](v15, "setTitle:", v11);
    -[WLQRCode setUrl:](v15, "setUrl:", v12);
    -[WLQRCode setCode:](v15, "setCode:", v13);
  }

  return v15;
}

- (id)createQRCodeImage:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  void *v13;
  void *v14;
  CGAffineTransform v16;

  -[NSString dataUsingEncoding:](self->_url, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIQRCodeGenerator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("inputMessage"));
  objc_msgSend(v5, "setValue:forKey:", CFSTR("H"), CFSTR("inputCorrectionLevel"));
  objc_msgSend(v5, "outputImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  objc_msgSend(v6, "extent");
  v11 = v9 * (a3 / v10);
  objc_msgSend(v6, "extent");
  CGAffineTransformMakeScale(&v16, v11, v9 * (a3 / v12));
  objc_msgSend(v6, "imageByApplyingTransform:", &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCIImage:scale:orientation:", v13, 0, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
