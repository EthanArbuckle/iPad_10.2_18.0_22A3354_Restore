@implementation WCM_Rc1NbDynamicPolicy

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id uplinkLowFreq_Hz;
  id uplinkHighFreq_Hz;
  id downlinkLowFreq_Hz;
  id downlinkHighFreq_Hz;
  int nbChannelToAvoidStart;
  int nbChannelToAvoidEnd;
  int Rc1IssueChannel;
  unsigned int Rc1AntBitmap;
  int mitigationType;
  unsigned int cellAgressorAntBitmap;
  int cellTxPowerCap_16th_dBm;
  BOOL v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    uplinkLowFreq_Hz = (id)self->_uplinkLowFreq_Hz;
    if (uplinkLowFreq_Hz != objc_msgSend(v6, "uplinkLowFreq_Hz"))
      goto LABEL_13;
    uplinkHighFreq_Hz = (id)self->_uplinkHighFreq_Hz;
    if (uplinkHighFreq_Hz != objc_msgSend(v6, "uplinkHighFreq_Hz"))
      goto LABEL_13;
    downlinkLowFreq_Hz = (id)self->_downlinkLowFreq_Hz;
    if (downlinkLowFreq_Hz != objc_msgSend(v6, "downlinkLowFreq_Hz"))
      goto LABEL_13;
    downlinkHighFreq_Hz = (id)self->_downlinkHighFreq_Hz;
    if (downlinkHighFreq_Hz == objc_msgSend(v6, "downlinkHighFreq_Hz")
      && (nbChannelToAvoidStart = self->_nbChannelToAvoidStart,
          nbChannelToAvoidStart == objc_msgSend(v6, "nbChannelToAvoidStart"))
      && (nbChannelToAvoidEnd = self->_nbChannelToAvoidEnd,
          nbChannelToAvoidEnd == objc_msgSend(v6, "nbChannelToAvoidEnd"))
      && (Rc1IssueChannel = self->_Rc1IssueChannel, Rc1IssueChannel == objc_msgSend(v6, "Rc1IssueChannel"))
      && (Rc1AntBitmap = self->_Rc1AntBitmap, Rc1AntBitmap == objc_msgSend(v6, "Rc1AntBitmap"))
      && (mitigationType = self->_mitigationType, mitigationType == objc_msgSend(v6, "mitigationType"))
      && (cellAgressorAntBitmap = self->_cellAgressorAntBitmap,
          cellAgressorAntBitmap == objc_msgSend(v6, "cellAgressorAntBitmap")))
    {
      cellTxPowerCap_16th_dBm = self->_cellTxPowerCap_16th_dBm;
      v18 = cellTxPowerCap_16th_dBm == objc_msgSend(v6, "cellTxPowerCap_16th_dBm");
    }
    else
    {
LABEL_13:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int)bandInfoType
{
  return self->_bandInfoType;
}

- (void)setBandInfoType:(int)a3
{
  self->_bandInfoType = a3;
}

- (unsigned)cellBand
{
  return self->_cellBand;
}

- (void)setCellBand:(unsigned int)a3
{
  self->_cellBand = a3;
}

- (unint64_t)downlinkLowFreq_Hz
{
  return self->_downlinkLowFreq_Hz;
}

- (void)setDownlinkLowFreq_Hz:(unint64_t)a3
{
  self->_downlinkLowFreq_Hz = a3;
}

- (unint64_t)downlinkHighFreq_Hz
{
  return self->_downlinkHighFreq_Hz;
}

- (void)setDownlinkHighFreq_Hz:(unint64_t)a3
{
  self->_downlinkHighFreq_Hz = a3;
}

- (unint64_t)uplinkLowFreq_Hz
{
  return self->_uplinkLowFreq_Hz;
}

- (void)setUplinkLowFreq_Hz:(unint64_t)a3
{
  self->_uplinkLowFreq_Hz = a3;
}

- (unint64_t)uplinkHighFreq_Hz
{
  return self->_uplinkHighFreq_Hz;
}

- (void)setUplinkHighFreq_Hz:(unint64_t)a3
{
  self->_uplinkHighFreq_Hz = a3;
}

- (int)Rc1IssueChannel
{
  return self->_Rc1IssueChannel;
}

- (void)setRc1IssueChannel:(int)a3
{
  self->_Rc1IssueChannel = a3;
}

- (unsigned)Rc1AntBitmap
{
  return self->_Rc1AntBitmap;
}

- (void)setRc1AntBitmap:(unsigned int)a3
{
  self->_Rc1AntBitmap = a3;
}

- (unsigned)Rc1PriorityBitmap
{
  return self->_Rc1PriorityBitmap;
}

- (void)setRc1PriorityBitmap:(unsigned int)a3
{
  self->_Rc1PriorityBitmap = a3;
}

- (unsigned)cellAgressorAntBitmap
{
  return self->_cellAgressorAntBitmap;
}

- (void)setCellAgressorAntBitmap:(unsigned int)a3
{
  self->_cellAgressorAntBitmap = a3;
}

- (int)cellTxPowerCap_16th_dBm
{
  return self->_cellTxPowerCap_16th_dBm;
}

- (void)setCellTxPowerCap_16th_dBm:(int)a3
{
  self->_cellTxPowerCap_16th_dBm = a3;
}

- (int)mitigationType
{
  return self->_mitigationType;
}

- (void)setMitigationType:(int)a3
{
  self->_mitigationType = a3;
}

- (int)nbChannelToAvoidStart
{
  return self->_nbChannelToAvoidStart;
}

- (void)setNbChannelToAvoidStart:(int)a3
{
  self->_nbChannelToAvoidStart = a3;
}

- (int)nbChannelToAvoidEnd
{
  return self->_nbChannelToAvoidEnd;
}

- (void)setNbChannelToAvoidEnd:(int)a3
{
  self->_nbChannelToAvoidEnd = a3;
}

@end
