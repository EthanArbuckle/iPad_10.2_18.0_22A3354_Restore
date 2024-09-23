@implementation TransparencyIDSRegistrationData

- (id)validateSignature:(id)a3 withPublicKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData publicKey](self, "publicKey"));

  if (v8)
  {

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData publicKey](self, "publicKey"));
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData tbsKTIDSRegistrationData](self, "tbsKTIDSRegistrationData"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData signature](self, "signature"));
      v13 = objc_msgSend(v6, "verifyData:signature:accountPublicKeyInfo:error:", v11, v12, v7, 0);

      if (v13)
        v14 = 0;
      else
        v14 = CFSTR("signatureIncorrect");
    }
    else
    {
      v14 = CFSTR("publicKeyMismatch");
    }
  }
  else
  {
    v14 = CFSTR("notSignedYet-publicKey");
  }

  return (id)v14;
}

- (id)metricsTimeToCreate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData createdAt](self, "createdAt"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData signedAt](self, "signedAt"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData signedAt](self, "signedAt"));
      v6 = objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData createdAt](self, "createdAt"));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData createdAt](self, "createdAt"));
      v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    }
    v7 = (void *)v6;
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  }
  return v3;
}

@end
