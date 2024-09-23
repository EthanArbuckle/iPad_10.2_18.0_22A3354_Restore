@implementation _CarTitleAlternative

+ (id)alternativeWithTitle:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = objc_msgSend(v7, "copy");

  v10 = (void *)v8[1];
  v8[1] = v9;

  objc_msgSend(v8, "updateWithLabel:", v6);
  return v8;
}

- (void)updateWithLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSString length](self->_title, "length"))
  {
    -[_CarTitleAlternative title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)off_1E1678D90;
    objc_msgSend(v4, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeWithAttributes:", v7);
    UICeilToViewScale(v4);
    self->_width = v8;

  }
  else
  {
    self->_width = 0.0;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_CarTitleAlternative;
  -[_CarTitleAlternative description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ '%@' (%f)"), v4, self->_title, *(_QWORD *)&self->_width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (double)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
