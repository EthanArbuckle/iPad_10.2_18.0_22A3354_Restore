@implementation CAPContactFillerContactEvent

- (id)timeSinceLastContactViaShareAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E44018C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeSinceLastContactViaShare:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2mins")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN5mins")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN10mins")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN30mins")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN1hr")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2hrs")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN4hrs")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN6hrs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN12hrs")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN24hrs")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_OTHER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_UNKNOWN")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)timeSinceLastContactViaIncomingTextAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E44018C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeSinceLastContactViaIncomingText:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2mins")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN5mins")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN10mins")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN30mins")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN1hr")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2hrs")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN4hrs")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN6hrs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN12hrs")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN24hrs")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_OTHER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_UNKNOWN")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)timeSinceLastContactViaOutgoingTextAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E44018C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeSinceLastContactViaOutgoingText:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2mins")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN5mins")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN10mins")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN30mins")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN1hr")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2hrs")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN4hrs")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN6hrs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN12hrs")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN24hrs")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_OTHER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_UNKNOWN")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)timeSinceLastContactViaIncomingCall
{
  if ((*((_BYTE *)&self->_has + 3) & 0x10) != 0)
    return self->_timeSinceLastContactViaIncomingCall;
  else
    return 0;
}

- (void)setTimeSinceLastContactViaIncomingCall:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_timeSinceLastContactViaIncomingCall = a3;
}

- (void)setHasTimeSinceLastContactViaIncomingCall:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTimeSinceLastContactViaIncomingCall
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)timeSinceLastContactViaIncomingCallAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E44018C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeSinceLastContactViaIncomingCall:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2mins")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN5mins")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN10mins")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN30mins")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN1hr")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2hrs")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN4hrs")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN6hrs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN12hrs")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN24hrs")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_OTHER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_UNKNOWN")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)timeSinceLastContactViaOutgoingCall
{
  if ((*((_BYTE *)&self->_has + 3) & 0x20) != 0)
    return self->_timeSinceLastContactViaOutgoingCall;
  else
    return 0;
}

- (void)setTimeSinceLastContactViaOutgoingCall:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_timeSinceLastContactViaOutgoingCall = a3;
}

- (void)setHasTimeSinceLastContactViaOutgoingCall:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasTimeSinceLastContactViaOutgoingCall
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (id)timeSinceLastContactViaOutgoingCallAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E44018C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeSinceLastContactViaOutgoingCall:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2mins")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN5mins")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN10mins")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN30mins")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN1hr")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN2hrs")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN4hrs")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN6hrs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN12hrs")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CFTIME_LESSTHAN24hrs")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_OTHER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAPTIME_UNKNOWN")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNormalizedIncomingCallFrequency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_normalizedIncomingCallFrequency = a3;
}

- (void)setHasNormalizedIncomingCallFrequency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasNormalizedIncomingCallFrequency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setNormalizedOutgoingCallFrequency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_normalizedOutgoingCallFrequency = a3;
}

- (void)setHasNormalizedOutgoingCallFrequency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasNormalizedOutgoingCallFrequency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setNumberOfBehavioralRulesAdvocating:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_numberOfBehavioralRulesAdvocating = a3;
}

- (void)setHasNumberOfBehavioralRulesAdvocating:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasNumberOfBehavioralRulesAdvocating
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setAverageBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_averageBehavioralRuleSupport = a3;
}

- (void)setHasAverageBehavioralRuleSupport:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAverageBehavioralRuleSupport
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAverageBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_averageBehavioralRuleConfidence = a3;
}

- (void)setHasAverageBehavioralRuleConfidence:(BOOL)a3
{
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAverageBehavioralRuleConfidence
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAverageBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_averageBehavioralRuleLift = a3;
}

- (void)setHasAverageBehavioralRuleLift:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAverageBehavioralRuleLift
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAverageBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_averageBehavioralRuleConviction = a3;
}

- (void)setHasAverageBehavioralRuleConviction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAverageBehavioralRuleConviction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAverageBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_averageBehavioralRulePowerFactor = a3;
}

- (void)setHasAverageBehavioralRulePowerFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAverageBehavioralRulePowerFactor
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAverageBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_averageBehavioralRuleMLScore = a3;
}

- (void)setHasAverageBehavioralRuleMLScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAverageBehavioralRuleMLScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMinimumBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_minimumBehavioralRuleSupport = a3;
}

- (void)setHasMinimumBehavioralRuleSupport:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleSupport
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMinimumBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_minimumBehavioralRuleConfidence = a3;
}

- (void)setHasMinimumBehavioralRuleConfidence:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleConfidence
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMinimumBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_minimumBehavioralRuleLift = a3;
}

- (void)setHasMinimumBehavioralRuleLift:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleLift
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMinimumBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_minimumBehavioralRuleConviction = a3;
}

- (void)setHasMinimumBehavioralRuleConviction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleConviction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMinimumBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_minimumBehavioralRulePowerFactor = a3;
}

- (void)setHasMinimumBehavioralRulePowerFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMinimumBehavioralRulePowerFactor
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMinimumBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_minimumBehavioralRuleMLScore = a3;
}

- (void)setHasMinimumBehavioralRuleMLScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleMLScore
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setMaximumBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_maximumBehavioralRuleSupport = a3;
}

- (void)setHasMaximumBehavioralRuleSupport:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleSupport
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMaximumBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_maximumBehavioralRuleConfidence = a3;
}

- (void)setHasMaximumBehavioralRuleConfidence:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMaximumBehavioralRuleConfidence
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMaximumBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_maximumBehavioralRuleLift = a3;
}

- (void)setHasMaximumBehavioralRuleLift:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleLift
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMaximumBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_maximumBehavioralRuleConviction = a3;
}

- (void)setHasMaximumBehavioralRuleConviction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleConviction
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setMaximumBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_maximumBehavioralRulePowerFactor = a3;
}

- (void)setHasMaximumBehavioralRulePowerFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMaximumBehavioralRulePowerFactor
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMaximumBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maximumBehavioralRuleMLScore = a3;
}

- (void)setHasMaximumBehavioralRuleMLScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleMLScore
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setStdevBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_stdevBehavioralRuleSupport = a3;
}

- (void)setHasStdevBehavioralRuleSupport:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleSupport
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setStdevBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_stdevBehavioralRuleConfidence = a3;
}

- (void)setHasStdevBehavioralRuleConfidence:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleConfidence
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setStdevBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_stdevBehavioralRuleLift = a3;
}

- (void)setHasStdevBehavioralRuleLift:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleLift
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setStdevBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_stdevBehavioralRuleConviction = a3;
}

- (void)setHasStdevBehavioralRuleConviction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleConviction
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setStdevBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_stdevBehavioralRulePowerFactor = a3;
}

- (void)setHasStdevBehavioralRulePowerFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasStdevBehavioralRulePowerFactor
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setStdevBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_stdevBehavioralRuleMLScore = a3;
}

- (void)setHasStdevBehavioralRuleMLScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleMLScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setInteractionModelScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_interactionModelScore = a3;
}

- (void)setHasInteractionModelScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasInteractionModelScore
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CAPContactFillerContactEvent;
  -[CAPContactFillerContactEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAPContactFillerContactEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t timeSinceLastContactViaShare;
  __CFString *v5;
  uint64_t timeSinceLastContactViaIncomingText;
  __CFString *v7;
  uint64_t timeSinceLastContactViaOutgoingText;
  __CFString *v9;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has;
  uint64_t timeSinceLastContactViaIncomingCall;
  __CFString *v12;
  uint64_t timeSinceLastContactViaOutgoingCall;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeSinceLastContactViaShare = self->_timeSinceLastContactViaShare;
  if (timeSinceLastContactViaShare >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_timeSinceLastContactViaShare);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E44018C8[timeSinceLastContactViaShare];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeSinceLastContactViaShare"));

  timeSinceLastContactViaIncomingText = self->_timeSinceLastContactViaIncomingText;
  if (timeSinceLastContactViaIncomingText >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_timeSinceLastContactViaIncomingText);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E44018C8[timeSinceLastContactViaIncomingText];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timeSinceLastContactViaIncomingText"));

  timeSinceLastContactViaOutgoingText = self->_timeSinceLastContactViaOutgoingText;
  if (timeSinceLastContactViaOutgoingText >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_timeSinceLastContactViaOutgoingText);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E44018C8[timeSinceLastContactViaOutgoingText];
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timeSinceLastContactViaOutgoingText"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    timeSinceLastContactViaIncomingCall = self->_timeSinceLastContactViaIncomingCall;
    if (timeSinceLastContactViaIncomingCall >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_timeSinceLastContactViaIncomingCall);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E44018C8[timeSinceLastContactViaIncomingCall];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timeSinceLastContactViaIncomingCall"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    timeSinceLastContactViaOutgoingCall = self->_timeSinceLastContactViaOutgoingCall;
    if (timeSinceLastContactViaOutgoingCall >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_timeSinceLastContactViaOutgoingCall);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E44018C8[timeSinceLastContactViaOutgoingCall];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("timeSinceLastContactViaOutgoingCall"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_normalizedShareFrequency);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("normalizedShareFrequency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_normalizedIncomingTextFrequency);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("normalizedIncomingTextFrequency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_normalizedOutgoingTextFrequency);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("normalizedOutgoingTextFrequency"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_normalizedIncomingCallFrequency);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("normalizedIncomingCallFrequency"));

    v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x4000000) == 0)
    {
LABEL_22:
      if ((*(_DWORD *)&v18 & 0x8000000) == 0)
        goto LABEL_23;
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x4000000) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_normalizedOutgoingCallFrequency);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("normalizedOutgoingCallFrequency"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x8000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v18 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfBehavioralRulesAdvocating);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("numberOfBehavioralRulesAdvocating"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x20) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v18 & 1) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageBehavioralRuleSupport);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("averageBehavioralRuleSupport"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 1) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v18 & 4) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageBehavioralRuleConfidence);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("averageBehavioralRuleConfidence"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 4) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v18 & 2) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageBehavioralRuleLift);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("averageBehavioralRuleLift"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 2) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v18 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageBehavioralRuleConviction);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("averageBehavioralRuleConviction"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v18 & 8) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageBehavioralRulePowerFactor);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("averageBehavioralRulePowerFactor"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 8) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v18 & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageBehavioralRuleMLScore);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("averageBehavioralRuleMLScore"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v18 & 0x2000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumBehavioralRuleSupport);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("minimumBehavioralRuleSupport"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v18 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumBehavioralRuleConfidence);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("minimumBehavioralRuleConfidence"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v18 & 0x4000) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumBehavioralRuleLift);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("minimumBehavioralRuleLift"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v18 & 0x20000) == 0)
      goto LABEL_34;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumBehavioralRuleConviction);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("minimumBehavioralRuleConviction"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v18 & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumBehavioralRulePowerFactor);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("minimumBehavioralRulePowerFactor"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v18 & 0x1000) == 0)
      goto LABEL_36;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumBehavioralRuleMLScore);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("minimumBehavioralRuleMLScore"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x1000) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v18 & 0x80) == 0)
      goto LABEL_37;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumBehavioralRuleSupport);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("maximumBehavioralRuleSupport"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x80) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v18 & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumBehavioralRuleConfidence);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("maximumBehavioralRuleConfidence"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v18 & 0x100) == 0)
      goto LABEL_39;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumBehavioralRuleLift);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("maximumBehavioralRuleLift"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v18 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumBehavioralRuleConviction);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("maximumBehavioralRuleConviction"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v18 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumBehavioralRulePowerFactor);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("maximumBehavioralRulePowerFactor"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0)
      goto LABEL_42;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumBehavioralRuleMLScore);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("maximumBehavioralRuleMLScore"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v18 & 0x80000) == 0)
      goto LABEL_43;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stdevBehavioralRuleSupport);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("stdevBehavioralRuleSupport"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v18 & 0x200000) == 0)
      goto LABEL_44;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stdevBehavioralRuleConfidence);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("stdevBehavioralRuleConfidence"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v18 & 0x100000) == 0)
      goto LABEL_45;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stdevBehavioralRuleLift);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("stdevBehavioralRuleLift"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x100000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v18 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stdevBehavioralRuleConviction);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("stdevBehavioralRuleConviction"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v18 & 0x400000) == 0)
      goto LABEL_47;
LABEL_76:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stdevBehavioralRuleMLScore);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("stdevBehavioralRuleMLScore"));

    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stdevBehavioralRulePowerFactor);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("stdevBehavioralRulePowerFactor"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x400000) != 0)
    goto LABEL_76;
LABEL_47:
  if ((*(_BYTE *)&v18 & 0x40) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interactionModelScore);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("interactionModelScore"));

  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wasShareRecipient);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("wasShareRecipient"));

  v21 = v3;
  return v21;
}

- (BOOL)readFrom:(id)a3
{
  return CAPContactFillerContactEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v5 & 0x8000000) == 0)
        goto LABEL_8;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 1) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v5 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v5 & 8) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v5 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v5 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v5 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v5 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v5 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v5 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v5 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v5 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x400000) == 0)
      goto LABEL_32;
LABEL_61:
    PBDataWriterWriteDoubleField();
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
    goto LABEL_61;
LABEL_32:
  if ((*(_BYTE *)&v5 & 0x40) != 0)
LABEL_33:
    PBDataWriterWriteDoubleField();
LABEL_34:
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4;

  *((_DWORD *)a3 + 62) = self->_timeSinceLastContactViaShare;
  *((_DWORD *)a3 + 59) = self->_timeSinceLastContactViaIncomingText;
  *((_DWORD *)a3 + 61) = self->_timeSinceLastContactViaOutgoingText;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *((_DWORD *)a3 + 58) = self->_timeSinceLastContactViaIncomingCall;
    *((_DWORD *)a3 + 64) |= 0x10000000u;
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *((_DWORD *)a3 + 60) = self->_timeSinceLastContactViaOutgoingCall;
    *((_DWORD *)a3 + 64) |= 0x20000000u;
  }
  *((_DWORD *)a3 + 56) = self->_normalizedShareFrequency;
  *((_DWORD *)a3 + 53) = self->_normalizedIncomingTextFrequency;
  *((_DWORD *)a3 + 55) = self->_normalizedOutgoingTextFrequency;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x2000000) != 0)
  {
    *((_DWORD *)a3 + 52) = self->_normalizedIncomingCallFrequency;
    *((_DWORD *)a3 + 64) |= 0x2000000u;
    v4 = self->_has;
    if ((*(_DWORD *)&v4 & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v4 & 0x8000000) == 0)
        goto LABEL_8;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&v4 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 54) = self->_normalizedOutgoingCallFrequency;
  *((_DWORD *)a3 + 64) |= 0x4000000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&v4 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 57) = self->_numberOfBehavioralRulesAdvocating;
  *((_DWORD *)a3 + 64) |= 0x8000000u;
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v4 & 1) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)a3 + 6) = *(_QWORD *)&self->_averageBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x20u;
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 1) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v4 & 4) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_averageBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 1u;
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&v4 & 2) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_averageBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 4u;
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v4 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_averageBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 2u;
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v4 & 8) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)a3 + 5) = *(_QWORD *)&self->_averageBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x10u;
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 8) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v4 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_averageBehavioralRuleMLScore;
  *((_DWORD *)a3 + 64) |= 8u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v4 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)a3 + 19) = *(_QWORD *)&self->_minimumBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x40000u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v4 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)a3 + 14) = *(_QWORD *)&self->_minimumBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 0x2000u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v4 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)a3 + 16) = *(_QWORD *)&self->_minimumBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 0x8000u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v4 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)a3 + 15) = *(_QWORD *)&self->_minimumBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 0x4000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v4 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)a3 + 18) = *(_QWORD *)&self->_minimumBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x20000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v4 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)a3 + 17) = *(_QWORD *)&self->_minimumBehavioralRuleMLScore;
  *((_DWORD *)a3 + 64) |= 0x10000u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v4 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 13) = *(_QWORD *)&self->_maximumBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x1000u;
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v4 & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 8) = *(_QWORD *)&self->_maximumBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 0x80u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v4 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 10) = *(_QWORD *)&self->_maximumBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 0x200u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v4 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 9) = *(_QWORD *)&self->_maximumBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 0x100u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v4 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 12) = *(_QWORD *)&self->_maximumBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x800u;
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v4 & 0x1000000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 11) = *(_QWORD *)&self->_maximumBehavioralRuleMLScore;
  *((_DWORD *)a3 + 64) |= 0x400u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x1000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v4 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 25) = *(_QWORD *)&self->_stdevBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x1000000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v4 & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 20) = *(_QWORD *)&self->_stdevBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 0x80000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v4 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)a3 + 22) = *(_QWORD *)&self->_stdevBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 0x200000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v4 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 21) = *(_QWORD *)&self->_stdevBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 0x100000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v4 & 0x400000) == 0)
      goto LABEL_32;
LABEL_61:
    *((_QWORD *)a3 + 23) = *(_QWORD *)&self->_stdevBehavioralRuleMLScore;
    *((_DWORD *)a3 + 64) |= 0x400000u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_60:
  *((_QWORD *)a3 + 24) = *(_QWORD *)&self->_stdevBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x800000u;
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
    goto LABEL_61;
LABEL_32:
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
LABEL_33:
    *((_QWORD *)a3 + 7) = *(_QWORD *)&self->_interactionModelScore;
    *((_DWORD *)a3 + 64) |= 0x40u;
  }
LABEL_34:
  *((_BYTE *)a3 + 252) = self->_wasShareRecipient;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 62) = self->_timeSinceLastContactViaShare;
  *((_DWORD *)result + 59) = self->_timeSinceLastContactViaIncomingText;
  *((_DWORD *)result + 61) = self->_timeSinceLastContactViaOutgoingText;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *((_DWORD *)result + 58) = self->_timeSinceLastContactViaIncomingCall;
    *((_DWORD *)result + 64) |= 0x10000000u;
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *((_DWORD *)result + 60) = self->_timeSinceLastContactViaOutgoingCall;
    *((_DWORD *)result + 64) |= 0x20000000u;
  }
  *((_DWORD *)result + 56) = self->_normalizedShareFrequency;
  *((_DWORD *)result + 53) = self->_normalizedIncomingTextFrequency;
  *((_DWORD *)result + 55) = self->_normalizedOutgoingTextFrequency;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    *((_DWORD *)result + 52) = self->_normalizedIncomingCallFrequency;
    *((_DWORD *)result + 64) |= 0x2000000u;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v6 & 0x8000000) == 0)
        goto LABEL_8;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)result + 54) = self->_normalizedOutgoingCallFrequency;
  *((_DWORD *)result + 64) |= 0x4000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 57) = self->_numberOfBehavioralRulesAdvocating;
  *((_DWORD *)result + 64) |= 0x8000000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_averageBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x20u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_averageBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 1u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_averageBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 4u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_averageBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 2u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_averageBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x10u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_averageBehavioralRuleMLScore;
  *((_DWORD *)result + 64) |= 8u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)result + 19) = *(_QWORD *)&self->_minimumBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x40000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)result + 14) = *(_QWORD *)&self->_minimumBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 0x2000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)result + 16) = *(_QWORD *)&self->_minimumBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 0x8000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)result + 15) = *(_QWORD *)&self->_minimumBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 0x4000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)result + 18) = *(_QWORD *)&self->_minimumBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x20000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)result + 17) = *(_QWORD *)&self->_minimumBehavioralRuleMLScore;
  *((_DWORD *)result + 64) |= 0x10000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)result + 13) = *(_QWORD *)&self->_maximumBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x1000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_maximumBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 0x80u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_maximumBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 0x200u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_maximumBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 0x100u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)result + 12) = *(_QWORD *)&self->_maximumBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x800u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)result + 11) = *(_QWORD *)&self->_maximumBehavioralRuleMLScore;
  *((_DWORD *)result + 64) |= 0x400u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)result + 25) = *(_QWORD *)&self->_stdevBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x1000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)result + 20) = *(_QWORD *)&self->_stdevBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 0x80000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)result + 22) = *(_QWORD *)&self->_stdevBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 0x200000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)result + 21) = *(_QWORD *)&self->_stdevBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 0x100000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_32;
LABEL_61:
    *((_QWORD *)result + 23) = *(_QWORD *)&self->_stdevBehavioralRuleMLScore;
    *((_DWORD *)result + 64) |= 0x400000u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_60:
  *((_QWORD *)result + 24) = *(_QWORD *)&self->_stdevBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x800000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) != 0)
    goto LABEL_61;
LABEL_32:
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
LABEL_33:
    *((_QWORD *)result + 7) = *(_QWORD *)&self->_interactionModelScore;
    *((_DWORD *)result + 64) |= 0x40u;
  }
LABEL_34:
  *((_BYTE *)result + 252) = self->_wasShareRecipient;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has;
  int v6;
  int v7;
  BOOL v8;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_timeSinceLastContactViaShare != *((_DWORD *)v4 + 62)
    || self->_timeSinceLastContactViaIncomingText != *((_DWORD *)v4 + 59)
    || self->_timeSinceLastContactViaOutgoingText != *((_DWORD *)v4 + 61))
  {
    goto LABEL_160;
  }
  has = self->_has;
  v6 = *((_DWORD *)v4 + 64);
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_timeSinceLastContactViaIncomingCall != *((_DWORD *)v4 + 58))
      goto LABEL_160;
  }
  else if ((v6 & 0x10000000) != 0)
  {
LABEL_160:
    v8 = 0;
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_timeSinceLastContactViaOutgoingCall != *((_DWORD *)v4 + 60))
      goto LABEL_160;
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_160;
  }
  if (self->_normalizedShareFrequency != *((_DWORD *)v4 + 56)
    || self->_normalizedIncomingTextFrequency != *((_DWORD *)v4 + 53)
    || self->_normalizedOutgoingTextFrequency != *((_DWORD *)v4 + 55))
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_normalizedIncomingCallFrequency != *((_DWORD *)v4 + 52))
      goto LABEL_160;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_normalizedOutgoingCallFrequency != *((_DWORD *)v4 + 54))
      goto LABEL_160;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_numberOfBehavioralRulesAdvocating != *((_DWORD *)v4 + 57))
      goto LABEL_160;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_averageBehavioralRuleSupport != *((double *)v4 + 6))
      goto LABEL_160;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_averageBehavioralRuleConfidence != *((double *)v4 + 1))
      goto LABEL_160;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_averageBehavioralRuleLift != *((double *)v4 + 3))
      goto LABEL_160;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_averageBehavioralRuleConviction != *((double *)v4 + 2))
      goto LABEL_160;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_averageBehavioralRulePowerFactor != *((double *)v4 + 5))
      goto LABEL_160;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_averageBehavioralRuleMLScore != *((double *)v4 + 4))
      goto LABEL_160;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_minimumBehavioralRuleSupport != *((double *)v4 + 19))
      goto LABEL_160;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_minimumBehavioralRuleConfidence != *((double *)v4 + 14))
      goto LABEL_160;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_minimumBehavioralRuleLift != *((double *)v4 + 16))
      goto LABEL_160;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_minimumBehavioralRuleConviction != *((double *)v4 + 15))
      goto LABEL_160;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_minimumBehavioralRulePowerFactor != *((double *)v4 + 18))
      goto LABEL_160;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_minimumBehavioralRuleMLScore != *((double *)v4 + 17))
      goto LABEL_160;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_maximumBehavioralRuleSupport != *((double *)v4 + 13))
      goto LABEL_160;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_maximumBehavioralRuleConfidence != *((double *)v4 + 8))
      goto LABEL_160;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_maximumBehavioralRuleLift != *((double *)v4 + 10))
      goto LABEL_160;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_maximumBehavioralRuleConviction != *((double *)v4 + 9))
      goto LABEL_160;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_maximumBehavioralRulePowerFactor != *((double *)v4 + 12))
      goto LABEL_160;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_maximumBehavioralRuleMLScore != *((double *)v4 + 11))
      goto LABEL_160;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_stdevBehavioralRuleSupport != *((double *)v4 + 25))
      goto LABEL_160;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_stdevBehavioralRuleConfidence != *((double *)v4 + 20))
      goto LABEL_160;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_stdevBehavioralRuleLift != *((double *)v4 + 22))
      goto LABEL_160;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_stdevBehavioralRuleConviction != *((double *)v4 + 21))
      goto LABEL_160;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_stdevBehavioralRulePowerFactor != *((double *)v4 + 24))
      goto LABEL_160;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_stdevBehavioralRuleMLScore != *((double *)v4 + 23))
      goto LABEL_160;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_interactionModelScore != *((double *)v4 + 7))
      goto LABEL_160;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_160;
  }
  v7 = v4[252];
  if (self->_wasShareRecipient)
    v8 = v7 != 0;
  else
    v8 = v7 == 0;
LABEL_161:

  return v8;
}

- (unint64_t)hash
{
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has;
  unint64_t v4;
  double averageBehavioralRuleSupport;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double averageBehavioralRuleConfidence;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double averageBehavioralRuleLift;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double averageBehavioralRuleConviction;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double averageBehavioralRulePowerFactor;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double averageBehavioralRuleMLScore;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double minimumBehavioralRuleSupport;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double minimumBehavioralRuleConfidence;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double minimumBehavioralRuleLift;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  double minimumBehavioralRuleConviction;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  double minimumBehavioralRulePowerFactor;
  double v56;
  long double v57;
  double v58;
  unint64_t v59;
  double minimumBehavioralRuleMLScore;
  double v61;
  long double v62;
  double v63;
  unint64_t v64;
  double maximumBehavioralRuleSupport;
  double v66;
  long double v67;
  double v68;
  unint64_t v69;
  double maximumBehavioralRuleConfidence;
  double v71;
  long double v72;
  double v73;
  unint64_t v74;
  double maximumBehavioralRuleLift;
  double v76;
  long double v77;
  double v78;
  unint64_t v79;
  double maximumBehavioralRuleConviction;
  double v81;
  long double v82;
  double v83;
  unint64_t v84;
  double maximumBehavioralRulePowerFactor;
  double v86;
  long double v87;
  double v88;
  unint64_t v89;
  double maximumBehavioralRuleMLScore;
  double v91;
  long double v92;
  double v93;
  unint64_t v94;
  double stdevBehavioralRuleSupport;
  double v96;
  long double v97;
  double v98;
  unint64_t v99;
  double stdevBehavioralRuleConfidence;
  double v101;
  long double v102;
  double v103;
  unint64_t v104;
  double stdevBehavioralRuleLift;
  double v106;
  long double v107;
  double v108;
  unint64_t v109;
  double stdevBehavioralRuleConviction;
  double v111;
  long double v112;
  double v113;
  unint64_t v114;
  unint64_t v115;
  double stdevBehavioralRulePowerFactor;
  double v117;
  long double v118;
  double v119;
  unint64_t v120;
  unint64_t v121;
  double stdevBehavioralRuleMLScore;
  double v123;
  long double v124;
  double v125;
  unint64_t v126;
  double interactionModelScore;
  double v128;
  long double v129;
  double v130;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unsigned int normalizedOutgoingTextFrequency;
  uint64_t timeSinceLastContactViaOutgoingText;
  unsigned int normalizedIncomingTextFrequency;
  uint64_t timeSinceLastContactViaIncomingText;
  uint64_t v152;
  uint64_t timeSinceLastContactViaShare;
  unsigned int normalizedShareFrequency;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
    v158 = 0;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_3;
LABEL_6:
    v157 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v158 = 2654435761 * self->_timeSinceLastContactViaIncomingCall;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
    goto LABEL_6;
LABEL_3:
  v157 = 2654435761 * self->_timeSinceLastContactViaOutgoingCall;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_4:
    v156 = 2654435761 * self->_normalizedIncomingCallFrequency;
    goto LABEL_8;
  }
LABEL_7:
  v156 = 0;
LABEL_8:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
    v155 = 2654435761 * self->_normalizedOutgoingCallFrequency;
  else
    v155 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
    v152 = 2654435761 * self->_numberOfBehavioralRulesAdvocating;
  else
    v152 = 0;
  normalizedShareFrequency = self->_normalizedShareFrequency;
  normalizedIncomingTextFrequency = self->_normalizedIncomingTextFrequency;
  normalizedOutgoingTextFrequency = self->_normalizedOutgoingTextFrequency;
  timeSinceLastContactViaShare = self->_timeSinceLastContactViaShare;
  timeSinceLastContactViaIncomingText = self->_timeSinceLastContactViaIncomingText;
  timeSinceLastContactViaOutgoingText = self->_timeSinceLastContactViaOutgoingText;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    averageBehavioralRuleSupport = self->_averageBehavioralRuleSupport;
    v6 = -averageBehavioralRuleSupport;
    if (averageBehavioralRuleSupport >= 0.0)
      v6 = self->_averageBehavioralRuleSupport;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    averageBehavioralRuleConfidence = self->_averageBehavioralRuleConfidence;
    v11 = -averageBehavioralRuleConfidence;
    if (averageBehavioralRuleConfidence >= 0.0)
      v11 = self->_averageBehavioralRuleConfidence;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    averageBehavioralRuleLift = self->_averageBehavioralRuleLift;
    v16 = -averageBehavioralRuleLift;
    if (averageBehavioralRuleLift >= 0.0)
      v16 = self->_averageBehavioralRuleLift;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    averageBehavioralRuleConviction = self->_averageBehavioralRuleConviction;
    v21 = -averageBehavioralRuleConviction;
    if (averageBehavioralRuleConviction >= 0.0)
      v21 = self->_averageBehavioralRuleConviction;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    averageBehavioralRulePowerFactor = self->_averageBehavioralRulePowerFactor;
    v26 = -averageBehavioralRulePowerFactor;
    if (averageBehavioralRulePowerFactor >= 0.0)
      v26 = self->_averageBehavioralRulePowerFactor;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    averageBehavioralRuleMLScore = self->_averageBehavioralRuleMLScore;
    v31 = -averageBehavioralRuleMLScore;
    if (averageBehavioralRuleMLScore >= 0.0)
      v31 = self->_averageBehavioralRuleMLScore;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    minimumBehavioralRuleSupport = self->_minimumBehavioralRuleSupport;
    v36 = -minimumBehavioralRuleSupport;
    if (minimumBehavioralRuleSupport >= 0.0)
      v36 = self->_minimumBehavioralRuleSupport;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    minimumBehavioralRuleConfidence = self->_minimumBehavioralRuleConfidence;
    v41 = -minimumBehavioralRuleConfidence;
    if (minimumBehavioralRuleConfidence >= 0.0)
      v41 = self->_minimumBehavioralRuleConfidence;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v143 = v39;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    minimumBehavioralRuleLift = self->_minimumBehavioralRuleLift;
    v46 = -minimumBehavioralRuleLift;
    if (minimumBehavioralRuleLift >= 0.0)
      v46 = self->_minimumBehavioralRuleLift;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v142 = v44;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    minimumBehavioralRuleConviction = self->_minimumBehavioralRuleConviction;
    v51 = -minimumBehavioralRuleConviction;
    if (minimumBehavioralRuleConviction >= 0.0)
      v51 = self->_minimumBehavioralRuleConviction;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v141 = v49;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    minimumBehavioralRulePowerFactor = self->_minimumBehavioralRulePowerFactor;
    v56 = -minimumBehavioralRulePowerFactor;
    if (minimumBehavioralRulePowerFactor >= 0.0)
      v56 = self->_minimumBehavioralRulePowerFactor;
    v57 = floor(v56 + 0.5);
    v58 = (v56 - v57) * 1.84467441e19;
    v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0)
        v54 += (unint64_t)v58;
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    v54 = 0;
  }
  v140 = v54;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    minimumBehavioralRuleMLScore = self->_minimumBehavioralRuleMLScore;
    v61 = -minimumBehavioralRuleMLScore;
    if (minimumBehavioralRuleMLScore >= 0.0)
      v61 = self->_minimumBehavioralRuleMLScore;
    v62 = floor(v61 + 0.5);
    v63 = (v61 - v62) * 1.84467441e19;
    v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0)
        v59 += (unint64_t)v63;
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    v59 = 0;
  }
  v139 = v59;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    maximumBehavioralRuleSupport = self->_maximumBehavioralRuleSupport;
    v66 = -maximumBehavioralRuleSupport;
    if (maximumBehavioralRuleSupport >= 0.0)
      v66 = self->_maximumBehavioralRuleSupport;
    v67 = floor(v66 + 0.5);
    v68 = (v66 - v67) * 1.84467441e19;
    v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0)
        v64 += (unint64_t)v68;
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    v64 = 0;
  }
  v138 = v64;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    maximumBehavioralRuleConfidence = self->_maximumBehavioralRuleConfidence;
    v71 = -maximumBehavioralRuleConfidence;
    if (maximumBehavioralRuleConfidence >= 0.0)
      v71 = self->_maximumBehavioralRuleConfidence;
    v72 = floor(v71 + 0.5);
    v73 = (v71 - v72) * 1.84467441e19;
    v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0)
        v69 += (unint64_t)v73;
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    v69 = 0;
  }
  v137 = v69;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    maximumBehavioralRuleLift = self->_maximumBehavioralRuleLift;
    v76 = -maximumBehavioralRuleLift;
    if (maximumBehavioralRuleLift >= 0.0)
      v76 = self->_maximumBehavioralRuleLift;
    v77 = floor(v76 + 0.5);
    v78 = (v76 - v77) * 1.84467441e19;
    v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0)
        v74 += (unint64_t)v78;
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    v74 = 0;
  }
  v136 = v74;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    maximumBehavioralRuleConviction = self->_maximumBehavioralRuleConviction;
    v81 = -maximumBehavioralRuleConviction;
    if (maximumBehavioralRuleConviction >= 0.0)
      v81 = self->_maximumBehavioralRuleConviction;
    v82 = floor(v81 + 0.5);
    v83 = (v81 - v82) * 1.84467441e19;
    v79 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
    if (v83 >= 0.0)
    {
      if (v83 > 0.0)
        v79 += (unint64_t)v83;
    }
    else
    {
      v79 -= (unint64_t)fabs(v83);
    }
  }
  else
  {
    v79 = 0;
  }
  v135 = v79;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    maximumBehavioralRulePowerFactor = self->_maximumBehavioralRulePowerFactor;
    v86 = -maximumBehavioralRulePowerFactor;
    if (maximumBehavioralRulePowerFactor >= 0.0)
      v86 = self->_maximumBehavioralRulePowerFactor;
    v87 = floor(v86 + 0.5);
    v88 = (v86 - v87) * 1.84467441e19;
    v84 = 2654435761u * (unint64_t)fmod(v87, 1.84467441e19);
    if (v88 >= 0.0)
    {
      if (v88 > 0.0)
        v84 += (unint64_t)v88;
    }
    else
    {
      v84 -= (unint64_t)fabs(v88);
    }
  }
  else
  {
    v84 = 0;
  }
  v134 = v84;
  v147 = v4;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    maximumBehavioralRuleMLScore = self->_maximumBehavioralRuleMLScore;
    v91 = -maximumBehavioralRuleMLScore;
    if (maximumBehavioralRuleMLScore >= 0.0)
      v91 = self->_maximumBehavioralRuleMLScore;
    v92 = floor(v91 + 0.5);
    v93 = (v91 - v92) * 1.84467441e19;
    v89 = 2654435761u * (unint64_t)fmod(v92, 1.84467441e19);
    if (v93 >= 0.0)
    {
      if (v93 > 0.0)
        v89 += (unint64_t)v93;
    }
    else
    {
      v89 -= (unint64_t)fabs(v93);
    }
  }
  else
  {
    v89 = 0;
  }
  v146 = v9;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    stdevBehavioralRuleSupport = self->_stdevBehavioralRuleSupport;
    v96 = -stdevBehavioralRuleSupport;
    if (stdevBehavioralRuleSupport >= 0.0)
      v96 = self->_stdevBehavioralRuleSupport;
    v97 = floor(v96 + 0.5);
    v98 = (v96 - v97) * 1.84467441e19;
    v94 = 2654435761u * (unint64_t)fmod(v97, 1.84467441e19);
    if (v98 >= 0.0)
    {
      if (v98 > 0.0)
        v94 += (unint64_t)v98;
    }
    else
    {
      v94 -= (unint64_t)fabs(v98);
    }
  }
  else
  {
    v94 = 0;
  }
  v145 = v14;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    stdevBehavioralRuleConfidence = self->_stdevBehavioralRuleConfidence;
    v101 = -stdevBehavioralRuleConfidence;
    if (stdevBehavioralRuleConfidence >= 0.0)
      v101 = self->_stdevBehavioralRuleConfidence;
    v102 = floor(v101 + 0.5);
    v103 = (v101 - v102) * 1.84467441e19;
    v99 = 2654435761u * (unint64_t)fmod(v102, 1.84467441e19);
    if (v103 >= 0.0)
    {
      if (v103 > 0.0)
        v99 += (unint64_t)v103;
    }
    else
    {
      v99 -= (unint64_t)fabs(v103);
    }
  }
  else
  {
    v99 = 0;
  }
  v144 = v19;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    stdevBehavioralRuleLift = self->_stdevBehavioralRuleLift;
    v106 = -stdevBehavioralRuleLift;
    if (stdevBehavioralRuleLift >= 0.0)
      v106 = self->_stdevBehavioralRuleLift;
    v107 = floor(v106 + 0.5);
    v108 = (v106 - v107) * 1.84467441e19;
    v104 = 2654435761u * (unint64_t)fmod(v107, 1.84467441e19);
    if (v108 >= 0.0)
    {
      if (v108 > 0.0)
        v104 += (unint64_t)v108;
    }
    else
    {
      v104 -= (unint64_t)fabs(v108);
    }
  }
  else
  {
    v104 = 0;
  }
  v132 = v24;
  v133 = v89;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    stdevBehavioralRuleConviction = self->_stdevBehavioralRuleConviction;
    v111 = -stdevBehavioralRuleConviction;
    if (stdevBehavioralRuleConviction >= 0.0)
      v111 = self->_stdevBehavioralRuleConviction;
    v112 = floor(v111 + 0.5);
    v113 = (v111 - v112) * 1.84467441e19;
    v109 = 2654435761u * (unint64_t)fmod(v112, 1.84467441e19);
    if (v113 >= 0.0)
    {
      if (v113 > 0.0)
        v109 += (unint64_t)v113;
    }
    else
    {
      v109 -= (unint64_t)fabs(v113);
    }
  }
  else
  {
    v109 = 0;
  }
  v114 = v29;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    stdevBehavioralRulePowerFactor = self->_stdevBehavioralRulePowerFactor;
    v117 = -stdevBehavioralRulePowerFactor;
    if (stdevBehavioralRulePowerFactor >= 0.0)
      v117 = self->_stdevBehavioralRulePowerFactor;
    v118 = floor(v117 + 0.5);
    v119 = (v117 - v118) * 1.84467441e19;
    v115 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
    if (v119 >= 0.0)
    {
      if (v119 > 0.0)
        v115 += (unint64_t)v119;
    }
    else
    {
      v115 -= (unint64_t)fabs(v119);
    }
  }
  else
  {
    v115 = 0;
  }
  v120 = v34;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    stdevBehavioralRuleMLScore = self->_stdevBehavioralRuleMLScore;
    v123 = -stdevBehavioralRuleMLScore;
    if (stdevBehavioralRuleMLScore >= 0.0)
      v123 = self->_stdevBehavioralRuleMLScore;
    v124 = floor(v123 + 0.5);
    v125 = (v123 - v124) * 1.84467441e19;
    v121 = 2654435761u * (unint64_t)fmod(v124, 1.84467441e19);
    if (v125 >= 0.0)
    {
      if (v125 > 0.0)
        v121 += (unint64_t)v125;
    }
    else
    {
      v121 -= (unint64_t)fabs(v125);
    }
  }
  else
  {
    v121 = 0;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    interactionModelScore = self->_interactionModelScore;
    v128 = -interactionModelScore;
    if (interactionModelScore >= 0.0)
      v128 = self->_interactionModelScore;
    v129 = floor(v128 + 0.5);
    v130 = (v128 - v129) * 1.84467441e19;
    v126 = 2654435761u * (unint64_t)fmod(v129, 1.84467441e19);
    if (v130 >= 0.0)
    {
      if (v130 > 0.0)
        v126 += (unint64_t)v130;
    }
    else
    {
      v126 -= (unint64_t)fabs(v130);
    }
  }
  else
  {
    v126 = 0;
  }
  return (2654435761 * timeSinceLastContactViaIncomingText) ^ (2654435761 * timeSinceLastContactViaShare) ^ (2654435761 * timeSinceLastContactViaOutgoingText) ^ v158 ^ v157 ^ (2654435761 * normalizedShareFrequency) ^ (2654435761 * normalizedIncomingTextFrequency) ^ (2654435761 * normalizedOutgoingTextFrequency) ^ v156 ^ v155 ^ v152 ^ v147 ^ v146 ^ v145 ^ v144 ^ v132 ^ v114 ^ v120 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v94 ^ v99 ^ v104 ^ v109 ^ v115 ^ v121 ^ v126 ^ (2654435761 * self->_wasShareRecipient);
}

- (void)mergeFrom:(id)a3
{
  int v3;
  int v4;

  self->_timeSinceLastContactViaShare = *((_DWORD *)a3 + 62);
  self->_timeSinceLastContactViaIncomingText = *((_DWORD *)a3 + 59);
  self->_timeSinceLastContactViaOutgoingText = *((_DWORD *)a3 + 61);
  v3 = *((_DWORD *)a3 + 64);
  if ((v3 & 0x10000000) != 0)
  {
    self->_timeSinceLastContactViaIncomingCall = *((_DWORD *)a3 + 58);
    *(_DWORD *)&self->_has |= 0x10000000u;
    v3 = *((_DWORD *)a3 + 64);
  }
  if ((v3 & 0x20000000) != 0)
  {
    self->_timeSinceLastContactViaOutgoingCall = *((_DWORD *)a3 + 60);
    *(_DWORD *)&self->_has |= 0x20000000u;
  }
  self->_normalizedShareFrequency = *((_DWORD *)a3 + 56);
  self->_normalizedIncomingTextFrequency = *((_DWORD *)a3 + 53);
  self->_normalizedOutgoingTextFrequency = *((_DWORD *)a3 + 55);
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x2000000) != 0)
  {
    self->_normalizedIncomingCallFrequency = *((_DWORD *)a3 + 52);
    *(_DWORD *)&self->_has |= 0x2000000u;
    v4 = *((_DWORD *)a3 + 64);
    if ((v4 & 0x4000000) == 0)
    {
LABEL_7:
      if ((v4 & 0x8000000) == 0)
        goto LABEL_8;
      goto LABEL_37;
    }
  }
  else if ((v4 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  self->_normalizedOutgoingCallFrequency = *((_DWORD *)a3 + 54);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  self->_numberOfBehavioralRulesAdvocating = *((_DWORD *)a3 + 57);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x20) == 0)
  {
LABEL_9:
    if ((v4 & 1) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  self->_averageBehavioralRuleSupport = *((double *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 1) == 0)
  {
LABEL_10:
    if ((v4 & 4) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  self->_averageBehavioralRuleConfidence = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 4) == 0)
  {
LABEL_11:
    if ((v4 & 2) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  self->_averageBehavioralRuleLift = *((double *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 2) == 0)
  {
LABEL_12:
    if ((v4 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  self->_averageBehavioralRuleConviction = *((double *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x10) == 0)
  {
LABEL_13:
    if ((v4 & 8) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  self->_averageBehavioralRulePowerFactor = *((double *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 8) == 0)
  {
LABEL_14:
    if ((v4 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  self->_averageBehavioralRuleMLScore = *((double *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x40000) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  self->_minimumBehavioralRuleSupport = *((double *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x2000) == 0)
  {
LABEL_16:
    if ((v4 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  self->_minimumBehavioralRuleConfidence = *((double *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x8000) == 0)
  {
LABEL_17:
    if ((v4 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  self->_minimumBehavioralRuleLift = *((double *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x4000) == 0)
  {
LABEL_18:
    if ((v4 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  self->_minimumBehavioralRuleConviction = *((double *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x20000) == 0)
  {
LABEL_19:
    if ((v4 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  self->_minimumBehavioralRulePowerFactor = *((double *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x10000) == 0)
  {
LABEL_20:
    if ((v4 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  self->_minimumBehavioralRuleMLScore = *((double *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x1000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  self->_maximumBehavioralRuleSupport = *((double *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x80) == 0)
  {
LABEL_22:
    if ((v4 & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  self->_maximumBehavioralRuleConfidence = *((double *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x200) == 0)
  {
LABEL_23:
    if ((v4 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  self->_maximumBehavioralRuleLift = *((double *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x100) == 0)
  {
LABEL_24:
    if ((v4 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  self->_maximumBehavioralRuleConviction = *((double *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x800) == 0)
  {
LABEL_25:
    if ((v4 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  self->_maximumBehavioralRulePowerFactor = *((double *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x400) == 0)
  {
LABEL_26:
    if ((v4 & 0x1000000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  self->_maximumBehavioralRuleMLScore = *((double *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_27:
    if ((v4 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  self->_stdevBehavioralRuleSupport = *((double *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x80000) == 0)
  {
LABEL_28:
    if ((v4 & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  self->_stdevBehavioralRuleConfidence = *((double *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x200000) == 0)
  {
LABEL_29:
    if ((v4 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  self->_stdevBehavioralRuleLift = *((double *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x100000) == 0)
  {
LABEL_30:
    if ((v4 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  self->_stdevBehavioralRuleConviction = *((double *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x800000) == 0)
  {
LABEL_31:
    if ((v4 & 0x400000) == 0)
      goto LABEL_32;
LABEL_61:
    self->_stdevBehavioralRuleMLScore = *((double *)a3 + 23);
    *(_DWORD *)&self->_has |= 0x400000u;
    if ((*((_DWORD *)a3 + 64) & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_60:
  self->_stdevBehavioralRulePowerFactor = *((double *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800000u;
  v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x400000) != 0)
    goto LABEL_61;
LABEL_32:
  if ((v4 & 0x40) != 0)
  {
LABEL_33:
    self->_interactionModelScore = *((double *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_34:
  self->_wasShareRecipient = *((_BYTE *)a3 + 252);
}

- (int)timeSinceLastContactViaShare
{
  return self->_timeSinceLastContactViaShare;
}

- (void)setTimeSinceLastContactViaShare:(int)a3
{
  self->_timeSinceLastContactViaShare = a3;
}

- (int)timeSinceLastContactViaIncomingText
{
  return self->_timeSinceLastContactViaIncomingText;
}

- (void)setTimeSinceLastContactViaIncomingText:(int)a3
{
  self->_timeSinceLastContactViaIncomingText = a3;
}

- (int)timeSinceLastContactViaOutgoingText
{
  return self->_timeSinceLastContactViaOutgoingText;
}

- (void)setTimeSinceLastContactViaOutgoingText:(int)a3
{
  self->_timeSinceLastContactViaOutgoingText = a3;
}

- (unsigned)normalizedShareFrequency
{
  return self->_normalizedShareFrequency;
}

- (void)setNormalizedShareFrequency:(unsigned int)a3
{
  self->_normalizedShareFrequency = a3;
}

- (unsigned)normalizedIncomingTextFrequency
{
  return self->_normalizedIncomingTextFrequency;
}

- (void)setNormalizedIncomingTextFrequency:(unsigned int)a3
{
  self->_normalizedIncomingTextFrequency = a3;
}

- (unsigned)normalizedOutgoingTextFrequency
{
  return self->_normalizedOutgoingTextFrequency;
}

- (void)setNormalizedOutgoingTextFrequency:(unsigned int)a3
{
  self->_normalizedOutgoingTextFrequency = a3;
}

- (unsigned)normalizedIncomingCallFrequency
{
  return self->_normalizedIncomingCallFrequency;
}

- (unsigned)normalizedOutgoingCallFrequency
{
  return self->_normalizedOutgoingCallFrequency;
}

- (unsigned)numberOfBehavioralRulesAdvocating
{
  return self->_numberOfBehavioralRulesAdvocating;
}

- (double)averageBehavioralRuleSupport
{
  return self->_averageBehavioralRuleSupport;
}

- (double)averageBehavioralRuleConfidence
{
  return self->_averageBehavioralRuleConfidence;
}

- (double)averageBehavioralRuleLift
{
  return self->_averageBehavioralRuleLift;
}

- (double)averageBehavioralRuleConviction
{
  return self->_averageBehavioralRuleConviction;
}

- (double)averageBehavioralRulePowerFactor
{
  return self->_averageBehavioralRulePowerFactor;
}

- (double)averageBehavioralRuleMLScore
{
  return self->_averageBehavioralRuleMLScore;
}

- (double)minimumBehavioralRuleSupport
{
  return self->_minimumBehavioralRuleSupport;
}

- (double)minimumBehavioralRuleConfidence
{
  return self->_minimumBehavioralRuleConfidence;
}

- (double)minimumBehavioralRuleLift
{
  return self->_minimumBehavioralRuleLift;
}

- (double)minimumBehavioralRuleConviction
{
  return self->_minimumBehavioralRuleConviction;
}

- (double)minimumBehavioralRulePowerFactor
{
  return self->_minimumBehavioralRulePowerFactor;
}

- (double)minimumBehavioralRuleMLScore
{
  return self->_minimumBehavioralRuleMLScore;
}

- (double)maximumBehavioralRuleSupport
{
  return self->_maximumBehavioralRuleSupport;
}

- (double)maximumBehavioralRuleConfidence
{
  return self->_maximumBehavioralRuleConfidence;
}

- (double)maximumBehavioralRuleLift
{
  return self->_maximumBehavioralRuleLift;
}

- (double)maximumBehavioralRuleConviction
{
  return self->_maximumBehavioralRuleConviction;
}

- (double)maximumBehavioralRulePowerFactor
{
  return self->_maximumBehavioralRulePowerFactor;
}

- (double)maximumBehavioralRuleMLScore
{
  return self->_maximumBehavioralRuleMLScore;
}

- (double)stdevBehavioralRuleSupport
{
  return self->_stdevBehavioralRuleSupport;
}

- (double)stdevBehavioralRuleConfidence
{
  return self->_stdevBehavioralRuleConfidence;
}

- (double)stdevBehavioralRuleLift
{
  return self->_stdevBehavioralRuleLift;
}

- (double)stdevBehavioralRuleConviction
{
  return self->_stdevBehavioralRuleConviction;
}

- (double)stdevBehavioralRulePowerFactor
{
  return self->_stdevBehavioralRulePowerFactor;
}

- (double)stdevBehavioralRuleMLScore
{
  return self->_stdevBehavioralRuleMLScore;
}

- (double)interactionModelScore
{
  return self->_interactionModelScore;
}

- (BOOL)wasShareRecipient
{
  return self->_wasShareRecipient;
}

- (void)setWasShareRecipient:(BOOL)a3
{
  self->_wasShareRecipient = a3;
}

@end
