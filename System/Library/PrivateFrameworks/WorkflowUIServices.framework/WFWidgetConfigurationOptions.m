@implementation WFWidgetConfigurationOptions

- (WFWidgetConfigurationOptions)init
{
  char *v2;
  WFWidgetConfigurationOptions *v3;
  __int128 v4;
  char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationOptions;
  v2 = -[WFWidgetConfigurationOptions init](&v7, sel_init);
  v3 = (WFWidgetConfigurationOptions *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 4) = 0;
    v4 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    *(_OWORD *)(v2 + 88) = *MEMORY[0x24BDBF070];
    *(_OWORD *)(v2 + 104) = v4;
    v5 = v2;
  }

  return v3;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (NSString)widgetExtensionBundleIdentifier
{
  return self->_widgetExtensionBundleIdentifier;
}

- (void)setWidgetExtensionBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_widgetExtensionBundleIdentifier, a3);
}

- (int64_t)family
{
  return self->_family;
}

- (void)setFamily:(int64_t)a3
{
  self->_family = a3;
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (void)setWidgetConfigurationStyle:(unint64_t)a3
{
  self->_widgetConfigurationStyle = a3;
}

- (CGRect)initialConfigurationCardViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialConfigurationCardViewFrame.origin.x;
  y = self->_initialConfigurationCardViewFrame.origin.y;
  width = self->_initialConfigurationCardViewFrame.size.width;
  height = self->_initialConfigurationCardViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialConfigurationCardViewFrame:(CGRect)a3
{
  self->_initialConfigurationCardViewFrame = a3;
}

- (NSString)widgetDisplayName
{
  return self->_widgetDisplayName;
}

- (void)setWidgetDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)widgetDescription
{
  return self->_widgetDescription;
}

- (void)setWidgetDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)remoteAppLocalizedName
{
  return self->_remoteAppLocalizedName;
}

- (void)setRemoteAppLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (WFImage)remoteAppIcon
{
  return self->_remoteAppIcon;
}

- (void)setRemoteAppIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)widgetConfigurationType
{
  return self->_widgetConfigurationType;
}

- (void)setWidgetConfigurationType:(unint64_t)a3
{
  self->_widgetConfigurationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAppIcon, 0);
  objc_storeStrong((id *)&self->_remoteAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetDescription, 0);
  objc_storeStrong((id *)&self->_widgetDisplayName, 0);
  objc_storeStrong((id *)&self->_widgetExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
