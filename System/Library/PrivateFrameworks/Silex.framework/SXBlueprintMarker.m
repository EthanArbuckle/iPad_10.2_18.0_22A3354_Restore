@implementation SXBlueprintMarker

- (SXBlueprintMarker)initWithLeadingComponent:(id)a3 trailingComponent:(id)a4 approximateLocation:(CGPoint)a5 path:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  id v14;
  SXBlueprintMarker *v15;
  SXBlueprintMarker *v16;
  objc_super v18;

  y = a5.y;
  x = a5.x;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXBlueprintMarker;
  v15 = -[SXBlueprintMarker init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_leadingComponent, a3);
    objc_storeStrong((id *)&v16->_trailingComponent, a4);
    v16->_approximateLocation.x = x;
    v16->_approximateLocation.y = y;
    objc_storeStrong((id *)&v16->_path, a6);
  }

  return v16;
}

- (BOOL)isEqualToMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  -[SXBlueprintMarker leadingComponent](self, "leadingComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_9;
  -[SXBlueprintMarker trailingComponent](self, "trailingComponent");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SXBlueprintMarker trailingComponent](self, "trailingComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_9;
  }
  -[SXBlueprintMarker path](self, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToArray:", v14);

  if (v15)
  {
    -[SXBlueprintMarker componentAnchor](self, "componentAnchor");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[SXBlueprintMarker componentAnchor](self, "componentAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

    }
    else
    {
      v20 = 1;
    }
  }
  else
  {
LABEL_9:
    v20 = 0;
  }

  return v20;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint v27;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBlueprintMarker leadingComponent](self, "leadingComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBlueprintMarker leadingComponent](self, "leadingComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; leading component: %@ (%@)"), v5, v7);

  -[SXBlueprintMarker trailingComponent](self, "trailingComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBlueprintMarker trailingComponent](self, "trailingComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; trailing component: %@ (%@)"), v9, v11);

  -[SXBlueprintMarker approximateLocation](self, "approximateLocation");
  NSStringFromCGPoint(v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; approximate location: %@"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("; path: ("));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SXBlueprintMarker path](self, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR(")"));
  -[SXBlueprintMarker componentAnchor](self, "componentAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; anchor: %@"), v19);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (SXComponent)leadingComponent
{
  return self->_leadingComponent;
}

- (SXComponent)trailingComponent
{
  return self->_trailingComponent;
}

- (CGPoint)approximateLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_approximateLocation.x;
  y = self->_approximateLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)path
{
  return self->_path;
}

- (SXComponentAnchor)componentAnchor
{
  return self->_componentAnchor;
}

- (void)setComponentAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_componentAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentAnchor, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_trailingComponent, 0);
  objc_storeStrong((id *)&self->_leadingComponent, 0);
}

@end
