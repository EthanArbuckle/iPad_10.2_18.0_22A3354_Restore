@implementation AWDMETRICSCellularNrSDMActivation

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (int)deployment
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_deployment;
  else
    return 0;
}

- (void)setDeployment:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDeployment
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)deploymentAsString:(int)a3
{
  if (a3 < 3)
    return off_2514297C8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeployment:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEPLOYMENT_SA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEPLOYMENT_NSA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEPLOYMENT_NRDC")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFr1MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_fr1MeasDisabled = a3;
}

- (void)setHasFr1MeasDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasFr1MeasDisabled
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setFr2MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_fr2MeasDisabled = a3;
}

- (void)setHasFr2MeasDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasFr2MeasDisabled
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (int)triggerCause
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_triggerCause;
  else
    return 0;
}

- (void)setTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_triggerCause = a3;
}

- (void)setHasTriggerCause:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTriggerCause
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)triggerCauseAsString:(int)a3
{
  if (a3 < 0x20)
    return off_2514297E0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTriggerCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_AP_SLEEP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_CELLULAR_DATA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_WIFI_GOOD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_VOIP_CALL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_COREMEDIA_STALL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SCREEN_STATUS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_UI_SWITCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_RLGS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_PHS")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_AVS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_LPM")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_VOLTE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_FR1_SCG_SNR")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DCNR")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_FR1_SCG_RLGS")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_MT_DATA")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_FTV_DUP")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DROP_NR_VOIP")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DROP_NR_ULD")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DROP_NR_ENH_BUFF")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_WIFI_ASSOCIATED")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR_SL")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW_SL")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS_SL")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SADC_VONR_CON")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SADC_THERMAL")) & 1) != 0)
  {
    v4 = 30;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_MAX")))
  {
    v4 = 31;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)prevTriggerCause
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_prevTriggerCause;
  else
    return 0;
}

- (void)setPrevTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_prevTriggerCause = a3;
}

- (void)setHasPrevTriggerCause:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPrevTriggerCause
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)prevTriggerCauseAsString:(int)a3
{
  if (a3 < 0x20)
    return off_2514297E0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrevTriggerCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_AP_SLEEP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_CELLULAR_DATA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_WIFI_GOOD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_VOIP_CALL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_COREMEDIA_STALL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SCREEN_STATUS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_UI_SWITCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_RLGS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_PHS")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_AVS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_LPM")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_VOLTE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_FR1_SCG_SNR")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DCNR")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_FR1_SCG_RLGS")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_MT_DATA")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_FTV_DUP")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DROP_NR_VOIP")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DROP_NR_ULD")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_DROP_NR_ENH_BUFF")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_WIFI_ASSOCIATED")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR_SL")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW_SL")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS_SL")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SADC_VONR_CON")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SADC_THERMAL")) & 1) != 0)
  {
    v4 = 30;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_MAX")))
  {
    v4 = 31;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setApNrRecomm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_apNrRecomm = a3;
}

- (void)setHasApNrRecomm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasApNrRecomm
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setApNrRecommConfFactor:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_apNrRecommConfFactor = a3;
}

- (void)setHasApNrRecommConfFactor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasApNrRecommConfFactor
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setDurationInPrevState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationInPrevState = a3;
}

- (void)setHasDurationInPrevState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationInPrevState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)fr
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_fr;
  else
    return 0;
}

- (void)setFr:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fr = a3;
}

- (void)setHasFr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFr
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)frAsString:(int)a3
{
  if (a3 < 3)
    return off_2514298E0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFr:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MMWAVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)prevRat
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_prevRat;
  else
    return 0;
}

- (void)setPrevRat:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_prevRat = a3;
}

- (void)setHasPrevRat:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPrevRat
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)prevRatAsString:(int)a3
{
  if (a3 < 0xE)
    return off_2514298F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrevRat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENDC_SUB6")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENDC_MMW")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR_SA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GSM")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMA")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVDO")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONEXSRLTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONEXHYBRID")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NRDC_SUB6")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NRDC_MMW")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)currentRat
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_currentRat;
  else
    return 0;
}

- (void)setCurrentRat:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_currentRat = a3;
}

- (void)setHasCurrentRat:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCurrentRat
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)currentRatAsString:(int)a3
{
  if (a3 < 0xE)
    return off_2514298F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCurrentRat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENDC_SUB6")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENDC_MMW")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR_SA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GSM")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMA")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVDO")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONEXSRLTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONEXHYBRID")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NRDC_SUB6")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NRDC_MMW")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)newState
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_newState;
  else
    return 0;
}

- (void)setNewState:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_newState = a3;
}

- (void)setHasNewState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNewState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)newStateAsString:(int)a3
{
  if (a3 < 8)
    return off_251429968[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNewState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_DISABLE_SA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_ENABLE_SA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_UNKNOWN_SA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_DISABLE_NR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_DISABLE_FR1")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_DISABLE_FR2")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_ENABLE_NR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_UNKNOWN_STATE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)saVerdict
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_saVerdict;
  else
    return 0;
}

- (void)setSaVerdict:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_saVerdict = a3;
}

- (void)setHasSaVerdict:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSaVerdict
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)saVerdictAsString:(int)a3
{
  if (a3 < 7)
    return off_2514299A8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSaVerdict:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLEMENT_WITH_RAT_CHANGE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLEMENT_WITHOUT_RAT_CHANGE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLEMENT_NOT_RELEVANT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLEMENT_WITH_RAT_CHANGE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLEMENT_WITHOUT_RAT_CHANGE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLEMENT_NOT_RELEVANT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularNrSDMActivation;
  -[AWDMETRICSCellularNrSDMActivation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDMETRICSCellularNrSDMActivation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  uint64_t deployment;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t triggerCause;
  __CFString *v11;
  uint64_t prevTriggerCause;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t fr;
  __CFString *v19;
  uint64_t prevRat;
  __CFString *v21;
  uint64_t currentRat;
  __CFString *v23;
  uint64_t newState;
  __CFString *v25;
  uint64_t saVerdict;
  __CFString *v27;
  id v28;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  deployment = self->_deployment;
  if (deployment >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deployment);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_2514297C8[deployment];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("deployment"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fr1MeasDisabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("fr1_meas_disabled"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fr2MeasDisabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("fr2_meas_disabled"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_24:
  triggerCause = self->_triggerCause;
  if (triggerCause >= 0x20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerCause);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_2514297E0[triggerCause];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("trigger_cause"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_28:
  prevTriggerCause = self->_prevTriggerCause;
  if (prevTriggerCause >= 0x20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_prevTriggerCause);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_2514297E0[prevTriggerCause];
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("prev_trigger_cause"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_apNrRecomm);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ap_nr_recomm"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_apNrRecommConfFactor);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ap_nr_recomm_conf_factor"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationInPrevState);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("duration_in_prev_state"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_subsId);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("subs_id"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_36:
  fr = self->_fr;
  if (fr >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fr);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_2514298E0[fr];
  }
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("fr"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_40:
  prevRat = self->_prevRat;
  if (prevRat >= 0xE)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_prevRat);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = off_2514298F8[prevRat];
  }
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("prev_rat"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_44:
  currentRat = self->_currentRat;
  if (currentRat >= 0xE)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentRat);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_2514298F8[currentRat];
  }
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("current_rat"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0)
      goto LABEL_56;
    goto LABEL_52;
  }
LABEL_48:
  newState = self->_newState;
  if (newState >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_newState);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_251429968[newState];
  }
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("new_state"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_52:
    saVerdict = self->_saVerdict;
    if (saVerdict >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_saVerdict);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_2514299A8[saVerdict];
    }
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("sa_verdict"));

  }
LABEL_56:
  v28 = v3;

  return v28;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularNrSDMActivationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
LABEL_31:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_31;
LABEL_15:
  if ((has & 0x100) != 0)
LABEL_16:
    PBDataWriterWriteInt32Field();
LABEL_17:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 58) = self->_fr1MeasDisabled;
  *((_WORD *)v4 + 30) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v4 + 59) = self->_fr2MeasDisabled;
  *((_WORD *)v4 + 30) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 13) = self->_triggerCause;
  *((_WORD *)v4 + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)v4 + 56) = self->_apNrRecomm;
  *((_WORD *)v4 + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)v4 + 57) = self->_apNrRecommConfFactor;
  *((_WORD *)v4 + 30) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 6) = self->_durationInPrevState;
  *((_WORD *)v4 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 12) = self->_subsId;
  *((_WORD *)v4 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 7) = self->_fr;
  *((_WORD *)v4 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 5) = self->_deployment;
  *((_WORD *)v4 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 9) = self->_prevRat;
  *((_WORD *)v4 + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 4) = self->_currentRat;
  *((_WORD *)v4 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
LABEL_31:
    *((_DWORD *)v4 + 8) = self->_newState;
    *((_WORD *)v4 + 30) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:
  *((_DWORD *)v4 + 10) = self->_prevTriggerCause;
  *((_WORD *)v4 + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_31;
LABEL_15:
  if ((has & 0x100) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 11) = self->_saVerdict;
    *((_WORD *)v4 + 30) |= 0x100u;
  }
LABEL_17:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_WORD *)result + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 58) = self->_fr1MeasDisabled;
  *((_WORD *)result + 30) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)result + 59) = self->_fr2MeasDisabled;
  *((_WORD *)result + 30) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 13) = self->_triggerCause;
  *((_WORD *)result + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)result + 56) = self->_apNrRecomm;
  *((_WORD *)result + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)result + 57) = self->_apNrRecommConfFactor;
  *((_WORD *)result + 30) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 6) = self->_durationInPrevState;
  *((_WORD *)result + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 12) = self->_subsId;
  *((_WORD *)result + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 7) = self->_fr;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 5) = self->_deployment;
  *((_WORD *)result + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 9) = self->_prevRat;
  *((_WORD *)result + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 4) = self->_currentRat;
  *((_WORD *)result + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 10) = self->_prevTriggerCause;
  *((_WORD *)result + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0)
      return result;
    goto LABEL_16;
  }
LABEL_31:
  *((_DWORD *)result + 8) = self->_newState;
  *((_WORD *)result + 30) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    return result;
LABEL_16:
  *((_DWORD *)result + 11) = self->_saVerdict;
  *((_WORD *)result + 30) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_89;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 30);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_89;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x2000) == 0)
      goto LABEL_89;
    if (self->_fr1MeasDisabled)
    {
      if (!*((_BYTE *)v4 + 58))
        goto LABEL_89;
    }
    else if (*((_BYTE *)v4 + 58))
    {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x2000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x4000) == 0)
      goto LABEL_89;
    if (self->_fr2MeasDisabled)
    {
      if (!*((_BYTE *)v4 + 59))
        goto LABEL_89;
    }
    else if (*((_BYTE *)v4 + 59))
    {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x4000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_triggerCause != *((_DWORD *)v4 + 13))
      goto LABEL_89;
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0)
      goto LABEL_89;
    if (self->_apNrRecomm)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_89;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x1000) != 0)
    {
      if (self->_apNrRecommConfFactor)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_89;
        goto LABEL_44;
      }
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_44;
    }
LABEL_89:
    v7 = 0;
    goto LABEL_90;
  }
  if ((*((_WORD *)v4 + 30) & 0x1000) != 0)
    goto LABEL_89;
LABEL_44:
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durationInPrevState != *((_DWORD *)v4 + 6))
      goto LABEL_89;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_subsId != *((_DWORD *)v4 + 12))
      goto LABEL_89;
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_fr != *((_DWORD *)v4 + 7))
      goto LABEL_89;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_deployment != *((_DWORD *)v4 + 5))
      goto LABEL_89;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_prevRat != *((_DWORD *)v4 + 9))
      goto LABEL_89;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_currentRat != *((_DWORD *)v4 + 4))
      goto LABEL_89;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_prevTriggerCause != *((_DWORD *)v4 + 10))
      goto LABEL_89;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_newState != *((_DWORD *)v4 + 8))
      goto LABEL_89;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_saVerdict != *((_DWORD *)v4 + 11))
      goto LABEL_89;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x100) == 0;
  }
LABEL_90:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_fr1MeasDisabled;
      if ((*(_WORD *)&self->_has & 0x4000) != 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_fr2MeasDisabled;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_triggerCause;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_apNrRecomm;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_apNrRecommConfFactor;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_durationInPrevState;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_subsId;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_fr;
    if ((has & 4) != 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_deployment;
    if ((has & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_prevRat;
    if ((has & 2) != 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v13 = 0;
  if ((has & 2) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_currentRat;
    if ((has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  v14 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_prevTriggerCause;
    if ((has & 0x20) != 0)
      goto LABEL_15;
LABEL_30:
    v16 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_16;
LABEL_31:
    v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_29:
  v15 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_30;
LABEL_15:
  v16 = 2654435761 * self->_newState;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_31;
LABEL_16:
  v17 = 2654435761 * self->_saVerdict;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_fr1MeasDisabled = *((_BYTE *)v4 + 58);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x4000) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  self->_fr2MeasDisabled = *((_BYTE *)v4 + 59);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  self->_triggerCause = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  self->_apNrRecomm = *((_BYTE *)v4 + 56);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  self->_apNrRecommConfFactor = *((_BYTE *)v4 + 57);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  self->_durationInPrevState = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  self->_subsId = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  self->_fr = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  self->_deployment = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->_prevRat = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  self->_currentRat = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0)
      goto LABEL_15;
LABEL_31:
    self->_newState = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x20u;
    if ((*((_WORD *)v4 + 30) & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:
  self->_prevTriggerCause = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) != 0)
    goto LABEL_31;
LABEL_15:
  if ((v5 & 0x100) != 0)
  {
LABEL_16:
    self->_saVerdict = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_17:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)fr1MeasDisabled
{
  return self->_fr1MeasDisabled;
}

- (BOOL)fr2MeasDisabled
{
  return self->_fr2MeasDisabled;
}

- (BOOL)apNrRecomm
{
  return self->_apNrRecomm;
}

- (BOOL)apNrRecommConfFactor
{
  return self->_apNrRecommConfFactor;
}

- (unsigned)durationInPrevState
{
  return self->_durationInPrevState;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
