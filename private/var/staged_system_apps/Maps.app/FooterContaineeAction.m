@implementation FooterContaineeAction

- (void)loadSubtitleWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, &stru_1011EB268);
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return (id)-[SimpleContaineeAction style](self, "style") == (id)1;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
