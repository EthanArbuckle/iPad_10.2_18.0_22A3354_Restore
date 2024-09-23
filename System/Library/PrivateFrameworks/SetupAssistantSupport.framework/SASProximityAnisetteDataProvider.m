@implementation SASProximityAnisetteDataProvider

- (void)provisionAnisetteWithCompletion:(id)a3
{
  SASProximityAnisetteRequestAction *v4;
  void *v5;
  id v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a3;
  v4 = objc_alloc_init(SASProximityAnisetteRequestAction);
  -[SASProximityAnisetteRequestAction setRequest:](v4, "setRequest:", 0);
  -[SASProximityAnisetteDataProvider session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "sendAction:", v4);

  if (v7)
    v7[2](v7, -[SASProximityAnisetteRequestAction success](v4, "success"), 0);

}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6;
  SASProximityAnisetteRequestAction *v7;
  void *v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);

  v10 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  v7 = objc_alloc_init(SASProximityAnisetteRequestAction);
  -[SASProximityAnisetteRequestAction setRequest:](v7, "setRequest:", 1);
  -[SASProximityAnisetteRequestAction setSim:](v7, "setSim:", v6);

  -[SASProximityAnisetteDataProvider session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "sendAction:", v7);

  if (v10)
    v10[2](v10, -[SASProximityAnisetteRequestAction success](v7, "success"), 0);

}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  SASProximityAnisetteRequestAction *v4;
  void *v5;
  id v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a3;
  v4 = objc_alloc_init(SASProximityAnisetteRequestAction);
  -[SASProximityAnisetteRequestAction setRequest:](v4, "setRequest:", 2);
  -[SASProximityAnisetteDataProvider session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "sendAction:", v4);

  if (v7)
    v7[2](v7, -[SASProximityAnisetteRequestAction success](v4, "success"), 0);

}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  SASProximityAnisetteRequestAction *v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(id, void *, _QWORD);

  v4 = a3;
  v10 = (void (**)(id, void *, _QWORD))a4;
  v6 = objc_alloc_init(SASProximityAnisetteRequestAction);
  -[SASProximityAnisetteRequestAction setRequest:](v6, "setRequest:", 3);
  -[SASProximityAnisetteRequestAction setShouldProvision:](v6, "setShouldProvision:", v4);
  -[SASProximityAnisetteDataProvider session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "sendAction:", v6);

  if (v10)
  {
    -[SASProximityAnisetteRequestAction anisetteData](v6, "anisetteData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v9, 0);

  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  SASProximityAnisetteRequestAction *v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(id, void *, _QWORD);

  v9 = (void (**)(id, void *, _QWORD))a4;
  v5 = objc_alloc_init(SASProximityAnisetteRequestAction);
  -[SASProximityAnisetteRequestAction setRequest:](v5, "setRequest:", 4);
  -[SASProximityAnisetteDataProvider session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "sendAction:", v5);

  if (v9)
  {
    -[SASProximityAnisetteRequestAction anisetteData](v5, "anisetteData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8, 0);

  }
}

- (SASProximitySession)session
{
  return (SASProximitySession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
