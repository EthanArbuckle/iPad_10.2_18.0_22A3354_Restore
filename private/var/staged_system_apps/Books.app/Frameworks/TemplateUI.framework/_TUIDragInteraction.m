@implementation _TUIDragInteraction

- (TUIActionHandlerDelegate)actionHandlerDelegate
{
  return (TUIActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_actionHandlerDelegate);
}

- (void)setActionHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandlerDelegate, a3);
}

- (TUIDragControllerDelegate)dragDelegate
{
  return (TUIDragControllerDelegate *)objc_loadWeakRetained((id *)&self->_dragDelegate);
}

- (void)setDragDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dragDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragDelegate);
  objc_destroyWeak((id *)&self->_actionHandlerDelegate);
}

@end
