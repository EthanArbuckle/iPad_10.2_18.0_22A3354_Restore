@implementation OBLinkableTemplateLabel

- (OBLinkableTemplateLabel)init
{
  OBLinkableTemplateLabel *v2;
  uint64_t v3;
  UITapGestureRecognizer *tapRecognizer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBLinkableTemplateLabel;
  v2 = -[OBTemplateLabel init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v2, sel__linkTapped_);
    tapRecognizer = v2->_tapRecognizer;
    v2->_tapRecognizer = (UITapGestureRecognizer *)v3;

    -[OBLinkableTemplateLabel addGestureRecognizer:](v2, "addGestureRecognizer:", v2->_tapRecognizer);
  }
  return v2;
}

- (void)_linkTapped:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[OBLinkableTemplateLabel destinationLink](self, "destinationLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

}

- (void)setLearnMoreURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v4 = a3;
  v22 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsString:", CFSTR("http"));

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Learn More links only support web URLs."), 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v21);
    }
    -[OBLinkableTemplateLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[OBLinkableTemplateLabel setDestinationLink:](self, "setDestinationLink:", v22);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("LEARN_MORE_CAPTION_LINK_FORMAT_STRING"), CFSTR("Localizable"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBLinkableTemplateLabel text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("LEARN_MORE_CAPTION_LINK"), CFSTR("Localizable"), v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities stringWithFormat:](OBUtilities, "stringWithFormat:", v8, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTemplateLabel setText:](self, "setText:", v12);

    -[OBLinkableTemplateLabel text](self, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("LEARN_MORE_CAPTION_LINK"), CFSTR("Localizable"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "rangeOfString:", v15);
    v18 = v17;

    -[OBLinkableTemplateLabel attributedText](self, "attributedText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0DC1160], v22, v16, v18);
    -[OBLinkableTemplateLabel setAttributedText:](self, "setAttributedText:", v20);

  }
  else
  {
    -[OBLinkableTemplateLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  }

}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (NSURL)destinationLink
{
  return self->_destinationLink;
}

- (void)setDestinationLink:(id)a3
{
  objc_storeStrong((id *)&self->_destinationLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationLink, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end
