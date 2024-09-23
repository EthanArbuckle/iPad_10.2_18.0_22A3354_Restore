@implementation ACTUserAction

- (id)shortDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  -[ACTUserAction description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTUserAction description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") - 1;

  if (v5 >= 0x20)
    v6 = 32;
  else
    v6 = v5;
  objc_msgSend(v3, "substringToIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)inputSegment
{
  return self->_inputSegment;
}

- (void)setInputSegment:(unint64_t)a3
{
  self->_inputSegment = a3;
}

- (id)twoKeyTapShortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ACTUserAction performSelector:](self, "performSelector:", sel_firstTap);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "abbreviatedDescription");
    else
      objc_msgSend(v3, "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTUserAction performSelector:](self, "performSelector:", sel_secondTap);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "abbreviatedDescription");
    else
      objc_msgSend(v6, "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "stringByPaddingToLength:withString:startingAtIndex:", 7, CFSTR(" "), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByPaddingToLength:withString:startingAtIndex:", 7, CFSTR(" "), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
