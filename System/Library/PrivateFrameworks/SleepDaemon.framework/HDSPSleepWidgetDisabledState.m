@implementation HDSPSleepWidgetDisabledState

- (id)stateName
{
  return CFSTR("Disabled");
}

- (int64_t)widgetState
{
  return 0;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 0;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 0;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 0;
}

@end
