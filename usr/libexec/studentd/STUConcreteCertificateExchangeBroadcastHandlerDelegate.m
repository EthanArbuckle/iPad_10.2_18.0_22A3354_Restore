@implementation STUConcreteCertificateExchangeBroadcastHandlerDelegate

- (STUConcreteCertificateExchangeBroadcastHandlerDelegate)initWithRosterProvider:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  STUConcreteCertificateExchangeBroadcastHandlerDelegate *v9;
  STUConcreteCertificateExchangeBroadcastHandlerDelegate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUConcreteCertificateExchangeBroadcastHandlerDelegate;
  v9 = -[STUConcreteCertificateExchangeBroadcastHandlerDelegate init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rosterProvider, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (id)certificateExchangeHandler:(id)a3 needsCertificatesForRequester:(id)a4 sourceRole:(int64_t)a5 destinationRole:(int64_t)a6 controlGroupIdentifier:(id)a7 destinationDeviceIdentifier:(id)a8 requesterCertificate:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = objc_claimAutoreleasedReturnValue(-[STUConcreteCertificateExchangeBroadcastHandlerDelegate courseWithIdentifier:](self, "courseWithIdentifier:", v16));
  v20 = (void *)v19;
  if (a5
    && a6 != 1
    && v19
    && -[STUConcreteCertificateExchangeBroadcastHandlerDelegate course:containsInstructorWithAppleID:](self, "course:containsInstructorWithAppleID:", v19, v15)&& -[STUConcreteCertificateExchangeBroadcastHandlerDelegate isDeviceIdentifierForThisDevice:](self, "isDeviceIdentifierForThisDevice:", v17))
  {
    -[STUConcreteCertificateExchangeBroadcastHandlerDelegate ingestInstructorCertificateData:appleID:courseIdentifier:](self, "ingestInstructorCertificateData:appleID:courseIdentifier:", v18, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteCertificateExchangeBroadcastHandlerDelegate certificateDataCollectionForCourse:](self, "certificateDataCollectionForCourse:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRKCertificatesRequestResult resultWithCertificateDataCollection:](CRKCertificatesRequestResult, "resultWithCertificateDataCollection:", v21));

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRKCertificatesRequestResult invalidResult](CRKCertificatesRequestResult, "invalidResult"));
  }

  return v22;
}

- (id)certificateDataCollectionForCourse:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "certificate"));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataRepresentation"));
  v6 = (void *)v5;
  if (v5)
  {
    v11 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  else
  {
    v8 = sub_100077DA4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10007E610(v9);

    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (void)ingestInstructorCertificateData:(id)a3 appleID:(id)a4 courseIdentifier:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v19 = v8;
    v10 = a5;
    v11 = a4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteCertificateExchangeBroadcastHandlerDelegate rosterProvider](self, "rosterProvider"));
    v18 = 0;
    v14 = +[STUASMRosterCertificateIngestor ingestCertificateDatas:intoRosterProvider:instructorAppleID:courseIdentifier:error:](STUASMRosterCertificateIngestor, "ingestCertificateDatas:intoRosterProvider:instructorAppleID:courseIdentifier:error:", v12, v13, v11, v10, &v18);

    v15 = v18;
    if ((v14 & 1) == 0)
    {
      v16 = sub_100077DA4();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10007E650(v15, v17);

    }
  }

}

- (BOOL)isDeviceIdentifierForThisDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteCertificateExchangeBroadcastHandlerDelegate device](self, "device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trustedExchangeIdentifier"));
  v7 = objc_msgSend(v6, "isEqual:", v4);

  return v7;
}

- (id)courseWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteCertificateExchangeBroadcastHandlerDelegate rosterProvider](self, "rosterProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "roster"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities courseWithIdentifier:inRoster:](STUASMRosterQueryUtilities, "courseWithIdentifier:inRoster:", v4, v6));

  return v7;
}

- (BOOL)course:(id)a3 containsInstructorWithAppleID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "trustedUsers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "appleID"));
        v11 = objc_msgSend(v10, "isEqualToString:", v5);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (STUDevice)device
{
  return self->_device;
}

- (CRKASMRosterProviding)rosterProvider
{
  return self->_rosterProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rosterProvider, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
