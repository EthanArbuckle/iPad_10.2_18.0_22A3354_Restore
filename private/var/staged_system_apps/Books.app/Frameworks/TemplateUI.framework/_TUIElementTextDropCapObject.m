@implementation _TUIElementTextDropCapObject

- (void)ensureParagraphBoundaryWithBuilder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (!self->_ensuredParagraphBoundary)
  {
    self->_ensuredParagraphBoundary = 1;
    v7 = v4;
    v6 = objc_opt_respondsToSelector(v4, "ensureParagraphBoundary");
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "ensureParagraphBoundary");
      v5 = v7;
    }
  }

}

- (unint64_t)charCount
{
  return self->_charCount;
}

- (void)setCharCount:(unint64_t)a3
{
  self->_charCount = a3;
}

- (unint64_t)lines
{
  return self->_lines;
}

- (void)setLines:(unint64_t)a3
{
  self->_lines = a3;
}

- (unint64_t)raised
{
  return self->_raised;
}

- (void)setRaised:(unint64_t)a3
{
  self->_raised = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
