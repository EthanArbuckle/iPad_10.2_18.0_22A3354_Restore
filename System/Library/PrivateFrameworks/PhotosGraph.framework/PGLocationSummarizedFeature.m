@implementation PGLocationSummarizedFeature

- (PGLocationSummarizedFeature)initWithSubtype:(unsigned __int16)a3 intervalsPresent:(id)a4 numberOfAssets:(unint64_t)a5 isMandatoryForKeyAsset:(BOOL)a6 locationNode:(id)a7 personNode:(id)a8 locationName:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  PGLocationSummarizedFeature *v18;
  PGLocationSummarizedFeature *v19;
  uint64_t v20;
  NSSet *intervalsPresent;
  objc_super v24;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PGLocationSummarizedFeature;
  v18 = -[PGLocationSummarizedFeature init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = 1;
    v18->_subtype = a3;
    PGSummarizedFeatureConsolidatedDateIntervals(v14);
    v20 = objc_claimAutoreleasedReturnValue();
    intervalsPresent = v19->_intervalsPresent;
    v19->_intervalsPresent = (NSSet *)v20;

    v19->_numberOfAssets = a5;
    v19->_isMandatoryForKeyAsset = a6;
    objc_storeStrong((id *)&v19->_locationNode, a7);
    objc_storeStrong((id *)&v19->_personNode, a8);
    objc_storeStrong((id *)&v19->_locationName, a9);
  }

  return v19;
}

- (PGLocationSummarizedFeature)initWithSubtype:(unsigned __int16)a3 intervalsPresent:(id)a4 numberOfAssets:(unint64_t)a5 isMandatoryForKeyAsset:(BOOL)a6 locationNode:(id)a7
{
  return -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:personNode:locationName:](self, "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:personNode:locationName:", a3, a4, a5, a6, a7, 0, 0);
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (NSSet)intervalsPresent
{
  return self->_intervalsPresent;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (BOOL)isMandatoryForKeyAsset
{
  return self->_isMandatoryForKeyAsset;
}

- (PGGraphLocationOrArea)locationNode
{
  return self->_locationNode;
}

- (PGGraphPersonNode)personNode
{
  return self->_personNode;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
  objc_storeStrong((id *)&self->_locationNode, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

+ (unsigned)summarizedFeatureSubtypeForLocationNode:(id)a3
{
  id v3;
  void *v4;
  char v5;
  unsigned __int16 v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;

  v3 = a3;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Address"));

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Area"));

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(v3, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("District"));

      if ((v10 & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend(v3, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("City"));

        if ((v12 & 1) != 0)
        {
          v6 = 4;
        }
        else
        {
          objc_msgSend(v3, "label");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("County"));

          if (v14)
            v6 = 5;
          else
            v6 = 0;
        }
      }
    }
  }

  return v6;
}

@end
