@implementation PGGraphHighlightChange

- (PGGraphHighlightChange)initWithHighlightUUID:(id)a3 updateTypes:(unint64_t)a4
{
  id v7;
  PGGraphHighlightChange *v8;
  PGGraphHighlightChange *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphHighlightChange;
  v8 = -[PGGraphHighlightChange init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_highlightUUID, a3);
    v9->_updateTypes = a4;
  }

  return v9;
}

- (unint64_t)type
{
  return 9;
}

- (void)mergeChange:(id)a3
{
  unint64_t updateTypes;

  updateTypes = self->_updateTypes;
  self->_updateTypes = objc_msgSend(a3, "updateTypes") | updateTypes;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphHighlightChange;
  -[PGGraphChange description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [highlightUUID:%@]"), v4, self->_highlightUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)highlightUUID
{
  return self->_highlightUUID;
}

- (unint64_t)updateTypes
{
  return self->_updateTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightUUID, 0);
}

@end
