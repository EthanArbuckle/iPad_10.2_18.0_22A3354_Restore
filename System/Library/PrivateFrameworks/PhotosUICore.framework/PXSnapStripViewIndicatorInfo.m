@implementation PXSnapStripViewIndicatorInfo

- (PXSnapStripViewIndicatorInfo)initWithOffset:(double)a3 color:(id)a4 style:(unint64_t)a5
{
  id v9;
  PXSnapStripViewIndicatorInfo *v10;
  PXSnapStripViewIndicatorInfo *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSnapStripViewIndicatorInfo;
  v10 = -[PXSnapStripViewIndicatorInfo init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_offset = a3;
    objc_storeStrong((id *)&v10->_color, a4);
    v11->_style = a5;
    v11->_disabled = 0;
  }

  return v11;
}

- (PXSnapStripViewIndicatorInfo)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSnapStripView.m"), 250, CFSTR("%s is not available as initializer"), "-[PXSnapStripViewIndicatorInfo init]");

  abort();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqualToIndicatorInfo:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToIndicatorInfo:(id)a3
{
  id v4;
  UIColor *color;
  void *v6;
  double offset;
  double v8;
  unint64_t style;
  int disabled;
  BOOL v11;

  v4 = a3;
  color = self->_color;
  objc_msgSend(v4, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(color) = -[UIColor isEqual:](color, "isEqual:", v6);

  if ((_DWORD)color
    && (offset = self->_offset, objc_msgSend(v4, "offset"), offset == v8)
    && (style = self->_style, style == objc_msgSend(v4, "style")))
  {
    disabled = self->_disabled;
    v11 = disabled == objc_msgSend(v4, "disabled");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSnapStripViewIndicatorInfo;
  v3 = -[PXSnapStripViewIndicatorInfo hash](&v5, sel_hash);
  return -[UIColor hash](self->_color, "hash") ^ v3 ^ (1000 * self->_disabled) ^ (unint64_t)(self->_offset * 1000.0) ^ (16 * self->_style);
}

- (UIColor)color
{
  return self->_color;
}

- (double)offset
{
  return self->_offset;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
