@implementation MFSearchSuggestionsTableViewModelReuseConfiguration

- (MFSearchSuggestionsTableViewModelReuseConfiguration)init
{
  -[MFSearchSuggestionsTableViewModelReuseConfiguration doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFSearchSuggestionsTableViewModelReuseConfiguration init]", "MFSearchSuggestionsTableViewModel.m", 30, "0");
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)initWithReuseIdentifier:(id)a3
{
  id v4;
  MFSearchSuggestionsTableViewModelReuseConfiguration *v5;
  NSString *v6;
  NSString *reuseIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFSearchSuggestionsTableViewModelReuseConfiguration;
  v5 = -[MFSearchSuggestionsTableViewModelReuseConfiguration init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    reuseIdentifier = v5->_reuseIdentifier;
    v5->_reuseIdentifier = v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration reuseIdentifier](self, "reuseIdentifier"));
  v6 = objc_msgSend(v4, "initWithReuseIdentifier:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration cellPopulator](self, "cellPopulator"));
  objc_msgSend(v6, "setCellPopulator:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration rowHeightCalculator](self, "rowHeightCalculator"));
  objc_msgSend(v6, "setRowHeightCalculator:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration rowSelector](self, "rowSelector"));
  objc_msgSend(v6, "setRowSelector:", v9);

  return v6;
}

- (void)validate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration reuseIdentifier](self, "reuseIdentifier"));
  if (!v3)
    sub_1003949D4();

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration cellPopulator](self, "cellPopulator"));
  if (!v4)
    sub_1003949FC();

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration rowHeightCalculator](self, "rowHeightCalculator"));
  if (!v5)
    sub_100394A24();

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModelReuseConfiguration rowSelector](self, "rowSelector"));
  if (!v6)
    sub_100394A4C();

}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (id)cellPopulator
{
  return self->_cellPopulator;
}

- (void)setCellPopulator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)rowHeightCalculator
{
  return self->_rowHeightCalculator;
}

- (void)setRowHeightCalculator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)rowSelector
{
  return self->_rowSelector;
}

- (void)setRowSelector:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rowSelector, 0);
  objc_storeStrong(&self->_rowHeightCalculator, 0);
  objc_storeStrong(&self->_cellPopulator, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
}

@end
