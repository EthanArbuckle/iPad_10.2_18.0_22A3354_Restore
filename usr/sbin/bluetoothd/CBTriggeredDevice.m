@implementation CBTriggeredDevice

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (unint64_t)triggerTicks
{
  return self->_triggerTicks;
}

- (void)setTriggerTicks:(unint64_t)a3
{
  self->_triggerTicks = a3;
}

- (unint64_t)uiTicks
{
  return self->_uiTicks;
}

- (void)setUiTicks:(unint64_t)a3
{
  self->_uiTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
