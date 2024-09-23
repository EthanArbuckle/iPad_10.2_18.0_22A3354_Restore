@implementation NRLinkUpgradeReport

- (id)description
{
  id v3;
  unint64_t advice;
  __CFString *v5;
  unint64_t reason;
  id v7;
  void *v8;
  __CFString *v9;
  id v10;

  v3 = objc_alloc((Class)NSString);
  advice = self->_advice;
  v5 = CFSTR("None");
  switch(advice)
  {
    case 0uLL:
      break;
    case 1uLL:
      v5 = CFSTR("BluetoothDefault");
      break;
    case 2uLL:
      v5 = CFSTR("BluetoothClassic");
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      v5 = CFSTR("WiFi");
      break;
    default:
      if (advice == 128)
        v5 = CFSTR("NoUpgrade");
      else
LABEL_5:
        v5 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown(%llu)"), advice);
      break;
  }
  reason = self->_reason;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = v7;
  if ((reason & 0x100) != 0)
  {
    objc_msgSend(v7, "addObject:", CFSTR("TransferSizeSmall"));
    if ((reason & 0x200) == 0)
    {
LABEL_10:
      if ((reason & 0x400) == 0)
        goto LABEL_11;
      goto LABEL_37;
    }
  }
  else if ((reason & 0x200) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v8, "addObject:", CFSTR("TransferSizeMedium"));
  if ((reason & 0x400) == 0)
  {
LABEL_11:
    if ((reason & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v8, "addObject:", CFSTR("TransferSizeLarge"));
  if ((reason & 0x4000) == 0)
  {
LABEL_12:
    if ((reason & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v8, "addObject:", CFSTR("ServiceClassVoice"));
  if ((reason & 0x8000) == 0)
  {
LABEL_13:
    if ((reason & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v8, "addObject:", CFSTR("ServiceClassVideo"));
  if ((reason & 0x40000) == 0)
  {
LABEL_14:
    if ((reason & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v8, "addObject:", CFSTR("RadioConditionPoor"));
  if ((reason & 0x80000) == 0)
  {
LABEL_15:
    if ((reason & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v8, "addObject:", CFSTR("RadioConditionFair"));
  if ((reason & 0x100000) == 0)
  {
LABEL_16:
    if ((reason & 0x200000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v8, "addObject:", CFSTR("RadioConditionGood"));
  if ((reason & 0x200000) == 0)
  {
LABEL_17:
    if ((reason & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v8, "addObject:", CFSTR("RadioConditionBest"));
  if ((reason & 0x400000) == 0)
  {
LABEL_18:
    if ((reason & 0x800000) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v8, "addObject:", CFSTR("CongestionHigh"));
  if ((reason & 0x800000) == 0)
  {
LABEL_19:
    if ((reason & 0x1000000) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v8, "addObject:", CFSTR("CongestionNotHigh"));
  if ((reason & 0x1000000) == 0)
  {
LABEL_20:
    if ((reason & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v8, "addObject:", CFSTR("PluggedIn"));
  if ((reason & 0x2000000) == 0)
  {
LABEL_21:
    if ((reason & 0x4000000) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v8, "addObject:", CFSTR("NotPluggedIn"));
  if ((reason & 0x4000000) == 0)
  {
LABEL_22:
    if ((reason & 0x8000000) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v8, "addObject:", CFSTR("BatteryPercentagePoor"));
  if ((reason & 0x8000000) == 0)
  {
LABEL_23:
    if ((reason & 0x10000000) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v8, "addObject:", CFSTR("BatteryPercentageFair"));
  if ((reason & 0x10000000) == 0)
  {
LABEL_24:
    if ((reason & 0x20000000) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v8, "addObject:", CFSTR("BatteryPercentageGood"));
  if ((reason & 0x20000000) == 0)
  {
LABEL_25:
    if ((reason & 0x100000000000000) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v8, "addObject:", CFSTR("BatteryPercentageBest"));
  if ((reason & 0x100000000000000) == 0)
  {
LABEL_26:
    if ((reason & 0x200000000000000) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v8, "addObject:", CFSTR("NSURLPathDataTransferComplete"));
  if ((reason & 0x200000000000000) == 0)
  {
LABEL_27:
    if ((reason & 0x400000000000000) == 0)
      goto LABEL_28;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v8, "addObject:", CFSTR("RecommendationEngineRestarted"));
  if ((reason & 0x400000000000000) == 0)
  {
LABEL_28:
    if ((reason & 0x800000000000000) == 0)
      goto LABEL_29;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v8, "addObject:", CFSTR("UnexpectedLinkSwitch"));
  if ((reason & 0x800000000000000) == 0)
  {
LABEL_29:
    if ((reason & 0x1000000000000000) == 0)
      goto LABEL_30;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v8, "addObject:", CFSTR("CompanionLinkInactivity"));
  if ((reason & 0x1000000000000000) == 0)
  {
LABEL_30:
    if ((reason & 0x2000000000000000) == 0)
      goto LABEL_31;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v8, "addObject:", CFSTR("RadioConditionsDeteriorated"));
  if ((reason & 0x2000000000000000) == 0)
  {
LABEL_31:
    if ((reason & 0x4000000000000000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_57:
  objc_msgSend(v8, "addObject:", CFSTR("BatteryConditionsDeteriorated"));
  if ((reason & 0x4000000000000000) != 0)
LABEL_32:
    objc_msgSend(v8, "addObject:", CFSTR("LinkSwitchFailure"));
LABEL_33:
  if (objc_msgSend(v8, "count"))
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
  else
    v9 = CFSTR("<none>");

  v10 = objc_msgSend(v3, "initWithFormat:", CFSTR("[%@ %@ since:%.2f rate:%llu/hr]"), v5, v9, *(_QWORD *)&self->_timeSinceLastAdvice, self->_rateOfAdvicePerHour);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NRLinkUpgradeReport *v4;
  uint64_t v5;
  NRLinkUpgradeReport *v6;
  unint64_t advice;
  BOOL v8;

  v4 = (NRLinkUpgradeReport *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class(NRLinkUpgradeReport);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      advice = self->_advice;
      if (v6)
      {
        if (advice == v6->_advice)
        {
          advice = v6->_reason;
LABEL_6:
          v8 = self->_reason == advice;
LABEL_11:

          goto LABEL_12;
        }
      }
      else if (!advice)
      {
        goto LABEL_6;
      }
      v8 = 0;
      goto LABEL_11;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void)setAdvice:(unint64_t)a3
{
  self->_advice = a3;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void)setThermalLevel:(unsigned __int8)a3
{
  self->_thermalLevel = a3;
}

- (void)setBattery:(unsigned __int8)a3
{
  self->_battery = a3;
}

- (unint64_t)endAdvice
{
  return self->_endAdvice;
}

- (void)setEndAdvice:(unint64_t)a3
{
  self->_endAdvice = a3;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(unint64_t)a3
{
  self->_endReason = a3;
}

- (double)timeSinceLastAdvice
{
  return self->_timeSinceLastAdvice;
}

- (void)setTimeSinceLastAdvice:(double)a3
{
  self->_timeSinceLastAdvice = a3;
}

- (unint64_t)rateOfAdvicePerHour
{
  return self->_rateOfAdvicePerHour;
}

- (void)setRateOfAdvicePerHour:(unint64_t)a3
{
  self->_rateOfAdvicePerHour = a3;
}

@end
