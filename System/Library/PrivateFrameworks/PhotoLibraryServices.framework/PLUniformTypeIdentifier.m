@implementation PLUniformTypeIdentifier

- (PLUniformTypeIdentifier)initWithIdentifier:(id)a3 conformanceHint:(signed __int16)a4
{
  id v7;
  PLUniformTypeIdentifier *v8;
  uint64_t v9;
  NSString *identifier;
  void *v12;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUniformTypeIdentifier;
  v8 = -[PLUniformTypeIdentifier init](&v13, sel_init);
  if (v8)
  {
    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PLUniformTypeIdentifier.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length > 0"));

    }
    v9 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_conformanceHint = a4;
    v8->_wellKnownFileType = PLFileTypeFromIdentifier(v7);
  }

  return v8;
}

- (BOOL)isEqualToUniformTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  PLUniformTypeIdentifier *v4;
  BOOL v5;

  v4 = (PLUniformTypeIdentifier *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && -[PLUniformTypeIdentifier isEqualToUniformTypeIdentifier:](self, "isEqualToUniformTypeIdentifier:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  v8.super_class = (Class)PLUniformTypeIdentifier;
  -[PLUniformTypeIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PLUniformTypeIdentifier *v4;
  void *v5;
  PLUniformTypeIdentifier *v6;

  v4 = [PLUniformTypeIdentifier alloc];
  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLUniformTypeIdentifier initWithIdentifier:conformanceHint:](v4, "initWithIdentifier:conformanceHint:", v5, -[PLUniformTypeIdentifier conformanceHint](self, "conformanceHint"));

  return v6;
}

- (NSString)compactRepresentation
{
  void *v2;
  void *v3;

  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifierIntegratedLookup compactRepresentationForIdentifier:](PLUniformTypeIdentifierIntegratedLookup, "compactRepresentationForIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isPrimaryImageFormat
{
  void *v2;
  BOOL v3;

  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PLManagedAsset isPrimaryImageFormatForUTI:](PLManagedAsset, "isPrimaryImageFormatForUTI:", v2);

  return v3;
}

- (BOOL)conformsToImage
{
  return (unsigned __int16)self->_conformanceHint - 1 < 2;
}

- (BOOL)conformsToRawImage
{
  return self->_conformanceHint == 2;
}

- (BOOL)conformsToMovie
{
  return self->_conformanceHint == 3;
}

- (BOOL)isPlayableVideo
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isPlayableVideoTypeIdentifierString:", v4);

  return (char)v3;
}

- (BOOL)conformsToAudio
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC450]);

  return v5;
}

- (BOOL)conformsToData
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceAAEType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[PLUniformTypeIdentifier identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceXMPType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC4A0]);

  }
  return v11;
}

- (BOOL)conformsToJPEG
{
  return self->_wellKnownFileType - 1 < 2;
}

- (BOOL)conformsToHEIF
{
  return self->_wellKnownFileType == 4;
}

- (BOOL)conformsToHEIC
{
  return self->_wellKnownFileType == 3;
}

- (id)preferredExtension
{
  void *v2;
  void *v3;

  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset preferredFileExtensionForType:](PLManagedAsset, "preferredFileExtensionForType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isLosslessEncoding
{
  if (-[PLUniformTypeIdentifier conformsToRawImage](self, "conformsToRawImage"))
    return 1;
  if (-[PLUniformTypeIdentifier conformsToImage](self, "conformsToImage"))
    return self->_wellKnownFileType - 6 < 3;
  if (-[PLUniformTypeIdentifier conformsToMovie](self, "conformsToMovie"))
    return 0;
  return !-[PLUniformTypeIdentifier conformsToAudio](self, "conformsToAudio");
}

- (BOOL)isDynamic
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PLUniformTypeIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDynamic");

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)wellKnownFileType
{
  return self->_wellKnownFileType;
}

- (signed)conformanceHint
{
  return self->_conformanceHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)utiWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:conformanceHint:", v4, +[PLUniformTypeIdentifierIntegratedLookup conformanceHintForIdentifier:](PLUniformTypeIdentifierIntegratedLookup, "conformanceHintForIdentifier:", v4));
  else
    v5 = 0;

  return v5;
}

+ (id)utiWithCompactRepresentation:(id)a3 conformanceHint:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    +[PLUniformTypeIdentifierIntegratedLookup identifierFromCompactRepresentation:](PLUniformTypeIdentifierIntegratedLookup, "identifierFromCompactRepresentation:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:conformanceHint:", v7, v4);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isPlayableVideoTypeIdentifierString:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(MEMORY[0x1E0D752F0], "supportedMovieTypes", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(v3, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)jpegUniformTypeIdentifier
{
  void *v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "utiWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)quicktimeUniformTypeIdentifier
{
  void *v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEC5B0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "utiWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)plistUniformTypeIdentifier
{
  void *v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEC5A8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "utiWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
