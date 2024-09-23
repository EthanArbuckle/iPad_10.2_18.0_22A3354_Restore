@implementation SXBlockActionActivity

- (SXBlockActionActivity)initWithLabel:(id)a3 type:(unint64_t)a4 block:(id)a5
{
  return -[SXBlockActionActivity initWithLabel:image:type:block:](self, "initWithLabel:image:type:block:", a3, 0, a4, a5);
}

- (SXBlockActionActivity)initWithLabel:(id)a3 image:(id)a4 type:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  SXBlockActionActivity *v13;
  uint64_t v14;
  NSString *label;
  uint64_t v16;
  id genericBlock;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SXBlockActionActivity;
  v13 = -[SXBlockActionActivity init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    label = v13->_label;
    v13->_label = (NSString *)v14;

    objc_storeStrong((id *)&v13->_image, a4);
    v13->_type = a5;
    v16 = objc_msgSend(v12, "copy");
    genericBlock = v13->_genericBlock;
    v13->_genericBlock = (id)v16;

  }
  return v13;
}

- (SXBlockActionActivity)initWithLabel:(id)a3 type:(unint64_t)a4 immediateBlock:(id)a5 userSelectedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  SXBlockActionActivity *v13;
  uint64_t v14;
  NSString *label;
  uint64_t v16;
  id immediateBlock;
  uint64_t v18;
  id userSelectedBlock;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SXBlockActionActivity;
  v13 = -[SXBlockActionActivity init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    label = v13->_label;
    v13->_label = (NSString *)v14;

    v13->_type = a4;
    v16 = MEMORY[0x219A070A8](v11);
    immediateBlock = v13->_immediateBlock;
    v13->_immediateBlock = (id)v16;

    v18 = MEMORY[0x219A070A8](v12);
    userSelectedBlock = v13->_userSelectedBlock;
    v13->_userSelectedBlock = (id)v18;

  }
  return v13;
}

- (void)invokeWithAction:(id)a3 invocationMethod:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SXBlockActionActivity genericBlock](self, "genericBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXBlockActionActivity genericBlock](self, "genericBlock");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (void *)v7;
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v12);

    goto LABEL_4;
  }
  -[SXBlockActionActivity userSelectedBlock](self, "userSelectedBlock");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[SXBlockActionActivity immediateBlock](self, "immediateBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (a4 == 1)
      {
        -[SXBlockActionActivity userSelectedBlock](self, "userSelectedBlock");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4)
          goto LABEL_4;
        -[SXBlockActionActivity immediateBlock](self, "immediateBlock");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)type
{
  return self->_type;
}

- (UIImage)image
{
  return self->_image;
}

- (id)genericBlock
{
  return self->_genericBlock;
}

- (id)immediateBlock
{
  return self->_immediateBlock;
}

- (id)userSelectedBlock
{
  return self->_userSelectedBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userSelectedBlock, 0);
  objc_storeStrong(&self->_immediateBlock, 0);
  objc_storeStrong(&self->_genericBlock, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
