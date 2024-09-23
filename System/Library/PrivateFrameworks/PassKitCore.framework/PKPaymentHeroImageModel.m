@implementation PKPaymentHeroImageModel

- (PKPaymentHeroImageModel)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentHeroImageModel *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *imageSha;
  PKPaymentHeroImageModel *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  v5 = -[PKPaymentHeroImageModel init](self, "init");
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "PKURLForKey:", CFSTR("url"));
  v6 = objc_claimAutoreleasedReturnValue();
  url = v5->_url;
  v5->_url = (NSURL *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("sha1"));
  v8 = objc_claimAutoreleasedReturnValue();
  imageSha = v5->_imageSha;
  v5->_imageSha = (NSString *)v8;

  if (!v5->_url)
    goto LABEL_5;
  if (v5->_imageSha)
  {
LABEL_4:
    v10 = v5;
  }
  else
  {
LABEL_5:
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Invalid hero image model", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)imageSha
{
  return self->_imageSha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSha, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
