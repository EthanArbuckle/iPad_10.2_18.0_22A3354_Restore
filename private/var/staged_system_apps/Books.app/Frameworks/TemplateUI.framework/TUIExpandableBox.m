@implementation TUIExpandableBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIExpandableLayout, a2);
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (NSString)pointerRefId
{
  return self->_pointerRefId;
}

- (void)setPointerRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_storeStrong((id *)&self->_viewState, 0);
}

@end
