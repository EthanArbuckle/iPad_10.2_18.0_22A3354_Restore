@implementation UIInterfaceActionRepresentationViewSpringLoadedEffect

- (UIInterfaceActionRepresentationViewSpringLoadedEffect)init
{
  UIInterfaceActionRepresentationViewSpringLoadedEffect *v2;
  uint64_t v3;
  UISpringLoadedInteractionEffect *blinkEffect;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionRepresentationViewSpringLoadedEffect;
  v2 = -[UIInterfaceActionRepresentationViewSpringLoadedEffect init](&v6, sel_init);
  if (v2)
  {
    +[UISpringLoadedInteraction _blinkEffect](UISpringLoadedInteraction, "_blinkEffect");
    v3 = objc_claimAutoreleasedReturnValue();
    blinkEffect = v2->_blinkEffect;
    v2->_blinkEffect = (UISpringLoadedInteractionEffect *)v3;

  }
  return v2;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "state");
  -[UISpringLoadedInteractionEffect interaction:didChangeWithContext:](self->_blinkEffect, "interaction:didChangeWithContext:", v7, v6);

  if (!v8)
  {
    v9 = 0;
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    v9 = 1;
LABEL_5:
    objc_msgSend(v10, "setHighlighted:", v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkEffect, 0);
}

@end
