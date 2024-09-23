@implementation ICPreviewFooterView

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICPreviewFooterView;
  -[ICPreviewFooterView awakeFromNib](&v20, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView titleLabel](self, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_fontWithSingleLineA"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView contentsLabel](self, "contentsLabel"));
  objc_msgSend(v8, "setText:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView contentsLabel](self, "contentsLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_fontWithSingleLineA"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView contentsLabel](self, "contentsLabel"));
  objc_msgSend(v12, "setFont:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView contentsLabel](self, "contentsLabel"));
  objc_msgSend(v13, "setHidden:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView sharingLabel](self, "sharingLabel"));
  objc_msgSend(v14, "setText:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView sharingLabel](self, "sharingLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "font"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ic_fontWithSingleLineA"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView sharingLabel](self, "sharingLabel"));
  objc_msgSend(v18, "setFont:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView sharingLabel](self, "sharingLabel"));
  objc_msgSend(v19, "setHidden:", 1);

}

- (void)setTitle:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setHidden:", v5 == 0);

}

- (void)setContentsSubtitle:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_contentsSubtitle, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView contentsLabel](self, "contentsLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView contentsLabel](self, "contentsLabel"));
  objc_msgSend(v7, "setHidden:", v5 == 0);

}

- (void)setSharingSubtitle:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_sharingSubtitle, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView sharingLabel](self, "sharingLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICPreviewFooterView sharingLabel](self, "sharingLabel"));
  objc_msgSend(v7, "setHidden:", v5 == 0);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)contentsSubtitle
{
  return self->_contentsSubtitle;
}

- (NSString)sharingSubtitle
{
  return self->_sharingSubtitle;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)contentsLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_contentsLabel);
}

- (void)setContentsLabel:(id)a3
{
  objc_storeWeak((id *)&self->_contentsLabel, a3);
}

- (UILabel)sharingLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_sharingLabel);
}

- (void)setSharingLabel:(id)a3
{
  objc_storeWeak((id *)&self->_sharingLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sharingLabel);
  objc_destroyWeak((id *)&self->_contentsLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_sharingSubtitle, 0);
  objc_storeStrong((id *)&self->_contentsSubtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
