@implementation _UITabBasicAlternateRepresentation

- (_UITabBasicAlternateRepresentation)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  _UITabBasicAlternateRepresentation *v8;
  _UITabBasicAlternateRepresentation *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITabBasicAlternateRepresentation;
  v8 = -[_UITabBasicAlternateRepresentation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_UITabBasicAlternateRepresentation setTitle:](v8, "setTitle:", v6);
    -[_UITabBasicAlternateRepresentation setImage:](v9, "setImage:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _UITabBasicAlternateRepresentation *v4;
  _UITabBasicAlternateRepresentation *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (_UITabBasicAlternateRepresentation *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UITabBasicAlternateRepresentation title](v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITabBasicAlternateRepresentation title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        -[_UITabBasicAlternateRepresentation image](v5, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITabBasicAlternateRepresentation image](self, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->title, "hash");
  return -[UIImage hash](self->image, "hash") ^ v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_title);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  NSStringFromSelector(sel_image);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->title, 0);
}

@end
