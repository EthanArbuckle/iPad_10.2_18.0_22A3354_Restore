@implementation ATXPBProactiveSuggestionExecutableSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDescription, 0);
  objc_storeStrong((id *)&self->_executableClassString, 0);
  objc_storeStrong((id *)&self->_executable, 0);
}

- (uint64_t)setExecutableType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 52) |= 2u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setExecutableObjectHash:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 52) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (void)setExecutableIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setExecutableDescription:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setExecutableClassString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setExecutable:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (uint64_t)executable
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)executableObjectHash
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)executableDescription
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)executableClassString
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)executableType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 52) & 2) != 0)
      return *(unsigned int *)(result + 48);
    else
      return 0;
  }
  return result;
}

- (uint64_t)executableIdentifier
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_executable)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_executableClassString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_executableDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_executableIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (BOOL)hasExecutable
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)setHasExecutableObjectHash:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 52) = *(_BYTE *)(result + 52) & 0xFE | a2;
  return result;
}

- (uint64_t)hasExecutableObjectHash
{
  if (result)
    return *(_BYTE *)(result + 52) & 1;
  return result;
}

- (BOOL)hasExecutableClassString
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (BOOL)hasExecutableDescription
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (BOOL)hasExecutableIdentifier
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (uint64_t)setHasExecutableType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 52) = *(_BYTE *)(result + 52) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasExecutableType
{
  if (result)
    return (*(unsigned __int8 *)(result + 52) >> 1) & 1;
  return result;
}

- (__CFString)executableTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0xB)
      return off_1E57CF178[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsExecutableType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("App")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Action")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Widget")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Tip")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AppClip")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Interaction")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ContextualAction")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SpotlightAction")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ShortcutsAction")) & 1) != 0)
    {
      v6 = 9;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("LinkAction")))
    {
      v6 = 10;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  v8.super_class = (Class)ATXPBProactiveSuggestionExecutableSpecification;
  -[ATXPBProactiveSuggestionExecutableSpecification description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionExecutableSpecification dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *executable;
  void *v6;
  NSString *executableClassString;
  NSString *executableDescription;
  NSString *executableIdentifier;
  uint64_t executableType;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  executable = self->_executable;
  if (executable)
    objc_msgSend(v3, "setObject:forKey:", executable, CFSTR("executable"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_executableObjectHash);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("executableObjectHash"));

  }
  executableClassString = self->_executableClassString;
  if (executableClassString)
    objc_msgSend(v4, "setObject:forKey:", executableClassString, CFSTR("executableClassString"));
  executableDescription = self->_executableDescription;
  if (executableDescription)
    objc_msgSend(v4, "setObject:forKey:", executableDescription, CFSTR("executableDescription"));
  executableIdentifier = self->_executableIdentifier;
  if (executableIdentifier)
    objc_msgSend(v4, "setObject:forKey:", executableIdentifier, CFSTR("executableIdentifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    executableType = self->_executableType;
    if (executableType >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_executableType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E57CF178[executableType];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("executableType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionExecutableSpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v8 = v3;
    if (v4)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutable:]((uint64_t)v3, v4);
      v3 = v8;
    }
    if ((*(_BYTE *)(a1 + 52) & 1) != 0)
    {
      *((_QWORD *)v3 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v3 + 52) |= 1u;
    }
    v5 = *(void **)(a1 + 24);
    if (v5)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutableClassString:]((uint64_t)v8, v5);
      v3 = v8;
    }
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutableDescription:]((uint64_t)v8, v6);
      v3 = v8;
    }
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutableIdentifier:]((uint64_t)v8, v7);
      v3 = v8;
    }
    if ((*(_BYTE *)(a1 + 52) & 2) != 0)
    {
      *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
      *((_BYTE *)v3 + 52) |= 2u;
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_executable, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_executableObjectHash;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_executableClassString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_executableDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_executableIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_executableType;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *executable;
  NSString *executableClassString;
  NSString *executableDescription;
  NSString *executableIdentifier;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  executable = self->_executable;
  if ((unint64_t)executable | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](executable, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_executableObjectHash != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  executableClassString = self->_executableClassString;
  if ((unint64_t)executableClassString | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](executableClassString, "isEqual:"))
  {
    goto LABEL_19;
  }
  executableDescription = self->_executableDescription;
  if ((unint64_t)executableDescription | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](executableDescription, "isEqual:"))
      goto LABEL_19;
  }
  executableIdentifier = self->_executableIdentifier;
  if ((unint64_t)executableIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](executableIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_executableType != *((_DWORD *)v4 + 12))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSData hash](self->_executable, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_executableObjectHash;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_executableClassString, "hash");
  v6 = -[NSString hash](self->_executableDescription, "hash");
  v7 = -[NSString hash](self->_executableIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_executableType;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)v3[2];
    v8 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 16), v4);
      v3 = v8;
    }
    if ((*((_BYTE *)v3 + 52) & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = v3[1];
      *(_BYTE *)(a1 + 52) |= 1u;
    }
    v5 = (void *)v3[3];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 24), v5);
      v3 = v8;
    }
    v6 = (void *)v3[4];
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 32), v6);
      v3 = v8;
    }
    v7 = (void *)v3[5];
    if (v7)
    {
      objc_storeStrong((id *)(a1 + 40), v7);
      v3 = v8;
    }
    if ((*((_BYTE *)v3 + 52) & 2) != 0)
    {
      *(_DWORD *)(a1 + 48) = *((_DWORD *)v3 + 12);
      *(_BYTE *)(a1 + 52) |= 2u;
    }
  }

}

@end
