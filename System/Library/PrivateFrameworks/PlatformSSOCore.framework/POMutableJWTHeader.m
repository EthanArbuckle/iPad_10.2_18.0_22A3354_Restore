@implementation POMutableJWTHeader

- (void)setTyp:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("typ"));

}

- (void)setCty:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("cty"));

}

- (void)setAlg:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("alg"));

}

- (void)setX5c:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("x5c"));

}

- (void)setX5t:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("x5t"));

}

- (void)setKid:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kid"));

}

- (void)setEnc:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("enc"));

}

- (void)setP2s:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("p2s"));

}

- (void)setP2c:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("p2c"));

}

- (void)setEpk:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("epk"));

}

- (void)setApu:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("apu"));

}

- (void)setApv:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("apv"));

}

- (void)addCustomClaims:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[POJWTHeader data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

- (void)addEphemeralPublicKey:(__SecKey *)a3
{
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  CFDataRef v8;
  CFDataRef v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  CFErrorRef error;

  v5 = SecKeyCopyAttributes(a3);
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x24BDE9028]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x24BDE9050]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE9038])
    && ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDE9058]) & 1) != 0
     || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDE9060]) & 1) != 0))
  {
    error = 0;
    v8 = SecKeyCopyExternalRepresentation(a3, &error);
    v9 = v8;
    if (error)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_85;
      v18[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v18[4] = error;
      v10 = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_85((uint64_t)v18);
    }
    else if (-[__CFData length](v8, "length") == 65)
    {
      -[__CFData subdataWithRange:](v9, "subdataWithRange:", 1, 32);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData subdataWithRange:](v9, "subdataWithRange:", 33, 32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("EC"), CFSTR("kty"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("P-256"), CFSTR("crv"));
      objc_msgSend(v12, "psso_base64URLEncodedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("x"));

      objc_msgSend(v13, "psso_base64URLEncodedString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("y"));

      -[POMutableJWTHeader setEpk:](self, "setEpk:", v14);
    }
    else
    {
      v17 = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_89();
    }

  }
  else
  {
    v11 = __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke();
  }

}

id __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Invalid epk type."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTHeader();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_85(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with epk external representation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POJWTHeader();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __44__POMutableJWTHeader_addEphemeralPublicKey___block_invoke_89()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Error with dataRepresentation length for epk."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTHeader();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

@end
