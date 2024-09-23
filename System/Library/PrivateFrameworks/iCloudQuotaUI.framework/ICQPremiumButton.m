@implementation ICQPremiumButton

+ (id)buttonWithType:(int64_t)a3 link:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___ICQPremiumButton;
  v5 = a4;
  objc_msgSendSuper2(&v11, sel_buttonWithType_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v11.receiver, v11.super_class);
  objc_msgSend(v6, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  objc_msgSend(v6, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(v6, "setLink:", v5);
  return v6;
}

- (void)setLink:(id)a3
{
  void *v5;
  ICQLink *v6;

  v6 = (ICQLink *)a3;
  if (self->_link != v6)
  {
    objc_storeStrong((id *)&self->_link, a3);
    -[ICQLink text](v6, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPremiumButton setTitle:forState:](self, "setTitle:forState:", v5, 0);

  }
}

- (ICQLink)link
{
  return self->_link;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
}

@end
