@implementation _UISliderTick

+ (id)tickWithPosition:(float)a3 title:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc((Class)a1);
  *(float *)&v11 = a3;
  v12 = (void *)objc_msgSend(v10, "initWithPosition:title:image:", v9, v8, v11);

  return v12;
}

- (_UISliderTick)initWithPosition:(float)a3 title:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  _UISliderTick *v10;
  _UISliderTick *v11;
  float v12;
  uint64_t v13;
  NSString *title;
  uint64_t v15;
  UIImage *image;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UISliderTick;
  v10 = -[_UISliderTick init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v12 = fmax(fmin(a3, 1.0), 0.0);
    v10->_position = v12;
    v13 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    image = v11->_image;
    v11->_image = (UIImage *)v15;

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  float position;
  double v5;
  id v6;

  position = self->_position;
  v6 = a3;
  *(float *)&v5 = position;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("position"), v5);
  objc_msgSend(v6, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_image, CFSTR("image"));

}

- (_UISliderTick)initWithCoder:(id)a3
{
  id v4;
  _UISliderTick *v5;
  float v6;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  UIImage *image;

  v4 = a3;
  v5 = -[_UISliderTick init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("position"));
    v5->_position = v6;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
    v7 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("image"));
    v9 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v9;

  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = (unint64_t)(self->_position * 100.0);
  v4 = -[NSString hash](self->_title, "hash");
  return v4 ^ -[UIImage hash](self->_image, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISliderTick;
  if (-[_UISliderTick isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = (id *)v4;
    v6 = v5;
    if (*((float *)v5 + 2) == self->_position && objc_msgSend(v5[2], "isEqualToString:", self->_title))
      v7 = objc_msgSend(v6[3], "isEqual:", self->_image);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)position
{
  return self->_position;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
