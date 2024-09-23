@implementation PDBucket

- (PDBucket)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PDBucket *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  PDBucket *v15;
  PDBucket *v16;
  __CFString *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PDBucket;
  v7 = -[PDBucket init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR(">="));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a4, CFSTR("bucket >="));
      v16 = (PDBucket *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v8, "doubleValue");
      -[PDBucket setLowerInclusiveBound:](v7, "setLowerInclusiveBound:");
      -[PDBucket setCount:](v7, "setCount:", objc_msgSend(v9, "unsignedIntegerValue"));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("label"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDBucket setLabel:](v7, "setLabel:", v10);

      -[PDBucket label](v7, "label");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || (v12 = (void *)v11,
            -[PDBucket label](v7, "label"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v13,
            v12,
            (isKindOfClass & 1) != 0))
      {
        v15 = v7;
LABEL_13:
        v16 = v15;

        goto LABEL_14;
      }
      v17 = CFSTR("bucket label");
    }
    else
    {
      v17 = CFSTR("bucket count");
    }
    handle_malformed_data(a4, v17);
    v15 = (PDBucket *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (double)lowerInclusiveBound
{
  return self->_lowerInclusiveBound;
}

- (void)setLowerInclusiveBound:(double)a3
{
  self->_lowerInclusiveBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_upperBound = a3;
}

- (BOOL)hasInclusiveUpperBound
{
  return self->_hasInclusiveUpperBound;
}

- (void)setHasInclusiveUpperBound:(BOOL)a3
{
  self->_hasInclusiveUpperBound = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
