@implementation PGGraphEntityNetSceneNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)sceneNodesForSceneNames:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphSceneNode filterForSceneNames:](PGGraphEntityNetSceneNode, "filterForSceneNames:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)localizedNames
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphEntityNetSceneNodeCollection_localizedNames__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("localizedName"), v6);

  return (NSSet *)v4;
}

- (void)enumerateLocalizedNamesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PGGraphEntityNetSceneNodeCollection_enumerateLocalizedNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("localizedName"), v6);

}

- (void)enumerateSceneIdentifiersUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PGGraphEntityNetSceneNodeCollection_enumerateSceneIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E84324E0;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateUnsignedLongLongPropertyValuesForKey:withBlock:](self, "enumerateUnsignedLongLongPropertyValuesForKey:withBlock:", CFSTR("sceneIdentifier"), v6);

}

uint64_t __75__PGGraphEntityNetSceneNodeCollection_enumerateSceneIdentifiersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PGGraphEntityNetSceneNodeCollection_enumerateLocalizedNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__PGGraphEntityNetSceneNodeCollection_localizedNames__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

@end
