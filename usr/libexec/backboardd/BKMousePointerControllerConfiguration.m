@implementation BKMousePointerControllerConfiguration

- (BKCADisplayProvider)displayProvider
{
  return self->_displayProvider;
}

- (void)setDisplayProvider:(id)a3
{
  objc_storeStrong((id *)&self->_displayProvider, a3);
}

- (BKOrientationManager)orientationManager
{
  return self->_orientationManager;
}

- (void)setOrientationManager:(id)a3
{
  objc_storeStrong((id *)&self->_orientationManager, a3);
}

- (BKTouchPadManager)touchPadManager
{
  return self->_touchPadManager;
}

- (void)setTouchPadManager:(id)a3
{
  objc_storeStrong((id *)&self->_touchPadManager, a3);
}

- (BKSmartCoverHIDEventProcessor)smartCoverEventProcessor
{
  return self->_smartCoverEventProcessor;
}

- (void)setSmartCoverEventProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_smartCoverEventProcessor, a3);
}

- (BKKeyboardHIDEventProcessor)keyboardEventProcessor
{
  return self->_keyboardEventProcessor;
}

- (void)setKeyboardEventProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardEventProcessor, a3);
}

- (BKHIDEventDeliveryManager)eventDeliveryManager
{
  return self->_eventDeliveryManager;
}

- (void)setEventDeliveryManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventDeliveryManager, a3);
}

- (BKDisplayController)displayController
{
  return self->_displayController;
}

- (void)setDisplayController:(id)a3
{
  objc_storeStrong((id *)&self->_displayController, a3);
}

- (BKSLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setLocalDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_localDefaults, a3);
}

- (BKHIDClientConnectionManager)clientConnectionManager
{
  return self->_clientConnectionManager;
}

- (void)setClientConnectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnectionManager, a3);
}

- (BKMousePointerDeviceAvailabilityMonitor)deviceAvailabilityMonitor
{
  return self->_deviceAvailabilityMonitor;
}

- (void)setDeviceAvailabilityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAvailabilityMonitor, a3);
}

- (BKMousePointerAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReporter, a3);
}

- (BKMousePointerServiceServer)serviceServer
{
  return self->_serviceServer;
}

- (void)setServiceServer:(id)a3
{
  objc_storeStrong((id *)&self->_serviceServer, a3);
}

- (BKTouchDeliveryPolicyServer)touchDeliveryPolicyServer
{
  return self->_touchDeliveryPolicyServer;
}

- (void)setTouchDeliveryPolicyServer:(id)a3
{
  objc_storeStrong((id *)&self->_touchDeliveryPolicyServer, a3);
}

- (BKHIDEventHitTestDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setEventDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_eventDispatcher, a3);
}

- (Class)displayLinkClass
{
  return self->_displayLinkClass;
}

- (void)setDisplayLinkClass:(Class)a3
{
  objc_storeStrong((id *)&self->_displayLinkClass, a3);
}

- (BOOL)displayLinkDisabled
{
  return self->_displayLinkDisabled;
}

- (void)setDisplayLinkDisabled:(BOOL)a3
{
  self->_displayLinkDisabled = a3;
}

- (BOOL)shouldUseHighFrequencyAttributeOption
{
  return self->_shouldUseHighFrequencyAttributeOption;
}

- (void)setShouldUseHighFrequencyAttributeOption:(BOOL)a3
{
  self->_shouldUseHighFrequencyAttributeOption = a3;
}

- (double)mainDisplayCornerRadius
{
  return self->_mainDisplayCornerRadius;
}

- (void)setMainDisplayCornerRadius:(double)a3
{
  self->_mainDisplayCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkClass, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyServer, 0);
  objc_storeStrong((id *)&self->_serviceServer, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_deviceAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_clientConnectionManager, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_eventDeliveryManager, 0);
  objc_storeStrong((id *)&self->_keyboardEventProcessor, 0);
  objc_storeStrong((id *)&self->_smartCoverEventProcessor, 0);
  objc_storeStrong((id *)&self->_touchPadManager, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_displayProvider, 0);
}

@end
