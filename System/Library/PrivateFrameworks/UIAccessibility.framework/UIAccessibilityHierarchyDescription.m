@implementation UIAccessibilityHierarchyDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAccessibilityHierarchyDescription)initWithCoder:(id)a3
{
  id v4;
  UIAccessibilityHierarchyDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityHierarchyDescription;
  v5 = -[UIAccessibilityHierarchyDescription init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rootElement"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityHierarchyDescription setRootElement:](v5, "setRootElement:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("leafElements"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityHierarchyDescription setLeafElements:](v5, "setLeafElements:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIAccessibilityHierarchyDescription rootElement](self, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rootElement"));

  -[UIAccessibilityHierarchyDescription leafElements](self, "leafElements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("leafElements"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("UIAXHierarchyDesc<%p>\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityHierarchyDescription rootElement](self, "rootElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  Root: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("  Leaf Elements:\n"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIAccessibilityHierarchyDescription leafElements](self, "leafElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v3;
}

- (UIAccessibilityElementDescription)rootElement
{
  return self->_rootElement;
}

- (void)setRootElement:(id)a3
{
  objc_storeStrong((id *)&self->_rootElement, a3);
}

- (NSArray)leafElements
{
  return self->_leafElements;
}

- (void)setLeafElements:(id)a3
{
  objc_storeStrong((id *)&self->_leafElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafElements, 0);
  objc_storeStrong((id *)&self->_rootElement, 0);
}

@end
