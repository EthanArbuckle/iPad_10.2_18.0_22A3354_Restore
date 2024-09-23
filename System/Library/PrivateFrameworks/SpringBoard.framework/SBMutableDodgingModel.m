@implementation SBMutableDodgingModel

- (void)bringIdentifierToFront:(id)a3
{
  -[SBMutableDodgingModel setIndex:forIdentifier:](self, "setIndex:forIdentifier:", 0, a3);
}

- (void)setIndex:(unint64_t)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SBDodgingModel identifiers](self, "identifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);
  objc_msgSend(v7, "insertObject:atIndex:", v6, a3);

}

- (void)removeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SBDodgingModel identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[SBDodgingModel centersForIdentifiers](self, "centersForIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

  -[SBDodgingModel sizesForIdentifiers](self, "sizesForIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);

}

- (void)addIdentifier:(id)a3 atIndex:(unint64_t)a4 center:(CGPoint)a5 size:(CGSize)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  id v13;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v13 = a3;
  -[SBDodgingModel identifiers](self, "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertObject:atIndex:", v13, a4);

  -[SBMutableDodgingModel setCenter:forIdentifier:](self, "setCenter:forIdentifier:", v13, x, y);
  -[SBMutableDodgingModel setSize:forIdentifier:](self, "setSize:forIdentifier:", v13, width, height);

}

- (void)setCenter:(CGPoint)a3 forIdentifier:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  y = a3.y;
  x = a3.x;
  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[SBDodgingModel centersForIdentifiers](self, "centersForIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEntriesFromDictionary:", v10);
}

- (void)setSize:(CGSize)a3 forIdentifier:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  height = a3.height;
  width = a3.width;
  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[SBDodgingModel sizesForIdentifiers](self, "sizesForIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEntriesFromDictionary:", v10);
}

- (void)setReferenceBounds:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMutableDodgingModel;
  -[SBDodgingModel setReferenceBounds:](&v3, sel_setReferenceBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
