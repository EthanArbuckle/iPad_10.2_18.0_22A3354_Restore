@implementation VisionCoreProcessingDescriptor

+ (id)URLForResourceNamed:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v6 = a3;
  objc_msgSend(a1, "resourcesBundle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a4 && !v7)
  {
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromClass((Class)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ did not provide a valid resources bundle"), v10);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "URLForResource:withExtension:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else if (a4)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v8, "bundlePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("Could not locate resource %@ in %@"), v6, v16);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)resourcesBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
}

- (VisionCoreProcessingDescriptor)initWithSpecifier:(id)a3
{
  id v5;
  VisionCoreProcessingDescriptor *v6;
  VisionCoreProcessingDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreProcessingDescriptor;
  v6 = -[VisionCoreProcessingDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specifier, a3);

  return v7;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[VisionCoreProcessingDescriptor specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (VisionCoreResourceVersion)version
{
  void *v2;
  void *v3;

  -[VisionCoreProcessingDescriptor specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreResourceVersion *)v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreProcessingDescriptor;
  -[VisionCoreDescriptor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreProcessingDescriptor specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v5);

  return v6;
}

- (unint64_t)hash
{
  return -[VisionCoreProcessingDescriptorSpecifier hash](self->_specifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreProcessingDescriptor *v4;
  VisionCoreProcessingDescriptor *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VisionCoreProcessingDescriptor *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VisionCoreProcessingDescriptor specifier](self, "specifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreProcessingDescriptor specifier](v5, "specifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VisionCoreProcessingDescriptor;
  v4 = a3;
  -[VisionCoreDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_specifier, CFSTR("specifier"), v5.receiver, v5.super_class);

}

- (VisionCoreProcessingDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VisionCoreProcessingDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[VisionCoreProcessingDescriptor initWithSpecifier:](self, "initWithSpecifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VisionCoreProcessingDescriptorSpecifier)specifier
{
  return self->_specifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
}

+ (id)availableIdentifiers
{
  void *v2;
  void *v3;

  +[VisionCoreProcessingDescriptor _identifierToSubclassMapping]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)availableVersionsForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = +[VisionCoreProcessingDescriptor _subclassResponsibleForIdentifier:]((uint64_t)a1, v6);
  if (v7)
  {
    objc_msgSend(v7, "availableVersionsForIdentifier:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnknownProcessingDescriptorIdentifier:", v6);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = +[VisionCoreProcessingDescriptor _subclassResponsibleForIdentifier:]((uint64_t)a1, v8);
  if (v10)
  {
    objc_msgSend(v10, "descriptorForIdentifier:version:error:", v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnknownProcessingDescriptorIdentifier:", v8);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)descriptorForSpecifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "descriptorForIdentifier:version:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)descriptorsForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "availableVersionsForIdentifier:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "descriptorForIdentifier:version:error:", v6, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), a4, (_QWORD)v18);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {

            v16 = 0;
            goto LABEL_12;
          }
          v15 = (void *)v14;
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    v16 = v8;
LABEL_12:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_subclassResponsibleForIdentifier:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  +[VisionCoreProcessingDescriptor _identifierToSubclassMapping]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "objectForKey:", v2);

  return v4;
}

+ (id)_identifierToSubclassMapping
{
  objc_opt_self();
  if (_identifierToSubclassMapping_ourOnceToken != -1)
    dispatch_once(&_identifierToSubclassMapping_ourOnceToken, &__block_literal_global_2790);
  return (id)_identifierToSubclassMapping_ourIdentifierToClassMapping;
}

void __62__VisionCoreProcessingDescriptor__identifierToSubclassMapping__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[VisionCoreRuntimeUtilities leafSubclassesOfClass:excludingRootClass:overridingClassSelector:](VisionCoreRuntimeUtilities, "leafSubclassesOfClass:excludingRootClass:overridingClassSelector:", objc_opt_class(), 1, sel_availableIdentifiers);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "availableIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j));
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v9);
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v3);
  }
  v12 = objc_msgSend(v0, "copy");
  v13 = (void *)_identifierToSubclassMapping_ourIdentifierToClassMapping;
  _identifierToSubclassMapping_ourIdentifierToClassMapping = v12;

}

@end
