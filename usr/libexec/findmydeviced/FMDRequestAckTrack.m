@implementation FMDRequestAckTrack

- (FMDRequestAckTrack)initWithAccount:(id)a3 trackCommand:(id)a4 ackURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDRequestAckTrack *v11;
  FMDRequestAckTrack *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestAckTrack;
  v11 = -[FMDRequest initWithAccount:](&v14, "initWithAccount:", v8);
  v12 = v11;
  if (v11)
  {
    -[FMDRequestAckTrack setAccount:](v11, "setAccount:", v8);
    -[FMDRequestAckTrack setTrackCommand:](v12, "setTrackCommand:", v9);
    -[FMDRequestAckTrack setAckURL:](v12, "setAckURL:", v10);
  }

  return v12;
}

- (id)requestUrl
{
  return -[FMDRequestAckTrack ackURL](self, "ackURL");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  FMDActingRequestDecorator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FMDRequestAckTrack;
  v3 = -[FMDRequest requestBody](&v12, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_alloc_init(FMDActingRequestDecorator);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActingRequestDecorator standardDeviceContext](v5, "standardDeviceContext"));

  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceContext"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ServerDeviceInfo sharedInstance](ServerDeviceInfo, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckTrack account](self, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceInfoForAccount:", v8));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceInfo"), v9);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1002D7FA8, CFSTR("statusCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckTrack trackCommand](self, "trackCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("cmdContext"));

  return v4;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v9 = objc_opt_class(self, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckTrack trackCommand](self, "trackCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trackCommand"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id")));
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)trackCommand
{
  return self->_trackCommand;
}

- (void)setTrackCommand:(id)a3
{
  objc_storeStrong((id *)&self->_trackCommand, a3);
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
  objc_storeStrong((id *)&self->_ackURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_trackCommand, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
