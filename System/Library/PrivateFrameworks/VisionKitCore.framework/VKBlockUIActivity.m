@implementation VKBlockUIActivity

- (VKBlockUIActivity)init
{
  return -[VKBlockUIActivity initWithBlock:](self, "initWithBlock:", &__block_literal_global_33);
}

- (VKBlockUIActivity)initWithBlock:(id)a3
{
  return -[VKBlockUIActivity initWithTitle:block:](self, "initWithTitle:block:", 0, a3);
}

- (VKBlockUIActivity)initWithTitle:(id)a3 block:(id)a4
{
  return -[VKBlockUIActivity initWithTitle:image:activityType:block:](self, "initWithTitle:image:activityType:block:", a3, 0, 0, a4);
}

- (VKBlockUIActivity)initWithTitle:(id)a3 image:(id)a4 block:(id)a5
{
  return -[VKBlockUIActivity initWithTitle:image:activityType:block:](self, "initWithTitle:image:activityType:block:", a3, a4, 0, a5);
}

- (VKBlockUIActivity)initWithTitle:(id)a3 systemImageName:(id)a4 block:(id)a5
{
  return -[VKBlockUIActivity initWithTitle:systemImageName:activityType:block:](self, "initWithTitle:systemImageName:activityType:block:", a3, a4, 0, a5);
}

- (VKBlockUIActivity)initWithTitle:(id)a3 image:(id)a4 activityType:(id)a5 block:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VKBlockUIActivity *v15;
  VKBlockUIActivity *v16;
  uint64_t v17;
  id block;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VKBlockUIActivity;
  v15 = -[UIActivity init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    v17 = MEMORY[0x1D8249E20](v14);
    block = v16->_block;
    v16->_block = (id)v17;

    objc_storeStrong((id *)&v16->_type, a5);
    objc_storeStrong((id *)&v16->_image, a4);
  }

  return v16;
}

- (VKBlockUIActivity)initWithTitle:(id)a3 systemImageName:(id)a4 activityType:(id)a5 block:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  VKBlockUIActivity *v15;

  v10 = (void *)MEMORY[0x1E0CEA638];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "systemImageNamed:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VKBlockUIActivity initWithTitle:image:activityType:block:](self, "initWithTitle:image:activityType:block:", v13, v14, v12, v11);

  return v15;
}

- (id)activityType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[VKBlockUIActivity type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKBlockUIActivity title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v7, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void *v3;
  void (**v4)(void);

  -[VKBlockUIActivity block](self, "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKBlockUIActivity block](self, "block");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
