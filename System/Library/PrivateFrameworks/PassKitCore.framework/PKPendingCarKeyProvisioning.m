@implementation PKPendingCarKeyProvisioning

- (PKPendingCarKeyProvisioning)initWithCarKeyConfiguration:(id)a3
{
  id v5;
  void *v6;
  PKPendingCarKeyProvisioning *v7;
  PKPendingCarKeyProvisioning *v8;
  objc_super v10;

  v5 = a3;
  +[PKPendingCarKeyProvisioning uniqueIdentifierForCarKeyConfiguration:](PKPendingCarKeyProvisioning, "uniqueIdentifierForCarKeyConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PKPendingCarKeyProvisioning;
  v7 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v10, sel_initWithUniqueIdentifier_status_, v6, 3);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_configuration, a3);

  return v8;
}

- (id)type
{
  return CFSTR("CarKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingCarKeyProvisioning)initWithCoder:(id)a3
{
  id v4;
  PKPendingCarKeyProvisioning *v5;
  uint64_t v6;
  PKAddCarKeyPassConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPendingCarKeyProvisioning;
  v5 = -[PKPendingProvisioning initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (PKAddCarKeyPassConfiguration *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPendingCarKeyProvisioning;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"), v5.receiver, v5.super_class);

}

- (void)_copyIntoPendingProvision:(id)a3
{
  objc_storeStrong((id *)a3 + 7, self->_configuration);
}

+ (id)uniqueIdentifierForBrandIdentifier:(id)a3 pairedReaderIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("CarKey"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)representsPass:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  char v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a3, "devicePaymentApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v5 = *(_QWORD *)v29;
    v23 = v4;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v4);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "subcredentials");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              +[PKPendingCarKeyProvisioning uniqueIdentifierForSubcredential:](PKPendingCarKeyProvisioning, "uniqueIdentifierForSubcredential:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPendingProvisioning uniqueIdentifier](self, "uniqueIdentifier");
              v14 = (id)objc_claimAutoreleasedReturnValue();
              v15 = v13;
              v16 = v15;
              if (v14 == v15)
              {

LABEL_25:
                v19 = 1;
                v4 = v23;
                goto LABEL_27;
              }
              if (v15)
                v17 = v14 == 0;
              else
                v17 = 1;
              if (v17)
              {

              }
              else
              {
                v18 = objc_msgSend(v14, "isEqualToString:", v15);

                if ((v18 & 1) != 0)
                  goto LABEL_25;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v10)
              continue;
            break;
          }
        }

        v4 = v23;
        v5 = v21;
      }
      v19 = 0;
      v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }
  else
  {
    v19 = 0;
  }
LABEL_27:

  return v19;
}

+ (id)uniqueIdentifierForCarKeyConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "issuerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedReaderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "uniqueIdentifierForBrandIdentifier:pairedReaderIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)uniqueIdentifierForSubcredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "brandIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedReaderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "uniqueIdentifierForBrandIdentifier:pairedReaderIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
