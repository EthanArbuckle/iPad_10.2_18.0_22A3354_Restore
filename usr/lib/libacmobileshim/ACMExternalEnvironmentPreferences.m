@implementation ACMExternalEnvironmentPreferences

+ (id)externalEnvironmentSpecifications
{
  const __CFString *v3;
  _QWORD v4[3];
  _QWORD v5[3];
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v9[3];
  _QWORD v10[3];
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("APPLECONNECT.APPLE.COM");
  v16 = CFSTR("ACMEnvironmentServerConfigKey");
  v13 = CFSTR("mobile.apple.com/acmob");
  v14[0] = CFSTR("ACMEnvironmentHostsKey");
  v15[0] = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v15[1] = &unk_24FD172E8;
  v14[1] = CFSTR("ACMEnvironmentServerAttemptsDelayKey");
  v14[2] = CFSTR("ACMEnvironmentMyAppleIDURLKey");
  v15[2] = CFSTR("https://appleid.apple.com");
  v17 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v19[0] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v18[1] = CFSTR("APPLECONNECT-UAT.APPLE.COM");
  v11 = CFSTR("ACMEnvironmentServerConfigKey");
  v8 = CFSTR("mobile-uat.corp.apple.com/acmob");
  v9[0] = CFSTR("ACMEnvironmentHostsKey");
  v10[0] = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v10[1] = &unk_24FD17300;
  v9[1] = CFSTR("ACMEnvironmentServerAttemptsDelayKey");
  v9[2] = CFSTR("ACMEnvironmentMyAppleIDURLKey");
  v10[2] = CFSTR("https://appleid-ut.corp.apple.com");
  v12 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v19[1] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v18[2] = CFSTR("AC-AT.APPLE.COM");
  v6 = CFSTR("ACMEnvironmentServerConfigKey");
  v3 = CFSTR("idmswt.corp.apple.com/acmob");
  v4[0] = CFSTR("ACMEnvironmentHostsKey");
  v5[0] = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v3, 1);
  v5[1] = &unk_24FD17318;
  v4[1] = CFSTR("ACMEnvironmentServerAttemptsDelayKey");
  v4[2] = CFSTR("ACMEnvironmentMyAppleIDURLKey");
  v5[2] = CFSTR("https://appleid-ut.corp.apple.com");
  v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v19[2] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
}

- (id)environmentSpecificationForRealm:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMExternalEnvironmentPreferences;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", -[ACMEnvironmentPreferences environmentSpecificationForRealm:](&v6, sel_environmentSpecificationForRealm_));
  objc_msgSend(v4, "addEntriesFromDictionary:", objc_msgSend(+[ACMExternalEnvironmentPreferences externalEnvironmentSpecifications](ACMExternalEnvironmentPreferences, "externalEnvironmentSpecifications"), "objectForKey:", a3));
  return (id)objc_msgSend(v4, "copy");
}

- (id)defaultPublicKeyString
{
  if (-[NSString isEqualToString:](-[ACMEnvironmentPreferences realm](self, "realm"), "isEqualToString:", CFSTR("APPLECONNECT.APPLE.COM")))
  {
    return CFSTR("MIIEPzCCAyegAwIBAgIIaPIH4VUAsEMwDQYJKoZIhvcNAQEFBQAweDEoMCYGA1UEAwwfQXBwbGUgSVNUIFNlcnZlciBDZXJ0aWZpY2F0ZSBDQTEqMCgGA1UECwwhQXBwbGUgSVNUIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MRMwEQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUzAeFw0xMDEwMTQxODM5MDJaFw0xMTA3MDgyMTU5NTlaMH8xLjAsBgkqhkiG9w0BCQEWH3NhY2ktY2VydC1hZG1pbkBncm91cC5hcHBsZS5jb20xHTAbBgNVBAMMFGFjbW9iZTAuZHMuYXBwbGUuY29tMQwwCgYDVQQLDANFVFMxEzARBgNVBAoMCkFwcGxlIEluYy4xCzAJBgNVBAYTAlVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA40YO0fcFrOe5iZPKn9jDKgmSscH+r0DyJHYnsvpv7N5kEccrpwK1z37dmfXV4bAzFZTp/rKQ6u3aPQ3E29a6cchNF/oZEcyq9XW8RP27j/YkWkw9r11C2cAv31R+AkAdXpxAMYU7+Xdp8g0+EWYq5o+ZYRxvzGOhZofNos2TzvF6TaOdEQ163pmhQIz6H6swDW7CcAhZrsKpD/kaPUhq33ml7QnQqM+Ut+TpGjtl5Z5QOGPxR0DqLkFKm9H9ievmXfQop5apNUkwVBTr/lTxgrwzHg0io7mVc5Mw/vAgKEARzLQmxiHx2QphcwFuuIznt99Wa5lyhkb4sB506FlT7wIDAQABo4HFMIHCMAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwEwHwYDVR0jBBgwFoAU3fq5NsxRQqSfMq047lK3j59EBLgwDgYDVR0PAQH/BAQDAgWgMB0GA1UdDgQWBBSOKsUHW8v1jeoHpHJJ2dhYIeVo8zA8BggrBgEFBQcBAQQwMC4wLAYIKwYBBQUHMAGGIGh0dHA6Ly9vY3NwLmFwcGxlLmNvbS9vY3NwLWlzdDAzMA8GA1UdEQQIMAaHBBEisCEwDQYJKoZIhvcNAQEFBQADggEBAHPKPxIXsy4MGYDCq+7VDkaG/dwF/e5Csg5tg9rGhJAoOLoGUtMM62wnFelc0Ty3sQmE9yh5V4SNCSHt9bdL+hNakagzThfJdajK2vNAvoPiGwz5YH/brxLj7ovN/LPiLkP5oK/nSTwatty7h0PPgX+w76NbUgqwQwsyq4isnwhCpNykoZ4QkA/469meqShyeUivWagd+kv4JhPsR8Mu3DGbuQCzLYVRvaExT7Qw2wrvLUedi3t2GOWpBL/sXqeyM9SYeKfzaSYqvs3UIFK2gEDXHw7xjO8eaEvtIiMzLqtJ4f0w3/cKPVRdd4+gkVAfgEwG7SyMe7/LwJdfk6wTzDs=");
  }
  else
  {
    return CFSTR("MIIEWjCCA0KgAwIBAgIJAPgWFS3crKvxMA0GCSqGSIb3DQEBBAUAMHsxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTELMAkGA1UEBxMCU0MxDjAMBgNVBAoTBUFwcGxlMQwwCgYDVQQLEwNFVFMxEzARBgNVBAMTCmdlc3R1cmUgRFMxHzAdBgkqhkiG9w0BCQEWEHNlbHZhc0BhcHBsZS5jb20wHhcNMTAwMzAyMjIzNjI5WhcNMTMwMzAxMjIzNjI5WjB7MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExCzAJBgNVBAcTAlNDMQ4wDAYDVQQKEwVBcHBsZTEMMAoGA1UECxMDRVRTMRMwEQYDVQQDEwpnZXN0dXJlIERTMR8wHQYJKoZIhvcNAQkBFhBzZWx2YXNAYXBwbGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsmUJxig6EIL9ZxY9hcgV5DnPkAdbC+/1XNtxBUTf5z8BmlJLDpaGXNEh5JfA2zeIhv0oRwUKADyewn8+1J99jyNYNHouwfS8bRKHPmvHmCvMMhkvo+F4STcR7/H+IueXToSQM/nCdhr2jv0Yfgkzdkz6C9nMtSQ3Yscxhwb9PQgOd4Fo3vXO7dHpsB0BP7IhFINaSHRqUpwpjaCRviuHw+v5FkacZ0hq0GffLb9NVCtSSeCgdOV/Gy6LNww9V0Z9KGlvK7anl9mq5sLtae9wr/X2q9m2EDpheDwqvLrbitHzO0LUdq/V6zVbLEguolN+TSxs/Xal0J/lJHtkuPQ9yQIDAQABo4HgMIHdMB0GA1UdDgQWBBRuNV6LVs61/zmSf+vXc4gIfogZqTCBrQYDVR0jBIGlMIGigBRuNV6LVs61/zmSf+vXc4gIfogZqaF/pH0wezELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMQswCQYDVQQHEwJTQzEOMAwGA1UEChMFQXBwbGUxDDAKBgNVBAsTA0VUUzETMBEGA1UEAxMKZ2VzdHVyZSBEUzEfMB0GCSqGSIb3DQEJARYQc2VsdmFzQGFwcGxlLmNvbYIJAPgWFS3crKvxMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEEBQADggEBACS2isjE1UpzjbW2b3DuMU5bHpIPe6gceKiPRZnyBpRtAhvahwzZ2t56cKpi3i6yISoZRIzG6Zg+v6YDyHbJH3xpkVw4Rcpfx2yUX4UAmoS+CSQxT/Czlm+Gcaf+7NZKQDaFCScQkIQxi3Ie/9AgVOQzD/esuGTEwbVO5n6USuSna08ANbwk4YYjAMHFyilEDBjtrGKB9spS8jKCug75C0DSWLD3IO59jDXnkDlglfG+p+LUVC9yRqIYCI662hsdvhITAGZWWFYrevOWXue0gjt6hIe4m63cBEgXgf9g66ePB6ZkRWf4dCSQKXP7XidMRsh2oM/c67PYZ4rebRlhTb0=");
  }
}

- (id)authenticateURLString
{
  return CFSTR("https://%@/profileservice/authenticate");
}

- (id)verifyTicketURLString
{
  return CFSTR("https://%@/profileservice/validateserviceticket");
}

- (id)getTrustedDevicesURLString
{
  return CFSTR("https://%@/profileservice/getSAOptions");
}

- (id)generateAndSendSecCodeURLString
{
  return CFSTR("https://%@/profileservice/generateAndSendSecCode");
}

- (id)verifySecurityCodeURLString
{
  return CFSTR("https://%@/profileservice/validateSecCode");
}

- (id)serverHosts
{
  return (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[ACMEnvironmentPreferences environmentSpecification](self, "environmentSpecification"), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentServerConfigKey")), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentHostsKey"));
}

- (id)serverAttemptsDelays
{
  return (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[ACMEnvironmentPreferences environmentSpecification](self, "environmentSpecification"), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentServerConfigKey")), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentServerAttemptsDelayKey"));
}

- (id)myAppleIDURL
{
  return (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[ACMEnvironmentPreferences environmentSpecification](self, "environmentSpecification"), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentServerConfigKey")), "objectForKeyedSubscript:", CFSTR("ACMEnvironmentMyAppleIDURLKey"));
}

@end
