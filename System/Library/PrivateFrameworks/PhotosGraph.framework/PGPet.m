@implementation PGPet

- (PGPet)initWithLocalIdentifier:(id)a3 petSpecies:(unint64_t)a4 name:(id)a5 isFavorite:(BOOL)a6 momentNodes:(id)a7 ownerNodes:(id)a8
{
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  PGPet *v19;
  PGPet *v20;
  __CFString *v21;
  PGGraphPersonNodeCollection *v22;
  void *ownerNodes;
  PGGraphPersonNodeCollection *v24;
  uint64_t v25;
  PGGraphPersonNodeCollection *v26;
  objc_super v28;

  v15 = a3;
  v16 = (__CFString *)a5;
  v17 = a7;
  v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PGPet;
  v19 = -[PGPet init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    if (v16)
      v21 = v16;
    else
      v21 = &stru_1E8436F28;
    objc_storeStrong((id *)&v19->_name, v21);
    objc_storeStrong((id *)&v20->_localIdentifier, a3);
    v20->_species = a4;
    v20->_isFavorite = a6;
    objc_storeStrong((id *)&v20->_momentNodes, a7);
    if (v18)
    {
      v22 = (PGGraphPersonNodeCollection *)v18;
      ownerNodes = v20->_ownerNodes;
      v20->_ownerNodes = v22;
    }
    else
    {
      v24 = [PGGraphPersonNodeCollection alloc];
      objc_msgSend(v17, "graph");
      ownerNodes = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[MAElementCollection initWithGraph:](v24, "initWithGraph:", ownerNodes);
      v26 = v20->_ownerNodes;
      v20->_ownerNodes = (PGGraphPersonNodeCollection *)v25;

    }
  }

  return v20;
}

- (void)addOwnerNodes:(id)a3
{
  PGGraphPersonNodeCollection *v4;
  PGGraphPersonNodeCollection *ownerNodes;

  -[MAElementCollection collectionByFormingUnionWith:](self->_ownerNodes, "collectionByFormingUnionWith:", a3);
  v4 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
  ownerNodes = self->_ownerNodes;
  self->_ownerNodes = v4;

}

- (NSString)name
{
  return self->_name;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (unint64_t)species
{
  return self->_species;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (PGGraphPersonNodeCollection)ownerNodes
{
  return self->_ownerNodes;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerNodes, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
