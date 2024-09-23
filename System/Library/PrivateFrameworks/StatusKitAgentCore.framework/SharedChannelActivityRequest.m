@implementation SharedChannelActivityRequest

- (BOOL)hasActivationRequest
{
  return self->_activationRequest != 0;
}

- (void)setActivationRequest:(id)a3
{
  ChannelActivityActivationRequest *v4;
  ChannelActivityActivationRequest *activationRequest;

  v4 = (ChannelActivityActivationRequest *)a3;
  -[SharedChannelActivityRequest clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 1;
  activationRequest = self->_activationRequest;
  self->_activationRequest = v4;

}

- (BOOL)hasDeactivationRequest
{
  return self->_deactivationRequest != 0;
}

- (void)setDeactivationRequest:(id)a3
{
  ChannelActivityDeactivationRequest *v4;
  ChannelActivityDeactivationRequest *deactivationRequest;

  v4 = (ChannelActivityDeactivationRequest *)a3;
  -[SharedChannelActivityRequest clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 2;
  deactivationRequest = self->_deactivationRequest;
  self->_deactivationRequest = v4;

}

- (BOOL)hasPollingRequest
{
  return self->_pollingRequest != 0;
}

- (void)setPollingRequest:(id)a3
{
  ChannelActivityPollingRequest *v4;
  ChannelActivityPollingRequest *pollingRequest;

  v4 = (ChannelActivityPollingRequest *)a3;
  -[SharedChannelActivityRequest clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 3;
  pollingRequest = self->_pollingRequest;
  self->_pollingRequest = v4;

}

- (int)request
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_request;
  else
    return 0;
}

- (void)setRequest:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_request = a3;
}

- (void)setHasRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequest
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)requestAsString:(int)a3
{
  if (a3 < 4)
    return *((id *)&off_24D978238 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequest:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activation_request")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("deactivation_request")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("polling_request")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForRequest
{
  ChannelActivityActivationRequest *activationRequest;
  ChannelActivityDeactivationRequest *deactivationRequest;
  ChannelActivityPollingRequest *pollingRequest;

  *(_BYTE *)&self->_has &= ~1u;
  self->_request = 0;
  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  deactivationRequest = self->_deactivationRequest;
  self->_deactivationRequest = 0;

  pollingRequest = self->_pollingRequest;
  self->_pollingRequest = 0;

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
  v8.super_class = (Class)SharedChannelActivityRequest;
  -[SharedChannelActivityRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelActivityRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ChannelActivityActivationRequest *activationRequest;
  void *v5;
  ChannelActivityDeactivationRequest *deactivationRequest;
  void *v7;
  ChannelActivityPollingRequest *pollingRequest;
  void *v9;
  uint64_t request;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activationRequest = self->_activationRequest;
  if (activationRequest)
  {
    -[ChannelActivityActivationRequest dictionaryRepresentation](activationRequest, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("activation_request"));

  }
  deactivationRequest = self->_deactivationRequest;
  if (deactivationRequest)
  {
    -[ChannelActivityDeactivationRequest dictionaryRepresentation](deactivationRequest, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("deactivation_request"));

  }
  pollingRequest = self->_pollingRequest;
  if (pollingRequest)
  {
    -[ChannelActivityPollingRequest dictionaryRepresentation](pollingRequest, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("polling_request"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    request = self->_request;
    if (request >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_request);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)*((_QWORD *)&off_24D978238 + request);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("request"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelActivityRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_activationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deactivationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pollingRequest)
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
    v4[8] = self->_request;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v5 = v4;
  if (self->_activationRequest)
  {
    objc_msgSend(v4, "setActivationRequest:");
    v4 = v5;
  }
  if (self->_deactivationRequest)
  {
    objc_msgSend(v5, "setDeactivationRequest:");
    v4 = v5;
  }
  if (self->_pollingRequest)
  {
    objc_msgSend(v5, "setPollingRequest:");
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
    *(_DWORD *)(v5 + 32) = self->_request;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[ChannelActivityActivationRequest copyWithZone:](self->_activationRequest, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[ChannelActivityDeactivationRequest copyWithZone:](self->_deactivationRequest, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[ChannelActivityPollingRequest copyWithZone:](self->_pollingRequest, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ChannelActivityActivationRequest *activationRequest;
  ChannelActivityDeactivationRequest *deactivationRequest;
  ChannelActivityPollingRequest *pollingRequest;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_request != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  activationRequest = self->_activationRequest;
  if ((unint64_t)activationRequest | *((_QWORD *)v4 + 1)
    && !-[ChannelActivityActivationRequest isEqual:](activationRequest, "isEqual:"))
  {
    goto LABEL_13;
  }
  deactivationRequest = self->_deactivationRequest;
  if ((unint64_t)deactivationRequest | *((_QWORD *)v4 + 2))
  {
    if (!-[ChannelActivityDeactivationRequest isEqual:](deactivationRequest, "isEqual:"))
      goto LABEL_13;
  }
  pollingRequest = self->_pollingRequest;
  if ((unint64_t)pollingRequest | *((_QWORD *)v4 + 3))
    v8 = -[ChannelActivityPollingRequest isEqual:](pollingRequest, "isEqual:");
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
    v3 = 2654435761 * self->_request;
  else
    v3 = 0;
  v4 = -[ChannelActivityActivationRequest hash](self->_activationRequest, "hash") ^ v3;
  v5 = -[ChannelActivityDeactivationRequest hash](self->_deactivationRequest, "hash");
  return v4 ^ v5 ^ -[ChannelActivityPollingRequest hash](self->_pollingRequest, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  ChannelActivityActivationRequest *activationRequest;
  uint64_t v7;
  ChannelActivityDeactivationRequest *deactivationRequest;
  uint64_t v9;
  ChannelActivityPollingRequest *pollingRequest;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_request = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  activationRequest = self->_activationRequest;
  v7 = v5[1];
  v12 = v5;
  if (activationRequest)
  {
    if (!v7)
      goto LABEL_9;
    -[ChannelActivityActivationRequest mergeFrom:](activationRequest, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[SharedChannelActivityRequest setActivationRequest:](self, "setActivationRequest:");
  }
  v5 = v12;
LABEL_9:
  deactivationRequest = self->_deactivationRequest;
  v9 = v5[2];
  if (deactivationRequest)
  {
    if (!v9)
      goto LABEL_15;
    -[ChannelActivityDeactivationRequest mergeFrom:](deactivationRequest, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[SharedChannelActivityRequest setDeactivationRequest:](self, "setDeactivationRequest:");
  }
  v5 = v12;
LABEL_15:
  pollingRequest = self->_pollingRequest;
  v11 = v5[3];
  if (pollingRequest)
  {
    if (v11)
    {
      -[ChannelActivityPollingRequest mergeFrom:](pollingRequest, "mergeFrom:");
LABEL_20:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[SharedChannelActivityRequest setPollingRequest:](self, "setPollingRequest:");
    goto LABEL_20;
  }

}

- (ChannelActivityActivationRequest)activationRequest
{
  return self->_activationRequest;
}

- (ChannelActivityDeactivationRequest)deactivationRequest
{
  return self->_deactivationRequest;
}

- (ChannelActivityPollingRequest)pollingRequest
{
  return self->_pollingRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollingRequest, 0);
  objc_storeStrong((id *)&self->_deactivationRequest, 0);
  objc_storeStrong((id *)&self->_activationRequest, 0);
}

@end
