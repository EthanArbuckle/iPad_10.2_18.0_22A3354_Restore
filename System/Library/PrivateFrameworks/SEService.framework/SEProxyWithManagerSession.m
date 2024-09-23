@implementation SEProxyWithManagerSession

- (void)setSession:(void *)a3 seid:
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 8), a2);
    objc_storeStrong((id *)(a1 + 16), a3);
  }

}

- (void)transceive:(id)a3 callback:(id)a4
{
  NFSecureElementManagerSession *session;
  NSString *seid;
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  id v10;
  id v11;

  session = self->_session;
  seid = self->_seid;
  v11 = 0;
  v7 = (void (**)(id, void *, id))a4;
  v8 = a3;
  -[NFSecureElementManagerSession transceive:forSEID:error:](session, "transceive:forSEID:error:", v8, seid, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  NSLog(CFSTR("SESERV: client returning %@ %@ %@"), v8, v9, v10);

  v7[2](v7, v9, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
