@implementation TPSSubscriptionLabel

+ (id)labelsFromUnlocalizedLabels:(id)a3 localizedLongLabels:(id)a4 localizedBadgeLabels:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "count");
  if (v11 == objc_msgSend(v8, "count"))
  {
    v12 = objc_msgSend(v9, "count");
    if (v12 == objc_msgSend(v8, "count"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __93__TPSSubscriptionLabel_labelsFromUnlocalizedLabels_localizedLongLabels_localizedBadgeLabels___block_invoke;
      v15[3] = &unk_1EA2CD900;
      v16 = v8;
      v17 = v9;
      v18 = v10;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);

    }
  }
  v13 = (void *)objc_msgSend(v10, "copy");

  return v13;
}

void __93__TPSSubscriptionLabel_labelsFromUnlocalizedLabels_localizedLongLabels_localizedBadgeLabels___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  TPSSubscriptionLabel *v6;
  void *v7;
  void *v8;
  TPSSubscriptionLabel *v9;

  v5 = a2;
  v6 = [TPSSubscriptionLabel alloc];
  objc_msgSend(a1[4], "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TPSSubscriptionLabel initWithUnlocalizedLabel:localizedLongLabel:localizedBadgeLabel:](v6, "initWithUnlocalizedLabel:localizedLongLabel:localizedBadgeLabel:", v5, v7, v8);

  objc_msgSend(a1[6], "addObject:", v9);
}

- (TPSSubscriptionLabel)initWithUnlocalizedLabel:(id)a3 localizedLongLabel:(id)a4 localizedBadgeLabel:(id)a5
{
  id v9;
  id v10;
  id v11;
  TPSSubscriptionLabel *v12;
  TPSSubscriptionLabel *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSSubscriptionLabel;
  v12 = -[TPSSubscriptionLabel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_unlocalizedLongLabel, a3);
    objc_storeStrong((id *)&v13->_localizedLongLabel, a4);
    objc_storeStrong((id *)&v13->_localizedBadgeLabel, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TPSSubscriptionLabel localizedLongLabel](self, "localizedLongLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriptionLabel localizedBadgeLabel](self, "localizedBadgeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TPSSubscriptionLabel unlocalizedLongLabel](self, "unlocalizedLongLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TPSSubscriptionLabel localizedLongLabel](self, "localizedLongLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TPSSubscriptionLabel localizedBadgeLabel](self, "localizedBadgeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TPSSubscriptionLabel *v4;
  BOOL v5;

  v4 = (TPSSubscriptionLabel *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSSubscriptionLabel isEqualToSubscriptionLabel:](self, "isEqualToSubscriptionLabel:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSubscriptionLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[TPSSubscriptionLabel localizedBadgeLabel](self, "localizedBadgeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedBadgeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TPSSubscriptionLabel localizedLongLabel](self, "localizedLongLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedLongLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TPSSubscriptionLabel unlocalizedLongLabel](self, "unlocalizedLongLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unlocalizedLongLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)localizedBadgeLabel
{
  return self->_localizedBadgeLabel;
}

- (NSString)localizedLongLabel
{
  return self->_localizedLongLabel;
}

- (NSString)unlocalizedLongLabel
{
  return self->_unlocalizedLongLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlocalizedLongLabel, 0);
  objc_storeStrong((id *)&self->_localizedLongLabel, 0);
  objc_storeStrong((id *)&self->_localizedBadgeLabel, 0);
}

@end
