@implementation SXAdComponentRemovalModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5;

  objc_msgSend(a3, "components");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SXAdComponentRemovalModifier removeAdComponentsEmbeddedWithinContainer:childComponents:](self, "removeAdComponentsEmbeddedWithinContainer:childComponents:", 0, v5);

}

- (void)removeAdComponentsEmbeddedWithinContainer:(id)a3 childComponents:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "contentDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "allComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "componentsForContainerComponentWithIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            -[SXAdComponentRemovalModifier removeAdComponentsEmbeddedWithinContainer:childComponents:](self, "removeAdComponentsEmbeddedWithinContainer:childComponents:", v13, v15);

          goto LABEL_13;
        }
        if (v6 && objc_msgSend(v12, "conformsToProtocol:", &unk_254F31A08))
        {
          objc_msgSend(v12, "identifier");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "removeComponentWithIdentifier:", v13);
LABEL_13:

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

@end
