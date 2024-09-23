@implementation SharedChannelActivityResponse

- (BOOL)hasActivationResponse
{
  return self->_activationResponse != 0;
}

- (void)setActivationResponse:(id)a3
{
  ChannelActivityActivationResponse *v4;
  ChannelActivityActivationResponse *activationResponse;

  v4 = (ChannelActivityActivationResponse *)a3;
  -[SharedChannelActivityResponse clearOneofValuesForResponse](self, "clearOneofValuesForResponse");
  *(_BYTE *)&self->_has |= 1u;
  self->_response = 1;
  activationResponse = self->_activationResponse;
  self->_activationResponse = v4;

}

- (BOOL)hasDeactivationResponse
{
  return self->_deactivationResponse != 0;
}

- (void)setDeactivationResponse:(id)a3
{
  ChannelActivityDeactivationResponse *v4;
  ChannelActivityDeactivationResponse *deactivationResponse;

  v4 = (ChannelActivityDeactivationResponse *)a3;
  -[SharedChannelActivityResponse clearOneofValuesForResponse](self, "clearOneofValuesForResponse");
  *(_BYTE *)&self->_has |= 1u;
  self->_response = 2;
  deactivationResponse = self->_deactivationResponse;
  self->_deactivationResponse = v4;

}

- (BOOL)hasPollingResponse
{
  return self->_pollingResponse != 0;
}

- (void)setPollingResponse:(id)a3
{
  ChannelActivityPollingResponse *v4;
  ChannelActivityPollingResponse *pollingResponse;

  v4 = (ChannelActivityPollingResponse *)a3;
  -[SharedChannelActivityResponse clearOneofValuesForResponse](self, "clearOneofValuesForResponse");
  *(_BYTE *)&self->_has |= 1u;
  self->_response = 3;
  pollingResponse = self->_pollingResponse;
  self->_pollingResponse = v4;

}

- (int)response
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_response;
  else
    return 0;
}

- (void)setResponse:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_response = a3;
}

- (void)setHasResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponse
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)responseAsString:(int)a3
{
  if (a3 < 4)
    return off_24D978130[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResponse:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activation_response")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("deactivation_response")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("polling_response")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForResponse
{
  ChannelActivityActivationResponse *activationResponse;
  ChannelActivityDeactivationResponse *deactivationResponse;
  ChannelActivityPollingResponse *pollingResponse;

  *(_BYTE *)&self->_has &= ~1u;
  self->_response = 0;
  activationResponse = self->_activationResponse;
  self->_activationResponse = 0;

  deactivationResponse = self->_deactivationResponse;
  self->_deactivationResponse = 0;

  pollingResponse = self->_pollingResponse;
  self->_pollingResponse = 0;

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
  v8.super_class = (Class)SharedChannelActivityResponse;
  -[SharedChannelActivityResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelActivityResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ChannelActivityActivationResponse *activationResponse;
  void *v5;
  ChannelActivityDeactivationResponse *deactivationResponse;
  void *v7;
  ChannelActivityPollingResponse *pollingResponse;
  void *v9;
  uint64_t response;
  __CFString *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activationResponse = self->_activationResponse;
  if (activationResponse)
  {
    -[ChannelActivityActivationResponse dictionaryRepresentation](activationResponse, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("activation_response"));

  }
  deactivationResponse = self->_deactivationResponse;
  if (deactivationResponse)
  {
    -[ChannelActivityDeactivationResponse dictionaryRepresentation](deactivationResponse, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("deactivation_response"));

  }
  pollingResponse = self->_pollingResponse;
  if (pollingResponse)
  {
    -[ChannelActivityPollingResponse dictionaryRepresentation](pollingResponse, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("polling_response"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    response = self->_response;
    if (response >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_response);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24D978130[response];
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("response"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelActivityResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_activationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deactivationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pollingResponse)
  {
    PBDataWriterWriteSubmessage();
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
    v4[8] = self->_response;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v5 = v4;
  if (self->_activationResponse)
  {
    objc_msgSend(v4, "setActivationResponse:");
    v4 = v5;
  }
  if (self->_deactivationResponse)
  {
    objc_msgSend(v5, "setDeactivationResponse:");
    v4 = v5;
  }
  if (self->_pollingResponse)
  {
    objc_msgSend(v5, "setPollingResponse:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_response;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[ChannelActivityActivationResponse copyWithZone:](self->_activationResponse, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[ChannelActivityDeactivationResponse copyWithZone:](self->_deactivationResponse, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[ChannelActivityPollingResponse copyWithZone:](self->_pollingResponse, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ChannelActivityActivationResponse *activationResponse;
  ChannelActivityDeactivationResponse *deactivationResponse;
  ChannelActivityPollingResponse *pollingResponse;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_response != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  activationResponse = self->_activationResponse;
  if ((unint64_t)activationResponse | *((_QWORD *)v4 + 1)
    && !-[ChannelActivityActivationResponse isEqual:](activationResponse, "isEqual:"))
  {
    goto LABEL_13;
  }
  deactivationResponse = self->_deactivationResponse;
  if ((unint64_t)deactivationResponse | *((_QWORD *)v4 + 2))
  {
    if (!-[ChannelActivityDeactivationResponse isEqual:](deactivationResponse, "isEqual:"))
      goto LABEL_13;
  }
  pollingResponse = self->_pollingResponse;
  if ((unint64_t)pollingResponse | *((_QWORD *)v4 + 3))
    v8 = -[ChannelActivityPollingResponse isEqual:](pollingResponse, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_response;
  else
    v3 = 0;
  v4 = -[ChannelActivityActivationResponse hash](self->_activationResponse, "hash") ^ v3;
  v5 = -[ChannelActivityDeactivationResponse hash](self->_deactivationResponse, "hash");
  return v4 ^ v5 ^ -[ChannelActivityPollingResponse hash](self->_pollingResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  ChannelActivityActivationResponse *activationResponse;
  uint64_t v7;
  ChannelActivityDeactivationResponse *deactivationResponse;
  uint64_t v9;
  ChannelActivityPollingResponse *pollingResponse;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_response = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  activationResponse = self->_activationResponse;
  v7 = v5[1];
  v12 = v5;
  if (activationResponse)
  {
    if (!v7)
      goto LABEL_9;
    -[ChannelActivityActivationResponse mergeFrom:](activationResponse, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[SharedChannelActivityResponse setActivationResponse:](self, "setActivationResponse:");
  }
  v5 = v12;
LABEL_9:
  deactivationResponse = self->_deactivationResponse;
  v9 = v5[2];
  if (deactivationResponse)
  {
    if (!v9)
      goto LABEL_15;
    -[ChannelActivityDeactivationResponse mergeFrom:](deactivationResponse, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[SharedChannelActivityResponse setDeactivationResponse:](self, "setDeactivationResponse:");
  }
  v5 = v12;
LABEL_15:
  pollingResponse = self->_pollingResponse;
  v11 = v5[3];
  if (pollingResponse)
  {
    if (v11)
    {
      -[ChannelActivityPollingResponse mergeFrom:](pollingResponse, "mergeFrom:");
LABEL_20:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[SharedChannelActivityResponse setPollingResponse:](self, "setPollingResponse:");
    goto LABEL_20;
  }

}

- (ChannelActivityActivationResponse)activationResponse
{
  return self->_activationResponse;
}

- (ChannelActivityDeactivationResponse)deactivationResponse
{
  return self->_deactivationResponse;
}

- (ChannelActivityPollingResponse)pollingResponse
{
  return self->_pollingResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollingResponse, 0);
  objc_storeStrong((id *)&self->_deactivationResponse, 0);
  objc_storeStrong((id *)&self->_activationResponse, 0);
}

@end
