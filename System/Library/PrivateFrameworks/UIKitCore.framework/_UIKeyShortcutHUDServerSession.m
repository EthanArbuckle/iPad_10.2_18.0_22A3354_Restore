@implementation _UIKeyShortcutHUDServerSession

- (UIWindow)keyWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_keyWindow);
}

- (void)setKeyWindow:(id)a3
{
  objc_storeWeak((id *)&self->_keyWindow, a3);
}

- (_UIOServiceConnection)connection
{
  return (_UIOServiceConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_keyWindow);
}

@end
