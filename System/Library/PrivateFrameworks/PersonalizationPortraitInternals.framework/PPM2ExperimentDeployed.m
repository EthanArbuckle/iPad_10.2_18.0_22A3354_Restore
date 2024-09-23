@implementation PPM2ExperimentDeployed

- (void)setDelay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_delay = a3;
}

- (void)setHasDelay:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDelay
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasNamespaceName
{
  return self->_namespaceName != 0;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
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
  v8.super_class = (Class)PPM2ExperimentDeployed;
  -[PPM2ExperimentDeployed description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2ExperimentDeployed dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *namespaceName;
  NSString *activeTreatments;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_delay);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("delay"));

  }
  namespaceName = self->_namespaceName;
  if (namespaceName)
    objc_msgSend(v3, "setObject:forKey:", namespaceName, CFSTR("namespaceName"));
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2ExperimentDeployedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_namespaceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_delay;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_namespaceName)
  {
    objc_msgSend(v4, "setNamespaceName:");
    v4 = v5;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v5, "setActiveTreatments:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_delay;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_namespaceName, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *namespaceName;
  NSString *activeTreatments;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_delay != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  namespaceName = self->_namespaceName;
  if ((unint64_t)namespaceName | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](namespaceName, "isEqual:"))
  {
    goto LABEL_11;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](activeTreatments, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_delay;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_namespaceName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_activeTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[8] & 1) != 0)
  {
    self->_delay = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PPM2ExperimentDeployed setNamespaceName:](self, "setNamespaceName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2ExperimentDeployed setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v5;
  }

}

- (unsigned)delay
{
  return self->_delay;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setNamespaceName:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceName, a3);
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
