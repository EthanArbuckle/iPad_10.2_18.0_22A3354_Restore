@implementation PLSearchOCRTextLine

- (PLSearchOCRTextLine)initWithTextBounds:(CGRect)a3 isTitle:(BOOL)a4 candidates:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  PLSearchOCRTextLine *v12;
  uint64_t v13;
  NSArray *candidates;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchOCRTextLine;
  v12 = -[PLSearchOCRTextLine init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    candidates = v12->_candidates;
    v12->_candidates = (NSArray *)v13;

    v12->_textBounds.origin.x = x;
    v12->_textBounds.origin.y = y;
    v12->_textBounds.size.width = width;
    v12->_textBounds.size.height = height;
    v12->_isTitle = a4;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p> "), v5, self);

  NSStringFromRect(self->_textBounds);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("textBounds: %@, "), v6);

  if (self->_isTitle)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isTitle: %@, "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("candidates: %@"), self->_candidates);
  return v3;
}

- (CGRect)textBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textBounds.origin.x;
  y = self->_textBounds.origin.y;
  width = self->_textBounds.size.width;
  height = self->_textBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
