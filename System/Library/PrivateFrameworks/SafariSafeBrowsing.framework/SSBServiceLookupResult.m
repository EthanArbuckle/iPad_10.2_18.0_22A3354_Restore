@implementation SSBServiceLookupResult

- (id)_initWithLookupResult:(LookupResult)a3
{
  SSBServiceLookupResult *v4;
  SSBServiceLookupResult *v5;
  SSBServiceLookupResult *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSBServiceLookupResult;
  v4 = -[SSBServiceLookupResult init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lookupResult = a3;
    v6 = v4;
  }

  return v5;
}

- (SSBServiceLookupResult)initWithCoder:(id)a3
{
  id v4;
  SSBServiceLookupResult *v5;
  unsigned int v6;
  SSBServiceLookupResult *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSBServiceLookupResult;
  v5 = -[SSBServiceLookupResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    v5->_lookupResult = (LookupResult)(v6 | ((unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("provider")) << 32));
    v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_lookupResult.type.m_storage, CFSTR("type"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_lookupResult.provider, CFSTR("provider"));

}

- (BOOL)isMalware
{
  return self->_lookupResult.type.m_storage & 1;
}

- (BOOL)isPhishing
{
  return (LOBYTE(self->_lookupResult.type.m_storage) >> 1) & 1;
}

- (BOOL)isUnwantedSoftware
{
  return (LOBYTE(self->_lookupResult.type.m_storage) >> 3) & 1;
}

- (BOOL)isKnownToBeUnsafe
{
  return -[SSBServiceLookupResult isMalware](self, "isMalware")
      || -[SSBServiceLookupResult isPhishing](self, "isPhishing")
      || -[SSBServiceLookupResult isUnwantedSoftware](self, "isUnwantedSoftware");
}

- (NSString)provider
{
  int provider;
  const __CFString *v3;

  provider = self->_lookupResult.provider;
  v3 = CFSTR("SSBProviderGoogle");
  if (provider == 2)
    v3 = CFSTR("SSBProviderTencent");
  if (provider == 4)
    return (NSString *)CFSTR("SSBProviderApple");
  else
    return &v3->isa;
}

- (NSString)malwareDetailsBaseURLString
{
  int provider;
  const __CFString *v3;

  provider = self->_lookupResult.provider;
  v3 = CFSTR("https://google.com/safebrowsing/diagnostic?tpl=safari");
  if (provider == 2)
    v3 = CFSTR("https://www.urlsec.qq.com/check.html?tpl=safari");
  if (provider == 4)
    return (NSString *)CFSTR("https://support.apple.com/kb/HT211650");
  else
    return &v3->isa;
}

- (NSURL)learnMoreURL
{
  int provider;
  const __CFString *v3;

  provider = self->_lookupResult.provider;
  switch(provider)
  {
    case 1:
      v3 = CFSTR("https://www.google.com/support/bin/answer.py?answer=106318");
      goto LABEL_7;
    case 4:
      v3 = CFSTR("https://support.apple.com/kb/HT211650");
      goto LABEL_7;
    case 2:
      v3 = CFSTR("https://www.urlsec.qq.com/standard/s1.html?tpl=safari");
LABEL_7:
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      self = (SSBServiceLookupResult *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return (NSURL *)self;
}

- (NSString)reportAnErrorBaseURLString
{
  int provider;
  const __CFString *v3;

  provider = self->_lookupResult.provider;
  v3 = CFSTR("https://www.google.com/safebrowsing/report_error/?tpl=safari");
  if (provider == 2)
    v3 = CFSTR("https://www.urlsec.qq.com/complain.html?tpl=safari");
  if (provider == 4)
    return (NSString *)CFSTR("https://websitereview.apple.com/?tpl=safari");
  else
    return &v3->isa;
}

- (NSString)localizedProviderDisplayName
{
  SSBServiceLookupResult *v2;
  uint64_t v3;
  void *v4;
  int provider;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v9[5];

  v2 = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SSBServiceLookupResult_localizedProviderDisplayName__block_invoke;
  v9[3] = &unk_1EA3EC4E8;
  v9[4] = self;
  v3 = MEMORY[0x1DF0B8E90](v9, a2);
  v4 = (void *)v3;
  provider = v2->_lookupResult.provider;
  switch(provider)
  {
    case 1:
      v7 = CFSTR("Google Safe Browsing");
LABEL_7:
      (*(void (**)(uint64_t, const __CFString *, _QWORD))(v3 + 16))(v3, v7, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      v7 = CFSTR("Tencent Safe Browsing");
      goto LABEL_7;
    case 4:
      (*(void (**)(uint64_t, const __CFString *, const __CFString *))(v3 + 16))(v3, CFSTR("Apple"), CFSTR("LocalizableExtras"));
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v2 = (SSBServiceLookupResult *)v6;
      break;
  }

  return (NSString *)v2;
}

id __54__SSBServiceLookupResult_localizedProviderDisplayName__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v4, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
