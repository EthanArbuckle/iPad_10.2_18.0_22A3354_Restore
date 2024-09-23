@implementation PLEditSource

- (PLEditSource)initWithResolvedSource:(id)a3 mediaType:(int64_t)a4
{
  NUSource *v7;
  PLEditSource *v8;
  NUSource *resolvedSource;
  void *v11;
  void *v12;
  objc_super v13;

  v7 = (NUSource *)a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEditSource.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source != nil"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEditSource.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaType != NUMediaTypeUnknown"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v13.receiver = self;
  v13.super_class = (Class)PLEditSource;
  v8 = -[PLEditSource init](&v13, sel_init);
  resolvedSource = v8->_resolvedSource;
  v8->_resolvedSource = v7;
  v8->_mediaType = a4;

  return v8;
}

- (void)setResolvedSource:(id)a3 mediaType:(int64_t)a4
{
  NUSource *v7;
  NUSource *resolvedSource;
  void *v9;
  void *v10;

  v7 = (NUSource *)a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEditSource.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolvedSource != nil"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEditSource.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaType != NUMediaTypeUnknown"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  resolvedSource = self->_resolvedSource;
  self->_resolvedSource = v7;
  self->_mediaType = a4;

}

- (NUSource)source
{
  return self->_resolvedSource;
}

- (void)setIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLEditSource resolvedSource](self, "resolvedSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssetIdentifier:", v4);

}

- (BOOL)isRAWSource
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> %@"), objc_opt_class(), self, self->_resolvedSource);
}

- (NUSource)resolvedSource
{
  return self->_resolvedSource;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedSource, 0);
}

@end
