@implementation _TUIElementExpandableBuilder

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)binding
{
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)self->_binding;
}

- (void)setBinding:(id)a3
{
  self->_binding = ($8F956C3B7BF5D682F604C81DDB625920)a3;
}

- (NSString)pointerRefId
{
  return self->_pointerRefId;
}

- (void)setPointerRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TUIPointerStyle)pointerStyle
{
  return self->_pointerStyle;
}

- (void)setPointerStyle:(id)a3
{
  objc_storeStrong((id *)&self->_pointerStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerStyle, 0);
  objc_storeStrong((id *)&self->_pointerRefId, 0);
}

@end
