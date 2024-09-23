@implementation PUTileIdentifier

- (PUTileIdentifier)initWithIndexPath:(id)a3 tileKind:(id)a4 dataSourceIdentifier:(id)a5
{
  id v10;
  id v11;
  id v12;
  PUTileIdentifier *v13;
  PUTileIdentifier *v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileLayoutInfo.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileKind != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileLayoutInfo.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileLayoutInfo.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceIdentifier != nil"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PUTileIdentifier;
  v13 = -[PUTileIdentifier init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_indexPath, a3);
    objc_storeStrong((id *)&v14->_tileKind, a4);
    objc_storeStrong((id *)&v14->_dataSourceIdentifier, a5);
    v15 = objc_msgSend(v12, "hash");
    v16 = objc_msgSend(v11, "hash") - v15 + 32 * v15;
    v14->_hash = objc_msgSend(v10, "hash") - v16 + 32 * v16 + 29791;
  }

  return v14;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 == -[PUTileIdentifier hash](self, "hash")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[NSIndexPath isEqual:](self->_indexPath, "isEqual:", v4[2])
    && -[NSString isEqualToString:](self->_tileKind, "isEqualToString:", v4[3])
    && -[NSString isEqualToString:](self->_dataSourceIdentifier, "isEqualToString:", v4[4]);

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileIdentifier indexPath](self, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileIdentifier tileKind](self, "tileKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileIdentifier dataSourceIdentifier](self, "dataSourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; indexPath: %@; tileKind: %@; dataSourceIdentifier: %@>"),
    v5,
    self,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (NSString)tileKind
{
  return self->_tileKind;
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_tileKind, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
