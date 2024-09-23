@implementation NETSchemaNETSessionConnectionNetwork

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasCarrierName
{
  return self->_carrierName != 0;
}

- (void)deleteCarrierName
{
  -[NETSchemaNETSessionConnectionNetwork setCarrierName:](self, "setCarrierName:", 0);
}

- (void)setConnectionMethod:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectionMethod = a3;
}

- (BOOL)hasConnectionMethod
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasConnectionMethod:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteConnectionMethod
{
  -[NETSchemaNETSessionConnectionNetwork setConnectionMethod:](self, "setConnectionMethod:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (BOOL)hasPrimarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName != 0;
}

- (void)deletePrimarySubflowInterfaceName
{
  -[NETSchemaNETSessionConnectionNetwork setPrimarySubflowInterfaceName:](self, "setPrimarySubflowInterfaceName:", 0);
}

- (void)setIsCaptive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_isCaptive = a3;
}

- (BOOL)hasIsCaptive
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasIsCaptive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteIsCaptive
{
  -[NETSchemaNETSessionConnectionNetwork setIsCaptive:](self, "setIsCaptive:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setRssi:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rssi = a3;
}

- (BOOL)hasRssi
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteRssi
{
  -[NETSchemaNETSessionConnectionNetwork setRssi:](self, "setRssi:", 0.0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setSnr:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_snr = a3;
}

- (BOOL)hasSnr
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasSnr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteSnr
{
  -[NETSchemaNETSessionConnectionNetwork setSnr:](self, "setSnr:", 0.0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setAttempCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_attempCount = a3;
}

- (BOOL)hasAttempCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasAttempCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteAttempCount
{
  -[NETSchemaNETSessionConnectionNetwork setAttempCount:](self, "setAttempCount:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setFirstByteTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_firstByteTime = a3;
}

- (BOOL)hasFirstByteTime
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasFirstByteTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteFirstByteTime
{
  -[NETSchemaNETSessionConnectionNetwork setFirstByteTime:](self, "setFirstByteTime:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setStartToDNSResolution:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_startToDNSResolution = a3;
}

- (BOOL)hasStartToDNSResolution
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasStartToDNSResolution:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteStartToDNSResolution
{
  -[NETSchemaNETSessionConnectionNetwork setStartToDNSResolution:](self, "setStartToDNSResolution:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setDnsResolutionTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_dnsResolutionTime = a3;
}

- (BOOL)hasDnsResolutionTime
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasDnsResolutionTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteDnsResolutionTime
{
  -[NETSchemaNETSessionConnectionNetwork setDnsResolutionTime:](self, "setDnsResolutionTime:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setTlsVersion:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_tlsVersion = a3;
}

- (BOOL)hasTlsVersion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasTlsVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteTlsVersion
{
  -[NETSchemaNETSessionConnectionNetwork setTlsVersion:](self, "setTlsVersion:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setTlsHandshakeTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_tlsHandshakeTime = a3;
}

- (BOOL)hasTlsHandshakeTime
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasTlsHandshakeTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteTlsHandshakeTime
{
  -[NETSchemaNETSessionConnectionNetwork setTlsHandshakeTime:](self, "setTlsHandshakeTime:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setConnectionEstablishmentTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_connectionEstablishmentTime = a3;
}

- (BOOL)hasConnectionEstablishmentTime
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasConnectionEstablishmentTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteConnectionEstablishmentTime
{
  -[NETSchemaNETSessionConnectionNetwork setConnectionEstablishmentTime:](self, "setConnectionEstablishmentTime:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setConnectionStartToEstablishmentTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_connectionStartToEstablishmentTime = a3;
}

- (BOOL)hasConnectionStartToEstablishmentTime
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasConnectionStartToEstablishmentTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteConnectionStartToEstablishmentTime
{
  -[NETSchemaNETSessionConnectionNetwork setConnectionStartToEstablishmentTime:](self, "setConnectionStartToEstablishmentTime:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setConnectionStartToTLSHandshake:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_connectionStartToTLSHandshake = a3;
}

- (BOOL)hasConnectionStartToTLSHandshake
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasConnectionStartToTLSHandshake:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteConnectionStartToTLSHandshake
{
  -[NETSchemaNETSessionConnectionNetwork setConnectionStartToTLSHandshake:](self, "setConnectionStartToTLSHandshake:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setClearChannelAssessmentScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_clearChannelAssessmentScore = a3;
}

- (BOOL)hasClearChannelAssessmentScore
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasClearChannelAssessmentScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)deleteClearChannelAssessmentScore
{
  -[NETSchemaNETSessionConnectionNetwork setClearChannelAssessmentScore:](self, "setClearChannelAssessmentScore:", 0.0);
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETSessionConnectionNetworkReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  __int16 has;
  void *v7;
  id v8;

  v8 = a3;
  -[NETSchemaNETSessionConnectionNetwork carrierName](self, "carrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[NETSchemaNETSessionConnectionNetwork primarySubflowInterfaceName](self, "primarySubflowInterfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = v8;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_17:
    if ((has & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_18:
    if ((has & 0x1000) == 0)
      goto LABEL_19;
LABEL_33:
    PBDataWriterWriteUint64Field();
    v7 = v8;
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
    goto LABEL_33;
LABEL_19:
  if ((has & 0x2000) != 0)
  {
LABEL_20:
    PBDataWriterWriteDoubleField();
    v7 = v8;
  }
LABEL_21:

}

- (BOOL)isEqual:(id)a3
{
  _WORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int connectionMethod;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  $E3BE65C9752B703C9C6C61D3C06CA71F has;
  int v21;
  unsigned int v22;
  int isCaptive;
  int v24;
  double rssi;
  double v26;
  int v27;
  double snr;
  double v29;
  int v30;
  unsigned int attempCount;
  int v32;
  unint64_t firstByteTime;
  int v34;
  unint64_t startToDNSResolution;
  int v36;
  unint64_t dnsResolutionTime;
  int v38;
  int tlsVersion;
  int v40;
  unint64_t tlsHandshakeTime;
  int v42;
  unint64_t connectionEstablishmentTime;
  int v44;
  unint64_t connectionStartToEstablishmentTime;
  int v46;
  unint64_t connectionStartToTLSHandshake;
  int v48;
  double clearChannelAssessmentScore;
  double v50;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[NETSchemaNETSessionConnectionNetwork carrierName](self, "carrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[NETSchemaNETSessionConnectionNetwork carrierName](self, "carrierName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NETSchemaNETSessionConnectionNetwork carrierName](self, "carrierName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carrierName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_WORD *)&self->_has & 1) != (v4[68] & 1))
    goto LABEL_15;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    connectionMethod = self->_connectionMethod;
    if (connectionMethod != objc_msgSend(v4, "connectionMethod"))
      goto LABEL_15;
  }
  -[NETSchemaNETSessionConnectionNetwork primarySubflowInterfaceName](self, "primarySubflowInterfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primarySubflowInterfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  -[NETSchemaNETSessionConnectionNetwork primarySubflowInterfaceName](self, "primarySubflowInterfaceName");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NETSchemaNETSessionConnectionNetwork primarySubflowInterfaceName](self, "primarySubflowInterfaceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primarySubflowInterfaceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_15;
  }
  else
  {

  }
  has = self->_has;
  v21 = (*(unsigned int *)&has >> 1) & 1;
  v22 = (unsigned __int16)v4[68];
  if (v21 == ((v22 >> 1) & 1))
  {
    if (v21)
    {
      isCaptive = self->_isCaptive;
      if (isCaptive != objc_msgSend(v4, "isCaptive"))
        goto LABEL_15;
      has = self->_has;
      v22 = (unsigned __int16)v4[68];
    }
    v24 = (*(unsigned int *)&has >> 2) & 1;
    if (v24 == ((v22 >> 2) & 1))
    {
      if (v24)
      {
        rssi = self->_rssi;
        objc_msgSend(v4, "rssi");
        if (rssi != v26)
          goto LABEL_15;
        has = self->_has;
        v22 = (unsigned __int16)v4[68];
      }
      v27 = (*(unsigned int *)&has >> 3) & 1;
      if (v27 == ((v22 >> 3) & 1))
      {
        if (v27)
        {
          snr = self->_snr;
          objc_msgSend(v4, "snr");
          if (snr != v29)
            goto LABEL_15;
          has = self->_has;
          v22 = (unsigned __int16)v4[68];
        }
        v30 = (*(unsigned int *)&has >> 4) & 1;
        if (v30 == ((v22 >> 4) & 1))
        {
          if (v30)
          {
            attempCount = self->_attempCount;
            if (attempCount != objc_msgSend(v4, "attempCount"))
              goto LABEL_15;
            has = self->_has;
            v22 = (unsigned __int16)v4[68];
          }
          v32 = (*(unsigned int *)&has >> 5) & 1;
          if (v32 == ((v22 >> 5) & 1))
          {
            if (v32)
            {
              firstByteTime = self->_firstByteTime;
              if (firstByteTime != objc_msgSend(v4, "firstByteTime"))
                goto LABEL_15;
              has = self->_has;
              v22 = (unsigned __int16)v4[68];
            }
            v34 = (*(unsigned int *)&has >> 6) & 1;
            if (v34 == ((v22 >> 6) & 1))
            {
              if (v34)
              {
                startToDNSResolution = self->_startToDNSResolution;
                if (startToDNSResolution != objc_msgSend(v4, "startToDNSResolution"))
                  goto LABEL_15;
                has = self->_has;
                v22 = (unsigned __int16)v4[68];
              }
              v36 = (*(unsigned int *)&has >> 7) & 1;
              if (v36 == ((v22 >> 7) & 1))
              {
                if (v36)
                {
                  dnsResolutionTime = self->_dnsResolutionTime;
                  if (dnsResolutionTime != objc_msgSend(v4, "dnsResolutionTime"))
                    goto LABEL_15;
                  has = self->_has;
                  v22 = (unsigned __int16)v4[68];
                }
                v38 = (*(unsigned int *)&has >> 8) & 1;
                if (v38 == ((v22 >> 8) & 1))
                {
                  if (v38)
                  {
                    tlsVersion = self->_tlsVersion;
                    if (tlsVersion != objc_msgSend(v4, "tlsVersion"))
                      goto LABEL_15;
                    has = self->_has;
                    v22 = (unsigned __int16)v4[68];
                  }
                  v40 = (*(unsigned int *)&has >> 9) & 1;
                  if (v40 == ((v22 >> 9) & 1))
                  {
                    if (v40)
                    {
                      tlsHandshakeTime = self->_tlsHandshakeTime;
                      if (tlsHandshakeTime != objc_msgSend(v4, "tlsHandshakeTime"))
                        goto LABEL_15;
                      has = self->_has;
                      v22 = (unsigned __int16)v4[68];
                    }
                    v42 = (*(unsigned int *)&has >> 10) & 1;
                    if (v42 == ((v22 >> 10) & 1))
                    {
                      if (v42)
                      {
                        connectionEstablishmentTime = self->_connectionEstablishmentTime;
                        if (connectionEstablishmentTime != objc_msgSend(v4, "connectionEstablishmentTime"))
                          goto LABEL_15;
                        has = self->_has;
                        v22 = (unsigned __int16)v4[68];
                      }
                      v44 = (*(unsigned int *)&has >> 11) & 1;
                      if (v44 == ((v22 >> 11) & 1))
                      {
                        if (v44)
                        {
                          connectionStartToEstablishmentTime = self->_connectionStartToEstablishmentTime;
                          if (connectionStartToEstablishmentTime != objc_msgSend(v4, "connectionStartToEstablishmentTime"))goto LABEL_15;
                          has = self->_has;
                          v22 = (unsigned __int16)v4[68];
                        }
                        v46 = (*(unsigned int *)&has >> 12) & 1;
                        if (v46 == ((v22 >> 12) & 1))
                        {
                          if (v46)
                          {
                            connectionStartToTLSHandshake = self->_connectionStartToTLSHandshake;
                            if (connectionStartToTLSHandshake != objc_msgSend(v4, "connectionStartToTLSHandshake"))
                              goto LABEL_15;
                            has = self->_has;
                            v22 = (unsigned __int16)v4[68];
                          }
                          v48 = (*(unsigned int *)&has >> 13) & 1;
                          if (v48 == ((v22 >> 13) & 1))
                          {
                            if (!v48
                              || (clearChannelAssessmentScore = self->_clearChannelAssessmentScore,
                                  objc_msgSend(v4, "clearChannelAssessmentScore"),
                                  clearChannelAssessmentScore == v50))
                            {
                              v18 = 1;
                              goto LABEL_16;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  __int16 has;
  double rssi;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double snr;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  double clearChannelAssessmentScore;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  uint64_t v35;
  NSUInteger v36;

  v36 = -[NSString hash](self->_carrierName, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
    v35 = 2654435761 * self->_connectionMethod;
  else
    v35 = 0;
  v34 = -[NSString hash](self->_primarySubflowInterfaceName, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v33 = 2654435761 * self->_isCaptive;
    if ((has & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    goto LABEL_14;
  }
  v33 = 0;
  if ((has & 4) == 0)
    goto LABEL_11;
LABEL_6:
  rssi = self->_rssi;
  v5 = -rssi;
  if (rssi >= 0.0)
    v5 = self->_rssi;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  if ((has & 8) != 0)
  {
    v10 = v8;
    snr = self->_snr;
    v12 = -snr;
    if (snr >= 0.0)
      v12 = self->_snr;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      v8 = v10;
      if (v14 > 0.0)
        v9 += (unint64_t)v14;
    }
    else
    {
      v9 -= (unint64_t)fabs(v14);
      v8 = v10;
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x10) != 0)
  {
    v15 = 2654435761 * self->_attempCount;
    if ((has & 0x20) != 0)
    {
LABEL_24:
      v16 = 2654435761u * self->_firstByteTime;
      if ((has & 0x40) != 0)
        goto LABEL_25;
      goto LABEL_38;
    }
  }
  else
  {
    v15 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_24;
  }
  v16 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_25:
    v17 = 2654435761u * self->_startToDNSResolution;
    if ((has & 0x80) != 0)
      goto LABEL_26;
    goto LABEL_39;
  }
LABEL_38:
  v17 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_26:
    v18 = 2654435761u * self->_dnsResolutionTime;
    if ((has & 0x100) != 0)
      goto LABEL_27;
    goto LABEL_40;
  }
LABEL_39:
  v18 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_27:
    v19 = 2654435761 * self->_tlsVersion;
    if ((has & 0x200) != 0)
      goto LABEL_28;
    goto LABEL_41;
  }
LABEL_40:
  v19 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_28:
    v20 = 2654435761u * self->_tlsHandshakeTime;
    if ((has & 0x400) != 0)
      goto LABEL_29;
    goto LABEL_42;
  }
LABEL_41:
  v20 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_29:
    v21 = 2654435761u * self->_connectionEstablishmentTime;
    if ((has & 0x800) != 0)
      goto LABEL_30;
    goto LABEL_43;
  }
LABEL_42:
  v21 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_30:
    v22 = 2654435761u * self->_connectionStartToEstablishmentTime;
    if ((has & 0x1000) != 0)
      goto LABEL_31;
LABEL_44:
    v23 = 0;
    if ((has & 0x2000) != 0)
      goto LABEL_32;
LABEL_45:
    v29 = 0;
    return v35 ^ v36 ^ v34 ^ v33 ^ v8 ^ v9 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v29;
  }
LABEL_43:
  v22 = 0;
  if ((has & 0x1000) == 0)
    goto LABEL_44;
LABEL_31:
  v23 = 2654435761u * self->_connectionStartToTLSHandshake;
  if ((has & 0x2000) == 0)
    goto LABEL_45;
LABEL_32:
  v31 = v20;
  v32 = v19;
  v24 = v8;
  clearChannelAssessmentScore = self->_clearChannelAssessmentScore;
  v26 = -clearChannelAssessmentScore;
  if (clearChannelAssessmentScore >= 0.0)
    v26 = self->_clearChannelAssessmentScore;
  v27 = floor(v26 + 0.5);
  v28 = (v26 - v27) * 1.84467441e19;
  v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
  if (v28 >= 0.0)
  {
    v8 = v24;
    v20 = v31;
    v19 = v32;
    if (v28 > 0.0)
      v29 += (unint64_t)v28;
  }
  else
  {
    v29 -= (unint64_t)fabs(v28);
    v8 = v24;
    v20 = v31;
    v19 = v32;
  }
  return v35 ^ v36 ^ v34 ^ v33 ^ v8 ^ v9 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v29;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int16 has;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETSessionConnectionNetwork attempCount](self, "attempCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("attempCount"));

  }
  if (self->_carrierName)
  {
    -[NETSchemaNETSessionConnectionNetwork carrierName](self, "carrierName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("carrierName"));

  }
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[NETSchemaNETSessionConnectionNetwork clearChannelAssessmentScore](self, "clearChannelAssessmentScore");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("clearChannelAssessmentScore"));

    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork connectionEstablishmentTime](self, "connectionEstablishmentTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("connectionEstablishmentTime"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_24:
  v15 = -[NETSchemaNETSessionConnectionNetwork connectionMethod](self, "connectionMethod") - 1;
  if (v15 > 6)
    v16 = CFSTR("NETCONNECTIONMETHOD_UNKNOWN");
  else
    v16 = off_1E5631958[v15];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("connectionMethod"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork connectionStartToEstablishmentTime](self, "connectionStartToEstablishmentTime"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("connectionStartToEstablishmentTime"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork connectionStartToTLSHandshake](self, "connectionStartToTLSHandshake"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("connectionStartToTLSHandshake"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork dnsResolutionTime](self, "dnsResolutionTime"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("dnsResolutionTime"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork firstByteTime](self, "firstByteTime"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("firstByteTime"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETSessionConnectionNetwork isCaptive](self, "isCaptive"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isCaptive"));

  }
LABEL_14:
  if (self->_primarySubflowInterfaceName)
  {
    -[NETSchemaNETSessionConnectionNetwork primarySubflowInterfaceName](self, "primarySubflowInterfaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("primarySubflowInterfaceName"));

  }
  v11 = (__int16)self->_has;
  if ((v11 & 4) != 0)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[NETSchemaNETSessionConnectionNetwork rssi](self, "rssi");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rssi"));

    v11 = (__int16)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_18:
      if ((v11 & 0x40) == 0)
        goto LABEL_19;
      goto LABEL_28;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_18;
  }
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[NETSchemaNETSessionConnectionNetwork snr](self, "snr");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("snr"));

  v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0)
      goto LABEL_20;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork tlsHandshakeTime](self, "tlsHandshakeTime"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("tlsHandshakeTime"));

    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_41;
    goto LABEL_30;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork startToDNSResolution](self, "startToDNSResolution"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("startToDNSResolution"));

  v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0)
    goto LABEL_29;
LABEL_20:
  if ((v11 & 0x100) == 0)
    goto LABEL_41;
LABEL_30:
  v23 = -[NETSchemaNETSessionConnectionNetwork tlsVersion](self, "tlsVersion") - 1;
  if (v23 > 5)
    v24 = CFSTR("NETTLSVERSION_UNKNOWN");
  else
    v24 = off_1E5631990[v23];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("tlsVersion"));
LABEL_41:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETSessionConnectionNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NETSchemaNETSessionConnectionNetwork)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETSessionConnectionNetwork *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[NETSchemaNETSessionConnectionNetwork initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETSessionConnectionNetwork)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETSessionConnectionNetwork *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NETSchemaNETSessionConnectionNetwork *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NETSchemaNETSessionConnectionNetwork;
  v5 = -[NETSchemaNETSessionConnectionNetwork init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carrierName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[NETSchemaNETSessionConnectionNetwork setCarrierName:](v5, "setCarrierName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionMethod"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setConnectionMethod:](v5, "setConnectionMethod:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primarySubflowInterfaceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[NETSchemaNETSessionConnectionNetwork setPrimarySubflowInterfaceName:](v5, "setPrimarySubflowInterfaceName:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCaptive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setIsCaptive:](v5, "setIsCaptive:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rssi"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[NETSchemaNETSessionConnectionNetwork setRssi:](v5, "setRssi:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snr"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      -[NETSchemaNETSessionConnectionNetwork setSnr:](v5, "setSnr:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attempCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setAttempCount:](v5, "setAttempCount:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstByteTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setFirstByteTime:](v5, "setFirstByteTime:", objc_msgSend(v15, "unsignedLongLongValue"));
    v32 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToDNSResolution"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setStartToDNSResolution:](v5, "setStartToDNSResolution:", objc_msgSend(v16, "unsignedLongLongValue"));
    v31 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dnsResolutionTime"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setDnsResolutionTime:](v5, "setDnsResolutionTime:", objc_msgSend(v17, "unsignedLongLongValue"));
    v27 = v17;
    v34 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tlsVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setTlsVersion:](v5, "setTlsVersion:", objc_msgSend(v18, "intValue"));
    v33 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tlsHandshakeTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setTlsHandshakeTime:](v5, "setTlsHandshakeTime:", objc_msgSend(v19, "unsignedLongLongValue"));
    v30 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionEstablishmentTime"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setConnectionEstablishmentTime:](v5, "setConnectionEstablishmentTime:", objc_msgSend(v20, "unsignedLongLongValue"));
    v28 = v16;
    v29 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionStartToEstablishmentTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setConnectionStartToEstablishmentTime:](v5, "setConnectionStartToEstablishmentTime:", objc_msgSend(v21, "unsignedLongLongValue"));
    v22 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionStartToTLSHandshake"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionNetwork setConnectionStartToTLSHandshake:](v5, "setConnectionStartToTLSHandshake:", objc_msgSend(v23, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clearChannelAssessmentScore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "doubleValue");
      -[NETSchemaNETSessionConnectionNetwork setClearChannelAssessmentScore:](v5, "setClearChannelAssessmentScore:");
    }
    v25 = v5;

  }
  return v5;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)connectionMethod
{
  return self->_connectionMethod;
}

- (NSString)primarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName;
}

- (void)setPrimarySubflowInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isCaptive
{
  return self->_isCaptive;
}

- (double)rssi
{
  return self->_rssi;
}

- (double)snr
{
  return self->_snr;
}

- (unsigned)attempCount
{
  return self->_attempCount;
}

- (unint64_t)firstByteTime
{
  return self->_firstByteTime;
}

- (unint64_t)startToDNSResolution
{
  return self->_startToDNSResolution;
}

- (unint64_t)dnsResolutionTime
{
  return self->_dnsResolutionTime;
}

- (int)tlsVersion
{
  return self->_tlsVersion;
}

- (unint64_t)tlsHandshakeTime
{
  return self->_tlsHandshakeTime;
}

- (unint64_t)connectionEstablishmentTime
{
  return self->_connectionEstablishmentTime;
}

- (unint64_t)connectionStartToEstablishmentTime
{
  return self->_connectionStartToEstablishmentTime;
}

- (unint64_t)connectionStartToTLSHandshake
{
  return self->_connectionStartToTLSHandshake;
}

- (double)clearChannelAssessmentScore
{
  return self->_clearChannelAssessmentScore;
}

- (void)setHasCarrierName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasPrimarySubflowInterfaceName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primarySubflowInterfaceName, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
}

@end
