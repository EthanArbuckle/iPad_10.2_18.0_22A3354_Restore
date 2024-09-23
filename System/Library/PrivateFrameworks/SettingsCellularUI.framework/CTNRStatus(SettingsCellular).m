@implementation CTNRStatus(SettingsCellular)

- (BOOL)are5GRATModeCellsUserInteractable
{
  return !objc_msgSend(a1, "isNSADisabled")
      || (objc_msgSend(a1, "isDisabledReasonRelevantTo5GRATModeCellsUserInteractableState") & 1) == 0;
}

- (BOOL)isDisabledReasonRelevantTo5GRATModeCellsUserInteractableState
{
  return (objc_msgSend(a1, "nsaDisabledReasonMask") & 0x80000002) != 0;
}

@end
