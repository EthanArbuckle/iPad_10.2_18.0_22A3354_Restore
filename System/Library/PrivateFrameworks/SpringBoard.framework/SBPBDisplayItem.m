@implementation SBPBDisplayItem

- (__CFString)typeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 6)
      return off_1E8EAC850[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsType:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("App")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreen")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RemoteAlert")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SwitcherService")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ContinuityApp")) & 1) != 0)
    {
      v6 = 4;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("WebApp")))
    {
      v6 = 5;
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

- (BOOL)hasSceneIdentifier
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (BOOL)hasWebClipIdentifier
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
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
  v8.super_class = (Class)SBPBDisplayItem;
  -[SBPBDisplayItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPBDisplayItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  NSString *bundleIdentifier;
  NSString *sceneIdentifier;
  NSString *webClipIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E8EAC850[type];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  sceneIdentifier = self->_sceneIdentifier;
  if (sceneIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sceneIdentifier, CFSTR("sceneIdentifier"));
  webClipIdentifier = self->_webClipIdentifier;
  if (webClipIdentifier)
    objc_msgSend(v3, "setObject:forKey:", webClipIdentifier, CFSTR("webClipIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SBPBDisplayItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_bundleIdentifier)
    -[SBPBDisplayItem writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (self->_sceneIdentifier)
    PBDataWriterWriteStringField();
  if (self->_webClipIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(uint64_t)a1
{
  _DWORD *v3;
  void *v4;
  void *v5;
  _DWORD *v6;

  v3 = a2;
  if (a1)
  {
    v3[6] = *(_DWORD *)(a1 + 24);
    v6 = v3;
    -[SBPBDisplayItem setBundleIdentifier:]((uint64_t)v3, *(void **)(a1 + 8));
    v4 = *(void **)(a1 + 16);
    if (v4)
      -[SBPBDisplayItem setSceneIdentifier:]((uint64_t)v6, v4);
    v5 = *(void **)(a1 + 32);
    v3 = v6;
    if (v5)
    {
      -[SBPBDisplayItem setWebClipIdentifier:]((uint64_t)v6, v5);
      v3 = v6;
    }
  }

}

- (void)setBundleIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setSceneIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setWebClipIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_type;
  v6 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_sceneIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_webClipIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *bundleIdentifier;
  NSString *sceneIdentifier;
  NSString *webClipIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_type == *((_DWORD *)v4 + 6)
    && ((bundleIdentifier = self->_bundleIdentifier, !((unint64_t)bundleIdentifier | v4[1]))
     || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
    && ((sceneIdentifier = self->_sceneIdentifier, !((unint64_t)sceneIdentifier | v4[2]))
     || -[NSString isEqual:](sceneIdentifier, "isEqual:")))
  {
    webClipIdentifier = self->_webClipIdentifier;
    if ((unint64_t)webClipIdentifier | v4[4])
      v8 = -[NSString isEqual:](webClipIdentifier, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = 2654435761 * self->_type;
  v4 = -[NSString hash](self->_bundleIdentifier, "hash");
  v5 = v4 ^ -[NSString hash](self->_sceneIdentifier, "hash");
  return v5 ^ -[NSString hash](self->_webClipIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  _DWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  _DWORD *v7;

  v3 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 24) = v3[6];
    v4 = (void *)*((_QWORD *)v3 + 1);
    v7 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 8), v4);
      v3 = v7;
    }
    v5 = (void *)*((_QWORD *)v3 + 2);
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      v3 = v7;
    }
    v6 = (void *)*((_QWORD *)v3 + 4);
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 32), v6);
      v3 = v7;
    }
  }

}

- (uint64_t)type
{
  if (result)
    return *(unsigned int *)(result + 24);
  return result;
}

- (uint64_t)setType:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 24) = a2;
  return result;
}

- (uint64_t)bundleIdentifier
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)sceneIdentifier
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)webClipIdentifier
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SBPBDisplayItem writeTo:]", "SBPBDisplayItem.m", 121, "nil != self->_bundleIdentifier");
}

@end
