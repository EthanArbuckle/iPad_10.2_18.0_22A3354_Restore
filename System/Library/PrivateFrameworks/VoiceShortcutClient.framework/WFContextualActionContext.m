@implementation WFContextualActionContext

- (WFContextualActionContext)initWithSurface:(unint64_t)a3 staccatoInteractionType:(id)a4 preciseTimestamp:(id)a5
{
  id v9;
  id v10;
  WFContextualActionContext *v11;
  WFContextualActionContext *v12;
  WFContextualActionContext *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFContextualActionContext;
  v11 = -[WFContextualActionContext init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_surface = a3;
    v11->_allowsExpensiveFetch = 0;
    objc_storeStrong((id *)&v11->_preciseTimestamp, a5);
    objc_storeStrong((id *)&v12->_staccatoInteractionType, a4);
    v13 = v12;
  }

  return v12;
}

- (WFContextualActionContext)initWithSurface:(unint64_t)a3
{
  return -[WFContextualActionContext initWithSurface:staccatoInteractionType:preciseTimestamp:](self, "initWithSurface:staccatoInteractionType:preciseTimestamp:", a3, CFSTR("WFStaccatoActionInteractionTypeUnknown"), 0);
}

- (WFContextualActionContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFContextualActionContext *v17;
  WFContextualActionContext *v18;
  WFContextualActionContext *v19;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("files"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("surface"));
  v10 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("allowsExpensiveFetch"));
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("historicalActionIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staccatoInteractionType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preciseTimestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[WFContextualActionContext initWithSurface:staccatoInteractionType:preciseTimestamp:](self, "initWithSurface:staccatoInteractionType:preciseTimestamp:", v9, v15, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_files, v8);
    v18->_allowsExpensiveFetch = v10;
    objc_storeStrong((id *)&v18->_historicalActionIdentifiers, v14);
    v19 = v18;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *files;
  id v5;

  files = self->_files;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", files, CFSTR("files"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_surface, CFSTR("surface"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsExpensiveFetch, CFSTR("allowsExpensiveFetch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_historicalActionIdentifiers, CFSTR("historicalActionIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preciseTimestamp, CFSTR("preciseTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_staccatoInteractionType, CFSTR("staccatoInteractionType"));

}

- (unint64_t)surface
{
  return self->_surface;
}

- (void)setSurface:(unint64_t)a3
{
  self->_surface = a3;
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (BOOL)allowsExpensiveFetch
{
  return self->_allowsExpensiveFetch;
}

- (void)setAllowsExpensiveFetch:(BOOL)a3
{
  self->_allowsExpensiveFetch = a3;
}

- (NSArray)historicalActionIdentifiers
{
  return self->_historicalActionIdentifiers;
}

- (void)setHistoricalActionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_historicalActionIdentifiers, a3);
}

- (NSDate)preciseTimestamp
{
  return self->_preciseTimestamp;
}

- (void)setPreciseTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_preciseTimestamp, a3);
}

- (NSString)staccatoInteractionType
{
  return self->_staccatoInteractionType;
}

- (void)setStaccatoInteractionType:(id)a3
{
  objc_storeStrong((id *)&self->_staccatoInteractionType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staccatoInteractionType, 0);
  objc_storeStrong((id *)&self->_preciseTimestamp, 0);
  objc_storeStrong((id *)&self->_historicalActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
