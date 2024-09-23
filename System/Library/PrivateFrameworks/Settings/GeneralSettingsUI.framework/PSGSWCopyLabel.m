@implementation PSGSWCopyLabel

- (PSGSWCopyLabel)initWithFrame:(CGRect)a3
{
  PSGSWCopyLabel *v3;
  PSGSWCopyLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSGSWCopyLabel;
  v3 = -[PSGSWCopyLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PSGSWCopyLabel _commonInit](v3);
  return v4;
}

- (void)_commonInit
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "setUserInteractionEnabled:", 1);
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD5B0]), "initWithDelegate:", 0);
    v3 = (void *)a1[101];
    a1[101] = v2;
    v4 = v2;

    objc_msgSend(a1, "addInteraction:", v4);
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", a1, sel_didLongPress_);

    objc_msgSend(v5, "setAllowedTouchTypes:", &unk_24F9D4638);
    objc_msgSend(a1, "addGestureRecognizer:", v5);

  }
}

- (PSGSWCopyLabel)initWithCoder:(id)a3
{
  PSGSWCopyLabel *v3;
  PSGSWCopyLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSGSWCopyLabel;
  v3 = -[PSGSWCopyLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PSGSWCopyLabel _commonInit](v3);
  return v4;
}

- (void)didLongPress:(id)a3
{
  id v4;

  objc_msgSend(a3, "locationInView:", self);
  objc_msgSend(MEMORY[0x24BEBD5A8], "configurationWithIdentifier:sourcePoint:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v4);

}

- (void)copy:(id)a3
{
  void *v3;
  id v4;

  -[PSGSWCopyLabel text](self, "text", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", v4);

}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_editMenuInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
}

@end
