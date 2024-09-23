@implementation NSString(SiriButtonIdentifier)

+ (__CFString)stringWithSiriButtonIdentifier:()SiriButtonIdentifier
{
  __CFString *v3;
  __CFString *result;

  if (a3 > 99)
  {
    if (a3 > 199)
    {
      if (a3 == 200)
        return CFSTR("SiriButtonIdentifierTestingShellButton");
      if (a3 == 201)
        return CFSTR("SiriButtonIdentifierTVRemoteMicrophoneButton");
    }
    else
    {
      if (a3 == 100)
        return CFSTR("SiriButtonIdentifierMockShellButton");
      if (a3 == 101)
        return CFSTR("SiriButtonIdentifierMockSteeringWheelButton");
    }
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown siri button identifier : %li>"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("SiriButtonIdentifierLongPressUndefined");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("SiriButtonIdentifierLongPressHomeButton");
        return v3;
      case 2:
        result = CFSTR("SiriButtonIdentifierLongPressLockButton");
        break;
      case 3:
        result = CFSTR("SiriButtonIdentifierLongPressBTHeadset");
        break;
      case 4:
        result = CFSTR("SiriButtonIdentifierLongPressWiredMic");
        break;
      case 5:
        result = CFSTR("SiriButtonIdentifierLongPressCarPlayAppDockButton");
        break;
      case 6:
        result = CFSTR("SiriButtonIdentifierLongPressCarPlaySteeringWheelButton");
        break;
      case 7:
        result = CFSTR("SiriButtonIdentifierLongPressCarPlaySiriButton");
        break;
      case 8:
        result = CFSTR("SiriButtonIdentifierLongPressHearstButton");
        break;
      case 9:
        result = CFSTR("SiriButtonIdentifierLongPressVoiceCommandButton");
        break;
      default:
        goto LABEL_23;
    }
  }
  return result;
}

@end
