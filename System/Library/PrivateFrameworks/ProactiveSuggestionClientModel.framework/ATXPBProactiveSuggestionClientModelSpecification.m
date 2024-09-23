@implementation ATXPBProactiveSuggestionClientModelSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelVersion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (uint64_t)setEngagementResetPolicy:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 28) |= 1u;
    *(_DWORD *)(result + 24) = a2;
  }
  return result;
}

- (void)setClientModelVersion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setClientModelId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (uint64_t)engagementResetPolicy
{
  if (result)
  {
    if ((*(_BYTE *)(result + 28) & 1) != 0)
      return *(unsigned int *)(result + 24);
    else
      return 0;
  }
  return result;
}

- (uint64_t)clientModelId
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)clientModelVersion
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientModelVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (BOOL)hasClientModelId
{
  if (result)
    return *(_QWORD *)(result + 8) != 0;
  return result;
}

- (BOOL)hasClientModelVersion
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)setHasEngagementResetPolicy:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 28) = *(_BYTE *)(result + 28) & 0xFE | a2;
  return result;
}

- (uint64_t)hasEngagementResetPolicy
{
  if (result)
    return *(_BYTE *)(result + 28) & 1;
  return result;
}

- (__CFString)engagementResetPolicyAsString:(__CFString *)a1
{
  if (a1)
  {
    if (!(_DWORD)a2)
      return CFSTR("OnCacheUpdate");
    if ((_DWORD)a2 == 1)
    {
      a1 = CFSTR("WhenNotPredicted");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (uint64_t)StringAsEngagementResetPolicy:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OnCacheUpdate")) & 1) != 0)
      a1 = 0;
    else
      a1 = objc_msgSend(v4, "isEqualToString:", CFSTR("WhenNotPredicted"));
  }

  return a1;
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
  v8.super_class = (Class)ATXPBProactiveSuggestionClientModelSpecification;
  -[ATXPBProactiveSuggestionClientModelSpecification description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionClientModelSpecification dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientModelId;
  NSString *clientModelVersion;
  int engagementResetPolicy;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v3, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  clientModelVersion = self->_clientModelVersion;
  if (clientModelVersion)
    objc_msgSend(v4, "setObject:forKey:", clientModelVersion, CFSTR("clientModelVersion"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    engagementResetPolicy = self->_engagementResetPolicy;
    if (engagementResetPolicy)
    {
      if (engagementResetPolicy == 1)
      {
        v8 = CFSTR("WhenNotPredicted");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementResetPolicy);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("OnCacheUpdate");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("engagementResetPolicy"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionClientModelSpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v6 = v3;
    if (v4)
    {
      -[ATXPBProactiveSuggestionClientModelSpecification setClientModelId:]((uint64_t)v3, v4);
      v3 = v6;
    }
    v5 = *(void **)(a1 + 16);
    if (v5)
    {
      -[ATXPBProactiveSuggestionClientModelSpecification setClientModelVersion:]((uint64_t)v6, v5);
      v3 = v6;
    }
    if ((*(_BYTE *)(a1 + 28) & 1) != 0)
    {
      *((_DWORD *)v3 + 6) = *(_DWORD *)(a1 + 24);
      *((_BYTE *)v3 + 28) |= 1u;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_clientModelVersion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_engagementResetPolicy;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientModelId;
  NSString *clientModelVersion;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_10;
  }
  clientModelVersion = self->_clientModelVersion;
  if ((unint64_t)clientModelVersion | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelVersion, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_engagementResetPolicy == *((_DWORD *)v4 + 6))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_clientModelId, "hash");
  v4 = -[NSString hash](self->_clientModelVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_engagementResetPolicy;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)v3[1];
    v6 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 8), v4);
      v3 = v6;
    }
    v5 = (void *)v3[2];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      v3 = v6;
    }
    if ((*((_BYTE *)v3 + 28) & 1) != 0)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(_BYTE *)(a1 + 28) |= 1u;
    }
  }

}

@end
