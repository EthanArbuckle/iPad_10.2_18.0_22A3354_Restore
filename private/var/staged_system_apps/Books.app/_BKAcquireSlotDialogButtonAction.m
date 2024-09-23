@implementation _BKAcquireSlotDialogButtonAction

+ (id)actionButtonWithTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class(a1));
  objc_msgSend(v5, "setTitle:", v4);

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
