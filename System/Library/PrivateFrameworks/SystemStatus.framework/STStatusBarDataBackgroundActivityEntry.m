@implementation STStatusBarDataBackgroundActivityEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

+ (id)entryWithBackgroundActivityIdentifier:(id)a3 displayStartDate:(double)a4 detailString:(id)a5
{
  id v8;
  id v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a5;
  v9 = a3;
  v10 = (double *)objc_alloc_init((Class)a1);
  v11 = objc_msgSend(v9, "copy");

  v12 = (void *)*((_QWORD *)v10 + 2);
  *((_QWORD *)v10 + 2) = v11;

  v10[3] = a4;
  v13 = objc_msgSend(v8, "copy");

  v14 = (void *)*((_QWORD *)v10 + 4);
  *((_QWORD *)v10 + 4) = v13;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundActivityIdentifier, CFSTR("backgroundActivityIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("displayStartDate"), self->_displayStartDate);
  objc_msgSend(v4, "encodeObject:forKey:", self->_detailString, CFSTR("detailString"));

}

- (STStatusBarDataBackgroundActivityEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataBackgroundActivityEntry *v4;
  uint64_t v5;
  NSString *backgroundActivityIdentifier;
  double v7;
  uint64_t v8;
  NSString *detailString;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  v3 = a3;
  v4 = -[STStatusBarDataEntry initWithCoder:](&v11, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundActivityIdentifier"), v11.receiver, v11.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  backgroundActivityIdentifier = v4->_backgroundActivityIdentifier;
  v4->_backgroundActivityIdentifier = (NSString *)v5;

  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("displayStartDate"));
  v4->_displayStartDate = v7;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailString"));
  v8 = objc_claimAutoreleasedReturnValue();

  detailString = v4->_detailString;
  v4->_detailString = (NSString *)v8;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  -[STStatusBarDataEntry succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataBackgroundActivityEntry backgroundActivityIdentifier](self, "backgroundActivityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  STBackgroundActivityIdentifierDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("backgroundActivityIdentifier"));

  -[STStatusBarDataBackgroundActivityEntry detailString](self, "detailString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("detailString"));

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  -[STStatusBarDataEntry _equalsBuilderWithObject:](&v25, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[STStatusBarDataBackgroundActivityEntry backgroundActivityIdentifier](self, "backgroundActivityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke;
  v23[3] = &unk_1E91E4B00;
  v9 = v6;
  v24 = v9;
  v10 = (id)objc_msgSend(v5, "appendString:counterpart:", v7, v23);

  -[STStatusBarDataBackgroundActivityEntry displayStartDate](self, "displayStartDate");
  v12 = v11;
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_2;
  v21[3] = &unk_1E91E58D8;
  v13 = v9;
  v22 = v13;
  v14 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v21, v12);
  -[STStatusBarDataBackgroundActivityEntry detailString](self, "detailString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_3;
  v19[3] = &unk_1E91E4B00;
  v20 = v13;
  v16 = v13;
  v17 = (id)objc_msgSend(v5, "appendString:counterpart:", v15, v19);

  return v5;
}

uint64_t __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundActivityIdentifier");
}

uint64_t __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayStartDate");
}

uint64_t __67__STStatusBarDataBackgroundActivityEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "detailString");
}

- (id)_hashBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  -[STStatusBarDataEntry _hashBuilder](&v10, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataBackgroundActivityEntry backgroundActivityIdentifier](self, "backgroundActivityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STStatusBarDataBackgroundActivityEntry displayStartDate](self, "displayStartDate");
  v6 = (id)objc_msgSend(v3, "appendDouble:");
  -[STStatusBarDataBackgroundActivityEntry detailString](self, "detailString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendString:", v7);

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  v4 = a3;
  -[STStatusBarDataEntry encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundActivityIdentifier, CFSTR("backgroundActivityIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("displayStartDate"), self->_displayStartDate);
  objc_msgSend(v4, "encodeObject:forKey:", self->_detailString, CFSTR("detailString"));

}

- (STStatusBarDataBackgroundActivityEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataBackgroundActivityEntry *v5;
  uint64_t v6;
  NSString *backgroundActivityIdentifier;
  double v8;
  uint64_t v9;
  NSString *detailString;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STStatusBarDataBackgroundActivityEntry;
  v5 = -[STStatusBarDataEntry initWithBSXPCCoder:](&v12, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("backgroundActivityIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundActivityIdentifier = v5->_backgroundActivityIdentifier;
    v5->_backgroundActivityIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("displayStartDate"));
    v5->_displayStartDate = v8;
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("detailString"));
    v9 = objc_claimAutoreleasedReturnValue();
    detailString = v5->_detailString;
    v5->_detailString = (NSString *)v9;

  }
  return v5;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (double)displayStartDate
{
  return self->_displayStartDate;
}

- (NSString)detailString
{
  return self->_detailString;
}

@end
