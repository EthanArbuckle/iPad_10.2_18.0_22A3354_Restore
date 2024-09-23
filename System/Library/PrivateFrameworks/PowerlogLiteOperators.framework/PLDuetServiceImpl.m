@implementation PLDuetServiceImpl

- (PLService)duetService
{
  return (PLService *)objc_loadWeakRetained((id *)&self->_duetService);
}

- (void)stopService
{
  -[PLDuetServiceImpl setDuetService:](self, "setDuetService:", 0);
}

- (void)setDuetService:(id)a3
{
  objc_storeWeak((id *)&self->_duetService, a3);
}

- (PLXPCListenerOperatorComposition)eventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLXPCResponderOperatorComposition)energyResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnergyResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyResponder, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);
  objc_destroyWeak((id *)&self->_duetService);
}

@end
