@implementation PKHomeKeyCredential

- (PKHomeKeyCredential)initWithPaymentPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKHomeKeyCredential *v9;
  PKHomeKeyCredential *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  NSSet *paymentApplications;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "paymentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v8);

  v17.receiver = self;
  v17.super_class = (Class)PKHomeKeyCredential;
  v9 = -[PKPaymentLocalPassCredential initWithPaymentPass:](&v17, sel_initWithPaymentPass_, v4);
  v10 = v9;
  if (v9)
  {
    -[PKPaymentCredential setCardType:](v9, "setCardType:", 3);
    objc_msgSend(v4, "frontFieldBuckets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v10->_detailDescriptionAvailable = v12 > 1;
    if (v12 >= 2)
    {
      PKLocalizedHomeKeyString(CFSTR("PRODUCT_NAME_HOME_KEY"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentCredential setLongDescription:](v10, "setLongDescription:", v13);

    }
    objc_msgSend(v4, "paymentApplications");
    v14 = objc_claimAutoreleasedReturnValue();
    paymentApplications = v10->_paymentApplications;
    v10->_paymentApplications = (NSSet *)v14;

  }
  return v10;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (self->_detailDescriptionAvailable)
  {
    -[PKPaymentLocalPassCredential paymentPass](self, "paymentPass", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)paymentApplications
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PKProvisioningPaymentApplication *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_paymentApplications;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "paymentType", (_QWORD)v16);
        v10 = v9;
        if (v9 == 1004)
        {
          +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirAliro](PKProvisioningSEStorageSnapshot, "appletTypePurpleTrustAirAliro");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v9 != 1003)
            continue;
          +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirHome](PKProvisioningSEStorageSnapshot, "appletTypePurpleTrustAirHome");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v12 = (void *)v11;
        if (v11)
        {
          v13 = -[PKProvisioningPaymentApplication initWithAppletTypeIdentifier:paymentType:]([PKProvisioningPaymentApplication alloc], "initWithAppletTypeIdentifier:paymentType:", v11, v10);
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplications, 0);
}

@end
