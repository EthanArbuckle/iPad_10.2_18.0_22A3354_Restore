@implementation PRMutablePosterAmbientConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterAmbientConfiguration *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  _BOOL8 v10;
  PRPosterAmbientConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  PRMutablePosterAmbientConfiguration *v15;
  uint64_t v17;

  v4 = [PRPosterAmbientConfiguration alloc];
  v5 = -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout");
  v6 = -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior");
  v7 = -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior");
  v8 = -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior");
  v9 = -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior");
  v10 = -[PRPosterAmbientConfiguration hidden](self, "hidden");
  LOBYTE(v17) = -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication");
  v11 = -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:](v4, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", v5, v6, v7, v8, v9, v10, v17, -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"));
  -[PRPosterAmbientConfiguration displayNameSystemSymbolName](self, "displayNameSystemSymbolName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterAmbientConfiguration setDisplayNameSystemSymbolName:](v11, "setDisplayNameSystemSymbolName:", v12);

  -[PRPosterAmbientConfiguration editingSystemSymbolName](self, "editingSystemSymbolName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterAmbientConfiguration setEditingSystemSymbolName:](v11, "setEditingSystemSymbolName:", v13);

  -[PRPosterAmbientConfiguration editingContentStyle](self, "editingContentStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterAmbientConfiguration setEditingContentStyle:](v11, "setEditingContentStyle:", v14);

  v15 = self;
  return v15;
}

@end
