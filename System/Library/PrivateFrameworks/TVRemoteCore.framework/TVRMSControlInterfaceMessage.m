@implementation TVRMSControlInterfaceMessage

- (void)setSupportsSpeakerSelection:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_supportsSpeakerSelection = a3;
}

- (void)setHasSupportsSpeakerSelection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportsSpeakerSelection
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportsVolumeControl = a3;
}

- (void)setHasSupportsVolumeControl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsVolumeControl
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportsDirectionalControl:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportsDirectionalControl = a3;
}

- (void)setHasSupportsDirectionalControl:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsDirectionalControl
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)TVRMSControlInterfaceMessage;
  -[TVRMSControlInterfaceMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSControlInterfaceMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsVolumeControl);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("supportsVolumeControl"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsSpeakerSelection);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("supportsSpeakerSelection"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsDirectionalControl);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("supportsDirectionalControl"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSControlInterfaceMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[10] = self->_supportsVolumeControl;
    v4[12] |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[9] = self->_supportsSpeakerSelection;
  v4[12] |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    v4[8] = self->_supportsDirectionalControl;
    v4[12] |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_supportsSpeakerSelection;
    *((_BYTE *)result + 12) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 10) = self->_supportsVolumeControl;
  *((_BYTE *)result + 12) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 8) = self->_supportsDirectionalControl;
  *((_BYTE *)result + 12) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0 || self->_supportsSpeakerSelection != v4[9])
      goto LABEL_16;
  }
  else if ((v4[12] & 2) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0 || self->_supportsVolumeControl != v4[10])
      goto LABEL_16;
  }
  else if ((v4[12] & 4) != 0)
  {
    goto LABEL_16;
  }
  v5 = (v4[12] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0 || self->_supportsDirectionalControl != v4[8])
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_supportsSpeakerSelection;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_supportsVolumeControl;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_supportsDirectionalControl;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;

  v4 = (BOOL *)a3;
  v5 = v4[12];
  if ((v5 & 2) == 0)
  {
    if ((v4[12] & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_supportsVolumeControl = v4[10];
    *(_BYTE *)&self->_has |= 4u;
    if (!v4[12])
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_supportsSpeakerSelection = v4[9];
  *(_BYTE *)&self->_has |= 2u;
  v5 = v4[12];
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if (v5)
  {
LABEL_4:
    self->_supportsDirectionalControl = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:

}

- (BOOL)supportsSpeakerSelection
{
  return self->_supportsSpeakerSelection;
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (BOOL)supportsDirectionalControl
{
  return self->_supportsDirectionalControl;
}

@end
