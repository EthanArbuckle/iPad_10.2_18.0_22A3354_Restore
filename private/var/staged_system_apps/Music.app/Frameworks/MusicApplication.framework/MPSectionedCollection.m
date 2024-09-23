@implementation MPSectionedCollection

- (id)filteredWithSections:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  MPSectionedCollection *v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __66__MPSectionedCollection_MCDNowPlayingUtils__filteredWithSections___block_invoke;
  v8[3] = &unk_133A380;
  v9 = a3;
  v10 = (id)objc_opt_new(MPMutableSectionedCollection);
  v11 = self;
  v4 = v10;
  v5 = v9;
  -[MPSectionedCollection enumerateSectionsUsingBlock:](self, "enumerateSectionsUsingBlock:", v8);
  v6 = objc_msgSend(v4, "copy");

  return v6;
}

void __66__MPSectionedCollection_MCDNowPlayingUtils__filteredWithSections___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    objc_msgSend(a1[5], "appendSection:", v7);
    v5 = a1[5];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "itemsInSectionAtIndex:", a3));
    objc_msgSend(v5, "appendItems:", v6);

  }
}

+ (id)withModelObject:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = static MPSectionedCollection.withModelObject(_:)((uint64_t)v3);

  return v4;
}

@end
