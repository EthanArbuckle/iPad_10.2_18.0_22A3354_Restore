@implementation SXMutableNamespacedObjectReferences

- (void)setNamespacedComponentStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5
{
  -[SXMutableNamespacedObjectReferences addNamespacedIdentifier:forIdentifier:component:map:](self, "addNamespacedIdentifier:forIdentifier:component:map:", a3, a4, a5, self->super._componentStyleReferences);
}

- (void)setNamespacedComponentTextStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5
{
  -[SXMutableNamespacedObjectReferences addNamespacedIdentifier:forIdentifier:component:map:](self, "addNamespacedIdentifier:forIdentifier:component:map:", a3, a4, a5, self->super._componentTextStyleReferences);
}

- (void)setNamespacedTextStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5
{
  -[SXMutableNamespacedObjectReferences addNamespacedIdentifier:forIdentifier:component:map:](self, "addNamespacedIdentifier:forIdentifier:component:map:", a3, a4, a5, self->super._textStyleReferences);
}

- (void)addNamespacedIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5 map:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a4;
  v11 = a3;
  -[SXNamespacedObjectReferences referencesForComponent:map:](self, "referencesForComponent:map:", a5, a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v10);

}

@end
